--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    tb_hsv_axil.vhd
-- Popis:     Test top-level IP hsv_axil (obě konfigurace): řízení přes AXI4-Lite jako C driver, pak stream
--
--  1. před ap_start nesmí jádro přijmout žádný pixel, ap_idle = 1,
--  2. ap_ctrl = 0x81 (start + auto_restart), stream G_FRAMES snímků proti golden modelu,
--  3. zpětné čtení ap_ctrl: auto_restart = 1, ap_idle = 0.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;

entity tb_hsv_axil is
    generic(
        G_RGB_TO_HSV : boolean  := true;
        G_USE_DSP    : boolean  := false;  -- předává se DUT (ověří, že konfigurace s DSP se elaboruje a počítá stejně)
        G_TEST       : natural  := 1;   -- 0 = 64x48, 1 = rampa 256x256
        G_FRAMES     : positive := 2;
        G_VALID_PCT  : natural  := 80;
        G_READY_PCT  : natural  := 80
    );
end entity;

architecture sim of tb_hsv_axil is
    constant C_PERIOD : time := 5 ns;

    function select_file(rgb_to_hsv : boolean; test : natural; is_golden : boolean) return string is
    begin
        if rgb_to_hsv then
            if test = 0 then
                if is_golden then
                    return "data/hsv_test.hex";
                end if;
                return "data/in_rgb.hex";
            end if;
            if is_golden then
                return "data/hsv_ramp.hex";
            end if;
            return "data/in_ramp.hex";
        end if;
        if test = 0 then
            if is_golden then
                return "data/rgb_from_hsv_test.hex";
            end if;
            return "data/hsv_test.hex";
        end if;
        if is_golden then
            return "data/rgb_from_hsv_ramp.hex";
        end if;
        return "data/in_hsv_ramp.hex";
    end function;
    function test_size(test : natural) return positive is
    begin
        if test = 0 then
            return 64;
        end if;
        return 256;
    end function;
    function test_height(test : natural) return positive is
    begin
        if test = 0 then
            return 48;
        end if;
        return 256;
    end function;
    function pass_fail(error_count : natural) return string is
    begin
        if error_count = 0 then
            return "PASS";
        end if;
        return "FAIL";
    end function;
    function direction_name(rgb_to_hsv : boolean) return string is
    begin
        if rgb_to_hsv then
            return "rgb2hsv";
        end if;
        return "hsv2rgb";
    end function;

    constant C_WIDTH  : positive := test_size(G_TEST);
    constant C_HEIGHT : positive := test_height(G_TEST);

    signal aclk    : std_logic := '0';
    signal aresetn : std_logic := '0';

    signal awaddr, araddr                                : std_logic_vector(7 downto 0)  := (others => '0');
    signal awvalid, wvalid, bready, arvalid, rready      : std_logic                     := '0';
    signal awready, wready, bvalid, arready, rvalid, irq : std_logic;
    signal wdata, rdata                                  : std_logic_vector(31 downto 0) := (others => '0');
    signal bresp, rresp                                  : std_logic_vector(1 downto 0);

    signal s_data, m_data                        : std_logic_vector(C_RGB_W - 1 downto 0);
    signal s_user, m_user                        : std_logic_vector(0 downto 0);
    signal s_last, s_valid, s_ready, source_done : std_logic;
    signal m_last, m_valid, m_ready, sink_done   : std_logic;
    signal error_count, cycle_count              : natural;
    signal started                               : boolean := false;
    signal control_errors                        : natural := 0;
    signal early_pixels                          : natural := 0;
