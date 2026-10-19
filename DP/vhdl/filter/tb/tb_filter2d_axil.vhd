--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    tb_filter2d_axil.vhd
-- Popis:     Test top-level IP filter2d_axil: konfigurace přes AXI4-Lite jako C driver
--
--  1. před ap_start nesmí jádro přijmout žádný pixel,
--  2. zápis width/height/border, scale/delta a K*K koeficientů ze souboru jádra golden modelu,
--     zpětné čtení koeficientu, GIE + IER(ap_done), ap_ctrl = 0x81,
--  3. stream G_FRAMES snímků proti golden modelu,
--  4. po snímku: přerušení, ISR(ap_done), status = 0, status_ap_vld (COR).
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use work.video_pkg.all;

entity tb_filter2d_axil is
    generic (
        G_K         : positive := 3;
        G_KERNEL    : string   := "sobel_x";
        G_REPLICATE : boolean  := true;
        G_FRAMES    : positive := 2;
        G_VALID_PCT : natural  := 80;
        G_READY_PCT : natural  := 80
    );
end entity;

architecture sim of tb_filter2d_axil is
    constant C_PERIOD : time := 5 ns;
    constant C_WIDTH  : positive := 64;
    constant C_HEIGHT : positive := 48;

    function border_name return string is
    begin
        if G_REPLICATE then return "replicate"; end if;
        return "constant";
    end function;
    function pass_fail(error_count : natural) return string is
    begin
        if error_count = 0 then return "PASS"; end if;
        return "FAIL";
    end function;

    signal aclk    : std_logic := '0';
    signal aresetn : std_logic := '0';

    constant C_ADDR_W : natural := filter_axil_addr_w(G_K);
    signal awaddr, araddr                           : std_logic_vector(C_ADDR_W - 1 downto 0) := (others => '0');
    signal awvalid, wvalid, bready, arvalid, rready : std_logic := '0';
    signal awready, wready, bvalid, arready, rvalid, irq : std_logic;
    signal wdata, rdata                             : std_logic_vector(31 downto 0) := (others => '0');
    signal wstrb                                    : std_logic_vector(3 downto 0) := "1111";
    signal bresp, rresp                             : std_logic_vector(1 downto 0);

    signal s_data, m_data         : std_logic_vector(C_PIX_W - 1 downto 0);
    signal s_user, m_user         : std_logic_vector(0 downto 0);
    signal s_last, s_valid, s_ready, source_done : std_logic;
    signal m_last, m_valid, m_ready, sink_done   : std_logic;
    signal error_count, cycle_count : natural;
    signal started        : boolean := false;
    signal control_errors : natural := 0;
    signal early_pixels   : natural := 0;
    signal irq_seen       : boolean := false;
    signal cpu_done       : boolean := false;
