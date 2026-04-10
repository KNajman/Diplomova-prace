// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Mon Jan 13 13:40:45 2025
// Host        : NORMANDI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/work/2024/HSC/fractal/fractal_vivado/fractal_vivado.gen/sources_1/bd/design_1/ip/design_1_fractal_2_0/design_1_fractal_2_0_stub.v
// Design      : design_1_fractal_2_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu7ev-ffvc1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "design_1_fractal_2_0,fractal,{}" *) (* core_generation_info = "design_1_fractal_2_0,fractal,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=fractal,x_ipVersion=1.0,x_ipCoreRevision=2113908587,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED,C_S_AXI_CONTROL_ADDR_WIDTH=7,C_S_AXI_CONTROL_DATA_WIDTH=32,C_M_AXI_AXIM_C_ID_WIDTH=1,C_M_AXI_AXIM_C_ADDR_WIDTH=64,C_M_AXI_AXIM_C_DATA_WIDTH=32,C_M_AXI_AXIM_C_AWUSER_WIDTH=1,C_M_AXI_AXIM_C_ARUSER_WIDTH=1,C_M_AXI_AXIM_C_WUSER_WIDTH=1,C_M_AXI_AXIM_C_RUSER_WIDTH=1,C_M_AXI_AXIM_C_BUSER_WIDTH=1,C_M_AXI_AXIM_C_USER_VALUE=0x00000000,C_M_AXI_AXIM_C_PROT_VALUE=000,C_M_AXI_AXIM_C_CACHE_VALUE=0011}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "HLS" *) (* x_core_info = "fractal,Vivado 2024.2" *) 
module design_1_fractal_2_0(s_axi_control_ARADDR, 
  s_axi_control_ARREADY, s_axi_control_ARVALID, s_axi_control_AWADDR, 
  s_axi_control_AWREADY, s_axi_control_AWVALID, s_axi_control_BREADY, 
  s_axi_control_BRESP, s_axi_control_BVALID, s_axi_control_RDATA, s_axi_control_RREADY, 
  s_axi_control_RRESP, s_axi_control_RVALID, s_axi_control_WDATA, s_axi_control_WREADY, 
  s_axi_control_WSTRB, s_axi_control_WVALID, ap_clk, ap_rst_n, interrupt, 
  m_axi_AXIM_C_ARADDR, m_axi_AXIM_C_ARBURST, m_axi_AXIM_C_ARCACHE, m_axi_AXIM_C_ARID, 
  m_axi_AXIM_C_ARLEN, m_axi_AXIM_C_ARLOCK, m_axi_AXIM_C_ARPROT, m_axi_AXIM_C_ARQOS, 
  m_axi_AXIM_C_ARREADY, m_axi_AXIM_C_ARREGION, m_axi_AXIM_C_ARSIZE, m_axi_AXIM_C_ARVALID, 
  m_axi_AXIM_C_AWADDR, m_axi_AXIM_C_AWBURST, m_axi_AXIM_C_AWCACHE, m_axi_AXIM_C_AWID, 
  m_axi_AXIM_C_AWLEN, m_axi_AXIM_C_AWLOCK, m_axi_AXIM_C_AWPROT, m_axi_AXIM_C_AWQOS, 
  m_axi_AXIM_C_AWREADY, m_axi_AXIM_C_AWREGION, m_axi_AXIM_C_AWSIZE, m_axi_AXIM_C_AWVALID, 
  m_axi_AXIM_C_BID, m_axi_AXIM_C_BREADY, m_axi_AXIM_C_BRESP, m_axi_AXIM_C_BVALID, 
  m_axi_AXIM_C_RDATA, m_axi_AXIM_C_RID, m_axi_AXIM_C_RLAST, m_axi_AXIM_C_RREADY, 
  m_axi_AXIM_C_RRESP, m_axi_AXIM_C_RVALID, m_axi_AXIM_C_WDATA, m_axi_AXIM_C_WID, 
  m_axi_AXIM_C_WLAST, m_axi_AXIM_C_WREADY, m_axi_AXIM_C_WSTRB, m_axi_AXIM_C_WVALID)
