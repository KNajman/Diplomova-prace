--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    tb_median.vhd
-- Popis:     Testbench median_core proti golden modelu (imgproc_median3x3, HEX z imgproc_cli median)
--
--  Testuje zároveň window_gen (okraje, flush, resynchronizace, kontrola TLAST):
--   G_SIZE: 0 = 64x48, 1 = 8x1, 2 = 8x2, 3 = 9x3, 4 = 17x5, 5 = 33x4 (výška 1 a 2: horní a dolní okraj se překrývají)
--   G_REPLICATE: okraj replikací / nulami
--   G_GARBAGE > 0: pixely bez TUSER před prvním snímkem -> zahozeny, status SKIPPED
--   G_BAD_EOL_ROW >= 0: TLAST v tomto řádku o 3 px dřív -> status EARLY_EOL | LATE_EOL, geometrie z čítačů
--  Status se kontroluje po prvním snímku (frame_done), data a TUSER/TLAST u všech snímků.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;

entity tb_median is
    generic(
        G_SIZE        : natural  := 0;
        G_REPLICATE   : boolean  := true;
        G_FRAMES      : positive := 2;
        G_VALID_PCT   : natural  := 100;
        G_READY_PCT   : natural  := 100;
        G_GARBAGE     : natural  := 0;
        G_BAD_EOL_ROW : integer  := -1
    );
end entity;

architecture sim of tb_median is
    constant C_PERIOD : time := 5 ns;

    type t_size is record
        width  : positive;
        height : positive;
    end record;
    type     t_size_array is array (natural range <>) of t_size;
    constant C_SIZES      : t_size_array := ((64, 48), (8, 1), (8, 2), (9, 3), (17, 5), (33, 4));

    constant C_WIDTH  : positive := C_SIZES(G_SIZE).width;
    constant C_HEIGHT : positive := C_SIZES(G_SIZE).height;

    function size_name return string is
    begin
        return integer'image(C_WIDTH) & "x" & integer'image(C_HEIGHT);
    end function;
    function border_name return string is
    begin
        if G_REPLICATE then
            return "replicate";
        end if;
        return "constant";
    end function;
    function pass_fail(error_count : natural) return string is
    begin
        if error_count = 0 then
            return "PASS";
        end if;
        return "FAIL";
    end function;
    function expected_status return std_logic_vector is
        variable result : std_logic_vector(3 downto 0) := (others => '0');
    begin
        if G_GARBAGE > 0 then
            result(C_ST_SKIPPED) := '1';
        end if;
        if (G_BAD_EOL_ROW >= 0) and (C_WIDTH >= 4) then
            result(C_ST_EARLY_EOL) := '1';
            result(C_ST_LATE_EOL)  := '1';
        end if;
        return result;
    end function;

    signal aclk    : std_logic := '0';
    signal aresetn : std_logic := '0';

    signal s_data, m_data                                : std_logic_vector(C_PIX_W - 1 downto 0);
    signal s_user, s_last, s_valid, s_ready, source_done : std_logic;
    signal m_user, m_last, m_valid, m_ready, sink_done   : std_logic;
    signal error_count, cycle_count                      : natural;
    signal status                                        : std_logic_vector(3 downto 0);
    signal frame_done                                    : std_logic;
    signal first_status                                  : std_logic_vector(3 downto 0) := (others => 'U');
    signal frames_done                                   : natural                      := 0;
begin
    aclk    <= not aclk after C_PERIOD / 2;
    aresetn <= '1' after 4 * C_PERIOD;

    source : entity work.axis_file_source
        generic map(G_FILE        => "data/in_gray_" & size_name & ".hex", G_WIDTH => C_WIDTH, G_HEIGHT => C_HEIGHT,
                    G_FRAMES      => G_FRAMES, G_DATA_W => C_PIX_W, G_VALID_PCT => G_VALID_PCT, G_GARBAGE => G_GARBAGE,
                    G_BAD_EOL_ROW => G_BAD_EOL_ROW, G_SEED => 41)
        port map(aclk     => aclk, aresetn => aresetn, m_tdata => s_data, m_tuser => s_user, m_tlast => s_last,
                 m_tvalid => s_valid, m_tready => s_ready, done => source_done);

    dut : entity work.median_core
        port map(aclk             => aclk, aresetn => aresetn, run => '1',
                 width            => to_unsigned(C_WIDTH, C_DIM_W), height => to_unsigned(C_HEIGHT, C_DIM_W),
                 border_replicate => to_sl(G_REPLICATE), status => status, frame_done => frame_done,
                 s_axis_tdata     => s_data, s_axis_tuser => s_user, s_axis_tlast => s_last, s_axis_tvalid => s_valid,
                 s_axis_tready    => s_ready, m_axis_tdata => m_data, m_axis_tuser => m_user, m_axis_tlast => m_last,
                 m_axis_tvalid    => m_valid, m_axis_tready => m_ready);

    sink : entity work.axis_file_sink
        generic map(G_FILE      => "data/median_" & size_name & "_" & border_name & ".hex", G_WIDTH => C_WIDTH,
                    G_HEIGHT    => C_HEIGHT, G_FRAMES => G_FRAMES, G_DATA_W => C_PIX_W, G_READY_PCT => G_READY_PCT,
                    G_SEED      => 43, G_NAME => "median")
        port map(aclk     => aclk, aresetn => aresetn, s_tdata => m_data, s_tuser => m_user, s_tlast => m_last,
                 s_tvalid => m_valid, s_tready => m_ready, errors => error_count, cycles => cycle_count,
                 done     => sink_done);

    status_monitor : process(aclk)
    begin
        if rising_edge(aclk) then
            if frame_done = '1' then
                if frames_done = 0 then
                    first_status <= status;
                end if;
                frames_done <= frames_done + 1;
            end if;
        end if;
    end process;

    check : process
        variable total_errors : natural;
    begin
        wait until sink_done = '1' for 10 ms;
        assert sink_done = '1' report "TIMEOUT: prijemce nedostal vsechny pixely" severity failure;
        wait for 10 * C_PERIOD;
        total_errors := error_count;
        if first_status /= expected_status then
            report "status " & to_string(first_status) & ", ocekavano " & to_string(expected_status) severity error;
            total_errors := total_errors + 1;
        end if;
        if frames_done /= G_FRAMES then
            report "frame_done " & integer'image(frames_done) & "x, ocekavano " & integer'image(G_FRAMES) & "x"
            severity error;
            total_errors := total_errors + 1;
        end if;
        report "VYSLEDEK median " & size_name & " " & border_name & " " & integer'image(G_VALID_PCT) & "/" & integer'image(G_READY_PCT) & " garbage " & integer'image(G_GARBAGE) & " bad_eol " & integer'image(G_BAD_EOL_ROW) & ": " & pass_fail(total_errors) & " (" & integer'image(error_count) & " chyb dat, status " & to_string(first_status) & ", " & integer'image(cycle_count + 1) & " taktu)";
        assert total_errors = 0 severity failure;
        std.env.stop;
        wait;
    end process;
end architecture;
