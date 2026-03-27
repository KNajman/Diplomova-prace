library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.AXITest.all;
use work.dtypes_p.all;

entity ALI_tb is
end entity ALI_tb;

architecture testbench of ALI_tb is

    constant C_S00_AXI_DATA_WIDTH   : integer := 32;
    constant C_S00_AXI_ADDR_WIDTH   : integer := 6;
    constant C_S00_AXIS_TDATA_WIDTH : integer := 32;
    constant C_S01_AXIS_TDATA_WIDTH : integer := 32;
    constant C_M00_AXIS_TDATA_WIDTH : integer := 32;
    constant C_FIFO_DEPTHS          : integer := 16;

    signal clk     : std_logic := '0';
    constant CLK_P : time      := 10 ns;

    signal rst : std_logic := '1';

    signal s00_axi_aresetn : std_logic;

    constant C_REG_BYTES  : integer := C_S00_AXI_DATA_WIDTH / 8;
    constant C_BYTES_ADDR : integer := integer(log2(real(C_REG_BYTES)));

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

    signal s00_axi_araddr   : std_logic_vector(C_S00_AXI_ADDR_WIDTH - 1 downto 0);
    signal s00_axi_arprot   : std_logic_vector(2 downto 0);
    signal s00_axi_arvalid  : std_logic;
    signal s00_axi_arready  : std_logic;
    signal s00_axi_rdata    : std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    signal s00_axi_rresp    : std_logic_vector(1 downto 0);
    signal s00_axi_rvalid   : std_logic;
    signal s00_axi_rready   : std_logic;
    signal s00_axis_aresetn : std_logic;
    signal s00_axis_tready  : std_logic;
    signal s00_axis_tdata   : std_logic_vector(C_S00_AXIS_TDATA_WIDTH - 1 downto 0);
    signal s00_axis_tstrb   : std_logic_vector((C_S00_AXIS_TDATA_WIDTH / 8) - 1 downto 0);
    signal s00_axis_tlast   : std_logic;
    signal s00_axis_tvalid  : std_logic;
    signal s01_axis_aresetn : std_logic;
    signal s01_axis_tready  : std_logic;
    signal s01_axis_tdata   : std_logic_vector(C_S01_AXIS_TDATA_WIDTH - 1 downto 0);
    signal s01_axis_tstrb   : std_logic_vector((C_S01_AXIS_TDATA_WIDTH / 8) - 1 downto 0);
    signal s01_axis_tlast   : std_logic;
    signal s01_axis_tvalid  : std_logic;
    signal m00_axis_aresetn : std_logic;
    signal m00_axis_tvalid  : std_logic;
    signal m00_axis_tdata   : std_logic_vector(C_M00_AXIS_TDATA_WIDTH - 1 downto 0);
    signal m00_axis_tstrb   : std_logic_vector((C_M00_AXIS_TDATA_WIDTH / 8) - 1 downto 0);
    signal m00_axis_tlast   : std_logic;
    signal m00_axis_tready  : std_logic;

    signal alm_addr : integer;
    signal alm_din  : unsigned(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    signal alm_dout : unsigned(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    signal alm_wrun : std_logic := '0';
    signal alm_rrun : std_logic := '0';
    signal alm_busy : std_logic;
    signal alm_done : std_logic;

    signal bufsAB  : databufs_t(0 to 1)(0 to C_FIFO_DEPTHS * 2 - 1)(C_S00_AXIS_TDATA_WIDTH - 1 downto 0);
    signal bufsC   : databufs_t(0 to 0)(0 to C_FIFO_DEPTHS * 2 - 1)(C_S00_AXIS_TDATA_WIDTH - 1 downto 0);
    signal as_run  : std_logic_vector(2 downto 0);
    signal as_busy : std_logic_vector(2 downto 0);
    signal as_done : std_logic_vector(2 downto 0);

begin

    clk <= not clk after CLK_P / 2;

    s00_axi_aresetn  <= not rst;
    s00_axis_aresetn <= not rst;
    s01_axis_aresetn <= not rst;
    m00_axis_aresetn <= not rst;

    dut : entity work.axis_macc_v1_0
        generic map(
            C_S00_AXI_DATA_WIDTH   => C_S00_AXI_DATA_WIDTH,
            C_S00_AXI_ADDR_WIDTH   => C_S00_AXI_ADDR_WIDTH,
            C_S00_AXIS_TDATA_WIDTH => C_S00_AXIS_TDATA_WIDTH,
            C_S01_AXIS_TDATA_WIDTH => C_S01_AXIS_TDATA_WIDTH,
            C_M00_AXIS_TDATA_WIDTH => C_M00_AXIS_TDATA_WIDTH,
            C_FIFO_DEPTHS          => C_FIFO_DEPTHS
        )
        port map(
            s00_axi_aclk     => clk,
            s00_axi_aresetn  => s00_axi_aresetn,
            s00_axi_awaddr   => s00_axi_awaddr,
            s00_axi_awprot   => s00_axi_awprot,
            s00_axi_awvalid  => s00_axi_awvalid,
            s00_axi_awready  => s00_axi_awready,
            s00_axi_wdata    => s00_axi_wdata,
            s00_axi_wstrb    => s00_axi_wstrb,
            s00_axi_wvalid   => s00_axi_wvalid,
            s00_axi_wready   => s00_axi_wready,
            s00_axi_bresp    => s00_axi_bresp,
            s00_axi_bvalid   => s00_axi_bvalid,
            s00_axi_bready   => s00_axi_bready,
            s00_axi_araddr   => s00_axi_araddr,
            s00_axi_arprot   => s00_axi_arprot,
            s00_axi_arvalid  => s00_axi_arvalid,
            s00_axi_arready  => s00_axi_arready,
            s00_axi_rdata    => s00_axi_rdata,
            s00_axi_rresp    => s00_axi_rresp,
            s00_axi_rvalid   => s00_axi_rvalid,
            s00_axi_rready   => s00_axi_rready,
            s00_axis_aclk    => clk,
            s00_axis_aresetn => s00_axis_aresetn,
            s00_axis_tready  => s00_axis_tready,
            s00_axis_tdata   => s00_axis_tdata,
            s00_axis_tstrb   => s00_axis_tstrb,
            s00_axis_tlast   => s00_axis_tlast,
            s00_axis_tvalid  => s00_axis_tvalid,
            s01_axis_aclk    => clk,
            s01_axis_aresetn => s01_axis_aresetn,
            s01_axis_tready  => s01_axis_tready,
            s01_axis_tdata   => s01_axis_tdata,
            s01_axis_tstrb   => s01_axis_tstrb,
            s01_axis_tlast   => s01_axis_tlast,
            s01_axis_tvalid  => s01_axis_tvalid,
            m00_axis_aclk    => clk,
            m00_axis_aresetn => m00_axis_aresetn,
            m00_axis_tvalid  => m00_axis_tvalid,
            m00_axis_tdata   => m00_axis_tdata,
            m00_axis_tstrb   => m00_axis_tstrb,
            m00_axis_tlast   => m00_axis_tlast,
            m00_axis_tready  => m00_axis_tready
        );

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

    ASMA_inst : AXISMaster
        generic map(
            C_M_AXIS_TDATA_WIDTH => C_S00_AXIS_TDATA_WIDTH
        )
        port map(
            run            => as_run(0),
            din            => bufsAB(0),
            busy           => as_busy(0),
            done           => as_done(0),
            m_axis_aclk    => clk,
            m_axis_aresetn => s00_axis_aresetn,
            m_axis_tvalid  => s00_axis_tvalid,
            m_axis_tdata   => s00_axis_tdata,
            m_axis_tstrb   => s00_axis_tstrb,
            m_axis_tlast   => s00_axis_tlast,
            m_axis_tready  => s00_axis_tready
        );

    ASMB_inst : AXISMaster
        generic map(
            C_M_AXIS_TDATA_WIDTH => C_S01_AXIS_TDATA_WIDTH
        )
        port map(
            run            => as_run(1),
            din            => bufsAB(1),
            busy           => as_busy(1),
            done           => as_done(1),
            m_axis_aclk    => clk,
            m_axis_aresetn => s01_axis_aresetn,
            m_axis_tvalid  => s01_axis_tvalid,
            m_axis_tdata   => s01_axis_tdata,
            m_axis_tstrb   => s01_axis_tstrb,
            m_axis_tlast   => s01_axis_tlast,
            m_axis_tready  => s01_axis_tready
        );

    ASSC_inst : AXISSlave
        generic map(
            C_S_AXIS_TDATA_WIDTH => C_M00_AXIS_TDATA_WIDTH
        )
        port map(
            run            => as_run(2),
            busy           => as_busy(2),
            done           => as_done(2),
            dout           => bufsC(0),
            s_axis_aclk    => clk,
            s_axis_aresetn => m00_axis_aresetn,
            s_axis_tready  => m00_axis_tready,
            s_axis_tdata   => m00_axis_tdata,
            s_axis_tstrb   => m00_axis_tstrb,
            s_axis_tlast   => m00_axis_tlast,
            s_axis_tvalid  => m00_axis_tvalid
        );

    tb : process
        variable tmp_bufsC : databufs_t(0 to 0)(0 to C_FIFO_DEPTHS * 2 - 1)(C_S00_AXIS_TDATA_WIDTH - 1 downto 0) := ((others => (others => (others => '0'))));
        variable bufA      : databuf_t(0 to C_FIFO_DEPTHS * 2 - 1)(C_S00_AXIS_TDATA_WIDTH - 1 downto 0)          := fill_increment(C_FIFO_DEPTHS * 2, C_S00_AXIS_TDATA_WIDTH);
        variable bufB      : databuf_t(0 to C_FIFO_DEPTHS * 2 - 1)(C_S00_AXIS_TDATA_WIDTH - 1 downto 0)          := fill_constant(1, C_FIFO_DEPTHS * 2, C_S00_AXIS_TDATA_WIDTH);
    begin
        rst <= '1';
        wait for CLK_P * 8;
        rst <= '0';
        wait for CLK_P * 8;
        /*
            Write to reg example
        */

        -- for i in 0 to 15 loop
        --     alm_write_cmd(addr   => i, data => to_unsigned(i, C_S00_AXI_DATA_WIDTH),
        --                   clk    => clk, run => alm_wrun, busy => alm_busy, done => alm_done, s_addr => alm_addr, s_data => alm_din);
        --     wait for CLK_P * 2;
        -- end loop;

        /*
            Reg read example
        */
        -- for i in 0 to 15 loop
        --     alm_read_cmd(addr   => i,
        --                  clk    => clk, run => alm_rrun, busy => alm_busy, done => alm_done, s_addr => alm_addr);
        --     wait for CLK_P * 2;
        -- end loop;

        /*
            AXIS (all together) transfer example
        */

                -- asm_multi_cmd(bufs_in  => (bufA, bufB),
        --               bufs_out => tmp_bufsC,
        --               clk      => clk,
        --               run      => as_run,
        --               busy     => as_done,
        --               done     => as_busy,
        --               douts    => bufsC,
        --               dins     => bufsAB);                      
        -- -- result is in bufsC(0)

        -- non synchronnous transfers
        bufsAB(0) <= bufA;
        bufsAB(1) <= bufB;
        as_run(0) <= '1';
        wait until as_busy(0) = '1';
        wait for 10*CLK_P;
        as_run(1) <= '1';
        wait until as_busy(1) = '1';
        as_run(2) <= '1';
        wait;
        wait;
    end process;

end architecture testbench;
