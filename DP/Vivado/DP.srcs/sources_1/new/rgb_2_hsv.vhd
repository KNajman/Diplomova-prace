----------------------------------------------------------------------------------
-- Company: Technical University of Liberec
-- Engineer: Bc. Karel Najman
-- 
-- Create Year: 2026
-- Design Name: 
-- Module Name: RGB2HSV - Behavioral
-- Project Name: DP
-- Target Devices: KV260 (Zynq UltraScale+ MPSoC)
-- Tool Versions: Vivado 2025.2
-- Description: Pipelined RGB to HSV Converter (AXI4-Stream)
-- Architecture: 5-Stage Pipeline, Divider-less (ROM-based inverse mapping)
-- Note: Využívá OpenCV standard pro Hue (0-180).
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
use ieee.math_real.all;

use work.vid_processing_pkg.all;

entity rgb_2_hsv is
    generic(
        G_DATA_WIDTH       : natural := 8; -- Bitová šířka jedné barvy
        G_COEFF_FRACT_BITS : natural := 10 -- Počet bitů pro zlomkovou část koeficientů (např. 8 pro Q8.8)
    );
    Port(
        clk           : in  STD_LOGIC;
        rst           : in  STD_LOGIC;  -- active low reset
        -- Slave AXI4-Stream IN (RGB)
        s_axis_tdata  : in  STD_LOGIC_VECTOR((3 * G_DATA_WIDTH) - 1 downto 0); -- RGB v jednom vektoru (R[23:16], G[15:8], B[7:0] pro 8-bit)
        s_axis_tvalid : in  std_logic;
        s_axis_tready : out std_logic;
        s_axis_tuser  : in  std_logic_vector(0 downto 0); --tuser je 1bit sběrnice
        s_axis_tlast  : in  std_logic;
        -- Master AXI4-Stream OUT (HSV)
        m_axis_tdata  : out STD_LOGIC_VECTOR((3 * G_DATA_WIDTH) - 1 downto 0); -- HSV v jednom vektoru (H[23:16], S[15:8], V[7:0] pro 8-bit)
        m_axis_tvalid : out std_logic;
        m_axis_tready : in  std_logic;
        m_axis_tuser  : out std_logic_vector(0 downto 0); --tuser je 1bit sběrnice
        m_axis_tlast  : out std_logic
    );
end rgb_2_hsv;

