library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity tb_generic_2D_convolution is
    -- Testbench nemá porty
end entity tb_generic_2D_convolution;

architecture Behavioral of tb_generic_2D_convolution is

    -- --- DATOVÉ TYPY PRO TESTBENCH ---
    type int_array is array (natural range <>) of integer;

    -- --- FUNKCE PRO ZPLOŠTĚNÍ JÁDRA PRO AXI ---
    function flatten_kernel(k : int_array; k_width : natural) return std_logic_vector is
        variable res : std_logic_vector(k'length * k_width - 1 downto 0);
        variable idx : natural := 0;
    begin
        for i in k'range loop
            res((idx + 1) * k_width - 1 downto idx * k_width) := std_logic_vector(to_signed(k(i), k_width));
            idx                                               := idx + 1;
        end loop;
        return res;
    end function;

    -- --- "GOLDEN MODEL" - REFERENČNÍ SOFTWAROVÁ KONVOLUCE ---
    function sw_convolution_3x3(img : int_array; w : natural; h : natural; kernel : int_array) return int_array is
        variable res                  : int_array(0 to w * h - 1) := (others => 0);
        variable acc, r_in, c_in, pix : integer;
    begin
        for r in 0 to h - 1 loop
            for c in 0 to w - 1 loop
                acc := 0;
                -- 3x3 posuvné okno
                for kr in 0 to 2 loop
                    for kc in 0 to 2 loop
                        r_in := r + kr - 1;
                        c_in := c + kc - 1;

                        -- Padding logika (SAME mode s BORDER_VALUE = 0)
                        if r_in < 0 or r_in >= h or c_in < 0 or c_in >= w then
                            pix := 0;
                        else
                            pix := img(r_in * w + c_in);
                        end if;

                        acc := acc + pix * kernel(kr * 3 + kc);
                    end loop;
                end loop;

                -- Nasycení (Saturation) na 8 bitů (0-255)
                if acc < 0 then
                    acc := 0;
                elsif acc > 255 then
                    acc := 255;
                end if;

                res(r * w + c) := acc;
            end loop;
        end loop;
        return res;
    end function;

    -- --- DEFINICE KERNELŮ ---
    constant KERNEL_3x3_IDENTITY : int_array(0 to 8) := (
        0, 0, 0,
        0, 1, 0,
        0, 0, 0
    );
    constant KERNEL_3x3_SOBEL_X : int_array(0 to 8) := (
        -1, 0, 1,
        -2, 0, 2,
        -1, 0, 1
    );
    constant KERNEL_3x3_GAUSS : int_array(0 to 8) := (
        1, 2, 1,
        2, 4, 2,
        1, 2, 1
    );

    -- --- UŽIVATELSKÁ TESTOVACÍ MATICE (10x10) ---
    -- Levá polovina (5 sloupců) je 63, pravá polovina (5 sloupců) je 127
    constant MY_TEST_PATTERN : int_array(0 to 99) := (
        0, 0, 0, 0, 0,  127, 127, 127, 127, 127,
        0, 0, 0, 0, 0,  127, 127, 127, 127, 127,
        0, 0, 0, 0, 0,  127, 127, 127, 127, 127,
        0, 0, 0, 0, 0,  127, 127, 127, 127, 127,
        0, 0, 0, 0, 0,  127, 127, 127, 127, 127,
        63, 63, 63, 63, 63, 255, 255, 255, 255, 255,
        63, 63, 63, 63, 63, 255, 255, 255, 255, 255,
        63, 63, 63, 63, 63, 255, 255, 255, 255, 255,
        63, 63, 63, 63, 63, 255, 255, 255, 255, 255,
        63, 63, 63, 63, 63, 255, 255, 255, 255, 255
    );

    -- Globální signály
    signal clk          : std_logic := '0';
    signal rst          : std_logic := '1';
    signal sim_done_3x3 : boolean   := false;

    -- Signály pro instanci 1 (10x10, 3x3)
    signal in_valid_3x3, in_ready_3x3   : std_logic;
    signal out_valid_3x3, out_ready_3x3 : std_logic;
    signal in_pixel_3x3, out_pixel_3x3  : std_logic_vector(7 downto 0);
    signal kernel_in_3x3                : std_logic_vector(71 downto 0);

    -- SCOREBOARD a CHECKER signály
    signal input_image    : int_array(0 to 99);
    signal expected_image : int_array(0 to 99);
    signal check_idx_3x3      : natural         := 0;
    signal error_count_3x3    : natural         := 0;
    signal current_test_name  : string(1 to 20) := (others => ' ');
    signal reset_checker_3x3 : std_logic := '0';

begin

    -- Generování hodin (100 MHz)
    process
    begin
        while not sim_done_3x3 loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
        report "====== SIMULACE DOKONCENA S " & integer'image(error_count_3x3) & " CHYBAMI ======" severity note;
        if error_count_3x3 = 0 then
            report ">>> VSECHNY TESTY PROSLY USPESNE<<<" severity note;
        else
            report ">>> NALEZENY CHYBY V DESIGNU! <<<" severity error;
        end if;
        wait;
    end process;

    ----------------------------------------------------------------------------
    -- UUT (UNIT UNDER TEST): 10x10 Obraz, 3x3 Jádro
    ----------------------------------------------------------------------------
    UUT_3x3 : entity work.generic_2D_convolution
        generic map(
            IMAGE_WIDTH   => 10,
            IMAGE_HEIGHT  => 10,
            PIXEL_WIDTH   => 8,
            KERNEL_SIZE   => 3,
            KERNEL_WIDTH  => 8,
            MODE          => "SAME",
            PADDING_VALUE => 0
        )
        port map(
            aclk             => clk,
            rst             => rst,
            pixel_in        => in_pixel_3x3,
            pixel_in_valid  => in_valid_3x3,
            pixel_in_ready  => in_ready_3x3,
            kernel_in       => kernel_in_3x3,
            pixel_out       => out_pixel_3x3,
            pixel_out_valid => out_valid_3x3,
            pixel_out_ready => out_ready_3x3
        );

    -- Spotřebitel vždy připraven
    out_ready_3x3 <= '1';

    ----------------------------------------------------------------------------
    -- SCOREBOARD CHECKER PROCES (Automatická kontrola)
    ----------------------------------------------------------------------------
    process(clk)
        variable hw_val, exp_val : integer;
    begin
        if rising_edge(clk) then
            -- Správný reset řízený nezávislým signálem
            if rst = '1' or reset_checker_3x3 = '1' then
                check_idx_3x3 <= 0;
            else
                -- Pokud UUT vyhodí platný výsledek, zkontrolujeme ho
                if out_valid_3x3 = '1' and out_ready_3x3 = '1' then
                    hw_val  := to_integer(unsigned(out_pixel_3x3));
                    exp_val := expected_image(check_idx_3x3);

                    if hw_val /= exp_val then
                        report "CHYBA [" & current_test_name & "] na indexu " & integer'image(check_idx_3x3) & " | Ocekavano: " & integer'image(exp_val) & " | Z hardware: " & integer'image(hw_val) severity error;
                        error_count_3x3 <= error_count_3x3 + 1;
                    end if;

                    check_idx_3x3 <= check_idx_3x3 + 1;
                end if;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- HLAVNÍ STIMULUS PROCES: Obraz 10x10
    ----------------------------------------------------------------------------
    process
        variable seed1, seed2 : positive := 1;
        variable rand_real    : real;

        procedure push_image is
        -- Pomocná procedura, která přijme pole přes parametr a natlačí ho do HW
        begin
            for i in 0 to 99 loop
                in_pixel_3x3 <= std_logic_vector(to_unsigned(input_image(i), 8));
                in_valid_3x3 <= '1';
                loop
                    wait until rising_edge(clk);
                    if in_ready_3x3 = '1' then
                        exit;
                    end if;
                end loop;
            end loop;
            in_valid_3x3 <= '0';
        end procedure;

        procedure wait_for_check is
        begin
            -- Čekáme, dokud Checker nezkontroluje všech 100 pixelů
            wait until check_idx_3x3 = 100;
            wait for 20 ns;

            -- POŽADAVEK NA RESET CHECKERU (místo přímého zápisu)
            reset_checker_3x3 <= '1';
            wait until rising_edge(clk);
            reset_checker_3x3 <= '0';
            wait until rising_edge(clk);
        end procedure;

    begin
        -- 1. Fáze: Inicializace a Reset
        in_valid_3x3 <= '0';
        in_pixel_3x3 <= (others => '0');
        kernel_in_3x3 <= (others => '0');
        input_image <= (others => 0);
        rst          <= '1';
        wait for 20 ns;
        rst          <= '0';
        wait for 20 ns;

        -- =====================================================================
        -- TEST 1: Identita na náhodných datech
        -- =====================================================================
        current_test_name <= "TEST 1: IDENTITY    ";
        kernel_in_3x3     <= flatten_kernel(KERNEL_3x3_IDENTITY, 8);
        wait for 10 ns;

        -- A) Vygenerujeme náhodný obrázek a uložíme ho do 'input_image'
        for i in 0 to 99 loop
            uniform(seed1, seed2, rand_real);
            input_image(i) <= integer(round(rand_real * 255.0));
        end loop;

        wait for 1 ns;

        -- B) Není potřeba žádné speciální úpravy pro identitu, očekáváme stejný obrázek jako výstup
        expected_image <= sw_convolution_3x3(input_image, 10, 10, KERNEL_3x3_IDENTITY);
        --wait for 10 ns;
        

        -- C) Nasypeme data do RTL hardwaru
        push_image;
        wait_for_check;

        -- =====================================================================
        -- TEST 2: Sobelův filtr na vzoro MY_TEST_PATTERN
        -- =====================================================================
        current_test_name <= "TEST 2: SOBEL EDGES ";
        kernel_in_3x3     <= flatten_kernel(KERNEL_3x3_SOBEL_X, 8);
        wait for 10 ns;

        -- Načteme náš specifický testovací vzor do vstupního pole
        for i in 0 to 99 loop
            input_image(i) <= MY_TEST_PATTERN(i);
        end loop;

        wait for 1 ns;

        expected_image <= sw_convolution_3x3(input_image, 10, 10, KERNEL_3x3_SOBEL_X);
        push_image;
        wait_for_check;

        -- =====================================================================
        -- TEST 3: Gaussův rozmazávací filtr (Přetečení/Nasycení)
        -- =====================================================================
        current_test_name <= "TEST 3: GAUSS BLUR  ";
        kernel_in_3x3     <= flatten_kernel(KERNEL_3x3_GAUSS, 8);
        wait for 10 ns;

        -- Vysoce kontrastní data (snadno přetečou bez Saturation bloku)
        for i in 0 to 99 loop
            uniform(seed1, seed2, rand_real);
            if rand_real > 0.5 then
                input_image(i) <= 255;
            else
                input_image(i) <= 0;
            end if;
        end loop;

        wait for 1 ns;

        expected_image <= sw_convolution_3x3(input_image, 10, 10, KERNEL_3x3_GAUSS);
        push_image;
        wait_for_check;

        -- Konec simulace
        sim_done_3x3 <= true;
        wait;
    end process;

end Behavioral;
