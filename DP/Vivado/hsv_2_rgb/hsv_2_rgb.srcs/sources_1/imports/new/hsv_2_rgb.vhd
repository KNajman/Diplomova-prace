----------------------------------------------------------------------------------
-- Company: Technical University of Liberec
-- Engineer: Bc. Karel Najman
-- 
-- Create Year: 2026
-- Design Name: 
-- Module Name: HSV2RGB - RTL
-- Project Name: DP
-- Target Devices: KV260 (Zynq UltraScale+ MPSoC)
-- Tool Versions: Vivado 2025.2
-- Description: Pipelined HSV to RGB Converter (AXI4-Stream)
-- Architecture: 5-Stage Pipeline, Divider-less (Shift & Add approximation)
-- Note: Využívá OpenCV standard pro Hue (0-180)
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
use ieee.math_real.ALL;

use work.vid_processing_pkg.all;

entity hsv_2_rgb is
    generic(
        G_DATA_WIDTH : positive := 8    -- Bitová šířka pro každý kanál (H, S, V)
    );
    port(
        clk           : in  std_logic;
        rst           : in  std_logic;  -- Active low reset

        -- AXI4-Stream Slave Interface (HSV input)
        s_axis_tdata  : in  std_logic_vector((3 * G_DATA_WIDTH) - 1 downto 0); -- H[MSB], S, V[LSB]
        s_axis_tvalid : in  std_logic;
        s_axis_tready : out std_logic;
        s_axis_tlast  : in  std_logic;
        s_axis_tuser  : in  std_logic_vector(0 downto 0);
        -- AXI4-Stream Master Interface (RGB output)
        m_axis_tdata  : out std_logic_vector((3 * G_DATA_WIDTH) - 1 downto 0); -- R[MSB], G, B[LSB]
        m_axis_tvalid : out std_logic;
        m_axis_tready : in  std_logic;
        m_axis_tlast  : out std_logic;
        m_axis_tuser  : out std_logic_vector(0 downto 0)
    );
end entity hsv_2_rgb;

architecture RTL of hsv_2_rgb is

    ---------------------------------------------------------------------------
    -- KONSTANTY PRO VÝPOČET HUE SEKTORŮ
    ---------------------------------------------------------------------------
    constant MAX_VAL      : integer := (2 ** G_DATA_WIDTH) - 1; -- 256 -1 = 255;
    constant MAX_HUE      : natural := 180; -- Standard pro OpenCV (0-180 pro 8-bitový rozsah)
    constant SECTOR_WIDTH : integer := MAX_HUE / 6; -- 30 pro 8-bitový rozsah

    -- Šestinové sektory barevného úhlu (odpovídá 60° na 360° kruhu)
    constant SEC_1 : integer := SECTOR_WIDTH; -- 30
    constant SEC_2 : integer := SECTOR_WIDTH * 2; -- 60
    constant SEC_3 : integer := SECTOR_WIDTH * 3; -- 90
    constant SEC_4 : integer := SECTOR_WIDTH * 4; -- 120
    constant SEC_5 : integer := SECTOR_WIDTH * 5; -- 150

    ---------------------------------------------------------------------------
    -- HARDWAROVÁ APROXIMACE DĚLENÍ (Ekvivalent HLS makra DIV255)
    ---------------------------------------------------------------------------
    -- Provádí: x / MAX_VAL  =>  (x + 1 + (x >> G_DATA_WIDTH)) >> G_DATA_WIDTH
    type f_rom_t is array (0 to SECTOR_WIDTH - 1) of unsigned(G_DATA_WIDTH - 1 downto 0);

    impure function init_f_rom return f_rom_t is
        variable rom : f_rom_t;
    begin
        for i in 0 to SECTOR_WIDTH - 1 loop
            -- Využití real-round pro zamezení řetězení chyb zaokrouhlení
            rom(i) := to_unsigned(integer(round((real(i) * real(MAX_VAL)) / real(SECTOR_WIDTH))), G_DATA_WIDTH);
        end loop;
        return rom;
    end function;

    constant F_ROM : f_rom_t := init_f_rom;

    ---------------------------------------------------------------------------
    -- PIPELINE SIGNÁLY (5 Stupňů)
    ---------------------------------------------------------------------------
    signal pipe_en : std_logic;

    -- FÁZE 1: Sektory a frakční část úhlu (f)
    signal f1_v, f1_s        : unsigned(G_DATA_WIDTH - 1 downto 0);
    signal f1_f              : unsigned(G_DATA_WIDTH - 1 downto 0);
    signal f1_region         : integer range 0 to 5;
    signal f1_valid, f1_last : std_logic                    := '0';
    signal f1_user           : std_logic_vector(0 downto 0) := "0";

    -- FÁZE 2: První úroveň násobení (S_F, S_NF a P)
    signal f2_v              : unsigned(G_DATA_WIDTH - 1 downto 0);
    signal f2_region         : integer range 0 to 5;
    --f1_s (W) * f1_f (W) -> 2W bitů -> (2W-1 downto 0)
    signal f2_s_f_mult       : unsigned((2 * G_DATA_WIDTH) - 1 downto 0);
    signal f2_s_nf_mult      : unsigned((2 * G_DATA_WIDTH) - 1 downto 0);
    signal f2_v_inv_s_mult   : unsigned((2 * G_DATA_WIDTH) - 1 downto 0);
    signal f2_valid, f2_last : std_logic                    := '0';
    signal f2_user           : std_logic_vector(0 downto 0) := "0";

    -- FÁZE 3: První dělení a mezivýsledky (S_F, S_NF a finální P)
    signal f3_v, f3_p        : unsigned(G_DATA_WIDTH - 1 downto 0);
    --Dělení 255: Vstup (2W) -> Výstup (W bitů)
    signal f3_s_f, f3_s_nf   : unsigned(G_DATA_WIDTH - 1 downto 0);
    signal f3_region         : integer range 0 to 5;
    signal f3_valid, f3_last : std_logic                    := '0';
    signal f3_user           : std_logic_vector(0 downto 0) := "0";

    -- FÁZE 4: Druhá úroveň násobení (Pro Q a T)
    signal f4_v, f4_p        : unsigned(G_DATA_WIDTH - 1 downto 0);
    signal f4_region         : integer range 0 to 5;
    --Násobení: f3_v (W) * inv (W) -> 2W bitů -> (2W-1 downto 0)
    signal f4_v_inv_sf_mult  : unsigned((2 * G_DATA_WIDTH) - 1 downto 0);
    signal f4_v_inv_snf_mult : unsigned((2 * G_DATA_WIDTH) - 1 downto 0);
    signal f4_valid, f4_last : std_logic                    := '0';
    signal f4_user           : std_logic_vector(0 downto 0) := "0";

    -- FÁZE 5: Druhé dělení a MUX výstupů
    signal f5_r, f5_g, f5_b  : unsigned(G_DATA_WIDTH - 1 downto 0);
    signal f5_valid, f5_last : std_logic                    := '0';
    signal f5_user           : std_logic_vector(0 downto 0) := "0";

