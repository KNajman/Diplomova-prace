----------------------------------------------------------------------------------
-- Company: Technical University of Liberec
-- Engineer: Bc. Karel Najman
-- 
-- Description: Testbench pro HSV2RGB. Porovnává výstup hardwarové pipeline
--              se softwarovým zlatým modelem v C++ (portovaným do VHDL procedury).
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity tb_hsv_2_rgb is
-- TB nemá porty
end entity tb_hsv_2_rgb;

architecture SIM of tb_hsv_2_rgb is

    constant C_DATA_WIDTH : positive := 8;
    constant CLK_PERIOD   : time := 10 ns;
    constant TOLERANCE    : integer := 2; 
    constant NUM_RANDOM   : integer := 1000;

    signal clk : std_logic := '0';
    signal rst : std_logic := '0';

    -- AXI IN (HSV)
    signal s_tdata  : std_logic_vector((3 * C_DATA_WIDTH) - 1 downto 0) := (others => '0');
    signal s_tvalid : std_logic := '0';
    signal s_tready : std_logic;
    signal s_tlast  : std_logic := '0';
    signal s_tuser  : std_logic_vector(0 downto 0) := "0";

    -- AXI OUT (RGB)
    signal m_tdata  : std_logic_vector((3 * C_DATA_WIDTH) - 1 downto 0);
    signal m_tvalid : std_logic;
    signal m_tready : std_logic := '1';
    signal m_tlast  : std_logic;
    signal m_tuser  : std_logic_vector(0 downto 0);

    -- =========================================================================
    -- ZLATÝ MODEL (Softwarový C++ algoritmus z OpenCV)
    -- =========================================================================
    procedure golden_hsv2rgb(h, s, v : in integer; variable r, g, b : out integer) is
        variable region, rem_val : integer;
        variable p, q, t : integer;
    begin
        if s = 0 then
            r := v; g := v; b := v;
        else
            region := h / 30;
            -- Použití rem (zbytek po dělení odpovídá C++ operátoru %)
            rem_val := ((h rem 30) * 255) / 30;
            
            p := (v * (255 - s)) / 255;
            q := (v * (255 - (s * rem_val) / 255)) / 255;
            t := (v * (255 - (s * (255 - rem_val)) / 255)) / 255;

            case region is
                when 0 => r := v; g := t; b := p;
                when 1 => r := q; g := v; b := p;
                when 2 => r := p; g := v; b := t;
                when 3 => r := p; g := q; b := v;
                when 4 => r := t; g := p; b := v;
                when others => r := v; g := p; b := q;
            end case;
        end if;
    end procedure;

begin

    dut_hsv2rgb : entity work.hsv_2_rgb
        generic map (
            G_DATA_WIDTH  => C_DATA_WIDTH
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
        variable r_h, r_s, r_v : integer;

        procedure test_pixel(h, s, v : integer; name : string) is
            variable hw_r, hw_g, hw_b : integer;
            variable go_r, go_g, go_b : integer;
            variable timeout : integer := 0;
            variable error_mag : integer := 0;
        begin
            -- Výpočet zlatého modelu
            golden_hsv2rgb(h, s, v, go_r, go_g, go_b);

            -- Odeslání do HW
            s_tdata <= std_logic_vector(to_unsigned(h, 8)) & 
                       std_logic_vector(to_unsigned(s, 8)) & 
                       std_logic_vector(to_unsigned(v, 8));
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
            hw_r := to_integer(unsigned(m_tdata(23 downto 16)));
            hw_g := to_integer(unsigned(m_tdata(15 downto 8)));
            hw_b := to_integer(unsigned(m_tdata(7 downto 0)));

            if abs(go_r - hw_r) > TOLERANCE then error_mag := abs(go_r - hw_r); end if;
            if abs(go_g - hw_g) > TOLERANCE then error_mag := abs(go_g - hw_g); end if;
            if abs(go_b - hw_b) > TOLERANCE then error_mag := abs(go_b - hw_b); end if;

            if error_mag > 0 then
                assert false 
                report "SELHANI HSV2RGB (" & name & "): HSV(" & integer'image(h) & "," & integer'image(s) & "," & integer'image(v) & ") " &
                       "| HW(" & integer'image(hw_r) & "," & integer'image(hw_g) & "," & integer'image(hw_b) & ") " &
                       "| C++ GOLDEN(" & integer'image(go_r) & "," & integer'image(go_g) & "," & integer'image(go_b) & ") " &
                       "| Odchylka: " & integer'image(error_mag)
                severity error;
            end if;
        end procedure;

    begin
        rst <= '0'; wait for CLK_PERIOD * 5;
        rst <= '1'; wait for CLK_PERIOD * 5;

        report "=== START HSV2RGB vs GOLDEN C++ MODEL ===";

        test_pixel(  0, 255, 255, "Cista Cervena");
        test_pixel( 60, 255, 255, "Cista Zelena");
        test_pixel(120, 255, 255, "Cista Modra");
        test_pixel(  0,   0, 255, "Cista Bila");
        test_pixel(  0,   0,   0, "Cerna (Tma)");
        test_pixel(  0,   0, 128, "Stredni Seda");

        for i in 1 to NUM_RANDOM loop
            -- Pozor: Generování Hue pouze 0-179
            uniform(seed1, seed2, rand_real); r_h := integer(rand_real * 179.0);
            uniform(seed1, seed2, rand_real); r_s := integer(rand_real * 255.0);
            uniform(seed1, seed2, rand_real); r_v := integer(rand_real * 255.0);
            test_pixel(r_h, r_s, r_v, "Fuzz #" & integer'image(i));
        end loop;

        report "=== TESTY DOKONCENY ===";
        wait for CLK_PERIOD * 5;
        std.env.stop;
        wait;
    end process;
end architecture SIM;