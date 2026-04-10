library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dtypes_p.all;
use work.AXITest.all;

entity axi_video_tb is
end entity axi_video_tb;

architecture RTL of axi_video_tb is
    constant C_MAX_LINE_WIDTH       : integer := 2048;
    constant C_S00_AXI_DATA_WIDTH   : integer := 32;
    constant C_S00_AXI_ADDR_WIDTH   : integer := 6;
    constant C_M00_AXI_ID_WIDTH     : integer := 1;
    constant C_M00_AXI_ADDR_WIDTH   : integer := 32;
    constant C_M00_AXI_DATA_WIDTH   : integer := 32;
    constant C_M00_AXI_BURST_LEN    : integer := 8;
    constant C_M00_AXI_AWUSER_WIDTH : integer := 1;
    constant C_M00_AXI_ARUSER_WIDTH : integer := 1;
    constant C_M00_AXI_WUSER_WIDTH  : integer := 1;
    constant C_M00_AXI_RUSER_WIDTH  : integer := 1;
    constant C_M00_AXI_BUSER_WIDTH  : integer := 1;

    constant VCLK_P     : time      := 40 ns;
    signal video_clk    : std_logic := '0';
    signal video_red    : std_logic_vector(7 downto 0);
    signal video_green  : std_logic_vector(7 downto 0);
    signal video_blue   : std_logic_vector(7 downto 0);
    signal video_hsync  : std_logic;
    signal video_vsync  : std_logic;
    signal video_active : std_logic;

    constant CLK_P : time      := 10 ns;
    signal clk     : std_logic := '0';

    signal s00_axi_aresetn : std_logic;
    signal s00_axi_awaddr  : std_logic_vector(C_S00_AXI_ADDR_WIDTH - 1 downto 0);
    signal s00_axi_awprot  : std_logic_vector(2 downto 0);
    signal s00_axi_awvalid : std_logic;
    signal s00_axi_awready : std_logic;
    signal s00_axi_wdata   : std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    signal s00_axi_wstrb   : std_logic_vector((C_S00_AXI_DATA_WIDTH / 8) - 1 downto 0);
    signal s00_axi_wvalid  : std_logic;
    signal s00_axi_wready  : std_logic;
    signal s00_axi_bresp   : std_logic_vector(1 downto 0);
    signal s00_axi_bvalid  : std_logic;
    signal s00_axi_bready  : std_logic;
    signal s00_axi_araddr  : std_logic_vector(C_S00_AXI_ADDR_WIDTH - 1 downto 0);
    signal s00_axi_arprot  : std_logic_vector(2 downto 0);
    signal s00_axi_arvalid : std_logic;
    signal s00_axi_arready : std_logic;
    signal s00_axi_rdata   : std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    signal s00_axi_rresp   : std_logic_vector(1 downto 0);
    signal s00_axi_rvalid  : std_logic;
    signal s00_axi_rready  : std_logic;

    signal m00_axi_aresetn : std_logic := '0';
    signal m00_axi_awid    : std_logic_vector(C_M00_AXI_ID_WIDTH - 1 downto 0);
    signal m00_axi_awaddr  : std_logic_vector(C_M00_AXI_ADDR_WIDTH - 1 downto 0);
    signal m00_axi_awlen   : std_logic_vector(7 downto 0);
    signal m00_axi_awsize  : std_logic_vector(2 downto 0);
    signal m00_axi_awburst : std_logic_vector(1 downto 0);
    signal m00_axi_awlock  : std_logic;
    signal m00_axi_awcache : std_logic_vector(3 downto 0);
    signal m00_axi_awprot  : std_logic_vector(2 downto 0);
    signal m00_axi_awqos   : std_logic_vector(3 downto 0);
    signal m00_axi_awuser  : std_logic_vector(C_M00_AXI_AWUSER_WIDTH - 1 downto 0);
    signal m00_axi_awvalid : std_logic;
    signal m00_axi_awready : std_logic;
    signal m00_axi_wdata   : std_logic_vector(C_M00_AXI_DATA_WIDTH - 1 downto 0);
    signal m00_axi_wstrb   : std_logic_vector(C_M00_AXI_DATA_WIDTH / 8 - 1 downto 0);
    signal m00_axi_wlast   : std_logic;
    signal m00_axi_wuser   : std_logic_vector(C_M00_AXI_WUSER_WIDTH - 1 downto 0);
    signal m00_axi_wvalid  : std_logic;
    signal m00_axi_wready  : std_logic;
    signal m00_axi_bid     : std_logic_vector(C_M00_AXI_ID_WIDTH - 1 downto 0);
    signal m00_axi_bresp   : std_logic_vector(1 downto 0);
    signal m00_axi_buser   : std_logic_vector(C_M00_AXI_BUSER_WIDTH - 1 downto 0);
    signal m00_axi_bvalid  : std_logic;
    signal m00_axi_bready  : std_logic;
    signal m00_axi_arid    : std_logic_vector(C_M00_AXI_ID_WIDTH - 1 downto 0);
    signal m00_axi_araddr  : std_logic_vector(C_M00_AXI_ADDR_WIDTH - 1 downto 0);
    signal m00_axi_arlen   : std_logic_vector(7 downto 0);
    signal m00_axi_arsize  : std_logic_vector(2 downto 0);
    signal m00_axi_arburst : std_logic_vector(1 downto 0);
    signal m00_axi_arlock  : std_logic;
    signal m00_axi_arcache : std_logic_vector(3 downto 0);
    signal m00_axi_arprot  : std_logic_vector(2 downto 0);
    signal m00_axi_arqos   : std_logic_vector(3 downto 0);
    signal m00_axi_aruser  : std_logic_vector(C_M00_AXI_ARUSER_WIDTH - 1 downto 0);
    signal m00_axi_arvalid : std_logic;
    signal m00_axi_arready : std_logic;
    signal m00_axi_rid     : std_logic_vector(C_M00_AXI_ID_WIDTH - 1 downto 0);
    signal m00_axi_rdata   : std_logic_vector(C_M00_AXI_DATA_WIDTH - 1 downto 0);
    signal m00_axi_rresp   : std_logic_vector(1 downto 0);
    signal m00_axi_rlast   : std_logic;
    signal m00_axi_ruser   : std_logic_vector(C_M00_AXI_RUSER_WIDTH - 1 downto 0);
    signal m00_axi_rvalid  : std_logic;
    signal m00_axi_rready  : std_logic;

    signal alm_addr : integer;
    signal alm_din  : unsigned(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    signal alm_dout : unsigned(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    signal alm_wrun : std_logic := '0';
    signal alm_rrun : std_logic := '0';
    signal alm_busy : std_logic;
    signal alm_done : std_logic;

    constant C_VIDEO_DIM    : integer   := 10;
    constant video_data_RAM : databuf_t := fill_increment(C_VIDEO_DIM * C_VIDEO_DIM, C_M00_AXI_DATA_WIDTH);

begin

    clk       <= not clk after CLK_P / 2;
    video_clk <= not video_clk after VCLK_P / 2;

    ALM_inst : AXILiteMaster
        generic map(
            C_M_AXI_ADDR_WIDTH => C_S00_AXI_ADDR_WIDTH,
            C_M_AXI_DATA_WIDTH => C_S00_AXI_DATA_WIDTH
        )
        port map(
            addr          => alm_addr,
            din           => alm_din,
            dout          => alm_dout,
            wrun          => alm_wrun,
            rrun          => alm_rrun,
            busy          => alm_busy,
            done          => alm_done,
            m_axi_clk     => clk,
            m_axi_aresetn => s00_axi_aresetn,
            m_axi_awaddr  => s00_axi_awaddr,
            m_axi_awprot  => s00_axi_awprot,
            m_axi_awvalid => s00_axi_awvalid,
            m_axi_awready => s00_axi_awready,
            m_axi_wdata   => s00_axi_wdata,
            m_axi_wstrb   => s00_axi_wstrb,
            m_axi_wvalid  => s00_axi_wvalid,
            m_axi_wready  => s00_axi_wready,
            m_axi_bresp   => s00_axi_bresp,
            m_axi_bvalid  => s00_axi_bvalid,
            m_axi_bready  => s00_axi_bready,
            m_axi_araddr  => s00_axi_araddr,
            m_axi_arprot  => s00_axi_arprot,
            m_axi_arvalid => s00_axi_arvalid,
            m_axi_arready => s00_axi_arready,
            m_axi_rdata   => s00_axi_rdata,
            m_axi_rresp   => s00_axi_rresp,
            m_axi_rvalid  => s00_axi_rvalid,
            m_axi_rready  => s00_axi_rready
        );

    AMRD : entity work.AXISlaveRD
        generic map(
            C_M_AXI_ID_WIDTH     => C_M00_AXI_ID_WIDTH,
            C_M_AXI_ADDR_WIDTH   => C_M00_AXI_ADDR_WIDTH,
            C_M_AXI_ARUSER_WIDTH => C_M00_AXI_ARUSER_WIDTH,
            C_M_AXI_DATA_WIDTH   => C_S00_AXI_DATA_WIDTH,
            C_M_AXI_RUSER_WIDTH  => C_M00_AXI_RUSER_WIDTH
        )
        port map(
            data          => video_data_RAM,
            m_axi_aclk    => clk,
            m_axi_aresetn => m00_axi_aresetn,
            m_axi_arid    => m00_axi_arid,
            m_axi_araddr  => m00_axi_araddr,
            m_axi_arlen   => m00_axi_arlen,
            m_axi_arsize  => m00_axi_arsize,
            m_axi_arburst => m00_axi_arburst,
            m_axi_arlock  => m00_axi_arlock,
            m_axi_arcache => m00_axi_arcache,
            m_axi_arprot  => m00_axi_arprot,
            m_axi_arqos   => m00_axi_arqos,
            m_axi_aruser  => m00_axi_aruser,
            m_axi_arvalid => m00_axi_arvalid,
            m_axi_arready => m00_axi_arready,
            m_axi_rid     => m00_axi_rid,
            m_axi_rdata   => m00_axi_rdata,
            m_axi_rresp   => m00_axi_rresp,
            m_axi_rlast   => m00_axi_rlast,
            m_axi_ruser   => m00_axi_ruser,
            m_axi_rvalid  => m00_axi_rvalid,
            m_axi_rready  => m00_axi_rready
        );

    dut : entity work.axi_video_v1_0
        generic map(
            C_MAX_LINE_WIDTH       => C_MAX_LINE_WIDTH,
            C_S00_AXI_DATA_WIDTH   => C_S00_AXI_DATA_WIDTH,
            C_S00_AXI_ADDR_WIDTH   => C_S00_AXI_ADDR_WIDTH,
            C_M00_AXI_ID_WIDTH     => C_M00_AXI_ID_WIDTH,
            C_M00_AXI_ADDR_WIDTH   => C_M00_AXI_ADDR_WIDTH,
            C_M00_AXI_DATA_WIDTH   => C_M00_AXI_DATA_WIDTH,
            C_M00_AXI_BURST_LEN    => C_M00_AXI_BURST_LEN,
            C_M00_AXI_AWUSER_WIDTH => C_M00_AXI_AWUSER_WIDTH,
            C_M00_AXI_ARUSER_WIDTH => C_M00_AXI_ARUSER_WIDTH,
            C_M00_AXI_WUSER_WIDTH  => C_M00_AXI_WUSER_WIDTH,
            C_M00_AXI_RUSER_WIDTH  => C_M00_AXI_RUSER_WIDTH,
            C_M00_AXI_BUSER_WIDTH  => C_M00_AXI_BUSER_WIDTH
        )
        port map(
            video_clk       => video_clk,
            video_red       => video_red,
            video_green     => video_green,
            video_blue      => video_blue,
            video_hsync     => video_hsync,
            video_vsync     => video_vsync,
            video_active    => video_active,
            s00_axi_aclk    => clk,
            s00_axi_aresetn => s00_axi_aresetn,
            s00_axi_awaddr  => s00_axi_awaddr,
            s00_axi_awprot  => s00_axi_awprot,
            s00_axi_awvalid => s00_axi_awvalid,
            s00_axi_awready => s00_axi_awready,
            s00_axi_wdata   => s00_axi_wdata,
            s00_axi_wstrb   => s00_axi_wstrb,
            s00_axi_wvalid  => s00_axi_wvalid,
            s00_axi_wready  => s00_axi_wready,
            s00_axi_bresp   => s00_axi_bresp,
            s00_axi_bvalid  => s00_axi_bvalid,
            s00_axi_bready  => s00_axi_bready,
            s00_axi_araddr  => s00_axi_araddr,
            s00_axi_arprot  => s00_axi_arprot,
            s00_axi_arvalid => s00_axi_arvalid,
            s00_axi_arready => s00_axi_arready,
            s00_axi_rdata   => s00_axi_rdata,
            s00_axi_rresp   => s00_axi_rresp,
            s00_axi_rvalid  => s00_axi_rvalid,
            s00_axi_rready  => s00_axi_rready,
            m00_axi_aclk    => clk,
            m00_axi_aresetn => m00_axi_aresetn,
            m00_axi_awid    => m00_axi_awid,
            m00_axi_awaddr  => m00_axi_awaddr,
            m00_axi_awlen   => m00_axi_awlen,
            m00_axi_awsize  => m00_axi_awsize,
            m00_axi_awburst => m00_axi_awburst,
            m00_axi_awlock  => m00_axi_awlock,
            m00_axi_awcache => m00_axi_awcache,
            m00_axi_awprot  => m00_axi_awprot,
            m00_axi_awqos   => m00_axi_awqos,
            m00_axi_awuser  => m00_axi_awuser,
            m00_axi_awvalid => m00_axi_awvalid,
            m00_axi_awready => m00_axi_awready,
            m00_axi_wdata   => m00_axi_wdata,
            m00_axi_wstrb   => m00_axi_wstrb,
            m00_axi_wlast   => m00_axi_wlast,
            m00_axi_wuser   => m00_axi_wuser,
            m00_axi_wvalid  => m00_axi_wvalid,
            m00_axi_wready  => m00_axi_wready,
            m00_axi_bid     => m00_axi_bid,
            m00_axi_bresp   => m00_axi_bresp,
            m00_axi_buser   => m00_axi_buser,
            m00_axi_bvalid  => m00_axi_bvalid,
            m00_axi_bready  => m00_axi_bready,
            m00_axi_arid    => m00_axi_arid,
            m00_axi_araddr  => m00_axi_araddr,
            m00_axi_arlen   => m00_axi_arlen,
            m00_axi_arsize  => m00_axi_arsize,
            m00_axi_arburst => m00_axi_arburst,
            m00_axi_arlock  => m00_axi_arlock,
            m00_axi_arcache => m00_axi_arcache,
            m00_axi_arprot  => m00_axi_arprot,
            m00_axi_arqos   => m00_axi_arqos,
            m00_axi_aruser  => m00_axi_aruser,
            m00_axi_arvalid => m00_axi_arvalid,
            m00_axi_arready => m00_axi_arready,
            m00_axi_rid     => m00_axi_rid,
            m00_axi_rdata   => m00_axi_rdata,
            m00_axi_rresp   => m00_axi_rresp,
            m00_axi_rlast   => m00_axi_rlast,
            m00_axi_ruser   => m00_axi_ruser,
            m00_axi_rvalid  => m00_axi_rvalid,
            m00_axi_rready  => m00_axi_rready
        );

    tb : process
    begin
        s00_axi_aresetn <= '0';
        m00_axi_aresetn <= '0';
        wait for CLK_P * 10;
        s00_axi_aresetn <= '1';
        m00_axi_aresetn <= '1';
        wait for CLK_P * 10;
        alm_write_cmd(addr => 0, data => to_unsigned(1, C_S00_AXI_DATA_WIDTH), clk => clk, run => alm_wrun, busy => alm_busy, done => alm_done, s_addr => alm_addr, s_data => alm_din);
        alm_write_cmd(addr => 1, data => to_unsigned(0, C_S00_AXI_DATA_WIDTH), clk => clk, run => alm_wrun, busy => alm_busy, done => alm_done, s_addr => alm_addr, s_data => alm_din);
        alm_write_cmd(addr => 2, data => to_unsigned(C_VIDEO_DIM * C_VIDEO_DIM, C_S00_AXI_DATA_WIDTH), clk => clk, run => alm_wrun, busy => alm_busy, done => alm_done, s_addr => alm_addr, s_data => alm_din);
        alm_write_cmd(addr => 4, data => to_unsigned(C_VIDEO_DIM - 1, C_S00_AXI_DATA_WIDTH), clk => clk, run => alm_wrun, busy => alm_busy, done => alm_done, s_addr => alm_addr, s_data => alm_din);
        alm_write_cmd(addr => 5, data => to_unsigned(C_VIDEO_DIM + 2, C_S00_AXI_DATA_WIDTH), clk => clk, run => alm_wrun, busy => alm_busy, done => alm_done, s_addr => alm_addr, s_data => alm_din);
        alm_write_cmd(addr => 6, data => to_unsigned(C_VIDEO_DIM + 5, C_S00_AXI_DATA_WIDTH), clk => clk, run => alm_wrun, busy => alm_busy, done => alm_done, s_addr => alm_addr, s_data => alm_din);
        alm_write_cmd(addr => 7, data => to_unsigned(C_VIDEO_DIM + 7, C_S00_AXI_DATA_WIDTH), clk => clk, run => alm_wrun, busy => alm_busy, done => alm_done, s_addr => alm_addr, s_data => alm_din);
        alm_write_cmd(addr => 9, data => to_unsigned(C_VIDEO_DIM - 1, C_S00_AXI_DATA_WIDTH), clk => clk, run => alm_wrun, busy => alm_busy, done => alm_done, s_addr => alm_addr, s_data => alm_din);
        alm_write_cmd(addr => 10, data => to_unsigned(C_VIDEO_DIM + 2, C_S00_AXI_DATA_WIDTH), clk => clk, run => alm_wrun, busy => alm_busy, done => alm_done, s_addr => alm_addr, s_data => alm_din);
        alm_write_cmd(addr => 11, data => to_unsigned(C_VIDEO_DIM + 5, C_S00_AXI_DATA_WIDTH), clk => clk, run => alm_wrun, busy => alm_busy, done => alm_done, s_addr => alm_addr, s_data => alm_din);
        alm_write_cmd(addr => 12, data => to_unsigned(C_VIDEO_DIM + 7, C_S00_AXI_DATA_WIDTH), clk => clk, run => alm_wrun, busy => alm_busy, done => alm_done, s_addr => alm_addr, s_data => alm_din);
        alm_write_cmd(addr => 0, data => to_unsigned(8, C_S00_AXI_DATA_WIDTH), clk => clk, run => alm_wrun, busy => alm_busy, done => alm_done, s_addr => alm_addr, s_data => alm_din);
        wait;
    end process;

end architecture RTL;
