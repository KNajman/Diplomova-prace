library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.vid_processing_pkg.all;

entity mac_pipeline is
    generic(
        KERNEL_SIZE  : natural;
        PIXEL_WIDTH  : natural;
        KERNEL_PIXEL_WIDTH : natural
    );
    port(
        clk             : in  std_logic;
        rst             : in  std_logic;
        pipeline_en     : in  std_logic;
        -- VHDL-2008: Čisté 2D matice na vstupech
        window_in       : in  signed_matrix_t(0 to KERNEL_SIZE - 1, 0 to KERNEL_SIZE - 1)(PIXEL_WIDTH downto 0);
        kernel_in       : in  signed_matrix_t(0 to KERNEL_SIZE - 1, 0 to KERNEL_SIZE - 1)(KERNEL_PIXEL_WIDTH - 1 downto 0);
        window_valid_in : in  std_logic;
        pixel_out       : out std_logic_vector(PIXEL_WIDTH - 1 downto 0);
        mac_valid_out   : out std_logic
    );
end entity mac_pipeline;

architecture RTL of mac_pipeline is
    attribute use_dsp : string;

    constant NUM_ELEMENTS  : natural  := KERNEL_SIZE * KERNEL_SIZE;
    constant ADDER_ELEMENTS : positive := next_power_of_2(NUM_ELEMENTS); -- počet prvků pro vyvážený strom (nejbližší vyšší mocnina 2)
    constant ADDER_LATENCY : natural  := log2(ADDER_ELEMENTS);

    constant MULT_WIDTH : natural := KERNEL_PIXEL_WIDTH + (PIXEL_WIDTH + 1); -- +1 pro znaménko, protože pracujeme se signed typy
    constant ACC_WIDTH  : natural := get_acc_width(PIXEL_WIDTH, KERNEL_PIXEL_WIDTH, KERNEL_SIZE);

    -- VHDL-2008: Pipeline registry zapsané přes 1D pole signálů (typ definován v package)
    signal mult_regs : signed_vector_t(0 to ADDER_ELEMENTS - 1)(MULT_WIDTH - 1 downto 0) := (others => (others => '0'));
    attribute use_dsp of mult_regs : signal is "yes";
    signal sum_out   : signed(ACC_WIDTH - 1 downto 0)                                   := (others => '0');

    -- Posuvný registr (Shift register) pro předávání platnosti valid signálu napříč latencí
    -- Pozice 1 = za násobičkou, pozice 2 = po prvním patře stromu atd.
    signal valid_pipe : std_logic_vector(ADDER_LATENCY + 1 downto 1) := (others => '0');

    -- výstuponí registry
    signal out_pixel_reg : std_logic_vector(PIXEL_WIDTH - 1 downto 0) := (others => '0');
    signal out_valid_reg : std_logic                                  := '0';