architecture RTL of rgb_2_hsv is

    ---------------------------------------------------------------------------
    -- Konstanty
    ---------------------------------------------------------------------------
    constant MAX_VAL : natural := (2 ** G_DATA_WIDTH) - 1; -- Maximální hodnota barvy pro danou bitovou hloubku (např. 255 pro 8-bit)

    -- OpenCV Standard mapuje 360° na 180 hodnot (0-179).
    constant MAX_HUE : positive := 180;

    -- Barevný kruh má 6 stejných sektorů. Pro OpenCV (180) je šířka sektoru 30.
    constant HUE_SCALE : positive := MAX_HUE / 6;

    constant OFFSET_R : unsigned(G_DATA_WIDTH - 1 downto 0) := (others => '0'); -- R je základní barva pro Hue, takže offset je 0
    constant OFFSET_G : unsigned(G_DATA_WIDTH - 1 downto 0) := to_unsigned(MAX_HUE * 2 / 6, G_DATA_WIDTH); -- G je druhá barva odpovídá 120° (2/6) na 360° kruhu)
    constant OFFSET_B : unsigned(G_DATA_WIDTH - 1 downto 0) := to_unsigned(MAX_HUE * 4 / 6, G_DATA_WIDTH); -- B je třetí barva odpovídá 240° (4/6) na 360° kruhu)

    -- =========================================================================
    -- ROM TABULKA INVERZNÍCH HODNOT PRO DIVIDER-LESS VÝPOČET
    -- =========================================================================
    -- Fixní velikost 256 položek bez ohledu na G_DATA_WIDTH. Větší hloubky využijí 
    -- pouze horních 8 bitů pro adresování, čímž se ušetří BRAM!
    type inv_rom_t is array (0 to 255) of unsigned(G_COEFF_FRACT_BITS + 1 downto 0); -- Rozsah: (FRACT_BITS + 1 downto 0) -> FRACT_BITS + 2 bitů celkem
    impure function init_inv_rom return inv_rom_t is
        variable rom : inv_rom_t;
    begin
        rom(0) := (others => '0');
        for i in 1 to 255 loop
            rom(i) := to_unsigned(((2 ** G_COEFF_FRACT_BITS) + (i / 2)) / i, G_COEFF_FRACT_BITS + 2);
        end loop;
        return rom;
    end function;

    constant INV_ROM : inv_rom_t := init_inv_rom;

    -- =========================================================================
    -- SIGNÁLY PIPELINE
    -- =========================================================================
    signal pipe_en : std_logic;

    -- FÁZE 1: Extrakce kanálů, Min/Max/Delta
    signal f1_r, f1_g, f1_b  : unsigned(G_DATA_WIDTH - 1 downto 0);
    signal f1_max, f1_min    : unsigned(G_DATA_WIDTH - 1 downto 0);
    --
    signal f1_valid, f1_last : std_logic                    := '0';
    signal f1_user           : std_logic_vector(0 downto 0) := "0";

    -- FÁZE 2: Diff, Offset a příprava adres pro ROM
    signal f2_max, f2_delta  : unsigned(G_DATA_WIDTH - 1 downto 0);
    signal f2_diff           : signed(G_DATA_WIDTH downto 0); -- Musí být o 1 bit větší pro záporná čísla
    signal f2_offset         : unsigned(G_DATA_WIDTH - 1 downto 0);
    --
    signal f2_valid, f2_last : std_logic                    := '0';
    signal f2_user           : std_logic_vector(0 downto 0) := "0";

    -- FÁZE 3: Čtení ROM a škálování před násobením
    signal f3_max, f3_delta  : unsigned(G_DATA_WIDTH - 1 downto 0);
    signal f3_offset         : unsigned(G_DATA_WIDTH - 1 downto 0);
    signal f3_inv_max        : unsigned(G_COEFF_FRACT_BITS + 1 downto 0);
    signal f3_inv_delta      : unsigned(G_COEFF_FRACT_BITS + 1 downto 0);
    -- Násobení: f2_diff (W+1) * HUE_SCALE (W+1) -> 2W+2 bitů -> (2W+1 downto 0)
    signal f3_diff_scaled    : signed((G_DATA_WIDTH * 2) + 1 downto 0);
    -- Násobení: f2_delta (W) * MAX_VAL (W) -> 2W bitů -> (2W-1 downto 0)
    signal f3_delta_scaled   : unsigned((G_DATA_WIDTH * 2) - 1 downto 0);
    --
    signal f3_valid, f3_last : std_logic                    := '0';
    signal f3_user           : std_logic_vector(0 downto 0) := "0";

    -- FÁZE 4: DSP Násobičky (Saturace a Hue Diff)
    signal f4_max, f4_delta : unsigned(G_DATA_WIDTH - 1 downto 0);
    signal f4_offset        : unsigned(G_DATA_WIDTH - 1 downto 0);
    -- Násobení a Sčítání: 
    -- f3_delta_scaled (2W) * f3_inv_max (F+2) = 2W+F+2 bitů.
    -- Přičítání konstanty (+0.5) přidává +1 bit pro bezpečnost -> 2W+F+3 bitů -> (2W+F+2 downto 0)
    signal f4_s_mult        : unsigned((G_DATA_WIDTH * 2) + G_COEFF_FRACT_BITS + 2 downto 0);

    -- f3_diff_scaled (2W+2) * f3_inv_delta jako signed (F+3) = 2W+F+5 bitů.
    -- Přičítání konstanty (+0.5) přidává +1 bit pro bezpečnost -> 2W+F+6 bitů -> (2W+F+5 downto 0)
    signal f4_h_mult         : signed((G_DATA_WIDTH * 2) + G_COEFF_FRACT_BITS + 5 downto 0);
    --
    signal f4_valid, f4_last : std_logic                    := '0';
    signal f4_user           : std_logic_vector(0 downto 0) := "0";

    -- FÁZE 5: Pack a shift
    signal f5_h, f5_s, f5_v  : unsigned(G_DATA_WIDTH - 1 downto 0);
    signal f5_valid, f5_last : std_logic                    := '0';
    signal f5_user           : std_logic_vector(0 downto 0) := "0";

