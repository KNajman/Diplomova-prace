----------------------------------------------------------------------------------
-- Company: Technical University of Liberec
-- Engineer: Bc. Karel Najman
-- 
-- Create Year: 2026
-- Design Name: Pipelined Adder Tree
-- Module Name: 
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description:
-- Architecture: RTL
-- Math: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 

----------------------------------------------------------------------------------
-- Modul: MAC Pipeline (Multiply-Accumulate) pro 2D Konvoluci
-- Architektura: Plně pipelinovaný strom optimalizovaný pro DSP48 řezy
-- Využívá zřetězený HW sčítací strom k dosažení maximální Fmax pro velká jádra.
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Zapnutí VHDL-2008 fixed-point magie
use ieee.fixed_float_types.all;
use ieee.fixed_pkg.all;

use work.video_processing_pkg.all;

entity mac_pipeline is
    generic(
        G_PIXEL_HIGH  : integer;
        G_PIXEL_LOW   : integer;
        -- KERNEL
        G_KERNEL_SIZE : positive;
        G_KERNEL_HIGH : integer;
        G_KERNEL_LOW  : integer
    );
    port(
        aclk             : in  std_logic;
        aresetn          : in  std_logic;
        pipeline_en     : in  std_logic;
        -- window_in       : in  t_ufixed_array(0 to (G_KERNEL_SIZE * G_KERNEL_SIZE) - 1)(G_PIXEL_HIGH downto G_PIXEL_LOW);
        -- kernel_in       : in  t_sfixed_array(0 to (G_KERNEL_SIZE * G_KERNEL_SIZE) - 1)(G_KERNEL_HIGH downto G_KERNEL_LOW);
     
        kernel_in       : in  std_logic_vector((G_KERNEL_SIZE * G_KERNEL_SIZE * (G_KERNEL_HIGH - G_KERNEL_LOW + 1)) - 1 downto 0);
        window_in       : in  std_logic_vector((G_KERNEL_SIZE * G_KERNEL_SIZE * (G_PIXEL_HIGH - G_PIXEL_LOW + 1)) - 1 downto 0);
        window_valid_in : in  std_logic;
        data_out       : out std_logic_vector(G_PIXEL_HIGH - G_PIXEL_LOW downto 0);
        data_out_valid   : out std_logic
    );
end entity mac_pipeline;

architecture RTL of mac_pipeline is
    -- Počet prvků v konvolučním okně (např. 9 pro 3x3)
    constant NUM_ELEMENTS : positive := G_KERNEL_SIZE * G_KERNEL_SIZE;

    -- Výpočet latence sčítacího stromu
    constant TREE_LATENCY  : natural := log2_ceil(NUM_ELEMENTS);
    -- Celková latence: 1 (násobení) + TREE_LATENCY + 1 (finální ořez/zaokrouhlení)
    constant TOTAL_LATENCY : natural := 1 + TREE_LATENCY + 1;

    -- Definice vnitřních mezisoučtů
    -- Výsledek násobení ufixed * sfixed = sfixed
    -- Rozsah výsledku násobení je automaticky dán součtem rozsahů
    signal mult_results : t_sfixed_array(0 to NUM_ELEMENTS - 1)((G_PIXEL_HIGH + 1) + G_KERNEL_HIGH + 1 downto G_PIXEL_LOW + G_KERNEL_LOW);

    -- Výstup ze sčítacího stromu (akumulátor)
    -- Přidáme pár bitů pro ochranu proti přetečení při sčítání
    constant ACC_HIGH : integer := G_PIXEL_HIGH + G_KERNEL_HIGH + TREE_LATENCY;
    signal   tree_sum : sfixed(ACC_HIGH downto G_KERNEL_LOW);

    -- Posuvný registr pro valid signál
    signal valid_sr : std_logic_vector(TOTAL_LATENCY - 1 downto 0);

    signal window_fixed : t_ufixed_array(0 to NUM_ELEMENTS - 1)(G_PIXEL_HIGH downto G_PIXEL_LOW);
    signal kernel_fixed : t_sfixed_array(0 to NUM_ELEMENTS - 1)(G_KERNEL_HIGH downto G_KERNEL_LOW);

begin

    window_fixed <= unpack_ufixed_array(window_in, NUM_ELEMENTS, G_PIXEL_HIGH, G_PIXEL_LOW);
    kernel_fixed <= unpack_sfixed_array(kernel_in, NUM_ELEMENTS, G_KERNEL_HIGH, G_KERNEL_LOW);

    -- =========================================================================
    -- FÁZE 1: Paralelní násobení (DSP48 bloky)
    -- =========================================================================
    process(aclk)
            variable v_pixel_signed : sfixed(G_PIXEL_HIGH + 1 downto G_PIXEL_LOW) := (others => '0');
        begin
            if rising_edge(aclk) then
                if aresetn = '0' then
                    mult_results <= (others => (others => '0'));
                elsif pipeline_en = '1' then
                    
                    -- Nyní nepotřebujeme počítat souřadnice, stačí jeden index přes celé pole
                    for i in 0 to NUM_ELEMENTS - 1 loop
                        v_pixel_signed := sfixed(resize(window_fixed(i), G_PIXEL_HIGH + 1, G_PIXEL_LOW));
                        mult_results(i) <= v_pixel_signed * kernel_fixed(i);
                    end loop;
                    
                end if;
            end if;
        end process;

    -- =========================================================================
    -- FÁZE 2: Sčítací strom (Pipelined Adder Tree)
    -- =========================================================================
    Inst_Adder_Tree : entity work.pipelined_adder_tree
        generic map(
            NUM_INPUTS => NUM_ELEMENTS,
            IN_HIGH    => mult_results(0)'high,
            IN_LOW     => mult_results(0)'low,
            OUT_HIGH   => ACC_HIGH,
            OUT_LOW    => G_KERNEL_LOW
        )
        port map(
            aclk     => aclk,
            aresetn     => aresetn,
            en      => pipeline_en,
            data_in => mult_results,
            sum_out => tree_sum
        );

    -- =========================================================================
    -- FÁZE 3: Finální ořez (Saturation) a Zaokrouhlení (Rounding)
    -- =========================================================================
    process(aclk)
        variable rounded_pixel : ufixed(G_PIXEL_HIGH downto G_PIXEL_LOW);
    begin
        if rising_edge(aclk) then
            if aresetn = '1' then
                data_out <= (others => '0');
            elsif pipeline_en = '1' then
                -- resize s parametry fixed_saturate a fixed_round udělá veškerou těžkou práci:
                -- 1. Přičte 0.5 (LSB zlomku) pro korektní zaokrouhlení
                -- 2. Pokud je výsledek < 0, dá 0
                -- 3. Pokud je výsledek > 255, dá 255
                rounded_pixel := resize(
                    ufixed(tree_sum),
                    G_PIXEL_HIGH,
                    G_PIXEL_LOW,
                    fixed_saturate,
                    fixed_round
                );
                data_out     <= to_slv(rounded_pixel);
            end if;
        end if;
    end process;

    -- =========================================================================
    -- ŘÍDICÍ CESTA: Posuvný registr pro VALID
    -- =========================================================================
    process(aclk)
    begin
        if rising_edge(aclk) then
            if aresetn = '1' then
                valid_sr <= (others => '0');
            elsif pipeline_en = '1' then
                valid_sr <= valid_sr(valid_sr'high - 1 downto 0) & window_valid_in;
            end if;
        end if;
    end process;

    data_out_valid <= valid_sr(valid_sr'high);

end architecture RTL;
