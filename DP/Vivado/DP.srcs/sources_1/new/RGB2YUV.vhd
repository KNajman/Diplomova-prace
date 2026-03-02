----------------------------------------------------------------------------------
-- Company: Technical University of Liberec
-- Engineer: Bc. Karel Najman
-- 
-- Create Date: 02.03.2026
-- Design Name: 
-- Module Name: RGB2YUV - Behavioral
-- Project Name: DP
-- Target Devices: KV260 (Zynq UltraScale+)
-- Tool Versions: Vivado 2025.2
-- Description: Plně generický převodník RGB -> YUV optimalizovaný pro DSP bloky.
--              Využívá ieee.math_real pro automatický výpočet pevných řádových 
--              čárek během kompilace.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL; -- Knihovna pro výpočty desetinných konstant PŘI KOMPILACI

entity RGB2YUV is
    generic(
        DATA_WIDTH       : natural range 8 to 16 := 8;    -- Bitová šířka jedné barvy
        
        -- Přesnost desetinného koeficientu (tzv. fractional bits).
        -- Doporučená hodnota pro Xilinx DSP48 (18-bitový vstup) je 16.
        -- 0.587 * 2^16 = 38470, což se krásně vejde do 18-bit znaménkového koeficientu.
        COEFF_FRACT_BITS : natural range 8 to 20 := 8    
    );
    Port(
        clk           : in  STD_LOGIC;
        rst           : in  STD_LOGIC;
        -- Slave AXI-Stream Input
        rgb_in        : in  STD_LOGIC_VECTOR(DATA_WIDTH * 3 - 1 downto 0);
        rgb_in_valid  : in  STD_LOGIC;
        rgb_in_ready  : out STD_LOGIC;
        -- Master AXI-Stream Output
        yuv_out       : out STD_LOGIC_VECTOR(DATA_WIDTH * 3 - 1 downto 0);
        yuv_out_valid : out STD_LOGIC;
        yuv_out_ready : in  STD_LOGIC
    );
end RGB2YUV;

architecture Behavioral of RGB2YUV is

    -- =========================================================================
    -- 1. FÁZE: DEFINICE PŘESNÝCH MATEMATICKÝCH HODNOT (Desetinná čísla z BT.601)
    -- =========================================================================
    constant R_Y : real :=  0.299;
    constant G_Y : real :=  0.587;
    constant B_Y : real :=  0.114;

    constant R_U : real := -0.168736;
    constant G_U : real := -0.331264;
    constant B_U : real :=  0.500000;

    constant R_V : real :=  0.500000;
    constant G_V : real := -0.418688;
    constant B_V : real := -0.081312;

    -- =========================================================================
    -- 2. FÁZE: KOMPILAČNÍ VÝPOČET CELOČÍSELNÝCH KOEFICIENTŮ
    -- =========================================================================
    -- Vypočítáme měřítko (např. pro 16 bitů to je 2^16 = 65536.0)
    constant SCALE_REAL : real := 2.0 ** real(COEFF_FRACT_BITS);

    -- Vynásobíme a zaokrouhlíme (round) na celá čísla
    constant C_Y_R_INT : integer := integer(round(R_Y * SCALE_REAL));
    constant C_Y_G_INT : integer := integer(round(G_Y * SCALE_REAL));
    constant C_Y_B_INT : integer := integer(round(B_Y * SCALE_REAL));

    constant C_U_R_INT : integer := integer(round(R_U * SCALE_REAL));
    constant C_U_G_INT : integer := integer(round(G_U * SCALE_REAL));
    constant C_U_B_INT : integer := integer(round(B_U * SCALE_REAL));

    constant C_V_R_INT : integer := integer(round(R_V * SCALE_REAL));
    constant C_V_G_INT : integer := integer(round(G_V * SCALE_REAL));
    constant C_V_B_INT : integer := integer(round(B_V * SCALE_REAL));

    -- Převedeme celá čísla na vektorové typy (signed) pro čisté násobení bez warningů
    -- Přidáváme +2 k šířce pro zaručení uložení celočíselné části a znaménka (např. 16+2 = 18 bitů)
    constant C_W : integer := COEFF_FRACT_BITS + 2; 
    
    constant C_Y_R : signed(C_W - 1 downto 0) := to_signed(C_Y_R_INT, C_W);
    constant C_Y_G : signed(C_W - 1 downto 0) := to_signed(C_Y_G_INT, C_W);
    constant C_Y_B : signed(C_W - 1 downto 0) := to_signed(C_Y_B_INT, C_W);

    constant C_U_R : signed(C_W - 1 downto 0) := to_signed(C_U_R_INT, C_W);
    constant C_U_G : signed(C_W - 1 downto 0) := to_signed(C_U_G_INT, C_W);
    constant C_U_B : signed(C_W - 1 downto 0) := to_signed(C_U_B_INT, C_W);

    constant C_V_R : signed(C_W - 1 downto 0) := to_signed(C_V_R_INT, C_W);
    constant C_V_G : signed(C_W - 1 downto 0) := to_signed(C_V_G_INT, C_W);
    constant C_V_B : signed(C_W - 1 downto 0) := to_signed(C_V_B_INT, C_W);

    -- =========================================================================
    -- 3. FÁZE: OFFSETY A ŠÍŘKY VÝSLEDNÝCH REGISTRŮ
    -- =========================================================================
    -- Výpočet Offsetu pro U a V: Polovina z datového rozsahu (např. 128 pro 8bit)
    constant UV_OFFSET     : integer := 2**(DATA_WIDTH - 1);
    constant UV_OFFSET_MAC : integer := UV_OFFSET * integer(SCALE_REAL);

    -- Saturation logika
    constant MAX_PIXEL_VAL : integer := (2**DATA_WIDTH) - 1;
    constant MAX_MAC_VAL   : integer := MAX_PIXEL_VAL * integer(SCALE_REAL);

    -- Kolik bitů potřebujeme pro uložení celého součtu (Zabráníme přetečení při sčítání)
    constant MAC_W : integer := (DATA_WIDTH + 1) + C_W + 2; 

    -- Registry pro Pipeline
    signal yuv_out_reg   : std_logic_vector(DATA_WIDTH * 3 - 1 downto 0) := (others => '0');
    signal out_valid_reg : std_logic                                     := '0';
    signal process_enable : std_logic;