begin

    -- Předání dat z registrů na porty modulu
    pixel_out     <= out_pixel_reg;
    mac_valid_out <= out_valid_reg;

    -- =============================================================
    -- Fáze 1: Násobení a vertikální flip jádra
    -- =============================================================
    process(clk)
        variable row : natural range 0 to KERNEL_SIZE - 1; -- řádek v jádru (a okně)
        variable col : natural range 0 to KERNEL_SIZE - 1; -- sloupec v jádru (a okně)

    begin
        if rising_edge(clk) then
            if rst = '1' then
                mult_regs     <= (others => (others => '0'));
                --valid_pipe(1) <= '0';
            elsif pipeline_en = '1' then

                for i in 0 to NUM_ELEMENTS - 1 loop -- od 0 do 8 pro 3x3(9 prvků)
                    -- Pozice v maticich, trik s modulem pro ušetření for cyklu a vertikální flip (pro správné zarovnání jádra s oknem)
                    -- row          := KERNEL_SIZE - 1 - (i / KERNEL_SIZE); -- vertikální flip
                    -- col          := i mod KERNEL_SIZE; -- horizontální pořadí zůstává stejn
                    row := i / KERNEL_SIZE; -- 0,0,0,1,1,1,2,2,2 pro 3x3
                    col := (i mod KERNEL_SIZE); -- 0,1,2,0,1,2,0,1,2 pro 3x3
                    mult_regs(i) <= window_in(row, col) * kernel_in(row, col); -- generické násobení odpovídajícího počtu prvků 
                end loop;
                -- idx := i;
                --     mult_regs(i) <= window_in(KERNEL_SIZE - 1 - (idx / KERNEL_SIZE), idx mod KERNEL_SIZE) 
                --                   * kernel_in(idx / KERNEL_SIZE, idx mod KERNEL_SIZE);
                -- end loop;

                -- Vložení nul pro zbytek do mocniny 2 (tzv. Padding pro správný strom)
                for i in NUM_ELEMENTS to ADDER_ELEMENTS - 1 loop
                    mult_regs(i) <= (others => '0');
                end loop;

                --valid_pipe(1) <= window_valid_in;
            end if;
        end if;
    end process;

    -- =========================================================================
    -- POSUVNÝ REGISTR PRO VALID_PIPE
    -- =========================================================================
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                valid_pipe <= (others => '0');
            elsif pipeline_en = '1' then
                -- 1. Posun o tolik taktů, kolik je vrstev stromu
                for i in ADDER_LATENCY downto 1 loop
                    valid_pipe(i + 1) <= valid_pipe(i);
                end loop;
                
                -- 2. Vložení nové platnosti z fáze násobení na začátek potrubí
                valid_pipe(1) <= window_valid_in;
            end if;
        end if;
    end process;

    -- =========================================================================
    -- FÁZE 2: Sčítací strom (Pipelined Adder Tree)
    -- =========================================================================
    inst_adder_tree : entity work.pipelined_adder_array
        generic map(
            NUM_INPUTS => ADDER_ELEMENTS,
            DATA_WIDTH => MULT_WIDTH,
            OUT_WIDTH  => ACC_WIDTH
        )
        port map(
            clk     => clk,
            rst     => rst,
            en      => pipeline_en,
            data_in => mult_regs,
            sum_out => sum_out
        );

    -- špatná neoptimalizovaná verze, nevhodná pro velká jádra
    -- sum_var := (others => '0');
    -- for i in 0 to KERNEL_SIZE * KERNEL_SIZE - 1 loop
    --     sum_var := sum_var + resize(mult_regs(i), ACC_WIDTH);
    -- end loop;

    -- RUČNĚ optimalizovaná verze pro 3x3 jádro (9 prvků, 4 úrovně stromu)
    -- variable sum_level_1 : signed_array_1d_t(0 to 3)(ACC_WIDTH - 1 downto 0);
    -- variable sum_level_2 : signed_array_1d_t(0 to 1)(ACC_WIDTH - 1 downto 0);
    -- variable sum_level_3 : signed(ACC_WIDTH - 1 downto 0);

    -- -- Úroveň 1: 4 součty po 2 prvcích + 1 zůstává
    -- sum_level_1(0) := resize(mult_regs(0), ACC_WIDTH) +
    --                     resize(mult_regs(1), ACC_WIDTH);
    -- sum_level_1(1) := resize(mult_regs(2), ACC_WIDTH) +
    --                     resize(mult_regs(3), ACC_WIDTH);
    -- sum_level_1(2) := resize(mult_regs(4), ACC_WIDTH) +
    --                     resize(mult_regs(5), ACC_WIDTH);
    -- sum_level_1(3) := resize(mult_regs(6), ACC_WIDTH) +
    --                     resize(mult_regs(7), ACC_WIDTH);
    -- -- mult_regs(8) je potřeba posunutou registrovou cestou, protože zůstává osamocený až do finálního součtu
    -- reg_level_1 : signed(MULT_WIDTH - 1 downto 0) := mult_regs(8);

    -- -- Úroveň 2: 2 součty po 2 prvcích + 1 zůstává
    -- sum_level_2(0) := sum_level_1
    --                     + sum_level_1(1);
    -- sum_level_2(1) := sum_level_1(2) +
    --                     sum_level_1(3);
    -- reg_level_2 : signed(MULT_WIDTH - 1 downto 0) := reg_level_1; -- posunutí registrovou cestou

    -- -- Úroveň 3: finální součet
    -- sum_level_3 := sum_level_2(0) + sum_level_2(1) + resize(reg_level_2, ACC_WIDTH); -- přidání osamoceného prvku z úrovně 1 registrovou cestou

    -- =========================================================================
    -- FÁZE 3: Saturace výsledků a výstup (Saturation)
    -- =========================================================================
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                out_pixel_reg <= (others => '0');
                out_valid_reg <= '0';
            elsif pipeline_en = '1' then

                if sum_out < 0 then
                    out_pixel_reg <= (others => '0');
                elsif sum_out > (2 ** PIXEL_WIDTH - 1) then
                    out_pixel_reg <= (others => '1');
                else
                    out_pixel_reg <= std_logic_vector(sum_out(PIXEL_WIDTH - 1 downto 0));
                end if;

                out_valid_reg <= valid_pipe(ADDER_LATENCY + 1);
            end if;
        end if;
    end process;
end RTL;
