--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    tb_hsv2rgb.vhd
-- Popis:     Testbench hsv2rgb_core proti golden modelu (HEX z imgproc_cli rgb2hsv)
--
--  G_TEST: 0 = testovací obraz 64x48 (hraniční hodnoty, gradient, šum)
--          1 = rampa 256x256 (R = x, G = y, B = (x + y) / 2, každý 4. řádek B = G -> shody kanálů)
--          2 = všech 2^24 barev (4096x4096, vektory z gen_vectors.sh --full, jen Ababel)
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;

entity tb_hsv2rgb is
    generic (
        G_TEST      : natural := 0;
        G_FRAMES    : positive := 2;
        G_VALID_PCT : natural := 100;
        G_READY_PCT : natural := 100
    );
end entity;

architecture sim of tb_hsv2rgb is
    constant C_PERIOD : time := 5 ns;

    function test_width(test : natural) return positive is
    begin
        case test is
            when 0      => return 64;
            when 1      => return 256;
            when others => return 4096;
        end case;
    end function;
    function test_height(test : natural) return positive is
    begin
        case test is
            when 0      => return 48;
            when 1      => return 256;
            when others => return 4096;
        end case;
    end function;
    function input_file(test : natural) return string is
    begin
        case test is
            when 0      => return "data/hsv_test.hex";
            when 1      => return "data/in_hsv_ramp.hex";
            when others => return "data/in_all_hsv.hex";
        end case;
    end function;
    function golden_file(test : natural) return string is
    begin
        case test is
            when 0      => return "data/rgb_from_hsv_test.hex";
            when 1      => return "data/rgb_from_hsv_ramp.hex";
            when others => return "data/rgb_from_all_hsv.hex";
        end case;
    end function;
    function pass_fail(error_count : natural) return string is
    begin
        if error_count = 0 then
            return "PASS";
        end if;
        return "FAIL";
    end function;

    constant C_WIDTH  : positive := test_width(G_TEST);
    constant C_HEIGHT : positive := test_height(G_TEST);
    -- úplný test jen jeden snímek (16,7 M pixelů)
    function test_frames(test : natural) return positive is
    begin
        if test >= 2 then
            return 1;
        end if;
        return G_FRAMES;
    end function;
    constant C_FRAMES : positive := test_frames(G_TEST);

    signal aclk    : std_logic := '0';
    signal aresetn : std_logic := '0';

    signal s_data, m_data : std_logic_vector(C_RGB_W - 1 downto 0);
    signal s_user, s_last, s_valid, s_ready, source_done : std_logic;
    signal m_user, m_last, m_valid, m_ready, sink_done   : std_logic;
    signal error_count, cycle_count : natural;
begin
    aclk    <= not aclk after C_PERIOD / 2;
    aresetn <= '1' after 4 * C_PERIOD;

    source : entity work.axis_file_source
        generic map (G_FILE => input_file(G_TEST), G_WIDTH => C_WIDTH, G_HEIGHT => C_HEIGHT, G_FRAMES => C_FRAMES,
                     G_DATA_W => C_RGB_W, G_VALID_PCT => G_VALID_PCT, G_SEED => 7)
        port map (aclk => aclk, aresetn => aresetn, m_tdata => s_data, m_tuser => s_user, m_tlast => s_last,
                  m_tvalid => s_valid, m_tready => s_ready, done => source_done);

    dut : entity work.hsv2rgb_core
        port map (aclk => aclk, aresetn => aresetn,
                  s_axis_tdata => s_data, s_axis_tuser => s_user, s_axis_tlast => s_last, s_axis_tvalid => s_valid,
                  s_axis_tready => s_ready, m_axis_tdata => m_data, m_axis_tuser => m_user, m_axis_tlast => m_last,
                  m_axis_tvalid => m_valid, m_axis_tready => m_ready);

    sink : entity work.axis_file_sink
        generic map (G_FILE => golden_file(G_TEST), G_WIDTH => C_WIDTH, G_HEIGHT => C_HEIGHT, G_FRAMES => C_FRAMES,
                     G_DATA_W => C_RGB_W, G_READY_PCT => G_READY_PCT, G_SEED => 13, G_NAME => "hsv2rgb")
        port map (aclk => aclk, aresetn => aresetn, s_tdata => m_data, s_tuser => m_user, s_tlast => m_last,
                  s_tvalid => m_valid, s_tready => m_ready, errors => error_count, cycles => cycle_count,
                  done => sink_done);

    check : process
        constant C_PIXELS : natural := C_WIDTH * C_HEIGHT * C_FRAMES;
    begin
        wait until sink_done = '1' for 2 sec;
        assert sink_done = '1' report "TIMEOUT: prijemce nedostal vsechny pixely" severity failure;
        if (G_VALID_PCT = 100) and (G_READY_PCT = 100) then
            assert cycle_count = C_PIXELS - 1
                report "Propustnost: " & integer'image(cycle_count + 1) & " taktu na " & integer'image(C_PIXELS) & " px"
                severity error;
        end if;
        report "VYSLEDEK hsv2rgb test " & integer'image(G_TEST) & " " & integer'image(G_VALID_PCT) & "/"
            & integer'image(G_READY_PCT) & ": " & pass_fail(error_count) & " (" & integer'image(error_count)
            & " chyb, " & integer'image(C_PIXELS) & " px, " & integer'image(cycle_count + 1) & " taktu)";
        assert error_count = 0 severity failure;
        std.env.stop;
        wait;
    end process;
end architecture;
