--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    tb_passthrough.vhd
-- Popis:     Testbench passthrough_core: výstup = vstup, zátěžové scénáře streamu
--
--  G_INPUT, G_WIDTH, G_HEIGHT: vstupní snímek data/<G_INPUT>.hex (24 b) - je zároveň očekávaným výstupem
--  G_VALID_PCT / G_READY_PCT: náhodné mezery ve vstupu / zpětný tlak výstupu
--  G_GARBAGE > 0: pixely bez TUSER před prvním snímkem -> zahozeny, status SKIPPED
--  G_BAD_EOL_ROW >= 0: TLAST v tomto řádku o 3 px dřív -> status EARLY_EOL | LATE_EOL, geometrie z čítačů
--  G_EXTRA_SOF_ROW >= 0: TUSER i na začátku tohoto řádku -> status EARLY_SOF, snímek se dokončí W x H
--  G_STALL_AT >= 0: po tomto pixelu vstup na G_STALL_CYCLES taktů zastaví (TVALID = 0) a výstup
--                   na stejnou dobu odmítá data (TREADY = 0) - zastavení a znovuspuštění streamu
--  Status se kontroluje po prvním snímku (frame_done), data a TUSER/TLAST u všech snímků.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;

entity tb_passthrough is
    generic(
        G_INPUT        : string   := "in_rgb";   -- soubor data/<G_INPUT>.hex
        G_WIDTH        : positive := 64;
        G_HEIGHT       : positive := 48;
        G_FRAMES       : positive := 2;
        G_VALID_PCT    : natural  := 100;
        G_READY_PCT    : natural  := 100;
        G_GARBAGE      : natural  := 0;
        G_BAD_EOL_ROW  : integer  := -1;
        G_EXTRA_SOF_ROW : integer := -1;
        G_STALL_AT     : integer  := -1;
        G_STALL_CYCLES : natural  := 5000
    );
end entity;

architecture sim of tb_passthrough is
    constant C_PERIOD : time := 5 ns;
    constant C_FILE   : string := "data/" & G_INPUT & ".hex";
    -- rezerva časového limitu: 10 taktů na pixel (mezery a zpětný tlak) + zastavení + start
    constant C_TIMEOUT : time := C_PERIOD * (10 * G_WIDTH * G_HEIGHT * G_FRAMES + 2 * G_STALL_CYCLES + 100000);

    function size_name return string is
    begin
        return integer'image(G_WIDTH) & "x" & integer'image(G_HEIGHT);
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
        if (G_BAD_EOL_ROW >= 0) and (G_WIDTH >= 4) then
            result(C_ST_EARLY_EOL) := '1';
            result(C_ST_LATE_EOL)  := '1';
        end if;
        if (G_EXTRA_SOF_ROW > 0) and (G_EXTRA_SOF_ROW < G_HEIGHT) then
            result(C_ST_EARLY_SOF) := '1';
        end if;
        return result;
    end function;

    signal aclk    : std_logic := '0';
    signal aresetn : std_logic := '0';

    signal s_data, m_data                              : std_logic_vector(C_RGB_W - 1 downto 0);
    signal s_user, s_last, s_valid, s_ready            : std_logic;
    signal m_user, m_last, m_valid, m_ready, sink_done : std_logic;
    signal sink_valid, sink_ready                      : std_logic;
    signal error_count, cycle_count                    : natural;
    signal status                                      : std_logic_vector(3 downto 0);
    signal frame_done                                  : std_logic;
    signal first_status                                : std_logic_vector(3 downto 0) := (others => 'U');
    signal frames_done                                 : natural                      := 0;
    signal output_stall                                : std_logic                    := '0';
    signal input_pixels                                : natural                      := 0;
