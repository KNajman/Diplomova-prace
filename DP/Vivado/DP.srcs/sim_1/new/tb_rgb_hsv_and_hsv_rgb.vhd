----------------------------------------------------------------------------------
-- Company: Technical University of Liberec
-- Engineer: Bc. Karel Najman
-- 
-- Description: Testbench pro ověření dopředné a zpětné transformace
--              (RGB -> HSV -> RGB). 
-- Ověřuje: Čisté barvy (R,G,B), limity (Černá, Bílá, Šedá) a náhodné hodnoty.
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all; -- Pro generátor náhodných čísel

entity tb_color_conversions is
-- Testbench nemá porty
end entity tb_color_conversions;

architecture SIM of tb_color_conversions is

    -- Konfigurace
    constant C_DATA_WIDTH : positive := 8;
    constant CLK_PERIOD   : time := 5 ns;
    
    -- Přísnější tolerance pro 8-bit quantization error
    constant TOLERANCE    : integer := 4; 
    constant NUM_RANDOM_TESTS : integer := 1000;

    -- Signály pro Hodiny a Reset
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';

    -- Rozhraní 1: Vstup do RGB2HSV
    signal s_rgb_tdata  : std_logic_vector((3 * C_DATA_WIDTH) - 1 downto 0) := (others => '0');
    signal s_rgb_tvalid : std_logic := '0';
    signal s_rgb_tready : std_logic;
    signal s_rgb_tlast  : std_logic := '0';
    signal s_rgb_tuser  : std_logic_vector(0 downto 0) := "0";

    -- Rozhraní 2: Propojení RGB2HSV -> HSV2RGB (Mezivýsledek)
    signal link_hsv_tdata  : std_logic_vector((3 * C_DATA_WIDTH) - 1 downto 0);
    signal link_hsv_tvalid : std_logic;
    signal link_hsv_tready : std_logic;
    signal link_hsv_tlast  : std_logic;
    signal link_hsv_tuser  : std_logic_vector(0 downto 0);

    -- Rozhraní 3: Výstup z HSV2RGB
    signal m_rgb_tdata  : std_logic_vector((3 * C_DATA_WIDTH) - 1 downto 0);
    signal m_rgb_tvalid : std_logic;
    signal m_rgb_tready : std_logic := '1'; -- TB vždy připraven přijímat
    signal m_rgb_tlast  : std_logic;
    signal m_rgb_tuser  : std_logic_vector(0 downto 0);

    -- Debug signály pro zachycení HSV (snooping)
    signal debug_hsv_h : integer := 0;
    signal debug_hsv_s : integer := 0;
    signal debug_hsv_v : integer := 0;

