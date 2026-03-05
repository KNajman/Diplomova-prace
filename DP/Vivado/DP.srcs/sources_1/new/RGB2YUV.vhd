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
--              Využívá moderní knihovnu VHDL-2008 IEEE.FIXED_PKG pro 
--              čistou a elegantní DSP aritmetiku s nativní saturací a zaokrouhlením.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- =========================================================================
-- PACKAGE: Definice enumerace pro barevné standardy
-- Musí být před entitou, abych ji mohl použít v generics.
-- =========================================================================
package color_pkg is
    type color_std_t is (BT_601, BT_709, BT_2020);
end package;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.color_pkg.all;                 -- Připojení našeho nového balíčku

-- Zahrnutí VHDL-2008 fixed point knihoven
use IEEE.FIXED_FLOAT_TYPES.ALL;         -- pro konstanty fixed_round a fixed_saturate
use IEEE.FIXED_PKG.ALL;                 -- pro typy sfixed, ufixed a jejich matematiku

entity RGB2YUV is
    generic(
        DATA_WIDTH       : natural range 8 to 16 := 8; -- Bitová šířka jedné barvy
        
        -- Přesnost desetinných koeficientu (tzv. fractional bits).
        -- Doporučená hodnota pro Xilinx DSP48 (18-bitový vstup) je 16.
        -- 0.587 * 2^16 = 38470, což se krásně vejde do 18-bit znaménkového koeficientu.
        COEFF_FRACT_BITS : natural range 8 to 20 := 8,
        
        COLOR_STANDARD   : color_std_t := BT_601 -- Výběr barevného standardu: "BT_601", "BT_709", nebo "BT_2020"
    );
    Port(
        clk           : in  STD_LOGIC;
        rst           : in  STD_LOGIC;
        -- Slave AXI-Stream Input
        rgb_in        : in  STD_LOGIC_VECTOR(DATA_WIDTH * 3 - 1 downto 0); -- RGB v jednom vektoru (R[23:16], G[15:8], B[7:0] pro 8-bit)
        rgb_in_valid  : in  STD_LOGIC;
        rgb_in_ready  : out STD_LOGIC;
        -- Master AXI-Stream Output
        yuv_out       : out STD_LOGIC_VECTOR(DATA_WIDTH * 3 - 1 downto 0); -- YUV v jednom vektoru (Y[23:16], U[15:8], V[7:0] pro 8-bit)
        yuv_out_valid : out STD_LOGIC;
        yuv_out_ready : in  STD_LOGIC
    );
end RGB2YUV;

