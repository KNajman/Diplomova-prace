--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    tb_axis_skid_buffer.vhd
-- Popis:     Test skid bufferu a zároveň generického testbenche (zdroj -> DUT -> příjemce)
--
--  Spouští se s různými G_VALID_PCT / G_READY_PCT (viz scripts/run_ghdl.sh):
--   100/100 = propustnost musí být 1 pixel za takt, 50/50 a 90/30 = náhodné mezery
--   a backpressure, data i TUSER/TLAST se nesmí ztratit ani zdvojit.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_axis_skid_buffer is
    generic (
        G_FILE      : string   := "data/rand_16x8_rgb.hex";
        G_WIDTH     : positive := 16;
        G_HEIGHT    : positive := 8;
        G_FRAMES    : positive := 3;
        G_VALID_PCT : natural  := 100;
        G_READY_PCT : natural  := 100
    );
end entity;

architecture sim of tb_axis_skid_buffer is
    function pass_fail(n : natural) return string is
    begin
        if n = 0 then
            return "PASS";
        end if;
        return "FAIL";
    end function;
    constant C_PERIOD : time := 5 ns;
    constant C_DW     : natural := 24;

    signal aclk    : std_logic := '0';
    signal aresetn : std_logic := '0';

    signal src_data                                           : std_logic_vector(C_DW - 1 downto 0);
    signal src_user, src_last, src_valid, src_ready, src_done : std_logic;
    signal dut_in, dut_out                                    : std_logic_vector(C_DW + 1 downto 0);
    signal snk_valid, snk_ready, snk_done                     : std_logic;
    signal errors, cycles                                     : natural;
begin
    aclk <= not aclk after C_PERIOD / 2;
    aresetn <= '1' after 4 * C_PERIOD;

    src : entity work.axis_file_source
        generic map (G_FILE => G_FILE, G_WIDTH => G_WIDTH, G_HEIGHT => G_HEIGHT, G_FRAMES => G_FRAMES,
                     G_DATA_W => C_DW, G_VALID_PCT => G_VALID_PCT, G_SEED => 11)
        port map (aclk => aclk, aresetn => aresetn, m_tdata => src_data, m_tuser => src_user,
                  m_tlast => src_last, m_tvalid => src_valid, m_tready => src_ready, done => src_done);

    dut_in <= src_last & src_user & src_data;

    dut : entity work.axis_skid_buffer
        generic map (G_DATA_W => C_DW + 2)
        port map (aclk => aclk, aresetn => aresetn, s_data => dut_in, s_valid => src_valid, s_ready => src_ready,
                  m_data => dut_out, m_valid => snk_valid, m_ready => snk_ready);

    snk : entity work.axis_file_sink
        generic map (G_FILE => G_FILE, G_WIDTH => G_WIDTH, G_HEIGHT => G_HEIGHT, G_FRAMES => G_FRAMES,
                     G_DATA_W => C_DW, G_READY_PCT => G_READY_PCT, G_SEED => 23, G_NAME => "skid")
        port map (aclk => aclk, aresetn => aresetn, s_tdata => dut_out(C_DW - 1 downto 0),
                  s_tuser => dut_out(C_DW), s_tlast => dut_out(C_DW + 1), s_tvalid => snk_valid,
                  s_tready => snk_ready, errors => errors, cycles => cycles, done => snk_done);

    check : process
        constant C_PIXELS : natural := G_WIDTH * G_HEIGHT * G_FRAMES;
    begin
        wait until snk_done = '1' for 1 ms;
        assert snk_done = '1' report "TIMEOUT: prijemce nedostal vsechny pixely" severity failure;
        if (G_VALID_PCT = 100) and (G_READY_PCT = 100) then
            -- Plná propustnost: mezi prvním a posledním pixelem žádná bublina
            assert cycles = C_PIXELS - 1
                report "Propustnost: " & integer'image(cycles) & " taktu na " & integer'image(C_PIXELS) & " px"
                severity error;
        end if;
        report "VYSLEDEK " & integer'image(G_VALID_PCT) & "/" & integer'image(G_READY_PCT) & ": "
            & pass_fail(errors) & " (" & integer'image(errors) & " chyb, "
            & integer'image(C_PIXELS) & " px, " & integer'image(cycles + 1) & " taktu)";
        assert errors = 0 severity failure;
        std.env.stop;
        wait;
    end process;
end architecture;
