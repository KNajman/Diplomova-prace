----------------------------------------------------------------------------------
-- Company: Technical University of Liberec
-- Engineer: Bc. Karel Najman
-- 
-- Description: Testbench pro RGB2HSV. Porovnává výstup hardwarové pipeline
--              se softwarovým zlatým modelem v C++ (portovaným do VHDL procedury).
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity tb_rgb_2_hsv is
-- TB nemá porty
end entity tb_rgb_2_hsv;

architecture SIM of tb_rgb_2_hsv is

    constant C_DATA_WIDTH : positive := 8;
    constant CLK_PERIOD   : time := 10 ns;
    constant TOLERANCE    : integer := 2; 
    constant NUM_RANDOM   : integer := 1000;

    signal clk : std_logic := '0';
    signal rst : std_logic := '0';

    -- AXI IN (RGB)
    signal s_tdata  : std_logic_vector((3 * C_DATA_WIDTH) - 1 downto 0) := (others => '0');
    signal s_tvalid : std_logic := '0';
    signal s_tready : std_logic;
    signal s_tlast  : std_logic := '0';
    signal s_tuser  : std_logic_vector(0 downto 0) := "0";

    -- AXI OUT (HSV)
    signal m_tdata  : std_logic_vector((3 * C_DATA_WIDTH) - 1 downto 0);
    signal m_tvalid : std_logic;
    signal m_tready : std_logic := '1';
    signal m_tlast  : std_logic;
    signal m_tuser  : std_logic_vector(0 downto 0);

    -- =========================================================================
    -- ZLATÝ MODEL (Softwarový C++ algoritmus z OpenCV)
    -- =========================================================================
    procedure golden_rgb2hsv(r, g, b : in integer; variable h, s, v : out integer) is
        variable cmax, cmin, delta : integer;
        variable h_int : integer;
    begin
        cmax := maximum(maximum(r, g), b);
        cmin := minimum(minimum(r, g), b);
        delta := cmax - cmin;
        v := cmax;

        if cmax /= 0 then
            s := (delta * 255) / cmax;
        else
            s := 0;
        end if;

        if delta = 0 then
            h_int := 0;
        elsif cmax = r then
            h_int := (30 * (g - b)) / delta;
        elsif cmax = g then
            h_int := ((30 * (b - r)) / delta) + 60;
        else
            h_int := ((30 * (r - g)) / delta) + 120;
        end if;

        if h_int < 0 then
            h_int := h_int + 180;
        end if;
        h := h_int;
    end procedure;

begin

    dut_rgb2hsv : entity work.rgb_2_hsv
        generic map (
            G_DATA_WIDTH       => C_DATA_WIDTH,
            G_COEFF_FRACT_BITS => 16
        )
        port map (
            clk           => clk,
            rst           => rst,
            s_axis_tdata  => s_tdata,
            s_axis_tuser  => s_tuser,
            s_axis_tlast  => s_tlast,
            s_axis_tvalid => s_tvalid,
            s_axis_tready => s_tready,
            m_axis_tdata  => m_tdata,
            m_axis_tuser  => m_tuser,
            m_axis_tlast  => m_tlast,
            m_axis_tvalid => m_tvalid,
            m_axis_tready => m_tready
        );

    clk <= not clk after CLK_PERIOD / 2;

    stimulus_proc : process
        variable seed1, seed2 : positive := 1;
        variable rand_real    : real;
        variable r_r, r_g, r_b : integer;

        procedure test_pixel(r, g, b : integer; name : string) is
            variable hw_h, hw_s, hw_v : integer;
            variable go_h, go_s, go_v : integer;
            variable timeout : integer := 0;
            variable error_mag : integer := 0;
        begin
            -- Výpočet zlatého modelu
            golden_rgb2hsv(r, g, b, go_h, go_s, go_v);

            -- Odeslání do HW
            s_tdata <= std_logic_vector(to_unsigned(r, 8)) & 
                       std_logic_vector(to_unsigned(g, 8)) & 
                       std_logic_vector(to_unsigned(b, 8));
            s_tvalid <= '1';
            
            wait until rising_edge(clk) and s_tready = '1';
            s_tvalid <= '0';
            
            while m_tvalid = '0' loop
                wait until rising_edge(clk);
                timeout := timeout + 1;
                if timeout > 100 then
                    assert false report "TIMEOUT u testu: " & name severity failure;
                end if;
            end loop;

            -- Vyčtení HW dat
            hw_h := to_integer(unsigned(m_tdata(23 downto 16)));
            hw_s := to_integer(unsigned(m_tdata(15 downto 8)));
            hw_v := to_integer(unsigned(m_tdata(7 downto 0)));

            if abs(go_h - hw_h) > TOLERANCE then error_mag := abs(go_h - hw_h); end if;
            if abs(go_s - hw_s) > TOLERANCE then error_mag := abs(go_s - hw_s); end if;
            if abs(go_v - hw_v) > TOLERANCE then error_mag := abs(go_v - hw_v); end if;

            if error_mag > 0 then
                assert false 
                report "SELHANI RGB2HSV (" & name & "): RGB(" & integer'image(r) & "," & integer'image(g) & "," & integer'image(b) & ") " &
                       "| HW(" & integer'image(hw_h) & "," & integer'image(hw_s) & "," & integer'image(hw_v) & ") " &
                       "| C++ GOLDEN(" & integer'image(go_h) & "," & integer'image(go_s) & "," & integer'image(go_v) & ") " &
                       "| Odchylka: " & integer'image(error_mag)
                severity error;
            end if;
        end procedure;

    begin
        rst <= '0'; wait for CLK_PERIOD * 5;
        rst <= '1'; wait for CLK_PERIOD * 5;

        report "=== START RGB2HSV vs GOLDEN C++ MODEL ===";

        test_pixel(255,   0,   0, "Cista Cervena");
        test_pixel(  0, 255,   0, "Cista Zelena");
        test_pixel(  0,   0, 255, "Cista Modra");
        test_pixel(255, 255, 255, "Cista Bila");
        test_pixel(  0,   0,   0, "Cerna (Tma)");
        test_pixel(128, 128, 128, "Stredni Seda");

        for i in 1 to NUM_RANDOM loop
            uniform(seed1, seed2, rand_real); r_r := integer(rand_real * 255.0);
            uniform(seed1, seed2, rand_real); r_g := integer(rand_real * 255.0);
            uniform(seed1, seed2, rand_real); r_b := integer(rand_real * 255.0);
            test_pixel(r_r, r_g, r_b, "Fuzz #" & integer'image(i));
        end loop;

        report "=== TESTY DOKONCENY ===";
        wait for CLK_PERIOD * 5;
        std.env.stop;
        wait;
    end process;
end architecture SIM;