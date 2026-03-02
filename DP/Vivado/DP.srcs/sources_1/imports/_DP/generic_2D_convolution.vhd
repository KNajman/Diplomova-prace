library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all; -- Knihovna není syntetizovatelná, v návrhu pouze pro výpočet konstant pro log2 a ceil

entity generic_2D_convolution is
    generic(
        IMAGE_WIDTH   : natural := 10; -- Počet sloupců (cols) - délka řádku
        IMAGE_HEIGHT  : natural := 10; -- Počet řádků (rows) - nutné pro počítání konce snímku
        PIXEL_WIDTH   : natural := 8;   -- Bitová šířka jednoho pixelu (např. 8 pro 0-255)

        KERNEL_SIZE   : natural := 3;   -- Rozměr K x K konvolučního jádra (např. 3 pro 3x3)
        KERNEL_WIDTH  : natural := 8;   -- Bitová šířka jednoho koeficientu jádra, TODO: SJEDNO S PIXEL_WIDTH?

        MODE          : string  := "VALID"; --  "VALID" - pouze reálné pixely (bez paddingu), "SAME" - výstup stejné velikosti jako vstup (s paddingem)
        PADDING_VALUE : integer := 0    -- Hodnota pro zero-padding (např. 0, 127, 255)
    );
    port(
        aclk             : in  std_logic; 
        rst             : in  std_logic; -- Asynchronní reset (AXI4)
        -- AXI-Stream Input
        pixel_in        : in  std_logic_vector(PIXEL_WIDTH - 1 downto 0);
        pixel_in_valid  : in  std_logic; -- Signál pro validitu vstupního pixelu
        pixel_in_ready  : out std_logic; -- Signál pro zpětnou vazbu, že jsme připraveni přijmout další pixel
        -- TODO: Vertikální a horizontální synchronizační signály pro detekci konce řádku a snímku, pokud se bude zpracovávat více snímků za sebou

        -- Vstup pro konvoluční jádro (zploštělé 1D pole) (3x3 jádro s 8-bitovými koeficienty = 72 bity)
        kernel_in       : in  std_logic_vector((KERNEL_SIZE * KERNEL_SIZE * KERNEL_WIDTH) - 1 downto 0); -- 3x3*8 -> 72 bitů

        -- AXI-Stream Output
        pixel_out       : out std_logic_vector(PIXEL_WIDTH - 1 downto 0);
        pixel_out_valid : out std_logic; -- Signál pro validitu výstupního pixelu
        pixel_out_ready : in  std_logic -- Signál od master zařízení, že je připraveno přijmout další pixel
    );
end entity generic_2D_convolution;

architecture Behavioral of generic_2D_convolution is

    -- KONSTANTY PRO DYNAMICKÝ VÝPOČET ROZMĚRŮ A ŠÍŘEK

    -- Pro posun jádra
    constant SHIFT : natural := KERNEL_SIZE / 2;

     -- Šířka součinu (násobení)
    constant MULT_WIDTH : natural := PIXEL_WIDTH + KERNEL_WIDTH + 1; -- +1 pro znaménkový bit, protože pracujeme se signed hodnotami
    
    -- Počet prvků ke sčítání pro výpočet extra bitů
    constant NUM_ELEMENTS : real := real(KERNEL_SIZE * KERNEL_SIZE);
    
    -- Extra bity pro akumulaci (log2 zaokrouhleno nahoru)
    constant EXTRA_BITS : natural := natural(ceil(log2(NUM_ELEMENTS)));
    
    -- Celková šířka akumulátoru
    constant ACC_WIDTH : natural := MULT_WIDTH + EXTRA_BITS;

    -- VLASTNÍ DATOVÉ STRUKTURY A SIGNÁLY

    -- Funkce pro výpočet MAX_C a MAX_R na základě módu
    function get_max_dim(dim : natural; m : string) return natural is
    begin
        if m = "SAME" then
            return dim + 2 * SHIFT;
        else
            return dim;
        end if;
    end function;

    constant MAX_C : natural := get_max_dim(IMAGE_WIDTH, MODE);
    constant MAX_R : natural := get_max_dim(IMAGE_HEIGHT, MODE);

    -- Typy pro dynamické konvoluční jádro
    type   kernel_type is array (0 to KERNEL_SIZE - 1, 0 to KERNEL_SIZE - 1) of signed(KERNEL_WIDTH - 1 downto 0);
    signal kernel_2d   : kernel_type;

    -- Datové typy (o bit širší pro signed operace)
    subtype signed_pixel_t is signed(PIXEL_WIDTH downto 0); -- O 1 bit širší pro bezpečné násobení a akumulaci (znaménkový bit)

    -- 1. LineBuffer (K-1 řádků o délce MAX_C)
    type   line_row_t          is array (0 to MAX_C - 1) of signed_pixel_t;
    type   line_buffer_array_t is array (0 to KERNEL_SIZE - 2) of line_row_t;
    signal line_buffers        : line_buffer_array_t := (others => (others => (others => '0')));

    -- 2. WindowBuffer (Sliding Window KxK)
    type   window_array_t is array (0 to KERNEL_SIZE - 1, 0 to KERNEL_SIZE - 1) of signed_pixel_t;
    signal window         : window_array_t := (others => (others => (others => '0')));

    -- Čítače simulující MATLABovské `for r=1:max_r` a `for c=1:max_c`
    signal r_cnt : natural range 0 to MAX_R - 1 := 0;
    signal c_cnt : natural range 0 to MAX_C - 1 := 0;

    -- Řídící signály
    signal is_real_pixel     : std_logic;
    signal process_cycle     : std_logic;
    signal current_pixel_val : signed_pixel_t;

    -- Kombinační MAC výsledek (Multiply-Accumulate) - šiřka pro bezpečné 
    signal mac_sum : signed(ACC_WIDTH - 1 downto 0);
    signal valid_pipeline : std_logic_vector(KERNEL_SIZE downto 0) := (others => '0');

    -- Výstupní registry
    signal out_pixel_reg : std_logic_vector(PIXEL_WIDTH - 1 downto 0) := (others => '0');
    signal out_valid_reg : std_logic                                  := '0';

