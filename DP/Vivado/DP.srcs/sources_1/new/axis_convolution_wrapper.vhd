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

-- Tento wrapper slouží jako nejvyšší (Top) vrstva pro Vivado IP Packager.
-- Přejmenovává porty do standardu AXI4-Stream, aby je Vivado automaticky
-- rozpoznalo a seskupilo do sběrnic.
entity axis_convolution_wrapper is
    generic(
        -- Tyto parametry Vivado automaticky převede do grafického rozhraní (GUI) IP bloku
        IMAGE_WIDTH   : natural := 800;
        IMAGE_HEIGHT  : natural := 800;
        PIXEL_WIDTH   : natural := 8;
        KERNEL_SIZE   : natural := 3;
        KERNEL_WIDTH  : natural := 8;
        MODE          : string  := "VALID";
        PADDING_VALUE : integer := 0
    );
    port(
        -- AXI standardní hodiny a reset (AXI reset je vždy aktivní v nule!)
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
        -- KONFIGURACE JÁDRA (Custom port)
        -- ==========================================================
        -- Sem připojít buď IP blok "Constant" (pevně zadrátované jádro), 
        -- nebo AXI GPIO připojené k procesoru Zynq/Microblaze pro dynamickou změnu
        kernel_config : in  std_logic_vector((KERNEL_SIZE * KERNEL_SIZE * KERNEL_WIDTH) - 1 downto 0)
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

    signal rst_high : std_logic;

begin

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
            -- Mapování Slave AXI-Stream na vstup
            -- S_AXIS_DATA
            pixel_in        => s_axis_tdata,
            pixel_in_valid  => s_axis_tvalid,
            pixel_in_ready  => s_axis_tready,
            kernel_in       => kernel_config,
            -- Standardní hodiny a reset
            aclk            => aclk,
            rst             => rst_high,
            -- Mapování Master AXI-Stream na výstup
            --M_AXIS_DATA
            pixel_out       => m_axis_tdata,
            pixel_out_valid => m_axis_tvalid,
            pixel_out_ready => m_axis_tready
        );

end architecture Structural;
