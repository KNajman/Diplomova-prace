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
-- IP Revision: 2114596058

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_DMA_2C_hls_passthrough_0_0 IS
  PORT (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
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
    PORT (
      ap_clk : IN STD_LOGIC;
      ap_rst_n : IN STD_LOGIC;
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
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF design_DMA_2C_hls_passthrough_0_0_arch: ARCHITECTURE IS "hls_passthrough,Vivado 2025.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF design_DMA_2C_hls_passthrough_0_0_arch : ARCHITECTURE IS "design_DMA_2C_hls_passthrough_0_0,hls_passthrough,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF design_DMA_2C_hls_passthrough_0_0_arch: ARCHITECTURE IS "design_DMA_2C_hls_passthrough_0_0,hls_passthrough,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=hls_passthrough,x_ipVersion=1.0,x_ipCoreRevision=2114596058,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED}";
  ATTRIBUTE SDX_KERNEL : STRING;
  ATTRIBUTE SDX_KERNEL OF hls_passthrough: COMPONENT IS "true";
  ATTRIBUTE SDX_KERNEL_TYPE : STRING;
  ATTRIBUTE SDX_KERNEL_TYPE OF hls_passthrough: COMPONENT IS "hls";
  ATTRIBUTE SDX_KERNEL_SYNTH_INST : STRING;
  ATTRIBUTE SDX_KERNEL_SYNTH_INST OF hls_passthrough: COMPONENT IS "U0";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF design_DMA_2C_hls_passthrough_0_0_arch: ARCHITECTURE IS "HLS";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_MODE : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
  ATTRIBUTE X_INTERFACE_MODE OF ap_clk: SIGNAL IS "slave ap_clk";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_clk: SIGNAL IS "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF in_stream:out_stream, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_DMA_2C_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
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
  ATTRIBUTE X_INTERFACE_INFO OF out_stream_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 out_stream TDATA";
  ATTRIBUTE X_INTERFACE_MODE OF out_stream_TDATA: SIGNAL IS "master out_stream";
  ATTRIBUTE X_INTERFACE_PARAMETER OF out_stream_TDATA: SIGNAL IS "XIL_INTERFACENAME out_stream, TUSER_WIDTH 1, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN design_DMA_2C_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF out_stream_TKEEP: SIGNAL IS "xilinx.com:interface:axis:1.0 out_stream TKEEP";
  ATTRIBUTE X_INTERFACE_INFO OF out_stream_TLAST: SIGNAL IS "xilinx.com:interface:axis:1.0 out_stream TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF out_stream_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 out_stream TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF out_stream_TSTRB: SIGNAL IS "xilinx.com:interface:axis:1.0 out_stream TSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF out_stream_TUSER: SIGNAL IS "xilinx.com:interface:axis:1.0 out_stream TUSER";
  ATTRIBUTE X_INTERFACE_INFO OF out_stream_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 out_stream TVALID";
BEGIN
  U0 : hls_passthrough
    PORT MAP (
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
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