begin

    ----------------------------------------------------------------------------
    -- PŘEVOD 1D KERNELU NA 2D POLE
    ----------------------------------------------------------------------------
    process(kernel_in)
        variable idx : natural range 0 to KERNEL_SIZE * KERNEL_SIZE - 1; -- 3x3 kernel má 9 prvků, index od 0 do 8
    begin
        for r in 0 to KERNEL_SIZE - 1 loop
            for c in 0 to KERNEL_SIZE - 1 loop
                idx             := r * KERNEL_SIZE + c;  -- 
                kernel_2d(r, c) <= signed(kernel_in((idx + 1) * KERNEL_WIDTH - 1 downto idx * KERNEL_WIDTH));
            end loop;
        end loop;
    end process;

    ----------------------------------------------------------------------------
    -- PADDING LOGIKA (MATLAB: if r <= shift || c <= shift ... )
    ----------------------------------------------------------------------------
    process(r_cnt, c_cnt)
    begin
        if MODE = "SAME" then
            if (r_cnt >= SHIFT) and (r_cnt < IMAGE_HEIGHT + SHIFT) and (c_cnt >= SHIFT) and (c_cnt < IMAGE_WIDTH + SHIFT) then
                is_real_pixel <= '1';
            else
                is_real_pixel <= '0';
            end if;
        else
            -- Ve "VALID" módu jsou všechny zpracovávané pixely reálné (žádný padding)
            is_real_pixel <= '1';
        end if;
    end process;

    -- Multiplexor: Čteme vstupní pixel, nebo vkládáme BORDER_VALUE?
    current_pixel_val <= signed('0' & pixel_in) when is_real_pixel = '1' else
                         to_signed(PADDING_VALUE, PIXEL_WIDTH + 1);

    ----------------------------------------------------------------------------
    -- AXI-STREAM HANDSHAKE & PIPELINE ENABLE
    ----------------------------------------------------------------------------
    -- Můžeme provést cyklus (process_cycle) pokud:
    -- 1. Výstupní část je připravena přijmout data (nebo ještě není validní)
    -- 2. A ZÁROVEŇ: Pokud jsme v oblasti reálného obrazu, čekáme na pixel_in_valid. 
    --    Pokud jsme v oblasti paddingu, nepotřebujeme data zvenku a jedeme automaticky.
    process_cycle <= '1' when (pixel_out_ready = '1' or out_valid_reg = '0') and (is_real_pixel = '0' or pixel_in_valid = '1') else
                     '0';

    -- Ready signál odesíláme zpět jen v momentech, kdy opravdu fyzicky konzumujeme reálný pixel
    pixel_in_ready <= '1' when process_cycle = '1' and is_real_pixel = '1' else '0';

    -- Propojení výstupů
    pixel_out       <= out_pixel_reg;
    pixel_out_valid <= out_valid_reg;

    ----------------------------------------------------------------------------
    -- HLAVNÍ PROCES: Shift Registry a Čítače
    ----------------------------------------------------------------------------
    process(aclk)
    begin
        if rising_edge(aclk) then
            if rst = '1' then
                r_cnt         <= 0;
                c_cnt         <= 0;
                out_valid_reg <= '0';
                out_pixel_reg <= (others => '0');
                window        <= (others => (others => (others => '0')));
                line_buffers   <= (others => (others => (others => '0')));
                valid_pipeline <= (others => '0');

            elsif process_cycle = '1' then

                -- 1. Aktualizace čítačů (jako MATLAB for loop)
                if c_cnt = MAX_C - 1 then -- Konec řádku
                    c_cnt <= 0;         -- Reset sloupcového čítače
                    if r_cnt = MAX_R - 1 then -- Konec snímku
                        r_cnt <= 0;     -- Reset řádkového čítače
                    else
                        r_cnt <= r_cnt + 1; -- Posun na další řádek
                    end if;
                else
                    c_cnt <= c_cnt + 1; -- Posun na další sloupec
                end if;

                -- 2. Aktualizace WindowBufferu (posun doprava)
                for r in 0 to KERNEL_SIZE - 1 loop
                    for c in 0 to KERNEL_SIZE - 2 loop
                        window(r, c) <= window(r, c + 1);
                    end loop;
                end loop;

                -- 3. Vložení nových hodnot do sloupce WindowBufferu
                window(0, KERNEL_SIZE - 1) <= current_pixel_val;
                for r in 1 to KERNEL_SIZE - 1 loop
                    window(r, KERNEL_SIZE - 1) <= line_buffers(r - 1)(c_cnt);
                end loop;

                -- 4. Aktualizace LineBufferu (zpoždění o jeden celý řádek)
                line_buffers(0)(c_cnt) <= current_pixel_val;
                for r in 1 to KERNEL_SIZE - 2 loop
                    line_buffers(r)(c_cnt) <= line_buffers(r - 1)(c_cnt);
                end loop;

                -- 5. Generování platnosti výstupu (MATLAB: if c >= K && r >= K)
                -- Používáme KERNEL_SIZE - 1, protože VHDL pole jsou od 0.
                if (r_cnt >= KERNEL_SIZE - 1) and (c_cnt >= KERNEL_SIZE - 1) then
                    valid_pipeline(0) <= '1';
                else
                    valid_pipeline(0) <= '0';
                end if;

                -- 2. Posun v pipeline o přesně "SHIFT" taktů (čekáme, až pixel dorazí do středu)
                for i in 0 to SHIFT - 1 loop
                    valid_pipeline(i+1) <= valid_pipeline(i);
                end loop;

                -- 3. Vyvedení správného stupně pipeline do výstupu
                if SHIFT = 0 then
                    if (r_cnt >= KERNEL_SIZE - 1) and (c_cnt >= KERNEL_SIZE - 1) then
                        out_valid_reg <= '1';
                    else
                        out_valid_reg <= '0';
                    end if;
                else
                    out_valid_reg <= valid_pipeline(SHIFT - 1);
                end if;

                -- 6. Zapsání výsledku z MAC (Kombinační logika) do výstupu
                -- Saturation Arithmetic (zabránění přetečení / podtečení)
                if mac_sum < 0 then
                    out_pixel_reg <= (others => '0');
                elsif mac_sum > (2 ** PIXEL_WIDTH - 1) then
                    out_pixel_reg <= (others => '1');
                else
                    out_pixel_reg <= std_logic_vector(mac_sum(PIXEL_WIDTH - 1 downto 0));
                end if;

            elsif pixel_out_ready = '1' and out_valid_reg = '1' then
                -- Ošetření AXI-Stream: Pokud potrubí stojí, ale master data přečetl, shodíme valid
                out_valid_reg <= '0';
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- KOMBINAČNÍ PROCES: Multiply-Accumulate (MAC)
    ----------------------------------------------------------------------------
    process(window, kernel_2d)
        variable temp_sum : signed(ACC_WIDTH - 1 downto 0);
        variable mult_res : signed(MULT_WIDTH - 1 downto 0);
    begin
        temp_sum := (others => '0');

        for r in 0 to KERNEL_SIZE - 1 loop
            for c in 0 to KERNEL_SIZE - 1 loop
                -- window(0) obsahuje nejnovější řádek z obrazu (tedy spodek posuvného okna).
                -- window(2) obsahuje nejstarší řádek z obrazu (tedy vršek posuvného okna).
                -- Aby nedošlo k vertikálnímu převrácení filtru, musíme jádro mapovat "vzhůru nohama"
                -- vůči indexu 'r', tedy KERNEL_SIZE - 1 - r.
                mult_res := resize(window(r, c) * kernel_2d(KERNEL_SIZE - 1 - r, c), MULT_WIDTH);  -- Výsledek násobení může být širší než původní pixel nebo koeficient, proto resize
                temp_sum := temp_sum + resize(mult_res, ACC_WIDTH); -- Akumulace s rozšířením pro bezpečné sčítání
            end loop;
        end loop;

        mac_sum <= temp_sum;
    end process;
end Behavioral;