begin
    aclk    <= not aclk after C_PERIOD / 2;
    aresetn <= '1' after 4 * C_PERIOD;

    source : entity work.axis_file_source
        generic map(G_FILE        => C_FILE, G_WIDTH => G_WIDTH, G_HEIGHT => G_HEIGHT, G_FRAMES => G_FRAMES,
                    G_DATA_W      => C_RGB_W, G_VALID_PCT => G_VALID_PCT, G_GARBAGE => G_GARBAGE,
                    G_BAD_EOL_ROW => G_BAD_EOL_ROW, G_EXTRA_SOF_ROW => G_EXTRA_SOF_ROW, G_PAUSE_AT => G_STALL_AT, G_PAUSE_CYCLES => G_STALL_CYCLES,
                    G_SEED        => 61)
        port map(aclk     => aclk, aresetn => aresetn, m_tdata => s_data, m_tuser => s_user, m_tlast => s_last,
                 m_tvalid => s_valid, m_tready => s_ready, done => open);

    dut : entity work.passthrough_core
        generic map(G_DATA_W => C_RGB_W)
        port map(aclk          => aclk, aresetn => aresetn, run => '1',
                 width         => to_unsigned(G_WIDTH, C_DIM_W), height => to_unsigned(G_HEIGHT, C_DIM_W),
                 status        => status, frame_done => frame_done,
                 s_axis_tdata  => s_data, s_axis_tuser => s_user, s_axis_tlast => s_last, s_axis_tvalid => s_valid,
                 s_axis_tready => s_ready, m_axis_tdata => m_data, m_axis_tuser => m_user, m_axis_tlast => m_last,
                 m_axis_tvalid => m_valid, m_axis_tready => m_ready);

    -- Zastavení výstupu: příjemce data nevidí a DUT nedostane TREADY (DUT musí data podržet)
    m_ready    <= sink_ready and not output_stall;
    sink_valid <= m_valid and not output_stall;

    sink : entity work.axis_file_sink
        generic map(G_FILE      => C_FILE, G_WIDTH => G_WIDTH, G_HEIGHT => G_HEIGHT, G_FRAMES => G_FRAMES,
                    G_DATA_W    => C_RGB_W, G_READY_PCT => G_READY_PCT, G_SEED => 63, G_NAME => "passthrough")
        port map(aclk     => aclk, aresetn => aresetn, s_tdata => m_data, s_tuser => m_user, s_tlast => m_last,
                 s_tvalid => sink_valid, s_tready => sink_ready, errors => error_count, cycles => cycle_count,
                 done     => sink_done);

    -- Výstupní zastavení začne s pixelem G_STALL_AT na vstupu DUT (souběžně se zastavením zdroje)
    stall_control : process(aclk)
        variable stall_counter : natural := 0;
    begin
        if rising_edge(aclk) then
            if (s_valid = '1') and (s_ready = '1') then
                input_pixels <= input_pixels + 1;
            end if;
            if (G_STALL_AT >= 0) and (input_pixels = G_STALL_AT + G_GARBAGE) and (stall_counter = 0)
                and (output_stall = '0') then
                output_stall  <= '1';
                stall_counter := G_STALL_CYCLES;
            elsif output_stall = '1' then
                if stall_counter <= 1 then
                    output_stall  <= '0';
                    stall_counter := 0;
                else
                    stall_counter := stall_counter - 1;
                end if;
            end if;
        end if;
    end process;

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
        wait until sink_done = '1' for C_TIMEOUT;
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
        report "VYSLEDEK passthrough " & size_name & " " & integer'image(G_VALID_PCT) & "/" & integer'image(G_READY_PCT) & " garbage " & integer'image(G_GARBAGE) & " bad_eol " & integer'image(G_BAD_EOL_ROW) & " extra_sof " & integer'image(G_EXTRA_SOF_ROW) & " stall " & integer'image(G_STALL_AT) & ": " & pass_fail(total_errors) & " (" & integer'image(error_count) & " chyb dat, status " & to_string(first_status) & ", " & integer'image(cycle_count + 1) & " taktu)";
        assert total_errors = 0 severity failure;
        std.env.stop;
        wait;
    end process;
end architecture;
