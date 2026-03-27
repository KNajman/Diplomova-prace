library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Library xpm;
use xpm.vcomponents.all;

entity axi_convolution_core is
	generic (
		-- Users to add parameters here
        KERNEL_SIZE : integer := 3;
        KERNEL_WIDTH : integer := 8;
		-- User parameters ends
		-- Do not modify the parameters beyond this line
		
		-- Parameters of Axi Slave Bus Interface S00_AXI
		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 6
	);
	port (
		-- Users to add ports here
        --own port for KERNEL
		-- SLAVE STREAM (Vstup obrazu)
		s_axis_tdata  : in  std_logic_vector(7 downto 0);
		s_axis_tvalid : in  std_logic;
		s_axis_tready : out std_logic;
		
		-- MASTER STREAM (Výstup obrazu)
		m_axis_tdata  : out std_logic_vector(7 downto 0);
		m_axis_tvalid : out std_logic;
		m_axis_tready : in  std_logic;

		int_kernel : out std_logic_vector((KERNEL_SIZE*KERNEL_SIZE *KERNEL_WIDTH) - 1 downto 0);
		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface S00_AXI
		s00_axi_aclk	: in std_logic;
		s00_axi_aresetn	: in std_logic;
		s00_axi_awaddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_awprot	: in std_logic_vector(2 downto 0);
		s00_axi_awvalid	: in std_logic;
		s00_axi_awready	: out std_logic;
		s00_axi_wdata	: in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_wstrb	: in std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
		s00_axi_wvalid	: in std_logic;
		s00_axi_wready	: out std_logic;
		s00_axi_bresp	: out std_logic_vector(1 downto 0);
		s00_axi_bvalid	: out std_logic;
		s00_axi_bready	: in std_logic;
		s00_axi_araddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_arprot	: in std_logic_vector(2 downto 0);
		s00_axi_arvalid	: in std_logic;
		s00_axi_arready	: out std_logic;
		s00_axi_rdata	: out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_rresp	: out std_logic_vector(1 downto 0);
		s00_axi_rvalid	: out std_logic;
		s00_axi_rready	: in std_logic
	);
end axi_convolution_core;

architecture arch_imp of axi_convolution_core is

	-- component declaration
	component axi_convolution_core_slave_lite_v1_0_S00_AXI is
		generic (
		KERNEL_SIZE : integer;
        KERNEL_WIDTH : integer;
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 6
		);
		port (
		-- My ports start here
		kernel_out : out std_logic_vector((KERNEL_SIZE * KERNEL_SIZE * KERNEL_WIDTH) - 1 downto 0);
		-- My ports end here
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component axi_convolution_core_slave_lite_v1_0_S00_AXI;

begin

-- Instantiation of Axi Bus Interface S00_AXI
axi_convolution_core_slave_lite_v1_0_S00_AXI_inst : axi_convolution_core_slave_lite_v1_0_S00_AXI
	generic map (
	    KERNEL_SIZE => KERNEL_SIZE,
	    KERNEL_WIDTH => KERNEL_WIDTH,
		C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
	)
	port map (
	    kernel_out => int_kernel,
		S_AXI_ACLK	=> s00_axi_aclk,
		S_AXI_ARESETN	=> s00_axi_aresetn,
		S_AXI_AWADDR	=> s00_axi_awaddr,
		S_AXI_AWPROT	=> s00_axi_awprot,
		S_AXI_AWVALID	=> s00_axi_awvalid,
		S_AXI_AWREADY	=> s00_axi_awready,
		S_AXI_WDATA	=> s00_axi_wdata,
		S_AXI_WSTRB	=> s00_axi_wstrb,
		S_AXI_WVALID	=> s00_axi_wvalid,
		S_AXI_WREADY	=> s00_axi_wready,
		S_AXI_BRESP	=> s00_axi_bresp,
		S_AXI_BVALID	=> s00_axi_bvalid,
		S_AXI_BREADY	=> s00_axi_bready,
		S_AXI_ARADDR	=> s00_axi_araddr,
		S_AXI_ARPROT	=> s00_axi_arprot,
		S_AXI_ARVALID	=> s00_axi_arvalid,
		S_AXI_ARREADY	=> s00_axi_arready,
		S_AXI_RDATA	=> s00_axi_rdata,
		S_AXI_RRESP	=> s00_axi_rresp,
		S_AXI_RVALID	=> s00_axi_rvalid,
		S_AXI_RREADY	=> s00_axi_rready
	);

	-- Add user logic here

--	Inst_Convolution : entity entity axis_convolution_wrapper is
--    generic(
--        -- Tyto parametry Vivado automaticky převede do grafického rozhraní (GUI) IP bloku
--        IMAGE_WIDTH   : natural := 800;
--        IMAGE_HEIGHT  : natural := 800;
--        PIXEL_WIDTH   : natural := 8;
--        KERNEL_SIZE   : natural := 3;
--        KERNEL_WIDTH  : natural := 8;
--        MODE          : string  := "SAME";
--        PADDING_VALUE : integer := 0;
--        FIFO_DEPTH    : natural := 128 -- Velikost se počítá jako (počet dat v burstu/frekvence zápisu), musí být 2 mocninou, ,defaultní hodnotou je 2048
--    );
--        port map(
--        clk             => s00_axi_aclk,  -- Využíváme hodiny AXI sběrnice
--        rst             => s00_axi_arestn,      -- Invertovaný reset
        
--        -- Napojení na porty TOP entity
--        s_axis_tdata        => s_axis_tdata,
--        s_axis_tvalid  => s_axis_tvalid,
--        s_axis_tready  => s_axis_tready,
        
--        -- Zde čteme data z našeho AXI-Lite rozhraní!
--        kernel_in       => int_kernel,
        
--        -- Napojení na porty TOP entity
--        m_axis_tdata        => m_axis_tdata,
--        m_axis_tvalid  => m_axis_tvalid,
--        m_axis_tready  => m_axis_tready
--    );


	-- User logic ends

end arch_imp;
