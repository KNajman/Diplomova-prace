-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:hls:hls_passthrough:1.0
-- IP Revision: 2114608609

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_DMA_2C_hls_passthrough_0_0 IS
  PORT (
    s_axi_control_ARADDR : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_control_ARREADY : OUT STD_LOGIC;
    s_axi_control_ARVALID : IN STD_LOGIC;
    s_axi_control_AWADDR : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_control_AWREADY : OUT STD_LOGIC;
    s_axi_control_AWVALID : IN STD_LOGIC;
    s_axi_control_BREADY : IN STD_LOGIC;
    s_axi_control_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_control_BVALID : OUT STD_LOGIC;
    s_axi_control_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_control_RREADY : IN STD_LOGIC;
    s_axi_control_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_control_RVALID : OUT STD_LOGIC;
    s_axi_control_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_control_WREADY : OUT STD_LOGIC;
    s_axi_control_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_control_WVALID : IN STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    interrupt : OUT STD_LOGIC;
    in_stream_TDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    in_stream_TKEEP : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    in_stream_TLAST : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    in_stream_TREADY : OUT STD_LOGIC;
    in_stream_TSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    in_stream_TUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    in_stream_TVALID : IN STD_LOGIC;
    out_stream_TDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    out_stream_TKEEP : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    out_stream_TLAST : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    out_stream_TREADY : IN STD_LOGIC;
    out_stream_TSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    out_stream_TUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    out_stream_TVALID : OUT STD_LOGIC
  );
END design_DMA_2C_hls_passthrough_0_0;

ARCHITECTURE design_DMA_2C_hls_passthrough_0_0_arch OF design_DMA_2C_hls_passthrough_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_DMA_2C_hls_passthrough_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT hls_passthrough IS
    GENERIC (
      C_S_AXI_CONTROL_ADDR_WIDTH : INTEGER;
      C_S_AXI_CONTROL_DATA_WIDTH : INTEGER
    );
    PORT (
      s_axi_control_ARADDR : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_control_ARREADY : OUT STD_LOGIC;
      s_axi_control_ARVALID : IN STD_LOGIC;
      s_axi_control_AWADDR : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_control_AWREADY : OUT STD_LOGIC;
      s_axi_control_AWVALID : IN STD_LOGIC;
      s_axi_control_BREADY : IN STD_LOGIC;
      s_axi_control_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_control_BVALID : OUT STD_LOGIC;
      s_axi_control_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_control_RREADY : IN STD_LOGIC;
      s_axi_control_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_control_RVALID : OUT STD_LOGIC;
      s_axi_control_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_control_WREADY : OUT STD_LOGIC;
      s_axi_control_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_control_WVALID : IN STD_LOGIC;
      ap_clk : IN STD_LOGIC;
      ap_rst_n : IN STD_LOGIC;
      interrupt : OUT STD_LOGIC;
      in_stream_TDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      in_stream_TKEEP : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      in_stream_TLAST : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      in_stream_TREADY : OUT STD_LOGIC;
      in_stream_TSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      in_stream_TUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      in_stream_TVALID : IN STD_LOGIC;
      out_stream_TDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      out_stream_TKEEP : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      out_stream_TLAST : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      out_stream_TREADY : IN STD_LOGIC;
      out_stream_TSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      out_stream_TUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      out_stream_TVALID : OUT STD_LOGIC
    );
  END COMPONENT hls_passthrough;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_MODE : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
  ATTRIBUTE X_INTERFACE_MODE OF ap_clk: SIGNAL IS "slave ap_clk";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_clk: SIGNAL IS "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_control:in_stream:out_stream, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_DMA_2C_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst_n: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  ATTRIBUTE X_INTERFACE_MODE OF ap_rst_n: SIGNAL IS "slave ap_rst_n";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_rst_n: SIGNAL IS "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF in_stream_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 in_stream TDATA";
  ATTRIBUTE X_INTERFACE_MODE OF in_stream_TDATA: SIGNAL IS "slave in_stream";
  ATTRIBUTE X_INTERFACE_PARAMETER OF in_stream_TDATA: SIGNAL IS "XIL_INTERFACENAME in_stream, TUSER_WIDTH 1, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN design_DMA_2C_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF in_stream_TKEEP: SIGNAL IS "xilinx.com:interface:axis:1.0 in_stream TKEEP";
  ATTRIBUTE X_INTERFACE_INFO OF in_stream_TLAST: SIGNAL IS "xilinx.com:interface:axis:1.0 in_stream TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF in_stream_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 in_stream TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF in_stream_TSTRB: SIGNAL IS "xilinx.com:interface:axis:1.0 in_stream TSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF in_stream_TUSER: SIGNAL IS "xilinx.com:interface:axis:1.0 in_stream TUSER";
  ATTRIBUTE X_INTERFACE_INFO OF in_stream_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 in_stream TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF interrupt: SIGNAL IS "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT";
  ATTRIBUTE X_INTERFACE_MODE OF interrupt: SIGNAL IS "master interrupt";
  ATTRIBUTE X_INTERFACE_PARAMETER OF interrupt: SIGNAL IS "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1";
  ATTRIBUTE X_INTERFACE_INFO OF out_stream_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 out_stream TDATA";
  ATTRIBUTE X_INTERFACE_MODE OF out_stream_TDATA: SIGNAL IS "master out_stream";
  ATTRIBUTE X_INTERFACE_PARAMETER OF out_stream_TDATA: SIGNAL IS "XIL_INTERFACENAME out_stream, TUSER_WIDTH 1, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN design_DMA_2C_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF out_stream_TKEEP: SIGNAL IS "xilinx.com:interface:axis:1.0 out_stream TKEEP";
  ATTRIBUTE X_INTERFACE_INFO OF out_stream_TLAST: SIGNAL IS "xilinx.com:interface:axis:1.0 out_stream TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF out_stream_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 out_stream TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF out_stream_TSTRB: SIGNAL IS "xilinx.com:interface:axis:1.0 out_stream TSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF out_stream_TUSER: SIGNAL IS "xilinx.com:interface:axis:1.0 out_stream TUSER";
  ATTRIBUTE X_INTERFACE_INFO OF out_stream_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 out_stream TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR";
  ATTRIBUTE X_INTERFACE_MODE OF s_axi_control_ARADDR: SIGNAL IS "slave s_axi_control";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_control_ARADDR: SIGNAL IS "XIL_INTERFACENAME s_axi_control, ADDR_WIDTH 4, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, FREQ_HZ 99999001, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_DMA_2C_zynq_ultra_ps_e_0_0_pl_clk0, NUM_READ_TH" & 
