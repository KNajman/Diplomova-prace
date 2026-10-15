--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    tb_csc_axil.vhd
-- Popis:     Test top-level IP csc_axil: konfigurace přes AXI4-Lite jako C driver, pak stream
--
--  1. před ap_start nesmí jádro přijmout žádný pixel (TREADY = 0),
--  2. zápis koeficientů na adresy podle varianty (mapa HLS), zpětné čtení c00 a o0,
--  3. ap_ctrl = 0x81 (start + auto_restart), stream G_FRAMES snímků proti golden modelu.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;
use work.imgproc_coeffs_pkg.all;

entity tb_csc_axil is
    generic (
        G_PRESET    : natural  := 1;
        G_WIDTH     : positive := 64;
        G_HEIGHT    : positive := 48;
        G_FRAMES    : positive := 2;
        G_VALID_PCT : natural  := 80;
        G_READY_PCT : natural  := 80
    );
end entity;

architecture sim of tb_csc_axil is
    constant C_PERIOD : time := 5 ns;

    function ch_in(p : natural) return positive is begin if p = 5 then return 1; end if; return 3; end function;
    function ch_out(p : natural) return positive is begin if p = 0 then return 1; end if; return 3; end function;
    function in_file(p : natural) return string is
    begin
        if p = 5 then return "data/in_gray.hex"; end if;
        return "data/in_rgb.hex";
    end function;
    function exp_file(p : natural) return string is
    begin
        case p is
            when 0      => return "data/csc_rgb_to_gray_bt601.hex";
            when 1      => return "data/csc_rgb_to_ycbcr_bt601_full.hex";
            when 2      => return "data/csc_rgb_to_ycbcr_bt709_full.hex";
            when 3      => return "data/csc_rgb_to_ycbcr_bt601_studio.hex";
            when 4      => return "data/csc_rgb_to_ycbcr_bt709_studio.hex";
            when others => return "data/csc_gray_to_rgb.hex";
        end case;
    end function;
    function sel_coeff(p : natural) return t_csc_coeff is
    begin
        case p is
            when 0      => return C_CSC_RGB_TO_GRAY_BT601_COEFF;
            when 1      => return C_CSC_RGB_TO_YCBCR_BT601_FULL_COEFF;
            when 2      => return C_CSC_RGB_TO_YCBCR_BT709_FULL_COEFF;
            when 3      => return C_CSC_RGB_TO_YCBCR_BT601_STUDIO_COEFF;
            when 4      => return C_CSC_RGB_TO_YCBCR_BT709_STUDIO_COEFF;
            when others => return C_CSC_GRAY_TO_RGB_COEFF;
        end case;
    end function;
    function sel_offset(p : natural) return t_csc_offset is
    begin
        case p is
            when 0      => return C_CSC_RGB_TO_GRAY_BT601_OFFSET;
            when 1      => return C_CSC_RGB_TO_YCBCR_BT601_FULL_OFFSET;
            when 2      => return C_CSC_RGB_TO_YCBCR_BT709_FULL_OFFSET;
            when 3      => return C_CSC_RGB_TO_YCBCR_BT601_STUDIO_OFFSET;
            when 4      => return C_CSC_RGB_TO_YCBCR_BT709_STUDIO_OFFSET;
            when others => return C_CSC_GRAY_TO_RGB_OFFSET;
        end case;
    end function;
    function pass_fail(n : natural) return string is begin if n = 0 then return "PASS"; end if; return "FAIL"; end function;

    constant C_CI : positive := ch_in(G_PRESET);
    constant C_CO : positive := ch_out(G_PRESET);
    constant C_M  : t_csc_coeff  := sel_coeff(G_PRESET);
    constant C_O  : t_csc_offset := sel_offset(G_PRESET);

    signal aclk    : std_logic := '0';
    signal aresetn : std_logic := '0';

    signal awaddr, araddr : std_logic_vector(7 downto 0) := (others => '0');
    signal awvalid, wvalid, bready, arvalid, rready : std_logic := '0';
    signal awready, wready, bvalid, arready, rvalid, irq : std_logic;
    signal wdata, rdata : std_logic_vector(31 downto 0) := (others => '0');
    signal bresp, rresp : std_logic_vector(1 downto 0);

    signal s_data : std_logic_vector(C_CI * C_PIX_W - 1 downto 0);
    signal m_data : std_logic_vector(C_CO * C_PIX_W - 1 downto 0);
    signal s_user, m_user : std_logic_vector(0 downto 0);
    signal s_last, s_valid, s_ready, src_done : std_logic;
    signal m_last, m_valid, m_ready, snk_done : std_logic;
    signal errors, cycles : natural;
    signal started  : boolean := false;
    signal cfg_err  : natural := 0;
    signal early    : natural := 0;
