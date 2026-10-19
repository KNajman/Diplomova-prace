--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    tb_histogram.vhd
-- Popis:     Test histogram_core proti golden modelu (imgproc_cli hist -> *_hist.hex)
--
--  * G_FRAMES stejných snímků s náhodnými mezerami (TVALID) a backpressure (TREADY),
--  * průchozí video se porovná se vstupním souborem (bypass musí být beze změny),
--  * po každém frame_done se výsledková paměť (zachycená ze zápisového portu) porovná s golden,
--  * G_GARBAGE > 0: pixely bez TUSER před prvním snímkem musí projít, nezapočítat se a první
--    snímek musí mít status SKIPPED; další snímky status 0.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use work.video_pkg.all;

entity tb_histogram is
    generic (
        G_NAME      : string   := "gray_64x48";
        G_WIDTH     : positive := 64;
        G_HEIGHT    : positive := 48;
        G_FRAMES    : positive := 3;
        G_VALID_PCT : natural  := 80;
        G_READY_PCT : natural  := 80;
        G_GARBAGE   : natural  := 0
    );
end entity;

architecture sim of tb_histogram is
    constant C_PERIOD : time := 5 ns;
    constant C_BINS   : natural := 2 ** C_PIX_W;
    type t_hist is array (0 to C_BINS - 1) of std_logic_vector(31 downto 0);

    impure function read_golden(file_name : string) return t_hist is
        file golden_file : text;
        variable text_line : line;
        variable result    : t_hist;
    begin
        file_open(golden_file, file_name, read_mode);
        for bin in 0 to C_BINS - 1 loop
            readline(golden_file, text_line);
            hread(text_line, result(bin));
        end loop;
        file_close(golden_file);
        return result;
    end function;

    function pass_fail(error_count : natural) return string is
    begin
        if error_count = 0 then return "PASS"; end if;
        return "FAIL";
    end function;

    constant C_GOLDEN : t_hist := read_golden("data/" & G_NAME & "_hist.hex");

    signal aclk    : std_logic := '0';
    signal aresetn : std_logic := '0';

    signal s_data, m_data : std_logic_vector(C_PIX_W - 1 downto 0);
    signal s_user, s_last, s_valid, s_ready, source_done : std_logic;
    signal m_user, m_last, m_valid, m_ready : std_logic;
    signal sink_valid, sink_ready, sink_done : std_logic;
    signal error_count, cycle_count : natural;

    signal status        : std_logic_vector(1 downto 0);
    signal frame_done    : std_logic;
    signal result_write_enable : std_logic;
    signal result_write_addr   : unsigned(C_PIX_W - 1 downto 0);
    signal result_write_data   : std_logic_vector(31 downto 0);

    signal seen_sof        : boolean := false;
    signal dropped_pixels  : natural := 0;
    signal hist_errors     : natural := 0;
    signal frames_checked  : natural := 0;
    signal status_errors   : natural := 0;
