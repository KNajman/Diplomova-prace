--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    tb_threshold_axil.vhd
-- Popis:     Test top-level IP threshold_axil: konfigurace a řízení přes AXI4-Lite jako C driver
--
--  1. před ap_start nesmí jádro přijmout žádný pixel,
--  2. zápis thresh/maxval/type (BINARY, Otsuův práh 108 šedého obrazu), zpětné čtení, ap_ctrl = 0x81,
--  3. stream G_FRAMES snímků proti golden modelu,
--  4. registr type má jen 3 platné bity (zápis 0xFF se čte jako 7), obnovení na 0.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;

entity tb_threshold_axil is
    generic (
        G_FRAMES    : positive := 2;
        G_VALID_PCT : natural  := 80;
        G_READY_PCT : natural  := 80
    );
end entity;

architecture sim of tb_threshold_axil is
    constant C_PERIOD : time := 5 ns;
    constant C_WIDTH  : positive := 64;
    constant C_HEIGHT : positive := 48;

    constant C_ADDR_W : natural := axil_addr_w(C_THRESH_NUM_REGS);
    function pass_fail(error_count : natural) return string is
    begin
        if error_count = 0 then return "PASS"; end if;
        return "FAIL";
    end function;

    signal aclk    : std_logic := '0';
    signal aresetn : std_logic := '0';

    signal awaddr, araddr                           : std_logic_vector(C_ADDR_W - 1 downto 0) := (others => '0');
    signal awvalid, wvalid, bready, arvalid, rready : std_logic := '0';
    signal awready, wready, bvalid, arready, rvalid, irq : std_logic;
    signal wdata, rdata                             : std_logic_vector(31 downto 0) := (others => '0');
    signal bresp, rresp                             : std_logic_vector(1 downto 0);

    signal s_data, m_data         : std_logic_vector(C_PIX_W - 1 downto 0);
    signal s_user, m_user         : std_logic_vector(0 downto 0);
    signal s_last, s_valid, s_ready, source_done : std_logic;
    signal m_last, m_valid, m_ready, sink_done   : std_logic;
    signal error_count, cycle_count : natural;
    signal started        : boolean := false;
    signal control_errors : natural := 0;
    signal early_pixels   : natural := 0;
    signal cpu_done       : boolean := false;
