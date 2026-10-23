--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    tb_filter2d.vhd
-- Popis:     Testbench filter2d_core proti golden modelu (imgproc_filter2d, HEX z imgproc_cli filter/filterk)
--
--  Koeficienty, scale a delta se načtou ze souboru <golden>_kernel.txt, který zapsal golden model
--  (žádné ručně opsané hodnoty). G_KERNEL: identity, mean, sharpen, sobel_x, sobel_y (3x3) nebo k5, k7.
--  Rozměry: 64x48, 9x3 a 8x1 (u 5x5/7x7 je výška menší než jádro -> horní a dolní okraj se překrývají).
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use work.video_pkg.all;

entity tb_filter2d is
    generic(
        G_K         : positive := 3;
        G_KERNEL    : string   := "mean";
        G_WIDTH     : positive := 64;
        G_HEIGHT    : positive := 48;
        G_REPLICATE : boolean  := true;
        G_FRAMES    : positive := 2;
        G_VALID_PCT : natural  := 100;
        G_READY_PCT : natural  := 100;
        G_USE_DSP   : boolean  := false
    );
end entity;

architecture sim of tb_filter2d is
    constant C_PERIOD : time := 5 ns;

    function border_name return string is
    begin
        if G_REPLICATE then
            return "replicate";
        end if;
        return "constant";
    end function;
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

    constant C_GOLDEN : string := "data/filter_" & G_KERNEL & "_" & size_name & "_" & border_name;

    signal aclk      : std_logic                                := '0';
    signal aresetn   : std_logic                                := '0';
    signal coeff     : t_filter_coeff_array(0 to G_K * G_K - 1) := (others => (others => '0'));
    signal scale     : signed(C_FILTER_SCALE_W - 1 downto 0)    := (others => '0');
    signal delta     : signed(C_FILTER_DELTA_W - 1 downto 0)    := (others => '0');
    signal kernel_ok : boolean                                  := true;

    signal s_data, m_data                              : std_logic_vector(C_PIX_W - 1 downto 0);
    signal s_user, s_last, s_valid, s_ready            : std_logic;
    signal m_user, m_last, m_valid, m_ready, sink_done : std_logic;
    signal error_count, cycle_count                    : natural;
    signal status                                      : std_logic_vector(3 downto 0);
begin
    aclk    <= not aclk after C_PERIOD / 2;
    aresetn <= '1' after 4 * C_PERIOD;

    -- jádro ze souboru golden modelu: "K scale delta" a K řádků koeficientů
    load_kernel : process
        file     kernel_file : text;
        variable text_line   : line;
        variable value       : integer;
        variable kernel_size : integer;
    begin
        file_open(kernel_file, C_GOLDEN & "_kernel.txt", read_mode);
        readline(kernel_file, text_line);
        read(text_line, kernel_size);
        if kernel_size /= G_K then
            report "Soubor jadra ma K = " & integer'image(kernel_size) & ", testbench G_K = " & integer'image(G_K)
            severity error;
            kernel_ok <= false;
        end if;
        read(text_line, value);
        scale <= to_signed(value, C_FILTER_SCALE_W);
        read(text_line, value);
        delta <= to_signed(value, C_FILTER_DELTA_W);
        for row in 0 to G_K - 1 loop
            readline(kernel_file, text_line);
            for col in 0 to G_K - 1 loop
                read(text_line, value);
                coeff(row * G_K + col) <= to_signed(value, C_FILTER_COEFF_W);
            end loop;
        end loop;
        file_close(kernel_file);
        wait;
    end process;

    source : entity work.axis_file_source
        generic map(G_FILE      => "data/in_gray_" & size_name & ".hex", G_WIDTH => G_WIDTH, G_HEIGHT => G_HEIGHT,
                    G_FRAMES    => G_FRAMES, G_DATA_W => C_PIX_W, G_VALID_PCT => G_VALID_PCT, G_SEED => 61)
        port map(aclk     => aclk, aresetn => aresetn, m_tdata => s_data, m_tuser => s_user, m_tlast => s_last,
                 m_tvalid => s_valid, m_tready => s_ready, done => open);

    dut : entity work.filter2d_core
        generic map(G_K => G_K, G_USE_DSP => G_USE_DSP)
        port map(aclk             => aclk, aresetn => aresetn, run => '1',
                 width            => to_unsigned(G_WIDTH, C_DIM_W), height => to_unsigned(G_HEIGHT, C_DIM_W),
                 border_replicate => to_sl(G_REPLICATE), coeff => coeff, scale => scale, delta => delta,
                 status           => status, frame_done => open,
                 s_axis_tdata     => s_data, s_axis_tuser => s_user, s_axis_tlast => s_last, s_axis_tvalid => s_valid,
                 s_axis_tready    => s_ready, m_axis_tdata => m_data, m_axis_tuser => m_user, m_axis_tlast => m_last,
                 m_axis_tvalid    => m_valid, m_axis_tready => m_ready);

    sink : entity work.axis_file_sink
        generic map(G_FILE      => C_GOLDEN & ".hex", G_WIDTH => G_WIDTH, G_HEIGHT => G_HEIGHT, G_FRAMES => G_FRAMES,
                    G_DATA_W    => C_PIX_W, G_READY_PCT => G_READY_PCT, G_SEED => 67, G_NAME => "filter2d")
        port map(aclk     => aclk, aresetn => aresetn, s_tdata => m_data, s_tuser => m_user, s_tlast => m_last,
                 s_tvalid => m_valid, s_tready => m_ready, errors => error_count, cycles => cycle_count,
                 done     => sink_done);

    check : process
        variable total_errors : natural;
    begin
        wait until sink_done = '1' for 10 ms;
        assert sink_done = '1' report "TIMEOUT: prijemce nedostal vsechny pixely" severity failure;
        total_errors := error_count;
        if not kernel_ok then
            total_errors := total_errors + 1;
        end if;
        if status /= "0000" then
            report "status " & to_string(status) severity error;
            total_errors := total_errors + 1;
        end if;
        report "VYSLEDEK filter2d " & G_KERNEL & " K" & integer'image(G_K) & " " & size_name & " " & border_name & " " & integer'image(G_VALID_PCT) & "/" & integer'image(G_READY_PCT) & ": " & pass_fail(total_errors) & " (" & integer'image(error_count) & " chyb, " & integer'image(cycle_count + 1) & " taktu)";
        assert total_errors = 0 severity failure;
        std.env.stop;
        wait;
    end process;
end architecture;