begin
    aclk    <= not aclk after C_PERIOD / 2;
    aresetn <= '1' after 4 * C_PERIOD;

    source : entity work.axis_file_source
        generic map (G_FILE => "data/in_" & G_NAME & ".hex", G_WIDTH => G_WIDTH, G_HEIGHT => G_HEIGHT,
                     G_FRAMES => G_FRAMES, G_DATA_W => C_PIX_W, G_VALID_PCT => G_VALID_PCT,
                     G_GARBAGE => G_GARBAGE, G_SEED => 61)
        port map (aclk => aclk, aresetn => aresetn, m_tdata => s_data, m_tuser => s_user, m_tlast => s_last,
                  m_tvalid => s_valid, m_tready => s_ready, done => source_done);

    dut : entity work.histogram_core
        port map (aclk => aclk, aresetn => aresetn, run => '1',
                  height => to_unsigned(G_HEIGHT, C_DIM_W), status => status, frame_done => frame_done,
                  result_write_enable => result_write_enable, result_write_addr => result_write_addr,
                  result_write_data => result_write_data,
                  s_axis_tdata => s_data, s_axis_tuser => s_user, s_axis_tlast => s_last,
                  s_axis_tvalid => s_valid, s_axis_tready => s_ready,
                  m_axis_tdata => m_data, m_axis_tuser => m_user, m_axis_tlast => m_last,
                  m_axis_tvalid => m_valid, m_axis_tready => m_ready);

    -- pixely před prvním TUSER (garbage) projdou jádrem; přijímač je zahodí a spočítá
    sink_valid <= m_valid when (seen_sof or m_user = '1') else '0';
    m_ready    <= sink_ready when (seen_sof or m_user = '1') else '1';
    garbage_drop : process (aclk)
    begin
        if rising_edge(aclk) then
            if m_valid = '1' and m_ready = '1' then
                if m_user = '1' then
                    seen_sof <= true;
                elsif not seen_sof then
                    dropped_pixels <= dropped_pixels + 1;
                end if;
            end if;
        end if;
    end process;

    sink : entity work.axis_file_sink
        generic map (G_FILE => "data/in_" & G_NAME & ".hex", G_WIDTH => G_WIDTH, G_HEIGHT => G_HEIGHT,
                     G_FRAMES => G_FRAMES, G_DATA_W => C_PIX_W, G_READY_PCT => G_READY_PCT, G_SEED => 63,
                     G_NAME => "histogram bypass")
        port map (aclk => aclk, aresetn => aresetn, s_tdata => m_data, s_tuser => m_user, s_tlast => m_last,
                  s_tvalid => sink_valid, s_tready => sink_ready, errors => error_count, cycles => cycle_count,
                  done => sink_done);

    -- výsledková paměť zachycená ze zápisového portu, kontrola po každém frame_done
    hist_check : process (aclk)
        variable result     : t_hist := (others => (others => 'U'));
        variable errors     : natural := 0;
    begin
        if rising_edge(aclk) then
            if result_write_enable = '1' then
                result(to_integer(result_write_addr)) := result_write_data;
            end if;
            if frame_done = '1' then
                for bin in 0 to C_BINS - 1 loop
                    if result(bin) /= C_GOLDEN(bin) then
                        if errors < 10 then
                            report "histogram: snimek " & integer'image(frames_checked) & " kos "
                                & integer'image(bin) & " = " & to_hstring(result(bin)) & " (golden "
                                & to_hstring(C_GOLDEN(bin)) & ")" severity error;
                        end if;
                        errors := errors + 1;
                    end if;
                end loop;
                result := (others => (others => 'U'));
                frames_checked <= frames_checked + 1;
            end if;
            hist_errors <= errors;
        end if;
    end process;

    -- status se nastaví současně s frame_done, kontroluje se o takt později
    status_check : process
        variable expected_status : std_logic_vector(1 downto 0);
        variable errors          : natural := 0;
    begin
        for frame in 0 to G_FRAMES - 1 loop
            wait until rising_edge(aclk) and frame_done = '1';
            wait until rising_edge(aclk);
            expected_status := "00";
            if frame = 0 and G_GARBAGE > 0 then
                expected_status(C_ST_SKIPPED) := '1';
            end if;
            if status /= expected_status then
                report "histogram: snimek " & integer'image(frame) & " status " & to_string(status)
                    & " (ocekavano " & to_string(expected_status) & ")" severity error;
                errors := errors + 1;
            end if;
            status_errors <= errors;
        end loop;
        wait;
    end process;

    check : process
        variable total_errors : natural;
    begin
        wait until sink_done = '1' for 20 ms;
        assert sink_done = '1' report "TIMEOUT: prijemce nedostal vsechny pixely" severity failure;
        if frames_checked < G_FRAMES then
            wait until frames_checked = G_FRAMES for 100 us;
        end if;
        wait until rising_edge(aclk);
        wait until rising_edge(aclk);
        total_errors := error_count + hist_errors + status_errors;
        if frames_checked /= G_FRAMES then
            report "histogram: hotovo jen " & integer'image(frames_checked) & " snimku" severity error;
            total_errors := total_errors + 1;
        end if;
        if dropped_pixels /= G_GARBAGE then
            report "histogram: pred SOF proslo " & integer'image(dropped_pixels) & " px (ocekavano "
                & integer'image(G_GARBAGE) & ")" severity error;
            total_errors := total_errors + 1;
        end if;
        report "VYSLEDEK histogram " & G_NAME & " garbage " & integer'image(G_GARBAGE) & ": "
            & pass_fail(total_errors) & " (" & integer'image(error_count) & " chyb bypass, "
            & integer'image(hist_errors) & " chyb histogramu, " & integer'image(cycle_count) & " taktu)";
        assert total_errors = 0 severity failure;
        std.env.stop;
        wait;
    end process;
end architecture;