begin

    pipe_en       <= m_axis_tready or not f5_valid; -- Povolit posun, pokud je master ready nebo pokud pipeline není validní (prázdná);
    s_axis_tready <= pipe_en;

    pipeline_proc : process(clk) is
        variable v_max, v_min  : unsigned(G_DATA_WIDTH - 1 downto 0);
        variable v_r, v_g, v_b : unsigned(G_DATA_WIDTH - 1 downto 0);

        variable v_h_int : signed(G_DATA_WIDTH downto 0);
        variable v_h_sum : integer range -(2 ** G_DATA_WIDTH) to (2 ** (G_DATA_WIDTH + 1)) - 1;
    begin
        if rising_edge(clk) then
            if rst = '0' then           -- Active low reset 
                f1_valid <= '0';
                f2_valid <= '0';
                f3_valid <= '0';
                f4_valid <= '0';
                f5_valid <= '0';

                f1_last <= '0';
                f2_last <= '0';
                f3_last <= '0';
                f4_last <= '0';
                f5_last <= '0';
            else
                if pipe_en = '1' then

                    --------------------------------------------------------------------------
                    -- FÁZE 1: Rozdělení dat a nalezení maximální a minimální hodnoty pro výpočet delty
                    --------------------------------------------------------------------------
                    f1_valid <= s_axis_tvalid;
                    f1_last  <= s_axis_tlast;
                    f1_user  <= s_axis_tuser;

                    v_r := unsigned(s_axis_tdata((3 * G_DATA_WIDTH) - 1 downto 2 * G_DATA_WIDTH));
                    v_g := unsigned(s_axis_tdata((2 * G_DATA_WIDTH) - 1 downto 1 * G_DATA_WIDTH));
                    v_b := unsigned(s_axis_tdata((1 * G_DATA_WIDTH) - 1 downto 0));

                    v_max := max3(v_r, v_g, v_b);
                    v_min := min3(v_r, v_g, v_b);

                    f1_r <= v_r;
                    f1_g <= v_g;
                    f1_b <= v_b;

                    f1_max <= v_max;
                    f1_min <= v_min;

                    --------------------------------------------------------------------------
                    -- FÁZE 2: Výpočet Diff a přiřazení úhlového offsetu
                    --------------------------------------------------------------------------
                    f2_valid <= f1_valid;
                    f2_last  <= f1_last;
                    f2_user  <= f1_user;

                    f2_max   <= f1_max;
                    f2_delta <= f1_max - f1_min;

                    -- Diff počítáme se znaménkem (9 bitů pro 8-bit barvu, aby nedošlo k přetečení)_u
                    if (f1_max = f1_r) then
                        f2_diff   <= signed('0' & f1_g) - signed('0' & f1_b);
                        f2_offset <= OFFSET_R;
                    elsif (f1_max = f1_g) then
                        f2_diff   <= signed('0' & f1_b) - signed('0' & f1_r);
                        f2_offset <= OFFSET_G;
                    else
                        f2_diff   <= signed('0' & f1_r) - signed('0' & f1_g);
                        f2_offset <= OFFSET_B;
                    end if;

                    --------------------------------------------------------------------------
                    -- FÁZE 3: Čtení BRAM a příprava násobiček (Škálování)
                    --------------------------------------------------------------------------
                    f3_valid <= f2_valid;
                    f3_last  <= f2_last;
                    f3_user  <= f2_user;

                    f3_max    <= f2_max;
                    f3_delta  <= f2_delta;
                    f3_offset <= f2_offset;

                    -- Pro adresování BRAM využiji horních G_COEFF_FRACT_BITS bitů 
                    f3_inv_max   <= INV_ROM(to_integer(f2_max(G_DATA_WIDTH - 1 downto G_DATA_WIDTH - 8)));
                    f3_inv_delta <= INV_ROM(to_integer(f2_delta(G_DATA_WIDTH - 1 downto G_DATA_WIDTH - 8)));

                    -- Transformace měřítka převedena explicitně na cílové počty bitů operandů
                    -- Škálování Hue (Diff * 30) a Saturation (Delta * 255)
                    f3_diff_scaled  <= f2_diff * to_signed(HUE_SCALE, G_DATA_WIDTH + 1);
                    f3_delta_scaled <= f2_delta * to_unsigned(MAX_VAL, G_DATA_WIDTH);

                    --------------------------------------------------------------------------
                    -- FÁZE 4: Inferované DSP bloky (Multipliers)
                    --------------------------------------------------------------------------
                    f4_valid <= f3_valid;
                    f4_last  <= f3_last;
                    f4_user  <= f3_user;

                    f4_max    <= f3_max;
                    f4_delta  <= f3_delta;
                    f4_offset <= f3_offset;

                    -- S_MULT = (Delta * 255) * InvMax
                    f4_s_mult <= resize(f3_delta_scaled * f3_inv_max, f4_s_mult'length) + to_unsigned(2 ** (G_COEFF_FRACT_BITS - 1), f4_s_mult'length);

                    f4_h_mult <= resize(f3_diff_scaled * signed('0' & f3_inv_delta), f4_h_mult'length) + to_signed(2 ** (G_COEFF_FRACT_BITS - 1), f4_h_mult'length);
                    --------------------------------------------------------------------------
                    -- FÁZE 5: Posun bitů (Nahrazuje dělení) a Modulo součet
                    --------------------------------------------------------------------------
                    f5_valid  <= f4_valid;
                    f5_last   <= f4_last;
                    f5_user   <= f4_user;

                    f5_v <= f4_max;     -- Value (V) je přímo Max kanál

                    if f4_delta = 0 then
                        f5_s <= (others => '0');
                        f5_h <= (others => '0');
                    else
                        -- Fyzické vytažení bitů pro Shift operaci
                        f5_s <= unsigned(f4_s_mult(G_COEFF_FRACT_BITS + G_DATA_WIDTH - 1 downto G_COEFF_FRACT_BITS));
                        
                        -- Přetypování podvýsledku pro sčítání (zabrání Vivado "metalogical" warn)
                        v_h_int := signed(f4_h_mult(G_COEFF_FRACT_BITS + G_DATA_WIDTH downto G_COEFF_FRACT_BITS));
                        
                        -- Bezpečné sečtení ve větším typu (s využitím opraveného logic)
                        v_h_sum := to_integer(f4_offset) + to_integer(v_h_int);
                        
                        if v_h_sum < 0 then
                            f5_h <= to_unsigned(v_h_sum + MAX_HUE, G_DATA_WIDTH);
                        else
                            f5_h <= to_unsigned(v_h_sum, G_DATA_WIDTH);
                        end if;
                    end if;

                end if;
            end if;
        end if;
    end process pipeline_proc;

    -- =========================================================================
    -- VÝSTUPNÍ PŘIŘAZENÍ NA AXI-STREAM
    -- =========================================================================
    m_axis_tvalid <= f5_valid;
    m_axis_tlast  <= f5_last;
    m_axis_tuser  <= f5_user;

    -- Sestavení HSV vektoru (H[MSB] ... V[LSB])
    m_axis_tdata <= std_logic_vector(f5_h) & std_logic_vector(f5_s) & std_logic_vector(f5_v);

end RTL;