begin

    pipe_en       <= m_axis_tready or not f5_valid;
    s_axis_tready <= pipe_en;

    pipeline_proc : process(clk)
        -- Okamžité proměnné pro Fázi 1
        variable v_h, v_s, v_v : unsigned(G_DATA_WIDTH - 1 downto 0);
        variable v_h_norm      : unsigned(G_DATA_WIDTH - 1 downto 0);
        variable v_rem    : unsigned(G_DATA_WIDTH - 1 downto 0);
        variable v_region      : natural range 0 to 5;

        -- Proměnné pro HW "Negaci" namísto odčítání z 255
        variable v_inv_s    : unsigned(G_DATA_WIDTH - 1 downto 0);
        variable v_inv_f    : unsigned(G_DATA_WIDTH - 1 downto 0);
        variable v_inv_s_f  : unsigned(G_DATA_WIDTH - 1 downto 0);
        variable v_inv_s_nf : unsigned(G_DATA_WIDTH - 1 downto 0);

        -- Okamžité proměnné pro MUX ve fázi 5
        variable v_q, v_t : unsigned(G_DATA_WIDTH - 1 downto 0);
    begin
        if rising_edge(clk) then
            if rst = '0' then
                -- Optimalizace datapath: Resetujeme pouze řídící logiku.
                f1_valid <= '0';
                f2_valid <= '0';
                f3_valid <= '0';
                f4_valid <= '0';
                f5_valid <= '0';
                f1_last  <= '0';
                f2_last  <= '0';
                f3_last  <= '0';
                f4_last  <= '0';
                f5_last  <= '0';
            elsif pipe_en = '1' then

                --------------------------------------------------------------------------
                -- FÁZE 1: Rozřazení Hue do 6 sektorů (Region) a výpočet zlomku (f)
                --------------------------------------------------------------------------
                f1_valid <= s_axis_tvalid;
                f1_last  <= s_axis_tlast;
                f1_user  <= s_axis_tuser;

                v_h := unsigned(s_axis_tdata((3 * G_DATA_WIDTH) - 1 downto 2 * G_DATA_WIDTH));
                v_s := unsigned(s_axis_tdata((2 * G_DATA_WIDTH) - 1 downto 1 * G_DATA_WIDTH));
                v_v := unsigned(s_axis_tdata((1 * G_DATA_WIDTH) - 1 downto 0));

                -- Normalizace Hue do rozsahu 0-180 a výpočet regionu a zbytku pro aproximaci dělení
                v_h_norm := v_h;
                if v_h_norm > MAX_HUE then
                    v_h_norm := v_h_norm - MAX_HUE;
                end if;

                -- Rozdělení kruhu komparátory namísto dělení
                if v_h_norm < SEC_1 then
                    v_region := 0;
                    v_rem    := v_h_norm;
                elsif v_h_norm < SEC_2 then
                    v_region := 1;
                    v_rem    := v_h_norm - SEC_1;
                elsif v_h_norm < SEC_3 then
                    v_region := 2;
                    v_rem    := v_h_norm - SEC_2;
                elsif v_h_norm < SEC_4 then
                    v_region := 3;
                    v_rem    := v_h_norm - SEC_3;
                elsif v_h_norm < SEC_5 then
                    v_region := 4;
                    v_rem    := v_h_norm - SEC_4;
                else
                    v_region := 5;
                    v_rem    := v_h_norm - SEC_5;
                end if;

                f1_v      <= v_v;
                f1_s      <= v_s;
                f1_f      <= F_ROM(to_integer(v_rem));
                f1_region <= v_region;

                --------------------------------------------------------------------------
                -- FÁZE 2: První násobičky a bitové inverze (MAX_VAL - x  ==  not x)
                --------------------------------------------------------------------------
                f2_valid <= f1_valid;
                f2_last  <= f1_last;
                f2_user  <= f1_user;

                v_inv_s := not f1_s;
                v_inv_f := not f1_f;

                f2_v            <= f1_v;
                f2_region       <= f1_region;
                f2_s_f_mult     <= f1_s * f1_f;
                f2_s_nf_mult    <= f1_s * v_inv_f;
                f2_v_inv_s_mult <= f1_v * v_inv_s;

                --------------------------------------------------------------------------
                -- FÁZE 3: Aplikace funkce DIV_MAXVAL a příprava
                --------------------------------------------------------------------------
                f3_valid <= f2_valid;
                f3_last  <= f2_last;
                f3_user  <= f2_user;

                f3_v      <= f2_v;
                f3_region <= f2_region;

                f3_s_f  <= div_maxval(f2_s_f_mult, G_DATA_WIDTH);
                f3_s_nf <= div_maxval(f2_s_nf_mult, G_DATA_WIDTH);
                f3_p    <= div_maxval(f2_v_inv_s_mult, G_DATA_WIDTH);

                --------------------------------------------------------------------------
                -- FÁZE 4: Druhé DSP bloky
                --------------------------------------------------------------------------
                f4_valid <= f3_valid;
                f4_last  <= f3_last;
                f4_user  <= f3_user;

                v_inv_s_f  := not f3_s_f;
                v_inv_s_nf := not f3_s_nf;

                f4_v      <= f3_v;
                f4_p      <= f3_p;
                f4_region <= f3_region;

                f4_v_inv_sf_mult  <= f3_v * v_inv_s_f;
                f4_v_inv_snf_mult <= f3_v * v_inv_s_nf;

                --------------------------------------------------------------------------
                -- FÁZE 5: Dokončení dělení a MUXing na R, G, B
                --------------------------------------------------------------------------
                f5_valid <= f4_valid;
                f5_last  <= f4_last;
                f5_user  <= f4_user;

                v_q := div_maxval(f4_v_inv_sf_mult, G_DATA_WIDTH);
                v_t := div_maxval(f4_v_inv_snf_mult, G_DATA_WIDTH);

                -- Regionální multiplexor odvozený z HLS case()
                case f4_region is
                    when 0 =>
                        f5_r <= f4_v;
                        f5_g <= v_t;
                        f5_b <= f4_p;
                    when 1 =>
                        f5_r <= v_q;
                        f5_g <= f4_v;
                        f5_b <= f4_p;
                    when 2 =>
                        f5_r <= f4_p;
                        f5_g <= f4_v;
                        f5_b <= v_t;
                    when 3 =>
                        f5_r <= f4_p;
                        f5_g <= v_q;
                        f5_b <= f4_v;
                    when 4 =>
                        f5_r <= v_t;
                        f5_g <= f4_p;
                        f5_b <= f4_v;
                    when others =>      -- Region 5 
                        f5_r <= f4_v;
                        f5_g <= f4_p;
                        f5_b <= v_q;
                end case;
            end if;
        end if;
    end process pipeline_proc;

    -- =========================================================================
    -- VÝSTUPNÍ PŘIŘAZENÍ NA AXI-STREAM
    -- =========================================================================
    m_axis_tvalid <= f5_valid;
    m_axis_tlast  <= f5_last;
    m_axis_tuser  <= f5_user;

    -- Sestavení RGB vektoru (R[MSB] ... B[LSB])
    m_axis_tdata <= std_logic_vector(f5_r) & std_logic_vector(f5_g) & std_logic_vector(f5_b);
end RTL;