architecture Behavioral of RGB2YUV is

    -- =========================================================================
    -- DEFINICE PŘESNÝCH MATEMATICKÝCH HODNOT
    -- =========================================================================
    
    -- Definice datového typu (záznamu) pro sdružení vah
    type color_weights_t is record
        r : real;
        g : real;
        b : real;
    end record;

    -- Funkce pro získání vah na základě zvoleného barevného standardu
    function get_weights(std : color_std_t) return color_weights_t is
    begin
        case std is
            when BT_709 =>  return (r => 0.2126, g => 0.7152, b => 0.0722);
            when BT_2020 => return (r => 0.2627, g => 0.6780, b => 0.0593);
            when others =>  return (r => 0.2990, g => 0.5870, b => 0.1140); -- Výchozí BT_601 pro neznámé hodnoty
        end case;
    end function;

    constant WEIGHTS : color_weights_t := get_weights(COLOR_STANDARD);

    constant W_R : real := WEIGHTS.r;
    constant W_G : real := WEIGHTS.g;
    constant W_B : real := WEIGHTS.b;

    constant R_Y : real := W_R;
    constant G_Y : real := W_G;
    constant B_Y : real := W_B;

    constant R_U : real := -W_R / (2.0 * (1.0 - W_B)); -- vs zápis z BT.601: U = 0.492(B - Y) => C_U_B = 0.492, C_U_R = C_U_G = -R_Y / (2*(1-B_Y))
    constant G_U : real := -W_G / (2.0 * (1.0 - W_B));
    constant B_U : real :=  0.5;

    constant R_V : real :=  0.5;
    constant G_V : real := -W_G / (2.0 * (1.0 - W_R));
    constant B_V : real := -W_B / (2.0 * (1.0 - W_R));

    -- =========================================================================
    -- FIXED-POINT KOEFICIENTY A OFFSETY (Přímý převod z REAL)
    -- =========================================================================
    -- Nultý bit je znaménko, zbytek jsou desetinná místa. Rozsah [-1.0 do 1.0) s přesností 1/256 pro COEFF_FRACT_BITS=8.
    constant C_Y_R : sfixed(0 downto -COEFF_FRACT_BITS) := to_sfixed(R_Y, 0, -COEFF_FRACT_BITS);
    constant C_Y_G : sfixed(0 downto -COEFF_FRACT_BITS) := to_sfixed(G_Y, 0, -COEFF_FRACT_BITS);
    constant C_Y_B : sfixed(0 downto -COEFF_FRACT_BITS) := to_sfixed(B_Y, 0, -COEFF_FRACT_BITS);

    constant C_U_R : sfixed(0 downto -COEFF_FRACT_BITS) := to_sfixed(R_U, 0, -COEFF_FRACT_BITS);
    constant C_U_G : sfixed(0 downto -COEFF_FRACT_BITS) := to_sfixed(G_U, 0, -COEFF_FRACT_BITS);
    constant C_U_B : sfixed(0 downto -COEFF_FRACT_BITS) := to_sfixed(B_U, 0, -COEFF_FRACT_BITS);

    constant C_V_R : sfixed(0 downto -COEFF_FRACT_BITS) := to_sfixed(R_V, 0, -COEFF_FRACT_BITS);
    constant C_V_G : sfixed(0 downto -COEFF_FRACT_BITS) := to_sfixed(G_V, 0, -COEFF_FRACT_BITS);
    constant C_V_B : sfixed(0 downto -COEFF_FRACT_BITS) := to_sfixed(B_V, 0, -COEFF_FRACT_BITS);

    -- =========================================================================
    -- FÁZE: OFFSET
    -- =========================================================================

    -- Barevný offset 128 (při 8-bit). Indexace (DATA_WIDTH downto 0) nám dává dost prostoru.
    -- Výpočet Offsetu pro U a V: Polovina z datového rozsahu (např. 128 pro 8bit)
    constant UV_OFFSET : sfixed(DATA_WIDTH downto 0) := to_sfixed(2.0**(DATA_WIDTH - 1), DATA_WIDTH, 0);

    -- =========================================================================
    -- SIGNÁLY PRO PIPELINE
    -- =========================================================================
    -- Rozměry si VHDL určí matematicky! 
    -- Násobení: (DATA_WIDTH) + (0) = DATA_WIDTH+1 max celočíselná část.
    constant MULT_HIGH : integer := DATA_WIDTH + 1;
    
    -- Kolik bitů potřebujeme pro uložení celého součtu (Zabráníme přetečení při sčítání)
    constant MAC_HIGH  : integer := MULT_HIGH + 2; -- +2 bity na sečtení 4 hodnot
    
    -- STAGE 1
    -- Signály (Registry za násobičkami)
    signal yr_mult, yg_mult, yb_mult : sfixed(MULT_HIGH downto -COEFF_FRACT_BITS) := (others => '0');
    signal ur_mult, ug_mult, ub_mult : sfixed(MULT_HIGH downto -COEFF_FRACT_BITS) := (others => '0');
    signal vr_mult, vg_mult, vb_mult : sfixed(MULT_HIGH downto -COEFF_FRACT_BITS) := (others => '0');
    
    -- STAGE 2
    -- Signály (Registry za sčítačkami)
    signal y_mac_reg, u_mac_reg, v_mac_reg : sfixed(MAC_HIGH downto -COEFF_FRACT_BITS) := (others => '0');

    -- Řízení Pipeline
    -- (Valid signály a Backpressure)
    signal valid_pipe    : std_logic_vector(2 downto 1) := "00";
    signal out_valid_reg : std_logic := '0';
    signal yuv_out_reg   : std_logic_vector(DATA_WIDTH * 3 - 1 downto 0) := (others => '0');
    
    signal stall         : std_logic;
    signal process_enable: std_logic;

