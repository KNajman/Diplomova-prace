----------------------------------------------------------------------------------
-- Company: Technical University of Liberec
-- Engineer: Bc. Karel Najman
-- 
-- Create Date: 02.03.2026
-- Design Name: 
-- Module Name: RGB2HSV - Behavioral
-- Project Name: DP
-- Target Devices: KV260 (Zynq UltraScale+ MPSoC)
-- Tool Versions: Vivado 2025.2
-- Description: Plně generický převodník RGB -> HSV optimalizovaný pro DSP bloky.
--              Využívá moderní knihovnu VHDL-2008 IEEE.FIXED_PKG pro 
--              čistou a elegantní DSP aritmetiku s nativní saturací a zaokrouhlením.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.FIXED_FLOAT_TYPES.ALL;         -- pro konstanty fixed_round a fixed_saturate
use IEEE.FIXED_PKG.ALL;                 -- pro typy sfixed, ufixed a jejich matematiku

entity RGB2HSV is
    generic(
        G_DATA_WIDTH       : natural range 8 to 16 := 8; -- Bitová šířka jedné barvy
        G_COEFF_FRACT_BITS : natural range 8 to 20 := 8 -- Počet bitů pro zlomkovou část koeficientů (např. 8 pro Q8.8)
    );
    Port(
        clk           : in  STD_LOGIC;
        rst           : in  STD_LOGIC; -- active low reset
        -- Slave AXI-Stream Input
        rgb_in        : in  STD_LOGIC_VECTOR(G_DATA_WIDTH * 3 - 1 downto 0); -- RGB v jednom vektoru (R[23:16], G[15:8], B[7:0] pro 8-bit)
        rgb_in_valid  : in  STD_LOGIC;
        rgb_in_ready  : out STD_LOGIC;
        -- Master AXI-Stream Output
        hsv_out       : out STD_LOGIC_VECTOR(G_DATA_WIDTH * 3 - 1 downto 0); -- HSV v jednom vektoru (H[23:16], S[15:8], V[7:0] pro 8-bit)
        hsv_out_valid : out STD_LOGIC;
        hsv_out_ready : in  STD_LOGIC
    );
end RGB2HSV;

architecture RTL of RGB2HSV is
    -- Interní signály pro rozdělení vstupního vektoru na R, G, B
    signal r, g, b : unsigned(G_DATA_WIDTH - 1 downto 0);
    
    -- Signály pro výstupní H, S, V
    signal h, s, v : unsigned(G_DATA_WIDTH - 1 downto 0);
    
    -- Signály pro mezivýpočty
    signal max_rgb, min_rgb : unsigned(G_DATA_WIDTH - 1 downto 0);
    signal delta : unsigned(G_DATA_WIDTH - 1 downto 0);

begin
    -- Rozdělení vstupního vektoru na R, G, B
    r <= unsigned(rgb_in(G_DATA_WIDTH * 3 - 1 downto G_DATA_WIDTH * 2));
    g <= unsigned(rgb_in(G_DATA_WIDTH * 2 - 1 downto G_DATA_WIDTH));
    b <= unsigned(rgb_in(G_DATA_WIDTH - 1 downto 0));

    -- Výpočet max, min a delta
    process(r, g, b)
    begin
        max_rgb <= max(max(r, g), b);
        min_rgb <= min(min(r, g), b);
        delta <= max_rgb - min_rgb;
    end process;

    -- Výpočet H, S, V
    process(max_rgb, min_rgb, delta)
    begin
        if delta = 0 then
            h <= (others => '0'); -- H = 0 pro odstíny šedé
            s <= (others => '0'); -- S = 0 pro odstíny šedé
            v <= max_rgb;         -- V = max pro odstíny šedé
        else
            -- Výpočet H
            if max_rgb = r then
                h <= (g - b) * G_COEFF_FRACT_BITS / delta; -- H = (G - B) / delta
            elsif max_rgb = g then
                h <= (b - r) * G_COEFF_FRACT_BITS / delta + (G_COEFF_FRACT_BITS / 3); -- H = (B - R) / delta + 120°
            else
                h <= (r - g) * G_COEFF_FRACT_BITS / delta + (2 * G_COEFF_FRACT_BITS / 3); -- H = (R - G) / delta + 240°
            end if;

            -- Výpočet S
            s <= (delta * G_COEFF_FRACT_BITS) / max_rgb; -- S = delta / max

            -- Výpočet V
            v <= max_rgb; -- V = max
        end if;
    end process;

    -- Sestavení výstupního vektoru HSV
    hsv_out <= std_logic_vector(h) & std_logic_vector(s) & std_logic_vector(v);

    -- Řízení valid a ready signálů pro AXI-Stream
    rgb_in_ready <= '1';


end RTL;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparator is
    generic(
        DATA_WIDTH : natural := 8
    );
    port(
        clk : in std_logic;
        rst : in std_logic; --active low reset
        a   : in std_logic_vector(DATA_WIDTH - 1 downto 0);
        b   : in std_logic_vector(DATA_WIDTH - 1 downto 0);
        gt  : out std_logic; -- a > b
        eq  : out std_logic; -- a = b
        lt  : out std_logic  -- a < b
    );
end entity comparator;

architecture RTL of comparator is
    
begin
    process(clk, rst)
    begin
        if rst = '0' then
            gt <= '0';
            eq <= '0';
            lt <= '0';
        elsif rising_edge(clk) then
            if unsigned(a) > unsigned(b) then
                gt <= '1';
                eq <= '0';
                lt <= '0';
            elsif unsigned(a) = unsigned(b) then
                gt <= '0';
                eq <= '1';
                lt <= '0';
            else
                gt <= '0';
                eq <= '0';
                lt <= '1';
            end if;
        end if;
    end process;

end architecture RTL;
