library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

Library xpm;
use xpm.vcomponents.all;

entity axi_video_v1_0 is
	generic(
		-- Users to add parameters here
		C_MAX_LINE_WIDTH       : integer := 4096;
		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- Parameters of Axi Slave Bus Interface S00_AXI
		C_S00_AXI_DATA_WIDTH   : integer := 32;
		C_S00_AXI_ADDR_WIDTH   : integer := 6;
		-- Parameters of Axi Master Bus Interface M00_AXI
		C_M00_AXI_ID_WIDTH     : integer := 1;
		C_M00_AXI_ADDR_WIDTH   : integer := 64;
		C_M00_AXI_DATA_WIDTH   : integer := 64;
		C_M00_AXI_BURST_LEN    : integer := 64;
		C_M00_AXI_AWUSER_WIDTH : integer := 4;
		C_M00_AXI_ARUSER_WIDTH : integer := 4;
		C_M00_AXI_WUSER_WIDTH  : integer := 8;
		C_M00_AXI_RUSER_WIDTH  : integer := 8;
		C_M00_AXI_BUSER_WIDTH  : integer := 4
	);
	port(
		-- Users to add ports here
		video_clk       : in  std_logic;
		video_rgb       : out std_logic_vector(35 downto 0);
		video_hsync     : out std_logic;
		video_vsync     : out std_logic;
		video_active    : out std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line

		-- Ports of Axi Slave Bus Interface S00_AXI
		s00_axi_aclk    : in  std_logic;
		s00_axi_aresetn : in  std_logic;
		s00_axi_awaddr  : in  std_logic_vector(C_S00_AXI_ADDR_WIDTH - 1 downto 0);
		s00_axi_awprot  : in  std_logic_vector(2 downto 0);
		s00_axi_awvalid : in  std_logic;
		s00_axi_awready : out std_logic;
		s00_axi_wdata   : in  std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
		s00_axi_wstrb   : in  std_logic_vector((C_S00_AXI_DATA_WIDTH / 8) - 1 downto 0);
		s00_axi_wvalid  : in  std_logic;
		s00_axi_wready  : out std_logic;
		s00_axi_bresp   : out std_logic_vector(1 downto 0);
		s00_axi_bvalid  : out std_logic;
		s00_axi_bready  : in  std_logic;
		s00_axi_araddr  : in  std_logic_vector(C_S00_AXI_ADDR_WIDTH - 1 downto 0);
		s00_axi_arprot  : in  std_logic_vector(2 downto 0);
		s00_axi_arvalid : in  std_logic;
		s00_axi_arready : out std_logic;
		s00_axi_rdata   : out std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
		s00_axi_rresp   : out std_logic_vector(1 downto 0);
		s00_axi_rvalid  : out std_logic;
		s00_axi_rready  : in  std_logic;
		-- Ports of Axi Master Bus Interface M00_AXI
		m00_axi_aclk    : in  std_logic;
		m00_axi_aresetn : in  std_logic;
		m00_axi_awid    : out std_logic_vector(C_M00_AXI_ID_WIDTH - 1 downto 0);
		m00_axi_awaddr  : out std_logic_vector(C_M00_AXI_ADDR_WIDTH - 1 downto 0);
		m00_axi_awlen   : out std_logic_vector(7 downto 0);
		m00_axi_awsize  : out std_logic_vector(2 downto 0);
		m00_axi_awburst : out std_logic_vector(1 downto 0);
		m00_axi_awlock  : out std_logic;
		m00_axi_awcache : out std_logic_vector(3 downto 0);
		m00_axi_awprot  : out std_logic_vector(2 downto 0);
		m00_axi_awqos   : out std_logic_vector(3 downto 0);
		m00_axi_awuser  : out std_logic_vector(C_M00_AXI_AWUSER_WIDTH - 1 downto 0);
		m00_axi_awvalid : out std_logic;
		m00_axi_awready : in  std_logic;
		m00_axi_wdata   : out std_logic_vector(C_M00_AXI_DATA_WIDTH - 1 downto 0);
		m00_axi_wstrb   : out std_logic_vector(C_M00_AXI_DATA_WIDTH / 8 - 1 downto 0);
		m00_axi_wlast   : out std_logic;
		m00_axi_wuser   : out std_logic_vector(C_M00_AXI_WUSER_WIDTH - 1 downto 0);
		m00_axi_wvalid  : out std_logic;
		m00_axi_wready  : in  std_logic;
		m00_axi_bid     : in  std_logic_vector(C_M00_AXI_ID_WIDTH - 1 downto 0);
		m00_axi_bresp   : in  std_logic_vector(1 downto 0);
		m00_axi_buser   : in  std_logic_vector(C_M00_AXI_BUSER_WIDTH - 1 downto 0);
		m00_axi_bvalid  : in  std_logic;
		m00_axi_bready  : out std_logic;
		m00_axi_arid    : out std_logic_vector(C_M00_AXI_ID_WIDTH - 1 downto 0);
		m00_axi_araddr  : out std_logic_vector(C_M00_AXI_ADDR_WIDTH - 1 downto 0);
		m00_axi_arlen   : out std_logic_vector(7 downto 0);
		m00_axi_arsize  : out std_logic_vector(2 downto 0);
		m00_axi_arburst : out std_logic_vector(1 downto 0);
		m00_axi_arlock  : out std_logic;
		m00_axi_arcache : out std_logic_vector(3 downto 0);
		m00_axi_arprot  : out std_logic_vector(2 downto 0);
		m00_axi_arqos   : out std_logic_vector(3 downto 0);
		m00_axi_aruser  : out std_logic_vector(C_M00_AXI_ARUSER_WIDTH - 1 downto 0);
		m00_axi_arvalid : out std_logic;
		m00_axi_arready : in  std_logic;
		m00_axi_rid     : in  std_logic_vector(C_M00_AXI_ID_WIDTH - 1 downto 0);
		m00_axi_rdata   : in  std_logic_vector(C_M00_AXI_DATA_WIDTH - 1 downto 0);
		m00_axi_rresp   : in  std_logic_vector(1 downto 0);
		m00_axi_rlast   : in  std_logic;
		m00_axi_ruser   : in  std_logic_vector(C_M00_AXI_RUSER_WIDTH - 1 downto 0);
		m00_axi_rvalid  : in  std_logic;
		m00_axi_rready  : out std_logic
	);