/* synthesis syn_black_box black_box_pad_pin="s_axi_control_ARADDR[6:0],s_axi_control_ARREADY,s_axi_control_ARVALID,s_axi_control_AWADDR[6:0],s_axi_control_AWREADY,s_axi_control_AWVALID,s_axi_control_BREADY,s_axi_control_BRESP[1:0],s_axi_control_BVALID,s_axi_control_RDATA[31:0],s_axi_control_RREADY,s_axi_control_RRESP[1:0],s_axi_control_RVALID,s_axi_control_WDATA[31:0],s_axi_control_WREADY,s_axi_control_WSTRB[3:0],s_axi_control_WVALID,ap_rst_n,interrupt,m_axi_AXIM_C_ARADDR[63:0],m_axi_AXIM_C_ARBURST[1:0],m_axi_AXIM_C_ARCACHE[3:0],m_axi_AXIM_C_ARID[0:0],m_axi_AXIM_C_ARLEN[7:0],m_axi_AXIM_C_ARLOCK[1:0],m_axi_AXIM_C_ARPROT[2:0],m_axi_AXIM_C_ARQOS[3:0],m_axi_AXIM_C_ARREADY,m_axi_AXIM_C_ARREGION[3:0],m_axi_AXIM_C_ARSIZE[2:0],m_axi_AXIM_C_ARVALID,m_axi_AXIM_C_AWADDR[63:0],m_axi_AXIM_C_AWBURST[1:0],m_axi_AXIM_C_AWCACHE[3:0],m_axi_AXIM_C_AWID[0:0],m_axi_AXIM_C_AWLEN[7:0],m_axi_AXIM_C_AWLOCK[1:0],m_axi_AXIM_C_AWPROT[2:0],m_axi_AXIM_C_AWQOS[3:0],m_axi_AXIM_C_AWREADY,m_axi_AXIM_C_AWREGION[3:0],m_axi_AXIM_C_AWSIZE[2:0],m_axi_AXIM_C_AWVALID,m_axi_AXIM_C_BID[0:0],m_axi_AXIM_C_BREADY,m_axi_AXIM_C_BRESP[1:0],m_axi_AXIM_C_BVALID,m_axi_AXIM_C_RDATA[31:0],m_axi_AXIM_C_RID[0:0],m_axi_AXIM_C_RLAST,m_axi_AXIM_C_RREADY,m_axi_AXIM_C_RRESP[1:0],m_axi_AXIM_C_RVALID,m_axi_AXIM_C_WDATA[31:0],m_axi_AXIM_C_WID[0:0],m_axi_AXIM_C_WLAST,m_axi_AXIM_C_WREADY,m_axi_AXIM_C_WSTRB[3:0],m_axi_AXIM_C_WVALID" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR" *) (* x_interface_mode = "slave s_axi_control" *) (* x_interface_parameter = "XIL_INTERFACENAME s_axi_control, ADDR_WIDTH 7, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, FREQ_HZ 249975021, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [6:0]s_axi_control_ARADDR;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY" *) output s_axi_control_ARREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID" *) input s_axi_control_ARVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR" *) input [6:0]s_axi_control_AWADDR;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY" *) output s_axi_control_AWREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID" *) input s_axi_control_AWVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi_control BREADY" *) input s_axi_control_BREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi_control BRESP" *) output [1:0]s_axi_control_BRESP;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi_control BVALID" *) output s_axi_control_BVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi_control RDATA" *) output [31:0]s_axi_control_RDATA;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi_control RREADY" *) input s_axi_control_RREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi_control RRESP" *) output [1:0]s_axi_control_RRESP;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi_control RVALID" *) output s_axi_control_RVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi_control WDATA" *) input [31:0]s_axi_control_WDATA;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi_control WREADY" *) output s_axi_control_WREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB" *) input [3:0]s_axi_control_WSTRB;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi_control WVALID" *) input s_axi_control_WVALID;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* x_interface_mode = "slave ap_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_control:m_axi_AXIM_C, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 249975021, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *) input ap_clk /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *) (* x_interface_mode = "slave ap_rst_n" *) (* x_interface_parameter = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input ap_rst_n;
  (* x_interface_info = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *) (* x_interface_mode = "master interrupt" *) (* x_interface_parameter = "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1" *) output interrupt;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C ARADDR" *) (* x_interface_mode = "master m_axi_AXIM_C" *) (* x_interface_parameter = "XIL_INTERFACENAME m_axi_AXIM_C, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 128, MAX_BURST_LENGTH 256, PROTOCOL AXI4, READ_WRITE_MODE WRITE_ONLY, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, ADDR_WIDTH 64, DATA_WIDTH 32, FREQ_HZ 249975021, ID_WIDTH 1, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.0, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output [63:0]m_axi_AXIM_C_ARADDR;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C ARBURST" *) output [1:0]m_axi_AXIM_C_ARBURST;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C ARCACHE" *) output [3:0]m_axi_AXIM_C_ARCACHE;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C ARID" *) output [0:0]m_axi_AXIM_C_ARID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C ARLEN" *) output [7:0]m_axi_AXIM_C_ARLEN;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C ARLOCK" *) output [1:0]m_axi_AXIM_C_ARLOCK;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C ARPROT" *) output [2:0]m_axi_AXIM_C_ARPROT;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C ARQOS" *) output [3:0]m_axi_AXIM_C_ARQOS;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C ARREADY" *) input m_axi_AXIM_C_ARREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C ARREGION" *) output [3:0]m_axi_AXIM_C_ARREGION;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C ARSIZE" *) output [2:0]m_axi_AXIM_C_ARSIZE;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C ARVALID" *) output m_axi_AXIM_C_ARVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C AWADDR" *) output [63:0]m_axi_AXIM_C_AWADDR;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C AWBURST" *) output [1:0]m_axi_AXIM_C_AWBURST;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C AWCACHE" *) output [3:0]m_axi_AXIM_C_AWCACHE;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C AWID" *) output [0:0]m_axi_AXIM_C_AWID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C AWLEN" *) output [7:0]m_axi_AXIM_C_AWLEN;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C AWLOCK" *) output [1:0]m_axi_AXIM_C_AWLOCK;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C AWPROT" *) output [2:0]m_axi_AXIM_C_AWPROT;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C AWQOS" *) output [3:0]m_axi_AXIM_C_AWQOS;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C AWREADY" *) input m_axi_AXIM_C_AWREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C AWREGION" *) output [3:0]m_axi_AXIM_C_AWREGION;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C AWSIZE" *) output [2:0]m_axi_AXIM_C_AWSIZE;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C AWVALID" *) output m_axi_AXIM_C_AWVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C BID" *) input [0:0]m_axi_AXIM_C_BID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C BREADY" *) output m_axi_AXIM_C_BREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C BRESP" *) input [1:0]m_axi_AXIM_C_BRESP;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C BVALID" *) input m_axi_AXIM_C_BVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C RDATA" *) input [31:0]m_axi_AXIM_C_RDATA;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C RID" *) input [0:0]m_axi_AXIM_C_RID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C RLAST" *) input m_axi_AXIM_C_RLAST;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C RREADY" *) output m_axi_AXIM_C_RREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C RRESP" *) input [1:0]m_axi_AXIM_C_RRESP;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C RVALID" *) input m_axi_AXIM_C_RVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C WDATA" *) output [31:0]m_axi_AXIM_C_WDATA;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C WID" *) output [0:0]m_axi_AXIM_C_WID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C WLAST" *) output m_axi_AXIM_C_WLAST;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C WREADY" *) input m_axi_AXIM_C_WREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C WSTRB" *) output [3:0]m_axi_AXIM_C_WSTRB;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 m_axi_AXIM_C WVALID" *) output m_axi_AXIM_C_WVALID;
endmodule
