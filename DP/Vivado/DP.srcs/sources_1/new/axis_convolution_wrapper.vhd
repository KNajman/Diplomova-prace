----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.03.2026 20:38:50
-- Design Name: 
-- Module Name: axis_convolution_wrapper - Structural
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Library xpm;
use xpm.vcomponents.all;

-- Tento wrapper slouží jako nejvyšší (Top) vrstva pro Vivado IP Packager.
-- Přejmenovává porty do standardu AXI4-Stream, aby je Vivado automaticky
-- rozpoznalo a seskupilo do sběrnic.
entity axis_convolution_wrapper is
    generic(
        -- Tyto parametry Vivado automaticky převede do grafického rozhraní (GUI) IP bloku
        IMAGE_WIDTH   : natural := 800;
        IMAGE_HEIGHT  : natural := 800;
        PIXEL_WIDTH   : natural := 8; 
        
        MODE          : string  := "SAME";
        PADDING_VALUE : integer := 0;
        FIFO_DEPTH    : natural := 128; -- Velikost se počítá jako (počet dat v burstu/frekvence zápisu), musí být 2 mocninou, ,defaultní hodnotou je 2048

    -- AXI4 LITE KERNEL CONFIGURATION
        KERNEL_SIZE   : natural := 3;
        KERNEL_WIDTH  : natural := 8;
        C_S_AXI_DATA_WIDTH : integer := 32;
        C_S_AXI_ADDR_WIDTH : integer := 6   

    );
    port(
        -- =====================================================================
        -- AXI4-STREAM SLAVE
        -- =====================================================================
        -- AXI standardní hodiny a reset (AXI reset je active low)
        aclk          : in  std_logic;
        aresetn       : in  std_logic;

        -- ==========================================================
        -- SLAVE AXI-STREAM INTERFACE (Vstupní data z VDMA nebo kamery)
        -- ==========================================================
        s_axis_tdata  : in  std_logic_vector(PIXEL_WIDTH - 1 downto 0);
        s_axis_tvalid : in  std_logic;
        s_axis_tready : out std_logic;

        -- ==========================================================
        -- MASTER AXI-STREAM INTERFACE (Výstupní zpracovaná data do paměti)
        -- ==========================================================
        m_axis_tdata  : out std_logic_vector(PIXEL_WIDTH - 1 downto 0);
        m_axis_tvalid : out std_logic;
        m_axis_tready : in  std_logic;



        -- ==========================================================
        -- AXI4-LITE SLAVE PROTOKOL pro konfiguraci konvolučního jádra
        -- ==========================================================
        -- Sem připojít buď IP blok "Constant" (pevně zadrátované jádro), 
        -- nebo AXI GPIO připojené k procesoru Zynq/Microblaze pro dynamickou změnu
        kernel_config : in  std_logic_vector((KERNEL_SIZE * KERNEL_SIZE * KERNEL_WIDTH) - 1 downto 0);
        
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
end entity axis_convolution_wrapper;

architecture Structural of axis_convolution_wrapper is
        -- ==========================================================
    -- XILINX IP PACKAGER ATTRIBUTY (Vynucení AXI rozhraní)
    -- ==========================================================
    attribute X_INTERFACE_INFO      : string;
    attribute X_INTERFACE_PARAMETER : string;

    -- Asociace hodin s rozhraními a resetem (Tohle Vivadu často chybí!)
    attribute X_INTERFACE_PARAMETER of aclk : signal is "ASSOCIATED_BUSIF s_axis:m_axis, ASSOCIATED_RESET aresetn";

    -- Definice Slave AXI-Stream
    attribute X_INTERFACE_INFO of s_axis_tdata  : signal is "xilinx.com:interface:axis:1.0 s_axis TDATA";
    attribute X_INTERFACE_INFO of s_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 s_axis TVALID";
    attribute X_INTERFACE_INFO of s_axis_tready : signal is "xilinx.com:interface:axis:1.0 s_axis TREADY";

    -- Definice Master AXI-Stream
    attribute X_INTERFACE_INFO of m_axis_tdata  : signal is "xilinx.com:interface:axis:1.0 m_axis TDATA";
    attribute X_INTERFACE_INFO of m_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 m_axis TVALID";
    attribute X_INTERFACE_INFO of m_axis_tready : signal is "xilinx.com:interface:axis:1.0 m_axis TREADY";

    -- Reset (Aby ho Vivado poznalo jako aktivní v nule)
    attribute X_INTERFACE_INFO of aresetn       : signal is "xilinx.com:signal:reset:1.0 aresetn RST";
    attribute X_INTERFACE_PARAMETER of aresetn  : signal is "POLARITY ACTIVE_LOW";

    -- ==========================================================

        -- Interní signály z FIFO IN do Konvoluce
    signal fifo_in_din       : std_logic_vector(PIXEL_WIDTH - 1 downto 0);
    signal fifo_in_valid : std_logic;
    signal fifo_in_ready : std_logic;

    -- Interní signály z Konvoluce do FIFO OUT
    signal fifo_out_dout       : std_logic_vector(PIXEL_WIDTH - 1 downto 0);
    signal fifo_out_valid : std_logic;
    signal fifo_out_ready : std_logic;

    signal rst_high : std_logic;

begin

    ------------------------------------------------
    --VSTUPNÍ FIFO
    ------------------------------------------------
    xpm_fifo_in : xpm_fifo_axis
    generic map (
        FIFO_DEPTH       => FIFO_DEPTH,
        TDATA_WIDTH      => PIXEL_WIDTH,
        CLOCKING_MODE    => "common_clock",
        USE_ADV_FEATURES => "0000",
        FIFO_MEMORY_TYPE => "auto"
    )
    port map (
        s_aresetn      => aresetn,
        s_aclk         => aclk,
        m_aclk         => aclk,
        
        -- SLAVE PORT (Přímo napojeno na vstupy entity)
        s_axis_tdata   => s_axis_tdata,
        s_axis_tvalid  => s_axis_tvalid,
        s_axis_tready  => s_axis_tready,
        
        -- MASTER PORT (Výstup jde do jádra)
        m_axis_tdata   => fifo_in_din,
        m_axis_tvalid  => fifo_in_valid,
        m_axis_tready  => fifo_in_ready,

        -- NEPOUŽITÉ PORTY (Uzemněné nebo ponechané open)
        s_axis_tlast   => '0',
        s_axis_tkeep   => (others => '1'),
        s_axis_tstrb   => (others => '1'),
        s_axis_tuser   => (others => '0'),
        s_axis_tid     => (others => '0'),
        s_axis_tdest   => (others => '0'),
        m_axis_tlast   => open,
        m_axis_tkeep   => open,
        m_axis_tstrb   => open,
        m_axis_tuser   => open,
        m_axis_tid     => open,
        m_axis_tdest   => open,
        almost_empty_axis => open,
        almost_full_axis  => open,
        dbiterr_axis      => open,
        prog_empty_axis   => open,
        prog_full_axis    => open,
        sbiterr_axis      => open,
        injectdbiterr_axis => '0',
        injectsbiterr_axis => '0'
    );

    -----------------------------------------
    -- 2D KONVOLUCE
    ------------------------------------------

    rst_high <= not aresetn;

    -- Instance našeho vytvořeného a otestovaného jádra
    core_inst : entity work.generic_2D_convolution
        generic map(
            IMAGE_WIDTH   => IMAGE_WIDTH,
            IMAGE_HEIGHT  => IMAGE_HEIGHT,
            PIXEL_WIDTH   => PIXEL_WIDTH,
            KERNEL_SIZE   => KERNEL_SIZE,
            KERNEL_WIDTH  => KERNEL_WIDTH,
            MODE          => MODE,
            PADDING_VALUE => PADDING_VALUE
        )
        port map(
            clk            => aclk,
            rst             => rst_high,

            -- Mapování Slave AXI-Stream na vstup
            -- S_AXIS_DATA
            pixel_in        => fifo_in_din,
            pixel_in_valid  => fifo_in_valid,
            pixel_in_ready  => fifo_in_ready,
            
            -- Mapování Master AXI-Stream na výstup
            --M_AXIS_DATA
            pixel_out       => fifo_out_dout,
            pixel_out_valid => fifo_out_valid,
            pixel_out_ready => fifo_out_ready,

            -- Konfigurace jádra, přes AXI-LITE
            kernel_in       => kernel_config
            --návrh AXI LITE
            -- TODO: Implement AXI-LITE interface for kernel configuration
        );

        ----------------------------------------------------------
        -- VÝSTUPNÍ FIFO
        ----------------------------------------------------------
        xpm_fifo_out : xpm_fifo_axis
    generic map (
        FIFO_DEPTH       => FIFO_DEPTH,
        TDATA_WIDTH      => PIXEL_WIDTH,
        CLOCKING_MODE    => "common_clock",
        USE_ADV_FEATURES => "0000",
        FIFO_MEMORY_TYPE => "auto"
    )
    port map (
        s_aresetn      => aresetn,
        s_aclk         => aclk,
        m_aclk         => aclk,
        
        -- SLAVE PORT (Vstup z konvoluce)
        s_axis_tdata   => fifo_out_dout,
        s_axis_tvalid  => fifo_out_valid,
        s_axis_tready  => fifo_out_ready,
        
        -- MASTER PORT (Výstup ven - přímo na porty entity)
        m_axis_tdata   => m_axis_tdata,
        m_axis_tvalid  => m_axis_tvalid,
        m_axis_tready  => m_axis_tready,

        -- NEPOUŽITÉ PORTY
        s_axis_tlast   => '0',
        s_axis_tkeep   => (others => '1'),
        s_axis_tstrb   => (others => '1'),
        s_axis_tuser   => (others => '0'),
        s_axis_tid     => (others => '0'),
        s_axis_tdest   => (others => '0'),
        m_axis_tlast   => open,
        m_axis_tkeep   => open,
        m_axis_tstrb   => open,
        m_axis_tuser   => open,
        m_axis_tid     => open,
        m_axis_tdest   => open,
        almost_empty_axis => open,
        almost_full_axis  => open,
        dbiterr_axis      => open,
        prog_empty_axis   => open,
        prog_full_axis    => open,
        sbiterr_axis      => open,
        injectdbiterr_axis => '0',
        injectsbiterr_axis => '0'
    );

end architecture Structural;