"READS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control WVALID";
BEGIN
  U0 : hls_passthrough
    GENERIC MAP (
      C_S_AXI_CONTROL_ADDR_WIDTH => 4,
      C_S_AXI_CONTROL_DATA_WIDTH => 32
    )
    PORT MAP (
      s_axi_control_ARADDR => s_axi_control_ARADDR,
      s_axi_control_ARREADY => s_axi_control_ARREADY,
      s_axi_control_ARVALID => s_axi_control_ARVALID,
      s_axi_control_AWADDR => s_axi_control_AWADDR,
      s_axi_control_AWREADY => s_axi_control_AWREADY,
      s_axi_control_AWVALID => s_axi_control_AWVALID,
      s_axi_control_BREADY => s_axi_control_BREADY,
      s_axi_control_BRESP => s_axi_control_BRESP,
      s_axi_control_BVALID => s_axi_control_BVALID,
      s_axi_control_RDATA => s_axi_control_RDATA,
      s_axi_control_RREADY => s_axi_control_RREADY,
      s_axi_control_RRESP => s_axi_control_RRESP,
      s_axi_control_RVALID => s_axi_control_RVALID,
      s_axi_control_WDATA => s_axi_control_WDATA,
      s_axi_control_WREADY => s_axi_control_WREADY,
      s_axi_control_WSTRB => s_axi_control_WSTRB,
      s_axi_control_WVALID => s_axi_control_WVALID,
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      interrupt => interrupt,
      in_stream_TDATA => in_stream_TDATA,
      in_stream_TKEEP => in_stream_TKEEP,
      in_stream_TLAST => in_stream_TLAST,
      in_stream_TREADY => in_stream_TREADY,
      in_stream_TSTRB => in_stream_TSTRB,
      in_stream_TUSER => in_stream_TUSER,
      in_stream_TVALID => in_stream_TVALID,
      out_stream_TDATA => out_stream_TDATA,
      out_stream_TKEEP => out_stream_TKEEP,
      out_stream_TLAST => out_stream_TLAST,
      out_stream_TREADY => out_stream_TREADY,
      out_stream_TSTRB => out_stream_TSTRB,
      out_stream_TUSER => out_stream_TUSER,
      out_stream_TVALID => out_stream_TVALID
    );
END design_DMA_2C_hls_passthrough_0_0_arch;