begin

    -- =========================================================================
    -- INSTANTIACE MODULŮ (DUT)
    -- =========================================================================
    
    -- DUT 1: Dopředný převod
    dut_rgb2hsv : entity work.rgb_2_hsv
        generic map (
            G_DATA_WIDTH       => C_DATA_WIDTH,
            G_COEFF_FRACT_BITS => 16 
        )
        port map (
            clk           => clk,
            rst           => rst,
            s_axis_tdata  => s_rgb_tdata,
            s_axis_tuser  => s_rgb_tuser,
            s_axis_tlast  => s_rgb_tlast,
            s_axis_tvalid => s_rgb_tvalid,
            s_axis_tready => s_rgb_tready,
            m_axis_tdata  => link_hsv_tdata,
            m_axis_tuser  => link_hsv_tuser,
            m_axis_tlast  => link_hsv_tlast,
            m_axis_tvalid => link_hsv_tvalid,
            m_axis_tready => link_hsv_tready
        );

    -- DUT 2: Zpětný převod
    dut_hsv2rgb : entity work.hsv_2_rgb
        generic map (
            G_DATA_WIDTH  => C_DATA_WIDTH
        )
        port map (
            clk           => clk,
            rst           => rst,
            s_axis_tdata  => link_hsv_tdata,
            s_axis_tuser  => link_hsv_tuser,
            s_axis_tlast  => link_hsv_tlast,
            s_axis_tvalid => link_hsv_tvalid,
            s_axis_tready => link_hsv_tready,
            m_axis_tdata  => m_rgb_tdata,
            m_axis_tuser  => m_rgb_tuser,
            m_axis_tlast  => m_rgb_tlast,
            m_axis_tvalid => m_rgb_tvalid,
            m_axis_tready => m_rgb_tready
        );

    -- =========================================================================
    -- GENERÁTOR HODIN A ODCHYTÁVÁNÍ HSV MEZIVÝSLEDKŮ
    -- =========================================================================
    clk <= not clk after CLK_PERIOD / 2;

    -- Snooping proces: Uloží HSV hodnotu, jakmile projde mezi moduly
    capture_hsv_proc : process(clk)
    begin
        if rising_edge(clk) then
            if link_hsv_tvalid = '1' and link_hsv_tready = '1' then
                debug_hsv_h <= to_integer(unsigned(link_hsv_tdata(23 downto 16)));
                debug_hsv_s <= to_integer(unsigned(link_hsv_tdata(15 downto 8)));
                debug_hsv_v <= to_integer(unsigned(link_hsv_tdata(7 downto 0)));
            end if;
        end if;
    end process;

    -- =========================================================================
    -- HLAVNÍ STIMULUS PROCES
    -- =========================================================================
    stimulus_proc : process
    
        variable seed1, seed2 : positive := 1;
        variable rand_real    : real;
        variable r_r, r_g, r_b : integer;

        -- Procedura pro testování s chybovým výstupem
        procedure test_pixel(r, g, b : integer; name : string) is
            variable out_r, out_g, out_b : integer;
            variable timeout : integer := 0;
            variable error_mag : integer := 0;
        begin
            -- 1. Natlačení dat do vstupu
            s_rgb_tdata <= std_logic_vector(to_unsigned(r, 8)) & 
                           std_logic_vector(to_unsigned(g, 8)) & 
                           std_logic_vector(to_unsigned(b, 8));
            s_rgb_tvalid <= '1';
            
            -- Čekání na přijetí
            wait until rising_edge(clk) and s_rgb_tready = '1';
            s_rgb_tvalid <= '0';
            
            -- 2. Čekání na průchod oběma pipelinami (Timeout pojistka)
            while m_rgb_tvalid = '0' loop
                wait until rising_edge(clk);
                timeout := timeout + 1;
                if timeout > 100 then
                    assert false report "TIMEOUT: Pipeline se zablokovala u testu: " & name severity failure;
                end if;
            end loop;

            -- 3. Vyčtení zrekonstruovaného výsledku
            out_r := to_integer(unsigned(m_rgb_tdata(23 downto 16)));
            out_g := to_integer(unsigned(m_rgb_tdata(15 downto 8)));
            out_b := to_integer(unsigned(m_rgb_tdata(7 downto 0)));

            -- 4. Kontrola proti toleranci
            if abs(r - out_r) > TOLERANCE then error_mag := abs(r - out_r); end if;
            if abs(g - out_g) > TOLERANCE then error_mag := abs(g - out_g); end if;
            if abs(b - out_b) > TOLERANCE then error_mag := abs(b - out_b); end if;

            -- 5. Výpis POUZE v případě chyby
            if error_mag > 0 then
                assert false 
                report "SELHANI (" & name & "): " & 
                       "RGB_IN(" & integer'image(r) & "," & integer'image(g) & "," & integer'image(b) & ") -> " &
                       "HSV(" & integer'image(debug_hsv_h) & "," & integer'image(debug_hsv_s) & "," & integer'image(debug_hsv_v) & ") -> " &
                       "RGB_OUT(" & integer'image(out_r) & "," & integer'image(out_g) & "," & integer'image(out_b) & ") | " &
                       "Max odchylka: " & integer'image(error_mag)
                severity error;
            end if;
            
        end procedure;

    begin
        -- 1. INIT A RESET
        rst <= '0';
        wait for CLK_PERIOD * 5;
        rst <= '1';
        wait for CLK_PERIOD * 5;

        report "=== START SILENT TESTOVANI RGB -> HSV -> RGB ===";

        -- 2. TESTY DEFINOVANÝCH BAREV
        test_pixel(255,   0,   0, "Cista Cervena");
        test_pixel(  0, 255,   0, "Cista Zelena");
        test_pixel(  0,   0, 255, "Cista Modra");
        test_pixel(255, 255, 255, "Cista Bila");
        test_pixel(  0,   0,   0, "Cerna (Tma)");
        test_pixel(128, 128, 128, "Stredni Seda");

        -- 3. NÁHODNÉ TESTOVÁNÍ (Fuzz Testing 1000 iterací)
        for i in 1 to NUM_RANDOM_TESTS loop
            uniform(seed1, seed2, rand_real); r_r := integer(rand_real * 255.0);
            uniform(seed1, seed2, rand_real); r_g := integer(rand_real * 255.0);
            uniform(seed1, seed2, rand_real); r_b := integer(rand_real * 255.0);
            
            test_pixel(r_r, r_g, r_b, "Fuzz #" & integer'image(i));
        end loop;

        report "=== VSECHNY TESTY DOKONCENY (" & integer'image(NUM_RANDOM_TESTS + 6) & " pruchodu) ===";
        wait for CLK_PERIOD * 10;
        
        std.env.stop;
        wait;
    end process;

end architecture SIM;