end axi_video_v1_0;

architecture arch_imp of axi_video_v1_0 is

	constant C_REG_BYTES  : integer := C_S00_AXI_DATA_WIDTH / 8;
	constant C_BYTES_ADDR : integer := integer(ceil(log2(real(C_REG_BYTES))));
	type regfile_t is array (0 to (2 ** (C_S00_AXI_ADDR_WIDTH - C_BYTES_ADDR)) - 1) of std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
	signal regfile        : regfile_t;

	type reg_names_t is (
		REG_CONTROL,
		REG_STREAM_BASEADDR_HIGH,
		REG_STREAM_BASEADDR_LOW,
		REG_FRAMESIZE,
		-- TODO read by line
		REG_VIDEO_H_COUNT,
		REG_VIDEO_H_ACTIVE,
		REG_VIDEO_H_FPORCH,
		REG_VIDEO_H_SYNC,
		REG_VIDEO_H_BPORCH,
		REG_VIDEO_V_COUNT,
		REG_VIDEO_V_ACTIVE,
		REG_VIDEO_V_FPORCH,
		REG_VIDEO_V_SYNC,
		REG_VIDEO_V_BPORCH,
		REG_FIFO_STATUS,
		REG_UNKNOWN
	);

	function r2i(name : reg_names_t) return integer is
	begin
		return reg_names_t'pos(name);
	end function;

	constant C_BIT_REG_CONTROL_RESET           : integer := 0;
	constant C_BIT_REG_CONTROL_POLARITY_H_SYNC : integer := 1;
	constant C_BIT_REG_CONTROL_POLARITY_V_SYNC : integer := 2;
	constant C_BIT_REG_CONTROL_RUN             : integer := 3;
	constant C_BIT_REG_CONTROL_VFSM_RESET      : integer := 4;
	constant C_BIT_REG_CONTROL_VFSM_BGRA       : integer := 5;
	constant C_BIT_REG_CONTROL_VFSM_ERROR      : integer := 16;
	constant C_HBIT_REG_CONTROL_VFSM_STATUS    : integer := 18;

	alias RNt is reg_names_t;

	signal bvalid                   : std_logic;
	signal rvalid                   : std_logic;
	signal wready                   : std_logic;
	signal rst                      : std_logic;
	constant C_TRANSFER_WSIZE_WIDTH : integer := 23;
	constant C_S_AXIS_TDATA_WIDTH   : integer := 32;
	constant C_S_AXIS_TUSER_WIDTH   : integer := C_M00_AXI_RUSER_WIDTH;

	signal mm2s_reset      : std_logic;
	signal mm2s_address    : std_logic_vector(C_M00_AXI_ADDR_WIDTH - 1 downto 0);
	signal mm2s_size_words : std_logic_vector(C_TRANSFER_WSIZE_WIDTH - 1 downto 0);
	signal mm2s_run        : std_logic;
	signal mm2s_run_ack    : std_logic;
	signal mm2s_busy       : std_logic;
	signal mm2s_status     : std_logic_vector(1 downto 0);
	signal mm2s_done       : std_logic;
	signal mm2s_error      : std_logic;

	signal m_axis_tvalid : std_logic;
	signal m_axis_tready : std_logic;
	signal m_axis_tdata  : std_logic_vector(C_M00_AXI_DATA_WIDTH - 1 downto 0);
	signal m_axis_tlast  : std_logic;
	signal m_axis_tuser  : std_logic_vector(C_S_AXIS_TUSER_WIDTH - 1 downto 0);
	signal svf_reset     : std_logic;

	constant FWR_DATA_COUNT_WIDTH : integer := integer(ceil(log2(real(C_MAX_LINE_WIDTH + 1))));

	signal svf_axis_tvalid : std_logic;
	signal svf_axis_tready : std_logic;
	signal svf_axis_tdata  : std_logic_vector(C_S_AXIS_TDATA_WIDTH - 1 downto 0);
	signal svf_axis_tlast  : std_logic;
	signal svf_axis_tuser  : std_logic_vector(C_S_AXIS_TUSER_WIDTH - 1 downto 0);
	signal svf_fifo_count  : std_logic_vector(FWR_DATA_COUNT_WIDTH - 1 downto 0);
	signal video_rst       : std_logic;

	constant C_MAX_LINE_BWIDTH : integer := integer(ceil(log2(real(C_MAX_LINE_WIDTH + 1))));

	signal cdc_video : std_logic_vector(1 downto 0);
	signal cdc_axi   : std_logic_vector(1 downto 0);

	signal video_active_end : std_logic;
	signal video_frame_end  : std_logic;
	signal video_hsync_d    : std_logic;
	signal video_vsync_d    : std_logic;
	signal video_active_d   : std_logic;

	type vfsm_t is (SIdle, SWaitActiveEnd, STransfer, SError);
	signal vfsm_state     : vfsm_t := SIdle;
	signal vfsm_rst       : std_logic;
	signal vfsm_rd_enable : std_logic;
	signal vfsm_error     : std_logic;