begin

    -- Logika pro AXI-Stream Backpressure
    -- Zastavíme posun v pipeline, pokud výstupní Slave není připraven a my máme na výstupu platná data.
    stall <= out_valid_reg and not yuv_out_ready;
    process_enable <= not stall;
    
    -- Vstupní AXI je připraven (Ready) přijmout data, pokud nezastavujeme pipeline
    rgb_in_ready   <= not stall;

    -- Výstupní porty
    yuv_out       <= yuv_out_reg;
    yuv_out_valid <= out_valid_reg;

    process(clk)
        variable r_s : sfixed(DATA_WIDTH downto 0);
        variable g_s : sfixed(DATA_WIDTH downto 0);
        variable b_s : sfixed(DATA_WIDTH downto 0);
    begin
        if rising_edge(clk) then
            if rst = '1' then
                valid_pipe    <= "00";
                out_valid_reg <= '0';
                yuv_out_reg   <= (others => '0');
                
                yr_mult <= (others => '0');
                yg_mult <= (others => '0');
                yb_mult <= (others => '0');
                ur_mult <= (others => '0');
                ug_mult <= (others => '0');
                ub_mult <= (others => '0');
                vr_mult <= (others => '0');
                vg_mult <= (others => '0');
                vb_mult <= (others => '0'); 

                y_mac_reg <= (others => '0');
                u_mac_reg <= (others => '0');
                v_mac_reg <= (others => '0');   
                
            elsif process_enable = '1' then
                
                -- ==========================================================
                -- POSUN PLATNOSTI DAT V PIPELINE
                -- ==========================================================
                valid_pipe(1) <= rgb_in_valid;
                valid_pipe(2) <= valid_pipe(1);
                out_valid_reg <= valid_pipe(2);

                -- ==========================================================
                -- STAGE 1: Extrakce a Násobení (Mapuje se do M-Registrů v DSP)
                -- ==========================================================
                if rgb_in_valid = '1' then
                    -- Převod vstupního vektoru na signed fixed-point (s jedním bitem pro znaménko navíc)
                    r_s := to_sfixed(signed('0' & rgb_in(DATA_WIDTH * 3 - 1 downto DATA_WIDTH * 2)), DATA_WIDTH, 0);
                    g_s := to_sfixed(signed('0' & rgb_in(DATA_WIDTH * 2 - 1 downto DATA_WIDTH)), DATA_WIDTH, 0);
                    b_s := to_sfixed(signed('0' & rgb_in(DATA_WIDTH - 1 downto 0)), DATA_WIDTH, 0);

                    yr_mult <= C_Y_R * r_s; yg_mult <= C_Y_G * g_s; yb_mult <= C_Y_B * b_s;
                    ur_mult <= C_U_R * r_s; ug_mult <= C_U_G * g_s; ub_mult <= C_U_B * b_s;
                    vr_mult <= C_V_R * r_s; vg_mult <= C_V_G * g_s; vb_mult <= C_V_B * b_s;
                end if;

                -- ==========================================================
                -- STAGE 2: Sčítání (Akumulace) a přidání offsetu (P-Registry)
                -- (Funkce resize zde hlídá zarovnání desetinných čárek)
                -- ==========================================================
                if valid_pipe(1) = '1' then
                    y_mac_reg <= resize(yr_mult + yg_mult + yb_mult, MAC_HIGH, -COEFF_FRACT_BITS);
                    u_mac_reg <= resize(ur_mult + ug_mult + ub_mult + UV_OFFSET, MAC_HIGH, -COEFF_FRACT_BITS);
                    v_mac_reg <= resize(vr_mult + vg_mult + vb_mult + UV_OFFSET, MAC_HIGH, -COEFF_FRACT_BITS);
                end if;

                -- ==========================================================
                -- STAGE 3: Automatická Saturace, Zaokrouhlení a výstup (Slice)
                -- ==========================================================
                if valid_pipe(2) = '1' then
                    -- to_ufixed() elegantně provede ořez na rozsah (DATA_WIDTH-1 downto 0) 
                    -- s využitím standardizovaného zaokrouhlení a ošetření přetečení/podtečení.
                    yuv_out_reg(DATA_WIDTH * 3 - 1 downto DATA_WIDTH * 2) <= to_slv(to_ufixed(y_mac_reg, DATA_WIDTH - 1, 0, fixed_round, fixed_saturate));
                    yuv_out_reg(DATA_WIDTH * 2 - 1 downto DATA_WIDTH)     <= to_slv(to_ufixed(u_mac_reg, DATA_WIDTH - 1, 0, fixed_round, fixed_saturate));
                    yuv_out_reg(DATA_WIDTH - 1 downto 0)                  <= to_slv(to_ufixed(v_mac_reg, DATA_WIDTH - 1, 0, fixed_round, fixed_saturate));
                end if;

            end if;
        end if;
    end process;
end Behavioral;