begin
    aclk    <= not aclk after C_PERIOD / 2;
    aresetn <= '1' after 4 * C_PERIOD;

    cpu : process
        variable error_total : natural := 0;
        variable read_value  : std_logic_vector(31 downto 0);
        procedure axil_write(addr : natural; data : integer) is
        begin
            awaddr  <= std_logic_vector(to_unsigned(addr, C_ADDR_W));
            wdata   <= std_logic_vector(to_signed(data, 32));
            awvalid <= '1'; wvalid <= '1'; bready <= '1';
            wait until rising_edge(aclk) and awready = '1';
            awvalid <= '0';
            if wready = '0' then
                wait until rising_edge(aclk) and wready = '1';
            end if;
            wvalid <= '0';
            wait until rising_edge(aclk) and bvalid = '1';
            bready <= '0';
        end procedure;
        procedure axil_read(addr : natural; result : out std_logic_vector(31 downto 0)) is
        begin
            araddr  <= std_logic_vector(to_unsigned(addr, C_ADDR_W));
            arvalid <= '1'; rready <= '1';
            wait until rising_edge(aclk) and arready = '1';
            arvalid <= '0';
            wait until rising_edge(aclk) and rvalid = '1';
            result := rdata;
            rready <= '0';
        end procedure;
        procedure expect(condition : boolean; message : string) is
        begin
            if not condition then
                report "AXI-Lite: " & message severity error;
                error_total := error_total + 1;
            end if;
        end procedure;
    begin
        wait until rising_edge(aclk) and aresetn = '1';
        for k in 1 to 200 loop
            wait until rising_edge(aclk);
        end loop;
        axil_write(16#20#, 16#FF#);
        axil_read(16#20#, read_value);
        expect(unsigned(read_value) = 7, "type ma mit jen 3 platne bity");
        axil_write(16#10#, 108);                -- thresh (Otsu)
        axil_write(16#18#, 255);                -- maxval
        axil_write(16#20#, C_THRESH_BINARY);    -- type
        axil_read(16#10#, read_value);
        expect(unsigned(read_value) = 108, "zpetne cteni thresh");
        axil_read(16#18#, read_value);
        expect(unsigned(read_value) = 255, "zpetne cteni maxval");
        axil_read(16#00#, read_value);
        expect(read_value(2) = '1', "pred startem neni ap_idle");
        started <= true;
        axil_write(16#00#, 16#81#);             -- ap_start + auto_restart
        control_errors <= error_total;
        cpu_done <= true;
        wait;
    end process;

    early_monitor : process (aclk)
    begin
        if rising_edge(aclk) then
            if (not started) and (s_valid = '1') and (s_ready = '1') then
                early_pixels <= early_pixels + 1;
            end if;
        end if;
    end process;

    source : entity work.axis_file_source
        generic map (G_FILE => "data/in_gray_64x48.hex", G_WIDTH => C_WIDTH, G_HEIGHT => C_HEIGHT,
                     G_FRAMES => G_FRAMES, G_DATA_W => C_PIX_W, G_VALID_PCT => G_VALID_PCT, G_SEED => 51)
        port map (aclk => aclk, aresetn => aresetn, m_tdata => s_data, m_tuser => s_user(0), m_tlast => s_last,
                  m_tvalid => s_valid, m_tready => s_ready, done => source_done);

    dut : entity work.threshold_axil
        port map (aclk => aclk, aresetn => aresetn,
                  s_axi_control_awaddr => awaddr, s_axi_control_awvalid => awvalid, s_axi_control_awready => awready,
                  s_axi_control_wdata => wdata, s_axi_control_wstrb => "1111", s_axi_control_wvalid => wvalid,
                  s_axi_control_wready => wready, s_axi_control_bresp => bresp, s_axi_control_bvalid => bvalid,
                  s_axi_control_bready => bready, s_axi_control_araddr => araddr, s_axi_control_arvalid => arvalid,
                  s_axi_control_arready => arready, s_axi_control_rdata => rdata, s_axi_control_rresp => rresp,
                  s_axi_control_rvalid => rvalid, s_axi_control_rready => rready, interrupt => irq,
                  s_axis_video_tdata => s_data, s_axis_video_tuser => s_user, s_axis_video_tlast => s_last,
                  s_axis_video_tvalid => s_valid, s_axis_video_tready => s_ready,
                  m_axis_video_tdata => m_data, m_axis_video_tuser => m_user, m_axis_video_tlast => m_last,
                  m_axis_video_tvalid => m_valid, m_axis_video_tready => m_ready);

    sink : entity work.axis_file_sink
        generic map (G_FILE => "data/thresh_gray_64x48_t0_108_255.hex", G_WIDTH => C_WIDTH, G_HEIGHT => C_HEIGHT,
                     G_FRAMES => G_FRAMES, G_DATA_W => C_PIX_W, G_READY_PCT => G_READY_PCT, G_SEED => 53,
                     G_NAME => "threshold_axil")
        port map (aclk => aclk, aresetn => aresetn, s_tdata => m_data, s_tuser => m_user(0), s_tlast => m_last,
                  s_tvalid => m_valid, s_tready => m_ready, errors => error_count, cycles => cycle_count,
                  done => sink_done);

    check : process
        variable total_errors : natural;
    begin
        wait until sink_done = '1' for 20 ms;
        assert sink_done = '1' report "TIMEOUT: prijemce nedostal vsechny pixely" severity failure;
        if not cpu_done then
            wait until cpu_done for 1 ms;
        end if;
        if early_pixels /= 0 then
            report "Jadro prijalo " & integer'image(early_pixels) & " px pred ap_start" severity error;
        end if;
        total_errors := error_count + control_errors + early_pixels;
        if not cpu_done then
            total_errors := total_errors + 1;
        end if;
        report "VYSLEDEK threshold_axil: " & pass_fail(total_errors) & " ("
            & integer'image(error_count) & " chyb dat, " & integer'image(control_errors) & " chyb AXI-Lite, "
            & integer'image(early_pixels) & " px pred startem)";
        assert total_errors = 0 severity failure;
        std.env.stop;
        wait;
    end process;
end architecture;