begin

	-- dummy AXIWR interface
	m00_axi_awid    <= (others => '0');
	m00_axi_awaddr  <= (others => '0');
	m00_axi_awlen   <= (others => '0');
	m00_axi_awsize  <= (others => '0');
	m00_axi_awburst <= (others => '0');
	m00_axi_awlock  <= '0';
	m00_axi_awcache <= (others => '0');
	m00_axi_awprot  <= (others => '0');
	m00_axi_awqos   <= (others => '0');
	m00_axi_awuser  <= (others => '0');
	m00_axi_awvalid <= '0';
	m00_axi_wdata   <= (others => '0');
	m00_axi_wstrb   <= (others => '0');
	m00_axi_wlast   <= '0';
	m00_axi_wuser   <= (others => '0');
	m00_axi_wvalid  <= '0';
	m00_axi_bready  <= '0';

	vfsm_rst <= rst or regfile(r2i(REG_CONTROL))(C_BIT_REG_CONTROL_VFSM_RESET);

	video_fsm : process(m00_axi_aclk)
		variable mmaddress : std_logic_vector(C_S00_AXI_DATA_WIDTH * 2 - 1 downto 0);
	begin
		if rising_edge(m00_axi_aclk) then
			if vfsm_rst then
				vfsm_state      <= SIdle;
				video_rst       <= '1';
				mm2s_reset      <= '1';
				svf_reset       <= '1';
				mm2s_run        <= '0';
				vfsm_rd_enable  <= '0';
				mm2s_address    <= (others => '0');
				mm2s_size_words <= (others => '0');
				vfsm_error      <= '0';
			else
				if mm2s_run_ack then
					mm2s_run <= '0';
				end if;
				case vfsm_state is
					when SIdle =>
						if regfile(r2i(REG_CONTROL))(C_BIT_REG_CONTROL_RUN) then
							vfsm_state <= SWaitActiveEnd;
							video_rst  <= '0';
							mm2s_reset <= '0';
							svf_reset  <= '0';
						else
							video_rst      <= '1';
							mm2s_reset     <= '1';
							svf_reset      <= '1';
							vfsm_rd_enable <= '0';
						end if;
					when SWaitActiveEnd =>
						if video_active_end then
							vfsm_state      <= STransfer;
							mmaddress       := regfile(r2i(REG_STREAM_BASEADDR_HIGH)) & regfile(r2i(REG_STREAM_BASEADDR_LOW));
							mm2s_address    <= mmaddress(C_M00_AXI_ADDR_WIDTH - 1 downto 0);
							mm2s_size_words <= regfile(r2i(REG_FRAMESIZE))(C_TRANSFER_WSIZE_WIDTH - 1 downto 0);
							mm2s_run        <= '1';
							vfsm_rd_enable  <= '1';
						end if;
					when STransfer =>
						-- enable read from FIFO
						mm2s_run <= '0';
						-- transfer finished
						if mm2s_done then
							vfsm_state <= SIdle;
						end if;
					when SError =>
						vfsm_rd_enable <= '0';
						vfsm_error     <= '1';
						-- wait for rst
				end case;
				if mm2s_error then
					vfsm_state <= SError;
				end if;
			end if;
		end if;
	end process;

	rst <= (not s00_axi_aresetn) or regfile(RNt'pos(REG_CONTROL))(C_BIT_REG_CONTROL_RESET);

	wr_slave : process(s00_axi_aclk)
		variable reg_addr : integer;
	begin
		if rising_edge(s00_axi_aclk) then
			wready        <= '0';
			s00_axi_bresp <= (others => '0');
			if rst then
				regfile <= (others => (others => '0'));
			else
				-- status bits
				regfile(r2i(REG_CONTROL))(C_BIT_REG_CONTROL_VFSM_ERROR)                                                                  <= vfsm_error;
				regfile(r2i(REG_CONTROL))(C_HBIT_REG_CONTROL_VFSM_STATUS downto C_HBIT_REG_CONTROL_VFSM_STATUS - mm2s_status'length + 1) <= mm2s_status;
				-- axi
				if bvalid = '1' and s00_axi_bready = '1' then
					bvalid <= '0';
				else
					if s00_axi_wvalid = '1' and s00_axi_awvalid = '1' then
						wready   <= '1';
						bvalid   <= '1';
						reg_addr := to_integer(unsigned(s00_axi_awaddr(s00_axi_awaddr'high downto C_BYTES_ADDR)));
						if reg_addr < r2i(REG_UNKNOWN) then
							for i in s00_axi_wstrb'range loop
								if s00_axi_wstrb(i) = '1' then
									regfile(reg_addr)(8 * (i + 1) - 1 downto 8 * i) <= s00_axi_wdata(8 * (i + 1) - 1 downto 8 * i);
								end if;
							end loop;
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;

	s00_axi_bvalid  <= bvalid;
	s00_axi_wready  <= wready;
	s00_axi_awready <= wready;

	rd_slave : process(s00_axi_aclk)
		variable reg_addr : integer;
	begin
		if rising_edge(s00_axi_aclk) then
			s00_axi_rresp   <= (others => '0');
			s00_axi_arready <= '0';
			if s00_axi_aresetn = '0' then
				rvalid        <= '0';
				s00_axi_rdata <= (others => '0');
			else
				if rvalid = '1' and s00_axi_rready = '1' then
					rvalid <= '0';
				else
					reg_addr := to_integer(unsigned(s00_axi_araddr(s00_axi_araddr'high downto C_BYTES_ADDR)));
					if s00_axi_arvalid = '1' then
						s00_axi_arready <= '1';
						if reg_addr < r2i(REG_UNKNOWN) then
							case reg_addr is
								when r2i(REG_FIFO_STATUS) =>
									s00_axi_rdata <= std_logic_vector(resize(unsigned(svf_fifo_count), s00_axi_rdata'length));
								when others =>
									s00_axi_rdata <= regfile(reg_addr);
							end case;
						else
							s00_axi_rdata <= (others => '0');
						end if;
						rvalid          <= '1';
					end if;
				end if;
			end if;
		end if;
	end process;

	s00_axi_rvalid <= rvalid;

	mm2s : entity work.AXI_MM2S
		generic map(
			C_TRANSFER_WSIZE_WIDTH => C_TRANSFER_WSIZE_WIDTH,
			C_M_AXI_ID_WIDTH       => C_M00_AXI_ID_WIDTH,
			C_M_AXI_ADDR_WIDTH     => C_M00_AXI_ADDR_WIDTH,
			C_M_AXI_DATA_WIDTH     => C_M00_AXI_DATA_WIDTH,
			C_M_AXI_ARUSER_WIDTH   => C_M00_AXI_ARUSER_WIDTH,
			C_M_AXI_RUSER_WIDTH    => C_M00_AXI_RUSER_WIDTH,
			C_M_AXI_BURST_LEN      => C_M00_AXI_BURST_LEN,
			C_S_AXIS_TDATA_WIDTH   => C_M00_AXI_DATA_WIDTH,
			C_S_AXIS_TUSER_WIDTH   => C_S_AXIS_TUSER_WIDTH
		)
		port map(
			clk           => m00_axi_aclk,
			reset         => mm2s_reset or not (m00_axi_aresetn),
			address       => mm2s_address,
			size_words    => mm2s_size_words,
			run           => mm2s_run,
			run_ack       => mm2s_run_ack,
			busy          => mm2s_busy,
			status        => mm2s_status,
			done          => mm2s_done,
			error         => mm2s_error,
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
			m_axi_rready  => m00_axi_rready,
			m_axis_tvalid => m_axis_tvalid,
			m_axis_tready => m_axis_tready,
			m_axis_tdata  => m_axis_tdata,
			m_axis_tlast  => m_axis_tlast,
			m_axis_tuser  => m_axis_tuser
		);

	video_FIFO : entity work.xpm_fifo_wrapper
		generic map(
			CLOCKING_MODE       => "independent_clock",
			FIFO_MEMORY_TYPE    => "auto",
			PACKET_FIFO         => "false",
			FIFO_DEPTH          => C_MAX_LINE_WIDTH,
			WTDATA_WIDTH        => C_M00_AXI_DATA_WIDTH,
			TUSER_WIDTH         => C_S_AXIS_TUSER_WIDTH,
			RTDATA_WIDTH        => C_S_AXIS_TDATA_WIDTH,
			RELATED_CLOCKS      => 0,
			WR_DATA_COUNT_WIDTH => FWR_DATA_COUNT_WIDTH,
			RD_DATA_COUNT_WIDTH => 32
		)
		port map(
			s_reset            => svf_reset,
			m_aclk             => video_clk,
			s_aclk             => m00_axi_aclk,
			s_axis_tvalid      => m_axis_tvalid,
			s_axis_tready      => m_axis_tready,
			s_axis_tdata       => m_axis_tdata,
			s_axis_tlast       => m_axis_tlast,
			s_axis_tuser       => m_axis_tuser,
			m_axis_tvalid      => svf_axis_tvalid,
			m_axis_tready      => svf_axis_tready,
			m_axis_tdata       => svf_axis_tdata,
			m_axis_tlast       => svf_axis_tlast,
			m_axis_tuser       => svf_axis_tuser,
			wr_data_count_axis => svf_fifo_count,
			rd_data_count_axis => open
		);

	vgen : entity work.video_gen
		generic map(
			C_MAX_LINE_WIDTH  => C_MAX_LINE_WIDTH,
			C_MAX_LINE_BWIDTH => C_MAX_LINE_BWIDTH
		)
		port map(
			clk              => video_clk,
			rst              => video_rst,
			video_h_active   => unsigned(regfile(r2i(REG_VIDEO_H_ACTIVE))(C_MAX_LINE_BWIDTH - 1 downto 0)),
			video_h_fporch   => unsigned(regfile(r2i(REG_VIDEO_H_FPORCH))(C_MAX_LINE_BWIDTH - 1 downto 0)),
			video_h_sync     => unsigned(regfile(r2i(REG_VIDEO_H_SYNC))(C_MAX_LINE_BWIDTH - 1 downto 0)),
			video_h_bporch   => unsigned(regfile(r2i(REG_VIDEO_H_BPORCH))(C_MAX_LINE_BWIDTH - 1 downto 0)),
			video_h_sync_pol => regfile(r2i(REG_CONTROL))(C_BIT_REG_CONTROL_POLARITY_H_SYNC),
			video_v_active   => unsigned(regfile(r2i(REG_VIDEO_V_ACTIVE))(C_MAX_LINE_BWIDTH - 1 downto 0)),
			video_v_fporch   => unsigned(regfile(r2i(REG_VIDEO_V_FPORCH))(C_MAX_LINE_BWIDTH - 1 downto 0)),
			video_v_sync     => unsigned(regfile(r2i(REG_VIDEO_V_SYNC))(C_MAX_LINE_BWIDTH - 1 downto 0)),
			video_v_bporch   => unsigned(regfile(r2i(REG_VIDEO_V_BPORCH))(C_MAX_LINE_BWIDTH - 1 downto 0)),
			video_v_sync_pol => regfile(r2i(REG_CONTROL))(C_BIT_REG_CONTROL_POLARITY_V_SYNC),
			video_hsync      => video_hsync_d,
			video_vsync      => video_vsync_d,
			video_active     => video_active_d,
			video_active_end => cdc_video(0),
			video_frame_end  => cdc_video(1)
		);

	cdc_vid2axi : xpm_cdc_array_single
		generic map(
			DEST_SYNC_FF   => 2,        -- DECIMAL; range: 2-10
			INIT_SYNC_FF   => 0,        -- DECIMAL; 0=disable simulation init values, 1=enable simulation init values
			SIM_ASSERT_CHK => 0,        -- DECIMAL; 0=disable simulation messages, 1=enable simulation messages
			SRC_INPUT_REG  => 1,        -- DECIMAL; 0=do not register input, 1=register input
			WIDTH          => 2         -- DECIMAL; range: 1-1024
		)
		port map(
			dest_out => cdc_axi,        -- WIDTH-bit output: src_in synchronized to the destination clock domain. This
			-- output is registered.

			dest_clk => m00_axi_aclk,   -- 1-bit input: Clock signal for the destination clock domain.
			src_clk  => video_clk,      -- 1-bit input: optional; required when SRC_INPUT_REG = 1
			src_in   => cdc_video       -- WIDTH-bit input: Input single-bit array to be synchronized to destination clock
			-- domain. It is assumed that each bit of the array is unrelated to the others.
			-- This is reflected in the constraints applied to this macro. To transfer a binary
			-- value losslessly across the two clock domains, use the XPM_CDC_GRAY macro
			-- instead.

		);

	video_active_end <= cdc_axi(0);
	video_frame_end  <= cdc_axi(1);

	svf_axis_tready <= video_active_d when vfsm_rd_enable else '0';

	vout : process(video_clk) is
	begin
		if rising_edge(video_clk) then
			video_hsync  <= video_hsync_d;
			video_vsync  <= video_vsync_d;
			video_active <= video_active_d;
			if video_rst = '1' then
				video_rgb    <= (others => '0');
				video_active <= '0';
			else
				if video_active_d = '0' then
					video_rgb <= (others => '0');
				elsif svf_axis_tready and svf_axis_tvalid then
					video_rgb <= (others => '0');
					if regfile(r2i(REG_CONTROL))(C_BIT_REG_CONTROL_VFSM_BGRA) then
						video_rgb(35 downto 28) <= svf_axis_tdata(7 downto 0);
						video_rgb(23 downto 16) <= svf_axis_tdata(15 downto 8);
						video_rgb(11 downto 4)  <= svf_axis_tdata(23 downto 16);
					else
						video_rgb(35 downto 28) <= svf_axis_tdata(23 downto 16);
						video_rgb(23 downto 16) <= svf_axis_tdata(15 downto 8);
						video_rgb(11 downto 4)  <= svf_axis_tdata(7 downto 0);
					end if;
				end if;
			end if;
		end if;
	end process vout;

end arch_imp;