begin
    aclk    <= not aclk after C_PERIOD / 2;
    aresetn <= '1' after 4 * C_PERIOD;

    -- AXI4-Lite master (ovladač)
    cpu : process
        variable error_total : natural := 0;
        variable read_value  : std_logic_vector(31 downto 0);
        procedure axil_write(addr : natural; data : integer) is
        begin
            awaddr  <= std_logic_vector(to_unsigned(addr, 8));
            wdata   <= std_logic_vector(to_signed(data, 32));
            awvalid <= '1';
            wvalid  <= '1';
            bready  <= '1';
            wait until rising_edge(aclk) and awready = '1';
            awvalid <= '0';
            if wready = '0' then
                wait until rising_edge(aclk) and wready = '1';
            end if;
            wvalid  <= '0';
            wait until rising_edge(aclk) and bvalid = '1';
            bready  <= '0';
        end procedure;
        procedure axil_read(addr : natural; result : out std_logic_vector(31 downto 0)) is
        begin
            araddr  <= std_logic_vector(to_unsigned(addr, 8));
            arvalid <= '1';
            rready  <= '1';
            wait until rising_edge(aclk) and arready = '1';
            arvalid <= '0';
            wait until rising_edge(aclk) and rvalid = '1';
            result  := rdata;
            rready  <= '0';
        end procedure;
    begin
        wait until rising_edge(aclk) and aresetn = '1';
        for k in 1 to 200 loop
            wait until rising_edge(aclk);
        end loop;
        axil_read(16#00#, read_value);
        if read_value(2) /= '1' then
            report "AXI-Lite: pred startem neni ap_idle" severity error;
            error_total := error_total + 1;
        end if;
        started        <= true;
        axil_write(16#00#, 16#81#);
        axil_read(16#00#, read_value);
        if (read_value(7) /= '1') or (read_value(2) /= '0') then
            report "AXI-Lite: po startu auto_restart/ap_idle nesouhlasi" severity error;
            error_total := error_total + 1;
        end if;
        control_errors <= error_total;
        wait;
    end process;

    early_monitor : process(aclk)
    begin
        if rising_edge(aclk) then
            if (not started) and (s_valid = '1') and (s_ready = '1') then
                early_pixels <= early_pixels + 1;
            end if;
        end if;
    end process;

    source : entity work.axis_file_source
        generic map(G_FILE      => select_file(G_RGB_TO_HSV, G_TEST, false), G_WIDTH => C_WIDTH, G_HEIGHT => C_HEIGHT,
                    G_FRAMES    => G_FRAMES, G_DATA_W => C_RGB_W, G_VALID_PCT => G_VALID_PCT, G_SEED => 31)
        port map(aclk     => aclk, aresetn => aresetn, m_tdata => s_data, m_tuser => s_user(0), m_tlast => s_last,
                 m_tvalid => s_valid, m_tready => s_ready, done => source_done);

    dut : entity work.hsv_axil
        generic map(G_RGB_TO_HSV => G_RGB_TO_HSV, G_USE_DSP => G_USE_DSP)
        port map(aclk                  => aclk, aresetn => aresetn,
                 s_axi_control_awaddr  => awaddr, s_axi_control_awvalid => awvalid, s_axi_control_awready => awready,
                 s_axi_control_wdata   => wdata, s_axi_control_wstrb => "1111", s_axi_control_wvalid => wvalid,
                 s_axi_control_wready  => wready, s_axi_control_bresp => bresp, s_axi_control_bvalid => bvalid,
                 s_axi_control_bready  => bready, s_axi_control_araddr => araddr, s_axi_control_arvalid => arvalid,
                 s_axi_control_arready => arready, s_axi_control_rdata => rdata, s_axi_control_rresp => rresp,
                 s_axi_control_rvalid  => rvalid, s_axi_control_rready => rready, interrupt => irq,
                 s_axis_video_tdata    => s_data, s_axis_video_tuser => s_user, s_axis_video_tlast => s_last,
                 s_axis_video_tvalid   => s_valid, s_axis_video_tready => s_ready,
                 m_axis_video_tdata    => m_data, m_axis_video_tuser => m_user, m_axis_video_tlast => m_last,
                 m_axis_video_tvalid   => m_valid, m_axis_video_tready => m_ready);

    sink : entity work.axis_file_sink
        generic map(G_FILE      => select_file(G_RGB_TO_HSV, G_TEST, true), G_WIDTH => C_WIDTH, G_HEIGHT => C_HEIGHT,
                    G_FRAMES    => G_FRAMES, G_DATA_W => C_RGB_W, G_READY_PCT => G_READY_PCT, G_SEED => 37,
                    G_NAME      => "hsv_axil")
        port map(aclk     => aclk, aresetn => aresetn, s_tdata => m_data, s_tuser => m_user(0), s_tlast => m_last,
                 s_tvalid => m_valid, s_tready => m_ready, errors => error_count, cycles => cycle_count,
                 done     => sink_done);

    check : process
        variable total_errors : natural;
    begin
        wait until sink_done = '1' for 50 ms;
        assert sink_done = '1' report "TIMEOUT: prijemce nedostal vsechny pixely" severity failure;
        if early_pixels /= 0 then
            report "Jadro prijalo " & integer'image(early_pixels) & " px pred ap_start" severity error;
        end if;
        total_errors := error_count + control_errors + early_pixels;
        report "VYSLEDEK hsv_axil " & direction_name(G_RGB_TO_HSV) & " test " & integer'image(G_TEST) & ": " & pass_fail(total_errors) & " (" & integer'image(error_count) & " chyb dat, " & integer'image(control_errors) & " chyb AXI-Lite, " & integer'image(early_pixels) & " px pred startem)";
        assert total_errors = 0 severity failure;
        std.env.stop;
        wait;
    end process;
end architecture;
