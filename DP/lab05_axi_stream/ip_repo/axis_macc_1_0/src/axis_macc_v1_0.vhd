library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity axis_macc_v1_0 is
	generic(
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- Parameters of Axi Slave Bus Interface S00_AXI
		C_S00_AXI_DATA_WIDTH   : integer := 32;
		C_S00_AXI_ADDR_WIDTH   : integer := 5;
		-- Parameters of Axi Slave Bus Interface S00_AXIS
		C_S00_AXIS_TDATA_WIDTH : integer := 32;
		-- Parameters of Axi Slave Bus Interface S01_AXIS
		C_S01_AXIS_TDATA_WIDTH : integer := 32;
		-- Parameters of Axi Master Bus Interface M00_AXIS
		C_M00_AXIS_TDATA_WIDTH : integer := 32;
		C_FIFO_DEPTHS          : integer := 1024
	);
	port(
		-- Users to add ports here

		-- User ports ends
		-- Do not modify the ports beyond this line

		-- Ports of Axi Slave Bus Interface S00_AXI
		s00_axi_aclk     : in  std_logic;
		s00_axi_aresetn  : in  std_logic;
		s00_axi_awaddr   : in  std_logic_vector(C_S00_AXI_ADDR_WIDTH - 1 downto 0);
		s00_axi_awprot   : in  std_logic_vector(2 downto 0);
		s00_axi_awvalid  : in  std_logic;
		s00_axi_awready  : out std_logic;
		s00_axi_wdata    : in  std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
		s00_axi_wstrb    : in  std_logic_vector((C_S00_AXI_DATA_WIDTH / 8) - 1 downto 0);
		s00_axi_wvalid   : in  std_logic;
		s00_axi_wready   : out std_logic;
		s00_axi_bresp    : out std_logic_vector(1 downto 0);
		s00_axi_bvalid   : out std_logic;
		s00_axi_bready   : in  std_logic;
		s00_axi_araddr   : in  std_logic_vector(C_S00_AXI_ADDR_WIDTH - 1 downto 0);
		s00_axi_arprot   : in  std_logic_vector(2 downto 0);
		s00_axi_arvalid  : in  std_logic;
		s00_axi_arready  : out std_logic;
		s00_axi_rdata    : out std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
		s00_axi_rresp    : out std_logic_vector(1 downto 0);
		s00_axi_rvalid   : out std_logic;
		s00_axi_rready   : in  std_logic;
		-- Ports of Axi Slave Bus Interface S00_AXIS
		s00_axis_aclk    : in  std_logic;
		s00_axis_aresetn : in  std_logic;
		s00_axis_tready  : out std_logic;
		s00_axis_tdata   : in  std_logic_vector(C_S00_AXIS_TDATA_WIDTH - 1 downto 0);
		s00_axis_tstrb   : in  std_logic_vector((C_S00_AXIS_TDATA_WIDTH / 8) - 1 downto 0);
		s00_axis_tlast   : in  std_logic;
		s00_axis_tvalid  : in  std_logic;
		-- Ports of Axi Slave Bus Interface S01_AXIS
		s01_axis_aclk    : in  std_logic;
		s01_axis_aresetn : in  std_logic;
		s01_axis_tready  : out std_logic;
		s01_axis_tdata   : in  std_logic_vector(C_S01_AXIS_TDATA_WIDTH - 1 downto 0);
		s01_axis_tstrb   : in  std_logic_vector((C_S01_AXIS_TDATA_WIDTH / 8) - 1 downto 0);
		s01_axis_tlast   : in  std_logic;
		s01_axis_tvalid  : in  std_logic;
		-- Ports of Axi Master Bus Interface M00_AXIS
		m00_axis_aclk    : in  std_logic;
		m00_axis_aresetn : in  std_logic;
		m00_axis_tvalid  : out std_logic;
		m00_axis_tdata   : out std_logic_vector(C_M00_AXIS_TDATA_WIDTH - 1 downto 0);
		m00_axis_tstrb   : out std_logic_vector((C_M00_AXIS_TDATA_WIDTH / 8) - 1 downto 0);
		m00_axis_tlast   : out std_logic;
		m00_axis_tready  : in  std_logic
	);
end axis_macc_v1_0;

architecture arch_imp of axis_macc_v1_0 is

	constant C_REG_BYTES  : integer := C_S00_AXI_DATA_WIDTH / 8;
	constant C_BYTES_ADDR : integer := integer(ceil(log2(real(C_REG_BYTES))));
	type regfile_t is array (0 to (2 ** (C_S00_AXI_ADDR_WIDTH - C_BYTES_ADDR)) - 1) of std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
	signal regfile        : regfile_t;

	type reg_names_t is (
		REG_CONTROL,                    -- 0
		REG_OPERATION,                  -- 1
		REG_FA_COUNT,                   -- 2
		REG_FB_COUNT,                   -- 3
		REG_FC_COUNT                    -- 4
	);

	alias RNt is reg_names_t;

	signal bvalid : std_logic;
	signal rvalid : std_logic;
	signal wready : std_logic;
	signal rst    : std_logic;

begin

	rst <= (not s00_axi_aresetn) or regfile(RNt'pos(REG_CONTROL))(0);

	wr_slave : process(s00_axi_aclk)
		variable reg_addr : integer;
	begin
		if rising_edge(s00_axi_aclk) then
			wready        <= '0';
			s00_axi_bresp <= (others => '0');
			if rst then
				regfile <= (others => (others => '0'));
			else
				if bvalid = '1' and s00_axi_bready = '1' then
					bvalid <= '0';
				else
					if s00_axi_wvalid = '1' and s00_axi_awvalid = '1' then
						wready   <= '1';
						bvalid   <= '1';
						reg_addr := to_integer(unsigned(s00_axi_awaddr(s00_axi_awaddr'high downto C_BYTES_ADDR)));
						for i in s00_axi_wstrb'range loop
							if s00_axi_wstrb(i) = '1' then
								regfile(reg_addr)(8 * (i + 1) - 1 downto 8 * i) <= s00_axi_wdata(8 * (i + 1) - 1 downto 8 * i);
							end if;
						end loop;
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
						s00_axi_rdata   <= regfile(reg_addr);
						rvalid          <= '1';
					end if;
				end if;
			end if;
		end if;
	end process;

	s00_axi_rvalid <= rvalid;
	
	/*
	Insert input FIFOs here
	connect slave ports to s00/1_axis
	create signals for master with prefixes mFA_, mFB_
	*/
	--insert axis_FIFO for s00_axis
	axis_fifo_s00 : entity work.axis_fifo
		generic map (
		C_DATA_WIDTH => C_S00_AXIS_TDATA_WIDTH,
		C_FIFO_DEPTH => C_FIFO_DEPTHS
	)
		port map (
		clk   => s00_axis_aclk,
		rst   => (not s00_axis_aresetn),
		s_axis_tvalid => s00_axis_tvalid,
		s_axis_tdata  => s00_axis_tdata,
		s_axis_tstrb  => s00_axis_tstrb,
		s_axis_tlast  => s00_axis_tlast,
		s_axis_tready => s00_axis_tready,
		m_axis_tvalid => open,
		m_axis_tdata  => open,
		m_axis_tstrb  => open,
		m_axis_tlast  => open,
		m_axis_tready => '1'
	);
	

	/*
	Insert compute logic here
	drive sFC_ stream signals
	*/

	/*
	Insert output FIFO here
	drive slave side from compute logic
	connect master ports to m00_axis interface
	*/

end arch_imp;