begin
    aclk <= not aclk after C_PERIOD / 2;
    aresetn <= '1' after 4 * C_PERIOD;

    -- AXI4-Lite master (ovladač)
    cpu : process
        variable n_err : natural := 0;
        procedure wr(addr : natural; data : integer) is
        begin
            awaddr <= std_logic_vector(to_unsigned(addr, 8));
            wdata  <= std_logic_vector(to_signed(data, 32));
            awvalid <= '1'; wvalid <= '1'; bready <= '1';
            wait until rising_edge(aclk) and awready = '1';
            awvalid <= '0';
            if wready = '0' then wait until rising_edge(aclk) and wready = '1'; end if;
            wvalid <= '0';
            wait until rising_edge(aclk) and bvalid = '1';
            bready <= '0';
        end procedure;
        procedure rd(addr : natural; result : out std_logic_vector(31 downto 0)) is
        begin
            araddr <= std_logic_vector(to_unsigned(addr, 8));
            arvalid <= '1'; rready <= '1';
            wait until rising_edge(aclk) and arready = '1';
            arvalid <= '0';
            wait until rising_edge(aclk) and rvalid = '1';
            result := rdata;
            rready <= '0';
        end procedure;
        variable r : std_logic_vector(31 downto 0);
        variable a : natural;
    begin
        wait until rising_edge(aclk) and aresetn = '1';
        for k in 1 to 200 loop                  -- jádro stojí, zdroj už nabízí data
            wait until rising_edge(aclk);
        end loop;
        a := 16#10#;
        if (C_CI = 3) and (C_CO = 3) then
            for o in 0 to 2 loop for i in 0 to 2 loop wr(a, C_M(o, i)); a := a + 8; end loop; end loop;
            for o in 0 to 2 loop wr(a, C_O(o)); a := a + 8; end loop;
        elsif C_CO = 1 then
            for i in 0 to 2 loop wr(a, C_M(0, i)); a := a + 8; end loop;
            wr(a, C_O(0));
        else
            for o in 0 to 2 loop wr(a, C_M(o, 0)); a := a + 8; end loop;
            for o in 0 to 2 loop wr(a, C_O(o)); a := a + 8; end loop;
        end if;
        rd(16#10#, r);
        if signed(r(17 downto 0)) /= C_M(0, 0) then
            report "AXI-Lite: zpetne cteni c00 nesouhlasi" severity error; n_err := n_err + 1;
        end if;
        rd(16#00#, r);
        if r(2) /= '1' then
            report "AXI-Lite: pred startem neni ap_idle" severity error; n_err := n_err + 1;
        end if;
        cfg_err <= n_err;
        started <= true;                        -- od zápisu 0x81 smí jádro přijímat
        wr(16#00#, 16#81#);                     -- ap_start + auto_restart
        wait;
    end process;

    -- Před startem nesmí projít žádný pixel
    early_mon : process (aclk)
    begin
        if rising_edge(aclk) then
            if (not started) and (s_valid = '1') and (s_ready = '1') then
                early <= early + 1;
            end if;
        end if;
    end process;

    src : entity work.axis_file_source
        generic map (G_FILE => in_file(G_PRESET), G_WIDTH => G_WIDTH, G_HEIGHT => G_HEIGHT, G_FRAMES => G_FRAMES,
                     G_DATA_W => C_CI * C_PIX_W, G_VALID_PCT => G_VALID_PCT, G_SEED => 5 + G_PRESET)
        port map (aclk => aclk, aresetn => aresetn, m_tdata => s_data, m_tuser => s_user(0), m_tlast => s_last,
                  m_tvalid => s_valid, m_tready => s_ready, done => src_done);

    dut : entity work.csc_axil
        generic map (G_CH_IN => C_CI, G_CH_OUT => C_CO)
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

    snk : entity work.axis_file_sink
        generic map (G_FILE => exp_file(G_PRESET), G_WIDTH => G_WIDTH, G_HEIGHT => G_HEIGHT, G_FRAMES => G_FRAMES,
                     G_DATA_W => C_CO * C_PIX_W, G_READY_PCT => G_READY_PCT, G_SEED => 29 + G_PRESET,
                     G_NAME => "csc_axil")
        port map (aclk => aclk, aresetn => aresetn, s_tdata => m_data, s_tuser => m_user(0), s_tlast => m_last,
                  s_tvalid => m_valid, s_tready => m_ready, errors => errors, cycles => cycles, done => snk_done);

    check : process
        variable total : natural;
    begin
        wait until snk_done = '1' for 10 ms;
        assert snk_done = '1' report "TIMEOUT: prijemce nedostal vsechny pixely" severity failure;
        if early /= 0 then
            report "Jadro prijalo " & integer'image(early) & " px pred ap_start" severity error;
        end if;
        total := errors + cfg_err + early;
        report "VYSLEDEK csc_axil preset " & integer'image(G_PRESET) & ": " & pass_fail(total) & " ("
            & integer'image(errors) & " chyb dat, " & integer'image(cfg_err) & " chyb AXI-Lite, "
            & integer'image(early) & " px pred startem)";
        assert total = 0 severity failure;
        std.env.stop;
        wait;
    end process;
end architecture;