begin
    aclk    <= not aclk after C_PERIOD / 2;
    aresetn <= '1' after 4 * C_PERIOD;

    cpu : process
        variable error_total : natural := 0;
        variable read_value  : std_logic_vector(31 downto 0);
        procedure axil_write(addr : natural; data : integer; strobe : std_logic_vector(3 downto 0) := "1111") is
        begin
            awaddr  <= std_logic_vector(to_unsigned(addr, C_ADDR_W));
            wdata   <= std_logic_vector(to_signed(data, 32));
            wstrb   <= strobe;
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
        variable border_value : integer;
        file kernel_file      : text;
        variable text_line    : line;
        variable kernel_value : integer;
        variable first_coeff  : integer;
        constant C_STATUS_ADDR : natural := filter_status_addr(G_K);
        variable byte_lane    : natural;
        variable first_word   : std_logic_vector(31 downto 0) := (others => '0');
    begin
        wait until rising_edge(aclk) and aresetn = '1';
        for k in 1 to 200 loop
            wait until rising_edge(aclk);
        end loop;
        border_value := 0;
        if G_REPLICATE then
            border_value := 1;
        end if;
        axil_write(16#10#, C_WIDTH);
        axil_write(16#18#, C_HEIGHT);
        axil_write(16#20#, border_value);
        -- jádro ze souboru golden modelu: "K scale delta" + K řádků koeficientů
        file_open(kernel_file, "data/filter_" & G_KERNEL & "_64x48_" & border_name & "_kernel.txt", read_mode);
        readline(kernel_file, text_line);
        read(text_line, kernel_value);
        expect(kernel_value = G_K, "K v souboru jadra");
        read(text_line, kernel_value);
        axil_write(16#28#, kernel_value);       -- scale
        read(text_line, kernel_value);
        axil_write(16#30#, kernel_value);       -- delta
        for tap in 0 to G_K * G_K - 1 loop
            if (tap mod G_K) = 0 then
                readline(kernel_file, text_line);
            end if;
            read(text_line, kernel_value);
            if tap = 0 then
                first_coeff := kernel_value;
            end if;
            if filter_coeff_in_memory(G_K) then
                -- okno coeff: zápis po bajtech (WSTRB = jeden bajt), 4 koeficienty ve slově
                byte_lane := tap mod 4;
                if tap < 4 then
                    first_word(8 * byte_lane + 7 downto 8 * byte_lane) := std_logic_vector(to_signed(kernel_value, 8));
                end if;
                axil_write(filter_coeff_mem_base(G_K) + 4 * (tap / 4), kernel_value * (2 ** (8 * byte_lane)),
                           std_logic_vector(shift_left(to_unsigned(1, 4), byte_lane)));
            else
                axil_write(16#38# + 8 * tap, kernel_value);
            end if;
        end loop;
        file_close(kernel_file);
        axil_read(16#10#, read_value);
        expect(unsigned(read_value) = C_WIDTH, "zpetne cteni width");
        if filter_coeff_in_memory(G_K) then
            axil_read(filter_coeff_mem_base(G_K), read_value);
            expect(read_value = first_word, "zpetne cteni slova 0 okna coeff");
        else
            axil_read(16#38#, read_value);
            expect(signed(read_value(7 downto 0)) = first_coeff, "zpetne cteni coeff[0]");
        end if;
        axil_read(16#00#, read_value);
        expect(read_value(2) = '1', "pred startem neni ap_idle");
        axil_write(16#04#, 1);                  -- GIE
        axil_write(16#08#, 1);                  -- IER: ap_done
        started <= true;
        axil_write(16#00#, 16#81#);             -- ap_start + auto_restart
        -- po prvním snímku
        wait until irq = '1' for 5 ms;
        expect(irq = '1', "po snimku nebylo preruseni");
        axil_read(16#0C#, read_value);
        expect(read_value(0) = '1', "ISR ap_done neni nastaveny");
        axil_write(16#0C#, 1);                  -- TOW: smazat ap_done v ISR
        axil_read(16#0C#, read_value);
        expect(read_value(0) = '0', "ISR ap_done se nesmazal");
        axil_read(C_STATUS_ADDR + 4, read_value);
        expect(read_value(0) = '1', "status_ap_vld neni nastaveny");
        axil_read(C_STATUS_ADDR + 4, read_value);
        expect(read_value(0) = '0', "status_ap_vld neni COR");
        axil_read(C_STATUS_ADDR, read_value);
        expect(unsigned(read_value) = 0, "status po bezchybnem snimku neni 0");
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

    dut : entity work.filter2d_axil
        generic map (G_K => G_K)
        port map (aclk => aclk, aresetn => aresetn,
                  s_axi_control_awaddr => awaddr, s_axi_control_awvalid => awvalid, s_axi_control_awready => awready,
                  s_axi_control_wdata => wdata, s_axi_control_wstrb => wstrb, s_axi_control_wvalid => wvalid,
                  s_axi_control_wready => wready, s_axi_control_bresp => bresp, s_axi_control_bvalid => bvalid,
                  s_axi_control_bready => bready, s_axi_control_araddr => araddr, s_axi_control_arvalid => arvalid,
                  s_axi_control_arready => arready, s_axi_control_rdata => rdata, s_axi_control_rresp => rresp,
                  s_axi_control_rvalid => rvalid, s_axi_control_rready => rready, interrupt => irq,
                  s_axis_video_tdata => s_data, s_axis_video_tuser => s_user, s_axis_video_tlast => s_last,
                  s_axis_video_tvalid => s_valid, s_axis_video_tready => s_ready,
                  m_axis_video_tdata => m_data, m_axis_video_tuser => m_user, m_axis_video_tlast => m_last,
                  m_axis_video_tvalid => m_valid, m_axis_video_tready => m_ready);

    sink : entity work.axis_file_sink
        generic map (G_FILE => "data/filter_" & G_KERNEL & "_64x48_" & border_name & ".hex", G_WIDTH => C_WIDTH, G_HEIGHT => C_HEIGHT,
                     G_FRAMES => G_FRAMES, G_DATA_W => C_PIX_W, G_READY_PCT => G_READY_PCT, G_SEED => 53,
                     G_NAME => "filter2d_axil")
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
        report "VYSLEDEK filter2d_axil " & G_KERNEL & " " & border_name & ": " & pass_fail(total_errors) & " ("
            & integer'image(error_count) & " chyb dat, " & integer'image(control_errors) & " chyb AXI-Lite, "
            & integer'image(early_pixels) & " px pred startem)";
        assert total_errors = 0 severity failure;
        std.env.stop;
        wait;
    end process;
end architecture;