begin

    process_enable <= '1' when (yuv_out_ready = '1' or out_valid_reg = '0') else '0';
    rgb_in_ready   <= '1' when (yuv_out_ready = '1' or out_valid_reg = '0') else '0';

    yuv_out       <= yuv_out_reg;
    yuv_out_valid <= out_valid_reg;

    process(clk)
        variable r_s : signed(DATA_WIDTH downto 0);
        variable g_s : signed(DATA_WIDTH downto 0);
        variable b_s : signed(DATA_WIDTH downto 0);

        variable y_mac : signed(MAC_W - 1 downto 0); 
        variable u_mac : signed(MAC_W - 1 downto 0);
        variable v_mac : signed(MAC_W - 1 downto 0);
    begin
        if rising_edge(clk) then
            if rst = '1' then
                out_valid_reg <= '0';
                yuv_out_reg   <= (others => '0');

            elsif process_enable = '1' then
                out_valid_reg <= rgb_in_valid;

                if rgb_in_valid = '1' then
                    -- 1. Extrakce a převedení na SIGNED (kladný rozsah)
                    r_s := signed('0' & rgb_in(DATA_WIDTH * 3 - 1 downto DATA_WIDTH * 2));
                    g_s := signed('0' & rgb_in(DATA_WIDTH * 2 - 1 downto DATA_WIDTH));
                    b_s := signed('0' & rgb_in(DATA_WIDTH - 1 downto 0));

                    -- 2. MAC s resize (zamezí varováním při sčítání různě širokých čísel)
                    y_mac := resize(C_Y_R * r_s, MAC_W) + resize(C_Y_G * g_s, MAC_W) + resize(C_Y_B * b_s, MAC_W);
                    u_mac := resize(C_U_R * r_s, MAC_W) + resize(C_U_G * g_s, MAC_W) + resize(C_U_B * b_s, MAC_W) + UV_OFFSET_MAC;
                    v_mac := resize(C_V_R * r_s, MAC_W) + resize(C_V_G * g_s, MAC_W) + resize(C_V_B * b_s, MAC_W) + UV_OFFSET_MAC;

                    -- 3. Saturace a Bitový posun (= Dělení zvolenou přesností COEFF_FRACT_BITS)
                    
                    -- Y
                    if y_mac < 0 then
                        yuv_out_reg(DATA_WIDTH * 3 - 1 downto DATA_WIDTH * 2) <= (others => '0');
                    elsif y_mac > MAX_MAC_VAL then
                        yuv_out_reg(DATA_WIDTH * 3 - 1 downto DATA_WIDTH * 2) <= (others => '1');
                    else
                        yuv_out_reg(DATA_WIDTH * 3 - 1 downto DATA_WIDTH * 2) <= std_logic_vector(unsigned(y_mac(DATA_WIDTH + COEFF_FRACT_BITS - 1 downto COEFF_FRACT_BITS)));
                    end if;

                    -- U
                    if u_mac < 0 then
                        yuv_out_reg(DATA_WIDTH * 2 - 1 downto DATA_WIDTH) <= (others => '0');
                    elsif u_mac > MAX_MAC_VAL then
                        yuv_out_reg(DATA_WIDTH * 2 - 1 downto DATA_WIDTH) <= (others => '1');
                    else
                        yuv_out_reg(DATA_WIDTH * 2 - 1 downto DATA_WIDTH) <= std_logic_vector(unsigned(u_mac(DATA_WIDTH + COEFF_FRACT_BITS - 1 downto COEFF_FRACT_BITS)));
                    end if;

                    -- V
                    if v_mac < 0 then
                        yuv_out_reg(DATA_WIDTH - 1 downto 0) <= (others => '0');
                    elsif v_mac > MAX_MAC_VAL then
                        yuv_out_reg(DATA_WIDTH - 1 downto 0) <= (others => '1');
                    else
                        yuv_out_reg(DATA_WIDTH - 1 downto 0) <= std_logic_vector(unsigned(v_mac(DATA_WIDTH + COEFF_FRACT_BITS - 1 downto COEFF_FRACT_BITS)));
                    end if;
                end if;
            end if;
        end if;
    end process;
end Behavioral;