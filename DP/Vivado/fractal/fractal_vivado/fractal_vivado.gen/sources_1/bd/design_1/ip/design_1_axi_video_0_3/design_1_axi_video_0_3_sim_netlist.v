// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Mon Jan 13 13:20:06 2025
// Host        : NORMANDI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/work/2024/HSC/fractal/fractal_vivado/fractal_vivado.gen/sources_1/bd/design_1/ip/design_1_axi_video_0_3/design_1_axi_video_0_3_sim_netlist.v
// Design      : design_1_axi_video_0_3
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu7ev-ffvc1156-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_axi_video_0_3,axi_video_v1_0,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "axi_video_v1_0,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module design_1_axi_video_0_3
   (video_clk,
    video_rgb,
    video_hsync,
    video_vsync,
    video_active,
    s00_axi_aclk,
    s00_axi_aresetn,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready,
    m00_axi_aclk,
    m00_axi_aresetn,
    m00_axi_awid,
    m00_axi_awaddr,
    m00_axi_awlen,
    m00_axi_awsize,
    m00_axi_awburst,
    m00_axi_awlock,
    m00_axi_awcache,
    m00_axi_awprot,
    m00_axi_awqos,
    m00_axi_awuser,
    m00_axi_awvalid,
    m00_axi_awready,
    m00_axi_wdata,
    m00_axi_wstrb,
    m00_axi_wlast,
    m00_axi_wuser,
    m00_axi_wvalid,
    m00_axi_wready,
    m00_axi_bid,
    m00_axi_bresp,
    m00_axi_buser,
    m00_axi_bvalid,
    m00_axi_bready,
    m00_axi_arid,
    m00_axi_araddr,
    m00_axi_arlen,
    m00_axi_arsize,
    m00_axi_arburst,
    m00_axi_arlock,
    m00_axi_arcache,
    m00_axi_arprot,
    m00_axi_arqos,
    m00_axi_aruser,
    m00_axi_arvalid,
    m00_axi_arready,
    m00_axi_rid,
    m00_axi_rdata,
    m00_axi_rresp,
    m00_axi_rlast,
    m00_axi_ruser,
    m00_axi_rvalid,
    m00_axi_rready);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 video_clk CLK" *) (* x_interface_mode = "slave video_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME video_clk, FREQ_HZ 147901886, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk1, INSERT_VIP 0" *) input video_clk;
  output [35:0]video_rgb;
  output video_hsync;
  output video_vsync;
  output video_active;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK" *) (* x_interface_mode = "slave S00_AXI_CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 147901886, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk1, INSERT_VIP 0" *) input s00_axi_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 S00_AXI_RST RST" *) (* x_interface_mode = "slave S00_AXI_RST" *) (* x_interface_parameter = "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axi_aresetn;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *) (* x_interface_mode = "slave S00_AXI" *) (* x_interface_parameter = "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 32, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 147901886, ID_WIDTH 0, ADDR_WIDTH 6, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [5:0]s00_axi_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *) input [2:0]s00_axi_awprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *) input s00_axi_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *) output s00_axi_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *) input [31:0]s00_axi_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *) input [3:0]s00_axi_wstrb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *) input s00_axi_wvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *) output s00_axi_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *) output [1:0]s00_axi_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *) output s00_axi_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *) input s00_axi_bready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *) input [5:0]s00_axi_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *) input [2:0]s00_axi_arprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *) input s00_axi_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *) output s00_axi_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *) output [31:0]s00_axi_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *) output [1:0]s00_axi_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *) output s00_axi_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) input s00_axi_rready;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 M00_AXI_CLK CLK" *) (* x_interface_mode = "slave M00_AXI_CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME M00_AXI_CLK, ASSOCIATED_BUSIF M00_AXI, ASSOCIATED_RESET m00_axi_aresetn, FREQ_HZ 147901886, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk1, INSERT_VIP 0" *) input m00_axi_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 M00_AXI_RST RST" *) (* x_interface_mode = "slave M00_AXI_RST" *) (* x_interface_parameter = "XIL_INTERFACENAME M00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input m00_axi_aresetn;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI AWID" *) (* x_interface_mode = "master M00_AXI" *) (* x_interface_parameter = "XIL_INTERFACENAME M00_AXI, WIZ_DATA_WIDTH 32, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 64, PROTOCOL AXI4, FREQ_HZ 147901886, ID_WIDTH 1, ADDR_WIDTH 64, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 8, RUSER_WIDTH 8, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output [0:0]m00_axi_awid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI AWADDR" *) output [63:0]m00_axi_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI AWLEN" *) output [7:0]m00_axi_awlen;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI AWSIZE" *) output [2:0]m00_axi_awsize;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI AWBURST" *) output [1:0]m00_axi_awburst;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI AWLOCK" *) output m00_axi_awlock;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI AWCACHE" *) output [3:0]m00_axi_awcache;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI AWPROT" *) output [2:0]m00_axi_awprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI AWQOS" *) output [3:0]m00_axi_awqos;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI AWUSER" *) output [0:0]m00_axi_awuser;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI AWVALID" *) output m00_axi_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI AWREADY" *) input m00_axi_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI WDATA" *) output [63:0]m00_axi_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI WSTRB" *) output [7:0]m00_axi_wstrb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI WLAST" *) output m00_axi_wlast;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI WUSER" *) output [7:0]m00_axi_wuser;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI WVALID" *) output m00_axi_wvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI WREADY" *) input m00_axi_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI BID" *) input [0:0]m00_axi_bid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI BRESP" *) input [1:0]m00_axi_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI BUSER" *) input [0:0]m00_axi_buser;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI BVALID" *) input m00_axi_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI BREADY" *) output m00_axi_bready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI ARID" *) output [0:0]m00_axi_arid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI ARADDR" *) output [63:0]m00_axi_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI ARLEN" *) output [7:0]m00_axi_arlen;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI ARSIZE" *) output [2:0]m00_axi_arsize;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI ARBURST" *) output [1:0]m00_axi_arburst;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI ARLOCK" *) output m00_axi_arlock;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI ARCACHE" *) output [3:0]m00_axi_arcache;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI ARPROT" *) output [2:0]m00_axi_arprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI ARQOS" *) output [3:0]m00_axi_arqos;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI ARUSER" *) output [0:0]m00_axi_aruser;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI ARVALID" *) output m00_axi_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI ARREADY" *) input m00_axi_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI RID" *) input [0:0]m00_axi_rid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI RDATA" *) input [63:0]m00_axi_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI RRESP" *) input [1:0]m00_axi_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI RLAST" *) input m00_axi_rlast;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI RUSER" *) input [7:0]m00_axi_ruser;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI RVALID" *) input m00_axi_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI RREADY" *) output m00_axi_rready;

  wire \<const0> ;
  wire \<const1> ;
  wire m00_axi_aclk;
  wire [63:0]m00_axi_araddr;
  wire [0:0]\^m00_axi_arburst ;
  wire m00_axi_aresetn;
  wire [5:0]\^m00_axi_arlen ;
  wire m00_axi_arready;
  wire m00_axi_arvalid;
  wire [63:0]m00_axi_rdata;
  wire m00_axi_rlast;
  wire m00_axi_rready;
  wire [1:0]m00_axi_rresp;
  wire [7:0]m00_axi_ruser;
  wire m00_axi_rvalid;
  wire s00_axi_aclk;
  wire [5:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [5:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire video_active;
  wire video_clk;
  wire video_hsync;
  wire [35:4]\^video_rgb ;
  wire video_vsync;

  assign m00_axi_arburst[1] = \<const0> ;
  assign m00_axi_arburst[0] = \^m00_axi_arburst [0];
  assign m00_axi_arcache[3] = \<const0> ;
  assign m00_axi_arcache[2] = \<const0> ;
  assign m00_axi_arcache[1] = \<const1> ;
  assign m00_axi_arcache[0] = \<const0> ;
  assign m00_axi_arid[0] = \<const0> ;
  assign m00_axi_arlen[7] = \<const0> ;
  assign m00_axi_arlen[6] = \<const0> ;
  assign m00_axi_arlen[5:0] = \^m00_axi_arlen [5:0];
  assign m00_axi_arlock = \<const0> ;
  assign m00_axi_arprot[2] = \<const0> ;
  assign m00_axi_arprot[1] = \<const0> ;
  assign m00_axi_arprot[0] = \<const0> ;
  assign m00_axi_arqos[3] = \<const0> ;
  assign m00_axi_arqos[2] = \<const0> ;
  assign m00_axi_arqos[1] = \<const0> ;
  assign m00_axi_arqos[0] = \<const0> ;
  assign m00_axi_arsize[2] = \<const0> ;
  assign m00_axi_arsize[1] = \<const1> ;
  assign m00_axi_arsize[0] = \<const1> ;
  assign m00_axi_aruser[0] = \<const1> ;
  assign m00_axi_awaddr[63] = \<const0> ;
  assign m00_axi_awaddr[62] = \<const0> ;
  assign m00_axi_awaddr[61] = \<const0> ;
  assign m00_axi_awaddr[60] = \<const0> ;
  assign m00_axi_awaddr[59] = \<const0> ;
  assign m00_axi_awaddr[58] = \<const0> ;
  assign m00_axi_awaddr[57] = \<const0> ;
  assign m00_axi_awaddr[56] = \<const0> ;
  assign m00_axi_awaddr[55] = \<const0> ;
  assign m00_axi_awaddr[54] = \<const0> ;
  assign m00_axi_awaddr[53] = \<const0> ;
  assign m00_axi_awaddr[52] = \<const0> ;
  assign m00_axi_awaddr[51] = \<const0> ;
  assign m00_axi_awaddr[50] = \<const0> ;
  assign m00_axi_awaddr[49] = \<const0> ;
  assign m00_axi_awaddr[48] = \<const0> ;
  assign m00_axi_awaddr[47] = \<const0> ;
  assign m00_axi_awaddr[46] = \<const0> ;
  assign m00_axi_awaddr[45] = \<const0> ;
  assign m00_axi_awaddr[44] = \<const0> ;
  assign m00_axi_awaddr[43] = \<const0> ;
  assign m00_axi_awaddr[42] = \<const0> ;
  assign m00_axi_awaddr[41] = \<const0> ;
  assign m00_axi_awaddr[40] = \<const0> ;
  assign m00_axi_awaddr[39] = \<const0> ;
  assign m00_axi_awaddr[38] = \<const0> ;
  assign m00_axi_awaddr[37] = \<const0> ;
  assign m00_axi_awaddr[36] = \<const0> ;
  assign m00_axi_awaddr[35] = \<const0> ;
  assign m00_axi_awaddr[34] = \<const0> ;
  assign m00_axi_awaddr[33] = \<const0> ;
  assign m00_axi_awaddr[32] = \<const0> ;
  assign m00_axi_awaddr[31] = \<const0> ;
  assign m00_axi_awaddr[30] = \<const0> ;
  assign m00_axi_awaddr[29] = \<const0> ;
  assign m00_axi_awaddr[28] = \<const0> ;
  assign m00_axi_awaddr[27] = \<const0> ;
  assign m00_axi_awaddr[26] = \<const0> ;
  assign m00_axi_awaddr[25] = \<const0> ;
  assign m00_axi_awaddr[24] = \<const0> ;
  assign m00_axi_awaddr[23] = \<const0> ;
  assign m00_axi_awaddr[22] = \<const0> ;
  assign m00_axi_awaddr[21] = \<const0> ;
  assign m00_axi_awaddr[20] = \<const0> ;
  assign m00_axi_awaddr[19] = \<const0> ;
  assign m00_axi_awaddr[18] = \<const0> ;
  assign m00_axi_awaddr[17] = \<const0> ;
  assign m00_axi_awaddr[16] = \<const0> ;
  assign m00_axi_awaddr[15] = \<const0> ;
  assign m00_axi_awaddr[14] = \<const0> ;
  assign m00_axi_awaddr[13] = \<const0> ;
  assign m00_axi_awaddr[12] = \<const0> ;
  assign m00_axi_awaddr[11] = \<const0> ;
  assign m00_axi_awaddr[10] = \<const0> ;
  assign m00_axi_awaddr[9] = \<const0> ;
  assign m00_axi_awaddr[8] = \<const0> ;
  assign m00_axi_awaddr[7] = \<const0> ;
  assign m00_axi_awaddr[6] = \<const0> ;
  assign m00_axi_awaddr[5] = \<const0> ;
  assign m00_axi_awaddr[4] = \<const0> ;
  assign m00_axi_awaddr[3] = \<const0> ;
  assign m00_axi_awaddr[2] = \<const0> ;
  assign m00_axi_awaddr[1] = \<const0> ;
  assign m00_axi_awaddr[0] = \<const0> ;
  assign m00_axi_awburst[1] = \<const0> ;
  assign m00_axi_awburst[0] = \<const0> ;
  assign m00_axi_awcache[3] = \<const0> ;
  assign m00_axi_awcache[2] = \<const0> ;
  assign m00_axi_awcache[1] = \<const0> ;
  assign m00_axi_awcache[0] = \<const0> ;
  assign m00_axi_awid[0] = \<const0> ;
  assign m00_axi_awlen[7] = \<const0> ;
  assign m00_axi_awlen[6] = \<const0> ;
  assign m00_axi_awlen[5] = \<const0> ;
  assign m00_axi_awlen[4] = \<const0> ;
  assign m00_axi_awlen[3] = \<const0> ;
  assign m00_axi_awlen[2] = \<const0> ;
  assign m00_axi_awlen[1] = \<const0> ;
  assign m00_axi_awlen[0] = \<const0> ;
  assign m00_axi_awlock = \<const0> ;
  assign m00_axi_awprot[2] = \<const0> ;
  assign m00_axi_awprot[1] = \<const0> ;
  assign m00_axi_awprot[0] = \<const0> ;
  assign m00_axi_awqos[3] = \<const0> ;
  assign m00_axi_awqos[2] = \<const0> ;
  assign m00_axi_awqos[1] = \<const0> ;
  assign m00_axi_awqos[0] = \<const0> ;
  assign m00_axi_awsize[2] = \<const0> ;
  assign m00_axi_awsize[1] = \<const0> ;
  assign m00_axi_awsize[0] = \<const0> ;
  assign m00_axi_awuser[0] = \<const0> ;
  assign m00_axi_awvalid = \<const0> ;
  assign m00_axi_bready = \<const0> ;
  assign m00_axi_wdata[63] = \<const0> ;
  assign m00_axi_wdata[62] = \<const0> ;
  assign m00_axi_wdata[61] = \<const0> ;
  assign m00_axi_wdata[60] = \<const0> ;
  assign m00_axi_wdata[59] = \<const0> ;
  assign m00_axi_wdata[58] = \<const0> ;
  assign m00_axi_wdata[57] = \<const0> ;
  assign m00_axi_wdata[56] = \<const0> ;
  assign m00_axi_wdata[55] = \<const0> ;
  assign m00_axi_wdata[54] = \<const0> ;
  assign m00_axi_wdata[53] = \<const0> ;
  assign m00_axi_wdata[52] = \<const0> ;
  assign m00_axi_wdata[51] = \<const0> ;
  assign m00_axi_wdata[50] = \<const0> ;
  assign m00_axi_wdata[49] = \<const0> ;
  assign m00_axi_wdata[48] = \<const0> ;
  assign m00_axi_wdata[47] = \<const0> ;
  assign m00_axi_wdata[46] = \<const0> ;
  assign m00_axi_wdata[45] = \<const0> ;
  assign m00_axi_wdata[44] = \<const0> ;
  assign m00_axi_wdata[43] = \<const0> ;
  assign m00_axi_wdata[42] = \<const0> ;
  assign m00_axi_wdata[41] = \<const0> ;
  assign m00_axi_wdata[40] = \<const0> ;
  assign m00_axi_wdata[39] = \<const0> ;
  assign m00_axi_wdata[38] = \<const0> ;
  assign m00_axi_wdata[37] = \<const0> ;
  assign m00_axi_wdata[36] = \<const0> ;
  assign m00_axi_wdata[35] = \<const0> ;
  assign m00_axi_wdata[34] = \<const0> ;
  assign m00_axi_wdata[33] = \<const0> ;
  assign m00_axi_wdata[32] = \<const0> ;
  assign m00_axi_wdata[31] = \<const0> ;
  assign m00_axi_wdata[30] = \<const0> ;
  assign m00_axi_wdata[29] = \<const0> ;
  assign m00_axi_wdata[28] = \<const0> ;
  assign m00_axi_wdata[27] = \<const0> ;
  assign m00_axi_wdata[26] = \<const0> ;
  assign m00_axi_wdata[25] = \<const0> ;
  assign m00_axi_wdata[24] = \<const0> ;
  assign m00_axi_wdata[23] = \<const0> ;
  assign m00_axi_wdata[22] = \<const0> ;
  assign m00_axi_wdata[21] = \<const0> ;
  assign m00_axi_wdata[20] = \<const0> ;
  assign m00_axi_wdata[19] = \<const0> ;
  assign m00_axi_wdata[18] = \<const0> ;
  assign m00_axi_wdata[17] = \<const0> ;
  assign m00_axi_wdata[16] = \<const0> ;
  assign m00_axi_wdata[15] = \<const0> ;
  assign m00_axi_wdata[14] = \<const0> ;
  assign m00_axi_wdata[13] = \<const0> ;
  assign m00_axi_wdata[12] = \<const0> ;
  assign m00_axi_wdata[11] = \<const0> ;
  assign m00_axi_wdata[10] = \<const0> ;
  assign m00_axi_wdata[9] = \<const0> ;
  assign m00_axi_wdata[8] = \<const0> ;
  assign m00_axi_wdata[7] = \<const0> ;
  assign m00_axi_wdata[6] = \<const0> ;
  assign m00_axi_wdata[5] = \<const0> ;
  assign m00_axi_wdata[4] = \<const0> ;
  assign m00_axi_wdata[3] = \<const0> ;
  assign m00_axi_wdata[2] = \<const0> ;
  assign m00_axi_wdata[1] = \<const0> ;
  assign m00_axi_wdata[0] = \<const0> ;
  assign m00_axi_wlast = \<const0> ;
  assign m00_axi_wstrb[7] = \<const0> ;
  assign m00_axi_wstrb[6] = \<const0> ;
  assign m00_axi_wstrb[5] = \<const0> ;
  assign m00_axi_wstrb[4] = \<const0> ;
  assign m00_axi_wstrb[3] = \<const0> ;
  assign m00_axi_wstrb[2] = \<const0> ;
  assign m00_axi_wstrb[1] = \<const0> ;
  assign m00_axi_wstrb[0] = \<const0> ;
  assign m00_axi_wuser[7] = \<const0> ;
  assign m00_axi_wuser[6] = \<const0> ;
  assign m00_axi_wuser[5] = \<const0> ;
  assign m00_axi_wuser[4] = \<const0> ;
  assign m00_axi_wuser[3] = \<const0> ;
  assign m00_axi_wuser[2] = \<const0> ;
  assign m00_axi_wuser[1] = \<const0> ;
  assign m00_axi_wuser[0] = \<const0> ;
  assign m00_axi_wvalid = \<const0> ;
  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  assign s00_axi_wready = s00_axi_awready;
  assign video_rgb[35:28] = \^video_rgb [35:28];
  assign video_rgb[27] = \<const0> ;
  assign video_rgb[26] = \<const0> ;
  assign video_rgb[25] = \<const0> ;
  assign video_rgb[24] = \<const0> ;
  assign video_rgb[23:16] = \^video_rgb [23:16];
  assign video_rgb[15] = \<const0> ;
  assign video_rgb[14] = \<const0> ;
  assign video_rgb[13] = \<const0> ;
  assign video_rgb[12] = \<const0> ;
  assign video_rgb[11:4] = \^video_rgb [11:4];
  assign video_rgb[3] = \<const0> ;
  assign video_rgb[2] = \<const0> ;
  assign video_rgb[1] = \<const0> ;
  assign video_rgb[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  design_1_axi_video_0_3_axi_video_v1_0 U0
       (.bvalid_reg_0(s00_axi_bvalid),
        .m00_axi_aclk(m00_axi_aclk),
        .m00_axi_araddr(m00_axi_araddr),
        .m00_axi_arburst(\^m00_axi_arburst ),
        .m00_axi_aresetn(m00_axi_aresetn),
        .m00_axi_arlen(\^m00_axi_arlen ),
        .m00_axi_arready(m00_axi_arready),
        .m00_axi_arvalid(m00_axi_arvalid),
        .m00_axi_rdata(m00_axi_rdata),
        .m00_axi_rlast(m00_axi_rlast),
        .m00_axi_rready(m00_axi_rready),
        .m00_axi_rresp(m00_axi_rresp),
        .m00_axi_ruser(m00_axi_ruser),
        .m00_axi_rvalid(m00_axi_rvalid),
        .rvalid_reg_0(s00_axi_rvalid),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[5:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arready(s00_axi_arready),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr[5:2]),
        .s00_axi_awready(s00_axi_awready),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid),
        .video_active(video_active),
        .video_clk(video_clk),
        .video_hsync(video_hsync),
        .video_rgb({\^video_rgb [35:28],\^video_rgb [23:16],\^video_rgb [11:4]}),
        .video_vsync(video_vsync));
  VCC VCC
       (.P(\<const1> ));
endmodule

(* ORIG_REF_NAME = "AXI_MM2S" *) 
module design_1_axi_video_0_3_AXI_MM2S
   (m00_axi_arburst,
    Q,
    m00_axi_arvalid,
    \vfsm_state_reg[0] ,
    \regfile_reg[0][3] ,
    \vfsm_state_reg[1] ,
    s_axis_tvalid,
    s_axis_tlast,
    m00_axi_araddr,
    D,
    run_ack_reg_0,
    m00_axi_arlen,
    m00_axi_aclk,
    vfsm_state,
    \vfsm_state_reg[0]_0 ,
    dest_out,
    m00_axi_rvalid,
    s_axis_tready,
    s_aresetn,
    mm2s_run,
    \i_burst_cnt_reg[0]_0 ,
    m00_axi_rlast,
    m00_axi_rresp,
    m00_axi_arready,
    \FSM_onehot_state_reg[0]_0 ,
    \i_address_cnt_reg[63]_0 ,
    \i_transfer_cnt_reg[22]_0 ,
    wready0__0,
    s00_axi_wstrb,
    \regfile_reg[0][17] ,
    wready06_out,
    is_last_reg_0,
    m00_axi_aresetn,
    s00_axi_wdata,
    s00_axi_awaddr,
    E);
  output [0:0]m00_axi_arburst;
  output [2:0]Q;
  output m00_axi_arvalid;
  output \vfsm_state_reg[0] ;
  output \regfile_reg[0][3] ;
  output \vfsm_state_reg[1] ;
  output s_axis_tvalid;
  output s_axis_tlast;
  output [63:0]m00_axi_araddr;
  output [1:0]D;
  output run_ack_reg_0;
  output [5:0]m00_axi_arlen;
  input m00_axi_aclk;
  input [1:0]vfsm_state;
  input [0:0]\vfsm_state_reg[0]_0 ;
  input [0:0]dest_out;
  input m00_axi_rvalid;
  input s_axis_tready;
  input s_aresetn;
  input mm2s_run;
  input \i_burst_cnt_reg[0]_0 ;
  input m00_axi_rlast;
  input [1:0]m00_axi_rresp;
  input m00_axi_arready;
  input \FSM_onehot_state_reg[0]_0 ;
  input [63:0]\i_address_cnt_reg[63]_0 ;
  input [22:0]\i_transfer_cnt_reg[22]_0 ;
  input wready0__0;
  input [0:0]s00_axi_wstrb;
  input \regfile_reg[0][17] ;
  input wready06_out;
  input is_last_reg_0;
  input m00_axi_aresetn;
  input [1:0]s00_axi_wdata;
  input [3:0]s00_axi_awaddr;
  input [0:0]E;

  wire [1:0]D;
  wire [0:0]E;
  wire \FSM_onehot_state[1]_i_1_n_0 ;
  wire \FSM_onehot_state[1]_i_2_n_0 ;
  wire \FSM_onehot_state[3]_i_1_n_0 ;
  wire \FSM_onehot_state[4]_i_2_n_0 ;
  wire \FSM_onehot_state[4]_i_3_n_0 ;
  wire \FSM_onehot_state[4]_i_4_n_0 ;
  wire \FSM_onehot_state[4]_i_5_n_0 ;
  wire \FSM_onehot_state[4]_i_6_n_0 ;
  wire \FSM_onehot_state[4]_i_8_n_0 ;
  wire \FSM_onehot_state_reg[0]_0 ;
  wire \FSM_onehot_state_reg_n_0_[3] ;
  wire \FSM_onehot_state_reg_n_0_[4] ;
  wire [2:0]Q;
  wire [0:0]dest_out;
  wire done_i_1_n_0;
  wire \i_address_cnt[0]_i_1_n_0 ;
  wire \i_address_cnt[10]_i_1_n_0 ;
  wire \i_address_cnt[11]_i_1_n_0 ;
  wire \i_address_cnt[12]_i_1_n_0 ;
  wire \i_address_cnt[13]_i_1_n_0 ;
  wire \i_address_cnt[14]_i_1_n_0 ;
  wire \i_address_cnt[15]_i_1_n_0 ;
  wire \i_address_cnt[16]_i_1_n_0 ;
  wire \i_address_cnt[17]_i_1_n_0 ;
  wire \i_address_cnt[18]_i_1_n_0 ;
  wire \i_address_cnt[19]_i_1_n_0 ;
  wire \i_address_cnt[1]_i_1_n_0 ;
  wire \i_address_cnt[20]_i_1_n_0 ;
  wire \i_address_cnt[21]_i_1_n_0 ;
  wire \i_address_cnt[22]_i_1_n_0 ;
  wire \i_address_cnt[23]_i_1_n_0 ;
  wire \i_address_cnt[24]_i_1_n_0 ;
  wire \i_address_cnt[25]_i_1_n_0 ;
  wire \i_address_cnt[26]_i_1_n_0 ;
  wire \i_address_cnt[27]_i_1_n_0 ;
  wire \i_address_cnt[28]_i_1_n_0 ;
  wire \i_address_cnt[29]_i_1_n_0 ;
  wire \i_address_cnt[2]_i_1_n_0 ;
  wire \i_address_cnt[30]_i_1_n_0 ;
  wire \i_address_cnt[31]_i_1_n_0 ;
  wire \i_address_cnt[32]_i_1_n_0 ;
  wire \i_address_cnt[33]_i_1_n_0 ;
  wire \i_address_cnt[34]_i_1_n_0 ;
  wire \i_address_cnt[35]_i_1_n_0 ;
  wire \i_address_cnt[36]_i_1_n_0 ;
  wire \i_address_cnt[37]_i_1_n_0 ;
  wire \i_address_cnt[38]_i_1_n_0 ;
  wire \i_address_cnt[39]_i_1_n_0 ;
  wire \i_address_cnt[3]_i_1_n_0 ;
  wire \i_address_cnt[40]_i_1_n_0 ;
  wire \i_address_cnt[41]_i_1_n_0 ;
  wire \i_address_cnt[42]_i_1_n_0 ;
  wire \i_address_cnt[43]_i_1_n_0 ;
  wire \i_address_cnt[44]_i_1_n_0 ;
  wire \i_address_cnt[45]_i_1_n_0 ;
  wire \i_address_cnt[46]_i_1_n_0 ;
  wire \i_address_cnt[47]_i_1_n_0 ;
  wire \i_address_cnt[48]_i_1_n_0 ;
  wire \i_address_cnt[49]_i_1_n_0 ;
  wire \i_address_cnt[4]_i_1_n_0 ;
  wire \i_address_cnt[50]_i_1_n_0 ;
  wire \i_address_cnt[51]_i_1_n_0 ;
  wire \i_address_cnt[52]_i_1_n_0 ;
  wire \i_address_cnt[53]_i_1_n_0 ;
  wire \i_address_cnt[54]_i_1_n_0 ;
  wire \i_address_cnt[55]_i_1_n_0 ;
  wire \i_address_cnt[56]_i_1_n_0 ;
  wire \i_address_cnt[57]_i_1_n_0 ;
  wire \i_address_cnt[58]_i_1_n_0 ;
  wire \i_address_cnt[59]_i_1_n_0 ;
  wire \i_address_cnt[5]_i_1_n_0 ;
  wire \i_address_cnt[60]_i_1_n_0 ;
  wire \i_address_cnt[61]_i_1_n_0 ;
  wire \i_address_cnt[62]_i_1_n_0 ;
  wire \i_address_cnt[63]_i_2_n_0 ;
  wire \i_address_cnt[63]_i_3_n_0 ;
  wire \i_address_cnt[63]_i_4_n_0 ;
  wire \i_address_cnt[63]_i_5_n_0 ;
  wire \i_address_cnt[63]_i_7_n_0 ;
  wire \i_address_cnt[63]_i_8_n_0 ;
  wire \i_address_cnt[63]_i_9_n_0 ;
  wire \i_address_cnt[6]_i_1_n_0 ;
  wire \i_address_cnt[7]_i_1_n_0 ;
  wire \i_address_cnt[8]_i_1_n_0 ;
  wire \i_address_cnt[9]_i_1_n_0 ;
  wire \i_address_cnt[9]_i_3_n_0 ;
  wire \i_address_cnt[9]_i_4_n_0 ;
  wire \i_address_cnt[9]_i_5_n_0 ;
  wire \i_address_cnt[9]_i_6_n_0 ;
  wire \i_address_cnt[9]_i_7_n_0 ;
  wire \i_address_cnt[9]_i_8_n_0 ;
  wire \i_address_cnt[9]_i_9_n_0 ;
  wire \i_address_cnt_reg[17]_i_2_n_0 ;
  wire \i_address_cnt_reg[17]_i_2_n_1 ;
  wire \i_address_cnt_reg[17]_i_2_n_2 ;
  wire \i_address_cnt_reg[17]_i_2_n_3 ;
  wire \i_address_cnt_reg[17]_i_2_n_4 ;
  wire \i_address_cnt_reg[17]_i_2_n_5 ;
  wire \i_address_cnt_reg[17]_i_2_n_6 ;
  wire \i_address_cnt_reg[17]_i_2_n_7 ;
  wire \i_address_cnt_reg[25]_i_2_n_0 ;
  wire \i_address_cnt_reg[25]_i_2_n_1 ;
  wire \i_address_cnt_reg[25]_i_2_n_2 ;
  wire \i_address_cnt_reg[25]_i_2_n_3 ;
  wire \i_address_cnt_reg[25]_i_2_n_4 ;
  wire \i_address_cnt_reg[25]_i_2_n_5 ;
  wire \i_address_cnt_reg[25]_i_2_n_6 ;
  wire \i_address_cnt_reg[25]_i_2_n_7 ;
  wire \i_address_cnt_reg[33]_i_2_n_0 ;
  wire \i_address_cnt_reg[33]_i_2_n_1 ;
  wire \i_address_cnt_reg[33]_i_2_n_2 ;
  wire \i_address_cnt_reg[33]_i_2_n_3 ;
  wire \i_address_cnt_reg[33]_i_2_n_4 ;
  wire \i_address_cnt_reg[33]_i_2_n_5 ;
  wire \i_address_cnt_reg[33]_i_2_n_6 ;
  wire \i_address_cnt_reg[33]_i_2_n_7 ;
  wire \i_address_cnt_reg[41]_i_2_n_0 ;
  wire \i_address_cnt_reg[41]_i_2_n_1 ;
  wire \i_address_cnt_reg[41]_i_2_n_2 ;
  wire \i_address_cnt_reg[41]_i_2_n_3 ;
  wire \i_address_cnt_reg[41]_i_2_n_4 ;
  wire \i_address_cnt_reg[41]_i_2_n_5 ;
  wire \i_address_cnt_reg[41]_i_2_n_6 ;
  wire \i_address_cnt_reg[41]_i_2_n_7 ;
  wire \i_address_cnt_reg[49]_i_2_n_0 ;
  wire \i_address_cnt_reg[49]_i_2_n_1 ;
  wire \i_address_cnt_reg[49]_i_2_n_2 ;
  wire \i_address_cnt_reg[49]_i_2_n_3 ;
  wire \i_address_cnt_reg[49]_i_2_n_4 ;
  wire \i_address_cnt_reg[49]_i_2_n_5 ;
  wire \i_address_cnt_reg[49]_i_2_n_6 ;
  wire \i_address_cnt_reg[49]_i_2_n_7 ;
  wire \i_address_cnt_reg[57]_i_2_n_0 ;
  wire \i_address_cnt_reg[57]_i_2_n_1 ;
  wire \i_address_cnt_reg[57]_i_2_n_2 ;
  wire \i_address_cnt_reg[57]_i_2_n_3 ;
  wire \i_address_cnt_reg[57]_i_2_n_4 ;
  wire \i_address_cnt_reg[57]_i_2_n_5 ;
  wire \i_address_cnt_reg[57]_i_2_n_6 ;
  wire \i_address_cnt_reg[57]_i_2_n_7 ;
  wire [63:0]\i_address_cnt_reg[63]_0 ;
  wire \i_address_cnt_reg[63]_i_6_n_3 ;
  wire \i_address_cnt_reg[63]_i_6_n_4 ;
  wire \i_address_cnt_reg[63]_i_6_n_5 ;
  wire \i_address_cnt_reg[63]_i_6_n_6 ;
  wire \i_address_cnt_reg[63]_i_6_n_7 ;
  wire \i_address_cnt_reg[9]_i_2_n_0 ;
  wire \i_address_cnt_reg[9]_i_2_n_1 ;
  wire \i_address_cnt_reg[9]_i_2_n_2 ;
  wire \i_address_cnt_reg[9]_i_2_n_3 ;
  wire \i_address_cnt_reg[9]_i_2_n_4 ;
  wire \i_address_cnt_reg[9]_i_2_n_5 ;
  wire \i_address_cnt_reg[9]_i_2_n_6 ;
  wire \i_address_cnt_reg[9]_i_2_n_7 ;
  wire \i_burst_cnt[0]_i_1_n_0 ;
  wire \i_burst_cnt[1]_i_1_n_0 ;
  wire \i_burst_cnt[1]_i_2_n_0 ;
  wire \i_burst_cnt[2]_i_1_n_0 ;
  wire \i_burst_cnt[2]_i_2_n_0 ;
  wire \i_burst_cnt[3]_i_1_n_0 ;
  wire \i_burst_cnt[3]_i_2_n_0 ;
  wire \i_burst_cnt[3]_i_3_n_0 ;
  wire \i_burst_cnt[4]_i_1_n_0 ;
  wire \i_burst_cnt[4]_i_2_n_0 ;
  wire \i_burst_cnt[5]_i_1_n_0 ;
  wire \i_burst_cnt[6]_i_1_n_0 ;
  wire \i_burst_cnt[7]_i_1_n_0 ;
  wire \i_burst_cnt[7]_i_2_n_0 ;
  wire \i_burst_cnt[7]_i_4_n_0 ;
  wire \i_burst_cnt_reg[0]_0 ;
  wire \i_burst_cnt_reg_n_0_[0] ;
  wire \i_burst_cnt_reg_n_0_[1] ;
  wire \i_burst_cnt_reg_n_0_[2] ;
  wire \i_burst_cnt_reg_n_0_[3] ;
  wire \i_burst_cnt_reg_n_0_[4] ;
  wire \i_burst_cnt_reg_n_0_[5] ;
  wire \i_burst_cnt_reg_n_0_[6] ;
  wire \i_burst_cnt_reg_n_0_[7] ;
  wire \i_selected_burst[0]_i_1_n_0 ;
  wire \i_selected_burst[1]_i_1_n_0 ;
  wire \i_selected_burst[1]_i_2_n_0 ;
  wire \i_selected_burst[2]_i_1_n_0 ;
  wire \i_selected_burst[3]_i_1_n_0 ;
  wire \i_selected_burst[4]_i_1_n_0 ;
  wire \i_selected_burst[5]_i_1_n_0 ;
  wire \i_selected_burst[6]_i_1_n_0 ;
  wire \i_selected_burst[6]_i_2_n_0 ;
  wire [6:6]i_selected_burst__12;
  wire \i_selected_burst_reg_n_0_[0] ;
  wire \i_selected_burst_reg_n_0_[1] ;
  wire \i_selected_burst_reg_n_0_[2] ;
  wire \i_selected_burst_reg_n_0_[3] ;
  wire \i_selected_burst_reg_n_0_[4] ;
  wire \i_selected_burst_reg_n_0_[5] ;
  wire \i_selected_burst_reg_n_0_[6] ;
  wire \i_transfer_cnt[0]_i_1_n_0 ;
  wire \i_transfer_cnt[10]_i_1_n_0 ;
  wire \i_transfer_cnt[11]_i_1_n_0 ;
  wire \i_transfer_cnt[12]_i_1_n_0 ;
  wire \i_transfer_cnt[13]_i_1_n_0 ;
  wire \i_transfer_cnt[14]_i_1_n_0 ;
  wire \i_transfer_cnt[15]_i_1_n_0 ;
  wire \i_transfer_cnt[16]_i_1_n_0 ;
  wire \i_transfer_cnt[17]_i_1_n_0 ;
  wire \i_transfer_cnt[18]_i_1_n_0 ;
  wire \i_transfer_cnt[19]_i_1_n_0 ;
  wire \i_transfer_cnt[1]_i_1_n_0 ;
  wire \i_transfer_cnt[20]_i_1_n_0 ;
  wire \i_transfer_cnt[21]_i_1_n_0 ;
  wire \i_transfer_cnt[22]_i_2_n_0 ;
  wire \i_transfer_cnt[2]_i_1_n_0 ;
  wire \i_transfer_cnt[3]_i_1_n_0 ;
  wire \i_transfer_cnt[4]_i_1_n_0 ;
  wire \i_transfer_cnt[5]_i_1_n_0 ;
  wire \i_transfer_cnt[6]_i_1_n_0 ;
  wire \i_transfer_cnt[7]_i_1_n_0 ;
  wire \i_transfer_cnt[8]_i_1_n_0 ;
  wire \i_transfer_cnt[9]_i_1_n_0 ;
  wire [22:0]\i_transfer_cnt_reg[22]_0 ;
  wire \i_transfer_cnt_reg_n_0_[0] ;
  wire \i_transfer_cnt_reg_n_0_[10] ;
  wire \i_transfer_cnt_reg_n_0_[11] ;
  wire \i_transfer_cnt_reg_n_0_[12] ;
  wire \i_transfer_cnt_reg_n_0_[13] ;
  wire \i_transfer_cnt_reg_n_0_[14] ;
  wire \i_transfer_cnt_reg_n_0_[15] ;
  wire \i_transfer_cnt_reg_n_0_[16] ;
  wire \i_transfer_cnt_reg_n_0_[17] ;
  wire \i_transfer_cnt_reg_n_0_[18] ;
  wire \i_transfer_cnt_reg_n_0_[19] ;
  wire \i_transfer_cnt_reg_n_0_[20] ;
  wire \i_transfer_cnt_reg_n_0_[21] ;
  wire \i_transfer_cnt_reg_n_0_[22] ;
  wire \i_transfer_cnt_reg_n_0_[6] ;
  wire \i_transfer_cnt_reg_n_0_[7] ;
  wire \i_transfer_cnt_reg_n_0_[8] ;
  wire \i_transfer_cnt_reg_n_0_[9] ;
  wire [22:1]in15;
  wire [63:2]in17;
  wire is_last0_carry_i_1_n_0;
  wire is_last0_carry_i_2_n_0;
  wire is_last0_carry_i_3_n_0;
  wire is_last0_carry_i_4_n_0;
  wire is_last0_carry_i_5_n_0;
  wire is_last0_carry_i_6_n_0;
  wire is_last0_carry_i_7_n_0;
  wire is_last0_carry_i_8_n_0;
  wire is_last0_carry_n_0;
  wire is_last0_carry_n_1;
  wire is_last0_carry_n_2;
  wire is_last0_carry_n_3;
  wire is_last0_carry_n_4;
  wire is_last0_carry_n_5;
  wire is_last0_carry_n_6;
  wire is_last0_carry_n_7;
  wire is_last_i_1_n_0;
  wire is_last_reg_0;
  wire is_last_reg_n_0;
  wire m00_axi_aclk;
  wire [63:0]m00_axi_araddr;
  wire [0:0]m00_axi_arburst;
  wire m00_axi_aresetn;
  wire [5:0]m00_axi_arlen;
  wire m00_axi_arready;
  wire m00_axi_arvalid;
  wire m00_axi_rlast;
  wire [1:0]m00_axi_rresp;
  wire m00_axi_rvalid;
  wire \m_axi_arlen[1]_i_1_n_0 ;
  wire \m_axi_arlen[2]_i_1_n_0 ;
  wire \m_axi_arlen[3]_i_1_n_0 ;
  wire \m_axi_arlen[4]_i_1_n_0 ;
  wire \m_axi_arlen[5]_i_2_n_0 ;
  wire \m_axi_arlen[5]_i_3_n_0 ;
  wire \m_axi_arlen[5]_i_4_n_0 ;
  wire [0:0]minusOp;
  wire minusOp_carry__0_i_1_n_0;
  wire minusOp_carry__0_i_2_n_0;
  wire minusOp_carry__0_i_3_n_0;
  wire minusOp_carry__0_i_4_n_0;
  wire minusOp_carry__0_i_5_n_0;
  wire minusOp_carry__0_i_6_n_0;
  wire minusOp_carry__0_i_7_n_0;
  wire minusOp_carry__0_i_8_n_0;
  wire minusOp_carry__0_n_0;
  wire minusOp_carry__0_n_1;
  wire minusOp_carry__0_n_2;
  wire minusOp_carry__0_n_3;
  wire minusOp_carry__0_n_4;
  wire minusOp_carry__0_n_5;
  wire minusOp_carry__0_n_6;
  wire minusOp_carry__0_n_7;
  wire minusOp_carry__1_i_1_n_0;
  wire minusOp_carry__1_i_2_n_0;
  wire minusOp_carry__1_i_3_n_0;
  wire minusOp_carry__1_i_4_n_0;
  wire minusOp_carry__1_i_5_n_0;
  wire minusOp_carry__1_i_6_n_0;
  wire minusOp_carry__1_n_3;
  wire minusOp_carry__1_n_4;
  wire minusOp_carry__1_n_5;
  wire minusOp_carry__1_n_6;
  wire minusOp_carry__1_n_7;
  wire minusOp_carry_i_1_n_0;
  wire minusOp_carry_i_2_n_0;
  wire minusOp_carry_i_3_n_0;
  wire minusOp_carry_i_4_n_0;
  wire minusOp_carry_i_5_n_0;
  wire minusOp_carry_i_6_n_0;
  wire minusOp_carry_i_7_n_0;
  wire minusOp_carry_i_8_n_0;
  wire minusOp_carry_n_0;
  wire minusOp_carry_n_1;
  wire minusOp_carry_n_2;
  wire minusOp_carry_n_3;
  wire minusOp_carry_n_4;
  wire minusOp_carry_n_5;
  wire minusOp_carry_n_6;
  wire minusOp_carry_n_7;
  wire mm2s_done;
  wire mm2s_error;
  wire mm2s_run;
  wire mm2s_run_ack;
  wire [18:17]p_0_in;
  wire \regfile[0][17]_i_2_n_0 ;
  wire \regfile[0][18]_i_2_n_0 ;
  wire \regfile_reg[0][17] ;
  wire \regfile_reg[0][3] ;
  wire reset0;
  wire run_ack_i_1_n_0;
  wire run_ack_reg_0;
  wire [3:0]s00_axi_awaddr;
  wire [1:0]s00_axi_wdata;
  wire [0:0]s00_axi_wstrb;
  wire s_aresetn;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire [4:0]sel0;
  wire state;
  wire \status[0]_i_1_n_0 ;
  wire \status[1]_i_1_n_0 ;
  wire \status[1]_i_2_n_0 ;
  wire \status[1]_i_3_n_0 ;
  wire \status[1]_i_4_n_0 ;
  wire [1:0]vfsm_state;
  wire \vfsm_state_reg[0] ;
  wire [0:0]\vfsm_state_reg[0]_0 ;
  wire \vfsm_state_reg[1] ;
  wire wready06_out;
  wire wready0__0;
  wire [7:5]\NLW_i_address_cnt_reg[63]_i_6_CO_UNCONNECTED ;
  wire [7:6]\NLW_i_address_cnt_reg[63]_i_6_O_UNCONNECTED ;
  wire [7:0]NLW_is_last0_carry_O_UNCONNECTED;
  wire [7:5]NLW_minusOp_carry__1_CO_UNCONNECTED;
  wire [7:6]NLW_minusOp_carry__1_O_UNCONNECTED;

  LUT6 #(
    .INIT(64'hFFFFFFFFFEFF0000)) 
    \FSM_onehot_state[1]_i_1 
       (.I0(sel0[0]),
        .I1(\i_address_cnt[63]_i_4_n_0 ),
        .I2(sel0[1]),
        .I3(\i_transfer_cnt_reg_n_0_[0] ),
        .I4(\FSM_onehot_state[1]_i_2_n_0 ),
        .I5(Q[0]),
        .O(\FSM_onehot_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \FSM_onehot_state[1]_i_2 
       (.I0(Q[2]),
        .I1(m00_axi_rresp[1]),
        .I2(m00_axi_rresp[0]),
        .O(\FSM_onehot_state[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \FSM_onehot_state[3]_i_1 
       (.I0(m00_axi_rresp[1]),
        .I1(m00_axi_rresp[0]),
        .I2(Q[2]),
        .O(\FSM_onehot_state[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000F00000EEEE)) 
    \FSM_onehot_state[4]_i_1 
       (.I0(\FSM_onehot_state[4]_i_3_n_0 ),
        .I1(\FSM_onehot_state[4]_i_4_n_0 ),
        .I2(\FSM_onehot_state[4]_i_5_n_0 ),
        .I3(\FSM_onehot_state_reg_n_0_[4] ),
        .I4(\FSM_onehot_state_reg_n_0_[3] ),
        .I5(mm2s_run),
        .O(state));
  LUT6 #(
    .INIT(64'h0000000000000040)) 
    \FSM_onehot_state[4]_i_2 
       (.I0(\FSM_onehot_state[4]_i_6_n_0 ),
        .I1(Q[2]),
        .I2(\i_transfer_cnt_reg_n_0_[0] ),
        .I3(sel0[1]),
        .I4(\i_address_cnt[63]_i_4_n_0 ),
        .I5(sel0[0]),
        .O(\FSM_onehot_state[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hA888)) 
    \FSM_onehot_state[4]_i_3 
       (.I0(\i_burst_cnt_reg[0]_0 ),
        .I1(m00_axi_rlast),
        .I2(\i_address_cnt[63]_i_8_n_0 ),
        .I3(\i_address_cnt[63]_i_9_n_0 ),
        .O(\FSM_onehot_state[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hFFA8)) 
    \FSM_onehot_state[4]_i_4 
       (.I0(Q[1]),
        .I1(m00_axi_arready),
        .I2(Q[2]),
        .I3(\FSM_onehot_state_reg_n_0_[4] ),
        .O(\FSM_onehot_state[4]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFF800)) 
    \FSM_onehot_state[4]_i_5 
       (.I0(\i_address_cnt[63]_i_9_n_0 ),
        .I1(\i_address_cnt[63]_i_8_n_0 ),
        .I2(m00_axi_rlast),
        .I3(\FSM_onehot_state_reg[0]_0 ),
        .I4(\FSM_onehot_state[4]_i_8_n_0 ),
        .O(\FSM_onehot_state[4]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_onehot_state[4]_i_6 
       (.I0(m00_axi_rresp[0]),
        .I1(m00_axi_rresp[1]),
        .O(\FSM_onehot_state[4]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h0D)) 
    \FSM_onehot_state[4]_i_8 
       (.I0(Q[1]),
        .I1(m00_axi_arready),
        .I2(Q[2]),
        .O(\FSM_onehot_state[4]_i_8_n_0 ));
  (* FSM_ENCODED_STATES = "sread:00100,serror:01000,saddress:00010,sdone:10000,sidle:00001" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(m00_axi_aclk),
        .CE(state),
        .D(\FSM_onehot_state_reg_n_0_[4] ),
        .Q(Q[0]),
        .S(reset0));
  (* FSM_ENCODED_STATES = "sread:00100,serror:01000,saddress:00010,sdone:10000,sidle:00001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(m00_axi_aclk),
        .CE(state),
        .D(\FSM_onehot_state[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(reset0));
  (* FSM_ENCODED_STATES = "sread:00100,serror:01000,saddress:00010,sdone:10000,sidle:00001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(m00_axi_aclk),
        .CE(state),
        .D(Q[1]),
        .Q(Q[2]),
        .R(reset0));
  (* FSM_ENCODED_STATES = "sread:00100,serror:01000,saddress:00010,sdone:10000,sidle:00001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(m00_axi_aclk),
        .CE(state),
        .D(\FSM_onehot_state[3]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[3] ),
        .R(reset0));
  (* FSM_ENCODED_STATES = "sread:00100,serror:01000,saddress:00010,sdone:10000,sidle:00001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[4] 
       (.C(m00_axi_aclk),
        .CE(state),
        .D(\FSM_onehot_state[4]_i_2_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[4] ),
        .R(reset0));
  LUT2 #(
    .INIT(4'hE)) 
    done_i_1
       (.I0(\FSM_onehot_state_reg_n_0_[4] ),
        .I1(\FSM_onehot_state_reg_n_0_[3] ),
        .O(done_i_1_n_0));
  FDRE done_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(done_i_1_n_0),
        .Q(mm2s_done),
        .R(reset0));
  FDRE error_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(\FSM_onehot_state_reg_n_0_[3] ),
        .Q(mm2s_error),
        .R(reset0));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[0]_i_1 
       (.I0(Q[1]),
        .I1(m00_axi_araddr[0]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [0]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[10]_i_1 
       (.I0(Q[1]),
        .I1(in17[10]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [10]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[11]_i_1 
       (.I0(Q[1]),
        .I1(in17[11]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [11]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[12]_i_1 
       (.I0(Q[1]),
        .I1(in17[12]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [12]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[13]_i_1 
       (.I0(Q[1]),
        .I1(in17[13]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [13]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[14]_i_1 
       (.I0(Q[1]),
        .I1(in17[14]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [14]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[15]_i_1 
       (.I0(Q[1]),
        .I1(in17[15]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [15]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[16]_i_1 
       (.I0(Q[1]),
        .I1(in17[16]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [16]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[17]_i_1 
       (.I0(Q[1]),
        .I1(in17[17]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [17]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[18]_i_1 
       (.I0(Q[1]),
        .I1(in17[18]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [18]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[19]_i_1 
       (.I0(Q[1]),
        .I1(in17[19]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [19]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[1]_i_1 
       (.I0(Q[1]),
        .I1(m00_axi_araddr[1]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [1]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[20]_i_1 
       (.I0(Q[1]),
        .I1(in17[20]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [20]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[21]_i_1 
       (.I0(Q[1]),
        .I1(in17[21]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [21]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[22]_i_1 
       (.I0(Q[1]),
        .I1(in17[22]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [22]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[23]_i_1 
       (.I0(Q[1]),
        .I1(in17[23]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [23]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[24]_i_1 
       (.I0(Q[1]),
        .I1(in17[24]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [24]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[25]_i_1 
       (.I0(Q[1]),
        .I1(in17[25]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [25]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[26]_i_1 
       (.I0(Q[1]),
        .I1(in17[26]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [26]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[27]_i_1 
       (.I0(Q[1]),
        .I1(in17[27]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [27]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[28]_i_1 
       (.I0(Q[1]),
        .I1(in17[28]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [28]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[29]_i_1 
       (.I0(Q[1]),
        .I1(in17[29]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [29]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[2]_i_1 
       (.I0(Q[1]),
        .I1(in17[2]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [2]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[30]_i_1 
       (.I0(Q[1]),
        .I1(in17[30]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [30]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[31]_i_1 
       (.I0(Q[1]),
        .I1(in17[31]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [31]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[32]_i_1 
       (.I0(Q[1]),
        .I1(in17[32]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [32]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[32]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[33]_i_1 
       (.I0(Q[1]),
        .I1(in17[33]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [33]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[33]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[34]_i_1 
       (.I0(Q[1]),
        .I1(in17[34]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [34]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[34]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[35]_i_1 
       (.I0(Q[1]),
        .I1(in17[35]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [35]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[35]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[36]_i_1 
       (.I0(Q[1]),
        .I1(in17[36]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [36]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[36]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[37]_i_1 
       (.I0(Q[1]),
        .I1(in17[37]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [37]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[37]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[38]_i_1 
       (.I0(Q[1]),
        .I1(in17[38]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [38]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[38]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[39]_i_1 
       (.I0(Q[1]),
        .I1(in17[39]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [39]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[39]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[3]_i_1 
       (.I0(Q[1]),
        .I1(in17[3]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [3]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[40]_i_1 
       (.I0(Q[1]),
        .I1(in17[40]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [40]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[40]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[41]_i_1 
       (.I0(Q[1]),
        .I1(in17[41]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [41]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[41]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[42]_i_1 
       (.I0(Q[1]),
        .I1(in17[42]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [42]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[42]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[43]_i_1 
       (.I0(Q[1]),
        .I1(in17[43]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [43]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[43]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[44]_i_1 
       (.I0(Q[1]),
        .I1(in17[44]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [44]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[44]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[45]_i_1 
       (.I0(Q[1]),
        .I1(in17[45]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [45]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[45]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[46]_i_1 
       (.I0(Q[1]),
        .I1(in17[46]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [46]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[46]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[47]_i_1 
       (.I0(Q[1]),
        .I1(in17[47]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [47]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[47]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[48]_i_1 
       (.I0(Q[1]),
        .I1(in17[48]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [48]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[48]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[49]_i_1 
       (.I0(Q[1]),
        .I1(in17[49]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [49]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[49]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[4]_i_1 
       (.I0(Q[1]),
        .I1(in17[4]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [4]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[50]_i_1 
       (.I0(Q[1]),
        .I1(in17[50]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [50]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[50]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[51]_i_1 
       (.I0(Q[1]),
        .I1(in17[51]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [51]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[51]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[52]_i_1 
       (.I0(Q[1]),
        .I1(in17[52]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [52]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[52]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[53]_i_1 
       (.I0(Q[1]),
        .I1(in17[53]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [53]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[53]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[54]_i_1 
       (.I0(Q[1]),
        .I1(in17[54]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [54]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[54]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[55]_i_1 
       (.I0(Q[1]),
        .I1(in17[55]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [55]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[55]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[56]_i_1 
       (.I0(Q[1]),
        .I1(in17[56]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [56]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[56]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[57]_i_1 
       (.I0(Q[1]),
        .I1(in17[57]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [57]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[57]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[58]_i_1 
       (.I0(Q[1]),
        .I1(in17[58]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [58]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[58]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[59]_i_1 
       (.I0(Q[1]),
        .I1(in17[59]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [59]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[59]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[5]_i_1 
       (.I0(Q[1]),
        .I1(in17[5]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [5]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[60]_i_1 
       (.I0(Q[1]),
        .I1(in17[60]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [60]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[60]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[61]_i_1 
       (.I0(Q[1]),
        .I1(in17[61]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [61]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[61]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[62]_i_1 
       (.I0(Q[1]),
        .I1(in17[62]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [62]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[62]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \i_address_cnt[63]_i_1 
       (.I0(is_last_reg_0),
        .I1(m00_axi_aresetn),
        .O(reset0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFEFF0000)) 
    \i_address_cnt[63]_i_2 
       (.I0(sel0[0]),
        .I1(\i_address_cnt[63]_i_4_n_0 ),
        .I2(sel0[1]),
        .I3(\i_transfer_cnt_reg_n_0_[0] ),
        .I4(\i_address_cnt[63]_i_5_n_0 ),
        .I5(Q[0]),
        .O(\i_address_cnt[63]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[63]_i_3 
       (.I0(Q[1]),
        .I1(in17[63]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [63]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[63]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \i_address_cnt[63]_i_4 
       (.I0(sel0[3]),
        .I1(\m_axi_arlen[5]_i_4_n_0 ),
        .I2(\m_axi_arlen[5]_i_3_n_0 ),
        .I3(\i_address_cnt[63]_i_7_n_0 ),
        .I4(sel0[4]),
        .I5(sel0[2]),
        .O(\i_address_cnt[63]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h1010100010001000)) 
    \i_address_cnt[63]_i_5 
       (.I0(m00_axi_rresp[0]),
        .I1(m00_axi_rresp[1]),
        .I2(\i_burst_cnt_reg[0]_0 ),
        .I3(m00_axi_rlast),
        .I4(\i_address_cnt[63]_i_8_n_0 ),
        .I5(\i_address_cnt[63]_i_9_n_0 ),
        .O(\i_address_cnt[63]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \i_address_cnt[63]_i_7 
       (.I0(\i_transfer_cnt_reg_n_0_[18] ),
        .I1(\i_transfer_cnt_reg_n_0_[19] ),
        .I2(\i_transfer_cnt_reg_n_0_[20] ),
        .I3(\i_transfer_cnt_reg_n_0_[8] ),
        .I4(\i_transfer_cnt_reg_n_0_[7] ),
        .O(\i_address_cnt[63]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \i_address_cnt[63]_i_8 
       (.I0(\i_burst_cnt_reg_n_0_[7] ),
        .I1(\i_burst_cnt_reg_n_0_[6] ),
        .I2(\i_burst_cnt_reg_n_0_[5] ),
        .I3(\i_burst_cnt_reg_n_0_[4] ),
        .O(\i_address_cnt[63]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \i_address_cnt[63]_i_9 
       (.I0(\i_burst_cnt_reg_n_0_[1] ),
        .I1(\i_burst_cnt_reg_n_0_[0] ),
        .I2(\i_burst_cnt_reg_n_0_[3] ),
        .I3(\i_burst_cnt_reg_n_0_[2] ),
        .O(\i_address_cnt[63]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[6]_i_1 
       (.I0(Q[1]),
        .I1(in17[6]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [6]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[7]_i_1 
       (.I0(Q[1]),
        .I1(in17[7]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [7]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[8]_i_1 
       (.I0(Q[1]),
        .I1(in17[8]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [8]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_address_cnt[9]_i_1 
       (.I0(Q[1]),
        .I1(in17[9]),
        .I2(Q[2]),
        .I3(\i_address_cnt_reg[63]_0 [9]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_address_cnt[9]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \i_address_cnt[9]_i_3 
       (.I0(m00_axi_araddr[9]),
        .I1(\i_selected_burst_reg_n_0_[6] ),
        .O(\i_address_cnt[9]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \i_address_cnt[9]_i_4 
       (.I0(m00_axi_araddr[8]),
        .I1(\i_selected_burst_reg_n_0_[5] ),
        .O(\i_address_cnt[9]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \i_address_cnt[9]_i_5 
       (.I0(m00_axi_araddr[7]),
        .I1(\i_selected_burst_reg_n_0_[4] ),
        .O(\i_address_cnt[9]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \i_address_cnt[9]_i_6 
       (.I0(m00_axi_araddr[6]),
        .I1(\i_selected_burst_reg_n_0_[3] ),
        .O(\i_address_cnt[9]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \i_address_cnt[9]_i_7 
       (.I0(m00_axi_araddr[5]),
        .I1(\i_selected_burst_reg_n_0_[2] ),
        .O(\i_address_cnt[9]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \i_address_cnt[9]_i_8 
       (.I0(m00_axi_araddr[4]),
        .I1(\i_selected_burst_reg_n_0_[1] ),
        .O(\i_address_cnt[9]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \i_address_cnt[9]_i_9 
       (.I0(m00_axi_araddr[3]),
        .I1(\i_selected_burst_reg_n_0_[0] ),
        .O(\i_address_cnt[9]_i_9_n_0 ));
  FDRE \i_address_cnt_reg[0] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[0]_i_1_n_0 ),
        .Q(m00_axi_araddr[0]),
        .R(reset0));
  FDRE \i_address_cnt_reg[10] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[10]_i_1_n_0 ),
        .Q(m00_axi_araddr[10]),
        .R(reset0));
  FDRE \i_address_cnt_reg[11] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[11]_i_1_n_0 ),
        .Q(m00_axi_araddr[11]),
        .R(reset0));
  FDRE \i_address_cnt_reg[12] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[12]_i_1_n_0 ),
        .Q(m00_axi_araddr[12]),
        .R(reset0));
  FDRE \i_address_cnt_reg[13] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[13]_i_1_n_0 ),
        .Q(m00_axi_araddr[13]),
        .R(reset0));
  FDRE \i_address_cnt_reg[14] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[14]_i_1_n_0 ),
        .Q(m00_axi_araddr[14]),
        .R(reset0));
  FDRE \i_address_cnt_reg[15] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[15]_i_1_n_0 ),
        .Q(m00_axi_araddr[15]),
        .R(reset0));
  FDRE \i_address_cnt_reg[16] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[16]_i_1_n_0 ),
        .Q(m00_axi_araddr[16]),
        .R(reset0));
  FDRE \i_address_cnt_reg[17] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[17]_i_1_n_0 ),
        .Q(m00_axi_araddr[17]),
        .R(reset0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \i_address_cnt_reg[17]_i_2 
       (.CI(\i_address_cnt_reg[9]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\i_address_cnt_reg[17]_i_2_n_0 ,\i_address_cnt_reg[17]_i_2_n_1 ,\i_address_cnt_reg[17]_i_2_n_2 ,\i_address_cnt_reg[17]_i_2_n_3 ,\i_address_cnt_reg[17]_i_2_n_4 ,\i_address_cnt_reg[17]_i_2_n_5 ,\i_address_cnt_reg[17]_i_2_n_6 ,\i_address_cnt_reg[17]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,m00_axi_araddr[10]}),
        .O(in17[17:10]),
        .S(m00_axi_araddr[17:10]));
  FDRE \i_address_cnt_reg[18] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[18]_i_1_n_0 ),
        .Q(m00_axi_araddr[18]),
        .R(reset0));
  FDRE \i_address_cnt_reg[19] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[19]_i_1_n_0 ),
        .Q(m00_axi_araddr[19]),
        .R(reset0));
  FDRE \i_address_cnt_reg[1] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[1]_i_1_n_0 ),
        .Q(m00_axi_araddr[1]),
        .R(reset0));
  FDRE \i_address_cnt_reg[20] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[20]_i_1_n_0 ),
        .Q(m00_axi_araddr[20]),
        .R(reset0));
  FDRE \i_address_cnt_reg[21] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[21]_i_1_n_0 ),
        .Q(m00_axi_araddr[21]),
        .R(reset0));
  FDRE \i_address_cnt_reg[22] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[22]_i_1_n_0 ),
        .Q(m00_axi_araddr[22]),
        .R(reset0));
  FDRE \i_address_cnt_reg[23] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[23]_i_1_n_0 ),
        .Q(m00_axi_araddr[23]),
        .R(reset0));
  FDRE \i_address_cnt_reg[24] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[24]_i_1_n_0 ),
        .Q(m00_axi_araddr[24]),
        .R(reset0));
  FDRE \i_address_cnt_reg[25] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[25]_i_1_n_0 ),
        .Q(m00_axi_araddr[25]),
        .R(reset0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \i_address_cnt_reg[25]_i_2 
       (.CI(\i_address_cnt_reg[17]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\i_address_cnt_reg[25]_i_2_n_0 ,\i_address_cnt_reg[25]_i_2_n_1 ,\i_address_cnt_reg[25]_i_2_n_2 ,\i_address_cnt_reg[25]_i_2_n_3 ,\i_address_cnt_reg[25]_i_2_n_4 ,\i_address_cnt_reg[25]_i_2_n_5 ,\i_address_cnt_reg[25]_i_2_n_6 ,\i_address_cnt_reg[25]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(in17[25:18]),
        .S(m00_axi_araddr[25:18]));
  FDRE \i_address_cnt_reg[26] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[26]_i_1_n_0 ),
        .Q(m00_axi_araddr[26]),
        .R(reset0));
  FDRE \i_address_cnt_reg[27] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[27]_i_1_n_0 ),
        .Q(m00_axi_araddr[27]),
        .R(reset0));
  FDRE \i_address_cnt_reg[28] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[28]_i_1_n_0 ),
        .Q(m00_axi_araddr[28]),
        .R(reset0));
  FDRE \i_address_cnt_reg[29] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[29]_i_1_n_0 ),
        .Q(m00_axi_araddr[29]),
        .R(reset0));
  FDRE \i_address_cnt_reg[2] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[2]_i_1_n_0 ),
        .Q(m00_axi_araddr[2]),
        .R(reset0));
  FDRE \i_address_cnt_reg[30] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[30]_i_1_n_0 ),
        .Q(m00_axi_araddr[30]),
        .R(reset0));
  FDRE \i_address_cnt_reg[31] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[31]_i_1_n_0 ),
        .Q(m00_axi_araddr[31]),
        .R(reset0));
  FDRE \i_address_cnt_reg[32] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[32]_i_1_n_0 ),
        .Q(m00_axi_araddr[32]),
        .R(reset0));
  FDRE \i_address_cnt_reg[33] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[33]_i_1_n_0 ),
        .Q(m00_axi_araddr[33]),
        .R(reset0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \i_address_cnt_reg[33]_i_2 
       (.CI(\i_address_cnt_reg[25]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\i_address_cnt_reg[33]_i_2_n_0 ,\i_address_cnt_reg[33]_i_2_n_1 ,\i_address_cnt_reg[33]_i_2_n_2 ,\i_address_cnt_reg[33]_i_2_n_3 ,\i_address_cnt_reg[33]_i_2_n_4 ,\i_address_cnt_reg[33]_i_2_n_5 ,\i_address_cnt_reg[33]_i_2_n_6 ,\i_address_cnt_reg[33]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(in17[33:26]),
        .S(m00_axi_araddr[33:26]));
  FDRE \i_address_cnt_reg[34] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[34]_i_1_n_0 ),
        .Q(m00_axi_araddr[34]),
        .R(reset0));
  FDRE \i_address_cnt_reg[35] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[35]_i_1_n_0 ),
        .Q(m00_axi_araddr[35]),
        .R(reset0));
  FDRE \i_address_cnt_reg[36] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[36]_i_1_n_0 ),
        .Q(m00_axi_araddr[36]),
        .R(reset0));
  FDRE \i_address_cnt_reg[37] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[37]_i_1_n_0 ),
        .Q(m00_axi_araddr[37]),
        .R(reset0));
  FDRE \i_address_cnt_reg[38] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[38]_i_1_n_0 ),
        .Q(m00_axi_araddr[38]),
        .R(reset0));
  FDRE \i_address_cnt_reg[39] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[39]_i_1_n_0 ),
        .Q(m00_axi_araddr[39]),
        .R(reset0));
  FDRE \i_address_cnt_reg[3] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[3]_i_1_n_0 ),
        .Q(m00_axi_araddr[3]),
        .R(reset0));
  FDRE \i_address_cnt_reg[40] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[40]_i_1_n_0 ),
        .Q(m00_axi_araddr[40]),
        .R(reset0));
  FDRE \i_address_cnt_reg[41] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[41]_i_1_n_0 ),
        .Q(m00_axi_araddr[41]),
        .R(reset0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \i_address_cnt_reg[41]_i_2 
       (.CI(\i_address_cnt_reg[33]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\i_address_cnt_reg[41]_i_2_n_0 ,\i_address_cnt_reg[41]_i_2_n_1 ,\i_address_cnt_reg[41]_i_2_n_2 ,\i_address_cnt_reg[41]_i_2_n_3 ,\i_address_cnt_reg[41]_i_2_n_4 ,\i_address_cnt_reg[41]_i_2_n_5 ,\i_address_cnt_reg[41]_i_2_n_6 ,\i_address_cnt_reg[41]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(in17[41:34]),
        .S(m00_axi_araddr[41:34]));
  FDRE \i_address_cnt_reg[42] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[42]_i_1_n_0 ),
        .Q(m00_axi_araddr[42]),
        .R(reset0));
  FDRE \i_address_cnt_reg[43] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[43]_i_1_n_0 ),
        .Q(m00_axi_araddr[43]),
        .R(reset0));
  FDRE \i_address_cnt_reg[44] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[44]_i_1_n_0 ),
        .Q(m00_axi_araddr[44]),
        .R(reset0));
  FDRE \i_address_cnt_reg[45] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[45]_i_1_n_0 ),
        .Q(m00_axi_araddr[45]),
        .R(reset0));
  FDRE \i_address_cnt_reg[46] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[46]_i_1_n_0 ),
        .Q(m00_axi_araddr[46]),
        .R(reset0));
  FDRE \i_address_cnt_reg[47] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[47]_i_1_n_0 ),
        .Q(m00_axi_araddr[47]),
        .R(reset0));
  FDRE \i_address_cnt_reg[48] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[48]_i_1_n_0 ),
        .Q(m00_axi_araddr[48]),
        .R(reset0));
  FDRE \i_address_cnt_reg[49] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[49]_i_1_n_0 ),
        .Q(m00_axi_araddr[49]),
        .R(reset0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \i_address_cnt_reg[49]_i_2 
       (.CI(\i_address_cnt_reg[41]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\i_address_cnt_reg[49]_i_2_n_0 ,\i_address_cnt_reg[49]_i_2_n_1 ,\i_address_cnt_reg[49]_i_2_n_2 ,\i_address_cnt_reg[49]_i_2_n_3 ,\i_address_cnt_reg[49]_i_2_n_4 ,\i_address_cnt_reg[49]_i_2_n_5 ,\i_address_cnt_reg[49]_i_2_n_6 ,\i_address_cnt_reg[49]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(in17[49:42]),
        .S(m00_axi_araddr[49:42]));
  FDRE \i_address_cnt_reg[4] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[4]_i_1_n_0 ),
        .Q(m00_axi_araddr[4]),
        .R(reset0));
  FDRE \i_address_cnt_reg[50] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[50]_i_1_n_0 ),
        .Q(m00_axi_araddr[50]),
        .R(reset0));
  FDRE \i_address_cnt_reg[51] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[51]_i_1_n_0 ),
        .Q(m00_axi_araddr[51]),
        .R(reset0));
  FDRE \i_address_cnt_reg[52] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[52]_i_1_n_0 ),
        .Q(m00_axi_araddr[52]),
        .R(reset0));
  FDRE \i_address_cnt_reg[53] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[53]_i_1_n_0 ),
        .Q(m00_axi_araddr[53]),
        .R(reset0));
  FDRE \i_address_cnt_reg[54] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[54]_i_1_n_0 ),
        .Q(m00_axi_araddr[54]),
        .R(reset0));
  FDRE \i_address_cnt_reg[55] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[55]_i_1_n_0 ),
        .Q(m00_axi_araddr[55]),
        .R(reset0));
  FDRE \i_address_cnt_reg[56] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[56]_i_1_n_0 ),
        .Q(m00_axi_araddr[56]),
        .R(reset0));
  FDRE \i_address_cnt_reg[57] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[57]_i_1_n_0 ),
        .Q(m00_axi_araddr[57]),
        .R(reset0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \i_address_cnt_reg[57]_i_2 
       (.CI(\i_address_cnt_reg[49]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\i_address_cnt_reg[57]_i_2_n_0 ,\i_address_cnt_reg[57]_i_2_n_1 ,\i_address_cnt_reg[57]_i_2_n_2 ,\i_address_cnt_reg[57]_i_2_n_3 ,\i_address_cnt_reg[57]_i_2_n_4 ,\i_address_cnt_reg[57]_i_2_n_5 ,\i_address_cnt_reg[57]_i_2_n_6 ,\i_address_cnt_reg[57]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(in17[57:50]),
        .S(m00_axi_araddr[57:50]));
  FDRE \i_address_cnt_reg[58] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[58]_i_1_n_0 ),
        .Q(m00_axi_araddr[58]),
        .R(reset0));
  FDRE \i_address_cnt_reg[59] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[59]_i_1_n_0 ),
        .Q(m00_axi_araddr[59]),
        .R(reset0));
  FDRE \i_address_cnt_reg[5] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[5]_i_1_n_0 ),
        .Q(m00_axi_araddr[5]),
        .R(reset0));
  FDRE \i_address_cnt_reg[60] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[60]_i_1_n_0 ),
        .Q(m00_axi_araddr[60]),
        .R(reset0));
  FDRE \i_address_cnt_reg[61] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[61]_i_1_n_0 ),
        .Q(m00_axi_araddr[61]),
        .R(reset0));
  FDRE \i_address_cnt_reg[62] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[62]_i_1_n_0 ),
        .Q(m00_axi_araddr[62]),
        .R(reset0));
  FDRE \i_address_cnt_reg[63] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[63]_i_3_n_0 ),
        .Q(m00_axi_araddr[63]),
        .R(reset0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \i_address_cnt_reg[63]_i_6 
       (.CI(\i_address_cnt_reg[57]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_i_address_cnt_reg[63]_i_6_CO_UNCONNECTED [7:5],\i_address_cnt_reg[63]_i_6_n_3 ,\i_address_cnt_reg[63]_i_6_n_4 ,\i_address_cnt_reg[63]_i_6_n_5 ,\i_address_cnt_reg[63]_i_6_n_6 ,\i_address_cnt_reg[63]_i_6_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_i_address_cnt_reg[63]_i_6_O_UNCONNECTED [7:6],in17[63:58]}),
        .S({1'b0,1'b0,m00_axi_araddr[63:58]}));
  FDRE \i_address_cnt_reg[6] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[6]_i_1_n_0 ),
        .Q(m00_axi_araddr[6]),
        .R(reset0));
  FDRE \i_address_cnt_reg[7] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[7]_i_1_n_0 ),
        .Q(m00_axi_araddr[7]),
        .R(reset0));
  FDRE \i_address_cnt_reg[8] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[8]_i_1_n_0 ),
        .Q(m00_axi_araddr[8]),
        .R(reset0));
  FDRE \i_address_cnt_reg[9] 
       (.C(m00_axi_aclk),
        .CE(\i_address_cnt[63]_i_2_n_0 ),
        .D(\i_address_cnt[9]_i_1_n_0 ),
        .Q(m00_axi_araddr[9]),
        .R(reset0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \i_address_cnt_reg[9]_i_2 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\i_address_cnt_reg[9]_i_2_n_0 ,\i_address_cnt_reg[9]_i_2_n_1 ,\i_address_cnt_reg[9]_i_2_n_2 ,\i_address_cnt_reg[9]_i_2_n_3 ,\i_address_cnt_reg[9]_i_2_n_4 ,\i_address_cnt_reg[9]_i_2_n_5 ,\i_address_cnt_reg[9]_i_2_n_6 ,\i_address_cnt_reg[9]_i_2_n_7 }),
        .DI({m00_axi_araddr[9:3],1'b0}),
        .O(in17[9:2]),
        .S({\i_address_cnt[9]_i_3_n_0 ,\i_address_cnt[9]_i_4_n_0 ,\i_address_cnt[9]_i_5_n_0 ,\i_address_cnt[9]_i_6_n_0 ,\i_address_cnt[9]_i_7_n_0 ,\i_address_cnt[9]_i_8_n_0 ,\i_address_cnt[9]_i_9_n_0 ,m00_axi_araddr[2]}));
  LUT6 #(
    .INIT(64'h0100FFFF01000100)) 
    \i_burst_cnt[0]_i_1 
       (.I0(sel0[1]),
        .I1(\i_address_cnt[63]_i_4_n_0 ),
        .I2(sel0[0]),
        .I3(Q[1]),
        .I4(\i_burst_cnt_reg_n_0_[0] ),
        .I5(Q[2]),
        .O(\i_burst_cnt[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF1000)) 
    \i_burst_cnt[1]_i_1 
       (.I0(sel0[1]),
        .I1(\i_address_cnt[63]_i_4_n_0 ),
        .I2(sel0[0]),
        .I3(Q[1]),
        .I4(\i_burst_cnt[1]_i_2_n_0 ),
        .O(\i_burst_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h82)) 
    \i_burst_cnt[1]_i_2 
       (.I0(Q[2]),
        .I1(\i_burst_cnt_reg_n_0_[1] ),
        .I2(\i_burst_cnt_reg_n_0_[0] ),
        .O(\i_burst_cnt[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFF4040FF40404040)) 
    \i_burst_cnt[2]_i_1 
       (.I0(\i_address_cnt[63]_i_4_n_0 ),
        .I1(sel0[1]),
        .I2(Q[1]),
        .I3(\i_burst_cnt[2]_i_2_n_0 ),
        .I4(\i_burst_cnt_reg_n_0_[2] ),
        .I5(Q[2]),
        .O(\i_burst_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \i_burst_cnt[2]_i_2 
       (.I0(\i_burst_cnt_reg_n_0_[0] ),
        .I1(\i_burst_cnt_reg_n_0_[1] ),
        .O(\i_burst_cnt[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hF44F4444)) 
    \i_burst_cnt[3]_i_1 
       (.I0(\i_burst_cnt[3]_i_2_n_0 ),
        .I1(Q[1]),
        .I2(\i_burst_cnt[3]_i_3_n_0 ),
        .I3(\i_burst_cnt_reg_n_0_[3] ),
        .I4(Q[2]),
        .O(\i_burst_cnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFFFFFF)) 
    \i_burst_cnt[3]_i_2 
       (.I0(sel0[3]),
        .I1(\m_axi_arlen[5]_i_4_n_0 ),
        .I2(\m_axi_arlen[5]_i_3_n_0 ),
        .I3(\i_address_cnt[63]_i_7_n_0 ),
        .I4(sel0[4]),
        .I5(sel0[2]),
        .O(\i_burst_cnt[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \i_burst_cnt[3]_i_3 
       (.I0(\i_burst_cnt_reg_n_0_[1] ),
        .I1(\i_burst_cnt_reg_n_0_[0] ),
        .I2(\i_burst_cnt_reg_n_0_[2] ),
        .O(\i_burst_cnt[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF4040FF40404040)) 
    \i_burst_cnt[4]_i_1 
       (.I0(\i_selected_burst[1]_i_2_n_0 ),
        .I1(sel0[3]),
        .I2(Q[1]),
        .I3(\i_burst_cnt[4]_i_2_n_0 ),
        .I4(\i_burst_cnt_reg_n_0_[4] ),
        .I5(Q[2]),
        .O(\i_burst_cnt[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \i_burst_cnt[4]_i_2 
       (.I0(\i_burst_cnt_reg_n_0_[2] ),
        .I1(\i_burst_cnt_reg_n_0_[0] ),
        .I2(\i_burst_cnt_reg_n_0_[1] ),
        .I3(\i_burst_cnt_reg_n_0_[3] ),
        .O(\i_burst_cnt[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFF4040FF40404040)) 
    \i_burst_cnt[5]_i_1 
       (.I0(i_selected_burst__12),
        .I1(sel0[4]),
        .I2(Q[1]),
        .I3(\i_burst_cnt[7]_i_4_n_0 ),
        .I4(\i_burst_cnt_reg_n_0_[5] ),
        .I5(Q[2]),
        .O(\i_burst_cnt[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFF8888F88888888)) 
    \i_burst_cnt[6]_i_1 
       (.I0(Q[1]),
        .I1(i_selected_burst__12),
        .I2(\i_burst_cnt_reg_n_0_[5] ),
        .I3(\i_burst_cnt[7]_i_4_n_0 ),
        .I4(\i_burst_cnt_reg_n_0_[6] ),
        .I5(Q[2]),
        .O(\i_burst_cnt[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEEE)) 
    \i_burst_cnt[7]_i_1 
       (.I0(\i_burst_cnt_reg[0]_0 ),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(m00_axi_arready),
        .O(\i_burst_cnt[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h88888882)) 
    \i_burst_cnt[7]_i_2 
       (.I0(Q[2]),
        .I1(\i_burst_cnt_reg_n_0_[7] ),
        .I2(\i_burst_cnt_reg_n_0_[6] ),
        .I3(\i_burst_cnt_reg_n_0_[5] ),
        .I4(\i_burst_cnt[7]_i_4_n_0 ),
        .O(\i_burst_cnt[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \i_burst_cnt[7]_i_4 
       (.I0(\i_burst_cnt_reg_n_0_[3] ),
        .I1(\i_burst_cnt_reg_n_0_[1] ),
        .I2(\i_burst_cnt_reg_n_0_[0] ),
        .I3(\i_burst_cnt_reg_n_0_[2] ),
        .I4(\i_burst_cnt_reg_n_0_[4] ),
        .O(\i_burst_cnt[7]_i_4_n_0 ));
  FDRE \i_burst_cnt_reg[0] 
       (.C(m00_axi_aclk),
        .CE(\i_burst_cnt[7]_i_1_n_0 ),
        .D(\i_burst_cnt[0]_i_1_n_0 ),
        .Q(\i_burst_cnt_reg_n_0_[0] ),
        .R(reset0));
  FDRE \i_burst_cnt_reg[1] 
       (.C(m00_axi_aclk),
        .CE(\i_burst_cnt[7]_i_1_n_0 ),
        .D(\i_burst_cnt[1]_i_1_n_0 ),
        .Q(\i_burst_cnt_reg_n_0_[1] ),
        .R(reset0));
  FDRE \i_burst_cnt_reg[2] 
       (.C(m00_axi_aclk),
        .CE(\i_burst_cnt[7]_i_1_n_0 ),
        .D(\i_burst_cnt[2]_i_1_n_0 ),
        .Q(\i_burst_cnt_reg_n_0_[2] ),
        .R(reset0));
  FDRE \i_burst_cnt_reg[3] 
       (.C(m00_axi_aclk),
        .CE(\i_burst_cnt[7]_i_1_n_0 ),
        .D(\i_burst_cnt[3]_i_1_n_0 ),
        .Q(\i_burst_cnt_reg_n_0_[3] ),
        .R(reset0));
  FDRE \i_burst_cnt_reg[4] 
       (.C(m00_axi_aclk),
        .CE(\i_burst_cnt[7]_i_1_n_0 ),
        .D(\i_burst_cnt[4]_i_1_n_0 ),
        .Q(\i_burst_cnt_reg_n_0_[4] ),
        .R(reset0));
  FDRE \i_burst_cnt_reg[5] 
       (.C(m00_axi_aclk),
        .CE(\i_burst_cnt[7]_i_1_n_0 ),
        .D(\i_burst_cnt[5]_i_1_n_0 ),
        .Q(\i_burst_cnt_reg_n_0_[5] ),
        .R(reset0));
  FDRE \i_burst_cnt_reg[6] 
       (.C(m00_axi_aclk),
        .CE(\i_burst_cnt[7]_i_1_n_0 ),
        .D(\i_burst_cnt[6]_i_1_n_0 ),
        .Q(\i_burst_cnt_reg_n_0_[6] ),
        .R(reset0));
  FDRE \i_burst_cnt_reg[7] 
       (.C(m00_axi_aclk),
        .CE(\i_burst_cnt[7]_i_1_n_0 ),
        .D(\i_burst_cnt[7]_i_2_n_0 ),
        .Q(\i_burst_cnt_reg_n_0_[7] ),
        .R(reset0));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \i_selected_burst[0]_i_1 
       (.I0(Q[1]),
        .I1(sel0[0]),
        .I2(sel0[2]),
        .I3(\i_selected_burst[1]_i_2_n_0 ),
        .I4(sel0[3]),
        .I5(sel0[1]),
        .O(\i_selected_burst[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \i_selected_burst[1]_i_1 
       (.I0(Q[1]),
        .I1(sel0[0]),
        .I2(sel0[2]),
        .I3(\i_selected_burst[1]_i_2_n_0 ),
        .I4(sel0[3]),
        .I5(sel0[1]),
        .O(\i_selected_burst[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \i_selected_burst[1]_i_2 
       (.I0(\m_axi_arlen[5]_i_4_n_0 ),
        .I1(\m_axi_arlen[5]_i_3_n_0 ),
        .I2(\i_transfer_cnt_reg_n_0_[7] ),
        .I3(\i_transfer_cnt_reg_n_0_[8] ),
        .I4(\m_axi_arlen[5]_i_2_n_0 ),
        .I5(sel0[4]),
        .O(\i_selected_burst[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \i_selected_burst[2]_i_1 
       (.I0(Q[1]),
        .I1(sel0[1]),
        .I2(sel0[3]),
        .I3(i_selected_burst__12),
        .I4(sel0[4]),
        .I5(sel0[2]),
        .O(\i_selected_burst[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000008)) 
    \i_selected_burst[3]_i_1 
       (.I0(Q[1]),
        .I1(sel0[2]),
        .I2(sel0[4]),
        .I3(i_selected_burst__12),
        .I4(sel0[3]),
        .O(\i_selected_burst[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \i_selected_burst[4]_i_1 
       (.I0(Q[1]),
        .I1(sel0[3]),
        .I2(i_selected_burst__12),
        .I3(sel0[4]),
        .O(\i_selected_burst[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \i_selected_burst[5]_i_1 
       (.I0(Q[1]),
        .I1(sel0[4]),
        .I2(i_selected_burst__12),
        .O(\i_selected_burst[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \i_selected_burst[6]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\i_selected_burst[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \i_selected_burst[6]_i_2 
       (.I0(i_selected_burst__12),
        .I1(Q[1]),
        .O(\i_selected_burst[6]_i_2_n_0 ));
  FDRE \i_selected_burst_reg[0] 
       (.C(m00_axi_aclk),
        .CE(\i_selected_burst[6]_i_1_n_0 ),
        .D(\i_selected_burst[0]_i_1_n_0 ),
        .Q(\i_selected_burst_reg_n_0_[0] ),
        .R(reset0));
  FDRE \i_selected_burst_reg[1] 
       (.C(m00_axi_aclk),
        .CE(\i_selected_burst[6]_i_1_n_0 ),
        .D(\i_selected_burst[1]_i_1_n_0 ),
        .Q(\i_selected_burst_reg_n_0_[1] ),
        .R(reset0));
  FDRE \i_selected_burst_reg[2] 
       (.C(m00_axi_aclk),
        .CE(\i_selected_burst[6]_i_1_n_0 ),
        .D(\i_selected_burst[2]_i_1_n_0 ),
        .Q(\i_selected_burst_reg_n_0_[2] ),
        .R(reset0));
  FDRE \i_selected_burst_reg[3] 
       (.C(m00_axi_aclk),
        .CE(\i_selected_burst[6]_i_1_n_0 ),
        .D(\i_selected_burst[3]_i_1_n_0 ),
        .Q(\i_selected_burst_reg_n_0_[3] ),
        .R(reset0));
  FDRE \i_selected_burst_reg[4] 
       (.C(m00_axi_aclk),
        .CE(\i_selected_burst[6]_i_1_n_0 ),
        .D(\i_selected_burst[4]_i_1_n_0 ),
        .Q(\i_selected_burst_reg_n_0_[4] ),
        .R(reset0));
  FDRE \i_selected_burst_reg[5] 
       (.C(m00_axi_aclk),
        .CE(\i_selected_burst[6]_i_1_n_0 ),
        .D(\i_selected_burst[5]_i_1_n_0 ),
        .Q(\i_selected_burst_reg_n_0_[5] ),
        .R(reset0));
  FDRE \i_selected_burst_reg[6] 
       (.C(m00_axi_aclk),
        .CE(\i_selected_burst[6]_i_1_n_0 ),
        .D(\i_selected_burst[6]_i_2_n_0 ),
        .Q(\i_selected_burst_reg_n_0_[6] ),
        .R(reset0));
  LUT6 #(
    .INIT(64'hFFAEAEAEAEAEAEAE)) 
    \i_transfer_cnt[0]_i_1 
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(\i_transfer_cnt_reg_n_0_[0] ),
        .I3(\i_transfer_cnt_reg[22]_0 [0]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_transfer_cnt[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_transfer_cnt[10]_i_1 
       (.I0(Q[1]),
        .I1(in15[10]),
        .I2(Q[2]),
        .I3(\i_transfer_cnt_reg[22]_0 [10]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_transfer_cnt[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_transfer_cnt[11]_i_1 
       (.I0(Q[1]),
        .I1(in15[11]),
        .I2(Q[2]),
        .I3(\i_transfer_cnt_reg[22]_0 [11]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_transfer_cnt[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_transfer_cnt[12]_i_1 
       (.I0(Q[1]),
        .I1(in15[12]),
        .I2(Q[2]),
        .I3(\i_transfer_cnt_reg[22]_0 [12]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_transfer_cnt[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_transfer_cnt[13]_i_1 
       (.I0(Q[1]),
        .I1(in15[13]),
        .I2(Q[2]),
        .I3(\i_transfer_cnt_reg[22]_0 [13]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_transfer_cnt[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_transfer_cnt[14]_i_1 
       (.I0(Q[1]),
        .I1(in15[14]),
        .I2(Q[2]),
        .I3(\i_transfer_cnt_reg[22]_0 [14]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_transfer_cnt[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_transfer_cnt[15]_i_1 
       (.I0(Q[1]),
        .I1(in15[15]),
        .I2(Q[2]),
        .I3(\i_transfer_cnt_reg[22]_0 [15]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_transfer_cnt[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_transfer_cnt[16]_i_1 
       (.I0(Q[1]),
        .I1(in15[16]),
        .I2(Q[2]),
        .I3(\i_transfer_cnt_reg[22]_0 [16]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_transfer_cnt[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_transfer_cnt[17]_i_1 
       (.I0(Q[1]),
        .I1(in15[17]),
        .I2(Q[2]),
        .I3(\i_transfer_cnt_reg[22]_0 [17]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_transfer_cnt[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_transfer_cnt[18]_i_1 
       (.I0(Q[1]),
        .I1(in15[18]),
        .I2(Q[2]),
        .I3(\i_transfer_cnt_reg[22]_0 [18]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_transfer_cnt[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_transfer_cnt[19]_i_1 
       (.I0(Q[1]),
        .I1(in15[19]),
        .I2(Q[2]),
        .I3(\i_transfer_cnt_reg[22]_0 [19]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_transfer_cnt[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_transfer_cnt[1]_i_1 
       (.I0(Q[1]),
        .I1(in15[1]),
        .I2(Q[2]),
        .I3(\i_transfer_cnt_reg[22]_0 [1]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_transfer_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_transfer_cnt[20]_i_1 
       (.I0(Q[1]),
        .I1(in15[20]),
        .I2(Q[2]),
        .I3(\i_transfer_cnt_reg[22]_0 [20]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_transfer_cnt[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_transfer_cnt[21]_i_1 
       (.I0(Q[1]),
        .I1(in15[21]),
        .I2(Q[2]),
        .I3(\i_transfer_cnt_reg[22]_0 [21]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_transfer_cnt[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_transfer_cnt[22]_i_2 
       (.I0(Q[1]),
        .I1(in15[22]),
        .I2(Q[2]),
        .I3(\i_transfer_cnt_reg[22]_0 [22]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_transfer_cnt[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_transfer_cnt[2]_i_1 
       (.I0(Q[1]),
        .I1(in15[2]),
        .I2(Q[2]),
        .I3(\i_transfer_cnt_reg[22]_0 [2]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_transfer_cnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_transfer_cnt[3]_i_1 
       (.I0(Q[1]),
        .I1(in15[3]),
        .I2(Q[2]),
        .I3(\i_transfer_cnt_reg[22]_0 [3]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_transfer_cnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_transfer_cnt[4]_i_1 
       (.I0(Q[1]),
        .I1(in15[4]),
        .I2(Q[2]),
        .I3(\i_transfer_cnt_reg[22]_0 [4]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_transfer_cnt[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_transfer_cnt[5]_i_1 
       (.I0(Q[1]),
        .I1(in15[5]),
        .I2(Q[2]),
        .I3(\i_transfer_cnt_reg[22]_0 [5]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_transfer_cnt[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_transfer_cnt[6]_i_1 
       (.I0(Q[1]),
        .I1(in15[6]),
        .I2(Q[2]),
        .I3(\i_transfer_cnt_reg[22]_0 [6]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_transfer_cnt[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_transfer_cnt[7]_i_1 
       (.I0(Q[1]),
        .I1(in15[7]),
        .I2(Q[2]),
        .I3(\i_transfer_cnt_reg[22]_0 [7]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_transfer_cnt[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_transfer_cnt[8]_i_1 
       (.I0(Q[1]),
        .I1(in15[8]),
        .I2(Q[2]),
        .I3(\i_transfer_cnt_reg[22]_0 [8]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_transfer_cnt[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAEAEAEAEAEAEA)) 
    \i_transfer_cnt[9]_i_1 
       (.I0(Q[1]),
        .I1(in15[9]),
        .I2(Q[2]),
        .I3(\i_transfer_cnt_reg[22]_0 [9]),
        .I4(mm2s_run),
        .I5(Q[0]),
        .O(\i_transfer_cnt[9]_i_1_n_0 ));
  FDRE \i_transfer_cnt_reg[0] 
       (.C(m00_axi_aclk),
        .CE(E),
        .D(\i_transfer_cnt[0]_i_1_n_0 ),
        .Q(\i_transfer_cnt_reg_n_0_[0] ),
        .R(reset0));
  FDRE \i_transfer_cnt_reg[10] 
       (.C(m00_axi_aclk),
        .CE(E),
        .D(\i_transfer_cnt[10]_i_1_n_0 ),
        .Q(\i_transfer_cnt_reg_n_0_[10] ),
        .R(reset0));
  FDRE \i_transfer_cnt_reg[11] 
       (.C(m00_axi_aclk),
        .CE(E),
        .D(\i_transfer_cnt[11]_i_1_n_0 ),
        .Q(\i_transfer_cnt_reg_n_0_[11] ),
        .R(reset0));
  FDRE \i_transfer_cnt_reg[12] 
       (.C(m00_axi_aclk),
        .CE(E),
        .D(\i_transfer_cnt[12]_i_1_n_0 ),
        .Q(\i_transfer_cnt_reg_n_0_[12] ),
        .R(reset0));
  FDRE \i_transfer_cnt_reg[13] 
       (.C(m00_axi_aclk),
        .CE(E),
        .D(\i_transfer_cnt[13]_i_1_n_0 ),
        .Q(\i_transfer_cnt_reg_n_0_[13] ),
        .R(reset0));
  FDRE \i_transfer_cnt_reg[14] 
       (.C(m00_axi_aclk),
        .CE(E),
        .D(\i_transfer_cnt[14]_i_1_n_0 ),
        .Q(\i_transfer_cnt_reg_n_0_[14] ),
        .R(reset0));
  FDRE \i_transfer_cnt_reg[15] 
       (.C(m00_axi_aclk),
        .CE(E),
        .D(\i_transfer_cnt[15]_i_1_n_0 ),
        .Q(\i_transfer_cnt_reg_n_0_[15] ),
        .R(reset0));
  FDRE \i_transfer_cnt_reg[16] 
       (.C(m00_axi_aclk),
        .CE(E),
        .D(\i_transfer_cnt[16]_i_1_n_0 ),
        .Q(\i_transfer_cnt_reg_n_0_[16] ),
        .R(reset0));
  FDRE \i_transfer_cnt_reg[17] 
       (.C(m00_axi_aclk),
        .CE(E),
        .D(\i_transfer_cnt[17]_i_1_n_0 ),
        .Q(\i_transfer_cnt_reg_n_0_[17] ),
        .R(reset0));
  FDRE \i_transfer_cnt_reg[18] 
       (.C(m00_axi_aclk),
        .CE(E),
        .D(\i_transfer_cnt[18]_i_1_n_0 ),
        .Q(\i_transfer_cnt_reg_n_0_[18] ),
        .R(reset0));
  FDRE \i_transfer_cnt_reg[19] 
       (.C(m00_axi_aclk),
        .CE(E),
        .D(\i_transfer_cnt[19]_i_1_n_0 ),
        .Q(\i_transfer_cnt_reg_n_0_[19] ),
        .R(reset0));
  FDRE \i_transfer_cnt_reg[1] 
       (.C(m00_axi_aclk),
        .CE(E),
        .D(\i_transfer_cnt[1]_i_1_n_0 ),
        .Q(sel0[0]),
        .R(reset0));
  FDRE \i_transfer_cnt_reg[20] 
       (.C(m00_axi_aclk),
        .CE(E),
        .D(\i_transfer_cnt[20]_i_1_n_0 ),
        .Q(\i_transfer_cnt_reg_n_0_[20] ),
        .R(reset0));
  FDRE \i_transfer_cnt_reg[21] 
       (.C(m00_axi_aclk),
        .CE(E),
        .D(\i_transfer_cnt[21]_i_1_n_0 ),
        .Q(\i_transfer_cnt_reg_n_0_[21] ),
        .R(reset0));
  FDRE \i_transfer_cnt_reg[22] 
       (.C(m00_axi_aclk),
        .CE(E),
        .D(\i_transfer_cnt[22]_i_2_n_0 ),
        .Q(\i_transfer_cnt_reg_n_0_[22] ),
        .R(reset0));
  FDRE \i_transfer_cnt_reg[2] 
       (.C(m00_axi_aclk),
        .CE(E),
        .D(\i_transfer_cnt[2]_i_1_n_0 ),
        .Q(sel0[1]),
        .R(reset0));
  FDRE \i_transfer_cnt_reg[3] 
       (.C(m00_axi_aclk),
        .CE(E),
        .D(\i_transfer_cnt[3]_i_1_n_0 ),
        .Q(sel0[2]),
        .R(reset0));
  FDRE \i_transfer_cnt_reg[4] 
       (.C(m00_axi_aclk),
        .CE(E),
        .D(\i_transfer_cnt[4]_i_1_n_0 ),
        .Q(sel0[3]),
        .R(reset0));
  FDRE \i_transfer_cnt_reg[5] 
       (.C(m00_axi_aclk),
        .CE(E),
        .D(\i_transfer_cnt[5]_i_1_n_0 ),
        .Q(sel0[4]),
        .R(reset0));
  FDRE \i_transfer_cnt_reg[6] 
       (.C(m00_axi_aclk),
        .CE(E),
        .D(\i_transfer_cnt[6]_i_1_n_0 ),
        .Q(\i_transfer_cnt_reg_n_0_[6] ),
        .R(reset0));
  FDRE \i_transfer_cnt_reg[7] 
       (.C(m00_axi_aclk),
        .CE(E),
        .D(\i_transfer_cnt[7]_i_1_n_0 ),
        .Q(\i_transfer_cnt_reg_n_0_[7] ),
        .R(reset0));
  FDRE \i_transfer_cnt_reg[8] 
       (.C(m00_axi_aclk),
        .CE(E),
        .D(\i_transfer_cnt[8]_i_1_n_0 ),
        .Q(\i_transfer_cnt_reg_n_0_[8] ),
        .R(reset0));
  FDRE \i_transfer_cnt_reg[9] 
       (.C(m00_axi_aclk),
        .CE(E),
        .D(\i_transfer_cnt[9]_i_1_n_0 ),
        .Q(\i_transfer_cnt_reg_n_0_[9] ),
        .R(reset0));
  CARRY8 is_last0_carry
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({is_last0_carry_n_0,is_last0_carry_n_1,is_last0_carry_n_2,is_last0_carry_n_3,is_last0_carry_n_4,is_last0_carry_n_5,is_last0_carry_n_6,is_last0_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_is_last0_carry_O_UNCONNECTED[7:0]),
        .S({is_last0_carry_i_1_n_0,is_last0_carry_i_2_n_0,is_last0_carry_i_3_n_0,is_last0_carry_i_4_n_0,is_last0_carry_i_5_n_0,is_last0_carry_i_6_n_0,is_last0_carry_i_7_n_0,is_last0_carry_i_8_n_0}));
  LUT2 #(
    .INIT(4'h1)) 
    is_last0_carry_i_1
       (.I0(\i_transfer_cnt_reg_n_0_[22] ),
        .I1(\i_transfer_cnt_reg_n_0_[21] ),
        .O(is_last0_carry_i_1_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    is_last0_carry_i_2
       (.I0(\i_transfer_cnt_reg_n_0_[18] ),
        .I1(\i_transfer_cnt_reg_n_0_[19] ),
        .I2(\i_transfer_cnt_reg_n_0_[20] ),
        .O(is_last0_carry_i_2_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    is_last0_carry_i_3
       (.I0(\i_transfer_cnt_reg_n_0_[15] ),
        .I1(\i_transfer_cnt_reg_n_0_[16] ),
        .I2(\i_transfer_cnt_reg_n_0_[17] ),
        .O(is_last0_carry_i_3_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    is_last0_carry_i_4
       (.I0(\i_transfer_cnt_reg_n_0_[12] ),
        .I1(\i_transfer_cnt_reg_n_0_[13] ),
        .I2(\i_transfer_cnt_reg_n_0_[14] ),
        .O(is_last0_carry_i_4_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    is_last0_carry_i_5
       (.I0(\i_transfer_cnt_reg_n_0_[9] ),
        .I1(\i_transfer_cnt_reg_n_0_[10] ),
        .I2(\i_transfer_cnt_reg_n_0_[11] ),
        .O(is_last0_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h0009)) 
    is_last0_carry_i_6
       (.I0(\i_transfer_cnt_reg_n_0_[6] ),
        .I1(i_selected_burst__12),
        .I2(\i_transfer_cnt_reg_n_0_[8] ),
        .I3(\i_transfer_cnt_reg_n_0_[7] ),
        .O(is_last0_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h0117)) 
    is_last0_carry_i_7
       (.I0(sel0[2]),
        .I1(sel0[3]),
        .I2(i_selected_burst__12),
        .I3(sel0[4]),
        .O(is_last0_carry_i_7_n_0));
  LUT6 #(
    .INIT(64'h0000000111111116)) 
    is_last0_carry_i_8
       (.I0(\i_transfer_cnt_reg_n_0_[0] ),
        .I1(sel0[1]),
        .I2(sel0[3]),
        .I3(\i_selected_burst[1]_i_2_n_0 ),
        .I4(sel0[2]),
        .I5(sel0[0]),
        .O(is_last0_carry_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h8F88)) 
    is_last_i_1
       (.I0(Q[1]),
        .I1(is_last0_carry_n_0),
        .I2(Q[0]),
        .I3(is_last_reg_n_0),
        .O(is_last_i_1_n_0));
  FDRE is_last_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(is_last_i_1_n_0),
        .Q(is_last_reg_n_0),
        .R(reset0));
  FDRE \m_axi_arburst_reg[0] 
       (.C(m00_axi_aclk),
        .CE(Q[1]),
        .D(1'b1),
        .Q(m00_axi_arburst),
        .R(reset0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \m_axi_arlen[0]_i_1 
       (.I0(sel0[1]),
        .I1(sel0[3]),
        .I2(i_selected_burst__12),
        .I3(sel0[4]),
        .I4(sel0[2]),
        .I5(sel0[0]),
        .O(minusOp));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \m_axi_arlen[1]_i_1 
       (.I0(sel0[2]),
        .I1(sel0[4]),
        .I2(i_selected_burst__12),
        .I3(sel0[3]),
        .I4(sel0[1]),
        .O(\m_axi_arlen[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \m_axi_arlen[2]_i_1 
       (.I0(sel0[3]),
        .I1(i_selected_burst__12),
        .I2(sel0[4]),
        .I3(sel0[2]),
        .O(\m_axi_arlen[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \m_axi_arlen[3]_i_1 
       (.I0(sel0[4]),
        .I1(i_selected_burst__12),
        .I2(sel0[3]),
        .O(\m_axi_arlen[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \m_axi_arlen[4]_i_1 
       (.I0(i_selected_burst__12),
        .I1(sel0[4]),
        .O(\m_axi_arlen[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \m_axi_arlen[5]_i_1 
       (.I0(\m_axi_arlen[5]_i_2_n_0 ),
        .I1(\i_transfer_cnt_reg_n_0_[8] ),
        .I2(\i_transfer_cnt_reg_n_0_[7] ),
        .I3(\m_axi_arlen[5]_i_3_n_0 ),
        .I4(\m_axi_arlen[5]_i_4_n_0 ),
        .O(i_selected_burst__12));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \m_axi_arlen[5]_i_2 
       (.I0(\i_transfer_cnt_reg_n_0_[20] ),
        .I1(\i_transfer_cnt_reg_n_0_[19] ),
        .I2(\i_transfer_cnt_reg_n_0_[18] ),
        .O(\m_axi_arlen[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \m_axi_arlen[5]_i_3 
       (.I0(\i_transfer_cnt_reg_n_0_[12] ),
        .I1(\i_transfer_cnt_reg_n_0_[13] ),
        .I2(\i_transfer_cnt_reg_n_0_[14] ),
        .I3(\i_transfer_cnt_reg_n_0_[15] ),
        .I4(\i_transfer_cnt_reg_n_0_[16] ),
        .I5(\i_transfer_cnt_reg_n_0_[17] ),
        .O(\m_axi_arlen[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \m_axi_arlen[5]_i_4 
       (.I0(\i_transfer_cnt_reg_n_0_[6] ),
        .I1(\i_transfer_cnt_reg_n_0_[21] ),
        .I2(\i_transfer_cnt_reg_n_0_[22] ),
        .I3(\i_transfer_cnt_reg_n_0_[9] ),
        .I4(\i_transfer_cnt_reg_n_0_[10] ),
        .I5(\i_transfer_cnt_reg_n_0_[11] ),
        .O(\m_axi_arlen[5]_i_4_n_0 ));
  FDRE \m_axi_arlen_reg[0] 
       (.C(m00_axi_aclk),
        .CE(Q[1]),
        .D(minusOp),
        .Q(m00_axi_arlen[0]),
        .R(reset0));
  FDRE \m_axi_arlen_reg[1] 
       (.C(m00_axi_aclk),
        .CE(Q[1]),
        .D(\m_axi_arlen[1]_i_1_n_0 ),
        .Q(m00_axi_arlen[1]),
        .R(reset0));
  FDRE \m_axi_arlen_reg[2] 
       (.C(m00_axi_aclk),
        .CE(Q[1]),
        .D(\m_axi_arlen[2]_i_1_n_0 ),
        .Q(m00_axi_arlen[2]),
        .R(reset0));
  FDRE \m_axi_arlen_reg[3] 
       (.C(m00_axi_aclk),
        .CE(Q[1]),
        .D(\m_axi_arlen[3]_i_1_n_0 ),
        .Q(m00_axi_arlen[3]),
        .R(reset0));
  FDRE \m_axi_arlen_reg[4] 
       (.C(m00_axi_aclk),
        .CE(Q[1]),
        .D(\m_axi_arlen[4]_i_1_n_0 ),
        .Q(m00_axi_arlen[4]),
        .R(reset0));
  FDRE \m_axi_arlen_reg[5] 
       (.C(m00_axi_aclk),
        .CE(Q[1]),
        .D(i_selected_burst__12),
        .Q(m00_axi_arlen[5]),
        .R(reset0));
  FDRE m_axi_arvalid_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(Q[1]),
        .Q(m00_axi_arvalid),
        .R(reset0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 minusOp_carry
       (.CI(\i_transfer_cnt_reg_n_0_[0] ),
        .CI_TOP(1'b0),
        .CO({minusOp_carry_n_0,minusOp_carry_n_1,minusOp_carry_n_2,minusOp_carry_n_3,minusOp_carry_n_4,minusOp_carry_n_5,minusOp_carry_n_6,minusOp_carry_n_7}),
        .DI({\i_transfer_cnt_reg_n_0_[8] ,\i_transfer_cnt_reg_n_0_[7] ,\i_transfer_cnt_reg_n_0_[6] ,sel0}),
        .O(in15[8:1]),
        .S({minusOp_carry_i_1_n_0,minusOp_carry_i_2_n_0,minusOp_carry_i_3_n_0,minusOp_carry_i_4_n_0,minusOp_carry_i_5_n_0,minusOp_carry_i_6_n_0,minusOp_carry_i_7_n_0,minusOp_carry_i_8_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 minusOp_carry__0
       (.CI(minusOp_carry_n_0),
        .CI_TOP(1'b0),
        .CO({minusOp_carry__0_n_0,minusOp_carry__0_n_1,minusOp_carry__0_n_2,minusOp_carry__0_n_3,minusOp_carry__0_n_4,minusOp_carry__0_n_5,minusOp_carry__0_n_6,minusOp_carry__0_n_7}),
        .DI({\i_transfer_cnt_reg_n_0_[16] ,\i_transfer_cnt_reg_n_0_[15] ,\i_transfer_cnt_reg_n_0_[14] ,\i_transfer_cnt_reg_n_0_[13] ,\i_transfer_cnt_reg_n_0_[12] ,\i_transfer_cnt_reg_n_0_[11] ,\i_transfer_cnt_reg_n_0_[10] ,\i_transfer_cnt_reg_n_0_[9] }),
        .O(in15[16:9]),
        .S({minusOp_carry__0_i_1_n_0,minusOp_carry__0_i_2_n_0,minusOp_carry__0_i_3_n_0,minusOp_carry__0_i_4_n_0,minusOp_carry__0_i_5_n_0,minusOp_carry__0_i_6_n_0,minusOp_carry__0_i_7_n_0,minusOp_carry__0_i_8_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__0_i_1
       (.I0(\i_transfer_cnt_reg_n_0_[16] ),
        .O(minusOp_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__0_i_2
       (.I0(\i_transfer_cnt_reg_n_0_[15] ),
        .O(minusOp_carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__0_i_3
       (.I0(\i_transfer_cnt_reg_n_0_[14] ),
        .O(minusOp_carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__0_i_4
       (.I0(\i_transfer_cnt_reg_n_0_[13] ),
        .O(minusOp_carry__0_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__0_i_5
       (.I0(\i_transfer_cnt_reg_n_0_[12] ),
        .O(minusOp_carry__0_i_5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__0_i_6
       (.I0(\i_transfer_cnt_reg_n_0_[11] ),
        .O(minusOp_carry__0_i_6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__0_i_7
       (.I0(\i_transfer_cnt_reg_n_0_[10] ),
        .O(minusOp_carry__0_i_7_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__0_i_8
       (.I0(\i_transfer_cnt_reg_n_0_[9] ),
        .O(minusOp_carry__0_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 minusOp_carry__1
       (.CI(minusOp_carry__0_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_minusOp_carry__1_CO_UNCONNECTED[7:5],minusOp_carry__1_n_3,minusOp_carry__1_n_4,minusOp_carry__1_n_5,minusOp_carry__1_n_6,minusOp_carry__1_n_7}),
        .DI({1'b0,1'b0,1'b0,\i_transfer_cnt_reg_n_0_[21] ,\i_transfer_cnt_reg_n_0_[20] ,\i_transfer_cnt_reg_n_0_[19] ,\i_transfer_cnt_reg_n_0_[18] ,\i_transfer_cnt_reg_n_0_[17] }),
        .O({NLW_minusOp_carry__1_O_UNCONNECTED[7:6],in15[22:17]}),
        .S({1'b0,1'b0,minusOp_carry__1_i_1_n_0,minusOp_carry__1_i_2_n_0,minusOp_carry__1_i_3_n_0,minusOp_carry__1_i_4_n_0,minusOp_carry__1_i_5_n_0,minusOp_carry__1_i_6_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__1_i_1
       (.I0(\i_transfer_cnt_reg_n_0_[22] ),
        .O(minusOp_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__1_i_2
       (.I0(\i_transfer_cnt_reg_n_0_[21] ),
        .O(minusOp_carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__1_i_3
       (.I0(\i_transfer_cnt_reg_n_0_[20] ),
        .O(minusOp_carry__1_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__1_i_4
       (.I0(\i_transfer_cnt_reg_n_0_[19] ),
        .O(minusOp_carry__1_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__1_i_5
       (.I0(\i_transfer_cnt_reg_n_0_[18] ),
        .O(minusOp_carry__1_i_5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry__1_i_6
       (.I0(\i_transfer_cnt_reg_n_0_[17] ),
        .O(minusOp_carry__1_i_6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry_i_1
       (.I0(\i_transfer_cnt_reg_n_0_[8] ),
        .O(minusOp_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry_i_2
       (.I0(\i_transfer_cnt_reg_n_0_[7] ),
        .O(minusOp_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry_i_3
       (.I0(\i_transfer_cnt_reg_n_0_[6] ),
        .O(minusOp_carry_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry_i_4
       (.I0(sel0[4]),
        .O(minusOp_carry_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry_i_5
       (.I0(sel0[3]),
        .O(minusOp_carry_i_5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry_i_6
       (.I0(sel0[2]),
        .O(minusOp_carry_i_6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry_i_7
       (.I0(sel0[1]),
        .O(minusOp_carry_i_7_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry_i_8
       (.I0(sel0[0]),
        .O(minusOp_carry_i_8_n_0));
  LUT5 #(
    .INIT(32'h71513000)) 
    mm2s_run_i_1
       (.I0(mm2s_run_ack),
        .I1(vfsm_state[1]),
        .I2(vfsm_state[0]),
        .I3(dest_out),
        .I4(mm2s_run),
        .O(run_ack_reg_0));
  LUT6 #(
    .INIT(64'hEFFFFFFF40000000)) 
    \regfile[0][17]_i_1 
       (.I0(wready0__0),
        .I1(\regfile[0][17]_i_2_n_0 ),
        .I2(s00_axi_wstrb),
        .I3(\regfile_reg[0][17] ),
        .I4(wready06_out),
        .I5(p_0_in[17]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000002)) 
    \regfile[0][17]_i_2 
       (.I0(s00_axi_wdata[0]),
        .I1(s00_axi_awaddr[3]),
        .I2(s00_axi_awaddr[2]),
        .I3(s00_axi_awaddr[0]),
        .I4(s00_axi_awaddr[1]),
        .I5(p_0_in[17]),
        .O(\regfile[0][17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hEFFFFFFF40000000)) 
    \regfile[0][18]_i_1 
       (.I0(wready0__0),
        .I1(\regfile[0][18]_i_2_n_0 ),
        .I2(s00_axi_wstrb),
        .I3(\regfile_reg[0][17] ),
        .I4(wready06_out),
        .I5(p_0_in[18]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000002)) 
    \regfile[0][18]_i_2 
       (.I0(s00_axi_wdata[1]),
        .I1(s00_axi_awaddr[3]),
        .I2(s00_axi_awaddr[2]),
        .I3(s00_axi_awaddr[0]),
        .I4(s00_axi_awaddr[1]),
        .I5(p_0_in[18]),
        .O(\regfile[0][18]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    run_ack_i_1
       (.I0(mm2s_run),
        .I1(Q[0]),
        .I2(mm2s_run_ack),
        .O(run_ack_i_1_n_0));
  FDRE run_ack_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(run_ack_i_1_n_0),
        .Q(mm2s_run_ack),
        .R(reset0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \status[0]_i_1 
       (.I0(m00_axi_rresp[0]),
        .I1(Q[2]),
        .O(\status[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF80000000)) 
    \status[1]_i_1 
       (.I0(\status[1]_i_3_n_0 ),
        .I1(m00_axi_rvalid),
        .I2(Q[2]),
        .I3(s_axis_tready),
        .I4(s_aresetn),
        .I5(\status[1]_i_4_n_0 ),
        .O(\status[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \status[1]_i_2 
       (.I0(m00_axi_rresp[1]),
        .I1(Q[2]),
        .O(\status[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000002)) 
    \status[1]_i_3 
       (.I0(\i_address_cnt[63]_i_9_n_0 ),
        .I1(\i_burst_cnt_reg_n_0_[7] ),
        .I2(\i_burst_cnt_reg_n_0_[6] ),
        .I3(\i_burst_cnt_reg_n_0_[5] ),
        .I4(\i_burst_cnt_reg_n_0_[4] ),
        .I5(m00_axi_rlast),
        .O(\status[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \status[1]_i_4 
       (.I0(mm2s_run),
        .I1(Q[0]),
        .O(\status[1]_i_4_n_0 ));
  FDRE \status_reg[0] 
       (.C(m00_axi_aclk),
        .CE(\status[1]_i_1_n_0 ),
        .D(\status[0]_i_1_n_0 ),
        .Q(p_0_in[17]),
        .R(reset0));
  FDRE \status_reg[1] 
       (.C(m00_axi_aclk),
        .CE(\status[1]_i_1_n_0 ),
        .D(\status[1]_i_2_n_0 ),
        .Q(p_0_in[18]),
        .R(reset0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hF1)) 
    \vfsm_state[0]_i_1 
       (.I0(vfsm_state[1]),
        .I1(vfsm_state[0]),
        .I2(mm2s_error),
        .O(\vfsm_state_reg[1] ));
  LUT6 #(
    .INIT(64'hFFFFFFFF33E200E2)) 
    \vfsm_state[1]_i_2 
       (.I0(\vfsm_state_reg[0]_0 ),
        .I1(vfsm_state[1]),
        .I2(mm2s_done),
        .I3(vfsm_state[0]),
        .I4(dest_out),
        .I5(mm2s_error),
        .O(\regfile_reg[0][3] ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \vfsm_state[1]_i_3 
       (.I0(vfsm_state[0]),
        .I1(mm2s_error),
        .O(\vfsm_state_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    xpm_fifo_axis_inst_i_1
       (.I0(Q[2]),
        .I1(m00_axi_rvalid),
        .O(s_axis_tvalid));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    xpm_fifo_axis_inst_i_2
       (.I0(is_last_reg_n_0),
        .I1(m00_axi_rlast),
        .O(s_axis_tlast));
endmodule

(* ORIG_REF_NAME = "axi_video_v1_0" *) 
module design_1_axi_video_0_3_axi_video_v1_0
   (rvalid_reg_0,
    bvalid_reg_0,
    m00_axi_araddr,
    m00_axi_arlen,
    m00_axi_arburst,
    m00_axi_arvalid,
    video_rgb,
    video_hsync,
    video_vsync,
    video_active,
    s00_axi_arready,
    s00_axi_rdata,
    m00_axi_rready,
    s00_axi_awready,
    s00_axi_rready,
    s00_axi_aresetn,
    s00_axi_awaddr,
    s00_axi_araddr,
    s00_axi_arvalid,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_bready,
    m00_axi_aclk,
    m00_axi_rdata,
    m00_axi_ruser,
    video_clk,
    s00_axi_wdata,
    s00_axi_aclk,
    m00_axi_rvalid,
    m00_axi_rlast,
    m00_axi_rresp,
    m00_axi_arready,
    s00_axi_wstrb,
    m00_axi_aresetn);
  output rvalid_reg_0;
  output bvalid_reg_0;
  output [63:0]m00_axi_araddr;
  output [5:0]m00_axi_arlen;
  output [0:0]m00_axi_arburst;
  output m00_axi_arvalid;
  output [23:0]video_rgb;
  output video_hsync;
  output video_vsync;
  output video_active;
  output s00_axi_arready;
  output [31:0]s00_axi_rdata;
  output m00_axi_rready;
  output s00_axi_awready;
  input s00_axi_rready;
  input s00_axi_aresetn;
  input [3:0]s00_axi_awaddr;
  input [3:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input s00_axi_bready;
  input m00_axi_aclk;
  input [63:0]m00_axi_rdata;
  input [7:0]m00_axi_ruser;
  input video_clk;
  input [31:0]s00_axi_wdata;
  input s00_axi_aclk;
  input m00_axi_rvalid;
  input m00_axi_rlast;
  input [1:0]m00_axi_rresp;
  input m00_axi_arready;
  input [3:0]s00_axi_wstrb;
  input m00_axi_aresetn;

  wire \??1_out ;
  wire bvalid_i_1_n_0;
  wire bvalid_reg_0;
  wire cdc_axi;
  wire [1:0]cdc_video;
  wire m00_axi_aclk;
  wire [63:0]m00_axi_araddr;
  wire [0:0]m00_axi_arburst;
  wire m00_axi_aresetn;
  wire [5:0]m00_axi_arlen;
  wire m00_axi_arready;
  wire m00_axi_arvalid;
  wire [63:0]m00_axi_rdata;
  wire m00_axi_rlast;
  wire m00_axi_rready;
  wire [1:0]m00_axi_rresp;
  wire [7:0]m00_axi_ruser;
  wire m00_axi_rvalid;
  wire m_axis_tlast;
  wire m_axis_tvalid;
  wire [63:0]mm2s_address;
  wire \mm2s_address[63]_i_1_n_0 ;
  wire mm2s_n_1;
  wire mm2s_n_2;
  wire mm2s_n_3;
  wire mm2s_n_5;
  wire mm2s_n_6;
  wire mm2s_n_7;
  wire mm2s_n_76;
  wire mm2s_run;
  wire \mm2s_size_words_reg_n_0_[0] ;
  wire \mm2s_size_words_reg_n_0_[10] ;
  wire \mm2s_size_words_reg_n_0_[11] ;
  wire \mm2s_size_words_reg_n_0_[12] ;
  wire \mm2s_size_words_reg_n_0_[13] ;
  wire \mm2s_size_words_reg_n_0_[14] ;
  wire \mm2s_size_words_reg_n_0_[15] ;
  wire \mm2s_size_words_reg_n_0_[16] ;
  wire \mm2s_size_words_reg_n_0_[17] ;
  wire \mm2s_size_words_reg_n_0_[18] ;
  wire \mm2s_size_words_reg_n_0_[19] ;
  wire \mm2s_size_words_reg_n_0_[1] ;
  wire \mm2s_size_words_reg_n_0_[20] ;
  wire \mm2s_size_words_reg_n_0_[21] ;
  wire \mm2s_size_words_reg_n_0_[22] ;
  wire \mm2s_size_words_reg_n_0_[2] ;
  wire \mm2s_size_words_reg_n_0_[3] ;
  wire \mm2s_size_words_reg_n_0_[4] ;
  wire \mm2s_size_words_reg_n_0_[5] ;
  wire \mm2s_size_words_reg_n_0_[6] ;
  wire \mm2s_size_words_reg_n_0_[7] ;
  wire \mm2s_size_words_reg_n_0_[8] ;
  wire \mm2s_size_words_reg_n_0_[9] ;
  wire p_18_in;
  wire [0:0]p_1_in;
  wire [18:16]p_1_in__0;
  wire p_4_in;
  wire \regfile[0][15]_i_1_n_0 ;
  wire \regfile[0][16]_i_2_n_0 ;
  wire \regfile[0][23]_i_1_n_0 ;
  wire \regfile[0][23]_i_2_n_0 ;
  wire \regfile[0][31]_i_2_n_0 ;
  wire \regfile[0][31]_i_3_n_0 ;
  wire \regfile[0][7]_i_1_n_0 ;
  wire \regfile[10][15]_i_1_n_0 ;
  wire \regfile[10][23]_i_1_n_0 ;
  wire \regfile[10][31]_i_1_n_0 ;
  wire \regfile[10][7]_i_1_n_0 ;
  wire \regfile[11][15]_i_1_n_0 ;
  wire \regfile[11][23]_i_1_n_0 ;
  wire \regfile[11][31]_i_1_n_0 ;
  wire \regfile[11][7]_i_1_n_0 ;
  wire \regfile[12][15]_i_1_n_0 ;
  wire \regfile[12][23]_i_1_n_0 ;
  wire \regfile[12][31]_i_1_n_0 ;
  wire \regfile[12][7]_i_1_n_0 ;
  wire \regfile[13][15]_i_1_n_0 ;
  wire \regfile[13][23]_i_1_n_0 ;
  wire \regfile[13][31]_i_1_n_0 ;
  wire \regfile[13][7]_i_1_n_0 ;
  wire \regfile[14][15]_i_1_n_0 ;
  wire \regfile[14][23]_i_1_n_0 ;
  wire \regfile[14][31]_i_1_n_0 ;
  wire \regfile[14][7]_i_1_n_0 ;
  wire \regfile[15][15]_i_1_n_0 ;
  wire \regfile[15][23]_i_1_n_0 ;
  wire \regfile[15][31]_i_1_n_0 ;
  wire \regfile[15][7]_i_1_n_0 ;
  wire \regfile[1][15]_i_1_n_0 ;
  wire \regfile[1][23]_i_1_n_0 ;
  wire \regfile[1][31]_i_1_n_0 ;
  wire \regfile[1][7]_i_1_n_0 ;
  wire \regfile[2][15]_i_1_n_0 ;
  wire \regfile[2][23]_i_1_n_0 ;
  wire \regfile[2][31]_i_1_n_0 ;
  wire \regfile[2][7]_i_1_n_0 ;
  wire \regfile[3][15]_i_1_n_0 ;
  wire \regfile[3][23]_i_1_n_0 ;
  wire \regfile[3][31]_i_1_n_0 ;
  wire \regfile[3][7]_i_1_n_0 ;
  wire \regfile[4][15]_i_1_n_0 ;
  wire \regfile[4][23]_i_1_n_0 ;
  wire \regfile[4][31]_i_1_n_0 ;
  wire \regfile[4][7]_i_1_n_0 ;
  wire \regfile[5][15]_i_1_n_0 ;
  wire \regfile[5][23]_i_1_n_0 ;
  wire \regfile[5][31]_i_1_n_0 ;
  wire \regfile[5][7]_i_1_n_0 ;
  wire \regfile[6][15]_i_1_n_0 ;
  wire \regfile[6][23]_i_1_n_0 ;
  wire \regfile[6][31]_i_1_n_0 ;
  wire \regfile[6][7]_i_1_n_0 ;
  wire \regfile[7][15]_i_1_n_0 ;
  wire \regfile[7][23]_i_1_n_0 ;
  wire \regfile[7][31]_i_1_n_0 ;
  wire \regfile[7][7]_i_1_n_0 ;
  wire \regfile[8][15]_i_1_n_0 ;
  wire \regfile[8][23]_i_1_n_0 ;
  wire \regfile[8][31]_i_1_n_0 ;
  wire \regfile[8][7]_i_1_n_0 ;
  wire \regfile[9][15]_i_1_n_0 ;
  wire \regfile[9][23]_i_1_n_0 ;
  wire \regfile[9][31]_i_1_n_0 ;
  wire \regfile[9][7]_i_1_n_0 ;
  wire [5:5]\regfile_reg[0]__0 ;
  wire [7:7]\regfile_reg[10]__2 ;
  wire [7:7]\regfile_reg[11]__1 ;
  wire [7:7]\regfile_reg[12]__1 ;
  wire [7:7]\regfile_reg[13]__1 ;
  wire [7:7]\regfile_reg[14]__2 ;
  wire [7:7]\regfile_reg[15]__0 ;
  wire [7:7]\regfile_reg[1]__1 ;
  wire [7:7]\regfile_reg[2]__1 ;
  wire [7:7]\regfile_reg[3]__1 ;
  wire [7:7]\regfile_reg[4]__2 ;
  wire [7:7]\regfile_reg[5]__2 ;
  wire [7:7]\regfile_reg[6]__2 ;
  wire [7:7]\regfile_reg[7]__1 ;
  wire [7:7]\regfile_reg[8]__2 ;
  wire [7:7]\regfile_reg[9]__1 ;
  wire \regfile_reg_n_0_[0][0] ;
  wire \regfile_reg_n_0_[0][10] ;
  wire \regfile_reg_n_0_[0][11] ;
  wire \regfile_reg_n_0_[0][12] ;
  wire \regfile_reg_n_0_[0][13] ;
  wire \regfile_reg_n_0_[0][14] ;
  wire \regfile_reg_n_0_[0][15] ;
  wire \regfile_reg_n_0_[0][16] ;
  wire \regfile_reg_n_0_[0][17] ;
  wire \regfile_reg_n_0_[0][18] ;
  wire \regfile_reg_n_0_[0][19] ;
  wire \regfile_reg_n_0_[0][1] ;
  wire \regfile_reg_n_0_[0][20] ;
  wire \regfile_reg_n_0_[0][21] ;
  wire \regfile_reg_n_0_[0][22] ;
  wire \regfile_reg_n_0_[0][23] ;
  wire \regfile_reg_n_0_[0][24] ;
  wire \regfile_reg_n_0_[0][25] ;
  wire \regfile_reg_n_0_[0][26] ;
  wire \regfile_reg_n_0_[0][27] ;
  wire \regfile_reg_n_0_[0][28] ;
  wire \regfile_reg_n_0_[0][29] ;
  wire \regfile_reg_n_0_[0][2] ;
  wire \regfile_reg_n_0_[0][30] ;
  wire \regfile_reg_n_0_[0][31] ;
  wire \regfile_reg_n_0_[0][4] ;
  wire \regfile_reg_n_0_[0][5] ;
  wire \regfile_reg_n_0_[0][6] ;
  wire \regfile_reg_n_0_[0][7] ;
  wire \regfile_reg_n_0_[0][8] ;
  wire \regfile_reg_n_0_[0][9] ;
  wire \regfile_reg_n_0_[10][0] ;
  wire \regfile_reg_n_0_[10][10] ;
  wire \regfile_reg_n_0_[10][11] ;
  wire \regfile_reg_n_0_[10][12] ;
  wire \regfile_reg_n_0_[10][13] ;
  wire \regfile_reg_n_0_[10][14] ;
  wire \regfile_reg_n_0_[10][15] ;
  wire \regfile_reg_n_0_[10][16] ;
  wire \regfile_reg_n_0_[10][17] ;
  wire \regfile_reg_n_0_[10][18] ;
  wire \regfile_reg_n_0_[10][19] ;
  wire \regfile_reg_n_0_[10][1] ;
  wire \regfile_reg_n_0_[10][20] ;
  wire \regfile_reg_n_0_[10][21] ;
  wire \regfile_reg_n_0_[10][22] ;
  wire \regfile_reg_n_0_[10][23] ;
  wire \regfile_reg_n_0_[10][24] ;
  wire \regfile_reg_n_0_[10][25] ;
  wire \regfile_reg_n_0_[10][26] ;
  wire \regfile_reg_n_0_[10][27] ;
  wire \regfile_reg_n_0_[10][28] ;
  wire \regfile_reg_n_0_[10][29] ;
  wire \regfile_reg_n_0_[10][2] ;
  wire \regfile_reg_n_0_[10][30] ;
  wire \regfile_reg_n_0_[10][31] ;
  wire \regfile_reg_n_0_[10][3] ;
  wire \regfile_reg_n_0_[10][4] ;
  wire \regfile_reg_n_0_[10][5] ;
  wire \regfile_reg_n_0_[10][6] ;
  wire \regfile_reg_n_0_[10][7] ;
  wire \regfile_reg_n_0_[10][8] ;
  wire \regfile_reg_n_0_[10][9] ;
  wire \regfile_reg_n_0_[11][0] ;
  wire \regfile_reg_n_0_[11][10] ;
  wire \regfile_reg_n_0_[11][11] ;
  wire \regfile_reg_n_0_[11][12] ;
  wire \regfile_reg_n_0_[11][13] ;
  wire \regfile_reg_n_0_[11][14] ;
  wire \regfile_reg_n_0_[11][15] ;
  wire \regfile_reg_n_0_[11][16] ;
  wire \regfile_reg_n_0_[11][17] ;
  wire \regfile_reg_n_0_[11][18] ;
  wire \regfile_reg_n_0_[11][19] ;
  wire \regfile_reg_n_0_[11][1] ;
  wire \regfile_reg_n_0_[11][20] ;
  wire \regfile_reg_n_0_[11][21] ;
  wire \regfile_reg_n_0_[11][22] ;
  wire \regfile_reg_n_0_[11][23] ;
  wire \regfile_reg_n_0_[11][24] ;
  wire \regfile_reg_n_0_[11][25] ;
  wire \regfile_reg_n_0_[11][26] ;
  wire \regfile_reg_n_0_[11][27] ;
  wire \regfile_reg_n_0_[11][28] ;
  wire \regfile_reg_n_0_[11][29] ;
  wire \regfile_reg_n_0_[11][2] ;
  wire \regfile_reg_n_0_[11][30] ;
  wire \regfile_reg_n_0_[11][31] ;
  wire \regfile_reg_n_0_[11][3] ;
  wire \regfile_reg_n_0_[11][4] ;
  wire \regfile_reg_n_0_[11][5] ;
  wire \regfile_reg_n_0_[11][6] ;
  wire \regfile_reg_n_0_[11][7] ;
  wire \regfile_reg_n_0_[11][8] ;
  wire \regfile_reg_n_0_[11][9] ;
  wire \regfile_reg_n_0_[12][0] ;
  wire \regfile_reg_n_0_[12][10] ;
  wire \regfile_reg_n_0_[12][11] ;
  wire \regfile_reg_n_0_[12][12] ;
  wire \regfile_reg_n_0_[12][13] ;
  wire \regfile_reg_n_0_[12][14] ;
  wire \regfile_reg_n_0_[12][15] ;
  wire \regfile_reg_n_0_[12][16] ;
  wire \regfile_reg_n_0_[12][17] ;
  wire \regfile_reg_n_0_[12][18] ;
  wire \regfile_reg_n_0_[12][19] ;
  wire \regfile_reg_n_0_[12][1] ;
  wire \regfile_reg_n_0_[12][20] ;
  wire \regfile_reg_n_0_[12][21] ;
  wire \regfile_reg_n_0_[12][22] ;
  wire \regfile_reg_n_0_[12][23] ;
  wire \regfile_reg_n_0_[12][24] ;
  wire \regfile_reg_n_0_[12][25] ;
  wire \regfile_reg_n_0_[12][26] ;
  wire \regfile_reg_n_0_[12][27] ;
  wire \regfile_reg_n_0_[12][28] ;
  wire \regfile_reg_n_0_[12][29] ;
  wire \regfile_reg_n_0_[12][2] ;
  wire \regfile_reg_n_0_[12][30] ;
  wire \regfile_reg_n_0_[12][31] ;
  wire \regfile_reg_n_0_[12][3] ;
  wire \regfile_reg_n_0_[12][4] ;
  wire \regfile_reg_n_0_[12][5] ;
  wire \regfile_reg_n_0_[12][6] ;
  wire \regfile_reg_n_0_[12][7] ;
  wire \regfile_reg_n_0_[12][8] ;
  wire \regfile_reg_n_0_[12][9] ;
  wire \regfile_reg_n_0_[13][0] ;
  wire \regfile_reg_n_0_[13][10] ;
  wire \regfile_reg_n_0_[13][11] ;
  wire \regfile_reg_n_0_[13][12] ;
  wire \regfile_reg_n_0_[13][13] ;
  wire \regfile_reg_n_0_[13][14] ;
  wire \regfile_reg_n_0_[13][15] ;
  wire \regfile_reg_n_0_[13][16] ;
  wire \regfile_reg_n_0_[13][17] ;
  wire \regfile_reg_n_0_[13][18] ;
  wire \regfile_reg_n_0_[13][19] ;
  wire \regfile_reg_n_0_[13][1] ;
  wire \regfile_reg_n_0_[13][20] ;
  wire \regfile_reg_n_0_[13][21] ;
  wire \regfile_reg_n_0_[13][22] ;
  wire \regfile_reg_n_0_[13][23] ;
  wire \regfile_reg_n_0_[13][24] ;
  wire \regfile_reg_n_0_[13][25] ;
  wire \regfile_reg_n_0_[13][26] ;
  wire \regfile_reg_n_0_[13][27] ;
  wire \regfile_reg_n_0_[13][28] ;
  wire \regfile_reg_n_0_[13][29] ;
  wire \regfile_reg_n_0_[13][2] ;
  wire \regfile_reg_n_0_[13][30] ;
  wire \regfile_reg_n_0_[13][31] ;
  wire \regfile_reg_n_0_[13][3] ;
  wire \regfile_reg_n_0_[13][4] ;
  wire \regfile_reg_n_0_[13][5] ;
  wire \regfile_reg_n_0_[13][6] ;
  wire \regfile_reg_n_0_[13][7] ;
  wire \regfile_reg_n_0_[13][8] ;
  wire \regfile_reg_n_0_[13][9] ;
  wire \regfile_reg_n_0_[14][0] ;
  wire \regfile_reg_n_0_[14][10] ;
  wire \regfile_reg_n_0_[14][11] ;
  wire \regfile_reg_n_0_[14][12] ;
  wire \regfile_reg_n_0_[14][13] ;
  wire \regfile_reg_n_0_[14][14] ;
  wire \regfile_reg_n_0_[14][15] ;
  wire \regfile_reg_n_0_[14][16] ;
  wire \regfile_reg_n_0_[14][17] ;
  wire \regfile_reg_n_0_[14][18] ;
  wire \regfile_reg_n_0_[14][19] ;
  wire \regfile_reg_n_0_[14][1] ;
  wire \regfile_reg_n_0_[14][20] ;
  wire \regfile_reg_n_0_[14][21] ;
  wire \regfile_reg_n_0_[14][22] ;
  wire \regfile_reg_n_0_[14][23] ;
  wire \regfile_reg_n_0_[14][24] ;
  wire \regfile_reg_n_0_[14][25] ;
  wire \regfile_reg_n_0_[14][26] ;
  wire \regfile_reg_n_0_[14][27] ;
  wire \regfile_reg_n_0_[14][28] ;
  wire \regfile_reg_n_0_[14][29] ;
  wire \regfile_reg_n_0_[14][2] ;
  wire \regfile_reg_n_0_[14][30] ;
  wire \regfile_reg_n_0_[14][31] ;
  wire \regfile_reg_n_0_[14][3] ;
  wire \regfile_reg_n_0_[14][4] ;
  wire \regfile_reg_n_0_[14][5] ;
  wire \regfile_reg_n_0_[14][6] ;
  wire \regfile_reg_n_0_[14][7] ;
  wire \regfile_reg_n_0_[14][8] ;
  wire \regfile_reg_n_0_[14][9] ;
  wire \regfile_reg_n_0_[15][0] ;
  wire \regfile_reg_n_0_[15][10] ;
  wire \regfile_reg_n_0_[15][11] ;
  wire \regfile_reg_n_0_[15][12] ;
  wire \regfile_reg_n_0_[15][13] ;
  wire \regfile_reg_n_0_[15][14] ;
  wire \regfile_reg_n_0_[15][15] ;
  wire \regfile_reg_n_0_[15][16] ;
  wire \regfile_reg_n_0_[15][17] ;
  wire \regfile_reg_n_0_[15][18] ;
  wire \regfile_reg_n_0_[15][19] ;
  wire \regfile_reg_n_0_[15][1] ;
  wire \regfile_reg_n_0_[15][20] ;
  wire \regfile_reg_n_0_[15][21] ;
  wire \regfile_reg_n_0_[15][22] ;
  wire \regfile_reg_n_0_[15][23] ;
  wire \regfile_reg_n_0_[15][24] ;
  wire \regfile_reg_n_0_[15][25] ;
  wire \regfile_reg_n_0_[15][26] ;
  wire \regfile_reg_n_0_[15][27] ;
  wire \regfile_reg_n_0_[15][28] ;
  wire \regfile_reg_n_0_[15][29] ;
  wire \regfile_reg_n_0_[15][2] ;
  wire \regfile_reg_n_0_[15][30] ;
  wire \regfile_reg_n_0_[15][31] ;
  wire \regfile_reg_n_0_[15][3] ;
  wire \regfile_reg_n_0_[15][4] ;
  wire \regfile_reg_n_0_[15][5] ;
  wire \regfile_reg_n_0_[15][6] ;
  wire \regfile_reg_n_0_[15][7] ;
  wire \regfile_reg_n_0_[15][8] ;
  wire \regfile_reg_n_0_[15][9] ;
  wire \regfile_reg_n_0_[1][0] ;
  wire \regfile_reg_n_0_[1][10] ;
  wire \regfile_reg_n_0_[1][11] ;
  wire \regfile_reg_n_0_[1][12] ;
  wire \regfile_reg_n_0_[1][13] ;
  wire \regfile_reg_n_0_[1][14] ;
  wire \regfile_reg_n_0_[1][15] ;
  wire \regfile_reg_n_0_[1][16] ;
  wire \regfile_reg_n_0_[1][17] ;
  wire \regfile_reg_n_0_[1][18] ;
  wire \regfile_reg_n_0_[1][19] ;
  wire \regfile_reg_n_0_[1][1] ;
  wire \regfile_reg_n_0_[1][20] ;
  wire \regfile_reg_n_0_[1][21] ;
  wire \regfile_reg_n_0_[1][22] ;
  wire \regfile_reg_n_0_[1][23] ;
  wire \regfile_reg_n_0_[1][24] ;
  wire \regfile_reg_n_0_[1][25] ;
  wire \regfile_reg_n_0_[1][26] ;
  wire \regfile_reg_n_0_[1][27] ;
  wire \regfile_reg_n_0_[1][28] ;
  wire \regfile_reg_n_0_[1][29] ;
  wire \regfile_reg_n_0_[1][2] ;
  wire \regfile_reg_n_0_[1][30] ;
  wire \regfile_reg_n_0_[1][31] ;
  wire \regfile_reg_n_0_[1][3] ;
  wire \regfile_reg_n_0_[1][4] ;
  wire \regfile_reg_n_0_[1][5] ;
  wire \regfile_reg_n_0_[1][6] ;
  wire \regfile_reg_n_0_[1][7] ;
  wire \regfile_reg_n_0_[1][8] ;
  wire \regfile_reg_n_0_[1][9] ;
  wire \regfile_reg_n_0_[2][0] ;
  wire \regfile_reg_n_0_[2][10] ;
  wire \regfile_reg_n_0_[2][11] ;
  wire \regfile_reg_n_0_[2][12] ;
  wire \regfile_reg_n_0_[2][13] ;
  wire \regfile_reg_n_0_[2][14] ;
  wire \regfile_reg_n_0_[2][15] ;
  wire \regfile_reg_n_0_[2][16] ;
  wire \regfile_reg_n_0_[2][17] ;
  wire \regfile_reg_n_0_[2][18] ;
  wire \regfile_reg_n_0_[2][19] ;
  wire \regfile_reg_n_0_[2][1] ;
  wire \regfile_reg_n_0_[2][20] ;
  wire \regfile_reg_n_0_[2][21] ;
  wire \regfile_reg_n_0_[2][22] ;
  wire \regfile_reg_n_0_[2][23] ;
  wire \regfile_reg_n_0_[2][24] ;
  wire \regfile_reg_n_0_[2][25] ;
  wire \regfile_reg_n_0_[2][26] ;
  wire \regfile_reg_n_0_[2][27] ;
  wire \regfile_reg_n_0_[2][28] ;
  wire \regfile_reg_n_0_[2][29] ;
  wire \regfile_reg_n_0_[2][2] ;
  wire \regfile_reg_n_0_[2][30] ;
  wire \regfile_reg_n_0_[2][31] ;
  wire \regfile_reg_n_0_[2][3] ;
  wire \regfile_reg_n_0_[2][4] ;
  wire \regfile_reg_n_0_[2][5] ;
  wire \regfile_reg_n_0_[2][6] ;
  wire \regfile_reg_n_0_[2][7] ;
  wire \regfile_reg_n_0_[2][8] ;
  wire \regfile_reg_n_0_[2][9] ;
  wire \regfile_reg_n_0_[3][0] ;
  wire \regfile_reg_n_0_[3][10] ;
  wire \regfile_reg_n_0_[3][11] ;
  wire \regfile_reg_n_0_[3][12] ;
  wire \regfile_reg_n_0_[3][13] ;
  wire \regfile_reg_n_0_[3][14] ;
  wire \regfile_reg_n_0_[3][15] ;
  wire \regfile_reg_n_0_[3][16] ;
  wire \regfile_reg_n_0_[3][17] ;
  wire \regfile_reg_n_0_[3][18] ;
  wire \regfile_reg_n_0_[3][19] ;
  wire \regfile_reg_n_0_[3][1] ;
  wire \regfile_reg_n_0_[3][20] ;
  wire \regfile_reg_n_0_[3][21] ;
  wire \regfile_reg_n_0_[3][22] ;
  wire \regfile_reg_n_0_[3][23] ;
  wire \regfile_reg_n_0_[3][24] ;
  wire \regfile_reg_n_0_[3][25] ;
  wire \regfile_reg_n_0_[3][26] ;
  wire \regfile_reg_n_0_[3][27] ;
  wire \regfile_reg_n_0_[3][28] ;
  wire \regfile_reg_n_0_[3][29] ;
  wire \regfile_reg_n_0_[3][2] ;
  wire \regfile_reg_n_0_[3][30] ;
  wire \regfile_reg_n_0_[3][31] ;
  wire \regfile_reg_n_0_[3][3] ;
  wire \regfile_reg_n_0_[3][4] ;
  wire \regfile_reg_n_0_[3][5] ;
  wire \regfile_reg_n_0_[3][6] ;
  wire \regfile_reg_n_0_[3][7] ;
  wire \regfile_reg_n_0_[3][8] ;
  wire \regfile_reg_n_0_[3][9] ;
  wire \regfile_reg_n_0_[4][0] ;
  wire \regfile_reg_n_0_[4][10] ;
  wire \regfile_reg_n_0_[4][11] ;
  wire \regfile_reg_n_0_[4][12] ;
  wire \regfile_reg_n_0_[4][13] ;
  wire \regfile_reg_n_0_[4][14] ;
  wire \regfile_reg_n_0_[4][15] ;
  wire \regfile_reg_n_0_[4][16] ;
  wire \regfile_reg_n_0_[4][17] ;
  wire \regfile_reg_n_0_[4][18] ;
  wire \regfile_reg_n_0_[4][19] ;
  wire \regfile_reg_n_0_[4][1] ;
  wire \regfile_reg_n_0_[4][20] ;
  wire \regfile_reg_n_0_[4][21] ;
  wire \regfile_reg_n_0_[4][22] ;
  wire \regfile_reg_n_0_[4][23] ;
  wire \regfile_reg_n_0_[4][24] ;
  wire \regfile_reg_n_0_[4][25] ;
  wire \regfile_reg_n_0_[4][26] ;
  wire \regfile_reg_n_0_[4][27] ;
  wire \regfile_reg_n_0_[4][28] ;
  wire \regfile_reg_n_0_[4][29] ;
  wire \regfile_reg_n_0_[4][2] ;
  wire \regfile_reg_n_0_[4][30] ;
  wire \regfile_reg_n_0_[4][31] ;
  wire \regfile_reg_n_0_[4][3] ;
  wire \regfile_reg_n_0_[4][4] ;
  wire \regfile_reg_n_0_[4][5] ;
  wire \regfile_reg_n_0_[4][6] ;
  wire \regfile_reg_n_0_[4][7] ;
  wire \regfile_reg_n_0_[4][8] ;
  wire \regfile_reg_n_0_[4][9] ;
  wire \regfile_reg_n_0_[5][0] ;
  wire \regfile_reg_n_0_[5][10] ;
  wire \regfile_reg_n_0_[5][11] ;
  wire \regfile_reg_n_0_[5][12] ;
  wire \regfile_reg_n_0_[5][13] ;
  wire \regfile_reg_n_0_[5][14] ;
  wire \regfile_reg_n_0_[5][15] ;
  wire \regfile_reg_n_0_[5][16] ;
  wire \regfile_reg_n_0_[5][17] ;
  wire \regfile_reg_n_0_[5][18] ;
  wire \regfile_reg_n_0_[5][19] ;
  wire \regfile_reg_n_0_[5][1] ;
  wire \regfile_reg_n_0_[5][20] ;
  wire \regfile_reg_n_0_[5][21] ;
  wire \regfile_reg_n_0_[5][22] ;
  wire \regfile_reg_n_0_[5][23] ;
  wire \regfile_reg_n_0_[5][24] ;
  wire \regfile_reg_n_0_[5][25] ;
  wire \regfile_reg_n_0_[5][26] ;
  wire \regfile_reg_n_0_[5][27] ;
  wire \regfile_reg_n_0_[5][28] ;
  wire \regfile_reg_n_0_[5][29] ;
  wire \regfile_reg_n_0_[5][2] ;
  wire \regfile_reg_n_0_[5][30] ;
  wire \regfile_reg_n_0_[5][31] ;
  wire \regfile_reg_n_0_[5][3] ;
  wire \regfile_reg_n_0_[5][4] ;
  wire \regfile_reg_n_0_[5][5] ;
  wire \regfile_reg_n_0_[5][6] ;
  wire \regfile_reg_n_0_[5][7] ;
  wire \regfile_reg_n_0_[5][8] ;
  wire \regfile_reg_n_0_[5][9] ;
  wire \regfile_reg_n_0_[6][0] ;
  wire \regfile_reg_n_0_[6][10] ;
  wire \regfile_reg_n_0_[6][11] ;
  wire \regfile_reg_n_0_[6][12] ;
  wire \regfile_reg_n_0_[6][13] ;
  wire \regfile_reg_n_0_[6][14] ;
  wire \regfile_reg_n_0_[6][15] ;
  wire \regfile_reg_n_0_[6][16] ;
  wire \regfile_reg_n_0_[6][17] ;
  wire \regfile_reg_n_0_[6][18] ;
  wire \regfile_reg_n_0_[6][19] ;
  wire \regfile_reg_n_0_[6][1] ;
  wire \regfile_reg_n_0_[6][20] ;
  wire \regfile_reg_n_0_[6][21] ;
  wire \regfile_reg_n_0_[6][22] ;
  wire \regfile_reg_n_0_[6][23] ;
  wire \regfile_reg_n_0_[6][24] ;
  wire \regfile_reg_n_0_[6][25] ;
  wire \regfile_reg_n_0_[6][26] ;
  wire \regfile_reg_n_0_[6][27] ;
  wire \regfile_reg_n_0_[6][28] ;
  wire \regfile_reg_n_0_[6][29] ;
  wire \regfile_reg_n_0_[6][2] ;
  wire \regfile_reg_n_0_[6][30] ;
  wire \regfile_reg_n_0_[6][31] ;
  wire \regfile_reg_n_0_[6][3] ;
  wire \regfile_reg_n_0_[6][4] ;
  wire \regfile_reg_n_0_[6][5] ;
  wire \regfile_reg_n_0_[6][6] ;
  wire \regfile_reg_n_0_[6][7] ;
  wire \regfile_reg_n_0_[6][8] ;
  wire \regfile_reg_n_0_[6][9] ;
  wire \regfile_reg_n_0_[7][0] ;
  wire \regfile_reg_n_0_[7][10] ;
  wire \regfile_reg_n_0_[7][11] ;
  wire \regfile_reg_n_0_[7][12] ;
  wire \regfile_reg_n_0_[7][13] ;
  wire \regfile_reg_n_0_[7][14] ;
  wire \regfile_reg_n_0_[7][15] ;
  wire \regfile_reg_n_0_[7][16] ;
  wire \regfile_reg_n_0_[7][17] ;
  wire \regfile_reg_n_0_[7][18] ;
  wire \regfile_reg_n_0_[7][19] ;
  wire \regfile_reg_n_0_[7][1] ;
  wire \regfile_reg_n_0_[7][20] ;
  wire \regfile_reg_n_0_[7][21] ;
  wire \regfile_reg_n_0_[7][22] ;
  wire \regfile_reg_n_0_[7][23] ;
  wire \regfile_reg_n_0_[7][24] ;
  wire \regfile_reg_n_0_[7][25] ;
  wire \regfile_reg_n_0_[7][26] ;
  wire \regfile_reg_n_0_[7][27] ;
  wire \regfile_reg_n_0_[7][28] ;
  wire \regfile_reg_n_0_[7][29] ;
  wire \regfile_reg_n_0_[7][2] ;
  wire \regfile_reg_n_0_[7][30] ;
  wire \regfile_reg_n_0_[7][31] ;
  wire \regfile_reg_n_0_[7][3] ;
  wire \regfile_reg_n_0_[7][4] ;
  wire \regfile_reg_n_0_[7][5] ;
  wire \regfile_reg_n_0_[7][6] ;
  wire \regfile_reg_n_0_[7][7] ;
  wire \regfile_reg_n_0_[7][8] ;
  wire \regfile_reg_n_0_[7][9] ;
  wire \regfile_reg_n_0_[8][0] ;
  wire \regfile_reg_n_0_[8][10] ;
  wire \regfile_reg_n_0_[8][11] ;
  wire \regfile_reg_n_0_[8][12] ;
  wire \regfile_reg_n_0_[8][13] ;
  wire \regfile_reg_n_0_[8][14] ;
  wire \regfile_reg_n_0_[8][15] ;
  wire \regfile_reg_n_0_[8][16] ;
  wire \regfile_reg_n_0_[8][17] ;
  wire \regfile_reg_n_0_[8][18] ;
  wire \regfile_reg_n_0_[8][19] ;
  wire \regfile_reg_n_0_[8][1] ;
  wire \regfile_reg_n_0_[8][20] ;
  wire \regfile_reg_n_0_[8][21] ;
  wire \regfile_reg_n_0_[8][22] ;
  wire \regfile_reg_n_0_[8][23] ;
  wire \regfile_reg_n_0_[8][24] ;
  wire \regfile_reg_n_0_[8][25] ;
  wire \regfile_reg_n_0_[8][26] ;
  wire \regfile_reg_n_0_[8][27] ;
  wire \regfile_reg_n_0_[8][28] ;
  wire \regfile_reg_n_0_[8][29] ;
  wire \regfile_reg_n_0_[8][2] ;
  wire \regfile_reg_n_0_[8][30] ;
  wire \regfile_reg_n_0_[8][31] ;
  wire \regfile_reg_n_0_[8][3] ;
  wire \regfile_reg_n_0_[8][4] ;
  wire \regfile_reg_n_0_[8][5] ;
  wire \regfile_reg_n_0_[8][6] ;
  wire \regfile_reg_n_0_[8][7] ;
  wire \regfile_reg_n_0_[8][8] ;
  wire \regfile_reg_n_0_[8][9] ;
  wire \regfile_reg_n_0_[9][0] ;
  wire \regfile_reg_n_0_[9][10] ;
  wire \regfile_reg_n_0_[9][11] ;
  wire \regfile_reg_n_0_[9][12] ;
  wire \regfile_reg_n_0_[9][13] ;
  wire \regfile_reg_n_0_[9][14] ;
  wire \regfile_reg_n_0_[9][15] ;
  wire \regfile_reg_n_0_[9][16] ;
  wire \regfile_reg_n_0_[9][17] ;
  wire \regfile_reg_n_0_[9][18] ;
  wire \regfile_reg_n_0_[9][19] ;
  wire \regfile_reg_n_0_[9][1] ;
  wire \regfile_reg_n_0_[9][20] ;
  wire \regfile_reg_n_0_[9][21] ;
  wire \regfile_reg_n_0_[9][22] ;
  wire \regfile_reg_n_0_[9][23] ;
  wire \regfile_reg_n_0_[9][24] ;
  wire \regfile_reg_n_0_[9][25] ;
  wire \regfile_reg_n_0_[9][26] ;
  wire \regfile_reg_n_0_[9][27] ;
  wire \regfile_reg_n_0_[9][28] ;
  wire \regfile_reg_n_0_[9][29] ;
  wire \regfile_reg_n_0_[9][2] ;
  wire \regfile_reg_n_0_[9][30] ;
  wire \regfile_reg_n_0_[9][31] ;
  wire \regfile_reg_n_0_[9][3] ;
  wire \regfile_reg_n_0_[9][4] ;
  wire \regfile_reg_n_0_[9][5] ;
  wire \regfile_reg_n_0_[9][6] ;
  wire \regfile_reg_n_0_[9][7] ;
  wire \regfile_reg_n_0_[9][8] ;
  wire \regfile_reg_n_0_[9][9] ;
  wire rvalid_i_1_n_0;
  wire rvalid_reg_0;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arready_i_1_n_0;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire [31:0]s00_axi_rdata;
  wire \s00_axi_rdata[0]_i_4_n_0 ;
  wire \s00_axi_rdata[0]_i_5_n_0 ;
  wire \s00_axi_rdata[0]_i_6_n_0 ;
  wire \s00_axi_rdata[0]_i_7_n_0 ;
  wire \s00_axi_rdata[10]_i_4_n_0 ;
  wire \s00_axi_rdata[10]_i_5_n_0 ;
  wire \s00_axi_rdata[10]_i_6_n_0 ;
  wire \s00_axi_rdata[10]_i_7_n_0 ;
  wire \s00_axi_rdata[11]_i_4_n_0 ;
  wire \s00_axi_rdata[11]_i_5_n_0 ;
  wire \s00_axi_rdata[11]_i_6_n_0 ;
  wire \s00_axi_rdata[11]_i_7_n_0 ;
  wire \s00_axi_rdata[12]_i_2_n_0 ;
  wire \s00_axi_rdata[12]_i_3_n_0 ;
  wire \s00_axi_rdata[12]_i_6_n_0 ;
  wire \s00_axi_rdata[12]_i_7_n_0 ;
  wire \s00_axi_rdata[12]_i_8_n_0 ;
  wire \s00_axi_rdata[12]_i_9_n_0 ;
  wire \s00_axi_rdata[13]_i_1_n_0 ;
  wire \s00_axi_rdata[13]_i_4_n_0 ;
  wire \s00_axi_rdata[13]_i_5_n_0 ;
  wire \s00_axi_rdata[13]_i_6_n_0 ;
  wire \s00_axi_rdata[13]_i_7_n_0 ;
  wire \s00_axi_rdata[14]_i_1_n_0 ;
  wire \s00_axi_rdata[14]_i_4_n_0 ;
  wire \s00_axi_rdata[14]_i_5_n_0 ;
  wire \s00_axi_rdata[14]_i_6_n_0 ;
  wire \s00_axi_rdata[14]_i_7_n_0 ;
  wire \s00_axi_rdata[15]_i_1_n_0 ;
  wire \s00_axi_rdata[15]_i_4_n_0 ;
  wire \s00_axi_rdata[15]_i_5_n_0 ;
  wire \s00_axi_rdata[15]_i_6_n_0 ;
  wire \s00_axi_rdata[15]_i_7_n_0 ;
  wire \s00_axi_rdata[16]_i_1_n_0 ;
  wire \s00_axi_rdata[16]_i_4_n_0 ;
  wire \s00_axi_rdata[16]_i_5_n_0 ;
  wire \s00_axi_rdata[16]_i_6_n_0 ;
  wire \s00_axi_rdata[16]_i_7_n_0 ;
  wire \s00_axi_rdata[17]_i_1_n_0 ;
  wire \s00_axi_rdata[17]_i_4_n_0 ;
  wire \s00_axi_rdata[17]_i_5_n_0 ;
  wire \s00_axi_rdata[17]_i_6_n_0 ;
  wire \s00_axi_rdata[17]_i_7_n_0 ;
  wire \s00_axi_rdata[18]_i_1_n_0 ;
  wire \s00_axi_rdata[18]_i_4_n_0 ;
  wire \s00_axi_rdata[18]_i_5_n_0 ;
  wire \s00_axi_rdata[18]_i_6_n_0 ;
  wire \s00_axi_rdata[18]_i_7_n_0 ;
  wire \s00_axi_rdata[19]_i_1_n_0 ;
  wire \s00_axi_rdata[19]_i_4_n_0 ;
  wire \s00_axi_rdata[19]_i_5_n_0 ;
  wire \s00_axi_rdata[19]_i_6_n_0 ;
  wire \s00_axi_rdata[19]_i_7_n_0 ;
  wire \s00_axi_rdata[1]_i_4_n_0 ;
  wire \s00_axi_rdata[1]_i_5_n_0 ;
  wire \s00_axi_rdata[1]_i_6_n_0 ;
  wire \s00_axi_rdata[1]_i_7_n_0 ;
  wire \s00_axi_rdata[20]_i_1_n_0 ;
  wire \s00_axi_rdata[20]_i_4_n_0 ;
  wire \s00_axi_rdata[20]_i_5_n_0 ;
  wire \s00_axi_rdata[20]_i_6_n_0 ;
  wire \s00_axi_rdata[20]_i_7_n_0 ;
  wire \s00_axi_rdata[21]_i_1_n_0 ;
  wire \s00_axi_rdata[21]_i_4_n_0 ;
  wire \s00_axi_rdata[21]_i_5_n_0 ;
  wire \s00_axi_rdata[21]_i_6_n_0 ;
  wire \s00_axi_rdata[21]_i_7_n_0 ;
  wire \s00_axi_rdata[22]_i_1_n_0 ;
  wire \s00_axi_rdata[22]_i_4_n_0 ;
  wire \s00_axi_rdata[22]_i_5_n_0 ;
  wire \s00_axi_rdata[22]_i_6_n_0 ;
  wire \s00_axi_rdata[22]_i_7_n_0 ;
  wire \s00_axi_rdata[23]_i_1_n_0 ;
  wire \s00_axi_rdata[23]_i_4_n_0 ;
  wire \s00_axi_rdata[23]_i_5_n_0 ;
  wire \s00_axi_rdata[23]_i_6_n_0 ;
  wire \s00_axi_rdata[23]_i_7_n_0 ;
  wire \s00_axi_rdata[24]_i_1_n_0 ;
  wire \s00_axi_rdata[24]_i_4_n_0 ;
  wire \s00_axi_rdata[24]_i_5_n_0 ;
  wire \s00_axi_rdata[24]_i_6_n_0 ;
  wire \s00_axi_rdata[24]_i_7_n_0 ;
  wire \s00_axi_rdata[25]_i_1_n_0 ;
  wire \s00_axi_rdata[25]_i_4_n_0 ;
  wire \s00_axi_rdata[25]_i_5_n_0 ;
  wire \s00_axi_rdata[25]_i_6_n_0 ;
  wire \s00_axi_rdata[25]_i_7_n_0 ;
  wire \s00_axi_rdata[26]_i_1_n_0 ;
  wire \s00_axi_rdata[26]_i_4_n_0 ;
  wire \s00_axi_rdata[26]_i_5_n_0 ;
  wire \s00_axi_rdata[26]_i_6_n_0 ;
  wire \s00_axi_rdata[26]_i_7_n_0 ;
  wire \s00_axi_rdata[27]_i_1_n_0 ;
  wire \s00_axi_rdata[27]_i_4_n_0 ;
  wire \s00_axi_rdata[27]_i_5_n_0 ;
  wire \s00_axi_rdata[27]_i_6_n_0 ;
  wire \s00_axi_rdata[27]_i_7_n_0 ;
  wire \s00_axi_rdata[28]_i_1_n_0 ;
  wire \s00_axi_rdata[28]_i_4_n_0 ;
  wire \s00_axi_rdata[28]_i_5_n_0 ;
  wire \s00_axi_rdata[28]_i_6_n_0 ;
  wire \s00_axi_rdata[28]_i_7_n_0 ;
  wire \s00_axi_rdata[29]_i_1_n_0 ;
  wire \s00_axi_rdata[29]_i_4_n_0 ;
  wire \s00_axi_rdata[29]_i_5_n_0 ;
  wire \s00_axi_rdata[29]_i_6_n_0 ;
  wire \s00_axi_rdata[29]_i_7_n_0 ;
  wire \s00_axi_rdata[2]_i_4_n_0 ;
  wire \s00_axi_rdata[2]_i_5_n_0 ;
  wire \s00_axi_rdata[2]_i_6_n_0 ;
  wire \s00_axi_rdata[2]_i_7_n_0 ;
  wire \s00_axi_rdata[30]_i_1_n_0 ;
  wire \s00_axi_rdata[30]_i_4_n_0 ;
  wire \s00_axi_rdata[30]_i_5_n_0 ;
  wire \s00_axi_rdata[30]_i_6_n_0 ;
  wire \s00_axi_rdata[30]_i_7_n_0 ;
  wire \s00_axi_rdata[31]_i_1_n_0 ;
  wire \s00_axi_rdata[31]_i_2_n_0 ;
  wire \s00_axi_rdata[31]_i_3_n_0 ;
  wire \s00_axi_rdata[31]_i_6_n_0 ;
  wire \s00_axi_rdata[31]_i_7_n_0 ;
  wire \s00_axi_rdata[31]_i_8_n_0 ;
  wire \s00_axi_rdata[31]_i_9_n_0 ;
  wire \s00_axi_rdata[3]_i_4_n_0 ;
  wire \s00_axi_rdata[3]_i_5_n_0 ;
  wire \s00_axi_rdata[3]_i_6_n_0 ;
  wire \s00_axi_rdata[3]_i_7_n_0 ;
  wire \s00_axi_rdata[4]_i_4_n_0 ;
  wire \s00_axi_rdata[4]_i_5_n_0 ;
  wire \s00_axi_rdata[4]_i_6_n_0 ;
  wire \s00_axi_rdata[4]_i_7_n_0 ;
  wire \s00_axi_rdata[5]_i_4_n_0 ;
  wire \s00_axi_rdata[5]_i_5_n_0 ;
  wire \s00_axi_rdata[5]_i_6_n_0 ;
  wire \s00_axi_rdata[5]_i_7_n_0 ;
  wire \s00_axi_rdata[6]_i_4_n_0 ;
  wire \s00_axi_rdata[6]_i_5_n_0 ;
  wire \s00_axi_rdata[6]_i_6_n_0 ;
  wire \s00_axi_rdata[6]_i_7_n_0 ;
  wire \s00_axi_rdata[7]_i_4_n_0 ;
  wire \s00_axi_rdata[7]_i_5_n_0 ;
  wire \s00_axi_rdata[7]_i_6_n_0 ;
  wire \s00_axi_rdata[7]_i_7_n_0 ;
  wire \s00_axi_rdata[8]_i_4_n_0 ;
  wire \s00_axi_rdata[8]_i_5_n_0 ;
  wire \s00_axi_rdata[8]_i_6_n_0 ;
  wire \s00_axi_rdata[8]_i_7_n_0 ;
  wire \s00_axi_rdata[9]_i_4_n_0 ;
  wire \s00_axi_rdata[9]_i_5_n_0 ;
  wire \s00_axi_rdata[9]_i_6_n_0 ;
  wire \s00_axi_rdata[9]_i_7_n_0 ;
  wire \s00_axi_rdata_reg[0]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[0]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[10]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[10]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[11]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[11]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[12]_i_4_n_0 ;
  wire \s00_axi_rdata_reg[12]_i_5_n_0 ;
  wire \s00_axi_rdata_reg[13]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[13]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[14]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[14]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[15]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[15]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[16]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[16]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[17]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[17]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[18]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[18]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[19]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[19]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[1]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[1]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[20]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[20]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[21]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[21]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[22]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[22]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[23]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[23]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[24]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[24]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[25]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[25]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[26]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[26]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[27]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[27]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[28]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[28]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[29]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[29]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[2]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[2]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[30]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[30]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[31]_i_4_n_0 ;
  wire \s00_axi_rdata_reg[31]_i_5_n_0 ;
  wire \s00_axi_rdata_reg[3]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[3]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[4]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[4]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[5]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[5]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[6]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[6]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[7]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[7]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[8]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[8]_i_3_n_0 ;
  wire \s00_axi_rdata_reg[9]_i_2_n_0 ;
  wire \s00_axi_rdata_reg[9]_i_3_n_0 ;
  wire s00_axi_rready;
  wire [31:0]s00_axi_wdata;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire s_aresetn;
  wire s_axis_tready_sig;
  wire [15:8]svf_axis_tdata;
  wire vfsm_error_i_1_n_0;
  wire vfsm_rd_enable;
  wire vfsm_rd_enable_i_1_n_0;
  wire vfsm_rst19_out;
  wire vfsm_rst9_in;
  wire [1:0]vfsm_state;
  wire vgen_n_6;
  wire video_FIFO_n_18;
  wire video_FIFO_n_19;
  wire video_FIFO_n_2;
  wire video_FIFO_n_20;
  wire video_FIFO_n_21;
  wire video_FIFO_n_22;
  wire video_FIFO_n_23;
  wire video_FIFO_n_24;
  wire video_FIFO_n_25;
  wire video_FIFO_n_26;
  wire video_FIFO_n_27;
  wire video_FIFO_n_28;
  wire video_FIFO_n_3;
  wire video_FIFO_n_30;
  wire video_FIFO_n_31;
  wire video_FIFO_n_32;
  wire video_FIFO_n_33;
  wire video_FIFO_n_34;
  wire video_FIFO_n_35;
  wire video_FIFO_n_36;
  wire video_FIFO_n_37;
  wire video_FIFO_n_38;
  wire video_FIFO_n_39;
  wire video_FIFO_n_4;
  wire video_FIFO_n_40;
  wire video_FIFO_n_41;
  wire video_FIFO_n_42;
  wire video_FIFO_n_5;
  wire video_FIFO_n_6;
  wire video_FIFO_n_7;
  wire video_FIFO_n_8;
  wire video_FIFO_n_9;
  wire video_active;
  wire video_active_d;
  wire video_clk;
  wire video_hsync;
  wire video_hsync_d;
  wire [23:0]video_rgb;
  wire video_rst_i_1_n_0;
  wire video_rst_reg_n_0;
  wire video_vsync;
  wire video_vsync_d;
  wire wready06_out;
  wire wready0__0;
  wire wready_i_1_n_0;
  wire [1:1]NLW_cdc_vid2axi_dest_out_UNCONNECTED;

  LUT6 #(
    .INIT(64'hBBBB4000FFFF4000)) 
    bvalid_i_1
       (.I0(\regfile_reg_n_0_[0][0] ),
        .I1(s00_axi_aresetn),
        .I2(s00_axi_awvalid),
        .I3(s00_axi_wvalid),
        .I4(bvalid_reg_0),
        .I5(s00_axi_bready),
        .O(bvalid_i_1_n_0));
  FDRE bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(bvalid_i_1_n_0),
        .Q(bvalid_reg_0),
        .R(1'b0));
  (* DEST_SYNC_FF = "2" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SRC_INPUT_REG = "1" *) 
  (* VERSION = "0" *) 
  (* WIDTH = "2" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_1_axi_video_0_3_xpm_cdc_array_single cdc_vid2axi
       (.dest_clk(m00_axi_aclk),
        .dest_out({NLW_cdc_vid2axi_dest_out_UNCONNECTED[1],cdc_axi}),
        .src_clk(video_clk),
        .src_in(cdc_video));
  design_1_axi_video_0_3_AXI_MM2S mm2s
       (.D(p_1_in__0[18:17]),
        .E(video_FIFO_n_26),
        .\FSM_onehot_state_reg[0]_0 (video_FIFO_n_28),
        .Q({mm2s_n_1,mm2s_n_2,mm2s_n_3}),
        .dest_out(cdc_axi),
        .\i_address_cnt_reg[63]_0 (mm2s_address),
        .\i_burst_cnt_reg[0]_0 (video_FIFO_n_27),
        .\i_transfer_cnt_reg[22]_0 ({\mm2s_size_words_reg_n_0_[22] ,\mm2s_size_words_reg_n_0_[21] ,\mm2s_size_words_reg_n_0_[20] ,\mm2s_size_words_reg_n_0_[19] ,\mm2s_size_words_reg_n_0_[18] ,\mm2s_size_words_reg_n_0_[17] ,\mm2s_size_words_reg_n_0_[16] ,\mm2s_size_words_reg_n_0_[15] ,\mm2s_size_words_reg_n_0_[14] ,\mm2s_size_words_reg_n_0_[13] ,\mm2s_size_words_reg_n_0_[12] ,\mm2s_size_words_reg_n_0_[11] ,\mm2s_size_words_reg_n_0_[10] ,\mm2s_size_words_reg_n_0_[9] ,\mm2s_size_words_reg_n_0_[8] ,\mm2s_size_words_reg_n_0_[7] ,\mm2s_size_words_reg_n_0_[6] ,\mm2s_size_words_reg_n_0_[5] ,\mm2s_size_words_reg_n_0_[4] ,\mm2s_size_words_reg_n_0_[3] ,\mm2s_size_words_reg_n_0_[2] ,\mm2s_size_words_reg_n_0_[1] ,\mm2s_size_words_reg_n_0_[0] }),
        .is_last_reg_0(video_rst_reg_n_0),
        .m00_axi_aclk(m00_axi_aclk),
        .m00_axi_araddr(m00_axi_araddr),
        .m00_axi_arburst(m00_axi_arburst),
        .m00_axi_aresetn(m00_axi_aresetn),
        .m00_axi_arlen(m00_axi_arlen),
        .m00_axi_arready(m00_axi_arready),
        .m00_axi_arvalid(m00_axi_arvalid),
        .m00_axi_rlast(m00_axi_rlast),
        .m00_axi_rresp(m00_axi_rresp),
        .m00_axi_rvalid(m00_axi_rvalid),
        .mm2s_run(mm2s_run),
        .\regfile_reg[0][17] (\regfile[0][31]_i_3_n_0 ),
        .\regfile_reg[0][3] (mm2s_n_6),
        .run_ack_reg_0(mm2s_n_76),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_wdata(s00_axi_wdata[18:17]),
        .s00_axi_wstrb(s00_axi_wstrb[2]),
        .s_aresetn(s_aresetn),
        .s_axis_tlast(m_axis_tlast),
        .s_axis_tready(s_axis_tready_sig),
        .s_axis_tvalid(m_axis_tvalid),
        .vfsm_state(vfsm_state),
        .\vfsm_state_reg[0] (mm2s_n_5),
        .\vfsm_state_reg[0]_0 (vfsm_rst9_in),
        .\vfsm_state_reg[1] (mm2s_n_7),
        .wready06_out(wready06_out),
        .wready0__0(wready0__0));
  LUT3 #(
    .INIT(8'h40)) 
    \mm2s_address[63]_i_1 
       (.I0(vfsm_state[1]),
        .I1(vfsm_state[0]),
        .I2(cdc_axi),
        .O(\mm2s_address[63]_i_1_n_0 ));
  FDRE \mm2s_address_reg[0] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][0] ),
        .Q(mm2s_address[0]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[10] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][10] ),
        .Q(mm2s_address[10]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[11] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][11] ),
        .Q(mm2s_address[11]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[12] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][12] ),
        .Q(mm2s_address[12]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[13] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][13] ),
        .Q(mm2s_address[13]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[14] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][14] ),
        .Q(mm2s_address[14]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[15] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][15] ),
        .Q(mm2s_address[15]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[16] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][16] ),
        .Q(mm2s_address[16]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[17] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][17] ),
        .Q(mm2s_address[17]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[18] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][18] ),
        .Q(mm2s_address[18]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[19] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][19] ),
        .Q(mm2s_address[19]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[1] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][1] ),
        .Q(mm2s_address[1]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[20] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][20] ),
        .Q(mm2s_address[20]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[21] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][21] ),
        .Q(mm2s_address[21]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[22] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][22] ),
        .Q(mm2s_address[22]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[23] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][23] ),
        .Q(mm2s_address[23]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[24] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][24] ),
        .Q(mm2s_address[24]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[25] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][25] ),
        .Q(mm2s_address[25]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[26] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][26] ),
        .Q(mm2s_address[26]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[27] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][27] ),
        .Q(mm2s_address[27]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[28] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][28] ),
        .Q(mm2s_address[28]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[29] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][29] ),
        .Q(mm2s_address[29]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[2] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][2] ),
        .Q(mm2s_address[2]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[30] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][30] ),
        .Q(mm2s_address[30]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[31] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][31] ),
        .Q(mm2s_address[31]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[32] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][0] ),
        .Q(mm2s_address[32]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[33] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][1] ),
        .Q(mm2s_address[33]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[34] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][2] ),
        .Q(mm2s_address[34]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[35] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][3] ),
        .Q(mm2s_address[35]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[36] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][4] ),
        .Q(mm2s_address[36]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[37] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][5] ),
        .Q(mm2s_address[37]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[38] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][6] ),
        .Q(mm2s_address[38]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[39] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][7] ),
        .Q(mm2s_address[39]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[3] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][3] ),
        .Q(mm2s_address[3]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[40] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][8] ),
        .Q(mm2s_address[40]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[41] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][9] ),
        .Q(mm2s_address[41]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[42] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][10] ),
        .Q(mm2s_address[42]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[43] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][11] ),
        .Q(mm2s_address[43]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[44] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][12] ),
        .Q(mm2s_address[44]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[45] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][13] ),
        .Q(mm2s_address[45]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[46] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][14] ),
        .Q(mm2s_address[46]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[47] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][15] ),
        .Q(mm2s_address[47]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[48] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][16] ),
        .Q(mm2s_address[48]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[49] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][17] ),
        .Q(mm2s_address[49]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[4] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][4] ),
        .Q(mm2s_address[4]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[50] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][18] ),
        .Q(mm2s_address[50]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[51] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][19] ),
        .Q(mm2s_address[51]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[52] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][20] ),
        .Q(mm2s_address[52]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[53] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][21] ),
        .Q(mm2s_address[53]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[54] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][22] ),
        .Q(mm2s_address[54]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[55] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][23] ),
        .Q(mm2s_address[55]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[56] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][24] ),
        .Q(mm2s_address[56]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[57] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][25] ),
        .Q(mm2s_address[57]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[58] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][26] ),
        .Q(mm2s_address[58]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[59] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][27] ),
        .Q(mm2s_address[59]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[5] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][5] ),
        .Q(mm2s_address[5]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[60] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][28] ),
        .Q(mm2s_address[60]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[61] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][29] ),
        .Q(mm2s_address[61]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[62] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][30] ),
        .Q(mm2s_address[62]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[63] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[1][31] ),
        .Q(mm2s_address[63]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[6] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][6] ),
        .Q(mm2s_address[6]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[7] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][7] ),
        .Q(mm2s_address[7]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[8] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][8] ),
        .Q(mm2s_address[8]),
        .R(vfsm_rst19_out));
  FDRE \mm2s_address_reg[9] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[2][9] ),
        .Q(mm2s_address[9]),
        .R(vfsm_rst19_out));
  FDRE mm2s_run_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(mm2s_n_76),
        .Q(mm2s_run),
        .R(vfsm_rst19_out));
  FDRE \mm2s_size_words_reg[0] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[3][0] ),
        .Q(\mm2s_size_words_reg_n_0_[0] ),
        .R(vfsm_rst19_out));
  FDRE \mm2s_size_words_reg[10] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[3][10] ),
        .Q(\mm2s_size_words_reg_n_0_[10] ),
        .R(vfsm_rst19_out));
  FDRE \mm2s_size_words_reg[11] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[3][11] ),
        .Q(\mm2s_size_words_reg_n_0_[11] ),
        .R(vfsm_rst19_out));
  FDRE \mm2s_size_words_reg[12] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[3][12] ),
        .Q(\mm2s_size_words_reg_n_0_[12] ),
        .R(vfsm_rst19_out));
  FDRE \mm2s_size_words_reg[13] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[3][13] ),
        .Q(\mm2s_size_words_reg_n_0_[13] ),
        .R(vfsm_rst19_out));
  FDRE \mm2s_size_words_reg[14] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[3][14] ),
        .Q(\mm2s_size_words_reg_n_0_[14] ),
        .R(vfsm_rst19_out));
  FDRE \mm2s_size_words_reg[15] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[3][15] ),
        .Q(\mm2s_size_words_reg_n_0_[15] ),
        .R(vfsm_rst19_out));
  FDRE \mm2s_size_words_reg[16] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[3][16] ),
        .Q(\mm2s_size_words_reg_n_0_[16] ),
        .R(vfsm_rst19_out));
  FDRE \mm2s_size_words_reg[17] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[3][17] ),
        .Q(\mm2s_size_words_reg_n_0_[17] ),
        .R(vfsm_rst19_out));
  FDRE \mm2s_size_words_reg[18] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[3][18] ),
        .Q(\mm2s_size_words_reg_n_0_[18] ),
        .R(vfsm_rst19_out));
  FDRE \mm2s_size_words_reg[19] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[3][19] ),
        .Q(\mm2s_size_words_reg_n_0_[19] ),
        .R(vfsm_rst19_out));
  FDRE \mm2s_size_words_reg[1] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[3][1] ),
        .Q(\mm2s_size_words_reg_n_0_[1] ),
        .R(vfsm_rst19_out));
  FDRE \mm2s_size_words_reg[20] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[3][20] ),
        .Q(\mm2s_size_words_reg_n_0_[20] ),
        .R(vfsm_rst19_out));
  FDRE \mm2s_size_words_reg[21] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[3][21] ),
        .Q(\mm2s_size_words_reg_n_0_[21] ),
        .R(vfsm_rst19_out));
  FDRE \mm2s_size_words_reg[22] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[3][22] ),
        .Q(\mm2s_size_words_reg_n_0_[22] ),
        .R(vfsm_rst19_out));
  FDRE \mm2s_size_words_reg[2] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[3][2] ),
        .Q(\mm2s_size_words_reg_n_0_[2] ),
        .R(vfsm_rst19_out));
  FDRE \mm2s_size_words_reg[3] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[3][3] ),
        .Q(\mm2s_size_words_reg_n_0_[3] ),
        .R(vfsm_rst19_out));
  FDRE \mm2s_size_words_reg[4] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[3][4] ),
        .Q(\mm2s_size_words_reg_n_0_[4] ),
        .R(vfsm_rst19_out));
  FDRE \mm2s_size_words_reg[5] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[3][5] ),
        .Q(\mm2s_size_words_reg_n_0_[5] ),
        .R(vfsm_rst19_out));
  FDRE \mm2s_size_words_reg[6] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[3][6] ),
        .Q(\mm2s_size_words_reg_n_0_[6] ),
        .R(vfsm_rst19_out));
  FDRE \mm2s_size_words_reg[7] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[3][7] ),
        .Q(\mm2s_size_words_reg_n_0_[7] ),
        .R(vfsm_rst19_out));
  FDRE \mm2s_size_words_reg[8] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[3][8] ),
        .Q(\mm2s_size_words_reg_n_0_[8] ),
        .R(vfsm_rst19_out));
  FDRE \mm2s_size_words_reg[9] 
       (.C(m00_axi_aclk),
        .CE(\mm2s_address[63]_i_1_n_0 ),
        .D(\regfile_reg_n_0_[3][9] ),
        .Q(\mm2s_size_words_reg_n_0_[9] ),
        .R(vfsm_rst19_out));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[0][15]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[0]__0 ),
        .I2(s00_axi_wstrb[1]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[0][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEFFFFFFF40000000)) 
    \regfile[0][16]_i_1 
       (.I0(wready0__0),
        .I1(\regfile[0][16]_i_2_n_0 ),
        .I2(s00_axi_wstrb[2]),
        .I3(\regfile[0][31]_i_3_n_0 ),
        .I4(wready06_out),
        .I5(p_1_in),
        .O(p_1_in__0[16]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000002)) 
    \regfile[0][16]_i_2 
       (.I0(s00_axi_wdata[16]),
        .I1(s00_axi_awaddr[3]),
        .I2(s00_axi_awaddr[2]),
        .I3(s00_axi_awaddr[0]),
        .I4(s00_axi_awaddr[1]),
        .I5(p_1_in),
        .O(\regfile[0][16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \regfile[0][18]_i_3 
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_awvalid),
        .O(wready06_out));
  LUT5 #(
    .INIT(32'h00808080)) 
    \regfile[0][23]_i_1 
       (.I0(\regfile[0][23]_i_2_n_0 ),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_awvalid),
        .I3(s00_axi_bready),
        .I4(bvalid_reg_0),
        .O(\regfile[0][23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT5 #(
    .INIT(32'h00010000)) 
    \regfile[0][23]_i_2 
       (.I0(s00_axi_awaddr[0]),
        .I1(s00_axi_awaddr[3]),
        .I2(s00_axi_awaddr[1]),
        .I3(s00_axi_awaddr[2]),
        .I4(s00_axi_wstrb[2]),
        .O(\regfile[0][23]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \regfile[0][31]_i_1 
       (.I0(\regfile_reg_n_0_[0][0] ),
        .I1(s00_axi_aresetn),
        .O(p_18_in));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[0][31]_i_2 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[0]__0 ),
        .I2(s00_axi_wstrb[3]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[0][31]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \regfile[0][31]_i_3 
       (.I0(s00_axi_awaddr[0]),
        .I1(s00_axi_awaddr[1]),
        .I2(s00_axi_awaddr[2]),
        .I3(s00_axi_awaddr[3]),
        .O(\regfile[0][31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \regfile[0][31]_i_4 
       (.I0(s00_axi_awaddr[3]),
        .I1(s00_axi_awaddr[2]),
        .I2(s00_axi_awaddr[0]),
        .I3(s00_axi_awaddr[1]),
        .O(\regfile_reg[0]__0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \regfile[0][31]_i_5 
       (.I0(bvalid_reg_0),
        .I1(s00_axi_bready),
        .O(wready0__0));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[0][7]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[0]__0 ),
        .I2(s00_axi_wstrb[0]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[0][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[10][15]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[10]__2 ),
        .I2(s00_axi_wstrb[1]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[10][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[10][23]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[10]__2 ),
        .I2(s00_axi_wstrb[2]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[10][23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[10][31]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[10]__2 ),
        .I2(s00_axi_wstrb[3]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[10][31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \regfile[10][31]_i_2 
       (.I0(s00_axi_awaddr[0]),
        .I1(s00_axi_awaddr[2]),
        .I2(s00_axi_awaddr[1]),
        .I3(s00_axi_awaddr[3]),
        .O(\regfile_reg[10]__2 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[10][7]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[10]__2 ),
        .I2(s00_axi_wstrb[0]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[10][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[11][15]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[11]__1 ),
        .I2(s00_axi_wstrb[1]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[11][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[11][23]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[11]__1 ),
        .I2(s00_axi_wstrb[2]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[11][23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[11][31]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[11]__1 ),
        .I2(s00_axi_wstrb[3]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[11][31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \regfile[11][31]_i_2 
       (.I0(s00_axi_awaddr[3]),
        .I1(s00_axi_awaddr[2]),
        .I2(s00_axi_awaddr[0]),
        .I3(s00_axi_awaddr[1]),
        .O(\regfile_reg[11]__1 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[11][7]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[11]__1 ),
        .I2(s00_axi_wstrb[0]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[11][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[12][15]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[12]__1 ),
        .I2(s00_axi_wstrb[1]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[12][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[12][23]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[12]__1 ),
        .I2(s00_axi_wstrb[2]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[12][23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[12][31]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[12]__1 ),
        .I2(s00_axi_wstrb[3]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[12][31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \regfile[12][31]_i_2 
       (.I0(s00_axi_awaddr[0]),
        .I1(s00_axi_awaddr[1]),
        .I2(s00_axi_awaddr[3]),
        .I3(s00_axi_awaddr[2]),
        .O(\regfile_reg[12]__1 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[12][7]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[12]__1 ),
        .I2(s00_axi_wstrb[0]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[12][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[13][15]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[13]__1 ),
        .I2(s00_axi_wstrb[1]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[13][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[13][23]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[13]__1 ),
        .I2(s00_axi_wstrb[2]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[13][23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[13][31]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[13]__1 ),
        .I2(s00_axi_wstrb[3]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[13][31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \regfile[13][31]_i_2 
       (.I0(s00_axi_awaddr[2]),
        .I1(s00_axi_awaddr[1]),
        .I2(s00_axi_awaddr[0]),
        .I3(s00_axi_awaddr[3]),
        .O(\regfile_reg[13]__1 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[13][7]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[13]__1 ),
        .I2(s00_axi_wstrb[0]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[13][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[14][15]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[14]__2 ),
        .I2(s00_axi_wstrb[1]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[14][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[14][23]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[14]__2 ),
        .I2(s00_axi_wstrb[2]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[14][23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[14][31]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[14]__2 ),
        .I2(s00_axi_wstrb[3]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[14][31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2000)) 
    \regfile[14][31]_i_2 
       (.I0(s00_axi_awaddr[2]),
        .I1(s00_axi_awaddr[0]),
        .I2(s00_axi_awaddr[3]),
        .I3(s00_axi_awaddr[1]),
        .O(\regfile_reg[14]__2 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[14][7]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[14]__2 ),
        .I2(s00_axi_wstrb[0]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[14][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[15][15]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[15]__0 ),
        .I2(s00_axi_wstrb[1]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[15][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[15][23]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[15]__0 ),
        .I2(s00_axi_wstrb[2]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[15][23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[15][31]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[15]__0 ),
        .I2(s00_axi_wstrb[3]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[15][31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \regfile[15][31]_i_2 
       (.I0(s00_axi_awaddr[3]),
        .I1(s00_axi_awaddr[2]),
        .I2(s00_axi_awaddr[0]),
        .I3(s00_axi_awaddr[1]),
        .O(\regfile_reg[15]__0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[15][7]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[15]__0 ),
        .I2(s00_axi_wstrb[0]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[15][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[1][15]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[1]__1 ),
        .I2(s00_axi_wstrb[1]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[1][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[1][23]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[1]__1 ),
        .I2(s00_axi_wstrb[2]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[1][23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[1][31]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[1]__1 ),
        .I2(s00_axi_wstrb[3]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[1][31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \regfile[1][31]_i_2 
       (.I0(s00_axi_awaddr[3]),
        .I1(s00_axi_awaddr[2]),
        .I2(s00_axi_awaddr[0]),
        .I3(s00_axi_awaddr[1]),
        .O(\regfile_reg[1]__1 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[1][7]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[1]__1 ),
        .I2(s00_axi_wstrb[0]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[1][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[2][15]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[2]__1 ),
        .I2(s00_axi_wstrb[1]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[2][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[2][23]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[2]__1 ),
        .I2(s00_axi_wstrb[2]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[2][23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[2][31]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[2]__1 ),
        .I2(s00_axi_wstrb[3]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[2][31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \regfile[2][31]_i_2 
       (.I0(s00_axi_awaddr[3]),
        .I1(s00_axi_awaddr[2]),
        .I2(s00_axi_awaddr[1]),
        .I3(s00_axi_awaddr[0]),
        .O(\regfile_reg[2]__1 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[2][7]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[2]__1 ),
        .I2(s00_axi_wstrb[0]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[2][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[3][15]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[3]__1 ),
        .I2(s00_axi_wstrb[1]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[3][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[3][23]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[3]__1 ),
        .I2(s00_axi_wstrb[2]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[3][23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[3][31]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[3]__1 ),
        .I2(s00_axi_wstrb[3]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[3][31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \regfile[3][31]_i_2 
       (.I0(s00_axi_awaddr[3]),
        .I1(s00_axi_awaddr[2]),
        .I2(s00_axi_awaddr[0]),
        .I3(s00_axi_awaddr[1]),
        .O(\regfile_reg[3]__1 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[3][7]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[3]__1 ),
        .I2(s00_axi_wstrb[0]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[3][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[4][15]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[4]__2 ),
        .I2(s00_axi_wstrb[1]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[4][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[4][23]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[4]__2 ),
        .I2(s00_axi_wstrb[2]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[4][23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[4][31]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[4]__2 ),
        .I2(s00_axi_wstrb[3]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[4][31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \regfile[4][31]_i_2 
       (.I0(s00_axi_awaddr[3]),
        .I1(s00_axi_awaddr[0]),
        .I2(s00_axi_awaddr[2]),
        .I3(s00_axi_awaddr[1]),
        .O(\regfile_reg[4]__2 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[4][7]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[4]__2 ),
        .I2(s00_axi_wstrb[0]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[4][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[5][15]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[5]__2 ),
        .I2(s00_axi_wstrb[1]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[5][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[5][23]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[5]__2 ),
        .I2(s00_axi_wstrb[2]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[5][23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[5][31]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[5]__2 ),
        .I2(s00_axi_wstrb[3]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[5][31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \regfile[5][31]_i_2 
       (.I0(s00_axi_awaddr[3]),
        .I1(s00_axi_awaddr[1]),
        .I2(s00_axi_awaddr[0]),
        .I3(s00_axi_awaddr[2]),
        .O(\regfile_reg[5]__2 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[5][7]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[5]__2 ),
        .I2(s00_axi_wstrb[0]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[5][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[6][15]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[6]__2 ),
        .I2(s00_axi_wstrb[1]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[6][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[6][23]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[6]__2 ),
        .I2(s00_axi_wstrb[2]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[6][23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[6][31]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[6]__2 ),
        .I2(s00_axi_wstrb[3]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[6][31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \regfile[6][31]_i_2 
       (.I0(s00_axi_awaddr[3]),
        .I1(s00_axi_awaddr[0]),
        .I2(s00_axi_awaddr[1]),
        .I3(s00_axi_awaddr[2]),
        .O(\regfile_reg[6]__2 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[6][7]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[6]__2 ),
        .I2(s00_axi_wstrb[0]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[6][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[7][15]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[7]__1 ),
        .I2(s00_axi_wstrb[1]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[7][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[7][23]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[7]__1 ),
        .I2(s00_axi_wstrb[2]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[7][23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[7][31]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[7]__1 ),
        .I2(s00_axi_wstrb[3]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[7][31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \regfile[7][31]_i_2 
       (.I0(s00_axi_awaddr[2]),
        .I1(s00_axi_awaddr[3]),
        .I2(s00_axi_awaddr[0]),
        .I3(s00_axi_awaddr[1]),
        .O(\regfile_reg[7]__1 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[7][7]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[7]__1 ),
        .I2(s00_axi_wstrb[0]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[7][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[8][15]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[8]__2 ),
        .I2(s00_axi_wstrb[1]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[8][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[8][23]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[8]__2 ),
        .I2(s00_axi_wstrb[2]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[8][23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[8][31]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[8]__2 ),
        .I2(s00_axi_wstrb[3]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[8][31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \regfile[8][31]_i_2 
       (.I0(s00_axi_awaddr[0]),
        .I1(s00_axi_awaddr[2]),
        .I2(s00_axi_awaddr[3]),
        .I3(s00_axi_awaddr[1]),
        .O(\regfile_reg[8]__2 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[8][7]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[8]__2 ),
        .I2(s00_axi_wstrb[0]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[8][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[9][15]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[9]__1 ),
        .I2(s00_axi_wstrb[1]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[9][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[9][23]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[9]__1 ),
        .I2(s00_axi_wstrb[2]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[9][23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[9][31]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[9]__1 ),
        .I2(s00_axi_wstrb[3]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[9][31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \regfile[9][31]_i_2 
       (.I0(s00_axi_awaddr[1]),
        .I1(s00_axi_awaddr[2]),
        .I2(s00_axi_awaddr[0]),
        .I3(s00_axi_awaddr[3]),
        .O(\regfile_reg[9]__1 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \regfile[9][7]_i_1 
       (.I0(\regfile[0][31]_i_3_n_0 ),
        .I1(\regfile_reg[9]__1 ),
        .I2(s00_axi_wstrb[0]),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_awvalid),
        .I5(wready0__0),
        .O(\regfile[9][7]_i_1_n_0 ));
  FDRE \regfile_reg[0][0] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\regfile_reg_n_0_[0][0] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][10] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\regfile_reg_n_0_[0][10] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][11] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\regfile_reg_n_0_[0][11] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][12] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\regfile_reg_n_0_[0][12] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][13] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\regfile_reg_n_0_[0][13] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][14] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\regfile_reg_n_0_[0][14] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][15] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\regfile_reg_n_0_[0][15] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][16] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(p_1_in__0[16]),
        .Q(\regfile_reg_n_0_[0][16] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][17] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(p_1_in__0[17]),
        .Q(\regfile_reg_n_0_[0][17] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][18] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(p_1_in__0[18]),
        .Q(\regfile_reg_n_0_[0][18] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][19] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\regfile_reg_n_0_[0][19] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][1] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\regfile_reg_n_0_[0][1] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][20] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\regfile_reg_n_0_[0][20] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][21] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\regfile_reg_n_0_[0][21] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][22] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\regfile_reg_n_0_[0][22] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][23] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\regfile_reg_n_0_[0][23] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][24] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][31]_i_2_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\regfile_reg_n_0_[0][24] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][25] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][31]_i_2_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\regfile_reg_n_0_[0][25] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][26] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][31]_i_2_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\regfile_reg_n_0_[0][26] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][27] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][31]_i_2_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\regfile_reg_n_0_[0][27] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][28] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][31]_i_2_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\regfile_reg_n_0_[0][28] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][29] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][31]_i_2_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\regfile_reg_n_0_[0][29] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][2] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\regfile_reg_n_0_[0][2] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][30] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][31]_i_2_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\regfile_reg_n_0_[0][30] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][31] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][31]_i_2_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\regfile_reg_n_0_[0][31] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][3] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(vfsm_rst9_in),
        .R(p_18_in));
  FDRE \regfile_reg[0][4] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\regfile_reg_n_0_[0][4] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][5] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\regfile_reg_n_0_[0][5] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][6] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\regfile_reg_n_0_[0][6] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][7] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\regfile_reg_n_0_[0][7] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][8] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\regfile_reg_n_0_[0][8] ),
        .R(p_18_in));
  FDRE \regfile_reg[0][9] 
       (.C(s00_axi_aclk),
        .CE(\regfile[0][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\regfile_reg_n_0_[0][9] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][0] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\regfile_reg_n_0_[10][0] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][10] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\regfile_reg_n_0_[10][10] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][11] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\regfile_reg_n_0_[10][11] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][12] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\regfile_reg_n_0_[10][12] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][13] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\regfile_reg_n_0_[10][13] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][14] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\regfile_reg_n_0_[10][14] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][15] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\regfile_reg_n_0_[10][15] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][16] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\regfile_reg_n_0_[10][16] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][17] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\regfile_reg_n_0_[10][17] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][18] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\regfile_reg_n_0_[10][18] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][19] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\regfile_reg_n_0_[10][19] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][1] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\regfile_reg_n_0_[10][1] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][20] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\regfile_reg_n_0_[10][20] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][21] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\regfile_reg_n_0_[10][21] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][22] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\regfile_reg_n_0_[10][22] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][23] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\regfile_reg_n_0_[10][23] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][24] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\regfile_reg_n_0_[10][24] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][25] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\regfile_reg_n_0_[10][25] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][26] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\regfile_reg_n_0_[10][26] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][27] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\regfile_reg_n_0_[10][27] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][28] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\regfile_reg_n_0_[10][28] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][29] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\regfile_reg_n_0_[10][29] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][2] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\regfile_reg_n_0_[10][2] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][30] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\regfile_reg_n_0_[10][30] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][31] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\regfile_reg_n_0_[10][31] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][3] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\regfile_reg_n_0_[10][3] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][4] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\regfile_reg_n_0_[10][4] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][5] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\regfile_reg_n_0_[10][5] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][6] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\regfile_reg_n_0_[10][6] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][7] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\regfile_reg_n_0_[10][7] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][8] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\regfile_reg_n_0_[10][8] ),
        .R(p_18_in));
  FDRE \regfile_reg[10][9] 
       (.C(s00_axi_aclk),
        .CE(\regfile[10][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\regfile_reg_n_0_[10][9] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][0] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\regfile_reg_n_0_[11][0] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][10] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\regfile_reg_n_0_[11][10] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][11] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\regfile_reg_n_0_[11][11] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][12] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\regfile_reg_n_0_[11][12] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][13] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\regfile_reg_n_0_[11][13] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][14] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\regfile_reg_n_0_[11][14] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][15] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\regfile_reg_n_0_[11][15] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][16] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\regfile_reg_n_0_[11][16] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][17] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\regfile_reg_n_0_[11][17] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][18] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\regfile_reg_n_0_[11][18] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][19] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\regfile_reg_n_0_[11][19] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][1] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\regfile_reg_n_0_[11][1] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][20] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\regfile_reg_n_0_[11][20] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][21] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\regfile_reg_n_0_[11][21] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][22] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\regfile_reg_n_0_[11][22] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][23] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\regfile_reg_n_0_[11][23] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][24] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\regfile_reg_n_0_[11][24] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][25] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\regfile_reg_n_0_[11][25] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][26] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\regfile_reg_n_0_[11][26] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][27] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\regfile_reg_n_0_[11][27] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][28] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\regfile_reg_n_0_[11][28] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][29] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\regfile_reg_n_0_[11][29] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][2] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\regfile_reg_n_0_[11][2] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][30] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\regfile_reg_n_0_[11][30] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][31] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\regfile_reg_n_0_[11][31] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][3] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\regfile_reg_n_0_[11][3] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][4] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\regfile_reg_n_0_[11][4] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][5] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\regfile_reg_n_0_[11][5] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][6] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\regfile_reg_n_0_[11][6] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][7] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\regfile_reg_n_0_[11][7] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][8] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\regfile_reg_n_0_[11][8] ),
        .R(p_18_in));
  FDRE \regfile_reg[11][9] 
       (.C(s00_axi_aclk),
        .CE(\regfile[11][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\regfile_reg_n_0_[11][9] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][0] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\regfile_reg_n_0_[12][0] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][10] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\regfile_reg_n_0_[12][10] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][11] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\regfile_reg_n_0_[12][11] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][12] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\regfile_reg_n_0_[12][12] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][13] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\regfile_reg_n_0_[12][13] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][14] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\regfile_reg_n_0_[12][14] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][15] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\regfile_reg_n_0_[12][15] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][16] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\regfile_reg_n_0_[12][16] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][17] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\regfile_reg_n_0_[12][17] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][18] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\regfile_reg_n_0_[12][18] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][19] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\regfile_reg_n_0_[12][19] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][1] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\regfile_reg_n_0_[12][1] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][20] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\regfile_reg_n_0_[12][20] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][21] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\regfile_reg_n_0_[12][21] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][22] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\regfile_reg_n_0_[12][22] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][23] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\regfile_reg_n_0_[12][23] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][24] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\regfile_reg_n_0_[12][24] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][25] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\regfile_reg_n_0_[12][25] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][26] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\regfile_reg_n_0_[12][26] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][27] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\regfile_reg_n_0_[12][27] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][28] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\regfile_reg_n_0_[12][28] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][29] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\regfile_reg_n_0_[12][29] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][2] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\regfile_reg_n_0_[12][2] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][30] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\regfile_reg_n_0_[12][30] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][31] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\regfile_reg_n_0_[12][31] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][3] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\regfile_reg_n_0_[12][3] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][4] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\regfile_reg_n_0_[12][4] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][5] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\regfile_reg_n_0_[12][5] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][6] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\regfile_reg_n_0_[12][6] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][7] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\regfile_reg_n_0_[12][7] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][8] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\regfile_reg_n_0_[12][8] ),
        .R(p_18_in));
  FDRE \regfile_reg[12][9] 
       (.C(s00_axi_aclk),
        .CE(\regfile[12][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\regfile_reg_n_0_[12][9] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][0] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\regfile_reg_n_0_[13][0] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][10] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\regfile_reg_n_0_[13][10] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][11] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\regfile_reg_n_0_[13][11] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][12] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\regfile_reg_n_0_[13][12] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][13] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\regfile_reg_n_0_[13][13] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][14] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\regfile_reg_n_0_[13][14] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][15] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\regfile_reg_n_0_[13][15] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][16] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\regfile_reg_n_0_[13][16] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][17] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\regfile_reg_n_0_[13][17] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][18] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\regfile_reg_n_0_[13][18] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][19] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\regfile_reg_n_0_[13][19] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][1] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\regfile_reg_n_0_[13][1] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][20] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\regfile_reg_n_0_[13][20] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][21] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\regfile_reg_n_0_[13][21] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][22] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\regfile_reg_n_0_[13][22] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][23] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\regfile_reg_n_0_[13][23] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][24] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\regfile_reg_n_0_[13][24] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][25] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\regfile_reg_n_0_[13][25] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][26] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\regfile_reg_n_0_[13][26] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][27] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\regfile_reg_n_0_[13][27] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][28] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\regfile_reg_n_0_[13][28] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][29] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\regfile_reg_n_0_[13][29] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][2] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\regfile_reg_n_0_[13][2] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][30] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\regfile_reg_n_0_[13][30] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][31] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\regfile_reg_n_0_[13][31] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][3] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\regfile_reg_n_0_[13][3] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][4] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\regfile_reg_n_0_[13][4] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][5] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\regfile_reg_n_0_[13][5] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][6] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\regfile_reg_n_0_[13][6] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][7] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\regfile_reg_n_0_[13][7] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][8] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\regfile_reg_n_0_[13][8] ),
        .R(p_18_in));
  FDRE \regfile_reg[13][9] 
       (.C(s00_axi_aclk),
        .CE(\regfile[13][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\regfile_reg_n_0_[13][9] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][0] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\regfile_reg_n_0_[14][0] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][10] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\regfile_reg_n_0_[14][10] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][11] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\regfile_reg_n_0_[14][11] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][12] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\regfile_reg_n_0_[14][12] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][13] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\regfile_reg_n_0_[14][13] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][14] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\regfile_reg_n_0_[14][14] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][15] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\regfile_reg_n_0_[14][15] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][16] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\regfile_reg_n_0_[14][16] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][17] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\regfile_reg_n_0_[14][17] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][18] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\regfile_reg_n_0_[14][18] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][19] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\regfile_reg_n_0_[14][19] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][1] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\regfile_reg_n_0_[14][1] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][20] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\regfile_reg_n_0_[14][20] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][21] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\regfile_reg_n_0_[14][21] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][22] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\regfile_reg_n_0_[14][22] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][23] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\regfile_reg_n_0_[14][23] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][24] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\regfile_reg_n_0_[14][24] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][25] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\regfile_reg_n_0_[14][25] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][26] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\regfile_reg_n_0_[14][26] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][27] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\regfile_reg_n_0_[14][27] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][28] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\regfile_reg_n_0_[14][28] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][29] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\regfile_reg_n_0_[14][29] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][2] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\regfile_reg_n_0_[14][2] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][30] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\regfile_reg_n_0_[14][30] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][31] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\regfile_reg_n_0_[14][31] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][3] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\regfile_reg_n_0_[14][3] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][4] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\regfile_reg_n_0_[14][4] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][5] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\regfile_reg_n_0_[14][5] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][6] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\regfile_reg_n_0_[14][6] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][7] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\regfile_reg_n_0_[14][7] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][8] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\regfile_reg_n_0_[14][8] ),
        .R(p_18_in));
  FDRE \regfile_reg[14][9] 
       (.C(s00_axi_aclk),
        .CE(\regfile[14][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\regfile_reg_n_0_[14][9] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][0] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\regfile_reg_n_0_[15][0] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][10] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\regfile_reg_n_0_[15][10] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][11] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\regfile_reg_n_0_[15][11] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][12] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\regfile_reg_n_0_[15][12] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][13] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\regfile_reg_n_0_[15][13] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][14] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\regfile_reg_n_0_[15][14] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][15] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\regfile_reg_n_0_[15][15] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][16] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\regfile_reg_n_0_[15][16] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][17] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\regfile_reg_n_0_[15][17] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][18] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\regfile_reg_n_0_[15][18] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][19] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\regfile_reg_n_0_[15][19] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][1] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\regfile_reg_n_0_[15][1] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][20] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\regfile_reg_n_0_[15][20] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][21] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\regfile_reg_n_0_[15][21] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][22] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\regfile_reg_n_0_[15][22] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][23] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\regfile_reg_n_0_[15][23] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][24] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\regfile_reg_n_0_[15][24] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][25] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\regfile_reg_n_0_[15][25] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][26] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\regfile_reg_n_0_[15][26] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][27] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\regfile_reg_n_0_[15][27] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][28] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\regfile_reg_n_0_[15][28] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][29] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\regfile_reg_n_0_[15][29] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][2] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\regfile_reg_n_0_[15][2] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][30] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\regfile_reg_n_0_[15][30] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][31] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\regfile_reg_n_0_[15][31] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][3] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\regfile_reg_n_0_[15][3] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][4] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\regfile_reg_n_0_[15][4] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][5] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\regfile_reg_n_0_[15][5] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][6] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\regfile_reg_n_0_[15][6] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][7] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\regfile_reg_n_0_[15][7] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][8] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\regfile_reg_n_0_[15][8] ),
        .R(p_18_in));
  FDRE \regfile_reg[15][9] 
       (.C(s00_axi_aclk),
        .CE(\regfile[15][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\regfile_reg_n_0_[15][9] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][0] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\regfile_reg_n_0_[1][0] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][10] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\regfile_reg_n_0_[1][10] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][11] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\regfile_reg_n_0_[1][11] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][12] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\regfile_reg_n_0_[1][12] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][13] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\regfile_reg_n_0_[1][13] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][14] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\regfile_reg_n_0_[1][14] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][15] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\regfile_reg_n_0_[1][15] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][16] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\regfile_reg_n_0_[1][16] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][17] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\regfile_reg_n_0_[1][17] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][18] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\regfile_reg_n_0_[1][18] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][19] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\regfile_reg_n_0_[1][19] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][1] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\regfile_reg_n_0_[1][1] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][20] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\regfile_reg_n_0_[1][20] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][21] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\regfile_reg_n_0_[1][21] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][22] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\regfile_reg_n_0_[1][22] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][23] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\regfile_reg_n_0_[1][23] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][24] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\regfile_reg_n_0_[1][24] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][25] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\regfile_reg_n_0_[1][25] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][26] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\regfile_reg_n_0_[1][26] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][27] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\regfile_reg_n_0_[1][27] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][28] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\regfile_reg_n_0_[1][28] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][29] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\regfile_reg_n_0_[1][29] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][2] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\regfile_reg_n_0_[1][2] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][30] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\regfile_reg_n_0_[1][30] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][31] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\regfile_reg_n_0_[1][31] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][3] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\regfile_reg_n_0_[1][3] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][4] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\regfile_reg_n_0_[1][4] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][5] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\regfile_reg_n_0_[1][5] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][6] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\regfile_reg_n_0_[1][6] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][7] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\regfile_reg_n_0_[1][7] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][8] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\regfile_reg_n_0_[1][8] ),
        .R(p_18_in));
  FDRE \regfile_reg[1][9] 
       (.C(s00_axi_aclk),
        .CE(\regfile[1][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\regfile_reg_n_0_[1][9] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][0] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\regfile_reg_n_0_[2][0] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][10] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\regfile_reg_n_0_[2][10] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][11] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\regfile_reg_n_0_[2][11] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][12] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\regfile_reg_n_0_[2][12] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][13] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\regfile_reg_n_0_[2][13] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][14] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\regfile_reg_n_0_[2][14] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][15] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\regfile_reg_n_0_[2][15] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][16] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\regfile_reg_n_0_[2][16] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][17] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\regfile_reg_n_0_[2][17] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][18] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\regfile_reg_n_0_[2][18] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][19] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\regfile_reg_n_0_[2][19] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][1] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\regfile_reg_n_0_[2][1] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][20] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\regfile_reg_n_0_[2][20] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][21] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\regfile_reg_n_0_[2][21] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][22] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\regfile_reg_n_0_[2][22] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][23] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\regfile_reg_n_0_[2][23] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][24] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\regfile_reg_n_0_[2][24] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][25] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\regfile_reg_n_0_[2][25] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][26] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\regfile_reg_n_0_[2][26] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][27] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\regfile_reg_n_0_[2][27] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][28] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\regfile_reg_n_0_[2][28] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][29] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\regfile_reg_n_0_[2][29] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][2] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\regfile_reg_n_0_[2][2] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][30] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\regfile_reg_n_0_[2][30] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][31] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\regfile_reg_n_0_[2][31] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][3] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\regfile_reg_n_0_[2][3] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][4] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\regfile_reg_n_0_[2][4] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][5] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\regfile_reg_n_0_[2][5] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][6] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\regfile_reg_n_0_[2][6] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][7] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\regfile_reg_n_0_[2][7] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][8] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\regfile_reg_n_0_[2][8] ),
        .R(p_18_in));
  FDRE \regfile_reg[2][9] 
       (.C(s00_axi_aclk),
        .CE(\regfile[2][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\regfile_reg_n_0_[2][9] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][0] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\regfile_reg_n_0_[3][0] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][10] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\regfile_reg_n_0_[3][10] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][11] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\regfile_reg_n_0_[3][11] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][12] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\regfile_reg_n_0_[3][12] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][13] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\regfile_reg_n_0_[3][13] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][14] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\regfile_reg_n_0_[3][14] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][15] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\regfile_reg_n_0_[3][15] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][16] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\regfile_reg_n_0_[3][16] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][17] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\regfile_reg_n_0_[3][17] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][18] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\regfile_reg_n_0_[3][18] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][19] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\regfile_reg_n_0_[3][19] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][1] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\regfile_reg_n_0_[3][1] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][20] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\regfile_reg_n_0_[3][20] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][21] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\regfile_reg_n_0_[3][21] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][22] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\regfile_reg_n_0_[3][22] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][23] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\regfile_reg_n_0_[3][23] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][24] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\regfile_reg_n_0_[3][24] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][25] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\regfile_reg_n_0_[3][25] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][26] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\regfile_reg_n_0_[3][26] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][27] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\regfile_reg_n_0_[3][27] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][28] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\regfile_reg_n_0_[3][28] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][29] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\regfile_reg_n_0_[3][29] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][2] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\regfile_reg_n_0_[3][2] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][30] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\regfile_reg_n_0_[3][30] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][31] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\regfile_reg_n_0_[3][31] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][3] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\regfile_reg_n_0_[3][3] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][4] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\regfile_reg_n_0_[3][4] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][5] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\regfile_reg_n_0_[3][5] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][6] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\regfile_reg_n_0_[3][6] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][7] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\regfile_reg_n_0_[3][7] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][8] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\regfile_reg_n_0_[3][8] ),
        .R(p_18_in));
  FDRE \regfile_reg[3][9] 
       (.C(s00_axi_aclk),
        .CE(\regfile[3][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\regfile_reg_n_0_[3][9] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][0] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\regfile_reg_n_0_[4][0] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][10] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\regfile_reg_n_0_[4][10] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][11] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\regfile_reg_n_0_[4][11] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][12] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\regfile_reg_n_0_[4][12] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][13] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\regfile_reg_n_0_[4][13] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][14] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\regfile_reg_n_0_[4][14] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][15] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\regfile_reg_n_0_[4][15] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][16] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\regfile_reg_n_0_[4][16] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][17] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\regfile_reg_n_0_[4][17] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][18] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\regfile_reg_n_0_[4][18] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][19] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\regfile_reg_n_0_[4][19] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][1] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\regfile_reg_n_0_[4][1] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][20] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\regfile_reg_n_0_[4][20] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][21] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\regfile_reg_n_0_[4][21] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][22] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\regfile_reg_n_0_[4][22] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][23] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\regfile_reg_n_0_[4][23] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][24] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\regfile_reg_n_0_[4][24] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][25] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\regfile_reg_n_0_[4][25] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][26] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\regfile_reg_n_0_[4][26] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][27] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\regfile_reg_n_0_[4][27] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][28] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\regfile_reg_n_0_[4][28] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][29] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\regfile_reg_n_0_[4][29] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][2] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\regfile_reg_n_0_[4][2] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][30] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\regfile_reg_n_0_[4][30] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][31] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\regfile_reg_n_0_[4][31] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][3] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\regfile_reg_n_0_[4][3] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][4] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\regfile_reg_n_0_[4][4] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][5] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\regfile_reg_n_0_[4][5] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][6] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\regfile_reg_n_0_[4][6] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][7] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\regfile_reg_n_0_[4][7] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][8] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\regfile_reg_n_0_[4][8] ),
        .R(p_18_in));
  FDRE \regfile_reg[4][9] 
       (.C(s00_axi_aclk),
        .CE(\regfile[4][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\regfile_reg_n_0_[4][9] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][0] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\regfile_reg_n_0_[5][0] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][10] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\regfile_reg_n_0_[5][10] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][11] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\regfile_reg_n_0_[5][11] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][12] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\regfile_reg_n_0_[5][12] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][13] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\regfile_reg_n_0_[5][13] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][14] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\regfile_reg_n_0_[5][14] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][15] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\regfile_reg_n_0_[5][15] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][16] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\regfile_reg_n_0_[5][16] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][17] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\regfile_reg_n_0_[5][17] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][18] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\regfile_reg_n_0_[5][18] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][19] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\regfile_reg_n_0_[5][19] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][1] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\regfile_reg_n_0_[5][1] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][20] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\regfile_reg_n_0_[5][20] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][21] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\regfile_reg_n_0_[5][21] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][22] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\regfile_reg_n_0_[5][22] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][23] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\regfile_reg_n_0_[5][23] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][24] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\regfile_reg_n_0_[5][24] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][25] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\regfile_reg_n_0_[5][25] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][26] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\regfile_reg_n_0_[5][26] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][27] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\regfile_reg_n_0_[5][27] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][28] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\regfile_reg_n_0_[5][28] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][29] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\regfile_reg_n_0_[5][29] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][2] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\regfile_reg_n_0_[5][2] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][30] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\regfile_reg_n_0_[5][30] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][31] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\regfile_reg_n_0_[5][31] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][3] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\regfile_reg_n_0_[5][3] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][4] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\regfile_reg_n_0_[5][4] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][5] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\regfile_reg_n_0_[5][5] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][6] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\regfile_reg_n_0_[5][6] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][7] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\regfile_reg_n_0_[5][7] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][8] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\regfile_reg_n_0_[5][8] ),
        .R(p_18_in));
  FDRE \regfile_reg[5][9] 
       (.C(s00_axi_aclk),
        .CE(\regfile[5][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\regfile_reg_n_0_[5][9] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][0] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\regfile_reg_n_0_[6][0] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][10] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\regfile_reg_n_0_[6][10] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][11] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\regfile_reg_n_0_[6][11] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][12] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\regfile_reg_n_0_[6][12] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][13] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\regfile_reg_n_0_[6][13] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][14] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\regfile_reg_n_0_[6][14] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][15] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\regfile_reg_n_0_[6][15] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][16] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\regfile_reg_n_0_[6][16] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][17] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\regfile_reg_n_0_[6][17] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][18] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\regfile_reg_n_0_[6][18] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][19] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\regfile_reg_n_0_[6][19] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][1] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\regfile_reg_n_0_[6][1] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][20] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\regfile_reg_n_0_[6][20] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][21] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\regfile_reg_n_0_[6][21] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][22] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\regfile_reg_n_0_[6][22] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][23] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\regfile_reg_n_0_[6][23] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][24] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\regfile_reg_n_0_[6][24] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][25] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\regfile_reg_n_0_[6][25] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][26] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\regfile_reg_n_0_[6][26] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][27] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\regfile_reg_n_0_[6][27] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][28] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\regfile_reg_n_0_[6][28] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][29] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\regfile_reg_n_0_[6][29] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][2] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\regfile_reg_n_0_[6][2] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][30] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\regfile_reg_n_0_[6][30] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][31] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\regfile_reg_n_0_[6][31] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][3] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\regfile_reg_n_0_[6][3] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][4] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\regfile_reg_n_0_[6][4] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][5] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\regfile_reg_n_0_[6][5] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][6] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\regfile_reg_n_0_[6][6] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][7] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\regfile_reg_n_0_[6][7] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][8] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\regfile_reg_n_0_[6][8] ),
        .R(p_18_in));
  FDRE \regfile_reg[6][9] 
       (.C(s00_axi_aclk),
        .CE(\regfile[6][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\regfile_reg_n_0_[6][9] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][0] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\regfile_reg_n_0_[7][0] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][10] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\regfile_reg_n_0_[7][10] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][11] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\regfile_reg_n_0_[7][11] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][12] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\regfile_reg_n_0_[7][12] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][13] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\regfile_reg_n_0_[7][13] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][14] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\regfile_reg_n_0_[7][14] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][15] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\regfile_reg_n_0_[7][15] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][16] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\regfile_reg_n_0_[7][16] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][17] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\regfile_reg_n_0_[7][17] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][18] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\regfile_reg_n_0_[7][18] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][19] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\regfile_reg_n_0_[7][19] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][1] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\regfile_reg_n_0_[7][1] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][20] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\regfile_reg_n_0_[7][20] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][21] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\regfile_reg_n_0_[7][21] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][22] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\regfile_reg_n_0_[7][22] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][23] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\regfile_reg_n_0_[7][23] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][24] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\regfile_reg_n_0_[7][24] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][25] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\regfile_reg_n_0_[7][25] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][26] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\regfile_reg_n_0_[7][26] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][27] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\regfile_reg_n_0_[7][27] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][28] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\regfile_reg_n_0_[7][28] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][29] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\regfile_reg_n_0_[7][29] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][2] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\regfile_reg_n_0_[7][2] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][30] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\regfile_reg_n_0_[7][30] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][31] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\regfile_reg_n_0_[7][31] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][3] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\regfile_reg_n_0_[7][3] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][4] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\regfile_reg_n_0_[7][4] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][5] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\regfile_reg_n_0_[7][5] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][6] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\regfile_reg_n_0_[7][6] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][7] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\regfile_reg_n_0_[7][7] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][8] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\regfile_reg_n_0_[7][8] ),
        .R(p_18_in));
  FDRE \regfile_reg[7][9] 
       (.C(s00_axi_aclk),
        .CE(\regfile[7][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\regfile_reg_n_0_[7][9] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][0] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\regfile_reg_n_0_[8][0] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][10] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\regfile_reg_n_0_[8][10] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][11] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\regfile_reg_n_0_[8][11] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][12] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\regfile_reg_n_0_[8][12] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][13] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\regfile_reg_n_0_[8][13] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][14] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\regfile_reg_n_0_[8][14] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][15] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\regfile_reg_n_0_[8][15] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][16] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\regfile_reg_n_0_[8][16] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][17] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\regfile_reg_n_0_[8][17] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][18] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\regfile_reg_n_0_[8][18] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][19] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\regfile_reg_n_0_[8][19] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][1] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\regfile_reg_n_0_[8][1] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][20] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\regfile_reg_n_0_[8][20] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][21] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\regfile_reg_n_0_[8][21] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][22] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\regfile_reg_n_0_[8][22] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][23] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\regfile_reg_n_0_[8][23] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][24] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\regfile_reg_n_0_[8][24] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][25] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\regfile_reg_n_0_[8][25] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][26] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\regfile_reg_n_0_[8][26] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][27] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\regfile_reg_n_0_[8][27] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][28] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\regfile_reg_n_0_[8][28] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][29] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\regfile_reg_n_0_[8][29] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][2] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\regfile_reg_n_0_[8][2] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][30] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\regfile_reg_n_0_[8][30] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][31] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\regfile_reg_n_0_[8][31] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][3] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\regfile_reg_n_0_[8][3] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][4] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\regfile_reg_n_0_[8][4] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][5] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\regfile_reg_n_0_[8][5] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][6] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\regfile_reg_n_0_[8][6] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][7] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\regfile_reg_n_0_[8][7] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][8] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\regfile_reg_n_0_[8][8] ),
        .R(p_18_in));
  FDRE \regfile_reg[8][9] 
       (.C(s00_axi_aclk),
        .CE(\regfile[8][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\regfile_reg_n_0_[8][9] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][0] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\regfile_reg_n_0_[9][0] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][10] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\regfile_reg_n_0_[9][10] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][11] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\regfile_reg_n_0_[9][11] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][12] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\regfile_reg_n_0_[9][12] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][13] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\regfile_reg_n_0_[9][13] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][14] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\regfile_reg_n_0_[9][14] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][15] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\regfile_reg_n_0_[9][15] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][16] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\regfile_reg_n_0_[9][16] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][17] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\regfile_reg_n_0_[9][17] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][18] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\regfile_reg_n_0_[9][18] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][19] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\regfile_reg_n_0_[9][19] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][1] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\regfile_reg_n_0_[9][1] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][20] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\regfile_reg_n_0_[9][20] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][21] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\regfile_reg_n_0_[9][21] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][22] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\regfile_reg_n_0_[9][22] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][23] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\regfile_reg_n_0_[9][23] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][24] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\regfile_reg_n_0_[9][24] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][25] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\regfile_reg_n_0_[9][25] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][26] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\regfile_reg_n_0_[9][26] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][27] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\regfile_reg_n_0_[9][27] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][28] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\regfile_reg_n_0_[9][28] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][29] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\regfile_reg_n_0_[9][29] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][2] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\regfile_reg_n_0_[9][2] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][30] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\regfile_reg_n_0_[9][30] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][31] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\regfile_reg_n_0_[9][31] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][3] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\regfile_reg_n_0_[9][3] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][4] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\regfile_reg_n_0_[9][4] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][5] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\regfile_reg_n_0_[9][5] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][6] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\regfile_reg_n_0_[9][6] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][7] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\regfile_reg_n_0_[9][7] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][8] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\regfile_reg_n_0_[9][8] ),
        .R(p_18_in));
  FDRE \regfile_reg[9][9] 
       (.C(s00_axi_aclk),
        .CE(\regfile[9][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\regfile_reg_n_0_[9][9] ),
        .R(p_18_in));
  LUT2 #(
    .INIT(4'hE)) 
    rvalid_i_1
       (.I0(s00_axi_arvalid),
        .I1(rvalid_reg_0),
        .O(rvalid_i_1_n_0));
  FDRE rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(rvalid_i_1_n_0),
        .Q(rvalid_reg_0),
        .R(s00_axi_arready_i_1_n_0));
  LUT3 #(
    .INIT(8'h8F)) 
    s00_axi_arready_i_1
       (.I0(s00_axi_rready),
        .I1(rvalid_reg_0),
        .I2(s00_axi_aresetn),
        .O(s00_axi_arready_i_1_n_0));
  FDRE s00_axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(s00_axi_arvalid),
        .Q(s00_axi_arready),
        .R(s00_axi_arready_i_1_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[0]_i_4 
       (.I0(\regfile_reg_n_0_[3][0] ),
        .I1(\regfile_reg_n_0_[2][0] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][0] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][0] ),
        .O(\s00_axi_rdata[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[0]_i_5 
       (.I0(\regfile_reg_n_0_[7][0] ),
        .I1(\regfile_reg_n_0_[6][0] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][0] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][0] ),
        .O(\s00_axi_rdata[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[0]_i_6 
       (.I0(\regfile_reg_n_0_[11][0] ),
        .I1(\regfile_reg_n_0_[10][0] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][0] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][0] ),
        .O(\s00_axi_rdata[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[0]_i_7 
       (.I0(\regfile_reg_n_0_[15][0] ),
        .I1(\regfile_reg_n_0_[14][0] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][0] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][0] ),
        .O(\s00_axi_rdata[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[10]_i_4 
       (.I0(\regfile_reg_n_0_[3][10] ),
        .I1(\regfile_reg_n_0_[2][10] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][10] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][10] ),
        .O(\s00_axi_rdata[10]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[10]_i_5 
       (.I0(\regfile_reg_n_0_[7][10] ),
        .I1(\regfile_reg_n_0_[6][10] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][10] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][10] ),
        .O(\s00_axi_rdata[10]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[10]_i_6 
       (.I0(\regfile_reg_n_0_[11][10] ),
        .I1(\regfile_reg_n_0_[10][10] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][10] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][10] ),
        .O(\s00_axi_rdata[10]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[10]_i_7 
       (.I0(\regfile_reg_n_0_[15][10] ),
        .I1(\regfile_reg_n_0_[14][10] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][10] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][10] ),
        .O(\s00_axi_rdata[10]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[11]_i_4 
       (.I0(\regfile_reg_n_0_[3][11] ),
        .I1(\regfile_reg_n_0_[2][11] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][11] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][11] ),
        .O(\s00_axi_rdata[11]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[11]_i_5 
       (.I0(\regfile_reg_n_0_[7][11] ),
        .I1(\regfile_reg_n_0_[6][11] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][11] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][11] ),
        .O(\s00_axi_rdata[11]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[11]_i_6 
       (.I0(\regfile_reg_n_0_[11][11] ),
        .I1(\regfile_reg_n_0_[10][11] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][11] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][11] ),
        .O(\s00_axi_rdata[11]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[11]_i_7 
       (.I0(\regfile_reg_n_0_[15][11] ),
        .I1(\regfile_reg_n_0_[14][11] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][11] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][11] ),
        .O(\s00_axi_rdata[11]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \s00_axi_rdata[12]_i_2 
       (.I0(s00_axi_araddr[0]),
        .I1(s00_axi_araddr[1]),
        .I2(s00_axi_araddr[2]),
        .I3(s00_axi_araddr[3]),
        .O(\s00_axi_rdata[12]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT4 #(
    .INIT(16'hFF7F)) 
    \s00_axi_rdata[12]_i_3 
       (.I0(s00_axi_araddr[3]),
        .I1(s00_axi_araddr[2]),
        .I2(s00_axi_araddr[1]),
        .I3(s00_axi_araddr[0]),
        .O(\s00_axi_rdata[12]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[12]_i_6 
       (.I0(\regfile_reg_n_0_[3][12] ),
        .I1(\regfile_reg_n_0_[2][12] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][12] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][12] ),
        .O(\s00_axi_rdata[12]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[12]_i_7 
       (.I0(\regfile_reg_n_0_[7][12] ),
        .I1(\regfile_reg_n_0_[6][12] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][12] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][12] ),
        .O(\s00_axi_rdata[12]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[12]_i_8 
       (.I0(\regfile_reg_n_0_[11][12] ),
        .I1(\regfile_reg_n_0_[10][12] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][12] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][12] ),
        .O(\s00_axi_rdata[12]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[12]_i_9 
       (.I0(\regfile_reg_n_0_[15][12] ),
        .I1(\regfile_reg_n_0_[14][12] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][12] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][12] ),
        .O(\s00_axi_rdata[12]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h7F552A00)) 
    \s00_axi_rdata[13]_i_1 
       (.I0(s00_axi_araddr[3]),
        .I1(s00_axi_araddr[2]),
        .I2(s00_axi_araddr[1]),
        .I3(\s00_axi_rdata_reg[13]_i_2_n_0 ),
        .I4(\s00_axi_rdata_reg[13]_i_3_n_0 ),
        .O(\s00_axi_rdata[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[13]_i_4 
       (.I0(\regfile_reg_n_0_[11][13] ),
        .I1(\regfile_reg_n_0_[10][13] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][13] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][13] ),
        .O(\s00_axi_rdata[13]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[13]_i_5 
       (.I0(\regfile_reg_n_0_[15][13] ),
        .I1(\regfile_reg_n_0_[14][13] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][13] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][13] ),
        .O(\s00_axi_rdata[13]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[13]_i_6 
       (.I0(\regfile_reg_n_0_[3][13] ),
        .I1(\regfile_reg_n_0_[2][13] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][13] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][13] ),
        .O(\s00_axi_rdata[13]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[13]_i_7 
       (.I0(\regfile_reg_n_0_[7][13] ),
        .I1(\regfile_reg_n_0_[6][13] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][13] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][13] ),
        .O(\s00_axi_rdata[13]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h7F552A00)) 
    \s00_axi_rdata[14]_i_1 
       (.I0(s00_axi_araddr[3]),
        .I1(s00_axi_araddr[2]),
        .I2(s00_axi_araddr[1]),
        .I3(\s00_axi_rdata_reg[14]_i_2_n_0 ),
        .I4(\s00_axi_rdata_reg[14]_i_3_n_0 ),
        .O(\s00_axi_rdata[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[14]_i_4 
       (.I0(\regfile_reg_n_0_[11][14] ),
        .I1(\regfile_reg_n_0_[10][14] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][14] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][14] ),
        .O(\s00_axi_rdata[14]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[14]_i_5 
       (.I0(\regfile_reg_n_0_[15][14] ),
        .I1(\regfile_reg_n_0_[14][14] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][14] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][14] ),
        .O(\s00_axi_rdata[14]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[14]_i_6 
       (.I0(\regfile_reg_n_0_[3][14] ),
        .I1(\regfile_reg_n_0_[2][14] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][14] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][14] ),
        .O(\s00_axi_rdata[14]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[14]_i_7 
       (.I0(\regfile_reg_n_0_[7][14] ),
        .I1(\regfile_reg_n_0_[6][14] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][14] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][14] ),
        .O(\s00_axi_rdata[14]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h7F552A00)) 
    \s00_axi_rdata[15]_i_1 
       (.I0(s00_axi_araddr[3]),
        .I1(s00_axi_araddr[2]),
        .I2(s00_axi_araddr[1]),
        .I3(\s00_axi_rdata_reg[15]_i_2_n_0 ),
        .I4(\s00_axi_rdata_reg[15]_i_3_n_0 ),
        .O(\s00_axi_rdata[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[15]_i_4 
       (.I0(\regfile_reg_n_0_[11][15] ),
        .I1(\regfile_reg_n_0_[10][15] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][15] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][15] ),
        .O(\s00_axi_rdata[15]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[15]_i_5 
       (.I0(\regfile_reg_n_0_[15][15] ),
        .I1(\regfile_reg_n_0_[14][15] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][15] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][15] ),
        .O(\s00_axi_rdata[15]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[15]_i_6 
       (.I0(\regfile_reg_n_0_[3][15] ),
        .I1(\regfile_reg_n_0_[2][15] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][15] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][15] ),
        .O(\s00_axi_rdata[15]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[15]_i_7 
       (.I0(\regfile_reg_n_0_[7][15] ),
        .I1(\regfile_reg_n_0_[6][15] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][15] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][15] ),
        .O(\s00_axi_rdata[15]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h7F552A00)) 
    \s00_axi_rdata[16]_i_1 
       (.I0(s00_axi_araddr[3]),
        .I1(s00_axi_araddr[2]),
        .I2(s00_axi_araddr[1]),
        .I3(\s00_axi_rdata_reg[16]_i_2_n_0 ),
        .I4(\s00_axi_rdata_reg[16]_i_3_n_0 ),
        .O(\s00_axi_rdata[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[16]_i_4 
       (.I0(\regfile_reg_n_0_[11][16] ),
        .I1(\regfile_reg_n_0_[10][16] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][16] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][16] ),
        .O(\s00_axi_rdata[16]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[16]_i_5 
       (.I0(\regfile_reg_n_0_[15][16] ),
        .I1(\regfile_reg_n_0_[14][16] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][16] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][16] ),
        .O(\s00_axi_rdata[16]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[16]_i_6 
       (.I0(\regfile_reg_n_0_[3][16] ),
        .I1(\regfile_reg_n_0_[2][16] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][16] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][16] ),
        .O(\s00_axi_rdata[16]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[16]_i_7 
       (.I0(\regfile_reg_n_0_[7][16] ),
        .I1(\regfile_reg_n_0_[6][16] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][16] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][16] ),
        .O(\s00_axi_rdata[16]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h7F552A00)) 
    \s00_axi_rdata[17]_i_1 
       (.I0(s00_axi_araddr[3]),
        .I1(s00_axi_araddr[2]),
        .I2(s00_axi_araddr[1]),
        .I3(\s00_axi_rdata_reg[17]_i_2_n_0 ),
        .I4(\s00_axi_rdata_reg[17]_i_3_n_0 ),
        .O(\s00_axi_rdata[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[17]_i_4 
       (.I0(\regfile_reg_n_0_[11][17] ),
        .I1(\regfile_reg_n_0_[10][17] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][17] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][17] ),
        .O(\s00_axi_rdata[17]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[17]_i_5 
       (.I0(\regfile_reg_n_0_[15][17] ),
        .I1(\regfile_reg_n_0_[14][17] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][17] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][17] ),
        .O(\s00_axi_rdata[17]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[17]_i_6 
       (.I0(\regfile_reg_n_0_[3][17] ),
        .I1(\regfile_reg_n_0_[2][17] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][17] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][17] ),
        .O(\s00_axi_rdata[17]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[17]_i_7 
       (.I0(\regfile_reg_n_0_[7][17] ),
        .I1(\regfile_reg_n_0_[6][17] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][17] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][17] ),
        .O(\s00_axi_rdata[17]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h7F552A00)) 
    \s00_axi_rdata[18]_i_1 
       (.I0(s00_axi_araddr[3]),
        .I1(s00_axi_araddr[2]),
        .I2(s00_axi_araddr[1]),
        .I3(\s00_axi_rdata_reg[18]_i_2_n_0 ),
        .I4(\s00_axi_rdata_reg[18]_i_3_n_0 ),
        .O(\s00_axi_rdata[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[18]_i_4 
       (.I0(\regfile_reg_n_0_[11][18] ),
        .I1(\regfile_reg_n_0_[10][18] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][18] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][18] ),
        .O(\s00_axi_rdata[18]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[18]_i_5 
       (.I0(\regfile_reg_n_0_[15][18] ),
        .I1(\regfile_reg_n_0_[14][18] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][18] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][18] ),
        .O(\s00_axi_rdata[18]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[18]_i_6 
       (.I0(\regfile_reg_n_0_[3][18] ),
        .I1(\regfile_reg_n_0_[2][18] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][18] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][18] ),
        .O(\s00_axi_rdata[18]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[18]_i_7 
       (.I0(\regfile_reg_n_0_[7][18] ),
        .I1(\regfile_reg_n_0_[6][18] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][18] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][18] ),
        .O(\s00_axi_rdata[18]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h7F552A00)) 
    \s00_axi_rdata[19]_i_1 
       (.I0(s00_axi_araddr[3]),
        .I1(s00_axi_araddr[2]),
        .I2(s00_axi_araddr[1]),
        .I3(\s00_axi_rdata_reg[19]_i_2_n_0 ),
        .I4(\s00_axi_rdata_reg[19]_i_3_n_0 ),
        .O(\s00_axi_rdata[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[19]_i_4 
       (.I0(\regfile_reg_n_0_[11][19] ),
        .I1(\regfile_reg_n_0_[10][19] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][19] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][19] ),
        .O(\s00_axi_rdata[19]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[19]_i_5 
       (.I0(\regfile_reg_n_0_[15][19] ),
        .I1(\regfile_reg_n_0_[14][19] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][19] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][19] ),
        .O(\s00_axi_rdata[19]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[19]_i_6 
       (.I0(\regfile_reg_n_0_[3][19] ),
        .I1(\regfile_reg_n_0_[2][19] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][19] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][19] ),
        .O(\s00_axi_rdata[19]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[19]_i_7 
       (.I0(\regfile_reg_n_0_[7][19] ),
        .I1(\regfile_reg_n_0_[6][19] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][19] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][19] ),
        .O(\s00_axi_rdata[19]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[1]_i_4 
       (.I0(\regfile_reg_n_0_[3][1] ),
        .I1(\regfile_reg_n_0_[2][1] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][1] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][1] ),
        .O(\s00_axi_rdata[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[1]_i_5 
       (.I0(\regfile_reg_n_0_[7][1] ),
        .I1(\regfile_reg_n_0_[6][1] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][1] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][1] ),
        .O(\s00_axi_rdata[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[1]_i_6 
       (.I0(\regfile_reg_n_0_[11][1] ),
        .I1(\regfile_reg_n_0_[10][1] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][1] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][1] ),
        .O(\s00_axi_rdata[1]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[1]_i_7 
       (.I0(\regfile_reg_n_0_[15][1] ),
        .I1(\regfile_reg_n_0_[14][1] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][1] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][1] ),
        .O(\s00_axi_rdata[1]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h7F552A00)) 
    \s00_axi_rdata[20]_i_1 
       (.I0(s00_axi_araddr[3]),
        .I1(s00_axi_araddr[2]),
        .I2(s00_axi_araddr[1]),
        .I3(\s00_axi_rdata_reg[20]_i_2_n_0 ),
        .I4(\s00_axi_rdata_reg[20]_i_3_n_0 ),
        .O(\s00_axi_rdata[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[20]_i_4 
       (.I0(\regfile_reg_n_0_[11][20] ),
        .I1(\regfile_reg_n_0_[10][20] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][20] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][20] ),
        .O(\s00_axi_rdata[20]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[20]_i_5 
       (.I0(\regfile_reg_n_0_[15][20] ),
        .I1(\regfile_reg_n_0_[14][20] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][20] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][20] ),
        .O(\s00_axi_rdata[20]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[20]_i_6 
       (.I0(\regfile_reg_n_0_[3][20] ),
        .I1(\regfile_reg_n_0_[2][20] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][20] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][20] ),
        .O(\s00_axi_rdata[20]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[20]_i_7 
       (.I0(\regfile_reg_n_0_[7][20] ),
        .I1(\regfile_reg_n_0_[6][20] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][20] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][20] ),
        .O(\s00_axi_rdata[20]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h7F552A00)) 
    \s00_axi_rdata[21]_i_1 
       (.I0(s00_axi_araddr[3]),
        .I1(s00_axi_araddr[2]),
        .I2(s00_axi_araddr[1]),
        .I3(\s00_axi_rdata_reg[21]_i_2_n_0 ),
        .I4(\s00_axi_rdata_reg[21]_i_3_n_0 ),
        .O(\s00_axi_rdata[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[21]_i_4 
       (.I0(\regfile_reg_n_0_[11][21] ),
        .I1(\regfile_reg_n_0_[10][21] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][21] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][21] ),
        .O(\s00_axi_rdata[21]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[21]_i_5 
       (.I0(\regfile_reg_n_0_[15][21] ),
        .I1(\regfile_reg_n_0_[14][21] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][21] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][21] ),
        .O(\s00_axi_rdata[21]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[21]_i_6 
       (.I0(\regfile_reg_n_0_[3][21] ),
        .I1(\regfile_reg_n_0_[2][21] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][21] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][21] ),
        .O(\s00_axi_rdata[21]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[21]_i_7 
       (.I0(\regfile_reg_n_0_[7][21] ),
        .I1(\regfile_reg_n_0_[6][21] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][21] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][21] ),
        .O(\s00_axi_rdata[21]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h7F552A00)) 
    \s00_axi_rdata[22]_i_1 
       (.I0(s00_axi_araddr[3]),
        .I1(s00_axi_araddr[2]),
        .I2(s00_axi_araddr[1]),
        .I3(\s00_axi_rdata_reg[22]_i_2_n_0 ),
        .I4(\s00_axi_rdata_reg[22]_i_3_n_0 ),
        .O(\s00_axi_rdata[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[22]_i_4 
       (.I0(\regfile_reg_n_0_[11][22] ),
        .I1(\regfile_reg_n_0_[10][22] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][22] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][22] ),
        .O(\s00_axi_rdata[22]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[22]_i_5 
       (.I0(\regfile_reg_n_0_[15][22] ),
        .I1(\regfile_reg_n_0_[14][22] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][22] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][22] ),
        .O(\s00_axi_rdata[22]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[22]_i_6 
       (.I0(\regfile_reg_n_0_[3][22] ),
        .I1(\regfile_reg_n_0_[2][22] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][22] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][22] ),
        .O(\s00_axi_rdata[22]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[22]_i_7 
       (.I0(\regfile_reg_n_0_[7][22] ),
        .I1(\regfile_reg_n_0_[6][22] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][22] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][22] ),
        .O(\s00_axi_rdata[22]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h7F552A00)) 
    \s00_axi_rdata[23]_i_1 
       (.I0(s00_axi_araddr[3]),
        .I1(s00_axi_araddr[2]),
        .I2(s00_axi_araddr[1]),
        .I3(\s00_axi_rdata_reg[23]_i_2_n_0 ),
        .I4(\s00_axi_rdata_reg[23]_i_3_n_0 ),
        .O(\s00_axi_rdata[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[23]_i_4 
       (.I0(\regfile_reg_n_0_[11][23] ),
        .I1(\regfile_reg_n_0_[10][23] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][23] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][23] ),
        .O(\s00_axi_rdata[23]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[23]_i_5 
       (.I0(\regfile_reg_n_0_[15][23] ),
        .I1(\regfile_reg_n_0_[14][23] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][23] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][23] ),
        .O(\s00_axi_rdata[23]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[23]_i_6 
       (.I0(\regfile_reg_n_0_[3][23] ),
        .I1(\regfile_reg_n_0_[2][23] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][23] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][23] ),
        .O(\s00_axi_rdata[23]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[23]_i_7 
       (.I0(\regfile_reg_n_0_[7][23] ),
        .I1(\regfile_reg_n_0_[6][23] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][23] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][23] ),
        .O(\s00_axi_rdata[23]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h7F552A00)) 
    \s00_axi_rdata[24]_i_1 
       (.I0(s00_axi_araddr[3]),
        .I1(s00_axi_araddr[2]),
        .I2(s00_axi_araddr[1]),
        .I3(\s00_axi_rdata_reg[24]_i_2_n_0 ),
        .I4(\s00_axi_rdata_reg[24]_i_3_n_0 ),
        .O(\s00_axi_rdata[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[24]_i_4 
       (.I0(\regfile_reg_n_0_[11][24] ),
        .I1(\regfile_reg_n_0_[10][24] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][24] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][24] ),
        .O(\s00_axi_rdata[24]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[24]_i_5 
       (.I0(\regfile_reg_n_0_[15][24] ),
        .I1(\regfile_reg_n_0_[14][24] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][24] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][24] ),
        .O(\s00_axi_rdata[24]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[24]_i_6 
       (.I0(\regfile_reg_n_0_[3][24] ),
        .I1(\regfile_reg_n_0_[2][24] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][24] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][24] ),
        .O(\s00_axi_rdata[24]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[24]_i_7 
       (.I0(\regfile_reg_n_0_[7][24] ),
        .I1(\regfile_reg_n_0_[6][24] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][24] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][24] ),
        .O(\s00_axi_rdata[24]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h7F552A00)) 
    \s00_axi_rdata[25]_i_1 
       (.I0(s00_axi_araddr[3]),
        .I1(s00_axi_araddr[2]),
        .I2(s00_axi_araddr[1]),
        .I3(\s00_axi_rdata_reg[25]_i_2_n_0 ),
        .I4(\s00_axi_rdata_reg[25]_i_3_n_0 ),
        .O(\s00_axi_rdata[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[25]_i_4 
       (.I0(\regfile_reg_n_0_[11][25] ),
        .I1(\regfile_reg_n_0_[10][25] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][25] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][25] ),
        .O(\s00_axi_rdata[25]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[25]_i_5 
       (.I0(\regfile_reg_n_0_[15][25] ),
        .I1(\regfile_reg_n_0_[14][25] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][25] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][25] ),
        .O(\s00_axi_rdata[25]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[25]_i_6 
       (.I0(\regfile_reg_n_0_[3][25] ),
        .I1(\regfile_reg_n_0_[2][25] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][25] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][25] ),
        .O(\s00_axi_rdata[25]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[25]_i_7 
       (.I0(\regfile_reg_n_0_[7][25] ),
        .I1(\regfile_reg_n_0_[6][25] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][25] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][25] ),
        .O(\s00_axi_rdata[25]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h7F552A00)) 
    \s00_axi_rdata[26]_i_1 
       (.I0(s00_axi_araddr[3]),
        .I1(s00_axi_araddr[2]),
        .I2(s00_axi_araddr[1]),
        .I3(\s00_axi_rdata_reg[26]_i_2_n_0 ),
        .I4(\s00_axi_rdata_reg[26]_i_3_n_0 ),
        .O(\s00_axi_rdata[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[26]_i_4 
       (.I0(\regfile_reg_n_0_[11][26] ),
        .I1(\regfile_reg_n_0_[10][26] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][26] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][26] ),
        .O(\s00_axi_rdata[26]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[26]_i_5 
       (.I0(\regfile_reg_n_0_[15][26] ),
        .I1(\regfile_reg_n_0_[14][26] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][26] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][26] ),
        .O(\s00_axi_rdata[26]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[26]_i_6 
       (.I0(\regfile_reg_n_0_[3][26] ),
        .I1(\regfile_reg_n_0_[2][26] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][26] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][26] ),
        .O(\s00_axi_rdata[26]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[26]_i_7 
       (.I0(\regfile_reg_n_0_[7][26] ),
        .I1(\regfile_reg_n_0_[6][26] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][26] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][26] ),
        .O(\s00_axi_rdata[26]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h7F552A00)) 
    \s00_axi_rdata[27]_i_1 
       (.I0(s00_axi_araddr[3]),
        .I1(s00_axi_araddr[2]),
        .I2(s00_axi_araddr[1]),
        .I3(\s00_axi_rdata_reg[27]_i_2_n_0 ),
        .I4(\s00_axi_rdata_reg[27]_i_3_n_0 ),
        .O(\s00_axi_rdata[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[27]_i_4 
       (.I0(\regfile_reg_n_0_[11][27] ),
        .I1(\regfile_reg_n_0_[10][27] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][27] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][27] ),
        .O(\s00_axi_rdata[27]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[27]_i_5 
       (.I0(\regfile_reg_n_0_[15][27] ),
        .I1(\regfile_reg_n_0_[14][27] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][27] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][27] ),
        .O(\s00_axi_rdata[27]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[27]_i_6 
       (.I0(\regfile_reg_n_0_[3][27] ),
        .I1(\regfile_reg_n_0_[2][27] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][27] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][27] ),
        .O(\s00_axi_rdata[27]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[27]_i_7 
       (.I0(\regfile_reg_n_0_[7][27] ),
        .I1(\regfile_reg_n_0_[6][27] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][27] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][27] ),
        .O(\s00_axi_rdata[27]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h7F552A00)) 
    \s00_axi_rdata[28]_i_1 
       (.I0(s00_axi_araddr[3]),
        .I1(s00_axi_araddr[2]),
        .I2(s00_axi_araddr[1]),
        .I3(\s00_axi_rdata_reg[28]_i_2_n_0 ),
        .I4(\s00_axi_rdata_reg[28]_i_3_n_0 ),
        .O(\s00_axi_rdata[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[28]_i_4 
       (.I0(\regfile_reg_n_0_[11][28] ),
        .I1(\regfile_reg_n_0_[10][28] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][28] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][28] ),
        .O(\s00_axi_rdata[28]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[28]_i_5 
       (.I0(\regfile_reg_n_0_[15][28] ),
        .I1(\regfile_reg_n_0_[14][28] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][28] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][28] ),
        .O(\s00_axi_rdata[28]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[28]_i_6 
       (.I0(\regfile_reg_n_0_[3][28] ),
        .I1(\regfile_reg_n_0_[2][28] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][28] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][28] ),
        .O(\s00_axi_rdata[28]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[28]_i_7 
       (.I0(\regfile_reg_n_0_[7][28] ),
        .I1(\regfile_reg_n_0_[6][28] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][28] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][28] ),
        .O(\s00_axi_rdata[28]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h7F552A00)) 
    \s00_axi_rdata[29]_i_1 
       (.I0(s00_axi_araddr[3]),
        .I1(s00_axi_araddr[2]),
        .I2(s00_axi_araddr[1]),
        .I3(\s00_axi_rdata_reg[29]_i_2_n_0 ),
        .I4(\s00_axi_rdata_reg[29]_i_3_n_0 ),
        .O(\s00_axi_rdata[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[29]_i_4 
       (.I0(\regfile_reg_n_0_[11][29] ),
        .I1(\regfile_reg_n_0_[10][29] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][29] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][29] ),
        .O(\s00_axi_rdata[29]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[29]_i_5 
       (.I0(\regfile_reg_n_0_[15][29] ),
        .I1(\regfile_reg_n_0_[14][29] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][29] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][29] ),
        .O(\s00_axi_rdata[29]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[29]_i_6 
       (.I0(\regfile_reg_n_0_[3][29] ),
        .I1(\regfile_reg_n_0_[2][29] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][29] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][29] ),
        .O(\s00_axi_rdata[29]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[29]_i_7 
       (.I0(\regfile_reg_n_0_[7][29] ),
        .I1(\regfile_reg_n_0_[6][29] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][29] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][29] ),
        .O(\s00_axi_rdata[29]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[2]_i_4 
       (.I0(\regfile_reg_n_0_[3][2] ),
        .I1(\regfile_reg_n_0_[2][2] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][2] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][2] ),
        .O(\s00_axi_rdata[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[2]_i_5 
       (.I0(\regfile_reg_n_0_[7][2] ),
        .I1(\regfile_reg_n_0_[6][2] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][2] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][2] ),
        .O(\s00_axi_rdata[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[2]_i_6 
       (.I0(\regfile_reg_n_0_[11][2] ),
        .I1(\regfile_reg_n_0_[10][2] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][2] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][2] ),
        .O(\s00_axi_rdata[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[2]_i_7 
       (.I0(\regfile_reg_n_0_[15][2] ),
        .I1(\regfile_reg_n_0_[14][2] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][2] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][2] ),
        .O(\s00_axi_rdata[2]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h7F552A00)) 
    \s00_axi_rdata[30]_i_1 
       (.I0(s00_axi_araddr[3]),
        .I1(s00_axi_araddr[2]),
        .I2(s00_axi_araddr[1]),
        .I3(\s00_axi_rdata_reg[30]_i_2_n_0 ),
        .I4(\s00_axi_rdata_reg[30]_i_3_n_0 ),
        .O(\s00_axi_rdata[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[30]_i_4 
       (.I0(\regfile_reg_n_0_[11][30] ),
        .I1(\regfile_reg_n_0_[10][30] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][30] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][30] ),
        .O(\s00_axi_rdata[30]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[30]_i_5 
       (.I0(\regfile_reg_n_0_[15][30] ),
        .I1(\regfile_reg_n_0_[14][30] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][30] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][30] ),
        .O(\s00_axi_rdata[30]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[30]_i_6 
       (.I0(\regfile_reg_n_0_[3][30] ),
        .I1(\regfile_reg_n_0_[2][30] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][30] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][30] ),
        .O(\s00_axi_rdata[30]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[30]_i_7 
       (.I0(\regfile_reg_n_0_[7][30] ),
        .I1(\regfile_reg_n_0_[6][30] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][30] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][30] ),
        .O(\s00_axi_rdata[30]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \s00_axi_rdata[31]_i_1 
       (.I0(s00_axi_aresetn),
        .O(\s00_axi_rdata[31]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h70)) 
    \s00_axi_rdata[31]_i_2 
       (.I0(rvalid_reg_0),
        .I1(s00_axi_rready),
        .I2(s00_axi_arvalid),
        .O(\s00_axi_rdata[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h7F552A00)) 
    \s00_axi_rdata[31]_i_3 
       (.I0(s00_axi_araddr[3]),
        .I1(s00_axi_araddr[2]),
        .I2(s00_axi_araddr[1]),
        .I3(\s00_axi_rdata_reg[31]_i_4_n_0 ),
        .I4(\s00_axi_rdata_reg[31]_i_5_n_0 ),
        .O(\s00_axi_rdata[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[31]_i_6 
       (.I0(\regfile_reg_n_0_[11][31] ),
        .I1(\regfile_reg_n_0_[10][31] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][31] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][31] ),
        .O(\s00_axi_rdata[31]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[31]_i_7 
       (.I0(\regfile_reg_n_0_[15][31] ),
        .I1(\regfile_reg_n_0_[14][31] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][31] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][31] ),
        .O(\s00_axi_rdata[31]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[31]_i_8 
       (.I0(\regfile_reg_n_0_[3][31] ),
        .I1(\regfile_reg_n_0_[2][31] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][31] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][31] ),
        .O(\s00_axi_rdata[31]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[31]_i_9 
       (.I0(\regfile_reg_n_0_[7][31] ),
        .I1(\regfile_reg_n_0_[6][31] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][31] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][31] ),
        .O(\s00_axi_rdata[31]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[3]_i_4 
       (.I0(\regfile_reg_n_0_[3][3] ),
        .I1(\regfile_reg_n_0_[2][3] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][3] ),
        .I4(s00_axi_araddr[0]),
        .I5(vfsm_rst9_in),
        .O(\s00_axi_rdata[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[3]_i_5 
       (.I0(\regfile_reg_n_0_[7][3] ),
        .I1(\regfile_reg_n_0_[6][3] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][3] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][3] ),
        .O(\s00_axi_rdata[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[3]_i_6 
       (.I0(\regfile_reg_n_0_[11][3] ),
        .I1(\regfile_reg_n_0_[10][3] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][3] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][3] ),
        .O(\s00_axi_rdata[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[3]_i_7 
       (.I0(\regfile_reg_n_0_[15][3] ),
        .I1(\regfile_reg_n_0_[14][3] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][3] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][3] ),
        .O(\s00_axi_rdata[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[4]_i_4 
       (.I0(\regfile_reg_n_0_[3][4] ),
        .I1(\regfile_reg_n_0_[2][4] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][4] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][4] ),
        .O(\s00_axi_rdata[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[4]_i_5 
       (.I0(\regfile_reg_n_0_[7][4] ),
        .I1(\regfile_reg_n_0_[6][4] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][4] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][4] ),
        .O(\s00_axi_rdata[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[4]_i_6 
       (.I0(\regfile_reg_n_0_[11][4] ),
        .I1(\regfile_reg_n_0_[10][4] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][4] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][4] ),
        .O(\s00_axi_rdata[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[4]_i_7 
       (.I0(\regfile_reg_n_0_[15][4] ),
        .I1(\regfile_reg_n_0_[14][4] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][4] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][4] ),
        .O(\s00_axi_rdata[4]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[5]_i_4 
       (.I0(\regfile_reg_n_0_[3][5] ),
        .I1(\regfile_reg_n_0_[2][5] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][5] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][5] ),
        .O(\s00_axi_rdata[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[5]_i_5 
       (.I0(\regfile_reg_n_0_[7][5] ),
        .I1(\regfile_reg_n_0_[6][5] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][5] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][5] ),
        .O(\s00_axi_rdata[5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[5]_i_6 
       (.I0(\regfile_reg_n_0_[11][5] ),
        .I1(\regfile_reg_n_0_[10][5] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][5] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][5] ),
        .O(\s00_axi_rdata[5]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[5]_i_7 
       (.I0(\regfile_reg_n_0_[15][5] ),
        .I1(\regfile_reg_n_0_[14][5] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][5] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][5] ),
        .O(\s00_axi_rdata[5]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[6]_i_4 
       (.I0(\regfile_reg_n_0_[3][6] ),
        .I1(\regfile_reg_n_0_[2][6] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][6] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][6] ),
        .O(\s00_axi_rdata[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[6]_i_5 
       (.I0(\regfile_reg_n_0_[7][6] ),
        .I1(\regfile_reg_n_0_[6][6] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][6] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][6] ),
        .O(\s00_axi_rdata[6]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[6]_i_6 
       (.I0(\regfile_reg_n_0_[11][6] ),
        .I1(\regfile_reg_n_0_[10][6] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][6] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][6] ),
        .O(\s00_axi_rdata[6]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[6]_i_7 
       (.I0(\regfile_reg_n_0_[15][6] ),
        .I1(\regfile_reg_n_0_[14][6] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][6] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][6] ),
        .O(\s00_axi_rdata[6]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[7]_i_4 
       (.I0(\regfile_reg_n_0_[3][7] ),
        .I1(\regfile_reg_n_0_[2][7] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][7] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][7] ),
        .O(\s00_axi_rdata[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[7]_i_5 
       (.I0(\regfile_reg_n_0_[7][7] ),
        .I1(\regfile_reg_n_0_[6][7] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][7] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][7] ),
        .O(\s00_axi_rdata[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[7]_i_6 
       (.I0(\regfile_reg_n_0_[11][7] ),
        .I1(\regfile_reg_n_0_[10][7] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][7] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][7] ),
        .O(\s00_axi_rdata[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[7]_i_7 
       (.I0(\regfile_reg_n_0_[15][7] ),
        .I1(\regfile_reg_n_0_[14][7] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][7] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][7] ),
        .O(\s00_axi_rdata[7]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[8]_i_4 
       (.I0(\regfile_reg_n_0_[3][8] ),
        .I1(\regfile_reg_n_0_[2][8] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][8] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][8] ),
        .O(\s00_axi_rdata[8]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[8]_i_5 
       (.I0(\regfile_reg_n_0_[7][8] ),
        .I1(\regfile_reg_n_0_[6][8] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][8] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][8] ),
        .O(\s00_axi_rdata[8]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[8]_i_6 
       (.I0(\regfile_reg_n_0_[11][8] ),
        .I1(\regfile_reg_n_0_[10][8] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][8] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][8] ),
        .O(\s00_axi_rdata[8]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[8]_i_7 
       (.I0(\regfile_reg_n_0_[15][8] ),
        .I1(\regfile_reg_n_0_[14][8] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][8] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][8] ),
        .O(\s00_axi_rdata[8]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[9]_i_4 
       (.I0(\regfile_reg_n_0_[3][9] ),
        .I1(\regfile_reg_n_0_[2][9] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[1][9] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[0][9] ),
        .O(\s00_axi_rdata[9]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[9]_i_5 
       (.I0(\regfile_reg_n_0_[7][9] ),
        .I1(\regfile_reg_n_0_[6][9] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[5][9] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[4][9] ),
        .O(\s00_axi_rdata[9]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[9]_i_6 
       (.I0(\regfile_reg_n_0_[11][9] ),
        .I1(\regfile_reg_n_0_[10][9] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[9][9] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[8][9] ),
        .O(\s00_axi_rdata[9]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[9]_i_7 
       (.I0(\regfile_reg_n_0_[15][9] ),
        .I1(\regfile_reg_n_0_[14][9] ),
        .I2(s00_axi_araddr[1]),
        .I3(\regfile_reg_n_0_[13][9] ),
        .I4(s00_axi_araddr[0]),
        .I5(\regfile_reg_n_0_[12][9] ),
        .O(\s00_axi_rdata[9]_i_7_n_0 ));
  FDRE \s00_axi_rdata_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(video_FIFO_n_42),
        .Q(s00_axi_rdata[0]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[0]_i_2 
       (.I0(\s00_axi_rdata[0]_i_4_n_0 ),
        .I1(\s00_axi_rdata[0]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[0]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[0]_i_3 
       (.I0(\s00_axi_rdata[0]_i_6_n_0 ),
        .I1(\s00_axi_rdata[0]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[0]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(video_FIFO_n_32),
        .Q(s00_axi_rdata[10]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[10]_i_2 
       (.I0(\s00_axi_rdata[10]_i_4_n_0 ),
        .I1(\s00_axi_rdata[10]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[10]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[10]_i_3 
       (.I0(\s00_axi_rdata[10]_i_6_n_0 ),
        .I1(\s00_axi_rdata[10]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[10]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(video_FIFO_n_31),
        .Q(s00_axi_rdata[11]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[11]_i_2 
       (.I0(\s00_axi_rdata[11]_i_4_n_0 ),
        .I1(\s00_axi_rdata[11]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[11]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[11]_i_3 
       (.I0(\s00_axi_rdata[11]_i_6_n_0 ),
        .I1(\s00_axi_rdata[11]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[11]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(video_FIFO_n_30),
        .Q(s00_axi_rdata[12]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[12]_i_4 
       (.I0(\s00_axi_rdata[12]_i_6_n_0 ),
        .I1(\s00_axi_rdata[12]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[12]_i_4_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[12]_i_5 
       (.I0(\s00_axi_rdata[12]_i_8_n_0 ),
        .I1(\s00_axi_rdata[12]_i_9_n_0 ),
        .O(\s00_axi_rdata_reg[12]_i_5_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(\s00_axi_rdata[13]_i_1_n_0 ),
        .Q(s00_axi_rdata[13]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[13]_i_2 
       (.I0(\s00_axi_rdata[13]_i_4_n_0 ),
        .I1(\s00_axi_rdata[13]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[13]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[13]_i_3 
       (.I0(\s00_axi_rdata[13]_i_6_n_0 ),
        .I1(\s00_axi_rdata[13]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[13]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(\s00_axi_rdata[14]_i_1_n_0 ),
        .Q(s00_axi_rdata[14]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[14]_i_2 
       (.I0(\s00_axi_rdata[14]_i_4_n_0 ),
        .I1(\s00_axi_rdata[14]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[14]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[14]_i_3 
       (.I0(\s00_axi_rdata[14]_i_6_n_0 ),
        .I1(\s00_axi_rdata[14]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[14]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(\s00_axi_rdata[15]_i_1_n_0 ),
        .Q(s00_axi_rdata[15]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[15]_i_2 
       (.I0(\s00_axi_rdata[15]_i_4_n_0 ),
        .I1(\s00_axi_rdata[15]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[15]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[15]_i_3 
       (.I0(\s00_axi_rdata[15]_i_6_n_0 ),
        .I1(\s00_axi_rdata[15]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[15]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(\s00_axi_rdata[16]_i_1_n_0 ),
        .Q(s00_axi_rdata[16]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[16]_i_2 
       (.I0(\s00_axi_rdata[16]_i_4_n_0 ),
        .I1(\s00_axi_rdata[16]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[16]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[16]_i_3 
       (.I0(\s00_axi_rdata[16]_i_6_n_0 ),
        .I1(\s00_axi_rdata[16]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[16]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(\s00_axi_rdata[17]_i_1_n_0 ),
        .Q(s00_axi_rdata[17]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[17]_i_2 
       (.I0(\s00_axi_rdata[17]_i_4_n_0 ),
        .I1(\s00_axi_rdata[17]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[17]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[17]_i_3 
       (.I0(\s00_axi_rdata[17]_i_6_n_0 ),
        .I1(\s00_axi_rdata[17]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[17]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(\s00_axi_rdata[18]_i_1_n_0 ),
        .Q(s00_axi_rdata[18]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[18]_i_2 
       (.I0(\s00_axi_rdata[18]_i_4_n_0 ),
        .I1(\s00_axi_rdata[18]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[18]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[18]_i_3 
       (.I0(\s00_axi_rdata[18]_i_6_n_0 ),
        .I1(\s00_axi_rdata[18]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[18]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(\s00_axi_rdata[19]_i_1_n_0 ),
        .Q(s00_axi_rdata[19]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[19]_i_2 
       (.I0(\s00_axi_rdata[19]_i_4_n_0 ),
        .I1(\s00_axi_rdata[19]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[19]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[19]_i_3 
       (.I0(\s00_axi_rdata[19]_i_6_n_0 ),
        .I1(\s00_axi_rdata[19]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[19]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(video_FIFO_n_41),
        .Q(s00_axi_rdata[1]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[1]_i_2 
       (.I0(\s00_axi_rdata[1]_i_4_n_0 ),
        .I1(\s00_axi_rdata[1]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[1]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[1]_i_3 
       (.I0(\s00_axi_rdata[1]_i_6_n_0 ),
        .I1(\s00_axi_rdata[1]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[1]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(\s00_axi_rdata[20]_i_1_n_0 ),
        .Q(s00_axi_rdata[20]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[20]_i_2 
       (.I0(\s00_axi_rdata[20]_i_4_n_0 ),
        .I1(\s00_axi_rdata[20]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[20]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[20]_i_3 
       (.I0(\s00_axi_rdata[20]_i_6_n_0 ),
        .I1(\s00_axi_rdata[20]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[20]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(\s00_axi_rdata[21]_i_1_n_0 ),
        .Q(s00_axi_rdata[21]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[21]_i_2 
       (.I0(\s00_axi_rdata[21]_i_4_n_0 ),
        .I1(\s00_axi_rdata[21]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[21]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[21]_i_3 
       (.I0(\s00_axi_rdata[21]_i_6_n_0 ),
        .I1(\s00_axi_rdata[21]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[21]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(\s00_axi_rdata[22]_i_1_n_0 ),
        .Q(s00_axi_rdata[22]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[22]_i_2 
       (.I0(\s00_axi_rdata[22]_i_4_n_0 ),
        .I1(\s00_axi_rdata[22]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[22]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[22]_i_3 
       (.I0(\s00_axi_rdata[22]_i_6_n_0 ),
        .I1(\s00_axi_rdata[22]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[22]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(\s00_axi_rdata[23]_i_1_n_0 ),
        .Q(s00_axi_rdata[23]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[23]_i_2 
       (.I0(\s00_axi_rdata[23]_i_4_n_0 ),
        .I1(\s00_axi_rdata[23]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[23]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[23]_i_3 
       (.I0(\s00_axi_rdata[23]_i_6_n_0 ),
        .I1(\s00_axi_rdata[23]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[23]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(\s00_axi_rdata[24]_i_1_n_0 ),
        .Q(s00_axi_rdata[24]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[24]_i_2 
       (.I0(\s00_axi_rdata[24]_i_4_n_0 ),
        .I1(\s00_axi_rdata[24]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[24]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[24]_i_3 
       (.I0(\s00_axi_rdata[24]_i_6_n_0 ),
        .I1(\s00_axi_rdata[24]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[24]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(\s00_axi_rdata[25]_i_1_n_0 ),
        .Q(s00_axi_rdata[25]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[25]_i_2 
       (.I0(\s00_axi_rdata[25]_i_4_n_0 ),
        .I1(\s00_axi_rdata[25]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[25]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[25]_i_3 
       (.I0(\s00_axi_rdata[25]_i_6_n_0 ),
        .I1(\s00_axi_rdata[25]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[25]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(\s00_axi_rdata[26]_i_1_n_0 ),
        .Q(s00_axi_rdata[26]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[26]_i_2 
       (.I0(\s00_axi_rdata[26]_i_4_n_0 ),
        .I1(\s00_axi_rdata[26]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[26]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[26]_i_3 
       (.I0(\s00_axi_rdata[26]_i_6_n_0 ),
        .I1(\s00_axi_rdata[26]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[26]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(\s00_axi_rdata[27]_i_1_n_0 ),
        .Q(s00_axi_rdata[27]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[27]_i_2 
       (.I0(\s00_axi_rdata[27]_i_4_n_0 ),
        .I1(\s00_axi_rdata[27]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[27]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[27]_i_3 
       (.I0(\s00_axi_rdata[27]_i_6_n_0 ),
        .I1(\s00_axi_rdata[27]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[27]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(\s00_axi_rdata[28]_i_1_n_0 ),
        .Q(s00_axi_rdata[28]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[28]_i_2 
       (.I0(\s00_axi_rdata[28]_i_4_n_0 ),
        .I1(\s00_axi_rdata[28]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[28]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[28]_i_3 
       (.I0(\s00_axi_rdata[28]_i_6_n_0 ),
        .I1(\s00_axi_rdata[28]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[28]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(\s00_axi_rdata[29]_i_1_n_0 ),
        .Q(s00_axi_rdata[29]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[29]_i_2 
       (.I0(\s00_axi_rdata[29]_i_4_n_0 ),
        .I1(\s00_axi_rdata[29]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[29]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[29]_i_3 
       (.I0(\s00_axi_rdata[29]_i_6_n_0 ),
        .I1(\s00_axi_rdata[29]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[29]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(video_FIFO_n_40),
        .Q(s00_axi_rdata[2]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[2]_i_2 
       (.I0(\s00_axi_rdata[2]_i_4_n_0 ),
        .I1(\s00_axi_rdata[2]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[2]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[2]_i_3 
       (.I0(\s00_axi_rdata[2]_i_6_n_0 ),
        .I1(\s00_axi_rdata[2]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[2]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(\s00_axi_rdata[30]_i_1_n_0 ),
        .Q(s00_axi_rdata[30]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[30]_i_2 
       (.I0(\s00_axi_rdata[30]_i_4_n_0 ),
        .I1(\s00_axi_rdata[30]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[30]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[30]_i_3 
       (.I0(\s00_axi_rdata[30]_i_6_n_0 ),
        .I1(\s00_axi_rdata[30]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[30]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(\s00_axi_rdata[31]_i_3_n_0 ),
        .Q(s00_axi_rdata[31]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[31]_i_4 
       (.I0(\s00_axi_rdata[31]_i_6_n_0 ),
        .I1(\s00_axi_rdata[31]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[31]_i_4_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[31]_i_5 
       (.I0(\s00_axi_rdata[31]_i_8_n_0 ),
        .I1(\s00_axi_rdata[31]_i_9_n_0 ),
        .O(\s00_axi_rdata_reg[31]_i_5_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(video_FIFO_n_39),
        .Q(s00_axi_rdata[3]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[3]_i_2 
       (.I0(\s00_axi_rdata[3]_i_4_n_0 ),
        .I1(\s00_axi_rdata[3]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[3]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[3]_i_3 
       (.I0(\s00_axi_rdata[3]_i_6_n_0 ),
        .I1(\s00_axi_rdata[3]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[3]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(video_FIFO_n_38),
        .Q(s00_axi_rdata[4]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[4]_i_2 
       (.I0(\s00_axi_rdata[4]_i_4_n_0 ),
        .I1(\s00_axi_rdata[4]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[4]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[4]_i_3 
       (.I0(\s00_axi_rdata[4]_i_6_n_0 ),
        .I1(\s00_axi_rdata[4]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[4]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(video_FIFO_n_37),
        .Q(s00_axi_rdata[5]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[5]_i_2 
       (.I0(\s00_axi_rdata[5]_i_4_n_0 ),
        .I1(\s00_axi_rdata[5]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[5]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[5]_i_3 
       (.I0(\s00_axi_rdata[5]_i_6_n_0 ),
        .I1(\s00_axi_rdata[5]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[5]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(video_FIFO_n_36),
        .Q(s00_axi_rdata[6]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[6]_i_2 
       (.I0(\s00_axi_rdata[6]_i_4_n_0 ),
        .I1(\s00_axi_rdata[6]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[6]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[6]_i_3 
       (.I0(\s00_axi_rdata[6]_i_6_n_0 ),
        .I1(\s00_axi_rdata[6]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[6]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(video_FIFO_n_35),
        .Q(s00_axi_rdata[7]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[7]_i_2 
       (.I0(\s00_axi_rdata[7]_i_4_n_0 ),
        .I1(\s00_axi_rdata[7]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[7]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[7]_i_3 
       (.I0(\s00_axi_rdata[7]_i_6_n_0 ),
        .I1(\s00_axi_rdata[7]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[7]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(video_FIFO_n_34),
        .Q(s00_axi_rdata[8]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[8]_i_2 
       (.I0(\s00_axi_rdata[8]_i_4_n_0 ),
        .I1(\s00_axi_rdata[8]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[8]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[8]_i_3 
       (.I0(\s00_axi_rdata[8]_i_6_n_0 ),
        .I1(\s00_axi_rdata[8]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[8]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  FDRE \s00_axi_rdata_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\s00_axi_rdata[31]_i_2_n_0 ),
        .D(video_FIFO_n_33),
        .Q(s00_axi_rdata[9]),
        .R(\s00_axi_rdata[31]_i_1_n_0 ));
  MUXF7 \s00_axi_rdata_reg[9]_i_2 
       (.I0(\s00_axi_rdata[9]_i_4_n_0 ),
        .I1(\s00_axi_rdata[9]_i_5_n_0 ),
        .O(\s00_axi_rdata_reg[9]_i_2_n_0 ),
        .S(s00_axi_araddr[2]));
  MUXF7 \s00_axi_rdata_reg[9]_i_3 
       (.I0(\s00_axi_rdata[9]_i_6_n_0 ),
        .I1(\s00_axi_rdata[9]_i_7_n_0 ),
        .O(\s00_axi_rdata_reg[9]_i_3_n_0 ),
        .S(s00_axi_araddr[2]));
  LUT3 #(
    .INIT(8'hF8)) 
    vfsm_error_i_1
       (.I0(vfsm_state[1]),
        .I1(vfsm_state[0]),
        .I2(p_1_in),
        .O(vfsm_error_i_1_n_0));
  FDRE vfsm_error_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(vfsm_error_i_1_n_0),
        .Q(p_1_in),
        .R(vfsm_rst19_out));
  LUT5 #(
    .INIT(32'h3F3C0808)) 
    vfsm_rd_enable_i_1
       (.I0(cdc_axi),
        .I1(vfsm_state[0]),
        .I2(vfsm_state[1]),
        .I3(vfsm_rst9_in),
        .I4(vfsm_rd_enable),
        .O(vfsm_rd_enable_i_1_n_0));
  FDRE vfsm_rd_enable_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(vfsm_rd_enable_i_1_n_0),
        .Q(vfsm_rd_enable),
        .R(vfsm_rst19_out));
  LUT3 #(
    .INIT(8'hFB)) 
    \vfsm_state[1]_i_1 
       (.I0(\regfile_reg_n_0_[0][0] ),
        .I1(s00_axi_aresetn),
        .I2(\regfile_reg_n_0_[0][4] ),
        .O(vfsm_rst19_out));
  FDRE #(
    .INIT(1'b0)) 
    \vfsm_state_reg[0] 
       (.C(m00_axi_aclk),
        .CE(mm2s_n_6),
        .D(mm2s_n_7),
        .Q(vfsm_state[0]),
        .R(vfsm_rst19_out));
  FDRE #(
    .INIT(1'b0)) 
    \vfsm_state_reg[1] 
       (.C(m00_axi_aclk),
        .CE(mm2s_n_6),
        .D(mm2s_n_5),
        .Q(vfsm_state[1]),
        .R(vfsm_rst19_out));
  design_1_axi_video_0_3_video_gen vgen
       (.Q({\regfile_reg_n_0_[8][12] ,\regfile_reg_n_0_[8][11] ,\regfile_reg_n_0_[8][10] ,\regfile_reg_n_0_[8][9] ,\regfile_reg_n_0_[8][8] ,\regfile_reg_n_0_[8][7] ,\regfile_reg_n_0_[8][6] ,\regfile_reg_n_0_[8][5] ,\regfile_reg_n_0_[8][4] ,\regfile_reg_n_0_[8][3] ,\regfile_reg_n_0_[8][2] ,\regfile_reg_n_0_[8][1] ,\regfile_reg_n_0_[8][0] }),
        .SR(vgen_n_6),
        .rd_en(p_4_in),
        .src_in(cdc_video),
        .vfsm_rd_enable(vfsm_rd_enable),
        .video_active_d(video_active_d),
        .video_active_end_reg_0({\regfile_reg_n_0_[10][12] ,\regfile_reg_n_0_[10][11] ,\regfile_reg_n_0_[10][10] ,\regfile_reg_n_0_[10][9] ,\regfile_reg_n_0_[10][8] ,\regfile_reg_n_0_[10][7] ,\regfile_reg_n_0_[10][6] ,\regfile_reg_n_0_[10][5] ,\regfile_reg_n_0_[10][4] ,\regfile_reg_n_0_[10][3] ,\regfile_reg_n_0_[10][2] ,\regfile_reg_n_0_[10][1] ,\regfile_reg_n_0_[10][0] }),
        .video_active_end_reg_1({\regfile_reg_n_0_[5][12] ,\regfile_reg_n_0_[5][11] ,\regfile_reg_n_0_[5][10] ,\regfile_reg_n_0_[5][9] ,\regfile_reg_n_0_[5][8] ,\regfile_reg_n_0_[5][7] ,\regfile_reg_n_0_[5][6] ,\regfile_reg_n_0_[5][5] ,\regfile_reg_n_0_[5][4] ,\regfile_reg_n_0_[5][3] ,\regfile_reg_n_0_[5][2] ,\regfile_reg_n_0_[5][1] ,\regfile_reg_n_0_[5][0] }),
        .video_active_reg_0(video_rst_reg_n_0),
        .video_clk(video_clk),
        .video_frame_end0_carry_0({\regfile_reg_n_0_[13][12] ,\regfile_reg_n_0_[13][11] ,\regfile_reg_n_0_[13][10] ,\regfile_reg_n_0_[13][9] ,\regfile_reg_n_0_[13][8] ,\regfile_reg_n_0_[13][7] ,\regfile_reg_n_0_[13][6] ,\regfile_reg_n_0_[13][5] ,\regfile_reg_n_0_[13][4] ,\regfile_reg_n_0_[13][3] ,\regfile_reg_n_0_[13][2] ,\regfile_reg_n_0_[13][1] ,\regfile_reg_n_0_[13][0] }),
        .video_hsync2_carry_0({\regfile_reg_n_0_[7][12] ,\regfile_reg_n_0_[7][11] ,\regfile_reg_n_0_[7][10] ,\regfile_reg_n_0_[7][9] ,\regfile_reg_n_0_[7][8] ,\regfile_reg_n_0_[7][7] ,\regfile_reg_n_0_[7][6] ,\regfile_reg_n_0_[7][5] ,\regfile_reg_n_0_[7][4] ,\regfile_reg_n_0_[7][3] ,\regfile_reg_n_0_[7][2] ,\regfile_reg_n_0_[7][1] ,\regfile_reg_n_0_[7][0] }),
        .\video_hsync2_inferred__0/i__carry_0 ({\regfile_reg_n_0_[6][12] ,\regfile_reg_n_0_[6][11] ,\regfile_reg_n_0_[6][10] ,\regfile_reg_n_0_[6][9] ,\regfile_reg_n_0_[6][8] ,\regfile_reg_n_0_[6][7] ,\regfile_reg_n_0_[6][6] ,\regfile_reg_n_0_[6][5] ,\regfile_reg_n_0_[6][4] ,\regfile_reg_n_0_[6][3] ,\regfile_reg_n_0_[6][2] ,\regfile_reg_n_0_[6][1] ,\regfile_reg_n_0_[6][0] }),
        .video_hsync_d(video_hsync_d),
        .video_vsync2_carry_0({\regfile_reg_n_0_[12][12] ,\regfile_reg_n_0_[12][11] ,\regfile_reg_n_0_[12][10] ,\regfile_reg_n_0_[12][9] ,\regfile_reg_n_0_[12][8] ,\regfile_reg_n_0_[12][7] ,\regfile_reg_n_0_[12][6] ,\regfile_reg_n_0_[12][5] ,\regfile_reg_n_0_[12][4] ,\regfile_reg_n_0_[12][3] ,\regfile_reg_n_0_[12][2] ,\regfile_reg_n_0_[12][1] ,\regfile_reg_n_0_[12][0] }),
        .\video_vsync2_inferred__0/i__carry_0 ({\regfile_reg_n_0_[11][12] ,\regfile_reg_n_0_[11][11] ,\regfile_reg_n_0_[11][10] ,\regfile_reg_n_0_[11][9] ,\regfile_reg_n_0_[11][8] ,\regfile_reg_n_0_[11][7] ,\regfile_reg_n_0_[11][6] ,\regfile_reg_n_0_[11][5] ,\regfile_reg_n_0_[11][4] ,\regfile_reg_n_0_[11][3] ,\regfile_reg_n_0_[11][2] ,\regfile_reg_n_0_[11][1] ,\regfile_reg_n_0_[11][0] }),
        .video_vsync_d(video_vsync_d),
        .video_vsync_reg_0({\regfile_reg_n_0_[0][2] ,\regfile_reg_n_0_[0][1] }));
  design_1_axi_video_0_3_xpm_fifo_wrapper video_FIFO
       (.D({video_FIFO_n_2,video_FIFO_n_3,video_FIFO_n_4,video_FIFO_n_5,video_FIFO_n_6,video_FIFO_n_7,video_FIFO_n_8,video_FIFO_n_9,svf_axis_tdata,video_FIFO_n_18,video_FIFO_n_19,video_FIFO_n_20,video_FIFO_n_21,video_FIFO_n_22,video_FIFO_n_23,video_FIFO_n_24,video_FIFO_n_25}),
        .E(video_FIFO_n_26),
        .\FSM_onehot_state_reg[1] (video_FIFO_n_28),
        .Q({mm2s_n_1,mm2s_n_2,mm2s_n_3}),
        .\gwdc.wr_data_count_i_reg[0] (video_FIFO_n_42),
        .\gwdc.wr_data_count_i_reg[10] (video_FIFO_n_32),
        .\gwdc.wr_data_count_i_reg[11] (video_FIFO_n_31),
        .\gwdc.wr_data_count_i_reg[12] (video_FIFO_n_30),
        .\gwdc.wr_data_count_i_reg[1] (video_FIFO_n_41),
        .\gwdc.wr_data_count_i_reg[2] (video_FIFO_n_40),
        .\gwdc.wr_data_count_i_reg[3] (video_FIFO_n_39),
        .\gwdc.wr_data_count_i_reg[4] (video_FIFO_n_38),
        .\gwdc.wr_data_count_i_reg[5] (video_FIFO_n_37),
        .\gwdc.wr_data_count_i_reg[6] (video_FIFO_n_36),
        .\gwdc.wr_data_count_i_reg[7] (video_FIFO_n_35),
        .\gwdc.wr_data_count_i_reg[8] (video_FIFO_n_34),
        .\gwdc.wr_data_count_i_reg[9] (video_FIFO_n_33),
        .m00_axi_aclk(m00_axi_aclk),
        .m00_axi_rdata(m00_axi_rdata),
        .m00_axi_rready(m00_axi_rready),
        .m00_axi_ruser(m00_axi_ruser),
        .m00_axi_rvalid(m00_axi_rvalid),
        .m00_axi_rvalid_0(video_FIFO_n_27),
        .rd_en(p_4_in),
        .s00_axi_araddr(s00_axi_araddr[3]),
        .\s00_axi_rdata_reg[0] (\s00_axi_rdata_reg[0]_i_2_n_0 ),
        .\s00_axi_rdata_reg[0]_0 (\s00_axi_rdata_reg[0]_i_3_n_0 ),
        .\s00_axi_rdata_reg[10] (\s00_axi_rdata_reg[10]_i_2_n_0 ),
        .\s00_axi_rdata_reg[10]_0 (\s00_axi_rdata_reg[10]_i_3_n_0 ),
        .\s00_axi_rdata_reg[11] (\s00_axi_rdata_reg[11]_i_2_n_0 ),
        .\s00_axi_rdata_reg[11]_0 (\s00_axi_rdata_reg[11]_i_3_n_0 ),
        .\s00_axi_rdata_reg[12] (\s00_axi_rdata[12]_i_2_n_0 ),
        .\s00_axi_rdata_reg[12]_0 (\s00_axi_rdata[12]_i_3_n_0 ),
        .\s00_axi_rdata_reg[12]_1 (\s00_axi_rdata_reg[12]_i_4_n_0 ),
        .\s00_axi_rdata_reg[12]_2 (\s00_axi_rdata_reg[12]_i_5_n_0 ),
        .\s00_axi_rdata_reg[1] (\s00_axi_rdata_reg[1]_i_2_n_0 ),
        .\s00_axi_rdata_reg[1]_0 (\s00_axi_rdata_reg[1]_i_3_n_0 ),
        .\s00_axi_rdata_reg[2] (\s00_axi_rdata_reg[2]_i_2_n_0 ),
        .\s00_axi_rdata_reg[2]_0 (\s00_axi_rdata_reg[2]_i_3_n_0 ),
        .\s00_axi_rdata_reg[3] (\s00_axi_rdata_reg[3]_i_2_n_0 ),
        .\s00_axi_rdata_reg[3]_0 (\s00_axi_rdata_reg[3]_i_3_n_0 ),
        .\s00_axi_rdata_reg[4] (\s00_axi_rdata_reg[4]_i_2_n_0 ),
        .\s00_axi_rdata_reg[4]_0 (\s00_axi_rdata_reg[4]_i_3_n_0 ),
        .\s00_axi_rdata_reg[5] (\s00_axi_rdata_reg[5]_i_2_n_0 ),
        .\s00_axi_rdata_reg[5]_0 (\s00_axi_rdata_reg[5]_i_3_n_0 ),
        .\s00_axi_rdata_reg[6] (\s00_axi_rdata_reg[6]_i_2_n_0 ),
        .\s00_axi_rdata_reg[6]_0 (\s00_axi_rdata_reg[6]_i_3_n_0 ),
        .\s00_axi_rdata_reg[7] (\s00_axi_rdata_reg[7]_i_2_n_0 ),
        .\s00_axi_rdata_reg[7]_0 (\s00_axi_rdata_reg[7]_i_3_n_0 ),
        .\s00_axi_rdata_reg[8] (\s00_axi_rdata_reg[8]_i_2_n_0 ),
        .\s00_axi_rdata_reg[8]_0 (\s00_axi_rdata_reg[8]_i_3_n_0 ),
        .\s00_axi_rdata_reg[9] (\s00_axi_rdata_reg[9]_i_2_n_0 ),
        .\s00_axi_rdata_reg[9]_0 (\s00_axi_rdata_reg[9]_i_3_n_0 ),
        .s_aresetn(s_aresetn),
        .s_axis_tlast(m_axis_tlast),
        .s_axis_tready(s_axis_tready_sig),
        .s_axis_tvalid(m_axis_tvalid),
        .\s_cntr_reg[0]_0 (video_rst_reg_n_0),
        .vfsm_rd_enable(vfsm_rd_enable),
        .vfsm_rd_enable_reg(\??1_out ),
        .video_clk(video_clk),
        .\video_rgb_reg[4] (\regfile_reg_n_0_[0][5] ));
  FDRE video_active_reg
       (.C(video_clk),
        .CE(1'b1),
        .D(video_active_d),
        .Q(video_active),
        .R(video_rst_reg_n_0));
  FDRE video_hsync_reg
       (.C(video_clk),
        .CE(1'b1),
        .D(video_hsync_d),
        .Q(video_hsync),
        .R(1'b0));
  FDRE \video_rgb_reg[10] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(video_FIFO_n_19),
        .Q(video_rgb[6]),
        .R(vgen_n_6));
  FDRE \video_rgb_reg[11] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(video_FIFO_n_18),
        .Q(video_rgb[7]),
        .R(vgen_n_6));
  FDRE \video_rgb_reg[16] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(svf_axis_tdata[8]),
        .Q(video_rgb[8]),
        .R(vgen_n_6));
  FDRE \video_rgb_reg[17] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(svf_axis_tdata[9]),
        .Q(video_rgb[9]),
        .R(vgen_n_6));
  FDRE \video_rgb_reg[18] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(svf_axis_tdata[10]),
        .Q(video_rgb[10]),
        .R(vgen_n_6));
  FDRE \video_rgb_reg[19] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(svf_axis_tdata[11]),
        .Q(video_rgb[11]),
        .R(vgen_n_6));
  FDRE \video_rgb_reg[20] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(svf_axis_tdata[12]),
        .Q(video_rgb[12]),
        .R(vgen_n_6));
  FDRE \video_rgb_reg[21] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(svf_axis_tdata[13]),
        .Q(video_rgb[13]),
        .R(vgen_n_6));
  FDRE \video_rgb_reg[22] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(svf_axis_tdata[14]),
        .Q(video_rgb[14]),
        .R(vgen_n_6));
  FDRE \video_rgb_reg[23] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(svf_axis_tdata[15]),
        .Q(video_rgb[15]),
        .R(vgen_n_6));
  FDRE \video_rgb_reg[28] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(video_FIFO_n_9),
        .Q(video_rgb[16]),
        .R(vgen_n_6));
  FDRE \video_rgb_reg[29] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(video_FIFO_n_8),
        .Q(video_rgb[17]),
        .R(vgen_n_6));
  FDRE \video_rgb_reg[30] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(video_FIFO_n_7),
        .Q(video_rgb[18]),
        .R(vgen_n_6));
  FDRE \video_rgb_reg[31] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(video_FIFO_n_6),
        .Q(video_rgb[19]),
        .R(vgen_n_6));
  FDRE \video_rgb_reg[32] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(video_FIFO_n_5),
        .Q(video_rgb[20]),
        .R(vgen_n_6));
  FDRE \video_rgb_reg[33] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(video_FIFO_n_4),
        .Q(video_rgb[21]),
        .R(vgen_n_6));
  FDRE \video_rgb_reg[34] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(video_FIFO_n_3),
        .Q(video_rgb[22]),
        .R(vgen_n_6));
  FDRE \video_rgb_reg[35] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(video_FIFO_n_2),
        .Q(video_rgb[23]),
        .R(vgen_n_6));
  FDRE \video_rgb_reg[4] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(video_FIFO_n_25),
        .Q(video_rgb[0]),
        .R(vgen_n_6));
  FDRE \video_rgb_reg[5] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(video_FIFO_n_24),
        .Q(video_rgb[1]),
        .R(vgen_n_6));
  FDRE \video_rgb_reg[6] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(video_FIFO_n_23),
        .Q(video_rgb[2]),
        .R(vgen_n_6));
  FDRE \video_rgb_reg[7] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(video_FIFO_n_22),
        .Q(video_rgb[3]),
        .R(vgen_n_6));
  FDRE \video_rgb_reg[8] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(video_FIFO_n_21),
        .Q(video_rgb[4]),
        .R(vgen_n_6));
  FDRE \video_rgb_reg[9] 
       (.C(video_clk),
        .CE(\??1_out ),
        .D(video_FIFO_n_20),
        .Q(video_rgb[5]),
        .R(vgen_n_6));
  LUT4 #(
    .INIT(16'hFD01)) 
    video_rst_i_1
       (.I0(vfsm_rst9_in),
        .I1(vfsm_state[0]),
        .I2(vfsm_state[1]),
        .I3(video_rst_reg_n_0),
        .O(video_rst_i_1_n_0));
  FDSE video_rst_reg
       (.C(m00_axi_aclk),
        .CE(1'b1),
        .D(video_rst_i_1_n_0),
        .Q(video_rst_reg_n_0),
        .S(vfsm_rst19_out));
  FDRE video_vsync_reg
       (.C(video_clk),
        .CE(1'b1),
        .D(video_vsync_d),
        .Q(video_vsync),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000400040004000)) 
    wready_i_1
       (.I0(\regfile_reg_n_0_[0][0] ),
        .I1(s00_axi_aresetn),
        .I2(s00_axi_awvalid),
        .I3(s00_axi_wvalid),
        .I4(bvalid_reg_0),
        .I5(s00_axi_bready),
        .O(wready_i_1_n_0));
  FDRE wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(wready_i_1_n_0),
        .Q(s00_axi_awready),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "video_gen" *) 
module design_1_axi_video_0_3_video_gen
   (video_hsync_d,
    video_vsync_d,
    video_active_d,
    src_in,
    rd_en,
    SR,
    video_clk,
    video_active_reg_0,
    Q,
    \video_hsync2_inferred__0/i__carry_0 ,
    video_frame_end0_carry_0,
    \video_vsync2_inferred__0/i__carry_0 ,
    video_vsync2_carry_0,
    video_active_end_reg_0,
    video_hsync2_carry_0,
    video_active_end_reg_1,
    video_vsync_reg_0,
    vfsm_rd_enable);
  output video_hsync_d;
  output video_vsync_d;
  output video_active_d;
  output [1:0]src_in;
  output rd_en;
  output [0:0]SR;
  input video_clk;
  input video_active_reg_0;
  input [12:0]Q;
  input [12:0]\video_hsync2_inferred__0/i__carry_0 ;
  input [12:0]video_frame_end0_carry_0;
  input [12:0]\video_vsync2_inferred__0/i__carry_0 ;
  input [12:0]video_vsync2_carry_0;
  input [12:0]video_active_end_reg_0;
  input [12:0]video_hsync2_carry_0;
  input [12:0]video_active_end_reg_1;
  input [1:0]video_vsync_reg_0;
  input vfsm_rd_enable;

  wire [12:0]Q;
  wire [0:0]SR;
  wire \hcount[0]_i_1_n_0 ;
  wire \hcount[12]_i_1_n_0 ;
  wire [12:0]hcount_reg;
  wire i__carry_i_10__0_n_0;
  wire i__carry_i_10__1_n_0;
  wire i__carry_i_10_n_0;
  wire i__carry_i_11__0_n_0;
  wire i__carry_i_11__1_n_0;
  wire i__carry_i_11_n_0;
  wire i__carry_i_12__0_n_0;
  wire i__carry_i_12__1_n_0;
  wire i__carry_i_12_n_0;
  wire i__carry_i_13__0_n_0;
  wire i__carry_i_13__1_n_0;
  wire i__carry_i_13_n_0;
  wire i__carry_i_14__0_n_0;
  wire i__carry_i_14__1_n_0;
  wire i__carry_i_14_n_0;
  wire i__carry_i_1__0_n_0;
  wire i__carry_i_1__1_n_0;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2__0_n_0;
  wire i__carry_i_2__1_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_3__0_n_0;
  wire i__carry_i_3__1_n_0;
  wire i__carry_i_3_n_0;
  wire i__carry_i_4__0_n_0;
  wire i__carry_i_4__1_n_0;
  wire i__carry_i_4_n_0;
  wire i__carry_i_5__0_n_0;
  wire i__carry_i_5__1_n_0;
  wire i__carry_i_5_n_0;
  wire i__carry_i_6__0_n_0;
  wire i__carry_i_6__1_n_0;
  wire i__carry_i_6_n_0;
  wire i__carry_i_7__0_n_0;
  wire i__carry_i_7__1_n_0;
  wire i__carry_i_7_n_0;
  wire i__carry_i_8__0_n_0;
  wire i__carry_i_8__1_n_0;
  wire i__carry_i_8_n_0;
  wire i__carry_i_9__0_n_0;
  wire i__carry_i_9__1_n_0;
  wire i__carry_i_9_n_0;
  wire [12:1]plusOp;
  wire [12:1]plusOp__0;
  wire plusOp__22_carry__0_n_5;
  wire plusOp__22_carry__0_n_6;
  wire plusOp__22_carry__0_n_7;
  wire plusOp__22_carry_n_0;
  wire plusOp__22_carry_n_1;
  wire plusOp__22_carry_n_2;
  wire plusOp__22_carry_n_3;
  wire plusOp__22_carry_n_4;
  wire plusOp__22_carry_n_5;
  wire plusOp__22_carry_n_6;
  wire plusOp__22_carry_n_7;
  wire plusOp_carry__0_n_5;
  wire plusOp_carry__0_n_6;
  wire plusOp_carry__0_n_7;
  wire plusOp_carry_n_0;
  wire plusOp_carry_n_1;
  wire plusOp_carry_n_2;
  wire plusOp_carry_n_3;
  wire plusOp_carry_n_4;
  wire plusOp_carry_n_5;
  wire plusOp_carry_n_6;
  wire plusOp_carry_n_7;
  wire rd_en;
  wire [1:0]src_in;
  wire \vcount[0]_i_1_n_0 ;
  wire \vcount[12]_i_1_n_0 ;
  wire [12:0]vcount_reg;
  wire vfsm_rd_enable;
  wire video_active0;
  wire video_active1;
  wire video_active13_in;
  wire video_active1_carry_i_10_n_0;
  wire video_active1_carry_i_11_n_0;
  wire video_active1_carry_i_12_n_0;
  wire video_active1_carry_i_13_n_0;
  wire video_active1_carry_i_14_n_0;
  wire video_active1_carry_i_1_n_0;
  wire video_active1_carry_i_2_n_0;
  wire video_active1_carry_i_3_n_0;
  wire video_active1_carry_i_4_n_0;
  wire video_active1_carry_i_5_n_0;
  wire video_active1_carry_i_6_n_0;
  wire video_active1_carry_i_7_n_0;
  wire video_active1_carry_i_8_n_0;
  wire video_active1_carry_i_9_n_0;
  wire video_active1_carry_n_2;
  wire video_active1_carry_n_3;
  wire video_active1_carry_n_4;
  wire video_active1_carry_n_5;
  wire video_active1_carry_n_6;
  wire video_active1_carry_n_7;
  wire \video_active1_inferred__0/i__carry_n_2 ;
  wire \video_active1_inferred__0/i__carry_n_3 ;
  wire \video_active1_inferred__0/i__carry_n_4 ;
  wire \video_active1_inferred__0/i__carry_n_5 ;
  wire \video_active1_inferred__0/i__carry_n_6 ;
  wire \video_active1_inferred__0/i__carry_n_7 ;
  wire video_active_d;
  wire video_active_end10_out;
  wire video_active_end1__24;
  wire video_active_end_i_10_n_0;
  wire video_active_end_i_11_n_0;
  wire video_active_end_i_1_n_0;
  wire video_active_end_i_4_n_0;
  wire video_active_end_i_5_n_0;
  wire video_active_end_i_6_n_0;
  wire video_active_end_i_7_n_0;
  wire video_active_end_i_8_n_0;
  wire video_active_end_i_9_n_0;
  wire [12:0]video_active_end_reg_0;
  wire [12:0]video_active_end_reg_1;
  wire video_active_reg_0;
  wire video_clk;
  wire [12:0]video_frame_end0_carry_0;
  wire video_frame_end0_carry_i_10_n_0;
  wire video_frame_end0_carry_i_11_n_0;
  wire video_frame_end0_carry_i_12_n_0;
  wire video_frame_end0_carry_i_13_n_0;
  wire video_frame_end0_carry_i_14_n_0;
  wire video_frame_end0_carry_i_1_n_0;
  wire video_frame_end0_carry_i_2_n_0;
  wire video_frame_end0_carry_i_3_n_0;
  wire video_frame_end0_carry_i_4_n_0;
  wire video_frame_end0_carry_i_5_n_0;
  wire video_frame_end0_carry_i_6_n_0;
  wire video_frame_end0_carry_i_7_n_0;
  wire video_frame_end0_carry_i_8_n_0;
  wire video_frame_end0_carry_i_9_n_0;
  wire video_frame_end0_carry_n_1;
  wire video_frame_end0_carry_n_2;
  wire video_frame_end0_carry_n_3;
  wire video_frame_end0_carry_n_4;
  wire video_frame_end0_carry_n_5;
  wire video_frame_end0_carry_n_6;
  wire video_frame_end0_carry_n_7;
  wire video_frame_end1_carry_i_10_n_0;
  wire video_frame_end1_carry_i_11_n_0;
  wire video_frame_end1_carry_i_12_n_0;
  wire video_frame_end1_carry_i_13_n_0;
  wire video_frame_end1_carry_i_14_n_0;
  wire video_frame_end1_carry_i_1_n_0;
  wire video_frame_end1_carry_i_2_n_0;
  wire video_frame_end1_carry_i_3_n_0;
  wire video_frame_end1_carry_i_4_n_0;
  wire video_frame_end1_carry_i_5_n_0;
  wire video_frame_end1_carry_i_6_n_0;
  wire video_frame_end1_carry_i_7_n_0;
  wire video_frame_end1_carry_i_8_n_0;
  wire video_frame_end1_carry_i_9_n_0;
  wire video_frame_end1_carry_n_1;
  wire video_frame_end1_carry_n_2;
  wire video_frame_end1_carry_n_3;
  wire video_frame_end1_carry_n_4;
  wire video_frame_end1_carry_n_5;
  wire video_frame_end1_carry_n_6;
  wire video_frame_end1_carry_n_7;
  wire video_frame_end_i_1_n_0;
  wire video_hsync2;
  wire video_hsync22_in;
  wire [12:0]video_hsync2_carry_0;
  wire video_hsync2_carry_i_10_n_0;
  wire video_hsync2_carry_i_11_n_0;
  wire video_hsync2_carry_i_12_n_0;
  wire video_hsync2_carry_i_13_n_0;
  wire video_hsync2_carry_i_14_n_0;
  wire video_hsync2_carry_i_1_n_0;
  wire video_hsync2_carry_i_2_n_0;
  wire video_hsync2_carry_i_3_n_0;
  wire video_hsync2_carry_i_4_n_0;
  wire video_hsync2_carry_i_5_n_0;
  wire video_hsync2_carry_i_6_n_0;
  wire video_hsync2_carry_i_7_n_0;
  wire video_hsync2_carry_i_8_n_0;
  wire video_hsync2_carry_i_9_n_0;
  wire video_hsync2_carry_n_2;
  wire video_hsync2_carry_n_3;
  wire video_hsync2_carry_n_4;
  wire video_hsync2_carry_n_5;
  wire video_hsync2_carry_n_6;
  wire video_hsync2_carry_n_7;
  wire [12:0]\video_hsync2_inferred__0/i__carry_0 ;
  wire \video_hsync2_inferred__0/i__carry_n_2 ;
  wire \video_hsync2_inferred__0/i__carry_n_3 ;
  wire \video_hsync2_inferred__0/i__carry_n_4 ;
  wire \video_hsync2_inferred__0/i__carry_n_5 ;
  wire \video_hsync2_inferred__0/i__carry_n_6 ;
  wire \video_hsync2_inferred__0/i__carry_n_7 ;
  wire video_hsync_d;
  wire video_hsync_i_1_n_0;
  wire video_vsync2;
  wire video_vsync21_in;
  wire [12:0]video_vsync2_carry_0;
  wire video_vsync2_carry_i_10_n_0;
  wire video_vsync2_carry_i_11_n_0;
  wire video_vsync2_carry_i_12_n_0;
  wire video_vsync2_carry_i_13_n_0;
  wire video_vsync2_carry_i_14_n_0;
  wire video_vsync2_carry_i_1_n_0;
  wire video_vsync2_carry_i_2_n_0;
  wire video_vsync2_carry_i_3_n_0;
  wire video_vsync2_carry_i_4_n_0;
  wire video_vsync2_carry_i_5_n_0;
  wire video_vsync2_carry_i_6_n_0;
  wire video_vsync2_carry_i_7_n_0;
  wire video_vsync2_carry_i_8_n_0;
  wire video_vsync2_carry_i_9_n_0;
  wire video_vsync2_carry_n_2;
  wire video_vsync2_carry_n_3;
  wire video_vsync2_carry_n_4;
  wire video_vsync2_carry_n_5;
  wire video_vsync2_carry_n_6;
  wire video_vsync2_carry_n_7;
  wire [12:0]\video_vsync2_inferred__0/i__carry_0 ;
  wire \video_vsync2_inferred__0/i__carry_n_2 ;
  wire \video_vsync2_inferred__0/i__carry_n_3 ;
  wire \video_vsync2_inferred__0/i__carry_n_4 ;
  wire \video_vsync2_inferred__0/i__carry_n_5 ;
  wire \video_vsync2_inferred__0/i__carry_n_6 ;
  wire \video_vsync2_inferred__0/i__carry_n_7 ;
  wire video_vsync_d;
  wire video_vsync_i_1_n_0;
  wire [1:0]video_vsync_reg_0;
  wire [7:3]NLW_plusOp__22_carry__0_CO_UNCONNECTED;
  wire [7:4]NLW_plusOp__22_carry__0_O_UNCONNECTED;
  wire [7:3]NLW_plusOp_carry__0_CO_UNCONNECTED;
  wire [7:4]NLW_plusOp_carry__0_O_UNCONNECTED;
  wire [7:7]NLW_video_active1_carry_CO_UNCONNECTED;
  wire [7:0]NLW_video_active1_carry_O_UNCONNECTED;
  wire [7:7]\NLW_video_active1_inferred__0/i__carry_CO_UNCONNECTED ;
  wire [7:0]\NLW_video_active1_inferred__0/i__carry_O_UNCONNECTED ;
  wire [7:7]NLW_video_frame_end0_carry_CO_UNCONNECTED;
  wire [7:0]NLW_video_frame_end0_carry_O_UNCONNECTED;
  wire [7:7]NLW_video_frame_end1_carry_CO_UNCONNECTED;
  wire [7:0]NLW_video_frame_end1_carry_O_UNCONNECTED;
  wire [7:7]NLW_video_hsync2_carry_CO_UNCONNECTED;
  wire [7:0]NLW_video_hsync2_carry_O_UNCONNECTED;
  wire [7:7]\NLW_video_hsync2_inferred__0/i__carry_CO_UNCONNECTED ;
  wire [7:0]\NLW_video_hsync2_inferred__0/i__carry_O_UNCONNECTED ;
  wire [7:7]NLW_video_vsync2_carry_CO_UNCONNECTED;
  wire [7:0]NLW_video_vsync2_carry_O_UNCONNECTED;
  wire [7:7]\NLW_video_vsync2_inferred__0/i__carry_CO_UNCONNECTED ;
  wire [7:0]\NLW_video_vsync2_inferred__0/i__carry_O_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    \hcount[0]_i_1 
       (.I0(hcount_reg[0]),
        .O(\hcount[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \hcount[12]_i_1 
       (.I0(video_active_reg_0),
        .I1(video_frame_end1_carry_n_1),
        .O(\hcount[12]_i_1_n_0 ));
  FDRE \hcount_reg[0] 
       (.C(video_clk),
        .CE(1'b1),
        .D(\hcount[0]_i_1_n_0 ),
        .Q(hcount_reg[0]),
        .R(\hcount[12]_i_1_n_0 ));
  FDRE \hcount_reg[10] 
       (.C(video_clk),
        .CE(1'b1),
        .D(plusOp[10]),
        .Q(hcount_reg[10]),
        .R(\hcount[12]_i_1_n_0 ));
  FDRE \hcount_reg[11] 
       (.C(video_clk),
        .CE(1'b1),
        .D(plusOp[11]),
        .Q(hcount_reg[11]),
        .R(\hcount[12]_i_1_n_0 ));
  FDRE \hcount_reg[12] 
       (.C(video_clk),
        .CE(1'b1),
        .D(plusOp[12]),
        .Q(hcount_reg[12]),
        .R(\hcount[12]_i_1_n_0 ));
  FDRE \hcount_reg[1] 
       (.C(video_clk),
        .CE(1'b1),
        .D(plusOp[1]),
        .Q(hcount_reg[1]),
        .R(\hcount[12]_i_1_n_0 ));
  FDRE \hcount_reg[2] 
       (.C(video_clk),
        .CE(1'b1),
        .D(plusOp[2]),
        .Q(hcount_reg[2]),
        .R(\hcount[12]_i_1_n_0 ));
  FDRE \hcount_reg[3] 
       (.C(video_clk),
        .CE(1'b1),
        .D(plusOp[3]),
        .Q(hcount_reg[3]),
        .R(\hcount[12]_i_1_n_0 ));
  FDRE \hcount_reg[4] 
       (.C(video_clk),
        .CE(1'b1),
        .D(plusOp[4]),
        .Q(hcount_reg[4]),
        .R(\hcount[12]_i_1_n_0 ));
  FDRE \hcount_reg[5] 
       (.C(video_clk),
        .CE(1'b1),
        .D(plusOp[5]),
        .Q(hcount_reg[5]),
        .R(\hcount[12]_i_1_n_0 ));
  FDRE \hcount_reg[6] 
       (.C(video_clk),
        .CE(1'b1),
        .D(plusOp[6]),
        .Q(hcount_reg[6]),
        .R(\hcount[12]_i_1_n_0 ));
  FDRE \hcount_reg[7] 
       (.C(video_clk),
        .CE(1'b1),
        .D(plusOp[7]),
        .Q(hcount_reg[7]),
        .R(\hcount[12]_i_1_n_0 ));
  FDRE \hcount_reg[8] 
       (.C(video_clk),
        .CE(1'b1),
        .D(plusOp[8]),
        .Q(hcount_reg[8]),
        .R(\hcount[12]_i_1_n_0 ));
  FDRE \hcount_reg[9] 
       (.C(video_clk),
        .CE(1'b1),
        .D(plusOp[9]),
        .Q(hcount_reg[9]),
        .R(\hcount[12]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry_i_1
       (.I0(hcount_reg[12]),
        .I1(\video_hsync2_inferred__0/i__carry_0 [12]),
        .O(i__carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_10
       (.I0(hcount_reg[8]),
        .I1(\video_hsync2_inferred__0/i__carry_0 [8]),
        .I2(hcount_reg[9]),
        .I3(\video_hsync2_inferred__0/i__carry_0 [9]),
        .O(i__carry_i_10_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_10__0
       (.I0(vcount_reg[8]),
        .I1(\video_vsync2_inferred__0/i__carry_0 [8]),
        .I2(vcount_reg[9]),
        .I3(\video_vsync2_inferred__0/i__carry_0 [9]),
        .O(i__carry_i_10__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_10__1
       (.I0(video_active_end_reg_1[8]),
        .I1(hcount_reg[8]),
        .I2(video_active_end_reg_1[9]),
        .I3(hcount_reg[9]),
        .O(i__carry_i_10__1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_11
       (.I0(hcount_reg[6]),
        .I1(\video_hsync2_inferred__0/i__carry_0 [6]),
        .I2(hcount_reg[7]),
        .I3(\video_hsync2_inferred__0/i__carry_0 [7]),
        .O(i__carry_i_11_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_11__0
       (.I0(vcount_reg[6]),
        .I1(\video_vsync2_inferred__0/i__carry_0 [6]),
        .I2(vcount_reg[7]),
        .I3(\video_vsync2_inferred__0/i__carry_0 [7]),
        .O(i__carry_i_11__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_11__1
       (.I0(video_active_end_reg_1[6]),
        .I1(hcount_reg[6]),
        .I2(video_active_end_reg_1[7]),
        .I3(hcount_reg[7]),
        .O(i__carry_i_11__1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_12
       (.I0(hcount_reg[4]),
        .I1(\video_hsync2_inferred__0/i__carry_0 [4]),
        .I2(hcount_reg[5]),
        .I3(\video_hsync2_inferred__0/i__carry_0 [5]),
        .O(i__carry_i_12_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_12__0
       (.I0(vcount_reg[4]),
        .I1(\video_vsync2_inferred__0/i__carry_0 [4]),
        .I2(vcount_reg[5]),
        .I3(\video_vsync2_inferred__0/i__carry_0 [5]),
        .O(i__carry_i_12__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_12__1
       (.I0(video_active_end_reg_1[4]),
        .I1(hcount_reg[4]),
        .I2(video_active_end_reg_1[5]),
        .I3(hcount_reg[5]),
        .O(i__carry_i_12__1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_13
       (.I0(hcount_reg[2]),
        .I1(\video_hsync2_inferred__0/i__carry_0 [2]),
        .I2(hcount_reg[3]),
        .I3(\video_hsync2_inferred__0/i__carry_0 [3]),
        .O(i__carry_i_13_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_13__0
       (.I0(vcount_reg[2]),
        .I1(\video_vsync2_inferred__0/i__carry_0 [2]),
        .I2(vcount_reg[3]),
        .I3(\video_vsync2_inferred__0/i__carry_0 [3]),
        .O(i__carry_i_13__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_13__1
       (.I0(video_active_end_reg_1[2]),
        .I1(hcount_reg[2]),
        .I2(video_active_end_reg_1[3]),
        .I3(hcount_reg[3]),
        .O(i__carry_i_13__1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_14
       (.I0(hcount_reg[0]),
        .I1(\video_hsync2_inferred__0/i__carry_0 [0]),
        .I2(hcount_reg[1]),
        .I3(\video_hsync2_inferred__0/i__carry_0 [1]),
        .O(i__carry_i_14_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_14__0
       (.I0(vcount_reg[0]),
        .I1(\video_vsync2_inferred__0/i__carry_0 [0]),
        .I2(vcount_reg[1]),
        .I3(\video_vsync2_inferred__0/i__carry_0 [1]),
        .O(i__carry_i_14__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_14__1
       (.I0(video_active_end_reg_1[0]),
        .I1(hcount_reg[0]),
        .I2(video_active_end_reg_1[1]),
        .I3(hcount_reg[1]),
        .O(i__carry_i_14__1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry_i_1__0
       (.I0(vcount_reg[12]),
        .I1(\video_vsync2_inferred__0/i__carry_0 [12]),
        .O(i__carry_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry_i_1__1
       (.I0(video_active_end_reg_1[12]),
        .I1(hcount_reg[12]),
        .O(i__carry_i_1__1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_2
       (.I0(hcount_reg[10]),
        .I1(\video_hsync2_inferred__0/i__carry_0 [10]),
        .I2(\video_hsync2_inferred__0/i__carry_0 [11]),
        .I3(hcount_reg[11]),
        .O(i__carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_2__0
       (.I0(vcount_reg[10]),
        .I1(\video_vsync2_inferred__0/i__carry_0 [10]),
        .I2(\video_vsync2_inferred__0/i__carry_0 [11]),
        .I3(vcount_reg[11]),
        .O(i__carry_i_2__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_2__1
       (.I0(video_active_end_reg_1[10]),
        .I1(hcount_reg[10]),
        .I2(hcount_reg[11]),
        .I3(video_active_end_reg_1[11]),
        .O(i__carry_i_2__1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_3
       (.I0(hcount_reg[8]),
        .I1(\video_hsync2_inferred__0/i__carry_0 [8]),
        .I2(\video_hsync2_inferred__0/i__carry_0 [9]),
        .I3(hcount_reg[9]),
        .O(i__carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_3__0
       (.I0(vcount_reg[8]),
        .I1(\video_vsync2_inferred__0/i__carry_0 [8]),
        .I2(\video_vsync2_inferred__0/i__carry_0 [9]),
        .I3(vcount_reg[9]),
        .O(i__carry_i_3__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_3__1
       (.I0(video_active_end_reg_1[8]),
        .I1(hcount_reg[8]),
        .I2(hcount_reg[9]),
        .I3(video_active_end_reg_1[9]),
        .O(i__carry_i_3__1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_4
       (.I0(hcount_reg[6]),
        .I1(\video_hsync2_inferred__0/i__carry_0 [6]),
        .I2(\video_hsync2_inferred__0/i__carry_0 [7]),
        .I3(hcount_reg[7]),
        .O(i__carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_4__0
       (.I0(vcount_reg[6]),
        .I1(\video_vsync2_inferred__0/i__carry_0 [6]),
        .I2(\video_vsync2_inferred__0/i__carry_0 [7]),
        .I3(vcount_reg[7]),
        .O(i__carry_i_4__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_4__1
       (.I0(video_active_end_reg_1[6]),
        .I1(hcount_reg[6]),
        .I2(hcount_reg[7]),
        .I3(video_active_end_reg_1[7]),
        .O(i__carry_i_4__1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_5
       (.I0(hcount_reg[4]),
        .I1(\video_hsync2_inferred__0/i__carry_0 [4]),
        .I2(\video_hsync2_inferred__0/i__carry_0 [5]),
        .I3(hcount_reg[5]),
        .O(i__carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_5__0
       (.I0(vcount_reg[4]),
        .I1(\video_vsync2_inferred__0/i__carry_0 [4]),
        .I2(\video_vsync2_inferred__0/i__carry_0 [5]),
        .I3(vcount_reg[5]),
        .O(i__carry_i_5__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_5__1
       (.I0(video_active_end_reg_1[4]),
        .I1(hcount_reg[4]),
        .I2(hcount_reg[5]),
        .I3(video_active_end_reg_1[5]),
        .O(i__carry_i_5__1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_6
       (.I0(hcount_reg[2]),
        .I1(\video_hsync2_inferred__0/i__carry_0 [2]),
        .I2(\video_hsync2_inferred__0/i__carry_0 [3]),
        .I3(hcount_reg[3]),
        .O(i__carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_6__0
       (.I0(vcount_reg[2]),
        .I1(\video_vsync2_inferred__0/i__carry_0 [2]),
        .I2(\video_vsync2_inferred__0/i__carry_0 [3]),
        .I3(vcount_reg[3]),
        .O(i__carry_i_6__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_6__1
       (.I0(video_active_end_reg_1[2]),
        .I1(hcount_reg[2]),
        .I2(hcount_reg[3]),
        .I3(video_active_end_reg_1[3]),
        .O(i__carry_i_6__1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_7
       (.I0(hcount_reg[0]),
        .I1(\video_hsync2_inferred__0/i__carry_0 [0]),
        .I2(\video_hsync2_inferred__0/i__carry_0 [1]),
        .I3(hcount_reg[1]),
        .O(i__carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_7__0
       (.I0(vcount_reg[0]),
        .I1(\video_vsync2_inferred__0/i__carry_0 [0]),
        .I2(\video_vsync2_inferred__0/i__carry_0 [1]),
        .I3(vcount_reg[1]),
        .O(i__carry_i_7__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    i__carry_i_7__1
       (.I0(video_active_end_reg_1[0]),
        .I1(hcount_reg[0]),
        .I2(hcount_reg[1]),
        .I3(video_active_end_reg_1[1]),
        .O(i__carry_i_7__1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_8
       (.I0(\video_hsync2_inferred__0/i__carry_0 [12]),
        .I1(hcount_reg[12]),
        .O(i__carry_i_8_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_8__0
       (.I0(\video_vsync2_inferred__0/i__carry_0 [12]),
        .I1(vcount_reg[12]),
        .O(i__carry_i_8__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_8__1
       (.I0(hcount_reg[12]),
        .I1(video_active_end_reg_1[12]),
        .O(i__carry_i_8__1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_9
       (.I0(hcount_reg[10]),
        .I1(\video_hsync2_inferred__0/i__carry_0 [10]),
        .I2(hcount_reg[11]),
        .I3(\video_hsync2_inferred__0/i__carry_0 [11]),
        .O(i__carry_i_9_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_9__0
       (.I0(vcount_reg[10]),
        .I1(\video_vsync2_inferred__0/i__carry_0 [10]),
        .I2(vcount_reg[11]),
        .I3(\video_vsync2_inferred__0/i__carry_0 [11]),
        .O(i__carry_i_9__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_9__1
       (.I0(video_active_end_reg_1[10]),
        .I1(hcount_reg[10]),
        .I2(video_active_end_reg_1[11]),
        .I3(hcount_reg[11]),
        .O(i__carry_i_9__1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 plusOp__22_carry
       (.CI(vcount_reg[0]),
        .CI_TOP(1'b0),
        .CO({plusOp__22_carry_n_0,plusOp__22_carry_n_1,plusOp__22_carry_n_2,plusOp__22_carry_n_3,plusOp__22_carry_n_4,plusOp__22_carry_n_5,plusOp__22_carry_n_6,plusOp__22_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp__0[8:1]),
        .S(vcount_reg[8:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 plusOp__22_carry__0
       (.CI(plusOp__22_carry_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_plusOp__22_carry__0_CO_UNCONNECTED[7:3],plusOp__22_carry__0_n_5,plusOp__22_carry__0_n_6,plusOp__22_carry__0_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_plusOp__22_carry__0_O_UNCONNECTED[7:4],plusOp__0[12:9]}),
        .S({1'b0,1'b0,1'b0,1'b0,vcount_reg[12:9]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 plusOp_carry
       (.CI(hcount_reg[0]),
        .CI_TOP(1'b0),
        .CO({plusOp_carry_n_0,plusOp_carry_n_1,plusOp_carry_n_2,plusOp_carry_n_3,plusOp_carry_n_4,plusOp_carry_n_5,plusOp_carry_n_6,plusOp_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[8:1]),
        .S(hcount_reg[8:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 plusOp_carry__0
       (.CI(plusOp_carry_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_plusOp_carry__0_CO_UNCONNECTED[7:3],plusOp_carry__0_n_5,plusOp_carry__0_n_6,plusOp_carry__0_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_plusOp_carry__0_O_UNCONNECTED[7:4],plusOp[12:9]}),
        .S({1'b0,1'b0,1'b0,1'b0,hcount_reg[12:9]}));
  LUT1 #(
    .INIT(2'h1)) 
    \vcount[0]_i_1 
       (.I0(vcount_reg[0]),
        .O(\vcount[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hEA)) 
    \vcount[12]_i_1 
       (.I0(video_active_reg_0),
        .I1(video_frame_end0_carry_n_1),
        .I2(video_frame_end1_carry_n_1),
        .O(\vcount[12]_i_1_n_0 ));
  FDRE \vcount_reg[0] 
       (.C(video_clk),
        .CE(video_frame_end1_carry_n_1),
        .D(\vcount[0]_i_1_n_0 ),
        .Q(vcount_reg[0]),
        .R(\vcount[12]_i_1_n_0 ));
  FDRE \vcount_reg[10] 
       (.C(video_clk),
        .CE(video_frame_end1_carry_n_1),
        .D(plusOp__0[10]),
        .Q(vcount_reg[10]),
        .R(\vcount[12]_i_1_n_0 ));
  FDRE \vcount_reg[11] 
       (.C(video_clk),
        .CE(video_frame_end1_carry_n_1),
        .D(plusOp__0[11]),
        .Q(vcount_reg[11]),
        .R(\vcount[12]_i_1_n_0 ));
  FDRE \vcount_reg[12] 
       (.C(video_clk),
        .CE(video_frame_end1_carry_n_1),
        .D(plusOp__0[12]),
        .Q(vcount_reg[12]),
        .R(\vcount[12]_i_1_n_0 ));
  FDRE \vcount_reg[1] 
       (.C(video_clk),
        .CE(video_frame_end1_carry_n_1),
        .D(plusOp__0[1]),
        .Q(vcount_reg[1]),
        .R(\vcount[12]_i_1_n_0 ));
  FDRE \vcount_reg[2] 
       (.C(video_clk),
        .CE(video_frame_end1_carry_n_1),
        .D(plusOp__0[2]),
        .Q(vcount_reg[2]),
        .R(\vcount[12]_i_1_n_0 ));
  FDRE \vcount_reg[3] 
       (.C(video_clk),
        .CE(video_frame_end1_carry_n_1),
        .D(plusOp__0[3]),
        .Q(vcount_reg[3]),
        .R(\vcount[12]_i_1_n_0 ));
  FDRE \vcount_reg[4] 
       (.C(video_clk),
        .CE(video_frame_end1_carry_n_1),
        .D(plusOp__0[4]),
        .Q(vcount_reg[4]),
        .R(\vcount[12]_i_1_n_0 ));
  FDRE \vcount_reg[5] 
       (.C(video_clk),
        .CE(video_frame_end1_carry_n_1),
        .D(plusOp__0[5]),
        .Q(vcount_reg[5]),
        .R(\vcount[12]_i_1_n_0 ));
  FDRE \vcount_reg[6] 
       (.C(video_clk),
        .CE(video_frame_end1_carry_n_1),
        .D(plusOp__0[6]),
        .Q(vcount_reg[6]),
        .R(\vcount[12]_i_1_n_0 ));
  FDRE \vcount_reg[7] 
       (.C(video_clk),
        .CE(video_frame_end1_carry_n_1),
        .D(plusOp__0[7]),
        .Q(vcount_reg[7]),
        .R(\vcount[12]_i_1_n_0 ));
  FDRE \vcount_reg[8] 
       (.C(video_clk),
        .CE(video_frame_end1_carry_n_1),
        .D(plusOp__0[8]),
        .Q(vcount_reg[8]),
        .R(\vcount[12]_i_1_n_0 ));
  FDRE \vcount_reg[9] 
       (.C(video_clk),
        .CE(video_frame_end1_carry_n_1),
        .D(plusOp__0[9]),
        .Q(vcount_reg[9]),
        .R(\vcount[12]_i_1_n_0 ));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY8 video_active1_carry
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({NLW_video_active1_carry_CO_UNCONNECTED[7],video_active1,video_active1_carry_n_2,video_active1_carry_n_3,video_active1_carry_n_4,video_active1_carry_n_5,video_active1_carry_n_6,video_active1_carry_n_7}),
        .DI({1'b0,video_active1_carry_i_1_n_0,video_active1_carry_i_2_n_0,video_active1_carry_i_3_n_0,video_active1_carry_i_4_n_0,video_active1_carry_i_5_n_0,video_active1_carry_i_6_n_0,video_active1_carry_i_7_n_0}),
        .O(NLW_video_active1_carry_O_UNCONNECTED[7:0]),
        .S({1'b0,video_active1_carry_i_8_n_0,video_active1_carry_i_9_n_0,video_active1_carry_i_10_n_0,video_active1_carry_i_11_n_0,video_active1_carry_i_12_n_0,video_active1_carry_i_13_n_0,video_active1_carry_i_14_n_0}));
  LUT2 #(
    .INIT(4'h2)) 
    video_active1_carry_i_1
       (.I0(video_active_end_reg_0[12]),
        .I1(vcount_reg[12]),
        .O(video_active1_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_active1_carry_i_10
       (.I0(video_active_end_reg_0[8]),
        .I1(vcount_reg[8]),
        .I2(video_active_end_reg_0[9]),
        .I3(vcount_reg[9]),
        .O(video_active1_carry_i_10_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_active1_carry_i_11
       (.I0(video_active_end_reg_0[6]),
        .I1(vcount_reg[6]),
        .I2(video_active_end_reg_0[7]),
        .I3(vcount_reg[7]),
        .O(video_active1_carry_i_11_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_active1_carry_i_12
       (.I0(video_active_end_reg_0[4]),
        .I1(vcount_reg[4]),
        .I2(video_active_end_reg_0[5]),
        .I3(vcount_reg[5]),
        .O(video_active1_carry_i_12_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_active1_carry_i_13
       (.I0(video_active_end_reg_0[2]),
        .I1(vcount_reg[2]),
        .I2(video_active_end_reg_0[3]),
        .I3(vcount_reg[3]),
        .O(video_active1_carry_i_13_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_active1_carry_i_14
       (.I0(video_active_end_reg_0[0]),
        .I1(vcount_reg[0]),
        .I2(video_active_end_reg_0[1]),
        .I3(vcount_reg[1]),
        .O(video_active1_carry_i_14_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_active1_carry_i_2
       (.I0(video_active_end_reg_0[10]),
        .I1(vcount_reg[10]),
        .I2(vcount_reg[11]),
        .I3(video_active_end_reg_0[11]),
        .O(video_active1_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_active1_carry_i_3
       (.I0(video_active_end_reg_0[8]),
        .I1(vcount_reg[8]),
        .I2(vcount_reg[9]),
        .I3(video_active_end_reg_0[9]),
        .O(video_active1_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_active1_carry_i_4
       (.I0(video_active_end_reg_0[6]),
        .I1(vcount_reg[6]),
        .I2(vcount_reg[7]),
        .I3(video_active_end_reg_0[7]),
        .O(video_active1_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_active1_carry_i_5
       (.I0(video_active_end_reg_0[4]),
        .I1(vcount_reg[4]),
        .I2(vcount_reg[5]),
        .I3(video_active_end_reg_0[5]),
        .O(video_active1_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_active1_carry_i_6
       (.I0(video_active_end_reg_0[2]),
        .I1(vcount_reg[2]),
        .I2(vcount_reg[3]),
        .I3(video_active_end_reg_0[3]),
        .O(video_active1_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_active1_carry_i_7
       (.I0(video_active_end_reg_0[0]),
        .I1(vcount_reg[0]),
        .I2(vcount_reg[1]),
        .I3(video_active_end_reg_0[1]),
        .O(video_active1_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    video_active1_carry_i_8
       (.I0(vcount_reg[12]),
        .I1(video_active_end_reg_0[12]),
        .O(video_active1_carry_i_8_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_active1_carry_i_9
       (.I0(video_active_end_reg_0[10]),
        .I1(vcount_reg[10]),
        .I2(video_active_end_reg_0[11]),
        .I3(vcount_reg[11]),
        .O(video_active1_carry_i_9_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY8 \video_active1_inferred__0/i__carry 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({\NLW_video_active1_inferred__0/i__carry_CO_UNCONNECTED [7],video_active13_in,\video_active1_inferred__0/i__carry_n_2 ,\video_active1_inferred__0/i__carry_n_3 ,\video_active1_inferred__0/i__carry_n_4 ,\video_active1_inferred__0/i__carry_n_5 ,\video_active1_inferred__0/i__carry_n_6 ,\video_active1_inferred__0/i__carry_n_7 }),
        .DI({1'b0,i__carry_i_1__1_n_0,i__carry_i_2__1_n_0,i__carry_i_3__1_n_0,i__carry_i_4__1_n_0,i__carry_i_5__1_n_0,i__carry_i_6__1_n_0,i__carry_i_7__1_n_0}),
        .O(\NLW_video_active1_inferred__0/i__carry_O_UNCONNECTED [7:0]),
        .S({1'b0,i__carry_i_8__1_n_0,i__carry_i_9__1_n_0,i__carry_i_10__1_n_0,i__carry_i_11__1_n_0,i__carry_i_12__1_n_0,i__carry_i_13__1_n_0,i__carry_i_14__1_n_0}));
  LUT4 #(
    .INIT(16'hB888)) 
    video_active_end_i_1
       (.I0(src_in[0]),
        .I1(video_active_reg_0),
        .I2(video_active_end10_out),
        .I3(video_active_end1__24),
        .O(video_active_end_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    video_active_end_i_10
       (.I0(vcount_reg[0]),
        .I1(video_active_end_reg_0[0]),
        .I2(video_active_end_reg_0[2]),
        .I3(vcount_reg[2]),
        .I4(video_active_end_reg_0[1]),
        .I5(vcount_reg[1]),
        .O(video_active_end_i_10_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    video_active_end_i_11
       (.I0(vcount_reg[3]),
        .I1(video_active_end_reg_0[3]),
        .I2(video_active_end_reg_0[5]),
        .I3(vcount_reg[5]),
        .I4(video_active_end_reg_0[4]),
        .I5(vcount_reg[4]),
        .O(video_active_end_i_11_n_0));
  LUT6 #(
    .INIT(64'h9000000000000000)) 
    video_active_end_i_2
       (.I0(hcount_reg[12]),
        .I1(video_active_end_reg_1[12]),
        .I2(video_active_end_i_4_n_0),
        .I3(video_active_end_i_5_n_0),
        .I4(video_active_end_i_6_n_0),
        .I5(video_active_end_i_7_n_0),
        .O(video_active_end10_out));
  LUT6 #(
    .INIT(64'h9000000000000000)) 
    video_active_end_i_3
       (.I0(vcount_reg[12]),
        .I1(video_active_end_reg_0[12]),
        .I2(video_active_end_i_8_n_0),
        .I3(video_active_end_i_9_n_0),
        .I4(video_active_end_i_10_n_0),
        .I5(video_active_end_i_11_n_0),
        .O(video_active_end1__24));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    video_active_end_i_4
       (.I0(hcount_reg[6]),
        .I1(video_active_end_reg_1[6]),
        .I2(video_active_end_reg_1[8]),
        .I3(hcount_reg[8]),
        .I4(video_active_end_reg_1[7]),
        .I5(hcount_reg[7]),
        .O(video_active_end_i_4_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    video_active_end_i_5
       (.I0(hcount_reg[9]),
        .I1(video_active_end_reg_1[9]),
        .I2(video_active_end_reg_1[11]),
        .I3(hcount_reg[11]),
        .I4(video_active_end_reg_1[10]),
        .I5(hcount_reg[10]),
        .O(video_active_end_i_5_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    video_active_end_i_6
       (.I0(hcount_reg[0]),
        .I1(video_active_end_reg_1[0]),
        .I2(video_active_end_reg_1[2]),
        .I3(hcount_reg[2]),
        .I4(video_active_end_reg_1[1]),
        .I5(hcount_reg[1]),
        .O(video_active_end_i_6_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    video_active_end_i_7
       (.I0(hcount_reg[3]),
        .I1(video_active_end_reg_1[3]),
        .I2(video_active_end_reg_1[5]),
        .I3(hcount_reg[5]),
        .I4(video_active_end_reg_1[4]),
        .I5(hcount_reg[4]),
        .O(video_active_end_i_7_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    video_active_end_i_8
       (.I0(vcount_reg[6]),
        .I1(video_active_end_reg_0[6]),
        .I2(video_active_end_reg_0[8]),
        .I3(vcount_reg[8]),
        .I4(video_active_end_reg_0[7]),
        .I5(vcount_reg[7]),
        .O(video_active_end_i_8_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    video_active_end_i_9
       (.I0(vcount_reg[9]),
        .I1(video_active_end_reg_0[9]),
        .I2(video_active_end_reg_0[11]),
        .I3(vcount_reg[11]),
        .I4(video_active_end_reg_0[10]),
        .I5(vcount_reg[10]),
        .O(video_active_end_i_9_n_0));
  FDRE video_active_end_reg
       (.C(video_clk),
        .CE(1'b1),
        .D(video_active_end_i_1_n_0),
        .Q(src_in[0]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    video_active_i_1
       (.I0(video_active13_in),
        .I1(video_active1),
        .O(video_active0));
  FDRE video_active_reg
       (.C(video_clk),
        .CE(1'b1),
        .D(video_active0),
        .Q(video_active_d),
        .R(video_active_reg_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY8 video_frame_end0_carry
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({NLW_video_frame_end0_carry_CO_UNCONNECTED[7],video_frame_end0_carry_n_1,video_frame_end0_carry_n_2,video_frame_end0_carry_n_3,video_frame_end0_carry_n_4,video_frame_end0_carry_n_5,video_frame_end0_carry_n_6,video_frame_end0_carry_n_7}),
        .DI({1'b0,video_frame_end0_carry_i_1_n_0,video_frame_end0_carry_i_2_n_0,video_frame_end0_carry_i_3_n_0,video_frame_end0_carry_i_4_n_0,video_frame_end0_carry_i_5_n_0,video_frame_end0_carry_i_6_n_0,video_frame_end0_carry_i_7_n_0}),
        .O(NLW_video_frame_end0_carry_O_UNCONNECTED[7:0]),
        .S({1'b0,video_frame_end0_carry_i_8_n_0,video_frame_end0_carry_i_9_n_0,video_frame_end0_carry_i_10_n_0,video_frame_end0_carry_i_11_n_0,video_frame_end0_carry_i_12_n_0,video_frame_end0_carry_i_13_n_0,video_frame_end0_carry_i_14_n_0}));
  LUT2 #(
    .INIT(4'h2)) 
    video_frame_end0_carry_i_1
       (.I0(vcount_reg[12]),
        .I1(video_frame_end0_carry_0[12]),
        .O(video_frame_end0_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_frame_end0_carry_i_10
       (.I0(vcount_reg[8]),
        .I1(video_frame_end0_carry_0[8]),
        .I2(vcount_reg[9]),
        .I3(video_frame_end0_carry_0[9]),
        .O(video_frame_end0_carry_i_10_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_frame_end0_carry_i_11
       (.I0(vcount_reg[6]),
        .I1(video_frame_end0_carry_0[6]),
        .I2(vcount_reg[7]),
        .I3(video_frame_end0_carry_0[7]),
        .O(video_frame_end0_carry_i_11_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_frame_end0_carry_i_12
       (.I0(vcount_reg[4]),
        .I1(video_frame_end0_carry_0[4]),
        .I2(vcount_reg[5]),
        .I3(video_frame_end0_carry_0[5]),
        .O(video_frame_end0_carry_i_12_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_frame_end0_carry_i_13
       (.I0(vcount_reg[2]),
        .I1(video_frame_end0_carry_0[2]),
        .I2(vcount_reg[3]),
        .I3(video_frame_end0_carry_0[3]),
        .O(video_frame_end0_carry_i_13_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_frame_end0_carry_i_14
       (.I0(vcount_reg[0]),
        .I1(video_frame_end0_carry_0[0]),
        .I2(vcount_reg[1]),
        .I3(video_frame_end0_carry_0[1]),
        .O(video_frame_end0_carry_i_14_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_frame_end0_carry_i_2
       (.I0(vcount_reg[10]),
        .I1(video_frame_end0_carry_0[10]),
        .I2(video_frame_end0_carry_0[11]),
        .I3(vcount_reg[11]),
        .O(video_frame_end0_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_frame_end0_carry_i_3
       (.I0(vcount_reg[8]),
        .I1(video_frame_end0_carry_0[8]),
        .I2(video_frame_end0_carry_0[9]),
        .I3(vcount_reg[9]),
        .O(video_frame_end0_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_frame_end0_carry_i_4
       (.I0(vcount_reg[6]),
        .I1(video_frame_end0_carry_0[6]),
        .I2(video_frame_end0_carry_0[7]),
        .I3(vcount_reg[7]),
        .O(video_frame_end0_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_frame_end0_carry_i_5
       (.I0(vcount_reg[4]),
        .I1(video_frame_end0_carry_0[4]),
        .I2(video_frame_end0_carry_0[5]),
        .I3(vcount_reg[5]),
        .O(video_frame_end0_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_frame_end0_carry_i_6
       (.I0(vcount_reg[2]),
        .I1(video_frame_end0_carry_0[2]),
        .I2(video_frame_end0_carry_0[3]),
        .I3(vcount_reg[3]),
        .O(video_frame_end0_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_frame_end0_carry_i_7
       (.I0(vcount_reg[0]),
        .I1(video_frame_end0_carry_0[0]),
        .I2(video_frame_end0_carry_0[1]),
        .I3(vcount_reg[1]),
        .O(video_frame_end0_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    video_frame_end0_carry_i_8
       (.I0(video_frame_end0_carry_0[12]),
        .I1(vcount_reg[12]),
        .O(video_frame_end0_carry_i_8_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_frame_end0_carry_i_9
       (.I0(vcount_reg[10]),
        .I1(video_frame_end0_carry_0[10]),
        .I2(vcount_reg[11]),
        .I3(video_frame_end0_carry_0[11]),
        .O(video_frame_end0_carry_i_9_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY8 video_frame_end1_carry
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({NLW_video_frame_end1_carry_CO_UNCONNECTED[7],video_frame_end1_carry_n_1,video_frame_end1_carry_n_2,video_frame_end1_carry_n_3,video_frame_end1_carry_n_4,video_frame_end1_carry_n_5,video_frame_end1_carry_n_6,video_frame_end1_carry_n_7}),
        .DI({1'b0,video_frame_end1_carry_i_1_n_0,video_frame_end1_carry_i_2_n_0,video_frame_end1_carry_i_3_n_0,video_frame_end1_carry_i_4_n_0,video_frame_end1_carry_i_5_n_0,video_frame_end1_carry_i_6_n_0,video_frame_end1_carry_i_7_n_0}),
        .O(NLW_video_frame_end1_carry_O_UNCONNECTED[7:0]),
        .S({1'b0,video_frame_end1_carry_i_8_n_0,video_frame_end1_carry_i_9_n_0,video_frame_end1_carry_i_10_n_0,video_frame_end1_carry_i_11_n_0,video_frame_end1_carry_i_12_n_0,video_frame_end1_carry_i_13_n_0,video_frame_end1_carry_i_14_n_0}));
  LUT2 #(
    .INIT(4'h2)) 
    video_frame_end1_carry_i_1
       (.I0(hcount_reg[12]),
        .I1(Q[12]),
        .O(video_frame_end1_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_frame_end1_carry_i_10
       (.I0(hcount_reg[8]),
        .I1(Q[8]),
        .I2(hcount_reg[9]),
        .I3(Q[9]),
        .O(video_frame_end1_carry_i_10_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_frame_end1_carry_i_11
       (.I0(hcount_reg[6]),
        .I1(Q[6]),
        .I2(hcount_reg[7]),
        .I3(Q[7]),
        .O(video_frame_end1_carry_i_11_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_frame_end1_carry_i_12
       (.I0(hcount_reg[4]),
        .I1(Q[4]),
        .I2(hcount_reg[5]),
        .I3(Q[5]),
        .O(video_frame_end1_carry_i_12_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_frame_end1_carry_i_13
       (.I0(hcount_reg[2]),
        .I1(Q[2]),
        .I2(hcount_reg[3]),
        .I3(Q[3]),
        .O(video_frame_end1_carry_i_13_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_frame_end1_carry_i_14
       (.I0(hcount_reg[0]),
        .I1(Q[0]),
        .I2(hcount_reg[1]),
        .I3(Q[1]),
        .O(video_frame_end1_carry_i_14_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_frame_end1_carry_i_2
       (.I0(hcount_reg[10]),
        .I1(Q[10]),
        .I2(Q[11]),
        .I3(hcount_reg[11]),
        .O(video_frame_end1_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_frame_end1_carry_i_3
       (.I0(hcount_reg[8]),
        .I1(Q[8]),
        .I2(Q[9]),
        .I3(hcount_reg[9]),
        .O(video_frame_end1_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_frame_end1_carry_i_4
       (.I0(hcount_reg[6]),
        .I1(Q[6]),
        .I2(Q[7]),
        .I3(hcount_reg[7]),
        .O(video_frame_end1_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_frame_end1_carry_i_5
       (.I0(hcount_reg[4]),
        .I1(Q[4]),
        .I2(Q[5]),
        .I3(hcount_reg[5]),
        .O(video_frame_end1_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_frame_end1_carry_i_6
       (.I0(hcount_reg[2]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(hcount_reg[3]),
        .O(video_frame_end1_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_frame_end1_carry_i_7
       (.I0(hcount_reg[0]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(hcount_reg[1]),
        .O(video_frame_end1_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    video_frame_end1_carry_i_8
       (.I0(Q[12]),
        .I1(hcount_reg[12]),
        .O(video_frame_end1_carry_i_8_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_frame_end1_carry_i_9
       (.I0(hcount_reg[10]),
        .I1(Q[10]),
        .I2(hcount_reg[11]),
        .I3(Q[11]),
        .O(video_frame_end1_carry_i_9_n_0));
  LUT3 #(
    .INIT(8'h08)) 
    video_frame_end_i_1
       (.I0(video_frame_end0_carry_n_1),
        .I1(video_frame_end1_carry_n_1),
        .I2(video_active_reg_0),
        .O(video_frame_end_i_1_n_0));
  FDRE video_frame_end_reg
       (.C(video_clk),
        .CE(1'b1),
        .D(video_frame_end_i_1_n_0),
        .Q(src_in[1]),
        .R(1'b0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY8 video_hsync2_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({NLW_video_hsync2_carry_CO_UNCONNECTED[7],video_hsync2,video_hsync2_carry_n_2,video_hsync2_carry_n_3,video_hsync2_carry_n_4,video_hsync2_carry_n_5,video_hsync2_carry_n_6,video_hsync2_carry_n_7}),
        .DI({1'b0,video_hsync2_carry_i_1_n_0,video_hsync2_carry_i_2_n_0,video_hsync2_carry_i_3_n_0,video_hsync2_carry_i_4_n_0,video_hsync2_carry_i_5_n_0,video_hsync2_carry_i_6_n_0,video_hsync2_carry_i_7_n_0}),
        .O(NLW_video_hsync2_carry_O_UNCONNECTED[7:0]),
        .S({1'b0,video_hsync2_carry_i_8_n_0,video_hsync2_carry_i_9_n_0,video_hsync2_carry_i_10_n_0,video_hsync2_carry_i_11_n_0,video_hsync2_carry_i_12_n_0,video_hsync2_carry_i_13_n_0,video_hsync2_carry_i_14_n_0}));
  LUT2 #(
    .INIT(4'h2)) 
    video_hsync2_carry_i_1
       (.I0(video_hsync2_carry_0[12]),
        .I1(hcount_reg[12]),
        .O(video_hsync2_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_hsync2_carry_i_10
       (.I0(video_hsync2_carry_0[8]),
        .I1(hcount_reg[8]),
        .I2(video_hsync2_carry_0[9]),
        .I3(hcount_reg[9]),
        .O(video_hsync2_carry_i_10_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_hsync2_carry_i_11
       (.I0(video_hsync2_carry_0[6]),
        .I1(hcount_reg[6]),
        .I2(video_hsync2_carry_0[7]),
        .I3(hcount_reg[7]),
        .O(video_hsync2_carry_i_11_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_hsync2_carry_i_12
       (.I0(video_hsync2_carry_0[4]),
        .I1(hcount_reg[4]),
        .I2(video_hsync2_carry_0[5]),
        .I3(hcount_reg[5]),
        .O(video_hsync2_carry_i_12_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_hsync2_carry_i_13
       (.I0(video_hsync2_carry_0[2]),
        .I1(hcount_reg[2]),
        .I2(video_hsync2_carry_0[3]),
        .I3(hcount_reg[3]),
        .O(video_hsync2_carry_i_13_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_hsync2_carry_i_14
       (.I0(video_hsync2_carry_0[0]),
        .I1(hcount_reg[0]),
        .I2(video_hsync2_carry_0[1]),
        .I3(hcount_reg[1]),
        .O(video_hsync2_carry_i_14_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_hsync2_carry_i_2
       (.I0(video_hsync2_carry_0[10]),
        .I1(hcount_reg[10]),
        .I2(hcount_reg[11]),
        .I3(video_hsync2_carry_0[11]),
        .O(video_hsync2_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_hsync2_carry_i_3
       (.I0(video_hsync2_carry_0[8]),
        .I1(hcount_reg[8]),
        .I2(hcount_reg[9]),
        .I3(video_hsync2_carry_0[9]),
        .O(video_hsync2_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_hsync2_carry_i_4
       (.I0(video_hsync2_carry_0[6]),
        .I1(hcount_reg[6]),
        .I2(hcount_reg[7]),
        .I3(video_hsync2_carry_0[7]),
        .O(video_hsync2_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_hsync2_carry_i_5
       (.I0(video_hsync2_carry_0[4]),
        .I1(hcount_reg[4]),
        .I2(hcount_reg[5]),
        .I3(video_hsync2_carry_0[5]),
        .O(video_hsync2_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_hsync2_carry_i_6
       (.I0(video_hsync2_carry_0[2]),
        .I1(hcount_reg[2]),
        .I2(hcount_reg[3]),
        .I3(video_hsync2_carry_0[3]),
        .O(video_hsync2_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_hsync2_carry_i_7
       (.I0(video_hsync2_carry_0[0]),
        .I1(hcount_reg[0]),
        .I2(hcount_reg[1]),
        .I3(video_hsync2_carry_0[1]),
        .O(video_hsync2_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    video_hsync2_carry_i_8
       (.I0(hcount_reg[12]),
        .I1(video_hsync2_carry_0[12]),
        .O(video_hsync2_carry_i_8_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_hsync2_carry_i_9
       (.I0(video_hsync2_carry_0[10]),
        .I1(hcount_reg[10]),
        .I2(video_hsync2_carry_0[11]),
        .I3(hcount_reg[11]),
        .O(video_hsync2_carry_i_9_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY8 \video_hsync2_inferred__0/i__carry 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({\NLW_video_hsync2_inferred__0/i__carry_CO_UNCONNECTED [7],video_hsync22_in,\video_hsync2_inferred__0/i__carry_n_2 ,\video_hsync2_inferred__0/i__carry_n_3 ,\video_hsync2_inferred__0/i__carry_n_4 ,\video_hsync2_inferred__0/i__carry_n_5 ,\video_hsync2_inferred__0/i__carry_n_6 ,\video_hsync2_inferred__0/i__carry_n_7 }),
        .DI({1'b0,i__carry_i_1_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4_n_0,i__carry_i_5_n_0,i__carry_i_6_n_0,i__carry_i_7_n_0}),
        .O(\NLW_video_hsync2_inferred__0/i__carry_O_UNCONNECTED [7:0]),
        .S({1'b0,i__carry_i_8_n_0,i__carry_i_9_n_0,i__carry_i_10_n_0,i__carry_i_11_n_0,i__carry_i_12_n_0,i__carry_i_13_n_0,i__carry_i_14_n_0}));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h40BF)) 
    video_hsync_i_1
       (.I0(video_active_reg_0),
        .I1(video_hsync2),
        .I2(video_hsync22_in),
        .I3(video_vsync_reg_0[0]),
        .O(video_hsync_i_1_n_0));
  FDRE video_hsync_reg
       (.C(video_clk),
        .CE(1'b1),
        .D(video_hsync_i_1_n_0),
        .Q(video_hsync_d),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \video_rgb[35]_i_1 
       (.I0(video_active_reg_0),
        .I1(video_active_d),
        .O(SR));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY8 video_vsync2_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({NLW_video_vsync2_carry_CO_UNCONNECTED[7],video_vsync2,video_vsync2_carry_n_2,video_vsync2_carry_n_3,video_vsync2_carry_n_4,video_vsync2_carry_n_5,video_vsync2_carry_n_6,video_vsync2_carry_n_7}),
        .DI({1'b0,video_vsync2_carry_i_1_n_0,video_vsync2_carry_i_2_n_0,video_vsync2_carry_i_3_n_0,video_vsync2_carry_i_4_n_0,video_vsync2_carry_i_5_n_0,video_vsync2_carry_i_6_n_0,video_vsync2_carry_i_7_n_0}),
        .O(NLW_video_vsync2_carry_O_UNCONNECTED[7:0]),
        .S({1'b0,video_vsync2_carry_i_8_n_0,video_vsync2_carry_i_9_n_0,video_vsync2_carry_i_10_n_0,video_vsync2_carry_i_11_n_0,video_vsync2_carry_i_12_n_0,video_vsync2_carry_i_13_n_0,video_vsync2_carry_i_14_n_0}));
  LUT2 #(
    .INIT(4'h2)) 
    video_vsync2_carry_i_1
       (.I0(video_vsync2_carry_0[12]),
        .I1(vcount_reg[12]),
        .O(video_vsync2_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_vsync2_carry_i_10
       (.I0(video_vsync2_carry_0[8]),
        .I1(vcount_reg[8]),
        .I2(video_vsync2_carry_0[9]),
        .I3(vcount_reg[9]),
        .O(video_vsync2_carry_i_10_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_vsync2_carry_i_11
       (.I0(video_vsync2_carry_0[6]),
        .I1(vcount_reg[6]),
        .I2(video_vsync2_carry_0[7]),
        .I3(vcount_reg[7]),
        .O(video_vsync2_carry_i_11_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_vsync2_carry_i_12
       (.I0(video_vsync2_carry_0[4]),
        .I1(vcount_reg[4]),
        .I2(video_vsync2_carry_0[5]),
        .I3(vcount_reg[5]),
        .O(video_vsync2_carry_i_12_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_vsync2_carry_i_13
       (.I0(video_vsync2_carry_0[2]),
        .I1(vcount_reg[2]),
        .I2(video_vsync2_carry_0[3]),
        .I3(vcount_reg[3]),
        .O(video_vsync2_carry_i_13_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_vsync2_carry_i_14
       (.I0(video_vsync2_carry_0[0]),
        .I1(vcount_reg[0]),
        .I2(video_vsync2_carry_0[1]),
        .I3(vcount_reg[1]),
        .O(video_vsync2_carry_i_14_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_vsync2_carry_i_2
       (.I0(video_vsync2_carry_0[10]),
        .I1(vcount_reg[10]),
        .I2(vcount_reg[11]),
        .I3(video_vsync2_carry_0[11]),
        .O(video_vsync2_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_vsync2_carry_i_3
       (.I0(video_vsync2_carry_0[8]),
        .I1(vcount_reg[8]),
        .I2(vcount_reg[9]),
        .I3(video_vsync2_carry_0[9]),
        .O(video_vsync2_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_vsync2_carry_i_4
       (.I0(video_vsync2_carry_0[6]),
        .I1(vcount_reg[6]),
        .I2(vcount_reg[7]),
        .I3(video_vsync2_carry_0[7]),
        .O(video_vsync2_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_vsync2_carry_i_5
       (.I0(video_vsync2_carry_0[4]),
        .I1(vcount_reg[4]),
        .I2(vcount_reg[5]),
        .I3(video_vsync2_carry_0[5]),
        .O(video_vsync2_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_vsync2_carry_i_6
       (.I0(video_vsync2_carry_0[2]),
        .I1(vcount_reg[2]),
        .I2(vcount_reg[3]),
        .I3(video_vsync2_carry_0[3]),
        .O(video_vsync2_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    video_vsync2_carry_i_7
       (.I0(video_vsync2_carry_0[0]),
        .I1(vcount_reg[0]),
        .I2(vcount_reg[1]),
        .I3(video_vsync2_carry_0[1]),
        .O(video_vsync2_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    video_vsync2_carry_i_8
       (.I0(vcount_reg[12]),
        .I1(video_vsync2_carry_0[12]),
        .O(video_vsync2_carry_i_8_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    video_vsync2_carry_i_9
       (.I0(video_vsync2_carry_0[10]),
        .I1(vcount_reg[10]),
        .I2(video_vsync2_carry_0[11]),
        .I3(vcount_reg[11]),
        .O(video_vsync2_carry_i_9_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY8 \video_vsync2_inferred__0/i__carry 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({\NLW_video_vsync2_inferred__0/i__carry_CO_UNCONNECTED [7],video_vsync21_in,\video_vsync2_inferred__0/i__carry_n_2 ,\video_vsync2_inferred__0/i__carry_n_3 ,\video_vsync2_inferred__0/i__carry_n_4 ,\video_vsync2_inferred__0/i__carry_n_5 ,\video_vsync2_inferred__0/i__carry_n_6 ,\video_vsync2_inferred__0/i__carry_n_7 }),
        .DI({1'b0,i__carry_i_1__0_n_0,i__carry_i_2__0_n_0,i__carry_i_3__0_n_0,i__carry_i_4__0_n_0,i__carry_i_5__0_n_0,i__carry_i_6__0_n_0,i__carry_i_7__0_n_0}),
        .O(\NLW_video_vsync2_inferred__0/i__carry_O_UNCONNECTED [7:0]),
        .S({1'b0,i__carry_i_8__0_n_0,i__carry_i_9__0_n_0,i__carry_i_10__0_n_0,i__carry_i_11__0_n_0,i__carry_i_12__0_n_0,i__carry_i_13__0_n_0,i__carry_i_14__0_n_0}));
  LUT4 #(
    .INIT(16'h40BF)) 
    video_vsync_i_1
       (.I0(video_active_reg_0),
        .I1(video_vsync2),
        .I2(video_vsync21_in),
        .I3(video_vsync_reg_0[1]),
        .O(video_vsync_i_1_n_0));
  FDRE video_vsync_reg
       (.C(video_clk),
        .CE(1'b1),
        .D(video_vsync_i_1_n_0),
        .Q(video_vsync_d),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    xpm_fifo_async_inst_i_1
       (.I0(vfsm_rd_enable),
        .I1(video_active_d),
        .O(rd_en));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_array_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "1" *) (* VERSION = "0" *) 
(* WIDTH = "2" *) (* XPM_MODULE = "TRUE" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "ARRAY_SINGLE" *) 
module design_1_axi_video_0_3_xpm_cdc_array_single
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input [1:0]src_in;
  input dest_clk;
  output [1:0]dest_out;

  wire [1:0]async_path_bit;
  wire dest_clk;
  wire src_clk;
  wire [1:0]src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "ARRAY_SINGLE" *) wire [1:0]\syncstages_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "ARRAY_SINGLE" *) wire [1:0]\syncstages_ff[1] ;

  assign dest_out[1:0] = \syncstages_ff[1] ;
  FDRE \src_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[0]),
        .Q(async_path_bit[0]),
        .R(1'b0));
  FDRE \src_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[1]),
        .Q(async_path_bit[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[0]),
        .Q(\syncstages_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[1]),
        .Q(\syncstages_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [0]),
        .Q(\syncstages_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [1]),
        .Q(\syncstages_ff[1] [1]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "1" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "0" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "12" *) (* XPM_MODULE = "TRUE" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module design_1_axi_video_0_3_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [11:0]src_in_bin;
  input dest_clk;
  output [11:0]dest_out_bin;

  wire [11:0]async_path;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [11:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [11:0]\dest_graysync_ff[1] ;
  wire [10:0]\^dest_out_bin ;
  wire [10:0]gray_enc;
  wire src_clk;
  wire [11:0]src_in_bin;

  assign dest_out_bin[11] = \dest_graysync_ff[1] [11];
  assign dest_out_bin[10:0] = \^dest_out_bin [10:0];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[10]),
        .Q(\dest_graysync_ff[0] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[11]),
        .Q(\dest_graysync_ff[0] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[9]),
        .Q(\dest_graysync_ff[0] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [10]),
        .Q(\dest_graysync_ff[1] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [11]),
        .Q(\dest_graysync_ff[1] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [9]),
        .Q(\dest_graysync_ff[1] [9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin[0]_INST_0 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\^dest_out_bin [1]),
        .O(\^dest_out_bin [0]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin[10]_INST_0 
       (.I0(\dest_graysync_ff[1] [10]),
        .I1(\dest_graysync_ff[1] [11]),
        .O(\^dest_out_bin [10]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin[1]_INST_0 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(\^dest_out_bin [6]),
        .I4(\dest_graysync_ff[1] [4]),
        .I5(\dest_graysync_ff[1] [2]),
        .O(\^dest_out_bin [1]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin[2]_INST_0 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\^dest_out_bin [6]),
        .I3(\dest_graysync_ff[1] [5]),
        .I4(\dest_graysync_ff[1] [3]),
        .O(\^dest_out_bin [2]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin[3]_INST_0 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\^dest_out_bin [6]),
        .I3(\dest_graysync_ff[1] [4]),
        .O(\^dest_out_bin [3]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin[4]_INST_0 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\^dest_out_bin [6]),
        .I2(\dest_graysync_ff[1] [5]),
        .O(\^dest_out_bin [4]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin[5]_INST_0 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\^dest_out_bin [6]),
        .O(\^dest_out_bin [5]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin[6]_INST_0 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [10]),
        .I3(\dest_graysync_ff[1] [11]),
        .I4(\dest_graysync_ff[1] [9]),
        .I5(\dest_graysync_ff[1] [7]),
        .O(\^dest_out_bin [6]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin[7]_INST_0 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [9]),
        .I2(\dest_graysync_ff[1] [11]),
        .I3(\dest_graysync_ff[1] [10]),
        .I4(\dest_graysync_ff[1] [8]),
        .O(\^dest_out_bin [7]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin[8]_INST_0 
       (.I0(\dest_graysync_ff[1] [8]),
        .I1(\dest_graysync_ff[1] [10]),
        .I2(\dest_graysync_ff[1] [11]),
        .I3(\dest_graysync_ff[1] [9]),
        .O(\^dest_out_bin [8]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin[9]_INST_0 
       (.I0(\dest_graysync_ff[1] [9]),
        .I1(\dest_graysync_ff[1] [11]),
        .I2(\dest_graysync_ff[1] [10]),
        .O(\^dest_out_bin [9]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[10]_i_1 
       (.I0(src_in_bin[11]),
        .I1(src_in_bin[10]),
        .O(gray_enc[10]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[9]_i_1 
       (.I0(src_in_bin[10]),
        .I1(src_in_bin[9]),
        .O(gray_enc[9]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[10] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[10]),
        .Q(async_path[10]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[11] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[11]),
        .Q(async_path[11]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[8]),
        .Q(async_path[8]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[9]),
        .Q(async_path[9]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "1" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "0" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "12" *) (* XPM_MODULE = "TRUE" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module design_1_axi_video_0_3_xpm_cdc_gray__2
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [11:0]src_in_bin;
  input dest_clk;
  output [11:0]dest_out_bin;

  wire [11:0]async_path;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [11:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [11:0]\dest_graysync_ff[1] ;
  wire [10:0]\^dest_out_bin ;
  wire [10:0]gray_enc;
  wire src_clk;
  wire [11:0]src_in_bin;

  assign dest_out_bin[11] = \dest_graysync_ff[1] [11];
  assign dest_out_bin[10:0] = \^dest_out_bin [10:0];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[10]),
        .Q(\dest_graysync_ff[0] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[11]),
        .Q(\dest_graysync_ff[0] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[9]),
        .Q(\dest_graysync_ff[0] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [10]),
        .Q(\dest_graysync_ff[1] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [11]),
        .Q(\dest_graysync_ff[1] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [9]),
        .Q(\dest_graysync_ff[1] [9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin[0]_INST_0 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\^dest_out_bin [1]),
        .O(\^dest_out_bin [0]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin[10]_INST_0 
       (.I0(\dest_graysync_ff[1] [10]),
        .I1(\dest_graysync_ff[1] [11]),
        .O(\^dest_out_bin [10]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin[1]_INST_0 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(\^dest_out_bin [6]),
        .I4(\dest_graysync_ff[1] [4]),
        .I5(\dest_graysync_ff[1] [2]),
        .O(\^dest_out_bin [1]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin[2]_INST_0 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\^dest_out_bin [6]),
        .I3(\dest_graysync_ff[1] [5]),
        .I4(\dest_graysync_ff[1] [3]),
        .O(\^dest_out_bin [2]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin[3]_INST_0 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\^dest_out_bin [6]),
        .I3(\dest_graysync_ff[1] [4]),
        .O(\^dest_out_bin [3]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin[4]_INST_0 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\^dest_out_bin [6]),
        .I2(\dest_graysync_ff[1] [5]),
        .O(\^dest_out_bin [4]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin[5]_INST_0 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\^dest_out_bin [6]),
        .O(\^dest_out_bin [5]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin[6]_INST_0 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [10]),
        .I3(\dest_graysync_ff[1] [11]),
        .I4(\dest_graysync_ff[1] [9]),
        .I5(\dest_graysync_ff[1] [7]),
        .O(\^dest_out_bin [6]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin[7]_INST_0 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [9]),
        .I2(\dest_graysync_ff[1] [11]),
        .I3(\dest_graysync_ff[1] [10]),
        .I4(\dest_graysync_ff[1] [8]),
        .O(\^dest_out_bin [7]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin[8]_INST_0 
       (.I0(\dest_graysync_ff[1] [8]),
        .I1(\dest_graysync_ff[1] [10]),
        .I2(\dest_graysync_ff[1] [11]),
        .I3(\dest_graysync_ff[1] [9]),
        .O(\^dest_out_bin [8]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin[9]_INST_0 
       (.I0(\dest_graysync_ff[1] [9]),
        .I1(\dest_graysync_ff[1] [11]),
        .I2(\dest_graysync_ff[1] [10]),
        .O(\^dest_out_bin [9]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[10]_i_1 
       (.I0(src_in_bin[11]),
        .I1(src_in_bin[10]),
        .O(gray_enc[10]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[9]_i_1 
       (.I0(src_in_bin[10]),
        .I1(src_in_bin[9]),
        .O(gray_enc[9]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[10] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[10]),
        .Q(async_path[10]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[11] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[11]),
        .Q(async_path[11]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[8]),
        .Q(async_path[8]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[9]),
        .Q(async_path[9]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "4" *) (* INIT_SYNC_FF = "1" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "0" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "13" *) (* XPM_MODULE = "TRUE" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module design_1_axi_video_0_3_xpm_cdc_gray__parameterized0
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [12:0]src_in_bin;
  input dest_clk;
  output [12:0]dest_out_bin;

  wire [12:0]async_path;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [12:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [12:0]\dest_graysync_ff[1] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [12:0]\dest_graysync_ff[2] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [12:0]\dest_graysync_ff[3] ;
  wire [11:0]\^dest_out_bin ;
  wire [11:0]gray_enc;
  wire src_clk;
  wire [12:0]src_in_bin;

  assign dest_out_bin[12] = \dest_graysync_ff[3] [12];
  assign dest_out_bin[11:0] = \^dest_out_bin [11:0];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[10]),
        .Q(\dest_graysync_ff[0] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[11]),
        .Q(\dest_graysync_ff[0] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][12] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[12]),
        .Q(\dest_graysync_ff[0] [12]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[9]),
        .Q(\dest_graysync_ff[0] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [10]),
        .Q(\dest_graysync_ff[1] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [11]),
        .Q(\dest_graysync_ff[1] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][12] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [12]),
        .Q(\dest_graysync_ff[1] [12]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [9]),
        .Q(\dest_graysync_ff[1] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[2][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [0]),
        .Q(\dest_graysync_ff[2] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[2][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [10]),
        .Q(\dest_graysync_ff[2] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[2][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [11]),
        .Q(\dest_graysync_ff[2] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[2][12] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [12]),
        .Q(\dest_graysync_ff[2] [12]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[2][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [1]),
        .Q(\dest_graysync_ff[2] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[2][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [2]),
        .Q(\dest_graysync_ff[2] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[2][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [3]),
        .Q(\dest_graysync_ff[2] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[2][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [4]),
        .Q(\dest_graysync_ff[2] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[2][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [5]),
        .Q(\dest_graysync_ff[2] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[2][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [6]),
        .Q(\dest_graysync_ff[2] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[2][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [7]),
        .Q(\dest_graysync_ff[2] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[2][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [8]),
        .Q(\dest_graysync_ff[2] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[2][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [9]),
        .Q(\dest_graysync_ff[2] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[3][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[2] [0]),
        .Q(\dest_graysync_ff[3] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[3][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[2] [10]),
        .Q(\dest_graysync_ff[3] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[3][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[2] [11]),
        .Q(\dest_graysync_ff[3] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[3][12] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[2] [12]),
        .Q(\dest_graysync_ff[3] [12]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[3][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[2] [1]),
        .Q(\dest_graysync_ff[3] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[3][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[2] [2]),
        .Q(\dest_graysync_ff[3] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[3][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[2] [3]),
        .Q(\dest_graysync_ff[3] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[3][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[2] [4]),
        .Q(\dest_graysync_ff[3] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[3][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[2] [5]),
        .Q(\dest_graysync_ff[3] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[3][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[2] [6]),
        .Q(\dest_graysync_ff[3] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[3][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[2] [7]),
        .Q(\dest_graysync_ff[3] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[3][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[2] [8]),
        .Q(\dest_graysync_ff[3] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[3][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[2] [9]),
        .Q(\dest_graysync_ff[3] [9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin[0]_INST_0 
       (.I0(\dest_graysync_ff[3] [0]),
        .I1(\^dest_out_bin [2]),
        .I2(\dest_graysync_ff[3] [1]),
        .O(\^dest_out_bin [0]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin[10]_INST_0 
       (.I0(\dest_graysync_ff[3] [10]),
        .I1(\dest_graysync_ff[3] [12]),
        .I2(\dest_graysync_ff[3] [11]),
        .O(\^dest_out_bin [10]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin[11]_INST_0 
       (.I0(\dest_graysync_ff[3] [11]),
        .I1(\dest_graysync_ff[3] [12]),
        .O(\^dest_out_bin [11]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin[1]_INST_0 
       (.I0(\dest_graysync_ff[3] [1]),
        .I1(\^dest_out_bin [2]),
        .O(\^dest_out_bin [1]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin[2]_INST_0 
       (.I0(\dest_graysync_ff[3] [2]),
        .I1(\dest_graysync_ff[3] [4]),
        .I2(\dest_graysync_ff[3] [6]),
        .I3(\^dest_out_bin [7]),
        .I4(\dest_graysync_ff[3] [5]),
        .I5(\dest_graysync_ff[3] [3]),
        .O(\^dest_out_bin [2]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin[3]_INST_0 
       (.I0(\dest_graysync_ff[3] [3]),
        .I1(\dest_graysync_ff[3] [5]),
        .I2(\^dest_out_bin [7]),
        .I3(\dest_graysync_ff[3] [6]),
        .I4(\dest_graysync_ff[3] [4]),
        .O(\^dest_out_bin [3]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin[4]_INST_0 
       (.I0(\dest_graysync_ff[3] [4]),
        .I1(\dest_graysync_ff[3] [6]),
        .I2(\^dest_out_bin [7]),
        .I3(\dest_graysync_ff[3] [5]),
        .O(\^dest_out_bin [4]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin[5]_INST_0 
       (.I0(\dest_graysync_ff[3] [5]),
        .I1(\^dest_out_bin [7]),
        .I2(\dest_graysync_ff[3] [6]),
        .O(\^dest_out_bin [5]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin[6]_INST_0 
       (.I0(\dest_graysync_ff[3] [6]),
        .I1(\^dest_out_bin [7]),
        .O(\^dest_out_bin [6]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin[7]_INST_0 
       (.I0(\dest_graysync_ff[3] [7]),
        .I1(\dest_graysync_ff[3] [9]),
        .I2(\dest_graysync_ff[3] [11]),
        .I3(\dest_graysync_ff[3] [12]),
        .I4(\dest_graysync_ff[3] [10]),
        .I5(\dest_graysync_ff[3] [8]),
        .O(\^dest_out_bin [7]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin[8]_INST_0 
       (.I0(\dest_graysync_ff[3] [8]),
        .I1(\dest_graysync_ff[3] [10]),
        .I2(\dest_graysync_ff[3] [12]),
        .I3(\dest_graysync_ff[3] [11]),
        .I4(\dest_graysync_ff[3] [9]),
        .O(\^dest_out_bin [8]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin[9]_INST_0 
       (.I0(\dest_graysync_ff[3] [9]),
        .I1(\dest_graysync_ff[3] [11]),
        .I2(\dest_graysync_ff[3] [12]),
        .I3(\dest_graysync_ff[3] [10]),
        .O(\^dest_out_bin [9]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[10]_i_1 
       (.I0(src_in_bin[11]),
        .I1(src_in_bin[10]),
        .O(gray_enc[10]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[11]_i_1 
       (.I0(src_in_bin[12]),
        .I1(src_in_bin[11]),
        .O(gray_enc[11]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[9]_i_1 
       (.I0(src_in_bin[10]),
        .I1(src_in_bin[9]),
        .O(gray_enc[9]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[10] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[10]),
        .Q(async_path[10]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[11] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[11]),
        .Q(async_path[11]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[12] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[12]),
        .Q(async_path[12]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[8]),
        .Q(async_path[8]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[9]),
        .Q(async_path[9]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "1" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "0" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "13" *) (* XPM_MODULE = "TRUE" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module design_1_axi_video_0_3_xpm_cdc_gray__parameterized1
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [12:0]src_in_bin;
  input dest_clk;
  output [12:0]dest_out_bin;

  wire [12:0]async_path;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [12:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [12:0]\dest_graysync_ff[1] ;
  wire [11:0]\^dest_out_bin ;
  wire [11:0]gray_enc;
  wire src_clk;
  wire [12:0]src_in_bin;

  assign dest_out_bin[12] = \dest_graysync_ff[1] [12];
  assign dest_out_bin[11:0] = \^dest_out_bin [11:0];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[10]),
        .Q(\dest_graysync_ff[0] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[11]),
        .Q(\dest_graysync_ff[0] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][12] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[12]),
        .Q(\dest_graysync_ff[0] [12]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[9]),
        .Q(\dest_graysync_ff[0] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [10]),
        .Q(\dest_graysync_ff[1] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [11]),
        .Q(\dest_graysync_ff[1] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][12] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [12]),
        .Q(\dest_graysync_ff[1] [12]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [9]),
        .Q(\dest_graysync_ff[1] [9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin[0]_INST_0 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\^dest_out_bin [2]),
        .I2(\dest_graysync_ff[1] [1]),
        .O(\^dest_out_bin [0]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin[10]_INST_0 
       (.I0(\dest_graysync_ff[1] [10]),
        .I1(\dest_graysync_ff[1] [12]),
        .I2(\dest_graysync_ff[1] [11]),
        .O(\^dest_out_bin [10]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin[11]_INST_0 
       (.I0(\dest_graysync_ff[1] [11]),
        .I1(\dest_graysync_ff[1] [12]),
        .O(\^dest_out_bin [11]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin[1]_INST_0 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\^dest_out_bin [2]),
        .O(\^dest_out_bin [1]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin[2]_INST_0 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\dest_graysync_ff[1] [6]),
        .I3(\^dest_out_bin [7]),
        .I4(\dest_graysync_ff[1] [5]),
        .I5(\dest_graysync_ff[1] [3]),
        .O(\^dest_out_bin [2]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin[3]_INST_0 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\^dest_out_bin [7]),
        .I3(\dest_graysync_ff[1] [6]),
        .I4(\dest_graysync_ff[1] [4]),
        .O(\^dest_out_bin [3]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin[4]_INST_0 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\^dest_out_bin [7]),
        .I3(\dest_graysync_ff[1] [5]),
        .O(\^dest_out_bin [4]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin[5]_INST_0 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\^dest_out_bin [7]),
        .I2(\dest_graysync_ff[1] [6]),
        .O(\^dest_out_bin [5]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin[6]_INST_0 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\^dest_out_bin [7]),
        .O(\^dest_out_bin [6]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin[7]_INST_0 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [9]),
        .I2(\dest_graysync_ff[1] [11]),
        .I3(\dest_graysync_ff[1] [12]),
        .I4(\dest_graysync_ff[1] [10]),
        .I5(\dest_graysync_ff[1] [8]),
        .O(\^dest_out_bin [7]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin[8]_INST_0 
       (.I0(\dest_graysync_ff[1] [8]),
        .I1(\dest_graysync_ff[1] [10]),
        .I2(\dest_graysync_ff[1] [12]),
        .I3(\dest_graysync_ff[1] [11]),
        .I4(\dest_graysync_ff[1] [9]),
        .O(\^dest_out_bin [8]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin[9]_INST_0 
       (.I0(\dest_graysync_ff[1] [9]),
        .I1(\dest_graysync_ff[1] [11]),
        .I2(\dest_graysync_ff[1] [12]),
        .I3(\dest_graysync_ff[1] [10]),
        .O(\^dest_out_bin [9]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[10]_i_1 
       (.I0(src_in_bin[11]),
        .I1(src_in_bin[10]),
        .O(gray_enc[10]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[11]_i_1 
       (.I0(src_in_bin[12]),
        .I1(src_in_bin[11]),
        .O(gray_enc[11]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[9]_i_1 
       (.I0(src_in_bin[10]),
        .I1(src_in_bin[9]),
        .O(gray_enc[9]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[10] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[10]),
        .Q(async_path[10]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[11] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[11]),
        .Q(async_path[11]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[12] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[12]),
        .Q(async_path[12]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[8]),
        .Q(async_path[8]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[9]),
        .Q(async_path[9]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "2" *) (* INIT = "0" *) 
(* INIT_SYNC_FF = "1" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SYNC_RST" *) 
module design_1_axi_video_0_3_xpm_cdc_sync_rst
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [1:0]syncstages_ff;

  assign dest_rst = syncstages_ff[1];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "2" *) (* INIT = "0" *) 
(* INIT_SYNC_FF = "1" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SYNC_RST" *) 
module design_1_axi_video_0_3_xpm_cdc_sync_rst__5
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [1:0]syncstages_ff;

  assign dest_rst = syncstages_ff[1];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "2" *) (* INIT = "0" *) 
(* INIT_SYNC_FF = "1" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SYNC_RST" *) 
module design_1_axi_video_0_3_xpm_cdc_sync_rst__6
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [1:0]syncstages_ff;

  assign dest_rst = syncstages_ff[1];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "2" *) (* INIT = "0" *) 
(* INIT_SYNC_FF = "1" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SYNC_RST" *) 
module design_1_axi_video_0_3_xpm_cdc_sync_rst__7
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [1:0]syncstages_ff;

  assign dest_rst = syncstages_ff[1];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "2" *) (* INIT = "0" *) 
(* INIT_SYNC_FF = "1" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SYNC_RST" *) 
module design_1_axi_video_0_3_xpm_cdc_sync_rst__8
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [1:0]syncstages_ff;

  assign dest_rst = syncstages_ff[1];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "xpm_counter_updn" *) 
module design_1_axi_video_0_3_xpm_counter_updn
   (Q,
    src_in_bin,
    ram_empty_i,
    \count_value_i_reg[0]_0 ,
    rd_en,
    \src_gray_ff_reg[1] ,
    SR,
    rd_clk);
  output [1:0]Q;
  output [0:0]src_in_bin;
  input ram_empty_i;
  input [1:0]\count_value_i_reg[0]_0 ;
  input rd_en;
  input [1:0]\src_gray_ff_reg[1] ;
  input [0:0]SR;
  input rd_clk;

  wire [1:0]Q;
  wire [0:0]SR;
  wire \count_value_i[0]_i_1__4_n_0 ;
  wire \count_value_i[1]_i_3_n_0 ;
  wire [1:0]\count_value_i_reg[0]_0 ;
  wire \gen_fwft.count_en ;
  wire ram_empty_i;
  wire rd_clk;
  wire rd_en;
  wire [1:0]\src_gray_ff_reg[1] ;
  wire [0:0]src_in_bin;

  LUT5 #(
    .INIT(32'h5AAAA655)) 
    \count_value_i[0]_i_1__4 
       (.I0(Q[0]),
        .I1(\count_value_i_reg[0]_0 [0]),
        .I2(rd_en),
        .I3(\count_value_i_reg[0]_0 [1]),
        .I4(ram_empty_i),
        .O(\count_value_i[0]_i_1__4_n_0 ));
  LUT4 #(
    .INIT(16'hC02F)) 
    \count_value_i[1]_i_2 
       (.I0(\count_value_i_reg[0]_0 [0]),
        .I1(rd_en),
        .I2(\count_value_i_reg[0]_0 [1]),
        .I3(ram_empty_i),
        .O(\gen_fwft.count_en ));
  LUT6 #(
    .INIT(64'hA999A9A96AAA6AAA)) 
    \count_value_i[1]_i_3 
       (.I0(Q[1]),
        .I1(ram_empty_i),
        .I2(\count_value_i_reg[0]_0 [1]),
        .I3(rd_en),
        .I4(\count_value_i_reg[0]_0 [0]),
        .I5(Q[0]),
        .O(\count_value_i[1]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[0] 
       (.C(rd_clk),
        .CE(\gen_fwft.count_en ),
        .D(\count_value_i[0]_i_1__4_n_0 ),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[1] 
       (.C(rd_clk),
        .CE(\gen_fwft.count_en ),
        .D(\count_value_i[1]_i_3_n_0 ),
        .Q(Q[1]),
        .R(SR));
  LUT4 #(
    .INIT(16'h2DD2)) 
    \gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_12 
       (.I0(Q[0]),
        .I1(\src_gray_ff_reg[1] [0]),
        .I2(Q[1]),
        .I3(\src_gray_ff_reg[1] [1]),
        .O(src_in_bin));
endmodule

(* ORIG_REF_NAME = "xpm_counter_updn" *) 
module design_1_axi_video_0_3_xpm_counter_updn__parameterized0
   (Q,
    \FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ,
    src_in_bin,
    \count_value_i_reg[0]_0 ,
    rd_en,
    ram_empty_i,
    \src_gray_ff_reg[2] ,
    SR,
    rd_clk);
  output [11:0]Q;
  output \FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ;
  output [11:0]src_in_bin;
  input [1:0]\count_value_i_reg[0]_0 ;
  input rd_en;
  input ram_empty_i;
  input [1:0]\src_gray_ff_reg[2] ;
  input [0:0]SR;
  input rd_clk;

  wire \FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ;
  wire [11:0]Q;
  wire [0:0]SR;
  wire \count_value_i[0]_i_1__3_n_0 ;
  wire \count_value_i[10]_i_1__2_n_0 ;
  wire \count_value_i[11]_i_1__2_n_0 ;
  wire \count_value_i[11]_i_2__2_n_0 ;
  wire \count_value_i[12]_i_1__0_n_0 ;
  wire \count_value_i[12]_i_2__0_n_0 ;
  wire \count_value_i[1]_i_1__4_n_0 ;
  wire \count_value_i[2]_i_1__3_n_0 ;
  wire \count_value_i[3]_i_1__3_n_0 ;
  wire \count_value_i[4]_i_1__3_n_0 ;
  wire \count_value_i[5]_i_1__2_n_0 ;
  wire \count_value_i[6]_i_1__2_n_0 ;
  wire \count_value_i[6]_i_2__2_n_0 ;
  wire \count_value_i[7]_i_1__2_n_0 ;
  wire \count_value_i[8]_i_1__2_n_0 ;
  wire \count_value_i[9]_i_1__2_n_0 ;
  wire \count_value_i[9]_i_2__2_n_0 ;
  wire [1:0]\count_value_i_reg[0]_0 ;
  wire \count_value_i_reg_n_0_[12] ;
  wire \gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_14_n_0 ;
  wire \gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_15_n_0 ;
  wire \gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_16_n_0 ;
  wire \gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_17_n_0 ;
  wire ram_empty_i;
  wire rd_clk;
  wire rd_en;
  wire [1:0]\src_gray_ff_reg[2] ;
  wire [11:0]src_in_bin;

  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h10EF)) 
    \count_value_i[0]_i_1__3 
       (.I0(rd_en),
        .I1(\count_value_i_reg[0]_0 [0]),
        .I2(\count_value_i_reg[0]_0 [1]),
        .I3(Q[0]),
        .O(\count_value_i[0]_i_1__3_n_0 ));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[10]_i_1__2 
       (.I0(Q[8]),
        .I1(\count_value_i[11]_i_2__2_n_0 ),
        .I2(Q[7]),
        .I3(Q[9]),
        .I4(Q[10]),
        .O(\count_value_i[10]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[11]_i_1__2 
       (.I0(Q[9]),
        .I1(Q[7]),
        .I2(\count_value_i[11]_i_2__2_n_0 ),
        .I3(Q[8]),
        .I4(Q[10]),
        .I5(Q[11]),
        .O(\count_value_i[11]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[11]_i_2__2 
       (.I0(Q[6]),
        .I1(Q[4]),
        .I2(Q[2]),
        .I3(\count_value_i[6]_i_2__2_n_0 ),
        .I4(Q[3]),
        .I5(Q[5]),
        .O(\count_value_i[11]_i_2__2_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[12]_i_1__0 
       (.I0(Q[10]),
        .I1(\count_value_i[12]_i_2__0_n_0 ),
        .I2(Q[11]),
        .I3(\count_value_i_reg_n_0_[12] ),
        .O(\count_value_i[12]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[12]_i_2__0 
       (.I0(Q[9]),
        .I1(Q[7]),
        .I2(Q[5]),
        .I3(\count_value_i[9]_i_2__2_n_0 ),
        .I4(Q[6]),
        .I5(Q[8]),
        .O(\count_value_i[12]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT5 #(
    .INIT(32'h02FFFD00)) 
    \count_value_i[1]_i_1__4 
       (.I0(\count_value_i_reg[0]_0 [1]),
        .I1(\count_value_i_reg[0]_0 [0]),
        .I2(rd_en),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\count_value_i[1]_i_1__4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count_value_i[2]_i_1__3 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(\count_value_i[2]_i_1__3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[3]_i_1__3 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(\count_value_i[3]_i_1__3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[4]_i_1__3 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(\count_value_i[4]_i_1__3_n_0 ));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[5]_i_1__2 
       (.I0(Q[3]),
        .I1(\count_value_i[6]_i_2__2_n_0 ),
        .I2(Q[2]),
        .I3(Q[4]),
        .I4(Q[5]),
        .O(\count_value_i[5]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[6]_i_1__2 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(\count_value_i[6]_i_2__2_n_0 ),
        .I3(Q[3]),
        .I4(Q[5]),
        .I5(Q[6]),
        .O(\count_value_i[6]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'h0000AAA200000000)) 
    \count_value_i[6]_i_2__2 
       (.I0(Q[1]),
        .I1(\count_value_i_reg[0]_0 [1]),
        .I2(\count_value_i_reg[0]_0 [0]),
        .I3(rd_en),
        .I4(ram_empty_i),
        .I5(Q[0]),
        .O(\count_value_i[6]_i_2__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[7]_i_1__2 
       (.I0(Q[5]),
        .I1(\count_value_i[9]_i_2__2_n_0 ),
        .I2(Q[6]),
        .I3(Q[7]),
        .O(\count_value_i[7]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[8]_i_1__2 
       (.I0(Q[6]),
        .I1(\count_value_i[9]_i_2__2_n_0 ),
        .I2(Q[5]),
        .I3(Q[7]),
        .I4(Q[8]),
        .O(\count_value_i[8]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[9]_i_1__2 
       (.I0(Q[7]),
        .I1(Q[5]),
        .I2(\count_value_i[9]_i_2__2_n_0 ),
        .I3(Q[6]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(\count_value_i[9]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[9]_i_2__2 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .I4(Q[1]),
        .I5(Q[3]),
        .O(\count_value_i[9]_i_2__2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[0] 
       (.C(rd_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[0]_i_1__3_n_0 ),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[10] 
       (.C(rd_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[10]_i_1__2_n_0 ),
        .Q(Q[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[11] 
       (.C(rd_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[11]_i_1__2_n_0 ),
        .Q(Q[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[12] 
       (.C(rd_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[12]_i_1__0_n_0 ),
        .Q(\count_value_i_reg_n_0_[12] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[1] 
       (.C(rd_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[1]_i_1__4_n_0 ),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[2] 
       (.C(rd_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[2]_i_1__3_n_0 ),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[3] 
       (.C(rd_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[3]_i_1__3_n_0 ),
        .Q(Q[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[4] 
       (.C(rd_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[4]_i_1__3_n_0 ),
        .Q(Q[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[5] 
       (.C(rd_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[5]_i_1__2_n_0 ),
        .Q(Q[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[6] 
       (.C(rd_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[6]_i_1__2_n_0 ),
        .Q(Q[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[7] 
       (.C(rd_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[7]_i_1__2_n_0 ),
        .Q(Q[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[8] 
       (.C(rd_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[8]_i_1__2_n_0 ),
        .Q(Q[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[9] 
       (.C(rd_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[9]_i_1__2_n_0 ),
        .Q(Q[9]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT5 #(
    .INIT(32'hFFFE0001)) 
    \gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_1 
       (.I0(Q[11]),
        .I1(Q[9]),
        .I2(\gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_14_n_0 ),
        .I3(Q[10]),
        .I4(\count_value_i_reg_n_0_[12] ),
        .O(src_in_bin[11]));
  LUT6 #(
    .INIT(64'hFBFBBAFB04044504)) 
    \gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_10 
       (.I0(Q[2]),
        .I1(\src_gray_ff_reg[2] [1]),
        .I2(Q[1]),
        .I3(\src_gray_ff_reg[2] [0]),
        .I4(Q[0]),
        .I5(Q[3]),
        .O(src_in_bin[2]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT5 #(
    .INIT(32'hB0FB4F04)) 
    \gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_11 
       (.I0(Q[0]),
        .I1(\src_gray_ff_reg[2] [0]),
        .I2(Q[1]),
        .I3(\src_gray_ff_reg[2] [1]),
        .I4(Q[2]),
        .O(src_in_bin[1]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_13 
       (.I0(Q[0]),
        .I1(\src_gray_ff_reg[2] [0]),
        .O(src_in_bin[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_14 
       (.I0(Q[7]),
        .I1(Q[5]),
        .I2(\gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_16_n_0 ),
        .I3(Q[4]),
        .I4(Q[6]),
        .I5(Q[8]),
        .O(\gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEAFE)) 
    \gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_15 
       (.I0(Q[3]),
        .I1(\gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_17_n_0 ),
        .I2(Q[1]),
        .I3(\src_gray_ff_reg[2] [1]),
        .I4(Q[2]),
        .I5(Q[4]),
        .O(\gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFBFBBAFB)) 
    \gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_16 
       (.I0(Q[2]),
        .I1(\src_gray_ff_reg[2] [1]),
        .I2(Q[1]),
        .I3(\src_gray_ff_reg[2] [0]),
        .I4(Q[0]),
        .I5(Q[3]),
        .O(\gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_17 
       (.I0(Q[0]),
        .I1(\src_gray_ff_reg[2] [0]),
        .O(\gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_17_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'hFE01)) 
    \gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_2 
       (.I0(Q[10]),
        .I1(\gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_14_n_0 ),
        .I2(Q[9]),
        .I3(Q[11]),
        .O(src_in_bin[10]));
  LUT3 #(
    .INIT(8'hE1)) 
    \gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_3 
       (.I0(Q[9]),
        .I1(\gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_14_n_0 ),
        .I2(Q[10]),
        .O(src_in_bin[9]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000001)) 
    \gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_4 
       (.I0(Q[8]),
        .I1(Q[6]),
        .I2(\gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_15_n_0 ),
        .I3(Q[5]),
        .I4(Q[7]),
        .I5(Q[9]),
        .O(src_in_bin[8]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000001)) 
    \gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_5 
       (.I0(Q[7]),
        .I1(Q[5]),
        .I2(\gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_16_n_0 ),
        .I3(Q[4]),
        .I4(Q[6]),
        .I5(Q[8]),
        .O(src_in_bin[7]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT5 #(
    .INIT(32'hFFFE0001)) 
    \gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_6 
       (.I0(Q[6]),
        .I1(Q[4]),
        .I2(\gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_16_n_0 ),
        .I3(Q[5]),
        .I4(Q[7]),
        .O(src_in_bin[6]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'hFE01)) 
    \gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_7 
       (.I0(Q[5]),
        .I1(\gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_16_n_0 ),
        .I2(Q[4]),
        .I3(Q[6]),
        .O(src_in_bin[5]));
  LUT3 #(
    .INIT(8'hE1)) 
    \gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_8 
       (.I0(Q[4]),
        .I1(\gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_16_n_0 ),
        .I2(Q[5]),
        .O(src_in_bin[4]));
  LUT6 #(
    .INIT(64'hFFFFEAFE00001501)) 
    \gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_9 
       (.I0(Q[3]),
        .I1(\gen_cdc_pntr.rd_pntr_cdc_dc_inst_i_17_n_0 ),
        .I2(Q[1]),
        .I3(\src_gray_ff_reg[2] [1]),
        .I4(Q[2]),
        .I5(Q[4]),
        .O(src_in_bin[3]));
  LUT4 #(
    .INIT(16'h00FD)) 
    \gen_sdpram.xpm_memory_base_inst_i_2 
       (.I0(\count_value_i_reg[0]_0 [1]),
        .I1(\count_value_i_reg[0]_0 [0]),
        .I2(rd_en),
        .I3(ram_empty_i),
        .O(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ));
endmodule

(* ORIG_REF_NAME = "xpm_counter_updn" *) 
module design_1_axi_video_0_3_xpm_counter_updn__parameterized0_2
   (Q,
    D,
    ram_wr_en_i,
    wr_en,
    \count_value_i_reg[6]_0 ,
    wrst_busy,
    rst_d1,
    \gwdc.wr_data_count_i_reg[12] ,
    wr_clk);
  output [12:0]Q;
  output [12:0]D;
  input ram_wr_en_i;
  input wr_en;
  input \count_value_i_reg[6]_0 ;
  input wrst_busy;
  input rst_d1;
  input [12:0]\gwdc.wr_data_count_i_reg[12] ;
  input wr_clk;

  wire [12:0]D;
  wire [12:0]Q;
  wire \count_value_i[0]_i_1__1_n_0 ;
  wire \count_value_i[10]_i_1__1_n_0 ;
  wire \count_value_i[11]_i_1__1_n_0 ;
  wire \count_value_i[11]_i_2__1_n_0 ;
  wire \count_value_i[12]_i_1_n_0 ;
  wire \count_value_i[12]_i_2_n_0 ;
  wire \count_value_i[1]_i_1__1_n_0 ;
  wire \count_value_i[2]_i_1__1_n_0 ;
  wire \count_value_i[3]_i_1__1_n_0 ;
  wire \count_value_i[4]_i_1__1_n_0 ;
  wire \count_value_i[5]_i_1__1_n_0 ;
  wire \count_value_i[6]_i_1__1_n_0 ;
  wire \count_value_i[6]_i_2__1_n_0 ;
  wire \count_value_i[7]_i_1__1_n_0 ;
  wire \count_value_i[8]_i_1__1_n_0 ;
  wire \count_value_i[9]_i_1__1_n_0 ;
  wire \count_value_i[9]_i_2__1_n_0 ;
  wire \count_value_i_reg[6]_0 ;
  wire \gwdc.wr_data_count_i[12]_i_2_n_0 ;
  wire \gwdc.wr_data_count_i[12]_i_3_n_0 ;
  wire \gwdc.wr_data_count_i[12]_i_4_n_0 ;
  wire \gwdc.wr_data_count_i[12]_i_5_n_0 ;
  wire \gwdc.wr_data_count_i[12]_i_6_n_0 ;
  wire \gwdc.wr_data_count_i[7]_i_2_n_0 ;
  wire \gwdc.wr_data_count_i[7]_i_3_n_0 ;
  wire \gwdc.wr_data_count_i[7]_i_4_n_0 ;
  wire \gwdc.wr_data_count_i[7]_i_5_n_0 ;
  wire \gwdc.wr_data_count_i[7]_i_6_n_0 ;
  wire \gwdc.wr_data_count_i[7]_i_7_n_0 ;
  wire \gwdc.wr_data_count_i[7]_i_8_n_0 ;
  wire \gwdc.wr_data_count_i[7]_i_9_n_0 ;
  wire [12:0]\gwdc.wr_data_count_i_reg[12] ;
  wire \gwdc.wr_data_count_i_reg[12]_i_1_n_4 ;
  wire \gwdc.wr_data_count_i_reg[12]_i_1_n_5 ;
  wire \gwdc.wr_data_count_i_reg[12]_i_1_n_6 ;
  wire \gwdc.wr_data_count_i_reg[12]_i_1_n_7 ;
  wire \gwdc.wr_data_count_i_reg[7]_i_1_n_0 ;
  wire \gwdc.wr_data_count_i_reg[7]_i_1_n_1 ;
  wire \gwdc.wr_data_count_i_reg[7]_i_1_n_2 ;
  wire \gwdc.wr_data_count_i_reg[7]_i_1_n_3 ;
  wire \gwdc.wr_data_count_i_reg[7]_i_1_n_4 ;
  wire \gwdc.wr_data_count_i_reg[7]_i_1_n_5 ;
  wire \gwdc.wr_data_count_i_reg[7]_i_1_n_6 ;
  wire \gwdc.wr_data_count_i_reg[7]_i_1_n_7 ;
  wire ram_wr_en_i;
  wire rst_d1;
  wire wr_clk;
  wire wr_en;
  wire wrst_busy;
  wire [7:4]\NLW_gwdc.wr_data_count_i_reg[12]_i_1_CO_UNCONNECTED ;
  wire [7:5]\NLW_gwdc.wr_data_count_i_reg[12]_i_1_O_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    \count_value_i[0]_i_1__1 
       (.I0(Q[0]),
        .O(\count_value_i[0]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[10]_i_1__1 
       (.I0(Q[8]),
        .I1(\count_value_i[11]_i_2__1_n_0 ),
        .I2(Q[7]),
        .I3(Q[9]),
        .I4(Q[10]),
        .O(\count_value_i[10]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[11]_i_1__1 
       (.I0(Q[9]),
        .I1(Q[7]),
        .I2(\count_value_i[11]_i_2__1_n_0 ),
        .I3(Q[8]),
        .I4(Q[10]),
        .I5(Q[11]),
        .O(\count_value_i[11]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[11]_i_2__1 
       (.I0(Q[6]),
        .I1(Q[4]),
        .I2(Q[2]),
        .I3(\count_value_i[6]_i_2__1_n_0 ),
        .I4(Q[3]),
        .I5(Q[5]),
        .O(\count_value_i[11]_i_2__1_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[12]_i_1 
       (.I0(Q[10]),
        .I1(\count_value_i[12]_i_2_n_0 ),
        .I2(Q[11]),
        .I3(Q[12]),
        .O(\count_value_i[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[12]_i_2 
       (.I0(Q[9]),
        .I1(Q[7]),
        .I2(Q[5]),
        .I3(\count_value_i[9]_i_2__1_n_0 ),
        .I4(Q[6]),
        .I5(Q[8]),
        .O(\count_value_i[12]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count_value_i[1]_i_1__1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\count_value_i[1]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count_value_i[2]_i_1__1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(\count_value_i[2]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[3]_i_1__1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(\count_value_i[3]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[4]_i_1__1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(\count_value_i[4]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[5]_i_1__1 
       (.I0(Q[3]),
        .I1(\count_value_i[6]_i_2__1_n_0 ),
        .I2(Q[2]),
        .I3(Q[4]),
        .I4(Q[5]),
        .O(\count_value_i[5]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[6]_i_1__1 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(\count_value_i[6]_i_2__1_n_0 ),
        .I3(Q[3]),
        .I4(Q[5]),
        .I5(Q[6]),
        .O(\count_value_i[6]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \count_value_i[6]_i_2__1 
       (.I0(Q[1]),
        .I1(wr_en),
        .I2(\count_value_i_reg[6]_0 ),
        .I3(wrst_busy),
        .I4(rst_d1),
        .I5(Q[0]),
        .O(\count_value_i[6]_i_2__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[7]_i_1__1 
       (.I0(Q[5]),
        .I1(\count_value_i[9]_i_2__1_n_0 ),
        .I2(Q[6]),
        .I3(Q[7]),
        .O(\count_value_i[7]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[8]_i_1__1 
       (.I0(Q[6]),
        .I1(\count_value_i[9]_i_2__1_n_0 ),
        .I2(Q[5]),
        .I3(Q[7]),
        .I4(Q[8]),
        .O(\count_value_i[8]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[9]_i_1__1 
       (.I0(Q[7]),
        .I1(Q[5]),
        .I2(\count_value_i[9]_i_2__1_n_0 ),
        .I3(Q[6]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(\count_value_i[9]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[9]_i_2__1 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(ram_wr_en_i),
        .I4(Q[1]),
        .I5(Q[3]),
        .O(\count_value_i[9]_i_2__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[0] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[0]_i_1__1_n_0 ),
        .Q(Q[0]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[10] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[10]_i_1__1_n_0 ),
        .Q(Q[10]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[11] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[11]_i_1__1_n_0 ),
        .Q(Q[11]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[12] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[12]_i_1_n_0 ),
        .Q(Q[12]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[1] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[1]_i_1__1_n_0 ),
        .Q(Q[1]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[2] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[2]_i_1__1_n_0 ),
        .Q(Q[2]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[3] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[3]_i_1__1_n_0 ),
        .Q(Q[3]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[4] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[4]_i_1__1_n_0 ),
        .Q(Q[4]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[5] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[5]_i_1__1_n_0 ),
        .Q(Q[5]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[6] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[6]_i_1__1_n_0 ),
        .Q(Q[6]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[7] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[7]_i_1__1_n_0 ),
        .Q(Q[7]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[8] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[8]_i_1__1_n_0 ),
        .Q(Q[8]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[9] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[9]_i_1__1_n_0 ),
        .Q(Q[9]),
        .R(wrst_busy));
  LUT2 #(
    .INIT(4'h9)) 
    \gwdc.wr_data_count_i[12]_i_2 
       (.I0(Q[12]),
        .I1(\gwdc.wr_data_count_i_reg[12] [12]),
        .O(\gwdc.wr_data_count_i[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \gwdc.wr_data_count_i[12]_i_3 
       (.I0(Q[11]),
        .I1(\gwdc.wr_data_count_i_reg[12] [11]),
        .O(\gwdc.wr_data_count_i[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \gwdc.wr_data_count_i[12]_i_4 
       (.I0(Q[10]),
        .I1(\gwdc.wr_data_count_i_reg[12] [10]),
        .O(\gwdc.wr_data_count_i[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \gwdc.wr_data_count_i[12]_i_5 
       (.I0(Q[9]),
        .I1(\gwdc.wr_data_count_i_reg[12] [9]),
        .O(\gwdc.wr_data_count_i[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \gwdc.wr_data_count_i[12]_i_6 
       (.I0(Q[8]),
        .I1(\gwdc.wr_data_count_i_reg[12] [8]),
        .O(\gwdc.wr_data_count_i[12]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \gwdc.wr_data_count_i[7]_i_2 
       (.I0(Q[7]),
        .I1(\gwdc.wr_data_count_i_reg[12] [7]),
        .O(\gwdc.wr_data_count_i[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \gwdc.wr_data_count_i[7]_i_3 
       (.I0(Q[6]),
        .I1(\gwdc.wr_data_count_i_reg[12] [6]),
        .O(\gwdc.wr_data_count_i[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \gwdc.wr_data_count_i[7]_i_4 
       (.I0(Q[5]),
        .I1(\gwdc.wr_data_count_i_reg[12] [5]),
        .O(\gwdc.wr_data_count_i[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \gwdc.wr_data_count_i[7]_i_5 
       (.I0(Q[4]),
        .I1(\gwdc.wr_data_count_i_reg[12] [4]),
        .O(\gwdc.wr_data_count_i[7]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \gwdc.wr_data_count_i[7]_i_6 
       (.I0(Q[3]),
        .I1(\gwdc.wr_data_count_i_reg[12] [3]),
        .O(\gwdc.wr_data_count_i[7]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \gwdc.wr_data_count_i[7]_i_7 
       (.I0(Q[2]),
        .I1(\gwdc.wr_data_count_i_reg[12] [2]),
        .O(\gwdc.wr_data_count_i[7]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \gwdc.wr_data_count_i[7]_i_8 
       (.I0(Q[1]),
        .I1(\gwdc.wr_data_count_i_reg[12] [1]),
        .O(\gwdc.wr_data_count_i[7]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \gwdc.wr_data_count_i[7]_i_9 
       (.I0(Q[0]),
        .I1(\gwdc.wr_data_count_i_reg[12] [0]),
        .O(\gwdc.wr_data_count_i[7]_i_9_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \gwdc.wr_data_count_i_reg[12]_i_1 
       (.CI(\gwdc.wr_data_count_i_reg[7]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_gwdc.wr_data_count_i_reg[12]_i_1_CO_UNCONNECTED [7:4],\gwdc.wr_data_count_i_reg[12]_i_1_n_4 ,\gwdc.wr_data_count_i_reg[12]_i_1_n_5 ,\gwdc.wr_data_count_i_reg[12]_i_1_n_6 ,\gwdc.wr_data_count_i_reg[12]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,Q[11:8]}),
        .O({\NLW_gwdc.wr_data_count_i_reg[12]_i_1_O_UNCONNECTED [7:5],D[12:8]}),
        .S({1'b0,1'b0,1'b0,\gwdc.wr_data_count_i[12]_i_2_n_0 ,\gwdc.wr_data_count_i[12]_i_3_n_0 ,\gwdc.wr_data_count_i[12]_i_4_n_0 ,\gwdc.wr_data_count_i[12]_i_5_n_0 ,\gwdc.wr_data_count_i[12]_i_6_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \gwdc.wr_data_count_i_reg[7]_i_1 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({\gwdc.wr_data_count_i_reg[7]_i_1_n_0 ,\gwdc.wr_data_count_i_reg[7]_i_1_n_1 ,\gwdc.wr_data_count_i_reg[7]_i_1_n_2 ,\gwdc.wr_data_count_i_reg[7]_i_1_n_3 ,\gwdc.wr_data_count_i_reg[7]_i_1_n_4 ,\gwdc.wr_data_count_i_reg[7]_i_1_n_5 ,\gwdc.wr_data_count_i_reg[7]_i_1_n_6 ,\gwdc.wr_data_count_i_reg[7]_i_1_n_7 }),
        .DI(Q[7:0]),
        .O(D[7:0]),
        .S({\gwdc.wr_data_count_i[7]_i_2_n_0 ,\gwdc.wr_data_count_i[7]_i_3_n_0 ,\gwdc.wr_data_count_i[7]_i_4_n_0 ,\gwdc.wr_data_count_i[7]_i_5_n_0 ,\gwdc.wr_data_count_i[7]_i_6_n_0 ,\gwdc.wr_data_count_i[7]_i_7_n_0 ,\gwdc.wr_data_count_i[7]_i_8_n_0 ,\gwdc.wr_data_count_i[7]_i_9_n_0 }));
endmodule

(* ORIG_REF_NAME = "xpm_counter_updn" *) 
module design_1_axi_video_0_3_xpm_counter_updn__parameterized1
   (Q,
    \count_value_i_reg[0]_0 ,
    \count_value_i_reg[1]_0 ,
    rd_en,
    ram_empty_i,
    SR,
    rd_clk);
  output [11:0]Q;
  input \count_value_i_reg[0]_0 ;
  input [1:0]\count_value_i_reg[1]_0 ;
  input rd_en;
  input ram_empty_i;
  input [0:0]SR;
  input rd_clk;

  wire [11:0]Q;
  wire [0:0]SR;
  wire \count_value_i[0]_i_1__2_n_0 ;
  wire \count_value_i[10]_i_1__3_n_0 ;
  wire \count_value_i[11]_i_1__3_n_0 ;
  wire \count_value_i[11]_i_2__3_n_0 ;
  wire \count_value_i[1]_i_1__3_n_0 ;
  wire \count_value_i[2]_i_1__2_n_0 ;
  wire \count_value_i[3]_i_1__2_n_0 ;
  wire \count_value_i[4]_i_1__2_n_0 ;
  wire \count_value_i[5]_i_1__3_n_0 ;
  wire \count_value_i[6]_i_1__3_n_0 ;
  wire \count_value_i[6]_i_2__3_n_0 ;
  wire \count_value_i[7]_i_1__3_n_0 ;
  wire \count_value_i[8]_i_1__3_n_0 ;
  wire \count_value_i[9]_i_1__3_n_0 ;
  wire \count_value_i[9]_i_2__3_n_0 ;
  wire \count_value_i_reg[0]_0 ;
  wire [1:0]\count_value_i_reg[1]_0 ;
  wire ram_empty_i;
  wire rd_clk;
  wire rd_en;

  LUT4 #(
    .INIT(16'h10EF)) 
    \count_value_i[0]_i_1__2 
       (.I0(rd_en),
        .I1(\count_value_i_reg[1]_0 [0]),
        .I2(\count_value_i_reg[1]_0 [1]),
        .I3(Q[0]),
        .O(\count_value_i[0]_i_1__2_n_0 ));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[10]_i_1__3 
       (.I0(Q[8]),
        .I1(\count_value_i[11]_i_2__3_n_0 ),
        .I2(Q[7]),
        .I3(Q[9]),
        .I4(Q[10]),
        .O(\count_value_i[10]_i_1__3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[11]_i_1__3 
       (.I0(Q[9]),
        .I1(Q[7]),
        .I2(\count_value_i[11]_i_2__3_n_0 ),
        .I3(Q[8]),
        .I4(Q[10]),
        .I5(Q[11]),
        .O(\count_value_i[11]_i_1__3_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[11]_i_2__3 
       (.I0(Q[6]),
        .I1(Q[4]),
        .I2(Q[2]),
        .I3(\count_value_i[6]_i_2__3_n_0 ),
        .I4(Q[3]),
        .I5(Q[5]),
        .O(\count_value_i[11]_i_2__3_n_0 ));
  LUT5 #(
    .INIT(32'h02FFFD00)) 
    \count_value_i[1]_i_1__3 
       (.I0(\count_value_i_reg[1]_0 [1]),
        .I1(\count_value_i_reg[1]_0 [0]),
        .I2(rd_en),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\count_value_i[1]_i_1__3_n_0 ));
  LUT3 #(
    .INIT(8'h78)) 
    \count_value_i[2]_i_1__2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(\count_value_i[2]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[3]_i_1__2 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(\count_value_i[3]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[4]_i_1__2 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(\count_value_i[4]_i_1__2_n_0 ));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[5]_i_1__3 
       (.I0(Q[3]),
        .I1(\count_value_i[6]_i_2__3_n_0 ),
        .I2(Q[2]),
        .I3(Q[4]),
        .I4(Q[5]),
        .O(\count_value_i[5]_i_1__3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[6]_i_1__3 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(\count_value_i[6]_i_2__3_n_0 ),
        .I3(Q[3]),
        .I4(Q[5]),
        .I5(Q[6]),
        .O(\count_value_i[6]_i_1__3_n_0 ));
  LUT6 #(
    .INIT(64'h0000AAA200000000)) 
    \count_value_i[6]_i_2__3 
       (.I0(Q[1]),
        .I1(\count_value_i_reg[1]_0 [1]),
        .I2(\count_value_i_reg[1]_0 [0]),
        .I3(rd_en),
        .I4(ram_empty_i),
        .I5(Q[0]),
        .O(\count_value_i[6]_i_2__3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[7]_i_1__3 
       (.I0(Q[5]),
        .I1(\count_value_i[9]_i_2__3_n_0 ),
        .I2(Q[6]),
        .I3(Q[7]),
        .O(\count_value_i[7]_i_1__3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[8]_i_1__3 
       (.I0(Q[6]),
        .I1(\count_value_i[9]_i_2__3_n_0 ),
        .I2(Q[5]),
        .I3(Q[7]),
        .I4(Q[8]),
        .O(\count_value_i[8]_i_1__3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[9]_i_1__3 
       (.I0(Q[7]),
        .I1(Q[5]),
        .I2(\count_value_i[9]_i_2__3_n_0 ),
        .I3(Q[6]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(\count_value_i[9]_i_1__3_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[9]_i_2__3 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(\count_value_i_reg[0]_0 ),
        .I4(Q[1]),
        .I5(Q[3]),
        .O(\count_value_i[9]_i_2__3_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \count_value_i_reg[0] 
       (.C(rd_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[0]_i_1__2_n_0 ),
        .Q(Q[0]),
        .S(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[10] 
       (.C(rd_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[10]_i_1__3_n_0 ),
        .Q(Q[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[11] 
       (.C(rd_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[11]_i_1__3_n_0 ),
        .Q(Q[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[1] 
       (.C(rd_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[1]_i_1__3_n_0 ),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[2] 
       (.C(rd_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[2]_i_1__2_n_0 ),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[3] 
       (.C(rd_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[3]_i_1__2_n_0 ),
        .Q(Q[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[4] 
       (.C(rd_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[4]_i_1__2_n_0 ),
        .Q(Q[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[5] 
       (.C(rd_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[5]_i_1__3_n_0 ),
        .Q(Q[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[6] 
       (.C(rd_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[6]_i_1__3_n_0 ),
        .Q(Q[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[7] 
       (.C(rd_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[7]_i_1__3_n_0 ),
        .Q(Q[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[8] 
       (.C(rd_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[8]_i_1__3_n_0 ),
        .Q(Q[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[9] 
       (.C(rd_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[9]_i_1__3_n_0 ),
        .Q(Q[9]),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "xpm_counter_updn" *) 
module design_1_axi_video_0_3_xpm_counter_updn__parameterized1_3
   (Q,
    ram_wr_en_i,
    wr_en,
    \count_value_i_reg[6]_0 ,
    wrst_busy,
    rst_d1,
    wr_clk);
  output [11:0]Q;
  input ram_wr_en_i;
  input wr_en;
  input \count_value_i_reg[6]_0 ;
  input wrst_busy;
  input rst_d1;
  input wr_clk;

  wire [11:0]Q;
  wire \count_value_i[0]_i_1__0_n_0 ;
  wire \count_value_i[10]_i_1__0_n_0 ;
  wire \count_value_i[11]_i_1__0_n_0 ;
  wire \count_value_i[11]_i_2__0_n_0 ;
  wire \count_value_i[1]_i_1__0_n_0 ;
  wire \count_value_i[2]_i_1__0_n_0 ;
  wire \count_value_i[3]_i_1__0_n_0 ;
  wire \count_value_i[4]_i_1__0_n_0 ;
  wire \count_value_i[5]_i_1__0_n_0 ;
  wire \count_value_i[6]_i_1__0_n_0 ;
  wire \count_value_i[6]_i_2__0_n_0 ;
  wire \count_value_i[7]_i_1__0_n_0 ;
  wire \count_value_i[8]_i_1__0_n_0 ;
  wire \count_value_i[9]_i_1__0_n_0 ;
  wire \count_value_i[9]_i_2__0_n_0 ;
  wire \count_value_i_reg[6]_0 ;
  wire ram_wr_en_i;
  wire rst_d1;
  wire wr_clk;
  wire wr_en;
  wire wrst_busy;

  LUT1 #(
    .INIT(2'h1)) 
    \count_value_i[0]_i_1__0 
       (.I0(Q[0]),
        .O(\count_value_i[0]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[10]_i_1__0 
       (.I0(Q[8]),
        .I1(\count_value_i[11]_i_2__0_n_0 ),
        .I2(Q[7]),
        .I3(Q[9]),
        .I4(Q[10]),
        .O(\count_value_i[10]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[11]_i_1__0 
       (.I0(Q[9]),
        .I1(Q[7]),
        .I2(\count_value_i[11]_i_2__0_n_0 ),
        .I3(Q[8]),
        .I4(Q[10]),
        .I5(Q[11]),
        .O(\count_value_i[11]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[11]_i_2__0 
       (.I0(Q[6]),
        .I1(Q[4]),
        .I2(Q[2]),
        .I3(\count_value_i[6]_i_2__0_n_0 ),
        .I4(Q[3]),
        .I5(Q[5]),
        .O(\count_value_i[11]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count_value_i[1]_i_1__0 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\count_value_i[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count_value_i[2]_i_1__0 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(\count_value_i[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[3]_i_1__0 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(\count_value_i[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[4]_i_1__0 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(\count_value_i[4]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[5]_i_1__0 
       (.I0(Q[3]),
        .I1(\count_value_i[6]_i_2__0_n_0 ),
        .I2(Q[2]),
        .I3(Q[4]),
        .I4(Q[5]),
        .O(\count_value_i[5]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[6]_i_1__0 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(\count_value_i[6]_i_2__0_n_0 ),
        .I3(Q[3]),
        .I4(Q[5]),
        .I5(Q[6]),
        .O(\count_value_i[6]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \count_value_i[6]_i_2__0 
       (.I0(Q[1]),
        .I1(wr_en),
        .I2(\count_value_i_reg[6]_0 ),
        .I3(wrst_busy),
        .I4(rst_d1),
        .I5(Q[0]),
        .O(\count_value_i[6]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[7]_i_1__0 
       (.I0(Q[5]),
        .I1(\count_value_i[9]_i_2__0_n_0 ),
        .I2(Q[6]),
        .I3(Q[7]),
        .O(\count_value_i[7]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[8]_i_1__0 
       (.I0(Q[6]),
        .I1(\count_value_i[9]_i_2__0_n_0 ),
        .I2(Q[5]),
        .I3(Q[7]),
        .I4(Q[8]),
        .O(\count_value_i[8]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[9]_i_1__0 
       (.I0(Q[7]),
        .I1(Q[5]),
        .I2(\count_value_i[9]_i_2__0_n_0 ),
        .I3(Q[6]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(\count_value_i[9]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[9]_i_2__0 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(ram_wr_en_i),
        .I4(Q[1]),
        .I5(Q[3]),
        .O(\count_value_i[9]_i_2__0_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \count_value_i_reg[0] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[0]_i_1__0_n_0 ),
        .Q(Q[0]),
        .S(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[10] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[10]_i_1__0_n_0 ),
        .Q(Q[10]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[11] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[11]_i_1__0_n_0 ),
        .Q(Q[11]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[1] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[1]_i_1__0_n_0 ),
        .Q(Q[1]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[2] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[2]_i_1__0_n_0 ),
        .Q(Q[2]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[3] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[3]_i_1__0_n_0 ),
        .Q(Q[3]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[4] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[4]_i_1__0_n_0 ),
        .Q(Q[4]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[5] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[5]_i_1__0_n_0 ),
        .Q(Q[5]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[6] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[6]_i_1__0_n_0 ),
        .Q(Q[6]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[7] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[7]_i_1__0_n_0 ),
        .Q(Q[7]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[8] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[8]_i_1__0_n_0 ),
        .Q(Q[8]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[9] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[9]_i_1__0_n_0 ),
        .Q(Q[9]),
        .R(wrst_busy));
endmodule

(* ORIG_REF_NAME = "xpm_counter_updn" *) 
module design_1_axi_video_0_3_xpm_counter_updn__parameterized2
   (Q,
    ram_wr_en_i,
    wr_en,
    \count_value_i_reg[6]_0 ,
    wrst_busy,
    rst_d1,
    wr_clk);
  output [11:0]Q;
  input ram_wr_en_i;
  input wr_en;
  input \count_value_i_reg[6]_0 ;
  input wrst_busy;
  input rst_d1;
  input wr_clk;

  wire [11:0]Q;
  wire \count_value_i[0]_i_1_n_0 ;
  wire \count_value_i[10]_i_1_n_0 ;
  wire \count_value_i[11]_i_1_n_0 ;
  wire \count_value_i[11]_i_2_n_0 ;
  wire \count_value_i[1]_i_1_n_0 ;
  wire \count_value_i[2]_i_1_n_0 ;
  wire \count_value_i[3]_i_1_n_0 ;
  wire \count_value_i[4]_i_1_n_0 ;
  wire \count_value_i[5]_i_1_n_0 ;
  wire \count_value_i[6]_i_1_n_0 ;
  wire \count_value_i[6]_i_2_n_0 ;
  wire \count_value_i[7]_i_1_n_0 ;
  wire \count_value_i[8]_i_1_n_0 ;
  wire \count_value_i[9]_i_1_n_0 ;
  wire \count_value_i[9]_i_2_n_0 ;
  wire \count_value_i_reg[6]_0 ;
  wire ram_wr_en_i;
  wire rst_d1;
  wire wr_clk;
  wire wr_en;
  wire wrst_busy;

  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \count_value_i[0]_i_1 
       (.I0(Q[0]),
        .O(\count_value_i[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[10]_i_1 
       (.I0(Q[8]),
        .I1(\count_value_i[11]_i_2_n_0 ),
        .I2(Q[7]),
        .I3(Q[9]),
        .I4(Q[10]),
        .O(\count_value_i[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[11]_i_1 
       (.I0(Q[9]),
        .I1(Q[7]),
        .I2(\count_value_i[11]_i_2_n_0 ),
        .I3(Q[8]),
        .I4(Q[10]),
        .I5(Q[11]),
        .O(\count_value_i[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[11]_i_2 
       (.I0(Q[6]),
        .I1(Q[4]),
        .I2(Q[2]),
        .I3(\count_value_i[6]_i_2_n_0 ),
        .I4(Q[3]),
        .I5(Q[5]),
        .O(\count_value_i[11]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \count_value_i[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\count_value_i[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count_value_i[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(\count_value_i[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(\count_value_i[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[4]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(\count_value_i[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[5]_i_1 
       (.I0(Q[3]),
        .I1(\count_value_i[6]_i_2_n_0 ),
        .I2(Q[2]),
        .I3(Q[4]),
        .I4(Q[5]),
        .O(\count_value_i[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[6]_i_1 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(\count_value_i[6]_i_2_n_0 ),
        .I3(Q[3]),
        .I4(Q[5]),
        .I5(Q[6]),
        .O(\count_value_i[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \count_value_i[6]_i_2 
       (.I0(Q[1]),
        .I1(wr_en),
        .I2(\count_value_i_reg[6]_0 ),
        .I3(wrst_busy),
        .I4(rst_d1),
        .I5(Q[0]),
        .O(\count_value_i[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[7]_i_1 
       (.I0(Q[5]),
        .I1(\count_value_i[9]_i_2_n_0 ),
        .I2(Q[6]),
        .I3(Q[7]),
        .O(\count_value_i[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[8]_i_1 
       (.I0(Q[6]),
        .I1(\count_value_i[9]_i_2_n_0 ),
        .I2(Q[5]),
        .I3(Q[7]),
        .I4(Q[8]),
        .O(\count_value_i[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[9]_i_1 
       (.I0(Q[7]),
        .I1(Q[5]),
        .I2(\count_value_i[9]_i_2_n_0 ),
        .I3(Q[6]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(\count_value_i[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[9]_i_2 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(ram_wr_en_i),
        .I4(Q[1]),
        .I5(Q[3]),
        .O(\count_value_i[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[0] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[10] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[10]_i_1_n_0 ),
        .Q(Q[10]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[11] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[11]_i_1_n_0 ),
        .Q(Q[11]),
        .R(wrst_busy));
  FDSE #(
    .INIT(1'b1)) 
    \count_value_i_reg[1] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[1]_i_1_n_0 ),
        .Q(Q[1]),
        .S(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[2] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[2]_i_1_n_0 ),
        .Q(Q[2]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[3] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[3]_i_1_n_0 ),
        .Q(Q[3]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[4] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[4]_i_1_n_0 ),
        .Q(Q[4]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[5] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[5]_i_1_n_0 ),
        .Q(Q[5]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[6] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[6]_i_1_n_0 ),
        .Q(Q[6]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[7] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[7]_i_1_n_0 ),
        .Q(Q[7]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[8] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[8]_i_1_n_0 ),
        .Q(Q[8]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[9] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[9]_i_1_n_0 ),
        .Q(Q[9]),
        .R(wrst_busy));
endmodule

(* ORIG_REF_NAME = "xpm_counter_updn" *) 
module design_1_axi_video_0_3_xpm_counter_updn__parameterized3
   (Q,
    wrst_busy,
    E,
    wr_clk);
  output [3:0]Q;
  input wrst_busy;
  input [0:0]E;
  input wr_clk;

  wire [0:0]E;
  wire [3:0]Q;
  wire \count_value_i[0]_i_1_n_0 ;
  wire \count_value_i[1]_i_1_n_0 ;
  wire \count_value_i[2]_i_1_n_0 ;
  wire \count_value_i[3]_i_1_n_0 ;
  wire wr_clk;
  wire wrst_busy;

  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \count_value_i[0]_i_1 
       (.I0(Q[0]),
        .O(\count_value_i[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count_value_i[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\count_value_i[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count_value_i[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(\count_value_i[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(\count_value_i[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[0] 
       (.C(wr_clk),
        .CE(E),
        .D(\count_value_i[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[1] 
       (.C(wr_clk),
        .CE(E),
        .D(\count_value_i[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[2] 
       (.C(wr_clk),
        .CE(E),
        .D(\count_value_i[2]_i_1_n_0 ),
        .Q(Q[2]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[3] 
       (.C(wr_clk),
        .CE(E),
        .D(\count_value_i[3]_i_1_n_0 ),
        .Q(Q[3]),
        .R(wrst_busy));
endmodule

(* ORIG_REF_NAME = "xpm_counter_updn" *) 
module design_1_axi_video_0_3_xpm_counter_updn__parameterized4
   (\count_value_i_reg[3]_0 ,
    Q,
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg ,
    wrst_busy,
    E,
    wr_clk);
  output \count_value_i_reg[3]_0 ;
  output [2:0]Q;
  input [0:0]\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg ;
  input wrst_busy;
  input [0:0]E;
  input wr_clk;

  wire [0:0]E;
  wire [2:0]Q;
  wire \count_value_i[0]_i_1__1_n_0 ;
  wire \count_value_i[1]_i_1__1_n_0 ;
  wire \count_value_i[2]_i_1__1_n_0 ;
  wire \count_value_i[3]_i_1__1_n_0 ;
  wire [3:3]count_value_i__0;
  wire \count_value_i_reg[3]_0 ;
  wire [0:0]\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg ;
  wire wr_clk;
  wire wrst_busy;

  LUT1 #(
    .INIT(2'h1)) 
    \count_value_i[0]_i_1__1 
       (.I0(Q[0]),
        .O(\count_value_i[0]_i_1__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \count_value_i[1]_i_1__1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\count_value_i[1]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count_value_i[2]_i_1__1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(\count_value_i[2]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[3]_i_1__1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(count_value_i__0),
        .O(\count_value_i[3]_i_1__1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \count_value_i_reg[0] 
       (.C(wr_clk),
        .CE(E),
        .D(\count_value_i[0]_i_1__1_n_0 ),
        .Q(Q[0]),
        .S(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[1] 
       (.C(wr_clk),
        .CE(E),
        .D(\count_value_i[1]_i_1__1_n_0 ),
        .Q(Q[1]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[2] 
       (.C(wr_clk),
        .CE(E),
        .D(\count_value_i[2]_i_1__1_n_0 ),
        .Q(Q[2]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[3] 
       (.C(wr_clk),
        .CE(E),
        .D(\count_value_i[3]_i_1__1_n_0 ),
        .Q(count_value_i__0),
        .R(wrst_busy));
  LUT2 #(
    .INIT(4'h9)) 
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_i_i_2 
       (.I0(count_value_i__0),
        .I1(\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg ),
        .O(\count_value_i_reg[3]_0 ));
endmodule

(* ORIG_REF_NAME = "xpm_counter_updn" *) 
module design_1_axi_video_0_3_xpm_counter_updn__parameterized5
   (\count_value_i_reg[3]_0 ,
    \count_value_i_reg[2]_0 ,
    Q,
    wrst_busy,
    E,
    wr_clk);
  output \count_value_i_reg[3]_0 ;
  output [2:0]\count_value_i_reg[2]_0 ;
  input [0:0]Q;
  input wrst_busy;
  input [0:0]E;
  input wr_clk;

  wire [0:0]E;
  wire [0:0]Q;
  wire \count_value_i[0]_i_1__0_n_0 ;
  wire \count_value_i[1]_i_1__0_n_0 ;
  wire \count_value_i[2]_i_1__0_n_0 ;
  wire \count_value_i[3]_i_1__0_n_0 ;
  wire [2:0]\count_value_i_reg[2]_0 ;
  wire \count_value_i_reg[3]_0 ;
  wire \count_value_i_reg_n_0_[3] ;
  wire wr_clk;
  wire wrst_busy;

  LUT1 #(
    .INIT(2'h1)) 
    \count_value_i[0]_i_1__0 
       (.I0(\count_value_i_reg[2]_0 [0]),
        .O(\count_value_i[0]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \count_value_i[1]_i_1__0 
       (.I0(\count_value_i_reg[2]_0 [0]),
        .I1(\count_value_i_reg[2]_0 [1]),
        .O(\count_value_i[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count_value_i[2]_i_1__0 
       (.I0(\count_value_i_reg[2]_0 [0]),
        .I1(\count_value_i_reg[2]_0 [1]),
        .I2(\count_value_i_reg[2]_0 [2]),
        .O(\count_value_i[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[3]_i_1__0 
       (.I0(\count_value_i_reg[2]_0 [1]),
        .I1(\count_value_i_reg[2]_0 [0]),
        .I2(\count_value_i_reg[2]_0 [2]),
        .I3(\count_value_i_reg_n_0_[3] ),
        .O(\count_value_i[3]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[0] 
       (.C(wr_clk),
        .CE(E),
        .D(\count_value_i[0]_i_1__0_n_0 ),
        .Q(\count_value_i_reg[2]_0 [0]),
        .R(wrst_busy));
  FDSE #(
    .INIT(1'b1)) 
    \count_value_i_reg[1] 
       (.C(wr_clk),
        .CE(E),
        .D(\count_value_i[1]_i_1__0_n_0 ),
        .Q(\count_value_i_reg[2]_0 [1]),
        .S(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[2] 
       (.C(wr_clk),
        .CE(E),
        .D(\count_value_i[2]_i_1__0_n_0 ),
        .Q(\count_value_i_reg[2]_0 [2]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[3] 
       (.C(wr_clk),
        .CE(E),
        .D(\count_value_i[3]_i_1__0_n_0 ),
        .Q(\count_value_i_reg_n_0_[3] ),
        .R(wrst_busy));
  LUT2 #(
    .INIT(4'h9)) 
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_i_i_5 
       (.I0(\count_value_i_reg_n_0_[3] ),
        .I1(Q),
        .O(\count_value_i_reg[3]_0 ));
endmodule

(* ORIG_REF_NAME = "xpm_counter_updn" *) 
module design_1_axi_video_0_3_xpm_counter_updn__parameterized6
   (\reg_out_i_reg[0] ,
    \count_value_i_reg[4]_0 ,
    \count_value_i_reg[4]_1 ,
    Q,
    \count_value_i_reg[1]_0 ,
    rd_en,
    SR,
    E,
    rd_clk);
  output \reg_out_i_reg[0] ;
  output [4:0]\count_value_i_reg[4]_0 ;
  output \count_value_i_reg[4]_1 ;
  input [3:0]Q;
  input [1:0]\count_value_i_reg[1]_0 ;
  input rd_en;
  input [0:0]SR;
  input [0:0]E;
  input rd_clk;

  wire [0:0]E;
  wire [3:0]Q;
  wire [0:0]SR;
  wire \count_value_i[0]_i_1__2_n_0 ;
  wire \count_value_i[1]_i_1__2_n_0 ;
  wire \count_value_i[2]_i_1__2_n_0 ;
  wire \count_value_i[3]_i_1__2_n_0 ;
  wire \count_value_i[4]_i_1_n_0 ;
  wire [1:0]\count_value_i_reg[1]_0 ;
  wire [4:0]\count_value_i_reg[4]_0 ;
  wire \count_value_i_reg[4]_1 ;
  wire rd_clk;
  wire rd_en;
  wire \reg_out_i_reg[0] ;

  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT4 #(
    .INIT(16'h04FB)) 
    \count_value_i[0]_i_1__2 
       (.I0(rd_en),
        .I1(\count_value_i_reg[1]_0 [1]),
        .I2(\count_value_i_reg[1]_0 [0]),
        .I3(\count_value_i_reg[4]_0 [0]),
        .O(\count_value_i[0]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT5 #(
    .INIT(32'h04FFFB00)) 
    \count_value_i[1]_i_1__2 
       (.I0(\count_value_i_reg[1]_0 [0]),
        .I1(\count_value_i_reg[1]_0 [1]),
        .I2(rd_en),
        .I3(\count_value_i_reg[4]_0 [0]),
        .I4(\count_value_i_reg[4]_0 [1]),
        .O(\count_value_i[1]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count_value_i[2]_i_1__2 
       (.I0(\count_value_i_reg[4]_0 [0]),
        .I1(\count_value_i_reg[4]_0 [1]),
        .I2(\count_value_i_reg[4]_0 [2]),
        .O(\count_value_i[2]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[3]_i_1__2 
       (.I0(\count_value_i_reg[4]_0 [2]),
        .I1(\count_value_i_reg[4]_0 [1]),
        .I2(\count_value_i_reg[4]_0 [0]),
        .I3(\count_value_i_reg[4]_0 [3]),
        .O(\count_value_i[3]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[4]_i_1 
       (.I0(\count_value_i_reg[4]_0 [3]),
        .I1(\count_value_i_reg[4]_0 [0]),
        .I2(\count_value_i_reg[4]_0 [1]),
        .I3(\count_value_i_reg[4]_0 [2]),
        .I4(\count_value_i_reg[4]_0 [4]),
        .O(\count_value_i[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[0] 
       (.C(rd_clk),
        .CE(E),
        .D(\count_value_i[0]_i_1__2_n_0 ),
        .Q(\count_value_i_reg[4]_0 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[1] 
       (.C(rd_clk),
        .CE(E),
        .D(\count_value_i[1]_i_1__2_n_0 ),
        .Q(\count_value_i_reg[4]_0 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[2] 
       (.C(rd_clk),
        .CE(E),
        .D(\count_value_i[2]_i_1__2_n_0 ),
        .Q(\count_value_i_reg[4]_0 [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[3] 
       (.C(rd_clk),
        .CE(E),
        .D(\count_value_i[3]_i_1__2_n_0 ),
        .Q(\count_value_i_reg[4]_0 [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[4] 
       (.C(rd_clk),
        .CE(E),
        .D(\count_value_i[4]_i_1_n_0 ),
        .Q(\count_value_i_reg[4]_0 [4]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'h09)) 
    \gen_pf_ic_rc.ram_empty_i_i_4 
       (.I0(Q[0]),
        .I1(\count_value_i_reg[4]_0 [1]),
        .I2(\count_value_i_reg[4]_0 [0]),
        .O(\reg_out_i_reg[0] ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pf_ic_rc.ram_empty_i_i_5 
       (.I0(\count_value_i_reg[4]_0 [4]),
        .I1(Q[3]),
        .I2(\count_value_i_reg[4]_0 [3]),
        .I3(Q[2]),
        .I4(Q[1]),
        .I5(\count_value_i_reg[4]_0 [2]),
        .O(\count_value_i_reg[4]_1 ));
endmodule

(* ORIG_REF_NAME = "xpm_counter_updn" *) 
module design_1_axi_video_0_3_xpm_counter_updn__parameterized7
   (ram_empty_i0,
    E,
    \gen_pf_ic_rc.ram_empty_i_reg ,
    \gen_pf_ic_rc.ram_empty_i_reg_0 ,
    Q,
    rd_en,
    ram_empty_i,
    \gen_pf_ic_rc.ram_empty_i_reg_1 ,
    SR,
    rd_clk);
  output ram_empty_i0;
  output [0:0]E;
  input \gen_pf_ic_rc.ram_empty_i_reg ;
  input \gen_pf_ic_rc.ram_empty_i_reg_0 ;
  input [1:0]Q;
  input rd_en;
  input ram_empty_i;
  input [3:0]\gen_pf_ic_rc.ram_empty_i_reg_1 ;
  input [0:0]SR;
  input rd_clk;

  wire [0:0]E;
  wire [1:0]Q;
  wire [0:0]SR;
  wire \count_value_i[0]_i_1__3_n_0 ;
  wire \count_value_i[1]_i_1__3_n_0 ;
  wire \count_value_i[2]_i_1__3_n_0 ;
  wire \count_value_i[3]_i_1__3_n_0 ;
  wire \count_value_i[4]_i_1__0_n_0 ;
  wire \count_value_i_reg_n_0_[0] ;
  wire \count_value_i_reg_n_0_[1] ;
  wire \count_value_i_reg_n_0_[2] ;
  wire \count_value_i_reg_n_0_[3] ;
  wire \count_value_i_reg_n_0_[4] ;
  wire \gen_pf_ic_rc.ram_empty_i_i_2_n_0 ;
  wire \gen_pf_ic_rc.ram_empty_i_i_3_n_0 ;
  wire \gen_pf_ic_rc.ram_empty_i_reg ;
  wire \gen_pf_ic_rc.ram_empty_i_reg_0 ;
  wire [3:0]\gen_pf_ic_rc.ram_empty_i_reg_1 ;
  wire ram_empty_i;
  wire ram_empty_i0;
  wire rd_clk;
  wire rd_en;

  LUT4 #(
    .INIT(16'h04FB)) 
    \count_value_i[0]_i_1__3 
       (.I0(rd_en),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(\count_value_i_reg_n_0_[0] ),
        .O(\count_value_i[0]_i_1__3_n_0 ));
  LUT5 #(
    .INIT(32'h04FFFB00)) 
    \count_value_i[1]_i_1__3 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(rd_en),
        .I3(\count_value_i_reg_n_0_[0] ),
        .I4(\count_value_i_reg_n_0_[1] ),
        .O(\count_value_i[1]_i_1__3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count_value_i[2]_i_1__3 
       (.I0(\count_value_i_reg_n_0_[0] ),
        .I1(\count_value_i_reg_n_0_[1] ),
        .I2(\count_value_i_reg_n_0_[2] ),
        .O(\count_value_i[2]_i_1__3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[3]_i_1__3 
       (.I0(\count_value_i_reg_n_0_[2] ),
        .I1(\count_value_i_reg_n_0_[1] ),
        .I2(\count_value_i_reg_n_0_[0] ),
        .I3(\count_value_i_reg_n_0_[3] ),
        .O(\count_value_i[3]_i_1__3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[4]_i_1__0 
       (.I0(\count_value_i_reg_n_0_[3] ),
        .I1(\count_value_i_reg_n_0_[0] ),
        .I2(\count_value_i_reg_n_0_[1] ),
        .I3(\count_value_i_reg_n_0_[2] ),
        .I4(\count_value_i_reg_n_0_[4] ),
        .O(\count_value_i[4]_i_1__0_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \count_value_i_reg[0] 
       (.C(rd_clk),
        .CE(E),
        .D(\count_value_i[0]_i_1__3_n_0 ),
        .Q(\count_value_i_reg_n_0_[0] ),
        .S(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[1] 
       (.C(rd_clk),
        .CE(E),
        .D(\count_value_i[1]_i_1__3_n_0 ),
        .Q(\count_value_i_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[2] 
       (.C(rd_clk),
        .CE(E),
        .D(\count_value_i[2]_i_1__3_n_0 ),
        .Q(\count_value_i_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[3] 
       (.C(rd_clk),
        .CE(E),
        .D(\count_value_i[3]_i_1__3_n_0 ),
        .Q(\count_value_i_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[4] 
       (.C(rd_clk),
        .CE(E),
        .D(\count_value_i[4]_i_1__0_n_0 ),
        .Q(\count_value_i_reg_n_0_[4] ),
        .R(SR));
  LUT5 #(
    .INIT(32'hFF808080)) 
    \gen_pf_ic_rc.ram_empty_i_i_1 
       (.I0(E),
        .I1(\gen_pf_ic_rc.ram_empty_i_i_2_n_0 ),
        .I2(\gen_pf_ic_rc.ram_empty_i_i_3_n_0 ),
        .I3(\gen_pf_ic_rc.ram_empty_i_reg ),
        .I4(\gen_pf_ic_rc.ram_empty_i_reg_0 ),
        .O(ram_empty_i0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pf_ic_rc.ram_empty_i_i_2 
       (.I0(\count_value_i_reg_n_0_[4] ),
        .I1(\gen_pf_ic_rc.ram_empty_i_reg_1 [3]),
        .I2(\count_value_i_reg_n_0_[3] ),
        .I3(\gen_pf_ic_rc.ram_empty_i_reg_1 [2]),
        .I4(\gen_pf_ic_rc.ram_empty_i_reg_1 [1]),
        .I5(\count_value_i_reg_n_0_[2] ),
        .O(\gen_pf_ic_rc.ram_empty_i_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'h09)) 
    \gen_pf_ic_rc.ram_empty_i_i_3 
       (.I0(\gen_pf_ic_rc.ram_empty_i_reg_1 [0]),
        .I1(\count_value_i_reg_n_0_[1] ),
        .I2(\count_value_i_reg_n_0_[0] ),
        .O(\gen_pf_ic_rc.ram_empty_i_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h00FB)) 
    \gen_sdpram.xpm_memory_base_inst_i_2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(rd_en),
        .I3(ram_empty_i),
        .O(E));
endmodule

(* CASCADE_HEIGHT = "0" *) (* CDC_SYNC_STAGES = "2" *) (* DOUT_RESET_VALUE = "0" *) 
(* ECC_MODE = "no_ecc" *) (* EN_ADV_FEATURE_ASYNC = "16'b0001000000000000" *) (* EN_SIM_ASSERT_ERR = "warning" *) 
(* FIFO_MEMORY_TYPE = "auto" *) (* FIFO_READ_LATENCY = "0" *) (* FIFO_WRITE_DEPTH = "16" *) 
(* FULL_RESET_VALUE = "1" *) (* ORIG_REF_NAME = "xpm_fifo_async" *) (* PROG_EMPTY_THRESH = "10" *) 
(* PROG_FULL_THRESH = "10" *) (* P_COMMON_CLOCK = "0" *) (* P_ECC_MODE = "0" *) 
(* P_FIFO_MEMORY_TYPE = "0" *) (* P_READ_MODE = "1" *) (* P_WAKEUP_TIME = "2" *) 
(* RD_DATA_COUNT_WIDTH = "1" *) (* READ_DATA_WIDTH = "41" *) (* READ_MODE = "0" *) 
(* RELATED_CLOCKS = "1" *) (* SIM_ASSERT_CHK = "0" *) (* USE_ADV_FEATURES = "1000" *) 
(* WAKEUP_TIME = "0" *) (* WRITE_DATA_WIDTH = "82" *) (* WR_DATA_COUNT_WIDTH = "1" *) 
(* XPM_MODULE = "TRUE" *) (* dont_touch = "true" *) 
module design_1_axi_video_0_3_xpm_fifo_async
   (sleep,
    rst,
    wr_clk,
    wr_en,
    din,
    full,
    prog_full,
    wr_data_count,
    overflow,
    wr_rst_busy,
    almost_full,
    wr_ack,
    rd_clk,
    rd_en,
    dout,
    empty,
    prog_empty,
    rd_data_count,
    underflow,
    rd_rst_busy,
    almost_empty,
    data_valid,
    injectsbiterr,
    injectdbiterr,
    sbiterr,
    dbiterr);
  input sleep;
  input rst;
  input wr_clk;
  input wr_en;
  input [81:0]din;
  output full;
  output prog_full;
  output [0:0]wr_data_count;
  output overflow;
  output wr_rst_busy;
  output almost_full;
  output wr_ack;
  input rd_clk;
  input rd_en;
  output [40:0]dout;
  output empty;
  output prog_empty;
  output [0:0]rd_data_count;
  output underflow;
  output rd_rst_busy;
  output almost_empty;
  output data_valid;
  input injectsbiterr;
  input injectdbiterr;
  output sbiterr;
  output dbiterr;

  wire \<const0> ;
  wire data_valid;
  wire [81:0]din;
  wire [40:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire rst;
  wire sleep;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;
  wire \NLW_gnuram_async_fifo.xpm_fifo_base_inst_almost_empty_UNCONNECTED ;
  wire \NLW_gnuram_async_fifo.xpm_fifo_base_inst_almost_full_UNCONNECTED ;
  wire \NLW_gnuram_async_fifo.xpm_fifo_base_inst_dbiterr_UNCONNECTED ;
  wire \NLW_gnuram_async_fifo.xpm_fifo_base_inst_full_n_UNCONNECTED ;
  wire \NLW_gnuram_async_fifo.xpm_fifo_base_inst_overflow_UNCONNECTED ;
  wire \NLW_gnuram_async_fifo.xpm_fifo_base_inst_prog_empty_UNCONNECTED ;
  wire \NLW_gnuram_async_fifo.xpm_fifo_base_inst_prog_full_UNCONNECTED ;
  wire \NLW_gnuram_async_fifo.xpm_fifo_base_inst_sbiterr_UNCONNECTED ;
  wire \NLW_gnuram_async_fifo.xpm_fifo_base_inst_underflow_UNCONNECTED ;
  wire \NLW_gnuram_async_fifo.xpm_fifo_base_inst_wr_ack_UNCONNECTED ;
  wire [0:0]\NLW_gnuram_async_fifo.xpm_fifo_base_inst_rd_data_count_UNCONNECTED ;
  wire [0:0]\NLW_gnuram_async_fifo.xpm_fifo_base_inst_wr_data_count_UNCONNECTED ;

  assign almost_empty = \<const0> ;
  assign almost_full = \<const0> ;
  assign dbiterr = \<const0> ;
  assign overflow = \<const0> ;
  assign prog_empty = \<const0> ;
  assign prog_full = \<const0> ;
  assign rd_data_count[0] = \<const0> ;
  assign sbiterr = \<const0> ;
  assign underflow = \<const0> ;
  assign wr_ack = \<const0> ;
  assign wr_data_count[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* CASCADE_HEIGHT = "0" *) 
  (* CDC_DEST_SYNC_FF = "2" *) 
  (* COMMON_CLOCK = "0" *) 
  (* DOUT_RESET_VALUE = "0" *) 
  (* ECC_MODE = "0" *) 
  (* ENABLE_ECC = "0" *) 
  (* EN_ADV_FEATURE = "16'b0001000000000000" *) 
  (* EN_AE = "1'b0" *) 
  (* EN_AF = "1'b0" *) 
  (* EN_DVLD = "1'b1" *) 
  (* EN_OF = "1'b0" *) 
  (* EN_PE = "1'b0" *) 
  (* EN_PF = "1'b0" *) 
  (* EN_RDC = "1'b0" *) 
  (* EN_SIM_ASSERT_ERR = "warning" *) 
  (* EN_UF = "1'b0" *) 
  (* EN_WACK = "1'b0" *) 
  (* EN_WDC = "1'b0" *) 
  (* FG_EQ_ASYM_DOUT = "1'b0" *) 
  (* FIFO_MEMORY_TYPE = "0" *) 
  (* FIFO_MEM_TYPE = "0" *) 
  (* FIFO_READ_DEPTH = "32" *) 
  (* FIFO_READ_LATENCY = "0" *) 
  (* FIFO_SIZE = "1312" *) 
  (* FIFO_WRITE_DEPTH = "16" *) 
  (* FULL_RESET_VALUE = "1" *) 
  (* FULL_RST_VAL = "1'b1" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* PE_THRESH_ADJ = "8" *) 
  (* PE_THRESH_MAX = "27" *) 
  (* PE_THRESH_MIN = "5" *) 
  (* PF_THRESH_ADJ = "8" *) 
  (* PF_THRESH_MAX = "11" *) 
  (* PF_THRESH_MIN = "7" *) 
  (* PROG_EMPTY_THRESH = "10" *) 
  (* PROG_FULL_THRESH = "10" *) 
  (* RD_DATA_COUNT_WIDTH = "1" *) 
  (* RD_DC_WIDTH_EXT = "6" *) 
  (* RD_LATENCY = "2" *) 
  (* RD_MODE = "1" *) 
  (* RD_PNTR_WIDTH = "5" *) 
  (* READ_DATA_WIDTH = "41" *) 
  (* READ_MODE = "1" *) 
  (* READ_MODE_LL = "1" *) 
  (* RELATED_CLOCKS = "1" *) 
  (* REMOVE_WR_RD_PROT_LOGIC = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* USE_ADV_FEATURES = "1000" *) 
  (* VERSION = "0" *) 
  (* WAKEUP_TIME = "0" *) 
  (* WIDTH_RATIO = "2" *) 
  (* WRITE_DATA_WIDTH = "82" *) 
  (* WR_DATA_COUNT_WIDTH = "1" *) 
  (* WR_DC_WIDTH_EXT = "5" *) 
  (* WR_DEPTH_LOG = "4" *) 
  (* WR_PNTR_WIDTH = "4" *) 
  (* WR_RD_RATIO = "0" *) 
  (* WR_WIDTH_LOG = "7" *) 
  (* XPM_MODULE = "TRUE" *) 
  (* both_stages_valid = "3" *) 
  (* invalid = "0" *) 
  (* stage1_valid = "2" *) 
  (* stage2_valid = "1" *) 
  design_1_axi_video_0_3_xpm_fifo_base__parameterized0 \gnuram_async_fifo.xpm_fifo_base_inst 
       (.almost_empty(\NLW_gnuram_async_fifo.xpm_fifo_base_inst_almost_empty_UNCONNECTED ),
        .almost_full(\NLW_gnuram_async_fifo.xpm_fifo_base_inst_almost_full_UNCONNECTED ),
        .data_valid(data_valid),
        .dbiterr(\NLW_gnuram_async_fifo.xpm_fifo_base_inst_dbiterr_UNCONNECTED ),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .full_n(\NLW_gnuram_async_fifo.xpm_fifo_base_inst_full_n_UNCONNECTED ),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .overflow(\NLW_gnuram_async_fifo.xpm_fifo_base_inst_overflow_UNCONNECTED ),
        .prog_empty(\NLW_gnuram_async_fifo.xpm_fifo_base_inst_prog_empty_UNCONNECTED ),
        .prog_full(\NLW_gnuram_async_fifo.xpm_fifo_base_inst_prog_full_UNCONNECTED ),
        .rd_clk(rd_clk),
        .rd_data_count(\NLW_gnuram_async_fifo.xpm_fifo_base_inst_rd_data_count_UNCONNECTED [0]),
        .rd_en(rd_en),
        .rd_rst_busy(rd_rst_busy),
        .rst(rst),
        .sbiterr(\NLW_gnuram_async_fifo.xpm_fifo_base_inst_sbiterr_UNCONNECTED ),
        .sleep(sleep),
        .underflow(\NLW_gnuram_async_fifo.xpm_fifo_base_inst_underflow_UNCONNECTED ),
        .wr_ack(\NLW_gnuram_async_fifo.xpm_fifo_base_inst_wr_ack_UNCONNECTED ),
        .wr_clk(wr_clk),
        .wr_data_count(\NLW_gnuram_async_fifo.xpm_fifo_base_inst_wr_data_count_UNCONNECTED [0]),
        .wr_en(wr_en),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* AXIS_DATA_WIDTH = "91" *) (* AXIS_FINAL_DATA_WIDTH = "91" *) (* CASCADE_HEIGHT = "0" *) 
(* CDC_SYNC_STAGES = "2" *) (* CLOCKING_MODE = "independent_clock" *) (* ECC_MODE = "no_ecc" *) 
(* EN_ADV_FEATURE_AXIS = "16'b0001000000000100" *) (* EN_ADV_FEATURE_AXIS_INT = "16'b0001000000000100" *) (* EN_ALMOST_EMPTY_INT = "1'b0" *) 
(* EN_ALMOST_FULL_INT = "1'b0" *) (* EN_DATA_VALID_INT = "1'b1" *) (* EN_SIM_ASSERT_ERR = "warning" *) 
(* FIFO_DEPTH = "4096" *) (* FIFO_MEMORY_TYPE = "auto" *) (* LOG_DEPTH_AXIS = "12" *) 
(* ORIG_REF_NAME = "xpm_fifo_axis" *) (* PACKET_FIFO = "false" *) (* PKT_SIZE_LT8 = "1'b0" *) 
(* PROG_EMPTY_THRESH = "10" *) (* PROG_FULL_THRESH = "10" *) (* P_COMMON_CLOCK = "0" *) 
(* P_ECC_MODE = "0" *) (* P_FIFO_MEMORY_TYPE = "0" *) (* P_PKT_MODE = "0" *) 
(* RD_DATA_COUNT_WIDTH = "32" *) (* RELATED_CLOCKS = "0" *) (* SIM_ASSERT_CHK = "0" *) 
(* TDATA_OFFSET = "64" *) (* TDATA_WIDTH = "64" *) (* TDEST_OFFSET = "82" *) 
(* TDEST_WIDTH = "1" *) (* TID_OFFSET = "81" *) (* TID_WIDTH = "1" *) 
(* TKEEP_OFFSET = "80" *) (* TSTRB_OFFSET = "72" *) (* TUSER_MAX_WIDTH = "4013" *) 
(* TUSER_OFFSET = "90" *) (* TUSER_WIDTH = "8" *) (* USE_ADV_FEATURES = "1004" *) 
(* USE_ADV_FEATURES_INT = "825241652" *) (* WR_DATA_COUNT_WIDTH = "13" *) (* XPM_MODULE = "TRUE" *) 
(* dont_touch = "true" *) 
module design_1_axi_video_0_3_xpm_fifo_axis
   (s_aresetn,
    s_aclk,
    m_aclk,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tid,
    s_axis_tdest,
    s_axis_tuser,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser,
    prog_full_axis,
    wr_data_count_axis,
    almost_full_axis,
    prog_empty_axis,
    rd_data_count_axis,
    almost_empty_axis,
    injectsbiterr_axis,
    injectdbiterr_axis,
    sbiterr_axis,
    dbiterr_axis);
  input s_aresetn;
  input s_aclk;
  input m_aclk;
  input s_axis_tvalid;
  output s_axis_tready;
  input [63:0]s_axis_tdata;
  input [7:0]s_axis_tstrb;
  input [7:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [0:0]s_axis_tdest;
  input [7:0]s_axis_tuser;
  output m_axis_tvalid;
  input m_axis_tready;
  output [63:0]m_axis_tdata;
  output [7:0]m_axis_tstrb;
  output [7:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [0:0]m_axis_tdest;
  output [7:0]m_axis_tuser;
  output prog_full_axis;
  output [12:0]wr_data_count_axis;
  output almost_full_axis;
  output prog_empty_axis;
  output [31:0]rd_data_count_axis;
  output almost_empty_axis;
  input injectsbiterr_axis;
  input injectdbiterr_axis;
  output sbiterr_axis;
  output dbiterr_axis;

  wire \<const0> ;
  wire \gaxis_rst_sync.xpm_cdc_sync_rst_inst_i_1_n_0 ;
  wire m_aclk;
  wire [63:0]m_axis_tdata;
  wire [0:0]m_axis_tdest;
  wire [0:0]m_axis_tid;
  wire [7:0]m_axis_tkeep;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire [7:0]m_axis_tstrb;
  wire [7:0]m_axis_tuser;
  wire m_axis_tvalid;
  wire rst_axis;
  wire s_aclk;
  wire s_aresetn;
  wire [63:0]s_axis_tdata;
  wire [0:0]s_axis_tdest;
  wire [0:0]s_axis_tid;
  wire [7:0]s_axis_tkeep;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire [7:0]s_axis_tstrb;
  wire [7:0]s_axis_tuser;
  wire s_axis_tvalid;
  wire [12:0]wr_data_count_axis;
  wire xpm_fifo_base_inst_i_1_n_0;
  wire NLW_xpm_fifo_base_inst_almost_empty_UNCONNECTED;
  wire NLW_xpm_fifo_base_inst_almost_full_UNCONNECTED;
  wire NLW_xpm_fifo_base_inst_dbiterr_UNCONNECTED;
  wire NLW_xpm_fifo_base_inst_empty_UNCONNECTED;
  wire NLW_xpm_fifo_base_inst_full_UNCONNECTED;
  wire NLW_xpm_fifo_base_inst_overflow_UNCONNECTED;
  wire NLW_xpm_fifo_base_inst_prog_empty_UNCONNECTED;
  wire NLW_xpm_fifo_base_inst_prog_full_UNCONNECTED;
  wire NLW_xpm_fifo_base_inst_rd_rst_busy_UNCONNECTED;
  wire NLW_xpm_fifo_base_inst_sbiterr_UNCONNECTED;
  wire NLW_xpm_fifo_base_inst_underflow_UNCONNECTED;
  wire NLW_xpm_fifo_base_inst_wr_ack_UNCONNECTED;
  wire NLW_xpm_fifo_base_inst_wr_rst_busy_UNCONNECTED;
  wire [31:0]NLW_xpm_fifo_base_inst_rd_data_count_UNCONNECTED;

  assign almost_empty_axis = \<const0> ;
  assign almost_full_axis = \<const0> ;
  assign dbiterr_axis = \<const0> ;
  assign prog_empty_axis = \<const0> ;
  assign prog_full_axis = \<const0> ;
  assign rd_data_count_axis[31] = \<const0> ;
  assign rd_data_count_axis[30] = \<const0> ;
  assign rd_data_count_axis[29] = \<const0> ;
  assign rd_data_count_axis[28] = \<const0> ;
  assign rd_data_count_axis[27] = \<const0> ;
  assign rd_data_count_axis[26] = \<const0> ;
  assign rd_data_count_axis[25] = \<const0> ;
  assign rd_data_count_axis[24] = \<const0> ;
  assign rd_data_count_axis[23] = \<const0> ;
  assign rd_data_count_axis[22] = \<const0> ;
  assign rd_data_count_axis[21] = \<const0> ;
  assign rd_data_count_axis[20] = \<const0> ;
  assign rd_data_count_axis[19] = \<const0> ;
  assign rd_data_count_axis[18] = \<const0> ;
  assign rd_data_count_axis[17] = \<const0> ;
  assign rd_data_count_axis[16] = \<const0> ;
  assign rd_data_count_axis[15] = \<const0> ;
  assign rd_data_count_axis[14] = \<const0> ;
  assign rd_data_count_axis[13] = \<const0> ;
  assign rd_data_count_axis[12] = \<const0> ;
  assign rd_data_count_axis[11] = \<const0> ;
  assign rd_data_count_axis[10] = \<const0> ;
  assign rd_data_count_axis[9] = \<const0> ;
  assign rd_data_count_axis[8] = \<const0> ;
  assign rd_data_count_axis[7] = \<const0> ;
  assign rd_data_count_axis[6] = \<const0> ;
  assign rd_data_count_axis[5] = \<const0> ;
  assign rd_data_count_axis[4] = \<const0> ;
  assign rd_data_count_axis[3] = \<const0> ;
  assign rd_data_count_axis[2] = \<const0> ;
  assign rd_data_count_axis[1] = \<const0> ;
  assign rd_data_count_axis[0] = \<const0> ;
  assign sbiterr_axis = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* DEF_VAL = "1'b0" *) 
  (* DEST_SYNC_FF = "2" *) 
  (* INIT = "0" *) 
  (* INIT_SYNC_FF = "1" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_1_axi_video_0_3_xpm_cdc_sync_rst__5 \gaxis_rst_sync.xpm_cdc_sync_rst_inst 
       (.dest_clk(s_aclk),
        .dest_rst(rst_axis),
        .src_rst(\gaxis_rst_sync.xpm_cdc_sync_rst_inst_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \gaxis_rst_sync.xpm_cdc_sync_rst_inst_i_1 
       (.I0(s_aresetn),
        .O(\gaxis_rst_sync.xpm_cdc_sync_rst_inst_i_1_n_0 ));
  (* CASCADE_HEIGHT = "0" *) 
  (* CDC_DEST_SYNC_FF = "2" *) 
  (* COMMON_CLOCK = "0" *) 
  (* DOUT_RESET_VALUE = "" *) 
  (* ECC_MODE = "0" *) 
  (* ENABLE_ECC = "0" *) 
  (* EN_ADV_FEATURE = "16'b0001000000000100" *) 
  (* EN_AE = "1'b0" *) 
  (* EN_AF = "1'b0" *) 
  (* EN_DVLD = "1'b1" *) 
  (* EN_OF = "1'b0" *) 
  (* EN_PE = "1'b0" *) 
  (* EN_PF = "1'b0" *) 
  (* EN_RDC = "1'b0" *) 
  (* EN_SIM_ASSERT_ERR = "warning" *) 
  (* EN_UF = "1'b0" *) 
  (* EN_WACK = "1'b0" *) 
  (* EN_WDC = "1'b1" *) 
  (* FG_EQ_ASYM_DOUT = "1'b0" *) 
  (* FIFO_MEMORY_TYPE = "0" *) 
  (* FIFO_MEM_TYPE = "0" *) 
  (* FIFO_READ_DEPTH = "4096" *) 
  (* FIFO_READ_LATENCY = "0" *) 
  (* FIFO_SIZE = "372736" *) 
  (* FIFO_WRITE_DEPTH = "4096" *) 
  (* FULL_RESET_VALUE = "1" *) 
  (* FULL_RST_VAL = "1'b1" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* PE_THRESH_ADJ = "8" *) 
  (* PE_THRESH_MAX = "4091" *) 
  (* PE_THRESH_MIN = "5" *) 
  (* PF_THRESH_ADJ = "8" *) 
  (* PF_THRESH_MAX = "4091" *) 
  (* PF_THRESH_MIN = "7" *) 
  (* PROG_EMPTY_THRESH = "10" *) 
  (* PROG_FULL_THRESH = "10" *) 
  (* RD_DATA_COUNT_WIDTH = "32" *) 
  (* RD_DC_WIDTH_EXT = "13" *) 
  (* RD_LATENCY = "2" *) 
  (* RD_MODE = "1" *) 
  (* RD_PNTR_WIDTH = "12" *) 
  (* READ_DATA_WIDTH = "91" *) 
  (* READ_MODE = "1" *) 
  (* READ_MODE_LL = "1" *) 
  (* RELATED_CLOCKS = "0" *) 
  (* REMOVE_WR_RD_PROT_LOGIC = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* USE_ADV_FEATURES = "825241652" *) 
  (* VERSION = "0" *) 
  (* WAKEUP_TIME = "0" *) 
  (* WIDTH_RATIO = "1" *) 
  (* WRITE_DATA_WIDTH = "91" *) 
  (* WR_DATA_COUNT_WIDTH = "13" *) 
  (* WR_DC_WIDTH_EXT = "13" *) 
  (* WR_DEPTH_LOG = "12" *) 
  (* WR_PNTR_WIDTH = "12" *) 
  (* WR_RD_RATIO = "0" *) 
  (* WR_WIDTH_LOG = "7" *) 
  (* XPM_MODULE = "TRUE" *) 
  (* both_stages_valid = "3" *) 
  (* invalid = "0" *) 
  (* stage1_valid = "2" *) 
  (* stage2_valid = "1" *) 
  design_1_axi_video_0_3_xpm_fifo_base xpm_fifo_base_inst
       (.almost_empty(NLW_xpm_fifo_base_inst_almost_empty_UNCONNECTED),
        .almost_full(NLW_xpm_fifo_base_inst_almost_full_UNCONNECTED),
        .data_valid(m_axis_tvalid),
        .dbiterr(NLW_xpm_fifo_base_inst_dbiterr_UNCONNECTED),
        .din({s_axis_tlast,s_axis_tuser,s_axis_tdest,s_axis_tid,s_axis_tkeep,s_axis_tstrb,s_axis_tdata}),
        .dout({m_axis_tlast,m_axis_tuser,m_axis_tdest,m_axis_tid,m_axis_tkeep,m_axis_tstrb,m_axis_tdata}),
        .empty(NLW_xpm_fifo_base_inst_empty_UNCONNECTED),
        .full(NLW_xpm_fifo_base_inst_full_UNCONNECTED),
        .full_n(s_axis_tready),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .overflow(NLW_xpm_fifo_base_inst_overflow_UNCONNECTED),
        .prog_empty(NLW_xpm_fifo_base_inst_prog_empty_UNCONNECTED),
        .prog_full(NLW_xpm_fifo_base_inst_prog_full_UNCONNECTED),
        .rd_clk(m_aclk),
        .rd_data_count(NLW_xpm_fifo_base_inst_rd_data_count_UNCONNECTED[31:0]),
        .rd_en(xpm_fifo_base_inst_i_1_n_0),
        .rd_rst_busy(NLW_xpm_fifo_base_inst_rd_rst_busy_UNCONNECTED),
        .rst(rst_axis),
        .sbiterr(NLW_xpm_fifo_base_inst_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .underflow(NLW_xpm_fifo_base_inst_underflow_UNCONNECTED),
        .wr_ack(NLW_xpm_fifo_base_inst_wr_ack_UNCONNECTED),
        .wr_clk(s_aclk),
        .wr_data_count(wr_data_count_axis),
        .wr_en(s_axis_tvalid),
        .wr_rst_busy(NLW_xpm_fifo_base_inst_wr_rst_busy_UNCONNECTED));
  LUT2 #(
    .INIT(4'h8)) 
    xpm_fifo_base_inst_i_1
       (.I0(m_axis_tvalid),
        .I1(m_axis_tready),
        .O(xpm_fifo_base_inst_i_1_n_0));
endmodule

(* CASCADE_HEIGHT = "0" *) (* CDC_DEST_SYNC_FF = "2" *) (* COMMON_CLOCK = "0" *) 
(* DOUT_RESET_VALUE = "" *) (* ECC_MODE = "0" *) (* ENABLE_ECC = "0" *) 
(* EN_ADV_FEATURE = "16'b0001000000000100" *) (* EN_AE = "1'b0" *) (* EN_AF = "1'b0" *) 
(* EN_DVLD = "1'b1" *) (* EN_OF = "1'b0" *) (* EN_PE = "1'b0" *) 
(* EN_PF = "1'b0" *) (* EN_RDC = "1'b0" *) (* EN_SIM_ASSERT_ERR = "warning" *) 
(* EN_UF = "1'b0" *) (* EN_WACK = "1'b0" *) (* EN_WDC = "1'b1" *) 
(* FG_EQ_ASYM_DOUT = "1'b0" *) (* FIFO_MEMORY_TYPE = "0" *) (* FIFO_MEM_TYPE = "0" *) 
(* FIFO_READ_DEPTH = "4096" *) (* FIFO_READ_LATENCY = "0" *) (* FIFO_SIZE = "372736" *) 
(* FIFO_WRITE_DEPTH = "4096" *) (* FULL_RESET_VALUE = "1" *) (* FULL_RST_VAL = "1'b1" *) 
(* ORIG_REF_NAME = "xpm_fifo_base" *) (* PE_THRESH_ADJ = "8" *) (* PE_THRESH_MAX = "4091" *) 
(* PE_THRESH_MIN = "5" *) (* PF_THRESH_ADJ = "8" *) (* PF_THRESH_MAX = "4091" *) 
(* PF_THRESH_MIN = "7" *) (* PROG_EMPTY_THRESH = "10" *) (* PROG_FULL_THRESH = "10" *) 
(* RD_DATA_COUNT_WIDTH = "32" *) (* RD_DC_WIDTH_EXT = "13" *) (* RD_LATENCY = "2" *) 
(* RD_MODE = "1" *) (* RD_PNTR_WIDTH = "12" *) (* READ_DATA_WIDTH = "91" *) 
(* READ_MODE = "1" *) (* READ_MODE_LL = "1" *) (* RELATED_CLOCKS = "0" *) 
(* REMOVE_WR_RD_PROT_LOGIC = "0" *) (* SIM_ASSERT_CHK = "0" *) (* USE_ADV_FEATURES = "825241652" *) 
(* VERSION = "0" *) (* WAKEUP_TIME = "0" *) (* WIDTH_RATIO = "1" *) 
(* WRITE_DATA_WIDTH = "91" *) (* WR_DATA_COUNT_WIDTH = "13" *) (* WR_DC_WIDTH_EXT = "13" *) 
(* WR_DEPTH_LOG = "12" *) (* WR_PNTR_WIDTH = "12" *) (* WR_RD_RATIO = "0" *) 
(* WR_WIDTH_LOG = "7" *) (* XPM_MODULE = "TRUE" *) (* both_stages_valid = "3" *) 
(* invalid = "0" *) (* keep_hierarchy = "soft" *) (* stage1_valid = "2" *) 
(* stage2_valid = "1" *) 
module design_1_axi_video_0_3_xpm_fifo_base
   (sleep,
    rst,
    wr_clk,
    wr_en,
    din,
    full,
    full_n,
    prog_full,
    wr_data_count,
    overflow,
    wr_rst_busy,
    almost_full,
    wr_ack,
    rd_clk,
    rd_en,
    dout,
    empty,
    prog_empty,
    rd_data_count,
    underflow,
    rd_rst_busy,
    almost_empty,
    data_valid,
    injectsbiterr,
    injectdbiterr,
    sbiterr,
    dbiterr);
  input sleep;
  input rst;
  input wr_clk;
  input wr_en;
  input [90:0]din;
  output full;
  output full_n;
  output prog_full;
  output [12:0]wr_data_count;
  output overflow;
  output wr_rst_busy;
  output almost_full;
  output wr_ack;
  input rd_clk;
  input rd_en;
  output [90:0]dout;
  output empty;
  output prog_empty;
  output [31:0]rd_data_count;
  output underflow;
  output rd_rst_busy;
  output almost_empty;
  output data_valid;
  input injectsbiterr;
  input injectdbiterr;
  output sbiterr;
  output dbiterr;

  wire \<const0> ;
  wire [1:0]count_value_i;
  wire [1:0]curr_fwft_state;
  wire data_valid;
  wire data_valid_fwft1;
  wire [90:0]din;
  wire [90:0]dout;
  wire full_n;
  wire \gen_cdc_pntr.rpw_gray_reg_dc_n_0 ;
  wire \gen_cdc_pntr.rpw_gray_reg_dc_n_1 ;
  wire \gen_cdc_pntr.rpw_gray_reg_dc_n_10 ;
  wire \gen_cdc_pntr.rpw_gray_reg_dc_n_11 ;
  wire \gen_cdc_pntr.rpw_gray_reg_dc_n_12 ;
  wire \gen_cdc_pntr.rpw_gray_reg_dc_n_2 ;
  wire \gen_cdc_pntr.rpw_gray_reg_dc_n_3 ;
  wire \gen_cdc_pntr.rpw_gray_reg_dc_n_4 ;
  wire \gen_cdc_pntr.rpw_gray_reg_dc_n_5 ;
  wire \gen_cdc_pntr.rpw_gray_reg_dc_n_6 ;
  wire \gen_cdc_pntr.rpw_gray_reg_dc_n_7 ;
  wire \gen_cdc_pntr.rpw_gray_reg_dc_n_8 ;
  wire \gen_cdc_pntr.rpw_gray_reg_dc_n_9 ;
  wire \gen_cdc_pntr.rpw_gray_reg_n_0 ;
  wire \gen_cdc_pntr.rpw_gray_reg_n_1 ;
  wire \gen_fwft.count_rst ;
  wire \gen_fwft.empty_fwft_i_reg_n_0 ;
  wire \gen_fwft.gdvld_fwft.data_valid_fwft_i_1_n_0 ;
  wire \gen_fwft.ram_regout_en ;
  wire \gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg_n_0 ;
  wire [12:0]\gwdc.diff_wr_rd_pntr1_out ;
  wire [1:0]next_fwft_state__0;
  wire ram_empty_i;
  wire ram_empty_i0;
  wire ram_wr_en_i;
  wire rd_clk;
  wire rd_en;
  wire [11:0]rd_pntr_ext;
  wire [11:0]rd_pntr_wr_cdc;
  wire [12:0]rd_pntr_wr_cdc_dc;
  wire rdp_inst_n_12;
  wire rdp_inst_n_13;
  wire rdp_inst_n_14;
  wire rdp_inst_n_15;
  wire rdp_inst_n_16;
  wire rdp_inst_n_17;
  wire rdp_inst_n_18;
  wire rdp_inst_n_19;
  wire rdp_inst_n_20;
  wire rdp_inst_n_21;
  wire rdp_inst_n_22;
  wire rdp_inst_n_23;
  wire rdp_inst_n_24;
  wire rdpp1_inst_n_0;
  wire rdpp1_inst_n_1;
  wire rdpp1_inst_n_10;
  wire rdpp1_inst_n_11;
  wire rdpp1_inst_n_2;
  wire rdpp1_inst_n_3;
  wire rdpp1_inst_n_4;
  wire rdpp1_inst_n_5;
  wire rdpp1_inst_n_6;
  wire rdpp1_inst_n_7;
  wire rdpp1_inst_n_8;
  wire rdpp1_inst_n_9;
  wire rst;
  wire rst_d1;
  wire sleep;
  wire [1:1]src_in_bin00_out;
  wire wr_clk;
  wire [12:0]wr_data_count;
  wire wr_en;
  wire [12:0]wr_pntr_ext;
  wire [11:0]wr_pntr_rd_cdc;
  wire wrpp1_inst_n_0;
  wire wrpp1_inst_n_1;
  wire wrpp1_inst_n_10;
  wire wrpp1_inst_n_11;
  wire wrpp1_inst_n_2;
  wire wrpp1_inst_n_3;
  wire wrpp1_inst_n_4;
  wire wrpp1_inst_n_5;
  wire wrpp1_inst_n_6;
  wire wrpp1_inst_n_7;
  wire wrpp1_inst_n_8;
  wire wrpp1_inst_n_9;
  wire wrpp2_inst_n_0;
  wire wrpp2_inst_n_1;
  wire wrpp2_inst_n_10;
  wire wrpp2_inst_n_11;
  wire wrpp2_inst_n_2;
  wire wrpp2_inst_n_3;
  wire wrpp2_inst_n_4;
  wire wrpp2_inst_n_5;
  wire wrpp2_inst_n_6;
  wire wrpp2_inst_n_7;
  wire wrpp2_inst_n_8;
  wire wrpp2_inst_n_9;
  wire wrst_busy;
  wire xpm_fifo_rst_inst_n_0;
  wire [12:0]\NLW_gen_cdc_pntr.wr_pntr_cdc_dc_inst_dest_out_bin_UNCONNECTED ;
  wire \NLW_gen_sdpram.xpm_memory_base_inst_dbiterra_UNCONNECTED ;
  wire \NLW_gen_sdpram.xpm_memory_base_inst_dbiterrb_UNCONNECTED ;
  wire \NLW_gen_sdpram.xpm_memory_base_inst_sbiterra_UNCONNECTED ;
  wire \NLW_gen_sdpram.xpm_memory_base_inst_sbiterrb_UNCONNECTED ;
  wire [90:0]\NLW_gen_sdpram.xpm_memory_base_inst_douta_UNCONNECTED ;

  assign almost_empty = \<const0> ;
  assign almost_full = \<const0> ;
  assign dbiterr = \<const0> ;
  assign empty = \<const0> ;
  assign full = \<const0> ;
  assign overflow = \<const0> ;
  assign prog_empty = \<const0> ;
  assign prog_full = \<const0> ;
  assign rd_data_count[31] = \<const0> ;
  assign rd_data_count[30] = \<const0> ;
  assign rd_data_count[29] = \<const0> ;
  assign rd_data_count[28] = \<const0> ;
  assign rd_data_count[27] = \<const0> ;
  assign rd_data_count[26] = \<const0> ;
  assign rd_data_count[25] = \<const0> ;
  assign rd_data_count[24] = \<const0> ;
  assign rd_data_count[23] = \<const0> ;
  assign rd_data_count[22] = \<const0> ;
  assign rd_data_count[21] = \<const0> ;
  assign rd_data_count[20] = \<const0> ;
  assign rd_data_count[19] = \<const0> ;
  assign rd_data_count[18] = \<const0> ;
  assign rd_data_count[17] = \<const0> ;
  assign rd_data_count[16] = \<const0> ;
  assign rd_data_count[15] = \<const0> ;
  assign rd_data_count[14] = \<const0> ;
  assign rd_data_count[13] = \<const0> ;
  assign rd_data_count[12] = \<const0> ;
  assign rd_data_count[11] = \<const0> ;
  assign rd_data_count[10] = \<const0> ;
  assign rd_data_count[9] = \<const0> ;
  assign rd_data_count[8] = \<const0> ;
  assign rd_data_count[7] = \<const0> ;
  assign rd_data_count[6] = \<const0> ;
  assign rd_data_count[5] = \<const0> ;
  assign rd_data_count[4] = \<const0> ;
  assign rd_data_count[3] = \<const0> ;
  assign rd_data_count[2] = \<const0> ;
  assign rd_data_count[1] = \<const0> ;
  assign rd_data_count[0] = \<const0> ;
  assign rd_rst_busy = \<const0> ;
  assign sbiterr = \<const0> ;
  assign underflow = \<const0> ;
  assign wr_ack = \<const0> ;
  assign wr_rst_busy = \<const0> ;
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT4 #(
    .INIT(16'h6A85)) 
    \FSM_sequential_gen_fwft.curr_fwft_state[0]_i_1 
       (.I0(curr_fwft_state[0]),
        .I1(rd_en),
        .I2(curr_fwft_state[1]),
        .I3(ram_empty_i),
        .O(next_fwft_state__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT4 #(
    .INIT(16'h3FF0)) 
    \FSM_sequential_gen_fwft.curr_fwft_state[1]_i_1 
       (.I0(ram_empty_i),
        .I1(rd_en),
        .I2(curr_fwft_state[1]),
        .I3(curr_fwft_state[0]),
        .O(next_fwft_state__0[1]));
  (* FSM_ENCODED_STATES = "invalid:00,stage1_valid:01,both_stages_valid:10,stage2_valid:11" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_gen_fwft.curr_fwft_state_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(next_fwft_state__0[0]),
        .Q(curr_fwft_state[0]),
        .R(xpm_fifo_rst_inst_n_0));
  (* FSM_ENCODED_STATES = "invalid:00,stage1_valid:01,both_stages_valid:10,stage2_valid:11" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_gen_fwft.curr_fwft_state_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(next_fwft_state__0[1]),
        .Q(curr_fwft_state[1]),
        .R(xpm_fifo_rst_inst_n_0));
  GND GND
       (.G(\<const0> ));
  (* DEST_SYNC_FF = "2" *) 
  (* INIT_SYNC_FF = "1" *) 
  (* REG_OUTPUT = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* WIDTH = "13" *) 
  (* XPM_CDC = "GRAY" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_1_axi_video_0_3_xpm_cdc_gray__parameterized1 \gen_cdc_pntr.rd_pntr_cdc_dc_inst 
       (.dest_clk(wr_clk),
        .dest_out_bin(rd_pntr_wr_cdc_dc),
        .src_clk(rd_clk),
        .src_in_bin({rdp_inst_n_13,rdp_inst_n_14,rdp_inst_n_15,rdp_inst_n_16,rdp_inst_n_17,rdp_inst_n_18,rdp_inst_n_19,rdp_inst_n_20,rdp_inst_n_21,rdp_inst_n_22,rdp_inst_n_23,src_in_bin00_out,rdp_inst_n_24}));
  (* DEST_SYNC_FF = "2" *) 
  (* INIT_SYNC_FF = "1" *) 
  (* REG_OUTPUT = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* WIDTH = "12" *) 
  (* XPM_CDC = "GRAY" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_1_axi_video_0_3_xpm_cdc_gray \gen_cdc_pntr.rd_pntr_cdc_inst 
       (.dest_clk(wr_clk),
        .dest_out_bin(rd_pntr_wr_cdc),
        .src_clk(rd_clk),
        .src_in_bin(rd_pntr_ext));
  design_1_axi_video_0_3_xpm_fifo_reg_vec \gen_cdc_pntr.rpw_gray_reg 
       (.D(rd_pntr_wr_cdc),
        .Q({wrpp1_inst_n_0,wrpp1_inst_n_1,wrpp1_inst_n_2,wrpp1_inst_n_3,wrpp1_inst_n_4,wrpp1_inst_n_5,wrpp1_inst_n_6,wrpp1_inst_n_7,wrpp1_inst_n_8,wrpp1_inst_n_9,wrpp1_inst_n_10,wrpp1_inst_n_11}),
        .\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_3_0 ({wrpp2_inst_n_0,wrpp2_inst_n_1,wrpp2_inst_n_2,wrpp2_inst_n_3,wrpp2_inst_n_4,wrpp2_inst_n_5,wrpp2_inst_n_6,wrpp2_inst_n_7,wrpp2_inst_n_8,wrpp2_inst_n_9,wrpp2_inst_n_10,wrpp2_inst_n_11}),
        .\gen_rst_ic.wr_rst_busy_ic_reg (\gen_cdc_pntr.rpw_gray_reg_n_0 ),
        .\gen_rst_ic.wr_rst_busy_ic_reg_0 (\gen_cdc_pntr.rpw_gray_reg_n_1 ),
        .ram_wr_en_i(ram_wr_en_i),
        .rst(rst),
        .rst_d1(rst_d1),
        .wr_clk(wr_clk),
        .wrst_busy(wrst_busy));
  design_1_axi_video_0_3_xpm_fifo_reg_vec__parameterized0 \gen_cdc_pntr.rpw_gray_reg_dc 
       (.D(rd_pntr_wr_cdc_dc),
        .Q({\gen_cdc_pntr.rpw_gray_reg_dc_n_0 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_1 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_2 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_3 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_4 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_5 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_6 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_7 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_8 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_9 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_10 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_11 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_12 }),
        .wr_clk(wr_clk),
        .wrst_busy(wrst_busy));
  design_1_axi_video_0_3_xpm_fifo_reg_vec_0 \gen_cdc_pntr.wpr_gray_reg 
       (.D(wr_pntr_rd_cdc),
        .Q(rd_pntr_ext),
        .SR(xpm_fifo_rst_inst_n_0),
        .\gen_pf_ic_rc.ram_empty_i_i_2_0 ({rdpp1_inst_n_0,rdpp1_inst_n_1,rdpp1_inst_n_2,rdpp1_inst_n_3,rdpp1_inst_n_4,rdpp1_inst_n_5,rdpp1_inst_n_6,rdpp1_inst_n_7,rdpp1_inst_n_8,rdpp1_inst_n_9,rdpp1_inst_n_10,rdpp1_inst_n_11}),
        .\gen_pf_ic_rc.ram_empty_i_reg (rdp_inst_n_12),
        .ram_empty_i0(ram_empty_i0),
        .rd_clk(rd_clk));
  (* DEST_SYNC_FF = "4" *) 
  (* INIT_SYNC_FF = "1" *) 
  (* REG_OUTPUT = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* WIDTH = "13" *) 
  (* XPM_CDC = "GRAY" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_1_axi_video_0_3_xpm_cdc_gray__parameterized0 \gen_cdc_pntr.wr_pntr_cdc_dc_inst 
       (.dest_clk(rd_clk),
        .dest_out_bin(\NLW_gen_cdc_pntr.wr_pntr_cdc_dc_inst_dest_out_bin_UNCONNECTED [12:0]),
        .src_clk(wr_clk),
        .src_in_bin(wr_pntr_ext));
  (* DEST_SYNC_FF = "2" *) 
  (* INIT_SYNC_FF = "1" *) 
  (* REG_OUTPUT = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* WIDTH = "12" *) 
  (* XPM_CDC = "GRAY" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_1_axi_video_0_3_xpm_cdc_gray__2 \gen_cdc_pntr.wr_pntr_cdc_inst 
       (.dest_clk(rd_clk),
        .dest_out_bin(wr_pntr_rd_cdc),
        .src_clk(wr_clk),
        .src_in_bin(wr_pntr_ext[11:0]));
  LUT4 #(
    .INIT(16'hF380)) 
    \gen_fwft.empty_fwft_i_i_1 
       (.I0(rd_en),
        .I1(curr_fwft_state[0]),
        .I2(curr_fwft_state[1]),
        .I3(\gen_fwft.empty_fwft_i_reg_n_0 ),
        .O(data_valid_fwft1));
  FDSE #(
    .INIT(1'b1)) 
    \gen_fwft.empty_fwft_i_reg 
       (.C(rd_clk),
        .CE(1'b1),
        .D(data_valid_fwft1),
        .Q(\gen_fwft.empty_fwft_i_reg_n_0 ),
        .S(xpm_fifo_rst_inst_n_0));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT4 #(
    .INIT(16'h3575)) 
    \gen_fwft.gdvld_fwft.data_valid_fwft_i_1 
       (.I0(\gen_fwft.empty_fwft_i_reg_n_0 ),
        .I1(curr_fwft_state[1]),
        .I2(curr_fwft_state[0]),
        .I3(rd_en),
        .O(\gen_fwft.gdvld_fwft.data_valid_fwft_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_fwft.gdvld_fwft.data_valid_fwft_reg 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\gen_fwft.gdvld_fwft.data_valid_fwft_i_1_n_0 ),
        .Q(data_valid),
        .R(xpm_fifo_rst_inst_n_0));
  design_1_axi_video_0_3_xpm_counter_updn \gen_fwft.rdpp1_inst 
       (.Q(count_value_i),
        .SR(\gen_fwft.count_rst ),
        .\count_value_i_reg[0]_0 (curr_fwft_state),
        .ram_empty_i(ram_empty_i),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .\src_gray_ff_reg[1] (rd_pntr_ext[1:0]),
        .src_in_bin(src_in_bin00_out));
  FDSE #(
    .INIT(1'b1)) 
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gen_cdc_pntr.rpw_gray_reg_n_1 ),
        .Q(\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg_n_0 ),
        .S(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_n_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gen_cdc_pntr.rpw_gray_reg_n_0 ),
        .Q(full_n),
        .R(wrst_busy));
  FDSE #(
    .INIT(1'b1)) 
    \gen_pf_ic_rc.ram_empty_i_reg 
       (.C(rd_clk),
        .CE(1'b1),
        .D(ram_empty_i0),
        .Q(ram_empty_i),
        .S(xpm_fifo_rst_inst_n_0));
  (* ADDR_WIDTH_A = "12" *) 
  (* ADDR_WIDTH_B = "12" *) 
  (* AUTO_SLEEP_TIME = "0" *) 
  (* BYTE_WRITE_WIDTH_A = "91" *) 
  (* BYTE_WRITE_WIDTH_B = "91" *) 
  (* CASCADE_HEIGHT = "0" *) 
  (* CLOCKING_MODE = "1" *) 
  (* ECC_BIT_RANGE = "[7:0]" *) 
  (* ECC_MODE = "0" *) 
  (* ECC_TYPE = "NONE" *) 
  (* IGNORE_INIT_SYNTH = "0" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* MAX_NUM_CHAR = "0" *) 
  (* MEMORY_INIT_FILE = "none" *) 
  (* MEMORY_INIT_PARAM = "" *) 
  (* MEMORY_OPTIMIZATION = "true" *) 
  (* MEMORY_PRIMITIVE = "0" *) 
  (* MEMORY_SIZE = "372736" *) 
  (* MEMORY_TYPE = "1" *) 
  (* MESSAGE_CONTROL = "0" *) 
  (* NUM_CHAR_LOC = "0" *) 
  (* P_ECC_MODE = "no_ecc" *) 
  (* P_ENABLE_BYTE_WRITE_A = "0" *) 
  (* P_ENABLE_BYTE_WRITE_B = "0" *) 
  (* P_MAX_DEPTH_DATA = "4096" *) 
  (* P_MEMORY_OPT = "yes" *) 
  (* P_MEMORY_PRIMITIVE = "auto" *) 
  (* P_MIN_WIDTH_DATA = "91" *) 
  (* P_MIN_WIDTH_DATA_A = "91" *) 
  (* P_MIN_WIDTH_DATA_B = "91" *) 
  (* P_MIN_WIDTH_DATA_ECC = "91" *) 
  (* P_MIN_WIDTH_DATA_LDW = "4" *) 
  (* P_MIN_WIDTH_DATA_SHFT = "91" *) 
  (* P_NUM_COLS_WRITE_A = "1" *) 
  (* P_NUM_COLS_WRITE_B = "1" *) 
  (* P_NUM_ROWS_READ_A = "1" *) 
  (* P_NUM_ROWS_READ_B = "1" *) 
  (* P_NUM_ROWS_WRITE_A = "1" *) 
  (* P_NUM_ROWS_WRITE_B = "1" *) 
  (* P_SDP_WRITE_MODE = "yes" *) 
  (* P_WIDTH_ADDR_LSB_READ_A = "0" *) 
  (* P_WIDTH_ADDR_LSB_READ_B = "0" *) 
  (* P_WIDTH_ADDR_LSB_WRITE_A = "0" *) 
  (* P_WIDTH_ADDR_LSB_WRITE_B = "0" *) 
  (* P_WIDTH_ADDR_READ_A = "12" *) 
  (* P_WIDTH_ADDR_READ_B = "12" *) 
  (* P_WIDTH_ADDR_WRITE_A = "12" *) 
  (* P_WIDTH_ADDR_WRITE_B = "12" *) 
  (* P_WIDTH_COL_WRITE_A = "91" *) 
  (* P_WIDTH_COL_WRITE_B = "91" *) 
  (* RAM_DECOMP = "auto" *) 
  (* READ_DATA_WIDTH_A = "91" *) 
  (* READ_DATA_WIDTH_B = "91" *) 
  (* READ_LATENCY_A = "2" *) 
  (* READ_LATENCY_B = "2" *) 
  (* READ_RESET_VALUE_A = "0" *) 
  (* READ_RESET_VALUE_B = "" *) 
  (* RST_MODE_A = "SYNC" *) 
  (* RST_MODE_B = "SYNC" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* USE_EMBEDDED_CONSTRAINT = "0" *) 
  (* USE_MEM_INIT = "0" *) 
  (* USE_MEM_INIT_MMI = "0" *) 
  (* VERSION = "0" *) 
  (* WAKEUP_TIME = "0" *) 
  (* WRITE_DATA_WIDTH_A = "91" *) 
  (* WRITE_DATA_WIDTH_B = "91" *) 
  (* WRITE_MODE_A = "2" *) 
  (* WRITE_MODE_B = "2" *) 
  (* WRITE_PROTECT = "1" *) 
  (* XPM_MODULE = "TRUE" *) 
  (* rsta_loop_iter = "92" *) 
  (* rstb_loop_iter = "92" *) 
  design_1_axi_video_0_3_xpm_memory_base \gen_sdpram.xpm_memory_base_inst 
       (.addra(wr_pntr_ext[11:0]),
        .addrb(rd_pntr_ext),
        .clka(1'b0),
        .clkb(rd_clk),
        .dbiterra(\NLW_gen_sdpram.xpm_memory_base_inst_dbiterra_UNCONNECTED ),
        .dbiterrb(\NLW_gen_sdpram.xpm_memory_base_inst_dbiterrb_UNCONNECTED ),
        .dina(din),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(\NLW_gen_sdpram.xpm_memory_base_inst_douta_UNCONNECTED [90:0]),
        .doutb(dout),
        .ena(1'b0),
        .enb(rdp_inst_n_12),
        .injectdbiterra(1'b0),
        .injectdbiterrb(1'b0),
        .injectsbiterra(1'b0),
        .injectsbiterrb(1'b0),
        .regcea(1'b0),
        .regceb(\gen_fwft.ram_regout_en ),
        .rsta(1'b0),
        .rstb(xpm_fifo_rst_inst_n_0),
        .sbiterra(\NLW_gen_sdpram.xpm_memory_base_inst_sbiterra_UNCONNECTED ),
        .sbiterrb(\NLW_gen_sdpram.xpm_memory_base_inst_sbiterrb_UNCONNECTED ),
        .sleep(sleep),
        .wea(ram_wr_en_i),
        .web(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'h62)) 
    \gen_sdpram.xpm_memory_base_inst_i_3 
       (.I0(curr_fwft_state[0]),
        .I1(curr_fwft_state[1]),
        .I2(rd_en),
        .O(\gen_fwft.ram_regout_en ));
  FDRE \gwdc.wr_data_count_i_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gwdc.diff_wr_rd_pntr1_out [0]),
        .Q(wr_data_count[0]),
        .R(wrst_busy));
  FDRE \gwdc.wr_data_count_i_reg[10] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gwdc.diff_wr_rd_pntr1_out [10]),
        .Q(wr_data_count[10]),
        .R(wrst_busy));
  FDRE \gwdc.wr_data_count_i_reg[11] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gwdc.diff_wr_rd_pntr1_out [11]),
        .Q(wr_data_count[11]),
        .R(wrst_busy));
  FDRE \gwdc.wr_data_count_i_reg[12] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gwdc.diff_wr_rd_pntr1_out [12]),
        .Q(wr_data_count[12]),
        .R(wrst_busy));
  FDRE \gwdc.wr_data_count_i_reg[1] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gwdc.diff_wr_rd_pntr1_out [1]),
        .Q(wr_data_count[1]),
        .R(wrst_busy));
  FDRE \gwdc.wr_data_count_i_reg[2] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gwdc.diff_wr_rd_pntr1_out [2]),
        .Q(wr_data_count[2]),
        .R(wrst_busy));
  FDRE \gwdc.wr_data_count_i_reg[3] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gwdc.diff_wr_rd_pntr1_out [3]),
        .Q(wr_data_count[3]),
        .R(wrst_busy));
  FDRE \gwdc.wr_data_count_i_reg[4] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gwdc.diff_wr_rd_pntr1_out [4]),
        .Q(wr_data_count[4]),
        .R(wrst_busy));
  FDRE \gwdc.wr_data_count_i_reg[5] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gwdc.diff_wr_rd_pntr1_out [5]),
        .Q(wr_data_count[5]),
        .R(wrst_busy));
  FDRE \gwdc.wr_data_count_i_reg[6] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gwdc.diff_wr_rd_pntr1_out [6]),
        .Q(wr_data_count[6]),
        .R(wrst_busy));
  FDRE \gwdc.wr_data_count_i_reg[7] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gwdc.diff_wr_rd_pntr1_out [7]),
        .Q(wr_data_count[7]),
        .R(wrst_busy));
  FDRE \gwdc.wr_data_count_i_reg[8] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gwdc.diff_wr_rd_pntr1_out [8]),
        .Q(wr_data_count[8]),
        .R(wrst_busy));
  FDRE \gwdc.wr_data_count_i_reg[9] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gwdc.diff_wr_rd_pntr1_out [9]),
        .Q(wr_data_count[9]),
        .R(wrst_busy));
  design_1_axi_video_0_3_xpm_counter_updn__parameterized0 rdp_inst
       (.\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] (rdp_inst_n_12),
        .Q(rd_pntr_ext),
        .SR(xpm_fifo_rst_inst_n_0),
        .\count_value_i_reg[0]_0 (curr_fwft_state),
        .ram_empty_i(ram_empty_i),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .\src_gray_ff_reg[2] (count_value_i),
        .src_in_bin({rdp_inst_n_13,rdp_inst_n_14,rdp_inst_n_15,rdp_inst_n_16,rdp_inst_n_17,rdp_inst_n_18,rdp_inst_n_19,rdp_inst_n_20,rdp_inst_n_21,rdp_inst_n_22,rdp_inst_n_23,rdp_inst_n_24}));
  design_1_axi_video_0_3_xpm_counter_updn__parameterized1 rdpp1_inst
       (.Q({rdpp1_inst_n_0,rdpp1_inst_n_1,rdpp1_inst_n_2,rdpp1_inst_n_3,rdpp1_inst_n_4,rdpp1_inst_n_5,rdpp1_inst_n_6,rdpp1_inst_n_7,rdpp1_inst_n_8,rdpp1_inst_n_9,rdpp1_inst_n_10,rdpp1_inst_n_11}),
        .SR(xpm_fifo_rst_inst_n_0),
        .\count_value_i_reg[0]_0 (rdp_inst_n_12),
        .\count_value_i_reg[1]_0 (curr_fwft_state),
        .ram_empty_i(ram_empty_i),
        .rd_clk(rd_clk),
        .rd_en(rd_en));
  design_1_axi_video_0_3_xpm_fifo_reg_bit_1 rst_d1_inst
       (.rst_d1(rst_d1),
        .wr_clk(wr_clk),
        .wrst_busy(wrst_busy));
  design_1_axi_video_0_3_xpm_counter_updn__parameterized0_2 wrp_inst
       (.D(\gwdc.diff_wr_rd_pntr1_out ),
        .Q(wr_pntr_ext),
        .\count_value_i_reg[6]_0 (\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg_n_0 ),
        .\gwdc.wr_data_count_i_reg[12] ({\gen_cdc_pntr.rpw_gray_reg_dc_n_0 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_1 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_2 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_3 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_4 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_5 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_6 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_7 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_8 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_9 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_10 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_11 ,\gen_cdc_pntr.rpw_gray_reg_dc_n_12 }),
        .ram_wr_en_i(ram_wr_en_i),
        .rst_d1(rst_d1),
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .wrst_busy(wrst_busy));
  design_1_axi_video_0_3_xpm_counter_updn__parameterized1_3 wrpp1_inst
       (.Q({wrpp1_inst_n_0,wrpp1_inst_n_1,wrpp1_inst_n_2,wrpp1_inst_n_3,wrpp1_inst_n_4,wrpp1_inst_n_5,wrpp1_inst_n_6,wrpp1_inst_n_7,wrpp1_inst_n_8,wrpp1_inst_n_9,wrpp1_inst_n_10,wrpp1_inst_n_11}),
        .\count_value_i_reg[6]_0 (\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg_n_0 ),
        .ram_wr_en_i(ram_wr_en_i),
        .rst_d1(rst_d1),
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .wrst_busy(wrst_busy));
  design_1_axi_video_0_3_xpm_counter_updn__parameterized2 wrpp2_inst
       (.Q({wrpp2_inst_n_0,wrpp2_inst_n_1,wrpp2_inst_n_2,wrpp2_inst_n_3,wrpp2_inst_n_4,wrpp2_inst_n_5,wrpp2_inst_n_6,wrpp2_inst_n_7,wrpp2_inst_n_8,wrpp2_inst_n_9,wrpp2_inst_n_10,wrpp2_inst_n_11}),
        .\count_value_i_reg[6]_0 (\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg_n_0 ),
        .ram_wr_en_i(ram_wr_en_i),
        .rst_d1(rst_d1),
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .wrst_busy(wrst_busy));
  design_1_axi_video_0_3_xpm_fifo_rst xpm_fifo_rst_inst
       (.Q(curr_fwft_state),
        .SR(xpm_fifo_rst_inst_n_0),
        .\count_value_i_reg[11] (\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg_n_0 ),
        .\gen_rst_ic.fifo_rd_rst_ic_reg_0 (\gen_fwft.count_rst ),
        .ram_empty_i(ram_empty_i),
        .ram_wr_en_i(ram_wr_en_i),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .rst(rst),
        .rst_d1(rst_d1),
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .wrst_busy(wrst_busy));
endmodule

(* CASCADE_HEIGHT = "0" *) (* CDC_DEST_SYNC_FF = "2" *) (* COMMON_CLOCK = "0" *) 
(* DOUT_RESET_VALUE = "0" *) (* ECC_MODE = "0" *) (* ENABLE_ECC = "0" *) 
(* EN_ADV_FEATURE = "16'b0001000000000000" *) (* EN_AE = "1'b0" *) (* EN_AF = "1'b0" *) 
(* EN_DVLD = "1'b1" *) (* EN_OF = "1'b0" *) (* EN_PE = "1'b0" *) 
(* EN_PF = "1'b0" *) (* EN_RDC = "1'b0" *) (* EN_SIM_ASSERT_ERR = "warning" *) 
(* EN_UF = "1'b0" *) (* EN_WACK = "1'b0" *) (* EN_WDC = "1'b0" *) 
(* FG_EQ_ASYM_DOUT = "1'b0" *) (* FIFO_MEMORY_TYPE = "0" *) (* FIFO_MEM_TYPE = "0" *) 
(* FIFO_READ_DEPTH = "32" *) (* FIFO_READ_LATENCY = "0" *) (* FIFO_SIZE = "1312" *) 
(* FIFO_WRITE_DEPTH = "16" *) (* FULL_RESET_VALUE = "1" *) (* FULL_RST_VAL = "1'b1" *) 
(* ORIG_REF_NAME = "xpm_fifo_base" *) (* PE_THRESH_ADJ = "8" *) (* PE_THRESH_MAX = "27" *) 
(* PE_THRESH_MIN = "5" *) (* PF_THRESH_ADJ = "8" *) (* PF_THRESH_MAX = "11" *) 
(* PF_THRESH_MIN = "7" *) (* PROG_EMPTY_THRESH = "10" *) (* PROG_FULL_THRESH = "10" *) 
(* RD_DATA_COUNT_WIDTH = "1" *) (* RD_DC_WIDTH_EXT = "6" *) (* RD_LATENCY = "2" *) 
(* RD_MODE = "1" *) (* RD_PNTR_WIDTH = "5" *) (* READ_DATA_WIDTH = "41" *) 
(* READ_MODE = "1" *) (* READ_MODE_LL = "1" *) (* RELATED_CLOCKS = "1" *) 
(* REMOVE_WR_RD_PROT_LOGIC = "0" *) (* SIM_ASSERT_CHK = "0" *) (* USE_ADV_FEATURES = "1000" *) 
(* VERSION = "0" *) (* WAKEUP_TIME = "0" *) (* WIDTH_RATIO = "2" *) 
(* WRITE_DATA_WIDTH = "82" *) (* WR_DATA_COUNT_WIDTH = "1" *) (* WR_DC_WIDTH_EXT = "5" *) 
(* WR_DEPTH_LOG = "4" *) (* WR_PNTR_WIDTH = "4" *) (* WR_RD_RATIO = "0" *) 
(* WR_WIDTH_LOG = "7" *) (* XPM_MODULE = "TRUE" *) (* both_stages_valid = "3" *) 
(* invalid = "0" *) (* keep_hierarchy = "soft" *) (* stage1_valid = "2" *) 
(* stage2_valid = "1" *) 
module design_1_axi_video_0_3_xpm_fifo_base__parameterized0
   (sleep,
    rst,
    wr_clk,
    wr_en,
    din,
    full,
    full_n,
    prog_full,
    wr_data_count,
    overflow,
    wr_rst_busy,
    almost_full,
    wr_ack,
    rd_clk,
    rd_en,
    dout,
    empty,
    prog_empty,
    rd_data_count,
    underflow,
    rd_rst_busy,
    almost_empty,
    data_valid,
    injectsbiterr,
    injectdbiterr,
    sbiterr,
    dbiterr);
  input sleep;
  input rst;
  input wr_clk;
  input wr_en;
  input [81:0]din;
  output full;
  output full_n;
  output prog_full;
  output [0:0]wr_data_count;
  output overflow;
  output wr_rst_busy;
  output almost_full;
  output wr_ack;
  input rd_clk;
  input rd_en;
  output [40:0]dout;
  output empty;
  output prog_empty;
  output [0:0]rd_data_count;
  output underflow;
  output rd_rst_busy;
  output almost_empty;
  output data_valid;
  input injectsbiterr;
  input injectdbiterr;
  output sbiterr;
  output dbiterr;

  wire \<const0> ;
  wire clr_full;
  wire [2:0]count_value_i__0;
  wire [1:0]curr_fwft_state;
  wire data_valid;
  wire data_valid_fwft1;
  wire [81:0]din;
  wire [40:0]dout;
  wire empty;
  wire full;
  wire \gen_fwft.gdvld_fwft.data_valid_fwft_i_1_n_0 ;
  wire \gen_fwft.ram_regout_en ;
  wire \gen_pntr_pf_rc.rpw_rc_reg_n_1 ;
  wire [1:0]next_fwft_state__0;
  wire ram_empty_i;
  wire ram_empty_i0;
  wire ram_rd_en_i;
  wire ram_wr_en_i;
  wire rd_clk;
  wire rd_en;
  wire [4:0]rd_pntr_ext;
  wire [3:3]rd_pntr_wr_adj;
  wire rd_rst_busy;
  wire rdp_inst_n_0;
  wire rdp_inst_n_6;
  wire rst;
  wire rst_d1;
  wire sleep;
  wire wr_clk;
  wire wr_en;
  wire [3:0]wr_pntr_ext;
  wire [4:1]wr_pntr_rd_adj;
  wire wr_rst_busy;
  wire wrpp1_inst_n_0;
  wire wrpp2_inst_n_0;
  wire wrpp2_inst_n_1;
  wire wrpp2_inst_n_2;
  wire wrpp2_inst_n_3;
  wire wrst_busy;
  wire \NLW_gen_sdpram.xpm_memory_base_inst_dbiterra_UNCONNECTED ;
  wire \NLW_gen_sdpram.xpm_memory_base_inst_dbiterrb_UNCONNECTED ;
  wire \NLW_gen_sdpram.xpm_memory_base_inst_sbiterra_UNCONNECTED ;
  wire \NLW_gen_sdpram.xpm_memory_base_inst_sbiterrb_UNCONNECTED ;
  wire [81:0]\NLW_gen_sdpram.xpm_memory_base_inst_douta_UNCONNECTED ;

  assign almost_empty = \<const0> ;
  assign almost_full = \<const0> ;
  assign dbiterr = \<const0> ;
  assign full_n = \<const0> ;
  assign overflow = \<const0> ;
  assign prog_empty = \<const0> ;
  assign prog_full = \<const0> ;
  assign rd_data_count[0] = \<const0> ;
  assign sbiterr = \<const0> ;
  assign underflow = \<const0> ;
  assign wr_ack = \<const0> ;
  assign wr_data_count[0] = \<const0> ;
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT4 #(
    .INIT(16'h68A5)) 
    \FSM_sequential_gen_fwft.curr_fwft_state[0]_i_1 
       (.I0(curr_fwft_state[0]),
        .I1(rd_en),
        .I2(ram_empty_i),
        .I3(curr_fwft_state[1]),
        .O(next_fwft_state__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT4 #(
    .INIT(16'h5FAA)) 
    \FSM_sequential_gen_fwft.curr_fwft_state[1]_i_1 
       (.I0(curr_fwft_state[0]),
        .I1(ram_empty_i),
        .I2(rd_en),
        .I3(curr_fwft_state[1]),
        .O(next_fwft_state__0[1]));
  (* FSM_ENCODED_STATES = "invalid:00,stage1_valid:01,both_stages_valid:10,stage2_valid:11" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_gen_fwft.curr_fwft_state_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(next_fwft_state__0[0]),
        .Q(curr_fwft_state[0]),
        .R(rd_rst_busy));
  (* FSM_ENCODED_STATES = "invalid:00,stage1_valid:01,both_stages_valid:10,stage2_valid:11" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_gen_fwft.curr_fwft_state_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(next_fwft_state__0[1]),
        .Q(curr_fwft_state[1]),
        .R(rd_rst_busy));
  GND GND
       (.G(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT4 #(
    .INIT(16'hE0CC)) 
    \gen_fwft.empty_fwft_i_i_1 
       (.I0(rd_en),
        .I1(empty),
        .I2(curr_fwft_state[1]),
        .I3(curr_fwft_state[0]),
        .O(data_valid_fwft1));
  FDSE #(
    .INIT(1'b1)) 
    \gen_fwft.empty_fwft_i_reg 
       (.C(rd_clk),
        .CE(1'b1),
        .D(data_valid_fwft1),
        .Q(empty),
        .S(rd_rst_busy));
  LUT4 #(
    .INIT(16'h15F5)) 
    \gen_fwft.gdvld_fwft.data_valid_fwft_i_1 
       (.I0(empty),
        .I1(rd_en),
        .I2(curr_fwft_state[0]),
        .I3(curr_fwft_state[1]),
        .O(\gen_fwft.gdvld_fwft.data_valid_fwft_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_fwft.gdvld_fwft.data_valid_fwft_reg 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\gen_fwft.gdvld_fwft.data_valid_fwft_i_1_n_0 ),
        .Q(data_valid),
        .R(rd_rst_busy));
  FDSE #(
    .INIT(1'b1)) 
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gen_pntr_pf_rc.rpw_rc_reg_n_1 ),
        .Q(full),
        .S(wrst_busy));
  FDSE #(
    .INIT(1'b1)) 
    \gen_pf_ic_rc.ram_empty_i_reg 
       (.C(rd_clk),
        .CE(1'b1),
        .D(ram_empty_i0),
        .Q(ram_empty_i),
        .S(rd_rst_busy));
  design_1_axi_video_0_3_xpm_fifo_reg_vec__parameterized1 \gen_pntr_pf_rc.rpw_rc_reg 
       (.E(ram_wr_en_i),
        .Q(rd_pntr_wr_adj),
        .clr_full(clr_full),
        .\count_value_i_reg[3] (\gen_pntr_pf_rc.rpw_rc_reg_n_1 ),
        .\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg ({wrpp2_inst_n_1,wrpp2_inst_n_2,wrpp2_inst_n_3}),
        .\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg_0 (count_value_i__0),
        .\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg_1 (wrpp1_inst_n_0),
        .\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg_2 (wrpp2_inst_n_0),
        .\reg_out_i_reg[4]_0 (rd_pntr_ext[4:1]),
        .wr_clk(wr_clk),
        .wrst_busy(wrst_busy));
  design_1_axi_video_0_3_xpm_fifo_reg_vec__parameterized2 \gen_pntr_pf_rc.wpr_rc_reg 
       (.Q(wr_pntr_rd_adj),
        .SR(rd_rst_busy),
        .rd_clk(rd_clk),
        .\reg_out_i_reg[3]_0 (wr_pntr_ext));
  (* ADDR_WIDTH_A = "4" *) 
  (* ADDR_WIDTH_B = "5" *) 
  (* AUTO_SLEEP_TIME = "0" *) 
  (* BYTE_WRITE_WIDTH_A = "82" *) 
  (* BYTE_WRITE_WIDTH_B = "41" *) 
  (* CASCADE_HEIGHT = "0" *) 
  (* CLOCKING_MODE = "1" *) 
  (* ECC_BIT_RANGE = "[7:0]" *) 
  (* ECC_MODE = "0" *) 
  (* ECC_TYPE = "NONE" *) 
  (* IGNORE_INIT_SYNTH = "0" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* MAX_NUM_CHAR = "0" *) 
  (* \MEM.ADDRESS_SPACE  *) 
  (* \MEM.ADDRESS_SPACE_BEGIN  = "0" *) 
  (* \MEM.ADDRESS_SPACE_DATA_LSB  = "0" *) 
  (* \MEM.ADDRESS_SPACE_DATA_MSB  = "71" *) 
  (* \MEM.ADDRESS_SPACE_END  = "31" *) 
  (* \MEM.CORE_MEMORY_WIDTH  = "72" *) 
  (* MEMORY_INIT_FILE = "none" *) 
  (* MEMORY_INIT_PARAM = "" *) 
  (* MEMORY_OPTIMIZATION = "true" *) 
  (* MEMORY_PRIMITIVE = "0" *) 
  (* MEMORY_SIZE = "1312" *) 
  (* MEMORY_TYPE = "1" *) 
  (* MESSAGE_CONTROL = "0" *) 
  (* NUM_CHAR_LOC = "0" *) 
  (* P_ECC_MODE = "no_ecc" *) 
  (* P_ENABLE_BYTE_WRITE_A = "0" *) 
  (* P_ENABLE_BYTE_WRITE_B = "0" *) 
  (* P_MAX_DEPTH_DATA = "32" *) 
  (* P_MEMORY_OPT = "yes" *) 
  (* P_MEMORY_PRIMITIVE = "auto" *) 
  (* P_MIN_WIDTH_DATA = "41" *) 
  (* P_MIN_WIDTH_DATA_A = "82" *) 
  (* P_MIN_WIDTH_DATA_B = "41" *) 
  (* P_MIN_WIDTH_DATA_ECC = "41" *) 
  (* P_MIN_WIDTH_DATA_LDW = "4" *) 
  (* P_MIN_WIDTH_DATA_SHFT = "41" *) 
  (* P_NUM_COLS_WRITE_A = "1" *) 
  (* P_NUM_COLS_WRITE_B = "1" *) 
  (* P_NUM_ROWS_READ_A = "2" *) 
  (* P_NUM_ROWS_READ_B = "1" *) 
  (* P_NUM_ROWS_WRITE_A = "2" *) 
  (* P_NUM_ROWS_WRITE_B = "1" *) 
  (* P_SDP_WRITE_MODE = "yes" *) 
  (* P_WIDTH_ADDR_LSB_READ_A = "1" *) 
  (* P_WIDTH_ADDR_LSB_READ_B = "0" *) 
  (* P_WIDTH_ADDR_LSB_WRITE_A = "1" *) 
  (* P_WIDTH_ADDR_LSB_WRITE_B = "0" *) 
  (* P_WIDTH_ADDR_READ_A = "4" *) 
  (* P_WIDTH_ADDR_READ_B = "5" *) 
  (* P_WIDTH_ADDR_WRITE_A = "4" *) 
  (* P_WIDTH_ADDR_WRITE_B = "5" *) 
  (* P_WIDTH_COL_WRITE_A = "41" *) 
  (* P_WIDTH_COL_WRITE_B = "41" *) 
  (* RAM_DECOMP = "auto" *) 
  (* READ_DATA_WIDTH_A = "82" *) 
  (* READ_DATA_WIDTH_B = "41" *) 
  (* READ_LATENCY_A = "2" *) 
  (* READ_LATENCY_B = "2" *) 
  (* READ_RESET_VALUE_A = "0" *) 
  (* READ_RESET_VALUE_B = "0" *) 
  (* RST_MODE_A = "SYNC" *) 
  (* RST_MODE_B = "SYNC" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* USE_EMBEDDED_CONSTRAINT = "0" *) 
  (* USE_MEM_INIT = "0" *) 
  (* USE_MEM_INIT_MMI = "0" *) 
  (* VERSION = "0" *) 
  (* WAKEUP_TIME = "0" *) 
  (* WRITE_DATA_WIDTH_A = "82" *) 
  (* WRITE_DATA_WIDTH_B = "41" *) 
  (* WRITE_MODE_A = "2" *) 
  (* WRITE_MODE_B = "2" *) 
  (* WRITE_PROTECT = "1" *) 
  (* XPM_MODULE = "TRUE" *) 
  (* rsta_loop_iter = "84" *) 
  (* rstb_loop_iter = "44" *) 
  design_1_axi_video_0_3_xpm_memory_base__parameterized0 \gen_sdpram.xpm_memory_base_inst 
       (.addra(wr_pntr_ext),
        .addrb(rd_pntr_ext),
        .clka(wr_clk),
        .clkb(rd_clk),
        .dbiterra(\NLW_gen_sdpram.xpm_memory_base_inst_dbiterra_UNCONNECTED ),
        .dbiterrb(\NLW_gen_sdpram.xpm_memory_base_inst_dbiterrb_UNCONNECTED ),
        .dina(din),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(\NLW_gen_sdpram.xpm_memory_base_inst_douta_UNCONNECTED [81:0]),
        .doutb(dout),
        .ena(ram_wr_en_i),
        .enb(ram_rd_en_i),
        .injectdbiterra(1'b0),
        .injectdbiterrb(1'b0),
        .injectsbiterra(1'b0),
        .injectsbiterrb(1'b0),
        .regcea(1'b0),
        .regceb(\gen_fwft.ram_regout_en ),
        .rsta(1'b0),
        .rstb(rd_rst_busy),
        .sbiterra(\NLW_gen_sdpram.xpm_memory_base_inst_sbiterra_UNCONNECTED ),
        .sbiterrb(\NLW_gen_sdpram.xpm_memory_base_inst_sbiterrb_UNCONNECTED ),
        .sleep(sleep),
        .wea(1'b0),
        .web(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'h2C)) 
    \gen_sdpram.xpm_memory_base_inst_i_3 
       (.I0(rd_en),
        .I1(curr_fwft_state[0]),
        .I2(curr_fwft_state[1]),
        .O(\gen_fwft.ram_regout_en ));
  design_1_axi_video_0_3_xpm_counter_updn__parameterized6 rdp_inst
       (.E(ram_rd_en_i),
        .Q(wr_pntr_rd_adj),
        .SR(rd_rst_busy),
        .\count_value_i_reg[1]_0 (curr_fwft_state),
        .\count_value_i_reg[4]_0 (rd_pntr_ext),
        .\count_value_i_reg[4]_1 (rdp_inst_n_6),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .\reg_out_i_reg[0] (rdp_inst_n_0));
  design_1_axi_video_0_3_xpm_counter_updn__parameterized7 rdpp1_inst
       (.E(ram_rd_en_i),
        .Q(curr_fwft_state),
        .SR(rd_rst_busy),
        .\gen_pf_ic_rc.ram_empty_i_reg (rdp_inst_n_0),
        .\gen_pf_ic_rc.ram_empty_i_reg_0 (rdp_inst_n_6),
        .\gen_pf_ic_rc.ram_empty_i_reg_1 (wr_pntr_rd_adj),
        .ram_empty_i(ram_empty_i),
        .ram_empty_i0(ram_empty_i0),
        .rd_clk(rd_clk),
        .rd_en(rd_en));
  design_1_axi_video_0_3_xpm_fifo_reg_bit rst_d1_inst
       (.clr_full(clr_full),
        .rst(rst),
        .rst_d1(rst_d1),
        .wr_clk(wr_clk),
        .wrst_busy(wrst_busy));
  design_1_axi_video_0_3_xpm_counter_updn__parameterized3 wrp_inst
       (.E(ram_wr_en_i),
        .Q(wr_pntr_ext),
        .wr_clk(wr_clk),
        .wrst_busy(wrst_busy));
  design_1_axi_video_0_3_xpm_counter_updn__parameterized4 wrpp1_inst
       (.E(ram_wr_en_i),
        .Q(count_value_i__0),
        .\count_value_i_reg[3]_0 (wrpp1_inst_n_0),
        .\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg (rd_pntr_wr_adj),
        .wr_clk(wr_clk),
        .wrst_busy(wrst_busy));
  design_1_axi_video_0_3_xpm_counter_updn__parameterized5 wrpp2_inst
       (.E(ram_wr_en_i),
        .Q(rd_pntr_wr_adj),
        .\count_value_i_reg[2]_0 ({wrpp2_inst_n_1,wrpp2_inst_n_2,wrpp2_inst_n_3}),
        .\count_value_i_reg[3]_0 (wrpp2_inst_n_0),
        .wr_clk(wr_clk),
        .wrst_busy(wrst_busy));
  design_1_axi_video_0_3_xpm_fifo_rst__xdcDup__1 xpm_fifo_rst_inst
       (.E(ram_wr_en_i),
        .SR(rd_rst_busy),
        .full(full),
        .rd_clk(rd_clk),
        .rst(rst),
        .rst_d1(rst_d1),
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .wr_rst_busy(wr_rst_busy),
        .wrst_busy(wrst_busy));
endmodule

(* ORIG_REF_NAME = "xpm_fifo_reg_bit" *) 
module design_1_axi_video_0_3_xpm_fifo_reg_bit
   (rst_d1,
    clr_full,
    wrst_busy,
    wr_clk,
    rst);
  output rst_d1;
  output clr_full;
  input wrst_busy;
  input wr_clk;
  input rst;

  wire clr_full;
  wire rst;
  wire rst_d1;
  wire wr_clk;
  wire wrst_busy;

  FDRE #(
    .INIT(1'b0)) 
    d_out_int_reg
       (.C(wr_clk),
        .CE(1'b1),
        .D(wrst_busy),
        .Q(rst_d1),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h04)) 
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_i_i_6 
       (.I0(rst),
        .I1(rst_d1),
        .I2(wrst_busy),
        .O(clr_full));
endmodule

(* ORIG_REF_NAME = "xpm_fifo_reg_bit" *) 
module design_1_axi_video_0_3_xpm_fifo_reg_bit_1
   (rst_d1,
    wrst_busy,
    wr_clk);
  output rst_d1;
  input wrst_busy;
  input wr_clk;

  wire rst_d1;
  wire wr_clk;
  wire wrst_busy;

  FDRE #(
    .INIT(1'b0)) 
    d_out_int_reg
       (.C(wr_clk),
        .CE(1'b1),
        .D(wrst_busy),
        .Q(rst_d1),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "xpm_fifo_reg_vec" *) 
module design_1_axi_video_0_3_xpm_fifo_reg_vec
   (\gen_rst_ic.wr_rst_busy_ic_reg ,
    \gen_rst_ic.wr_rst_busy_ic_reg_0 ,
    Q,
    ram_wr_en_i,
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_3_0 ,
    wrst_busy,
    rst_d1,
    rst,
    D,
    wr_clk);
  output \gen_rst_ic.wr_rst_busy_ic_reg ;
  output \gen_rst_ic.wr_rst_busy_ic_reg_0 ;
  input [11:0]Q;
  input ram_wr_en_i;
  input [11:0]\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_3_0 ;
  input wrst_busy;
  input rst_d1;
  input rst;
  input [11:0]D;
  input wr_clk;

  wire [11:0]D;
  wire [11:0]Q;
  wire \gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_10_n_0 ;
  wire \gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_11_n_0 ;
  wire [11:0]\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_3_0 ;
  wire \gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_4_n_0 ;
  wire \gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_5_n_0 ;
  wire \gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_6_n_0 ;
  wire \gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_7_n_0 ;
  wire \gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_8_n_0 ;
  wire \gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_9_n_0 ;
  wire \gen_rst_ic.wr_rst_busy_ic_reg ;
  wire \gen_rst_ic.wr_rst_busy_ic_reg_0 ;
  wire going_full;
  wire leaving_full;
  wire ram_wr_en_i;
  wire \reg_out_i_reg_n_0_[0] ;
  wire \reg_out_i_reg_n_0_[10] ;
  wire \reg_out_i_reg_n_0_[11] ;
  wire \reg_out_i_reg_n_0_[1] ;
  wire \reg_out_i_reg_n_0_[2] ;
  wire \reg_out_i_reg_n_0_[3] ;
  wire \reg_out_i_reg_n_0_[4] ;
  wire \reg_out_i_reg_n_0_[5] ;
  wire \reg_out_i_reg_n_0_[6] ;
  wire \reg_out_i_reg_n_0_[7] ;
  wire \reg_out_i_reg_n_0_[8] ;
  wire \reg_out_i_reg_n_0_[9] ;
  wire rst;
  wire rst_d1;
  wire wr_clk;
  wire wrst_busy;

  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT5 #(
    .INIT(32'hFBFBFB00)) 
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_i_i_1 
       (.I0(wrst_busy),
        .I1(rst_d1),
        .I2(rst),
        .I3(leaving_full),
        .I4(going_full),
        .O(\gen_rst_ic.wr_rst_busy_ic_reg_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT5 #(
    .INIT(32'h040404FF)) 
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_1 
       (.I0(wrst_busy),
        .I1(rst_d1),
        .I2(rst),
        .I3(leaving_full),
        .I4(going_full),
        .O(\gen_rst_ic.wr_rst_busy_ic_reg ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_10 
       (.I0(\reg_out_i_reg_n_0_[0] ),
        .I1(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_3_0 [0]),
        .I2(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_3_0 [2]),
        .I3(\reg_out_i_reg_n_0_[2] ),
        .I4(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_3_0 [1]),
        .I5(\reg_out_i_reg_n_0_[1] ),
        .O(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_11 
       (.I0(\reg_out_i_reg_n_0_[3] ),
        .I1(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_3_0 [3]),
        .I2(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_3_0 [5]),
        .I3(\reg_out_i_reg_n_0_[5] ),
        .I4(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_3_0 [4]),
        .I5(\reg_out_i_reg_n_0_[4] ),
        .O(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_2 
       (.I0(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_4_n_0 ),
        .I1(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_5_n_0 ),
        .I2(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_6_n_0 ),
        .I3(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_7_n_0 ),
        .O(leaving_full));
  LUT5 #(
    .INIT(32'h80000000)) 
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_3 
       (.I0(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_8_n_0 ),
        .I1(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_9_n_0 ),
        .I2(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_10_n_0 ),
        .I3(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_11_n_0 ),
        .I4(ram_wr_en_i),
        .O(going_full));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_4 
       (.I0(\reg_out_i_reg_n_0_[3] ),
        .I1(Q[3]),
        .I2(Q[5]),
        .I3(\reg_out_i_reg_n_0_[5] ),
        .I4(Q[4]),
        .I5(\reg_out_i_reg_n_0_[4] ),
        .O(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_5 
       (.I0(\reg_out_i_reg_n_0_[0] ),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(\reg_out_i_reg_n_0_[2] ),
        .I4(Q[1]),
        .I5(\reg_out_i_reg_n_0_[1] ),
        .O(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_6 
       (.I0(\reg_out_i_reg_n_0_[9] ),
        .I1(Q[9]),
        .I2(Q[11]),
        .I3(\reg_out_i_reg_n_0_[11] ),
        .I4(Q[10]),
        .I5(\reg_out_i_reg_n_0_[10] ),
        .O(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_7 
       (.I0(\reg_out_i_reg_n_0_[6] ),
        .I1(Q[6]),
        .I2(Q[8]),
        .I3(\reg_out_i_reg_n_0_[8] ),
        .I4(Q[7]),
        .I5(\reg_out_i_reg_n_0_[7] ),
        .O(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_8 
       (.I0(\reg_out_i_reg_n_0_[6] ),
        .I1(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_3_0 [6]),
        .I2(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_3_0 [8]),
        .I3(\reg_out_i_reg_n_0_[8] ),
        .I4(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_3_0 [7]),
        .I5(\reg_out_i_reg_n_0_[7] ),
        .O(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_9 
       (.I0(\reg_out_i_reg_n_0_[9] ),
        .I1(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_3_0 [9]),
        .I2(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_3_0 [11]),
        .I3(\reg_out_i_reg_n_0_[11] ),
        .I4(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_3_0 [10]),
        .I5(\reg_out_i_reg_n_0_[10] ),
        .O(\gen_pf_ic_rc.gen_full_rst_val.ram_full_n_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[0]),
        .Q(\reg_out_i_reg_n_0_[0] ),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[10] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[10]),
        .Q(\reg_out_i_reg_n_0_[10] ),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[11] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[11]),
        .Q(\reg_out_i_reg_n_0_[11] ),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[1] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[1]),
        .Q(\reg_out_i_reg_n_0_[1] ),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[2] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[2]),
        .Q(\reg_out_i_reg_n_0_[2] ),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[3] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[3]),
        .Q(\reg_out_i_reg_n_0_[3] ),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[4] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[4]),
        .Q(\reg_out_i_reg_n_0_[4] ),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[5] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[5]),
        .Q(\reg_out_i_reg_n_0_[5] ),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[6] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[6]),
        .Q(\reg_out_i_reg_n_0_[6] ),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[7] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[7]),
        .Q(\reg_out_i_reg_n_0_[7] ),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[8] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[8]),
        .Q(\reg_out_i_reg_n_0_[8] ),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[9] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[9]),
        .Q(\reg_out_i_reg_n_0_[9] ),
        .R(wrst_busy));
endmodule

(* ORIG_REF_NAME = "xpm_fifo_reg_vec" *) 
module design_1_axi_video_0_3_xpm_fifo_reg_vec_0
   (ram_empty_i0,
    \gen_pf_ic_rc.ram_empty_i_reg ,
    Q,
    \gen_pf_ic_rc.ram_empty_i_i_2_0 ,
    SR,
    D,
    rd_clk);
  output ram_empty_i0;
  input \gen_pf_ic_rc.ram_empty_i_reg ;
  input [11:0]Q;
  input [11:0]\gen_pf_ic_rc.ram_empty_i_i_2_0 ;
  input [0:0]SR;
  input [11:0]D;
  input rd_clk;

  wire [11:0]D;
  wire [11:0]Q;
  wire [0:0]SR;
  wire \gen_pf_ic_rc.ram_empty_i_i_10_n_0 ;
  wire [11:0]\gen_pf_ic_rc.ram_empty_i_i_2_0 ;
  wire \gen_pf_ic_rc.ram_empty_i_i_3_n_0 ;
  wire \gen_pf_ic_rc.ram_empty_i_i_4_n_0 ;
  wire \gen_pf_ic_rc.ram_empty_i_i_5_n_0 ;
  wire \gen_pf_ic_rc.ram_empty_i_i_6_n_0 ;
  wire \gen_pf_ic_rc.ram_empty_i_i_7_n_0 ;
  wire \gen_pf_ic_rc.ram_empty_i_i_8_n_0 ;
  wire \gen_pf_ic_rc.ram_empty_i_i_9_n_0 ;
  wire \gen_pf_ic_rc.ram_empty_i_reg ;
  wire going_empty;
  wire ram_empty_i0;
  wire rd_clk;
  wire [11:0]reg_out_i;

  LUT5 #(
    .INIT(32'hEAAAAAAA)) 
    \gen_pf_ic_rc.ram_empty_i_i_1 
       (.I0(going_empty),
        .I1(\gen_pf_ic_rc.ram_empty_i_i_3_n_0 ),
        .I2(\gen_pf_ic_rc.ram_empty_i_i_4_n_0 ),
        .I3(\gen_pf_ic_rc.ram_empty_i_i_5_n_0 ),
        .I4(\gen_pf_ic_rc.ram_empty_i_i_6_n_0 ),
        .O(ram_empty_i0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pf_ic_rc.ram_empty_i_i_10 
       (.I0(reg_out_i[3]),
        .I1(\gen_pf_ic_rc.ram_empty_i_i_2_0 [3]),
        .I2(\gen_pf_ic_rc.ram_empty_i_i_2_0 [5]),
        .I3(reg_out_i[5]),
        .I4(\gen_pf_ic_rc.ram_empty_i_i_2_0 [4]),
        .I5(reg_out_i[4]),
        .O(\gen_pf_ic_rc.ram_empty_i_i_10_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \gen_pf_ic_rc.ram_empty_i_i_2 
       (.I0(\gen_pf_ic_rc.ram_empty_i_i_7_n_0 ),
        .I1(\gen_pf_ic_rc.ram_empty_i_i_8_n_0 ),
        .I2(\gen_pf_ic_rc.ram_empty_i_i_9_n_0 ),
        .I3(\gen_pf_ic_rc.ram_empty_i_i_10_n_0 ),
        .I4(\gen_pf_ic_rc.ram_empty_i_reg ),
        .O(going_empty));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pf_ic_rc.ram_empty_i_i_3 
       (.I0(reg_out_i[6]),
        .I1(Q[6]),
        .I2(Q[8]),
        .I3(reg_out_i[8]),
        .I4(Q[7]),
        .I5(reg_out_i[7]),
        .O(\gen_pf_ic_rc.ram_empty_i_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pf_ic_rc.ram_empty_i_i_4 
       (.I0(reg_out_i[9]),
        .I1(Q[9]),
        .I2(Q[11]),
        .I3(reg_out_i[11]),
        .I4(Q[10]),
        .I5(reg_out_i[10]),
        .O(\gen_pf_ic_rc.ram_empty_i_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pf_ic_rc.ram_empty_i_i_5 
       (.I0(reg_out_i[0]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(reg_out_i[2]),
        .I4(Q[1]),
        .I5(reg_out_i[1]),
        .O(\gen_pf_ic_rc.ram_empty_i_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pf_ic_rc.ram_empty_i_i_6 
       (.I0(reg_out_i[3]),
        .I1(Q[3]),
        .I2(Q[5]),
        .I3(reg_out_i[5]),
        .I4(Q[4]),
        .I5(reg_out_i[4]),
        .O(\gen_pf_ic_rc.ram_empty_i_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pf_ic_rc.ram_empty_i_i_7 
       (.I0(reg_out_i[6]),
        .I1(\gen_pf_ic_rc.ram_empty_i_i_2_0 [6]),
        .I2(\gen_pf_ic_rc.ram_empty_i_i_2_0 [8]),
        .I3(reg_out_i[8]),
        .I4(\gen_pf_ic_rc.ram_empty_i_i_2_0 [7]),
        .I5(reg_out_i[7]),
        .O(\gen_pf_ic_rc.ram_empty_i_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pf_ic_rc.ram_empty_i_i_8 
       (.I0(reg_out_i[9]),
        .I1(\gen_pf_ic_rc.ram_empty_i_i_2_0 [9]),
        .I2(\gen_pf_ic_rc.ram_empty_i_i_2_0 [11]),
        .I3(reg_out_i[11]),
        .I4(\gen_pf_ic_rc.ram_empty_i_i_2_0 [10]),
        .I5(reg_out_i[10]),
        .O(\gen_pf_ic_rc.ram_empty_i_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pf_ic_rc.ram_empty_i_i_9 
       (.I0(reg_out_i[0]),
        .I1(\gen_pf_ic_rc.ram_empty_i_i_2_0 [0]),
        .I2(\gen_pf_ic_rc.ram_empty_i_i_2_0 [2]),
        .I3(reg_out_i[2]),
        .I4(\gen_pf_ic_rc.ram_empty_i_i_2_0 [1]),
        .I5(reg_out_i[1]),
        .O(\gen_pf_ic_rc.ram_empty_i_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(D[0]),
        .Q(reg_out_i[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[10] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(D[10]),
        .Q(reg_out_i[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[11] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(D[11]),
        .Q(reg_out_i[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(D[1]),
        .Q(reg_out_i[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[2] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(D[2]),
        .Q(reg_out_i[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[3] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(D[3]),
        .Q(reg_out_i[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[4] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(D[4]),
        .Q(reg_out_i[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[5] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(D[5]),
        .Q(reg_out_i[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[6] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(D[6]),
        .Q(reg_out_i[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[7] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(D[7]),
        .Q(reg_out_i[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[8] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(D[8]),
        .Q(reg_out_i[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[9] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(D[9]),
        .Q(reg_out_i[9]),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "xpm_fifo_reg_vec" *) 
module design_1_axi_video_0_3_xpm_fifo_reg_vec__parameterized0
   (Q,
    wrst_busy,
    D,
    wr_clk);
  output [12:0]Q;
  input wrst_busy;
  input [12:0]D;
  input wr_clk;

  wire [12:0]D;
  wire [12:0]Q;
  wire wr_clk;
  wire wrst_busy;

  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[0]),
        .Q(Q[0]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[10] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[10]),
        .Q(Q[10]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[11] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[11]),
        .Q(Q[11]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[12] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[12]),
        .Q(Q[12]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[1] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[1]),
        .Q(Q[1]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[2] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[2]),
        .Q(Q[2]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[3] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[3]),
        .Q(Q[3]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[4] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[4]),
        .Q(Q[4]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[5] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[5]),
        .Q(Q[5]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[6] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[6]),
        .Q(Q[6]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[7] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[7]),
        .Q(Q[7]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[8] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[8]),
        .Q(Q[8]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[9] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(D[9]),
        .Q(Q[9]),
        .R(wrst_busy));
endmodule

(* ORIG_REF_NAME = "xpm_fifo_reg_vec" *) 
module design_1_axi_video_0_3_xpm_fifo_reg_vec__parameterized1
   (Q,
    \count_value_i_reg[3] ,
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg ,
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg_0 ,
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg_1 ,
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg_2 ,
    E,
    clr_full,
    wrst_busy,
    \reg_out_i_reg[4]_0 ,
    wr_clk);
  output [0:0]Q;
  output \count_value_i_reg[3] ;
  input [2:0]\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg ;
  input [2:0]\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg_0 ;
  input \gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg_1 ;
  input \gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg_2 ;
  input [0:0]E;
  input clr_full;
  input wrst_busy;
  input [3:0]\reg_out_i_reg[4]_0 ;
  input wr_clk;

  wire [0:0]E;
  wire [0:0]Q;
  wire clr_full;
  wire \count_value_i_reg[3] ;
  wire \gen_pf_ic_rc.gen_full_rst_val.ram_full_i_i_3_n_0 ;
  wire \gen_pf_ic_rc.gen_full_rst_val.ram_full_i_i_4_n_0 ;
  wire [2:0]\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg ;
  wire [2:0]\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg_0 ;
  wire \gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg_1 ;
  wire \gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg_2 ;
  wire [2:0]rd_pntr_wr_adj;
  wire [3:0]\reg_out_i_reg[4]_0 ;
  wire wr_clk;
  wire wrst_busy;

  LUT6 #(
    .INIT(64'h00000000F8888888)) 
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_i_i_1 
       (.I0(\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg_1 ),
        .I1(\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_i_3_n_0 ),
        .I2(\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_i_4_n_0 ),
        .I3(\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg_2 ),
        .I4(E),
        .I5(clr_full),
        .O(\count_value_i_reg[3] ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_i_i_3 
       (.I0(rd_pntr_wr_adj[0]),
        .I1(\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg_0 [0]),
        .I2(\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg_0 [2]),
        .I3(rd_pntr_wr_adj[2]),
        .I4(\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg_0 [1]),
        .I5(rd_pntr_wr_adj[1]),
        .O(\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pf_ic_rc.gen_full_rst_val.ram_full_i_i_4 
       (.I0(rd_pntr_wr_adj[0]),
        .I1(\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg [0]),
        .I2(\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg [2]),
        .I3(rd_pntr_wr_adj[2]),
        .I4(\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_reg [1]),
        .I5(rd_pntr_wr_adj[1]),
        .O(\gen_pf_ic_rc.gen_full_rst_val.ram_full_i_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[1] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\reg_out_i_reg[4]_0 [0]),
        .Q(rd_pntr_wr_adj[0]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[2] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\reg_out_i_reg[4]_0 [1]),
        .Q(rd_pntr_wr_adj[1]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[3] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\reg_out_i_reg[4]_0 [2]),
        .Q(rd_pntr_wr_adj[2]),
        .R(wrst_busy));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[4] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\reg_out_i_reg[4]_0 [3]),
        .Q(Q),
        .R(wrst_busy));
endmodule

(* ORIG_REF_NAME = "xpm_fifo_reg_vec" *) 
module design_1_axi_video_0_3_xpm_fifo_reg_vec__parameterized2
   (Q,
    SR,
    \reg_out_i_reg[3]_0 ,
    rd_clk);
  output [3:0]Q;
  input [0:0]SR;
  input [3:0]\reg_out_i_reg[3]_0 ;
  input rd_clk;

  wire [3:0]Q;
  wire [0:0]SR;
  wire rd_clk;
  wire [3:0]\reg_out_i_reg[3]_0 ;

  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\reg_out_i_reg[3]_0 [0]),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\reg_out_i_reg[3]_0 [1]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[2] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\reg_out_i_reg[3]_0 [2]),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \reg_out_i_reg[3] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\reg_out_i_reg[3]_0 [3]),
        .Q(Q[3]),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "xpm_fifo_rst" *) 
module design_1_axi_video_0_3_xpm_fifo_rst
   (SR,
    wrst_busy,
    ram_wr_en_i,
    \gen_rst_ic.fifo_rd_rst_ic_reg_0 ,
    rd_clk,
    wr_clk,
    rst,
    wr_en,
    \count_value_i_reg[11] ,
    rst_d1,
    ram_empty_i,
    Q,
    rd_en);
  output [0:0]SR;
  output wrst_busy;
  output ram_wr_en_i;
  output [0:0]\gen_rst_ic.fifo_rd_rst_ic_reg_0 ;
  input rd_clk;
  input wr_clk;
  input rst;
  input wr_en;
  input \count_value_i_reg[11] ;
  input rst_d1;
  input ram_empty_i;
  input [1:0]Q;
  input rd_en;

  wire \/i__n_0 ;
  wire \FSM_onehot_gen_rst_ic.curr_wrst_state[0]_i_1_n_0 ;
  wire \FSM_onehot_gen_rst_ic.curr_wrst_state[1]_i_1_n_0 ;
  wire \FSM_onehot_gen_rst_ic.curr_wrst_state[1]_i_2_n_0 ;
  wire \FSM_onehot_gen_rst_ic.curr_wrst_state[2]_i_1_n_0 ;
  wire \FSM_onehot_gen_rst_ic.curr_wrst_state[3]_i_1_n_0 ;
  wire \FSM_onehot_gen_rst_ic.curr_wrst_state[4]_i_1_n_0 ;
  wire \FSM_onehot_gen_rst_ic.curr_wrst_state[4]_i_2_n_0 ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[0] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[1] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[2] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[3] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[4] ;
  wire [1:0]Q;
  wire [0:0]SR;
  wire \count_value_i_reg[11] ;
  (* RTL_KEEP = "yes" *) wire [1:0]\gen_rst_ic.curr_rrst_state ;
  wire \gen_rst_ic.fifo_rd_rst_i ;
  wire [0:0]\gen_rst_ic.fifo_rd_rst_ic_reg_0 ;
  wire \gen_rst_ic.fifo_rd_rst_wr_i ;
  wire \gen_rst_ic.fifo_wr_rst_ic ;
  wire \gen_rst_ic.fifo_wr_rst_ic_i_1_n_0 ;
  wire \gen_rst_ic.fifo_wr_rst_ic_i_3_n_0 ;
  wire \gen_rst_ic.fifo_wr_rst_rd ;
  wire [1:0]\gen_rst_ic.next_rrst_state ;
  wire \gen_rst_ic.rst_seq_reentered_i_1_n_0 ;
  wire \gen_rst_ic.rst_seq_reentered_i_2_n_0 ;
  wire \gen_rst_ic.rst_seq_reentered_reg_n_0 ;
  wire \gen_rst_ic.wr_rst_busy_ic_i_1_n_0 ;
  wire \gen_rst_ic.wr_rst_busy_ic_i_2_n_0 ;
  wire p_0_in;
  wire \power_on_rst_reg_n_0_[0] ;
  wire ram_empty_i;
  wire ram_wr_en_i;
  wire rd_clk;
  wire rd_en;
  wire rst;
  wire rst_d1;
  wire rst_i__0;
  wire wr_clk;
  wire wr_en;
  wire wrst_busy;

  LUT5 #(
    .INIT(32'h00010116)) 
    \/i_ 
       (.I0(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[1] ),
        .I2(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[2] ),
        .I3(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[3] ),
        .I4(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[4] ),
        .O(\/i__n_0 ));
  LUT6 #(
    .INIT(64'h03030200FFFFFFFF)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state[0]_i_1 
       (.I0(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[3] ),
        .I1(p_0_in),
        .I2(rst),
        .I3(\gen_rst_ic.rst_seq_reentered_reg_n_0 ),
        .I4(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[0] ),
        .I5(\/i__n_0 ),
        .O(\FSM_onehot_gen_rst_ic.curr_wrst_state[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFEFEFEEE)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state[1]_i_1 
       (.I0(\FSM_onehot_gen_rst_ic.curr_wrst_state[1]_i_2_n_0 ),
        .I1(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[4] ),
        .I2(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[3] ),
        .I3(rst),
        .I4(p_0_in),
        .O(\FSM_onehot_gen_rst_ic.curr_wrst_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFF0EEE0FFFFEEE0)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state[1]_i_2 
       (.I0(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[2] ),
        .I2(rst),
        .I3(p_0_in),
        .I4(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[1] ),
        .I5(\gen_rst_ic.fifo_rd_rst_wr_i ),
        .O(\FSM_onehot_gen_rst_ic.curr_wrst_state[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h000C0008)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state[2]_i_1 
       (.I0(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[1] ),
        .I1(\gen_rst_ic.fifo_rd_rst_wr_i ),
        .I2(rst),
        .I3(p_0_in),
        .I4(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[2] ),
        .O(\FSM_onehot_gen_rst_ic.curr_wrst_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000004400000044)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state[3]_i_1 
       (.I0(\gen_rst_ic.fifo_rd_rst_wr_i ),
        .I1(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[2] ),
        .I2(\gen_rst_ic.rst_seq_reentered_reg_n_0 ),
        .I3(rst),
        .I4(p_0_in),
        .I5(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[3] ),
        .O(\FSM_onehot_gen_rst_ic.curr_wrst_state[3]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state[4]_i_1 
       (.I0(\/i__n_0 ),
        .O(\FSM_onehot_gen_rst_ic.curr_wrst_state[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0002)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state[4]_i_2 
       (.I0(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[3] ),
        .I1(p_0_in),
        .I2(rst),
        .I3(\gen_rst_ic.rst_seq_reentered_reg_n_0 ),
        .O(\FSM_onehot_gen_rst_ic.curr_wrst_state[4]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "WRST_OUT:00100,WRST_IN:00010,WRST_GO2IDLE:10000,WRST_EXIT:01000,WRST_IDLE:00001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b1)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\FSM_onehot_gen_rst_ic.curr_wrst_state[0]_i_1_n_0 ),
        .Q(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[0] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "WRST_OUT:00100,WRST_IN:00010,WRST_GO2IDLE:10000,WRST_EXIT:01000,WRST_IDLE:00001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state_reg[1] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\FSM_onehot_gen_rst_ic.curr_wrst_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[1] ),
        .R(\FSM_onehot_gen_rst_ic.curr_wrst_state[4]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "WRST_OUT:00100,WRST_IN:00010,WRST_GO2IDLE:10000,WRST_EXIT:01000,WRST_IDLE:00001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state_reg[2] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\FSM_onehot_gen_rst_ic.curr_wrst_state[2]_i_1_n_0 ),
        .Q(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[2] ),
        .R(\FSM_onehot_gen_rst_ic.curr_wrst_state[4]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "WRST_OUT:00100,WRST_IN:00010,WRST_GO2IDLE:10000,WRST_EXIT:01000,WRST_IDLE:00001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state_reg[3] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\FSM_onehot_gen_rst_ic.curr_wrst_state[3]_i_1_n_0 ),
        .Q(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[3] ),
        .R(\FSM_onehot_gen_rst_ic.curr_wrst_state[4]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "WRST_OUT:00100,WRST_IN:00010,WRST_GO2IDLE:10000,WRST_EXIT:01000,WRST_IDLE:00001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state_reg[4] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\FSM_onehot_gen_rst_ic.curr_wrst_state[4]_i_2_n_0 ),
        .Q(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[4] ),
        .R(\FSM_onehot_gen_rst_ic.curr_wrst_state[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \FSM_sequential_gen_rst_ic.curr_rrst_state[1]_i_1 
       (.I0(\gen_rst_ic.curr_rrst_state [0]),
        .I1(\gen_rst_ic.curr_rrst_state [1]),
        .O(\gen_rst_ic.next_rrst_state [1]));
  (* FSM_ENCODED_STATES = "RRST_IDLE:00,RRST_IN:01,RRST_OUT:10,RRST_EXIT:11" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_gen_rst_ic.curr_rrst_state_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\gen_rst_ic.next_rrst_state [0]),
        .Q(\gen_rst_ic.curr_rrst_state [0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "RRST_IDLE:00,RRST_IN:01,RRST_OUT:10,RRST_EXIT:11" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_gen_rst_ic.curr_rrst_state_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\gen_rst_ic.next_rrst_state [1]),
        .Q(\gen_rst_ic.curr_rrst_state [1]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h06)) 
    \__0/i_ 
       (.I0(\gen_rst_ic.fifo_wr_rst_rd ),
        .I1(\gen_rst_ic.curr_rrst_state [1]),
        .I2(\gen_rst_ic.curr_rrst_state [0]),
        .O(\gen_rst_ic.next_rrst_state [0]));
  LUT5 #(
    .INIT(32'hAAAAAEAE)) 
    \count_value_i[1]_i_1__2 
       (.I0(SR),
        .I1(ram_empty_i),
        .I2(Q[1]),
        .I3(rd_en),
        .I4(Q[0]),
        .O(\gen_rst_ic.fifo_rd_rst_ic_reg_0 ));
  LUT3 #(
    .INIT(8'h3E)) 
    \gen_rst_ic.fifo_rd_rst_ic_i_1 
       (.I0(\gen_rst_ic.fifo_wr_rst_rd ),
        .I1(\gen_rst_ic.curr_rrst_state [1]),
        .I2(\gen_rst_ic.curr_rrst_state [0]),
        .O(\gen_rst_ic.fifo_rd_rst_i ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rst_ic.fifo_rd_rst_ic_reg 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\gen_rst_ic.fifo_rd_rst_i ),
        .Q(SR),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFEAFFFFFFEA0000)) 
    \gen_rst_ic.fifo_wr_rst_ic_i_1 
       (.I0(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[4] ),
        .I1(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[0] ),
        .I2(rst_i__0),
        .I3(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[1] ),
        .I4(\gen_rst_ic.fifo_wr_rst_ic_i_3_n_0 ),
        .I5(\gen_rst_ic.fifo_wr_rst_ic ),
        .O(\gen_rst_ic.fifo_wr_rst_ic_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \gen_rst_ic.fifo_wr_rst_ic_i_2 
       (.I0(p_0_in),
        .I1(rst),
        .O(rst_i__0));
  LUT5 #(
    .INIT(32'h00010116)) 
    \gen_rst_ic.fifo_wr_rst_ic_i_3 
       (.I0(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[1] ),
        .I2(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[2] ),
        .I3(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[3] ),
        .I4(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[4] ),
        .O(\gen_rst_ic.fifo_wr_rst_ic_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rst_ic.fifo_wr_rst_ic_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gen_rst_ic.fifo_wr_rst_ic_i_1_n_0 ),
        .Q(\gen_rst_ic.fifo_wr_rst_ic ),
        .R(1'b0));
  (* DEF_VAL = "1'b0" *) 
  (* DEST_SYNC_FF = "2" *) 
  (* INIT = "0" *) 
  (* INIT_SYNC_FF = "1" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_1_axi_video_0_3_xpm_cdc_sync_rst__7 \gen_rst_ic.rrst_wr_inst 
       (.dest_clk(wr_clk),
        .dest_rst(\gen_rst_ic.fifo_rd_rst_wr_i ),
        .src_rst(SR));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \gen_rst_ic.rst_seq_reentered_i_1 
       (.I0(\gen_rst_ic.rst_seq_reentered_i_2_n_0 ),
        .I1(rst),
        .I2(p_0_in),
        .O(\gen_rst_ic.rst_seq_reentered_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00010000)) 
    \gen_rst_ic.rst_seq_reentered_i_2 
       (.I0(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[3] ),
        .I2(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[1] ),
        .I3(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[2] ),
        .I4(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[4] ),
        .I5(\gen_rst_ic.rst_seq_reentered_reg_n_0 ),
        .O(\gen_rst_ic.rst_seq_reentered_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rst_ic.rst_seq_reentered_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gen_rst_ic.rst_seq_reentered_i_1_n_0 ),
        .Q(\gen_rst_ic.rst_seq_reentered_reg_n_0 ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hEFFFEF00)) 
    \gen_rst_ic.wr_rst_busy_ic_i_1 
       (.I0(rst),
        .I1(p_0_in),
        .I2(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[0] ),
        .I3(\gen_rst_ic.wr_rst_busy_ic_i_2_n_0 ),
        .I4(wrst_busy),
        .O(\gen_rst_ic.wr_rst_busy_ic_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000116)) 
    \gen_rst_ic.wr_rst_busy_ic_i_2 
       (.I0(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[3] ),
        .I1(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[2] ),
        .I2(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[1] ),
        .I3(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[0] ),
        .I4(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[4] ),
        .O(\gen_rst_ic.wr_rst_busy_ic_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rst_ic.wr_rst_busy_ic_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gen_rst_ic.wr_rst_busy_ic_i_1_n_0 ),
        .Q(wrst_busy),
        .R(1'b0));
  (* DEF_VAL = "1'b0" *) 
  (* DEST_SYNC_FF = "2" *) 
  (* INIT = "0" *) 
  (* INIT_SYNC_FF = "1" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_1_axi_video_0_3_xpm_cdc_sync_rst__6 \gen_rst_ic.wrst_rd_inst 
       (.dest_clk(rd_clk),
        .dest_rst(\gen_rst_ic.fifo_wr_rst_rd ),
        .src_rst(\gen_rst_ic.fifo_wr_rst_ic ));
  LUT4 #(
    .INIT(16'h0002)) 
    \gen_sdpram.xpm_memory_base_inst_i_1 
       (.I0(wr_en),
        .I1(\count_value_i_reg[11] ),
        .I2(wrst_busy),
        .I3(rst_d1),
        .O(ram_wr_en_i));
  FDRE #(
    .INIT(1'b1)) 
    \power_on_rst_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(1'b0),
        .Q(\power_on_rst_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \power_on_rst_reg[1] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\power_on_rst_reg_n_0_[0] ),
        .Q(p_0_in),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "xpm_fifo_rst" *) 
module design_1_axi_video_0_3_xpm_fifo_rst__xdcDup__1
   (SR,
    wrst_busy,
    E,
    wr_rst_busy,
    rd_clk,
    wr_clk,
    rst,
    wr_en,
    full,
    rst_d1);
  output [0:0]SR;
  output wrst_busy;
  output [0:0]E;
  output wr_rst_busy;
  input rd_clk;
  input wr_clk;
  input rst;
  input wr_en;
  input full;
  input rst_d1;

  wire \/i__n_0 ;
  wire [0:0]E;
  wire \FSM_onehot_gen_rst_ic.curr_wrst_state[0]_i_1_n_0 ;
  wire \FSM_onehot_gen_rst_ic.curr_wrst_state[1]_i_1_n_0 ;
  wire \FSM_onehot_gen_rst_ic.curr_wrst_state[1]_i_2_n_0 ;
  wire \FSM_onehot_gen_rst_ic.curr_wrst_state[2]_i_1_n_0 ;
  wire \FSM_onehot_gen_rst_ic.curr_wrst_state[3]_i_1_n_0 ;
  wire \FSM_onehot_gen_rst_ic.curr_wrst_state[4]_i_1_n_0 ;
  wire \FSM_onehot_gen_rst_ic.curr_wrst_state[4]_i_2_n_0 ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[0] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[1] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[2] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[3] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[4] ;
  wire [0:0]SR;
  wire full;
  (* RTL_KEEP = "yes" *) wire [1:0]\gen_rst_ic.curr_rrst_state ;
  wire \gen_rst_ic.fifo_rd_rst_i ;
  wire \gen_rst_ic.fifo_rd_rst_wr_i ;
  wire \gen_rst_ic.fifo_wr_rst_ic ;
  wire \gen_rst_ic.fifo_wr_rst_ic_i_1_n_0 ;
  wire \gen_rst_ic.fifo_wr_rst_ic_i_3_n_0 ;
  wire \gen_rst_ic.fifo_wr_rst_rd ;
  wire [1:0]\gen_rst_ic.next_rrst_state ;
  wire \gen_rst_ic.rst_seq_reentered_i_1_n_0 ;
  wire \gen_rst_ic.rst_seq_reentered_i_2_n_0 ;
  wire \gen_rst_ic.rst_seq_reentered_reg_n_0 ;
  wire \gen_rst_ic.wr_rst_busy_ic_i_1_n_0 ;
  wire \gen_rst_ic.wr_rst_busy_ic_i_2_n_0 ;
  wire p_0_in;
  wire \power_on_rst_reg_n_0_[0] ;
  wire rd_clk;
  wire rst;
  wire rst_d1;
  wire rst_i__0;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;
  wire wrst_busy;

  LUT5 #(
    .INIT(32'h00010116)) 
    \/i_ 
       (.I0(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[1] ),
        .I2(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[2] ),
        .I3(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[3] ),
        .I4(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[4] ),
        .O(\/i__n_0 ));
  LUT6 #(
    .INIT(64'h03030200FFFFFFFF)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state[0]_i_1 
       (.I0(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[3] ),
        .I1(p_0_in),
        .I2(rst),
        .I3(\gen_rst_ic.rst_seq_reentered_reg_n_0 ),
        .I4(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[0] ),
        .I5(\/i__n_0 ),
        .O(\FSM_onehot_gen_rst_ic.curr_wrst_state[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFEFEFEEE)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state[1]_i_1 
       (.I0(\FSM_onehot_gen_rst_ic.curr_wrst_state[1]_i_2_n_0 ),
        .I1(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[4] ),
        .I2(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[3] ),
        .I3(rst),
        .I4(p_0_in),
        .O(\FSM_onehot_gen_rst_ic.curr_wrst_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFF0EEE0FFFFEEE0)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state[1]_i_2 
       (.I0(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[2] ),
        .I2(rst),
        .I3(p_0_in),
        .I4(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[1] ),
        .I5(\gen_rst_ic.fifo_rd_rst_wr_i ),
        .O(\FSM_onehot_gen_rst_ic.curr_wrst_state[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h000C0008)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state[2]_i_1 
       (.I0(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[1] ),
        .I1(\gen_rst_ic.fifo_rd_rst_wr_i ),
        .I2(rst),
        .I3(p_0_in),
        .I4(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[2] ),
        .O(\FSM_onehot_gen_rst_ic.curr_wrst_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000004400000044)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state[3]_i_1 
       (.I0(\gen_rst_ic.fifo_rd_rst_wr_i ),
        .I1(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[2] ),
        .I2(\gen_rst_ic.rst_seq_reentered_reg_n_0 ),
        .I3(rst),
        .I4(p_0_in),
        .I5(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[3] ),
        .O(\FSM_onehot_gen_rst_ic.curr_wrst_state[3]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state[4]_i_1 
       (.I0(\/i__n_0 ),
        .O(\FSM_onehot_gen_rst_ic.curr_wrst_state[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0002)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state[4]_i_2 
       (.I0(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[3] ),
        .I1(p_0_in),
        .I2(rst),
        .I3(\gen_rst_ic.rst_seq_reentered_reg_n_0 ),
        .O(\FSM_onehot_gen_rst_ic.curr_wrst_state[4]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "WRST_OUT:00100,WRST_IN:00010,WRST_GO2IDLE:10000,WRST_EXIT:01000,WRST_IDLE:00001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b1)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\FSM_onehot_gen_rst_ic.curr_wrst_state[0]_i_1_n_0 ),
        .Q(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[0] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "WRST_OUT:00100,WRST_IN:00010,WRST_GO2IDLE:10000,WRST_EXIT:01000,WRST_IDLE:00001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state_reg[1] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\FSM_onehot_gen_rst_ic.curr_wrst_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[1] ),
        .R(\FSM_onehot_gen_rst_ic.curr_wrst_state[4]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "WRST_OUT:00100,WRST_IN:00010,WRST_GO2IDLE:10000,WRST_EXIT:01000,WRST_IDLE:00001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state_reg[2] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\FSM_onehot_gen_rst_ic.curr_wrst_state[2]_i_1_n_0 ),
        .Q(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[2] ),
        .R(\FSM_onehot_gen_rst_ic.curr_wrst_state[4]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "WRST_OUT:00100,WRST_IN:00010,WRST_GO2IDLE:10000,WRST_EXIT:01000,WRST_IDLE:00001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state_reg[3] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\FSM_onehot_gen_rst_ic.curr_wrst_state[3]_i_1_n_0 ),
        .Q(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[3] ),
        .R(\FSM_onehot_gen_rst_ic.curr_wrst_state[4]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "WRST_OUT:00100,WRST_IN:00010,WRST_GO2IDLE:10000,WRST_EXIT:01000,WRST_IDLE:00001" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_gen_rst_ic.curr_wrst_state_reg[4] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\FSM_onehot_gen_rst_ic.curr_wrst_state[4]_i_2_n_0 ),
        .Q(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[4] ),
        .R(\FSM_onehot_gen_rst_ic.curr_wrst_state[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \FSM_sequential_gen_rst_ic.curr_rrst_state[1]_i_1 
       (.I0(\gen_rst_ic.curr_rrst_state [0]),
        .I1(\gen_rst_ic.curr_rrst_state [1]),
        .O(\gen_rst_ic.next_rrst_state [1]));
  (* FSM_ENCODED_STATES = "RRST_IDLE:00,RRST_IN:01,RRST_OUT:10,RRST_EXIT:11" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_gen_rst_ic.curr_rrst_state_reg[0] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\gen_rst_ic.next_rrst_state [0]),
        .Q(\gen_rst_ic.curr_rrst_state [0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "RRST_IDLE:00,RRST_IN:01,RRST_OUT:10,RRST_EXIT:11" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_gen_rst_ic.curr_rrst_state_reg[1] 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\gen_rst_ic.next_rrst_state [1]),
        .Q(\gen_rst_ic.curr_rrst_state [1]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h06)) 
    \__0/i_ 
       (.I0(\gen_rst_ic.fifo_wr_rst_rd ),
        .I1(\gen_rst_ic.curr_rrst_state [1]),
        .I2(\gen_rst_ic.curr_rrst_state [0]),
        .O(\gen_rst_ic.next_rrst_state [0]));
  LUT3 #(
    .INIT(8'h3E)) 
    \gen_rst_ic.fifo_rd_rst_ic_i_1 
       (.I0(\gen_rst_ic.fifo_wr_rst_rd ),
        .I1(\gen_rst_ic.curr_rrst_state [1]),
        .I2(\gen_rst_ic.curr_rrst_state [0]),
        .O(\gen_rst_ic.fifo_rd_rst_i ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rst_ic.fifo_rd_rst_ic_reg 
       (.C(rd_clk),
        .CE(1'b1),
        .D(\gen_rst_ic.fifo_rd_rst_i ),
        .Q(SR),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFEAFFFFFFEA0000)) 
    \gen_rst_ic.fifo_wr_rst_ic_i_1 
       (.I0(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[4] ),
        .I1(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[0] ),
        .I2(rst_i__0),
        .I3(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[1] ),
        .I4(\gen_rst_ic.fifo_wr_rst_ic_i_3_n_0 ),
        .I5(\gen_rst_ic.fifo_wr_rst_ic ),
        .O(\gen_rst_ic.fifo_wr_rst_ic_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \gen_rst_ic.fifo_wr_rst_ic_i_2 
       (.I0(p_0_in),
        .I1(rst),
        .O(rst_i__0));
  LUT5 #(
    .INIT(32'h00010116)) 
    \gen_rst_ic.fifo_wr_rst_ic_i_3 
       (.I0(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[1] ),
        .I2(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[2] ),
        .I3(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[3] ),
        .I4(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[4] ),
        .O(\gen_rst_ic.fifo_wr_rst_ic_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rst_ic.fifo_wr_rst_ic_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gen_rst_ic.fifo_wr_rst_ic_i_1_n_0 ),
        .Q(\gen_rst_ic.fifo_wr_rst_ic ),
        .R(1'b0));
  (* DEF_VAL = "1'b0" *) 
  (* DEST_SYNC_FF = "2" *) 
  (* INIT = "0" *) 
  (* INIT_SYNC_FF = "1" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_1_axi_video_0_3_xpm_cdc_sync_rst \gen_rst_ic.rrst_wr_inst 
       (.dest_clk(wr_clk),
        .dest_rst(\gen_rst_ic.fifo_rd_rst_wr_i ),
        .src_rst(SR));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \gen_rst_ic.rst_seq_reentered_i_1 
       (.I0(\gen_rst_ic.rst_seq_reentered_i_2_n_0 ),
        .I1(rst),
        .I2(p_0_in),
        .O(\gen_rst_ic.rst_seq_reentered_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00010000)) 
    \gen_rst_ic.rst_seq_reentered_i_2 
       (.I0(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[3] ),
        .I2(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[1] ),
        .I3(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[2] ),
        .I4(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[4] ),
        .I5(\gen_rst_ic.rst_seq_reentered_reg_n_0 ),
        .O(\gen_rst_ic.rst_seq_reentered_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rst_ic.rst_seq_reentered_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gen_rst_ic.rst_seq_reentered_i_1_n_0 ),
        .Q(\gen_rst_ic.rst_seq_reentered_reg_n_0 ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hEFFFEF00)) 
    \gen_rst_ic.wr_rst_busy_ic_i_1 
       (.I0(rst),
        .I1(p_0_in),
        .I2(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[0] ),
        .I3(\gen_rst_ic.wr_rst_busy_ic_i_2_n_0 ),
        .I4(wrst_busy),
        .O(\gen_rst_ic.wr_rst_busy_ic_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000116)) 
    \gen_rst_ic.wr_rst_busy_ic_i_2 
       (.I0(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[3] ),
        .I1(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[2] ),
        .I2(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[1] ),
        .I3(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[0] ),
        .I4(\FSM_onehot_gen_rst_ic.curr_wrst_state_reg_n_0_[4] ),
        .O(\gen_rst_ic.wr_rst_busy_ic_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rst_ic.wr_rst_busy_ic_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gen_rst_ic.wr_rst_busy_ic_i_1_n_0 ),
        .Q(wrst_busy),
        .R(1'b0));
  (* DEF_VAL = "1'b0" *) 
  (* DEST_SYNC_FF = "2" *) 
  (* INIT = "0" *) 
  (* INIT_SYNC_FF = "1" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_1_axi_video_0_3_xpm_cdc_sync_rst__8 \gen_rst_ic.wrst_rd_inst 
       (.dest_clk(rd_clk),
        .dest_rst(\gen_rst_ic.fifo_wr_rst_rd ),
        .src_rst(\gen_rst_ic.fifo_wr_rst_ic ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \gen_sdpram.xpm_memory_base_inst_i_1 
       (.I0(wr_en),
        .I1(full),
        .I2(wrst_busy),
        .I3(rst_d1),
        .O(E));
  FDRE #(
    .INIT(1'b1)) 
    \power_on_rst_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(1'b0),
        .Q(\power_on_rst_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \power_on_rst_reg[1] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\power_on_rst_reg_n_0_[0] ),
        .Q(p_0_in),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT2 #(
    .INIT(4'hE)) 
    wr_rst_busy_INST_0
       (.I0(wrst_busy),
        .I1(rst_d1),
        .O(wr_rst_busy));
endmodule

(* ORIG_REF_NAME = "xpm_fifo_wrapper" *) 
module design_1_axi_video_0_3_xpm_fifo_wrapper
   (s_axis_tready,
    s_aresetn,
    D,
    E,
    m00_axi_rvalid_0,
    \FSM_onehot_state_reg[1] ,
    m00_axi_rready,
    \gwdc.wr_data_count_i_reg[12] ,
    \gwdc.wr_data_count_i_reg[11] ,
    \gwdc.wr_data_count_i_reg[10] ,
    \gwdc.wr_data_count_i_reg[9] ,
    \gwdc.wr_data_count_i_reg[8] ,
    \gwdc.wr_data_count_i_reg[7] ,
    \gwdc.wr_data_count_i_reg[6] ,
    \gwdc.wr_data_count_i_reg[5] ,
    \gwdc.wr_data_count_i_reg[4] ,
    \gwdc.wr_data_count_i_reg[3] ,
    \gwdc.wr_data_count_i_reg[2] ,
    \gwdc.wr_data_count_i_reg[1] ,
    \gwdc.wr_data_count_i_reg[0] ,
    vfsm_rd_enable_reg,
    m00_axi_aclk,
    s_axis_tvalid,
    m00_axi_rdata,
    s_axis_tlast,
    m00_axi_ruser,
    video_clk,
    rd_en,
    \s_cntr_reg[0]_0 ,
    Q,
    m00_axi_rvalid,
    \video_rgb_reg[4] ,
    \s00_axi_rdata_reg[12] ,
    \s00_axi_rdata_reg[12]_0 ,
    \s00_axi_rdata_reg[12]_1 ,
    s00_axi_araddr,
    \s00_axi_rdata_reg[12]_2 ,
    \s00_axi_rdata_reg[11] ,
    \s00_axi_rdata_reg[11]_0 ,
    \s00_axi_rdata_reg[10] ,
    \s00_axi_rdata_reg[10]_0 ,
    \s00_axi_rdata_reg[9] ,
    \s00_axi_rdata_reg[9]_0 ,
    \s00_axi_rdata_reg[8] ,
    \s00_axi_rdata_reg[8]_0 ,
    \s00_axi_rdata_reg[7] ,
    \s00_axi_rdata_reg[7]_0 ,
    \s00_axi_rdata_reg[6] ,
    \s00_axi_rdata_reg[6]_0 ,
    \s00_axi_rdata_reg[5] ,
    \s00_axi_rdata_reg[5]_0 ,
    \s00_axi_rdata_reg[4] ,
    \s00_axi_rdata_reg[4]_0 ,
    \s00_axi_rdata_reg[3] ,
    \s00_axi_rdata_reg[3]_0 ,
    \s00_axi_rdata_reg[2] ,
    \s00_axi_rdata_reg[2]_0 ,
    \s00_axi_rdata_reg[1] ,
    \s00_axi_rdata_reg[1]_0 ,
    \s00_axi_rdata_reg[0] ,
    \s00_axi_rdata_reg[0]_0 ,
    vfsm_rd_enable);
  output s_axis_tready;
  output s_aresetn;
  output [23:0]D;
  output [0:0]E;
  output m00_axi_rvalid_0;
  output \FSM_onehot_state_reg[1] ;
  output m00_axi_rready;
  output \gwdc.wr_data_count_i_reg[12] ;
  output \gwdc.wr_data_count_i_reg[11] ;
  output \gwdc.wr_data_count_i_reg[10] ;
  output \gwdc.wr_data_count_i_reg[9] ;
  output \gwdc.wr_data_count_i_reg[8] ;
  output \gwdc.wr_data_count_i_reg[7] ;
  output \gwdc.wr_data_count_i_reg[6] ;
  output \gwdc.wr_data_count_i_reg[5] ;
  output \gwdc.wr_data_count_i_reg[4] ;
  output \gwdc.wr_data_count_i_reg[3] ;
  output \gwdc.wr_data_count_i_reg[2] ;
  output \gwdc.wr_data_count_i_reg[1] ;
  output \gwdc.wr_data_count_i_reg[0] ;
  output [0:0]vfsm_rd_enable_reg;
  input m00_axi_aclk;
  input s_axis_tvalid;
  input [63:0]m00_axi_rdata;
  input s_axis_tlast;
  input [7:0]m00_axi_ruser;
  input video_clk;
  input rd_en;
  input \s_cntr_reg[0]_0 ;
  input [2:0]Q;
  input m00_axi_rvalid;
  input [0:0]\video_rgb_reg[4] ;
  input \s00_axi_rdata_reg[12] ;
  input \s00_axi_rdata_reg[12]_0 ;
  input \s00_axi_rdata_reg[12]_1 ;
  input [0:0]s00_axi_araddr;
  input \s00_axi_rdata_reg[12]_2 ;
  input \s00_axi_rdata_reg[11] ;
  input \s00_axi_rdata_reg[11]_0 ;
  input \s00_axi_rdata_reg[10] ;
  input \s00_axi_rdata_reg[10]_0 ;
  input \s00_axi_rdata_reg[9] ;
  input \s00_axi_rdata_reg[9]_0 ;
  input \s00_axi_rdata_reg[8] ;
  input \s00_axi_rdata_reg[8]_0 ;
  input \s00_axi_rdata_reg[7] ;
  input \s00_axi_rdata_reg[7]_0 ;
  input \s00_axi_rdata_reg[6] ;
  input \s00_axi_rdata_reg[6]_0 ;
  input \s00_axi_rdata_reg[5] ;
  input \s00_axi_rdata_reg[5]_0 ;
  input \s00_axi_rdata_reg[4] ;
  input \s00_axi_rdata_reg[4]_0 ;
  input \s00_axi_rdata_reg[3] ;
  input \s00_axi_rdata_reg[3]_0 ;
  input \s00_axi_rdata_reg[2] ;
  input \s00_axi_rdata_reg[2]_0 ;
  input \s00_axi_rdata_reg[1] ;
  input \s00_axi_rdata_reg[1]_0 ;
  input \s00_axi_rdata_reg[0] ;
  input \s00_axi_rdata_reg[0]_0 ;
  input vfsm_rd_enable;

  wire [23:0]D;
  wire [0:0]E;
  wire \FSM_onehot_state_reg[1] ;
  wire [2:0]Q;
  wire [63:0]df_m_axis_tdata;
  wire df_m_axis_tlast;
  wire [7:0]df_m_axis_tuser;
  wire df_m_axis_tvalid;
  wire full;
  wire \gwdc.wr_data_count_i_reg[0] ;
  wire \gwdc.wr_data_count_i_reg[10] ;
  wire \gwdc.wr_data_count_i_reg[11] ;
  wire \gwdc.wr_data_count_i_reg[12] ;
  wire \gwdc.wr_data_count_i_reg[1] ;
  wire \gwdc.wr_data_count_i_reg[2] ;
  wire \gwdc.wr_data_count_i_reg[3] ;
  wire \gwdc.wr_data_count_i_reg[4] ;
  wire \gwdc.wr_data_count_i_reg[5] ;
  wire \gwdc.wr_data_count_i_reg[6] ;
  wire \gwdc.wr_data_count_i_reg[7] ;
  wire \gwdc.wr_data_count_i_reg[8] ;
  wire \gwdc.wr_data_count_i_reg[9] ;
  wire m00_axi_aclk;
  wire [63:0]m00_axi_rdata;
  wire m00_axi_rready;
  wire [7:0]m00_axi_ruser;
  wire m00_axi_rvalid;
  wire m00_axi_rvalid_0;
  wire [0:0]minusOp;
  wire rd_en;
  wire [0:0]s00_axi_araddr;
  wire \s00_axi_rdata_reg[0] ;
  wire \s00_axi_rdata_reg[0]_0 ;
  wire \s00_axi_rdata_reg[10] ;
  wire \s00_axi_rdata_reg[10]_0 ;
  wire \s00_axi_rdata_reg[11] ;
  wire \s00_axi_rdata_reg[11]_0 ;
  wire \s00_axi_rdata_reg[12] ;
  wire \s00_axi_rdata_reg[12]_0 ;
  wire \s00_axi_rdata_reg[12]_1 ;
  wire \s00_axi_rdata_reg[12]_2 ;
  wire \s00_axi_rdata_reg[1] ;
  wire \s00_axi_rdata_reg[1]_0 ;
  wire \s00_axi_rdata_reg[2] ;
  wire \s00_axi_rdata_reg[2]_0 ;
  wire \s00_axi_rdata_reg[3] ;
  wire \s00_axi_rdata_reg[3]_0 ;
  wire \s00_axi_rdata_reg[4] ;
  wire \s00_axi_rdata_reg[4]_0 ;
  wire \s00_axi_rdata_reg[5] ;
  wire \s00_axi_rdata_reg[5]_0 ;
  wire \s00_axi_rdata_reg[6] ;
  wire \s00_axi_rdata_reg[6]_0 ;
  wire \s00_axi_rdata_reg[7] ;
  wire \s00_axi_rdata_reg[7]_0 ;
  wire \s00_axi_rdata_reg[8] ;
  wire \s00_axi_rdata_reg[8]_0 ;
  wire \s00_axi_rdata_reg[9] ;
  wire \s00_axi_rdata_reg[9]_0 ;
  wire s_areset;
  wire s_areset_i_1_n_0;
  wire s_aresetn;
  wire s_aresetn_i_1_n_0;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire \s_cntr[1]_i_1_n_0 ;
  wire \s_cntr[2]_i_1_n_0 ;
  wire \s_cntr[3]_i_1_n_0 ;
  wire [3:0]s_cntr_reg;
  wire \s_cntr_reg[0]_0 ;
  wire [23:0]svf_axis_tdata;
  wire svf_axis_tvalid;
  wire [12:0]svf_fifo_count;
  wire vfsm_rd_enable;
  wire [0:0]vfsm_rd_enable_reg;
  wire video_clk;
  wire [0:0]\video_rgb_reg[4] ;
  wire xpm_fifo_async_inst_n_10;
  wire xpm_fifo_async_inst_n_11;
  wire xpm_fifo_async_inst_n_12;
  wire xpm_fifo_async_inst_n_13;
  wire xpm_fifo_async_inst_n_14;
  wire xpm_fifo_async_inst_n_15;
  wire xpm_fifo_async_inst_n_16;
  wire xpm_fifo_async_inst_n_17;
  wire xpm_fifo_async_inst_n_18;
  wire xpm_fifo_async_inst_n_19;
  wire xpm_fifo_async_inst_n_20;
  wire xpm_fifo_async_inst_n_21;
  wire xpm_fifo_async_inst_n_22;
  wire xpm_fifo_async_inst_n_23;
  wire xpm_fifo_async_inst_n_7;
  wire xpm_fifo_async_inst_n_8;
  wire xpm_fifo_async_inst_n_9;
  wire xpm_fifo_axis_inst_i_3_n_0;
  wire xpm_fifo_axis_inst_n_109;
  wire xpm_fifo_axis_inst_n_110;
  wire xpm_fifo_axis_inst_n_111;
  wire xpm_fifo_axis_inst_n_112;
  wire xpm_fifo_axis_inst_n_113;
  wire xpm_fifo_axis_inst_n_114;
  wire xpm_fifo_axis_inst_n_115;
  wire xpm_fifo_axis_inst_n_116;
  wire xpm_fifo_axis_inst_n_117;
  wire xpm_fifo_axis_inst_n_118;
  wire xpm_fifo_axis_inst_n_119;
  wire xpm_fifo_axis_inst_n_120;
  wire xpm_fifo_axis_inst_n_121;
  wire xpm_fifo_axis_inst_n_122;
  wire xpm_fifo_axis_inst_n_123;
  wire xpm_fifo_axis_inst_n_124;
  wire xpm_fifo_axis_inst_n_125;
  wire xpm_fifo_axis_inst_n_126;
  wire xpm_fifo_axis_inst_n_127;
  wire xpm_fifo_axis_inst_n_128;
  wire xpm_fifo_axis_inst_n_129;
  wire xpm_fifo_axis_inst_n_130;
  wire xpm_fifo_axis_inst_n_131;
  wire xpm_fifo_axis_inst_n_132;
  wire xpm_fifo_axis_inst_n_133;
  wire xpm_fifo_axis_inst_n_134;
  wire xpm_fifo_axis_inst_n_135;
  wire xpm_fifo_axis_inst_n_136;
  wire xpm_fifo_axis_inst_n_137;
  wire xpm_fifo_axis_inst_n_138;
  wire xpm_fifo_axis_inst_n_139;
  wire xpm_fifo_axis_inst_n_140;
  wire NLW_xpm_fifo_async_inst_almost_empty_UNCONNECTED;
  wire NLW_xpm_fifo_async_inst_almost_full_UNCONNECTED;
  wire NLW_xpm_fifo_async_inst_dbiterr_UNCONNECTED;
  wire NLW_xpm_fifo_async_inst_empty_UNCONNECTED;
  wire NLW_xpm_fifo_async_inst_overflow_UNCONNECTED;
  wire NLW_xpm_fifo_async_inst_prog_empty_UNCONNECTED;
  wire NLW_xpm_fifo_async_inst_prog_full_UNCONNECTED;
  wire NLW_xpm_fifo_async_inst_rd_rst_busy_UNCONNECTED;
  wire NLW_xpm_fifo_async_inst_sbiterr_UNCONNECTED;
  wire NLW_xpm_fifo_async_inst_underflow_UNCONNECTED;
  wire NLW_xpm_fifo_async_inst_wr_ack_UNCONNECTED;
  wire NLW_xpm_fifo_async_inst_wr_rst_busy_UNCONNECTED;
  wire [0:0]NLW_xpm_fifo_async_inst_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_xpm_fifo_async_inst_wr_data_count_UNCONNECTED;
  wire NLW_xpm_fifo_axis_inst_almost_empty_axis_UNCONNECTED;
  wire NLW_xpm_fifo_axis_inst_almost_full_axis_UNCONNECTED;
  wire NLW_xpm_fifo_axis_inst_dbiterr_axis_UNCONNECTED;
  wire NLW_xpm_fifo_axis_inst_prog_empty_axis_UNCONNECTED;
  wire NLW_xpm_fifo_axis_inst_prog_full_axis_UNCONNECTED;
  wire NLW_xpm_fifo_axis_inst_sbiterr_axis_UNCONNECTED;
  wire [0:0]NLW_xpm_fifo_axis_inst_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_xpm_fifo_axis_inst_m_axis_tid_UNCONNECTED;
  wire [7:0]NLW_xpm_fifo_axis_inst_m_axis_tkeep_UNCONNECTED;
  wire [7:0]NLW_xpm_fifo_axis_inst_m_axis_tstrb_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \FSM_onehot_state[4]_i_7 
       (.I0(Q[1]),
        .I1(m00_axi_rvalid),
        .I2(s_axis_tready),
        .I3(s_aresetn),
        .O(\FSM_onehot_state_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \i_burst_cnt[7]_i_3 
       (.I0(m00_axi_rvalid),
        .I1(Q[2]),
        .I2(s_axis_tready),
        .I3(s_aresetn),
        .O(m00_axi_rvalid_0));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT5 #(
    .INIT(32'hFFFF8000)) 
    \i_transfer_cnt[22]_i_1 
       (.I0(s_aresetn),
        .I1(s_axis_tready),
        .I2(Q[2]),
        .I3(m00_axi_rvalid),
        .I4(Q[0]),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'h80)) 
    m00_axi_rready_INST_0
       (.I0(s_axis_tready),
        .I1(s_aresetn),
        .I2(Q[2]),
        .O(m00_axi_rready));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    \s00_axi_rdata[0]_i_1 
       (.I0(\s00_axi_rdata_reg[12] ),
        .I1(svf_fifo_count[0]),
        .I2(\s00_axi_rdata_reg[12]_0 ),
        .I3(\s00_axi_rdata_reg[0] ),
        .I4(s00_axi_araddr),
        .I5(\s00_axi_rdata_reg[0]_0 ),
        .O(\gwdc.wr_data_count_i_reg[0] ));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    \s00_axi_rdata[10]_i_1 
       (.I0(\s00_axi_rdata_reg[12] ),
        .I1(svf_fifo_count[10]),
        .I2(\s00_axi_rdata_reg[12]_0 ),
        .I3(\s00_axi_rdata_reg[10] ),
        .I4(s00_axi_araddr),
        .I5(\s00_axi_rdata_reg[10]_0 ),
        .O(\gwdc.wr_data_count_i_reg[10] ));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    \s00_axi_rdata[11]_i_1 
       (.I0(\s00_axi_rdata_reg[12] ),
        .I1(svf_fifo_count[11]),
        .I2(\s00_axi_rdata_reg[12]_0 ),
        .I3(\s00_axi_rdata_reg[11] ),
        .I4(s00_axi_araddr),
        .I5(\s00_axi_rdata_reg[11]_0 ),
        .O(\gwdc.wr_data_count_i_reg[11] ));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    \s00_axi_rdata[12]_i_1 
       (.I0(\s00_axi_rdata_reg[12] ),
        .I1(svf_fifo_count[12]),
        .I2(\s00_axi_rdata_reg[12]_0 ),
        .I3(\s00_axi_rdata_reg[12]_1 ),
        .I4(s00_axi_araddr),
        .I5(\s00_axi_rdata_reg[12]_2 ),
        .O(\gwdc.wr_data_count_i_reg[12] ));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    \s00_axi_rdata[1]_i_1 
       (.I0(\s00_axi_rdata_reg[12] ),
        .I1(svf_fifo_count[1]),
        .I2(\s00_axi_rdata_reg[12]_0 ),
        .I3(\s00_axi_rdata_reg[1] ),
        .I4(s00_axi_araddr),
        .I5(\s00_axi_rdata_reg[1]_0 ),
        .O(\gwdc.wr_data_count_i_reg[1] ));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    \s00_axi_rdata[2]_i_1 
       (.I0(\s00_axi_rdata_reg[12] ),
        .I1(svf_fifo_count[2]),
        .I2(\s00_axi_rdata_reg[12]_0 ),
        .I3(\s00_axi_rdata_reg[2] ),
        .I4(s00_axi_araddr),
        .I5(\s00_axi_rdata_reg[2]_0 ),
        .O(\gwdc.wr_data_count_i_reg[2] ));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    \s00_axi_rdata[3]_i_1 
       (.I0(\s00_axi_rdata_reg[12] ),
        .I1(svf_fifo_count[3]),
        .I2(\s00_axi_rdata_reg[12]_0 ),
        .I3(\s00_axi_rdata_reg[3] ),
        .I4(s00_axi_araddr),
        .I5(\s00_axi_rdata_reg[3]_0 ),
        .O(\gwdc.wr_data_count_i_reg[3] ));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    \s00_axi_rdata[4]_i_1 
       (.I0(\s00_axi_rdata_reg[12] ),
        .I1(svf_fifo_count[4]),
        .I2(\s00_axi_rdata_reg[12]_0 ),
        .I3(\s00_axi_rdata_reg[4] ),
        .I4(s00_axi_araddr),
        .I5(\s00_axi_rdata_reg[4]_0 ),
        .O(\gwdc.wr_data_count_i_reg[4] ));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    \s00_axi_rdata[5]_i_1 
       (.I0(\s00_axi_rdata_reg[12] ),
        .I1(svf_fifo_count[5]),
        .I2(\s00_axi_rdata_reg[12]_0 ),
        .I3(\s00_axi_rdata_reg[5] ),
        .I4(s00_axi_araddr),
        .I5(\s00_axi_rdata_reg[5]_0 ),
        .O(\gwdc.wr_data_count_i_reg[5] ));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    \s00_axi_rdata[6]_i_1 
       (.I0(\s00_axi_rdata_reg[12] ),
        .I1(svf_fifo_count[6]),
        .I2(\s00_axi_rdata_reg[12]_0 ),
        .I3(\s00_axi_rdata_reg[6] ),
        .I4(s00_axi_araddr),
        .I5(\s00_axi_rdata_reg[6]_0 ),
        .O(\gwdc.wr_data_count_i_reg[6] ));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    \s00_axi_rdata[7]_i_1 
       (.I0(\s00_axi_rdata_reg[12] ),
        .I1(svf_fifo_count[7]),
        .I2(\s00_axi_rdata_reg[12]_0 ),
        .I3(\s00_axi_rdata_reg[7] ),
        .I4(s00_axi_araddr),
        .I5(\s00_axi_rdata_reg[7]_0 ),
        .O(\gwdc.wr_data_count_i_reg[7] ));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    \s00_axi_rdata[8]_i_1 
       (.I0(\s00_axi_rdata_reg[12] ),
        .I1(svf_fifo_count[8]),
        .I2(\s00_axi_rdata_reg[12]_0 ),
        .I3(\s00_axi_rdata_reg[8] ),
        .I4(s00_axi_araddr),
        .I5(\s00_axi_rdata_reg[8]_0 ),
        .O(\gwdc.wr_data_count_i_reg[8] ));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    \s00_axi_rdata[9]_i_1 
       (.I0(\s00_axi_rdata_reg[12] ),
        .I1(svf_fifo_count[9]),
        .I2(\s00_axi_rdata_reg[12]_0 ),
        .I3(\s00_axi_rdata_reg[9] ),
        .I4(s00_axi_araddr),
        .I5(\s00_axi_rdata_reg[9]_0 ),
        .O(\gwdc.wr_data_count_i_reg[9] ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    s_areset_i_1
       (.I0(s_cntr_reg[2]),
        .I1(s_cntr_reg[1]),
        .I2(s_cntr_reg[0]),
        .I3(s_cntr_reg[3]),
        .O(s_areset_i_1_n_0));
  FDSE s_areset_reg
       (.C(video_clk),
        .CE(1'b1),
        .D(s_areset_i_1_n_0),
        .Q(s_areset),
        .S(\s_cntr_reg[0]_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    s_aresetn_i_1
       (.I0(\s_cntr_reg[0]_0 ),
        .I1(s_cntr_reg[3]),
        .I2(s_cntr_reg[0]),
        .I3(s_cntr_reg[1]),
        .I4(s_cntr_reg[2]),
        .O(s_aresetn_i_1_n_0));
  FDRE s_aresetn_reg
       (.C(video_clk),
        .CE(1'b1),
        .D(s_aresetn_i_1_n_0),
        .Q(s_aresetn),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \s_cntr[0]_i_1 
       (.I0(s_cntr_reg[0]),
        .O(minusOp));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \s_cntr[1]_i_1 
       (.I0(s_cntr_reg[0]),
        .I1(s_cntr_reg[1]),
        .O(\s_cntr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hE1)) 
    \s_cntr[2]_i_1 
       (.I0(s_cntr_reg[1]),
        .I1(s_cntr_reg[0]),
        .I2(s_cntr_reg[2]),
        .O(\s_cntr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT4 #(
    .INIT(16'hFE01)) 
    \s_cntr[3]_i_1 
       (.I0(s_cntr_reg[2]),
        .I1(s_cntr_reg[0]),
        .I2(s_cntr_reg[1]),
        .I3(s_cntr_reg[3]),
        .O(\s_cntr[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s_cntr_reg[0] 
       (.C(video_clk),
        .CE(s_areset_i_1_n_0),
        .D(minusOp),
        .Q(s_cntr_reg[0]),
        .R(\s_cntr_reg[0]_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \s_cntr_reg[1] 
       (.C(video_clk),
        .CE(s_areset_i_1_n_0),
        .D(\s_cntr[1]_i_1_n_0 ),
        .Q(s_cntr_reg[1]),
        .S(\s_cntr_reg[0]_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \s_cntr_reg[2] 
       (.C(video_clk),
        .CE(s_areset_i_1_n_0),
        .D(\s_cntr[2]_i_1_n_0 ),
        .Q(s_cntr_reg[2]),
        .S(\s_cntr_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s_cntr_reg[3] 
       (.C(video_clk),
        .CE(s_areset_i_1_n_0),
        .D(\s_cntr[3]_i_1_n_0 ),
        .Q(s_cntr_reg[3]),
        .R(\s_cntr_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \video_rgb[10]_i_1 
       (.I0(svf_axis_tdata[22]),
        .I1(\video_rgb_reg[4] ),
        .I2(svf_axis_tdata[6]),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \video_rgb[11]_i_1 
       (.I0(svf_axis_tdata[23]),
        .I1(\video_rgb_reg[4] ),
        .I2(svf_axis_tdata[7]),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \video_rgb[28]_i_1 
       (.I0(svf_axis_tdata[0]),
        .I1(\video_rgb_reg[4] ),
        .I2(svf_axis_tdata[16]),
        .O(D[16]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \video_rgb[29]_i_1 
       (.I0(svf_axis_tdata[1]),
        .I1(\video_rgb_reg[4] ),
        .I2(svf_axis_tdata[17]),
        .O(D[17]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \video_rgb[30]_i_1 
       (.I0(svf_axis_tdata[2]),
        .I1(\video_rgb_reg[4] ),
        .I2(svf_axis_tdata[18]),
        .O(D[18]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \video_rgb[31]_i_1 
       (.I0(svf_axis_tdata[3]),
        .I1(\video_rgb_reg[4] ),
        .I2(svf_axis_tdata[19]),
        .O(D[19]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \video_rgb[32]_i_1 
       (.I0(svf_axis_tdata[4]),
        .I1(\video_rgb_reg[4] ),
        .I2(svf_axis_tdata[20]),
        .O(D[20]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \video_rgb[33]_i_1 
       (.I0(svf_axis_tdata[5]),
        .I1(\video_rgb_reg[4] ),
        .I2(svf_axis_tdata[21]),
        .O(D[21]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \video_rgb[34]_i_1 
       (.I0(svf_axis_tdata[6]),
        .I1(\video_rgb_reg[4] ),
        .I2(svf_axis_tdata[22]),
        .O(D[22]));
  LUT2 #(
    .INIT(4'h8)) 
    \video_rgb[35]_i_2 
       (.I0(vfsm_rd_enable),
        .I1(svf_axis_tvalid),
        .O(vfsm_rd_enable_reg));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \video_rgb[35]_i_3 
       (.I0(svf_axis_tdata[7]),
        .I1(\video_rgb_reg[4] ),
        .I2(svf_axis_tdata[23]),
        .O(D[23]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \video_rgb[4]_i_1 
       (.I0(svf_axis_tdata[16]),
        .I1(\video_rgb_reg[4] ),
        .I2(svf_axis_tdata[0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \video_rgb[5]_i_1 
       (.I0(svf_axis_tdata[17]),
        .I1(\video_rgb_reg[4] ),
        .I2(svf_axis_tdata[1]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \video_rgb[6]_i_1 
       (.I0(svf_axis_tdata[18]),
        .I1(\video_rgb_reg[4] ),
        .I2(svf_axis_tdata[2]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \video_rgb[7]_i_1 
       (.I0(svf_axis_tdata[19]),
        .I1(\video_rgb_reg[4] ),
        .I2(svf_axis_tdata[3]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \video_rgb[8]_i_1 
       (.I0(svf_axis_tdata[20]),
        .I1(\video_rgb_reg[4] ),
        .I2(svf_axis_tdata[4]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \video_rgb[9]_i_1 
       (.I0(svf_axis_tdata[21]),
        .I1(\video_rgb_reg[4] ),
        .I2(svf_axis_tdata[5]),
        .O(D[5]));
  (* CASCADE_HEIGHT = "0" *) 
  (* CDC_SYNC_STAGES = "2" *) 
  (* DOUT_RESET_VALUE = "0" *) 
  (* ECC_MODE = "0" *) 
  (* EN_ADV_FEATURE_ASYNC = "16'b0001000000000000" *) 
  (* EN_SIM_ASSERT_ERR = "warning" *) 
  (* FIFO_MEMORY_TYPE = "0" *) 
  (* FIFO_READ_LATENCY = "0" *) 
  (* FIFO_WRITE_DEPTH = "16" *) 
  (* FULL_RESET_VALUE = "1" *) 
  (* PROG_EMPTY_THRESH = "10" *) 
  (* PROG_FULL_THRESH = "10" *) 
  (* P_COMMON_CLOCK = "0" *) 
  (* P_ECC_MODE = "0" *) 
  (* P_FIFO_MEMORY_TYPE = "0" *) 
  (* P_READ_MODE = "1" *) 
  (* P_WAKEUP_TIME = "2" *) 
  (* RD_DATA_COUNT_WIDTH = "1" *) 
  (* READ_DATA_WIDTH = "41" *) 
  (* READ_MODE = "0" *) 
  (* RELATED_CLOCKS = "1" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* USE_ADV_FEATURES = "1000" *) 
  (* WAKEUP_TIME = "0" *) 
  (* WRITE_DATA_WIDTH = "82" *) 
  (* WR_DATA_COUNT_WIDTH = "1" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_1_axi_video_0_3_xpm_fifo_async xpm_fifo_async_inst
       (.almost_empty(NLW_xpm_fifo_async_inst_almost_empty_UNCONNECTED),
        .almost_full(NLW_xpm_fifo_async_inst_almost_full_UNCONNECTED),
        .data_valid(svf_axis_tvalid),
        .dbiterr(NLW_xpm_fifo_async_inst_dbiterr_UNCONNECTED),
        .din({df_m_axis_tlast,df_m_axis_tuser,df_m_axis_tdata[63:32],1'b0,df_m_axis_tuser,df_m_axis_tdata[31:0]}),
        .dout({xpm_fifo_async_inst_n_7,xpm_fifo_async_inst_n_8,xpm_fifo_async_inst_n_9,xpm_fifo_async_inst_n_10,xpm_fifo_async_inst_n_11,xpm_fifo_async_inst_n_12,xpm_fifo_async_inst_n_13,xpm_fifo_async_inst_n_14,xpm_fifo_async_inst_n_15,xpm_fifo_async_inst_n_16,xpm_fifo_async_inst_n_17,xpm_fifo_async_inst_n_18,xpm_fifo_async_inst_n_19,xpm_fifo_async_inst_n_20,xpm_fifo_async_inst_n_21,xpm_fifo_async_inst_n_22,xpm_fifo_async_inst_n_23,svf_axis_tdata[23:16],D[15:8],svf_axis_tdata[7:0]}),
        .empty(NLW_xpm_fifo_async_inst_empty_UNCONNECTED),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .overflow(NLW_xpm_fifo_async_inst_overflow_UNCONNECTED),
        .prog_empty(NLW_xpm_fifo_async_inst_prog_empty_UNCONNECTED),
        .prog_full(NLW_xpm_fifo_async_inst_prog_full_UNCONNECTED),
        .rd_clk(video_clk),
        .rd_data_count(NLW_xpm_fifo_async_inst_rd_data_count_UNCONNECTED[0]),
        .rd_en(rd_en),
        .rd_rst_busy(NLW_xpm_fifo_async_inst_rd_rst_busy_UNCONNECTED),
        .rst(s_areset),
        .sbiterr(NLW_xpm_fifo_async_inst_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .underflow(NLW_xpm_fifo_async_inst_underflow_UNCONNECTED),
        .wr_ack(NLW_xpm_fifo_async_inst_wr_ack_UNCONNECTED),
        .wr_clk(video_clk),
        .wr_data_count(NLW_xpm_fifo_async_inst_wr_data_count_UNCONNECTED[0]),
        .wr_en(df_m_axis_tvalid),
        .wr_rst_busy(NLW_xpm_fifo_async_inst_wr_rst_busy_UNCONNECTED));
  (* AXIS_DATA_WIDTH = "91" *) 
  (* AXIS_FINAL_DATA_WIDTH = "91" *) 
  (* CASCADE_HEIGHT = "0" *) 
  (* CDC_SYNC_STAGES = "2" *) 
  (* CLOCKING_MODE = "0" *) 
  (* ECC_MODE = "0" *) 
  (* EN_ADV_FEATURE_AXIS = "16'b0001000000000100" *) 
  (* EN_ADV_FEATURE_AXIS_INT = "16'b0001000000000100" *) 
  (* EN_ALMOST_EMPTY_INT = "1'b0" *) 
  (* EN_ALMOST_FULL_INT = "1'b0" *) 
  (* EN_DATA_VALID_INT = "1'b1" *) 
  (* EN_SIM_ASSERT_ERR = "warning" *) 
  (* FIFO_DEPTH = "4096" *) 
  (* FIFO_MEMORY_TYPE = "0" *) 
  (* LOG_DEPTH_AXIS = "12" *) 
  (* PACKET_FIFO = "false" *) 
  (* PKT_SIZE_LT8 = "1'b0" *) 
  (* PROG_EMPTY_THRESH = "10" *) 
  (* PROG_FULL_THRESH = "10" *) 
  (* P_COMMON_CLOCK = "0" *) 
  (* P_ECC_MODE = "0" *) 
  (* P_FIFO_MEMORY_TYPE = "0" *) 
  (* P_PKT_MODE = "0" *) 
  (* RD_DATA_COUNT_WIDTH = "32" *) 
  (* RELATED_CLOCKS = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* TDATA_OFFSET = "64" *) 
  (* TDATA_WIDTH = "64" *) 
  (* TDEST_OFFSET = "82" *) 
  (* TDEST_WIDTH = "1" *) 
  (* TID_OFFSET = "81" *) 
  (* TID_WIDTH = "1" *) 
  (* TKEEP_OFFSET = "80" *) 
  (* TSTRB_OFFSET = "72" *) 
  (* TUSER_MAX_WIDTH = "4013" *) 
  (* TUSER_OFFSET = "90" *) 
  (* TUSER_WIDTH = "8" *) 
  (* USE_ADV_FEATURES = "1004" *) 
  (* USE_ADV_FEATURES_INT = "825241652" *) 
  (* WR_DATA_COUNT_WIDTH = "13" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_1_axi_video_0_3_xpm_fifo_axis xpm_fifo_axis_inst
       (.almost_empty_axis(NLW_xpm_fifo_axis_inst_almost_empty_axis_UNCONNECTED),
        .almost_full_axis(NLW_xpm_fifo_axis_inst_almost_full_axis_UNCONNECTED),
        .dbiterr_axis(NLW_xpm_fifo_axis_inst_dbiterr_axis_UNCONNECTED),
        .injectdbiterr_axis(1'b0),
        .injectsbiterr_axis(1'b0),
        .m_aclk(m00_axi_aclk),
        .m_axis_tdata(df_m_axis_tdata),
        .m_axis_tdest(NLW_xpm_fifo_axis_inst_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_xpm_fifo_axis_inst_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_xpm_fifo_axis_inst_m_axis_tkeep_UNCONNECTED[7:0]),
        .m_axis_tlast(df_m_axis_tlast),
        .m_axis_tready(xpm_fifo_axis_inst_i_3_n_0),
        .m_axis_tstrb(NLW_xpm_fifo_axis_inst_m_axis_tstrb_UNCONNECTED[7:0]),
        .m_axis_tuser(df_m_axis_tuser),
        .m_axis_tvalid(df_m_axis_tvalid),
        .prog_empty_axis(NLW_xpm_fifo_axis_inst_prog_empty_axis_UNCONNECTED),
        .prog_full_axis(NLW_xpm_fifo_axis_inst_prog_full_axis_UNCONNECTED),
        .rd_data_count_axis({xpm_fifo_axis_inst_n_109,xpm_fifo_axis_inst_n_110,xpm_fifo_axis_inst_n_111,xpm_fifo_axis_inst_n_112,xpm_fifo_axis_inst_n_113,xpm_fifo_axis_inst_n_114,xpm_fifo_axis_inst_n_115,xpm_fifo_axis_inst_n_116,xpm_fifo_axis_inst_n_117,xpm_fifo_axis_inst_n_118,xpm_fifo_axis_inst_n_119,xpm_fifo_axis_inst_n_120,xpm_fifo_axis_inst_n_121,xpm_fifo_axis_inst_n_122,xpm_fifo_axis_inst_n_123,xpm_fifo_axis_inst_n_124,xpm_fifo_axis_inst_n_125,xpm_fifo_axis_inst_n_126,xpm_fifo_axis_inst_n_127,xpm_fifo_axis_inst_n_128,xpm_fifo_axis_inst_n_129,xpm_fifo_axis_inst_n_130,xpm_fifo_axis_inst_n_131,xpm_fifo_axis_inst_n_132,xpm_fifo_axis_inst_n_133,xpm_fifo_axis_inst_n_134,xpm_fifo_axis_inst_n_135,xpm_fifo_axis_inst_n_136,xpm_fifo_axis_inst_n_137,xpm_fifo_axis_inst_n_138,xpm_fifo_axis_inst_n_139,xpm_fifo_axis_inst_n_140}),
        .s_aclk(m00_axi_aclk),
        .s_aresetn(s_aresetn),
        .s_axis_tdata(m00_axi_rdata),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tready(s_axis_tready),
        .s_axis_tstrb({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axis_tuser(m00_axi_ruser),
        .s_axis_tvalid(s_axis_tvalid),
        .sbiterr_axis(NLW_xpm_fifo_axis_inst_sbiterr_axis_UNCONNECTED),
        .wr_data_count_axis(svf_fifo_count));
  LUT1 #(
    .INIT(2'h1)) 
    xpm_fifo_axis_inst_i_3
       (.I0(full),
        .O(xpm_fifo_axis_inst_i_3_n_0));
endmodule

(* ADDR_WIDTH_A = "12" *) (* ADDR_WIDTH_B = "12" *) (* AUTO_SLEEP_TIME = "0" *) 
(* BYTE_WRITE_WIDTH_A = "91" *) (* BYTE_WRITE_WIDTH_B = "91" *) (* CASCADE_HEIGHT = "0" *) 
(* CLOCKING_MODE = "1" *) (* ECC_BIT_RANGE = "[7:0]" *) (* ECC_MODE = "0" *) 
(* ECC_TYPE = "NONE" *) (* IGNORE_INIT_SYNTH = "0" *) (* MAX_NUM_CHAR = "0" *) 
(* MEMORY_INIT_FILE = "none" *) (* MEMORY_INIT_PARAM = "" *) (* MEMORY_OPTIMIZATION = "true" *) 
(* MEMORY_PRIMITIVE = "0" *) (* MEMORY_SIZE = "372736" *) (* MEMORY_TYPE = "1" *) 
(* MESSAGE_CONTROL = "0" *) (* NUM_CHAR_LOC = "0" *) (* ORIG_REF_NAME = "xpm_memory_base" *) 
(* P_ECC_MODE = "0" *) (* P_ENABLE_BYTE_WRITE_A = "0" *) (* P_ENABLE_BYTE_WRITE_B = "0" *) 
(* P_MAX_DEPTH_DATA = "4096" *) (* P_MEMORY_OPT = "yes" *) (* P_MEMORY_PRIMITIVE = "auto" *) 
(* P_MIN_WIDTH_DATA = "91" *) (* P_MIN_WIDTH_DATA_A = "91" *) (* P_MIN_WIDTH_DATA_B = "91" *) 
(* P_MIN_WIDTH_DATA_ECC = "91" *) (* P_MIN_WIDTH_DATA_LDW = "4" *) (* P_MIN_WIDTH_DATA_SHFT = "91" *) 
(* P_NUM_COLS_WRITE_A = "1" *) (* P_NUM_COLS_WRITE_B = "1" *) (* P_NUM_ROWS_READ_A = "1" *) 
(* P_NUM_ROWS_READ_B = "1" *) (* P_NUM_ROWS_WRITE_A = "1" *) (* P_NUM_ROWS_WRITE_B = "1" *) 
(* P_SDP_WRITE_MODE = "yes" *) (* P_WIDTH_ADDR_LSB_READ_A = "0" *) (* P_WIDTH_ADDR_LSB_READ_B = "0" *) 
(* P_WIDTH_ADDR_LSB_WRITE_A = "0" *) (* P_WIDTH_ADDR_LSB_WRITE_B = "0" *) (* P_WIDTH_ADDR_READ_A = "12" *) 
(* P_WIDTH_ADDR_READ_B = "12" *) (* P_WIDTH_ADDR_WRITE_A = "12" *) (* P_WIDTH_ADDR_WRITE_B = "12" *) 
(* P_WIDTH_COL_WRITE_A = "91" *) (* P_WIDTH_COL_WRITE_B = "91" *) (* RAM_DECOMP = "auto" *) 
(* READ_DATA_WIDTH_A = "91" *) (* READ_DATA_WIDTH_B = "91" *) (* READ_LATENCY_A = "2" *) 
(* READ_LATENCY_B = "2" *) (* READ_RESET_VALUE_A = "0" *) (* READ_RESET_VALUE_B = "" *) 
(* RST_MODE_A = "SYNC" *) (* RST_MODE_B = "SYNC" *) (* SIM_ASSERT_CHK = "0" *) 
(* USE_EMBEDDED_CONSTRAINT = "0" *) (* USE_MEM_INIT = "0" *) (* USE_MEM_INIT_MMI = "0" *) 
(* VERSION = "0" *) (* WAKEUP_TIME = "0" *) (* WRITE_DATA_WIDTH_A = "91" *) 
(* WRITE_DATA_WIDTH_B = "91" *) (* WRITE_MODE_A = "2" *) (* WRITE_MODE_B = "2" *) 
(* WRITE_PROTECT = "1" *) (* XPM_MODULE = "TRUE" *) (* keep_hierarchy = "soft" *) 
(* rsta_loop_iter = "92" *) (* rstb_loop_iter = "92" *) 
module design_1_axi_video_0_3_xpm_memory_base
   (sleep,
    clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    injectsbiterra,
    injectdbiterra,
    douta,
    sbiterra,
    dbiterra,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    injectsbiterrb,
    injectdbiterrb,
    doutb,
    sbiterrb,
    dbiterrb);
  input sleep;
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [11:0]addra;
  input [90:0]dina;
  input injectsbiterra;
  input injectdbiterra;
  output [90:0]douta;
  output sbiterra;
  output dbiterra;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [11:0]addrb;
  input [90:0]dinb;
  input injectsbiterrb;
  input injectdbiterrb;
  output [90:0]doutb;
  output sbiterrb;
  output dbiterrb;

  wire \<const0> ;
  wire [11:0]addra;
  wire [11:0]addrb;
  wire clkb;
  wire [90:0]dina;
  wire [90:0]doutb;
  wire enb;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_350 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_351 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_352 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_353 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_354 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_355 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_356 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_357 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_358 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_359 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_360 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_361 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_362 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_363 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_364 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_365 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_366 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_367 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_368 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_369 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_370 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_371 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_372 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_373 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_374 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_375 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_376 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_377 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_378 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_379 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_380 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_381 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_382 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_383 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_384 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_385 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_386 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_387 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_388 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_389 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_390 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_391 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_392 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_393 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_394 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_395 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_396 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_397 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_398 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_399 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_400 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_401 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_402 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_403 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_404 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_405 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_406 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_407 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_408 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_409 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_410 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_411 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_412 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_413 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_414 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_415 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_416 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_417 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_418 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_419 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_420 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_421 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_403 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_404 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_405 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_406 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_407 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_408 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_409 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_410 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_411 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_412 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_413 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_414 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_415 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_416 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_417 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_418 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_419 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_420 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_421 ;
  wire regceb;
  wire rstb;
  wire sleep;
  wire [0:0]wea;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DBITERR_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DBITERR_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_EN_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_EN_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_RDACCESS_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_RDACCESS_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_RDB_WR_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_RDB_WR_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_SBITERR_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_SBITERR_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_DBITERR_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_DBITERR_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_RDACCESS_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_RDACCESS_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_SBITERR_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_SBITERR_B_UNCONNECTED ;
  wire [22:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_ADDR_A_UNCONNECTED ;
  wire [22:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_ADDR_B_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_BWE_A_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_BWE_B_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DIN_A_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DIN_B_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DOUT_A_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DOUT_B_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_DOUT_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DBITERR_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DBITERR_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_EN_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_EN_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_RDACCESS_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_RDACCESS_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_RDB_WR_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_RDB_WR_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_SBITERR_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_SBITERR_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DBITERR_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DBITERR_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_RDACCESS_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_RDACCESS_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_SBITERR_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_SBITERR_B_UNCONNECTED ;
  wire [22:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_ADDR_A_UNCONNECTED ;
  wire [22:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_ADDR_B_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_BWE_A_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_BWE_B_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DIN_A_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DIN_B_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DOUT_A_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DOUT_B_UNCONNECTED ;
  wire [71:19]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DOUT_A_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DOUT_B_UNCONNECTED ;

  assign dbiterra = \<const0> ;
  assign dbiterrb = \<const0> ;
  assign douta[90] = \<const0> ;
  assign douta[89] = \<const0> ;
  assign douta[88] = \<const0> ;
  assign douta[87] = \<const0> ;
  assign douta[86] = \<const0> ;
  assign douta[85] = \<const0> ;
  assign douta[84] = \<const0> ;
  assign douta[83] = \<const0> ;
  assign douta[82] = \<const0> ;
  assign douta[81] = \<const0> ;
  assign douta[80] = \<const0> ;
  assign douta[79] = \<const0> ;
  assign douta[78] = \<const0> ;
  assign douta[77] = \<const0> ;
  assign douta[76] = \<const0> ;
  assign douta[75] = \<const0> ;
  assign douta[74] = \<const0> ;
  assign douta[73] = \<const0> ;
  assign douta[72] = \<const0> ;
  assign douta[71] = \<const0> ;
  assign douta[70] = \<const0> ;
  assign douta[69] = \<const0> ;
  assign douta[68] = \<const0> ;
  assign douta[67] = \<const0> ;
  assign douta[66] = \<const0> ;
  assign douta[65] = \<const0> ;
  assign douta[64] = \<const0> ;
  assign douta[63] = \<const0> ;
  assign douta[62] = \<const0> ;
  assign douta[61] = \<const0> ;
  assign douta[60] = \<const0> ;
  assign douta[59] = \<const0> ;
  assign douta[58] = \<const0> ;
  assign douta[57] = \<const0> ;
  assign douta[56] = \<const0> ;
  assign douta[55] = \<const0> ;
  assign douta[54] = \<const0> ;
  assign douta[53] = \<const0> ;
  assign douta[52] = \<const0> ;
  assign douta[51] = \<const0> ;
  assign douta[50] = \<const0> ;
  assign douta[49] = \<const0> ;
  assign douta[48] = \<const0> ;
  assign douta[47] = \<const0> ;
  assign douta[46] = \<const0> ;
  assign douta[45] = \<const0> ;
  assign douta[44] = \<const0> ;
  assign douta[43] = \<const0> ;
  assign douta[42] = \<const0> ;
  assign douta[41] = \<const0> ;
  assign douta[40] = \<const0> ;
  assign douta[39] = \<const0> ;
  assign douta[38] = \<const0> ;
  assign douta[37] = \<const0> ;
  assign douta[36] = \<const0> ;
  assign douta[35] = \<const0> ;
  assign douta[34] = \<const0> ;
  assign douta[33] = \<const0> ;
  assign douta[32] = \<const0> ;
  assign douta[31] = \<const0> ;
  assign douta[30] = \<const0> ;
  assign douta[29] = \<const0> ;
  assign douta[28] = \<const0> ;
  assign douta[27] = \<const0> ;
  assign douta[26] = \<const0> ;
  assign douta[25] = \<const0> ;
  assign douta[24] = \<const0> ;
  assign douta[23] = \<const0> ;
  assign douta[22] = \<const0> ;
  assign douta[21] = \<const0> ;
  assign douta[20] = \<const0> ;
  assign douta[19] = \<const0> ;
  assign douta[18] = \<const0> ;
  assign douta[17] = \<const0> ;
  assign douta[16] = \<const0> ;
  assign douta[15] = \<const0> ;
  assign douta[14] = \<const0> ;
  assign douta[13] = \<const0> ;
  assign douta[12] = \<const0> ;
  assign douta[11] = \<const0> ;
  assign douta[10] = \<const0> ;
  assign douta[9] = \<const0> ;
  assign douta[8] = \<const0> ;
  assign douta[7] = \<const0> ;
  assign douta[6] = \<const0> ;
  assign douta[5] = \<const0> ;
  assign douta[4] = \<const0> ;
  assign douta[3] = \<const0> ;
  assign douta[2] = \<const0> ;
  assign douta[1] = \<const0> ;
  assign douta[0] = \<const0> ;
  assign sbiterra = \<const0> ;
  assign sbiterrb = \<const0> ;
  GND GND
       (.G(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][0] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_421 ),
        .Q(doutb[0]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][10] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_411 ),
        .Q(doutb[10]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][11] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_410 ),
        .Q(doutb[11]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][12] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_409 ),
        .Q(doutb[12]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][13] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_408 ),
        .Q(doutb[13]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][14] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_407 ),
        .Q(doutb[14]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][15] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_406 ),
        .Q(doutb[15]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][16] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_405 ),
        .Q(doutb[16]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][17] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_404 ),
        .Q(doutb[17]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][18] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_403 ),
        .Q(doutb[18]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][19] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_402 ),
        .Q(doutb[19]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][1] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_420 ),
        .Q(doutb[1]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][20] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_401 ),
        .Q(doutb[20]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][21] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_400 ),
        .Q(doutb[21]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][22] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_399 ),
        .Q(doutb[22]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][23] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_398 ),
        .Q(doutb[23]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][24] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_397 ),
        .Q(doutb[24]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][25] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_396 ),
        .Q(doutb[25]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][26] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_395 ),
        .Q(doutb[26]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][27] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_394 ),
        .Q(doutb[27]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][28] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_393 ),
        .Q(doutb[28]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][29] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_392 ),
        .Q(doutb[29]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][2] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_419 ),
        .Q(doutb[2]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][30] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_391 ),
        .Q(doutb[30]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][31] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_390 ),
        .Q(doutb[31]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][32] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_389 ),
        .Q(doutb[32]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][33] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_388 ),
        .Q(doutb[33]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][34] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_387 ),
        .Q(doutb[34]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][35] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_386 ),
        .Q(doutb[35]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][36] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_385 ),
        .Q(doutb[36]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][37] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_384 ),
        .Q(doutb[37]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][38] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_383 ),
        .Q(doutb[38]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][39] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_382 ),
        .Q(doutb[39]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][3] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_418 ),
        .Q(doutb[3]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][40] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_381 ),
        .Q(doutb[40]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][41] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_380 ),
        .Q(doutb[41]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][42] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_379 ),
        .Q(doutb[42]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][43] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_378 ),
        .Q(doutb[43]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][44] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_377 ),
        .Q(doutb[44]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][45] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_376 ),
        .Q(doutb[45]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][46] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_375 ),
        .Q(doutb[46]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][47] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_374 ),
        .Q(doutb[47]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][48] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_373 ),
        .Q(doutb[48]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][49] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_372 ),
        .Q(doutb[49]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][4] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_417 ),
        .Q(doutb[4]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][50] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_371 ),
        .Q(doutb[50]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][51] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_370 ),
        .Q(doutb[51]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][52] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_369 ),
        .Q(doutb[52]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][53] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_368 ),
        .Q(doutb[53]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][54] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_367 ),
        .Q(doutb[54]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][55] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_366 ),
        .Q(doutb[55]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][56] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_365 ),
        .Q(doutb[56]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][57] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_364 ),
        .Q(doutb[57]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][58] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_363 ),
        .Q(doutb[58]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][59] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_362 ),
        .Q(doutb[59]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][5] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_416 ),
        .Q(doutb[5]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][60] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_361 ),
        .Q(doutb[60]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][61] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_360 ),
        .Q(doutb[61]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][62] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_359 ),
        .Q(doutb[62]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][63] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_358 ),
        .Q(doutb[63]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][64] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_357 ),
        .Q(doutb[64]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][65] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_356 ),
        .Q(doutb[65]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][66] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_355 ),
        .Q(doutb[66]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][67] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_354 ),
        .Q(doutb[67]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][68] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_353 ),
        .Q(doutb[68]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][69] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_352 ),
        .Q(doutb[69]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][6] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_415 ),
        .Q(doutb[6]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][70] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_351 ),
        .Q(doutb[70]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][71] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_350 ),
        .Q(doutb[71]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][72] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_421 ),
        .Q(doutb[72]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][73] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_420 ),
        .Q(doutb[73]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][74] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_419 ),
        .Q(doutb[74]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][75] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_418 ),
        .Q(doutb[75]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][76] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_417 ),
        .Q(doutb[76]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][77] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_416 ),
        .Q(doutb[77]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][78] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_415 ),
        .Q(doutb[78]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][79] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_414 ),
        .Q(doutb[79]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][7] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_414 ),
        .Q(doutb[7]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][80] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_413 ),
        .Q(doutb[80]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][81] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_412 ),
        .Q(doutb[81]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][82] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_411 ),
        .Q(doutb[82]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][83] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_410 ),
        .Q(doutb[83]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][84] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_409 ),
        .Q(doutb[84]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][85] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_408 ),
        .Q(doutb[85]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][86] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_407 ),
        .Q(doutb[86]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][87] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_406 ),
        .Q(doutb[87]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][88] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_405 ),
        .Q(doutb[88]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][89] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_404 ),
        .Q(doutb[89]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][8] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_413 ),
        .Q(doutb[8]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][90] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_403 ),
        .Q(doutb[90]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][9] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_412 ),
        .Q(doutb[9]),
        .R(rstb));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "0" *) 
  (* \MEM.PORTA.ADDRESS_END  = "4095" *) 
  (* \MEM.PORTA.DATA_LSB  = "0" *) 
  (* \MEM.PORTA.DATA_MSB  = "71" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "0" *) 
  (* \MEM.PORTB.ADDRESS_END  = "4095" *) 
  (* \MEM.PORTB.DATA_LSB  = "0" *) 
  (* \MEM.PORTB.DATA_MSB  = "71" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "372736" *) 
  (* RTL_RAM_NAME = "xpm_memory_base/gen_wr_a.gen_word_narrow.mem_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "4095" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "71" *) 
  URAM288 #(
    .AVG_CONS_INACTIVE_CYCLES(10),
    .BWE_MODE_A("PARITY_INDEPENDENT"),
    .BWE_MODE_B("PARITY_INDEPENDENT"),
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .EN_ECC_RD_A("FALSE"),
    .EN_ECC_RD_B("FALSE"),
    .EN_ECC_WR_A("FALSE"),
    .EN_ECC_WR_B("FALSE"),
    .IREG_PRE_A("FALSE"),
    .IREG_PRE_B("FALSE"),
    .IS_CLK_INVERTED(1'b0),
    .IS_EN_A_INVERTED(1'b0),
    .IS_EN_B_INVERTED(1'b0),
    .IS_RDB_WR_A_INVERTED(1'b0),
    .IS_RDB_WR_B_INVERTED(1'b0),
    .IS_RST_A_INVERTED(1'b0),
    .IS_RST_B_INVERTED(1'b0),
    .MATRIX_ID("gen_wr_a.gen_word_narrow.mem_reg_B7_M0"),
    .NUM_UNIQUE_SELF_ADDR_A(1),
    .NUM_UNIQUE_SELF_ADDR_B(1),
    .NUM_URAM_IN_MATRIX(1),
    .OREG_A("FALSE"),
    .OREG_B("FALSE"),
    .OREG_ECC_A("FALSE"),
    .OREG_ECC_B("FALSE"),
    .REG_CAS_A("FALSE"),
    .REG_CAS_B("FALSE"),
    .RST_MODE_A("SYNC"),
    .RST_MODE_B("SYNC"),
    .SELF_ADDR_A(11'h000),
    .SELF_ADDR_B(11'h000),
    .SELF_MASK_A(11'h7FF),
    .SELF_MASK_B(11'h7FF),
    .USE_EXT_CE_A("FALSE"),
    .USE_EXT_CE_B("FALSE")) 
    \gen_wr_a.gen_word_narrow.mem_reg_uram_0 
       (.ADDR_A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addrb}),
        .ADDR_B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addra}),
        .BWE_A({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .BWE_B({wea,wea,wea,wea,wea,wea,wea,wea,wea}),
        .CAS_IN_ADDR_A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_ADDR_B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_BWE_A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_BWE_B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_DBITERR_A(1'b0),
        .CAS_IN_DBITERR_B(1'b0),
        .CAS_IN_DIN_A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_DIN_B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_DOUT_A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_DOUT_B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_EN_A(1'b0),
        .CAS_IN_EN_B(1'b0),
        .CAS_IN_RDACCESS_A(1'b0),
        .CAS_IN_RDACCESS_B(1'b0),
        .CAS_IN_RDB_WR_A(1'b0),
        .CAS_IN_RDB_WR_B(1'b0),
        .CAS_IN_SBITERR_A(1'b0),
        .CAS_IN_SBITERR_B(1'b0),
        .CAS_OUT_ADDR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_ADDR_A_UNCONNECTED [22:0]),
        .CAS_OUT_ADDR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_ADDR_B_UNCONNECTED [22:0]),
        .CAS_OUT_BWE_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_BWE_A_UNCONNECTED [8:0]),
        .CAS_OUT_BWE_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_BWE_B_UNCONNECTED [8:0]),
        .CAS_OUT_DBITERR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DBITERR_A_UNCONNECTED ),
        .CAS_OUT_DBITERR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DBITERR_B_UNCONNECTED ),
        .CAS_OUT_DIN_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DIN_A_UNCONNECTED [71:0]),
        .CAS_OUT_DIN_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DIN_B_UNCONNECTED [71:0]),
        .CAS_OUT_DOUT_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DOUT_A_UNCONNECTED [71:0]),
        .CAS_OUT_DOUT_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_DOUT_B_UNCONNECTED [71:0]),
        .CAS_OUT_EN_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_EN_A_UNCONNECTED ),
        .CAS_OUT_EN_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_EN_B_UNCONNECTED ),
        .CAS_OUT_RDACCESS_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_RDACCESS_A_UNCONNECTED ),
        .CAS_OUT_RDACCESS_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_RDACCESS_B_UNCONNECTED ),
        .CAS_OUT_RDB_WR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_RDB_WR_A_UNCONNECTED ),
        .CAS_OUT_RDB_WR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_RDB_WR_B_UNCONNECTED ),
        .CAS_OUT_SBITERR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_SBITERR_A_UNCONNECTED ),
        .CAS_OUT_SBITERR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_CAS_OUT_SBITERR_B_UNCONNECTED ),
        .CLK(clkb),
        .DBITERR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_DBITERR_A_UNCONNECTED ),
        .DBITERR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_DBITERR_B_UNCONNECTED ),
        .DIN_A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIN_B(dina[71:0]),
        .DOUT_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_350 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_351 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_352 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_353 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_354 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_355 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_356 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_357 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_358 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_359 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_360 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_361 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_362 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_363 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_364 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_365 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_366 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_367 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_368 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_369 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_370 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_371 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_372 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_373 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_374 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_375 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_376 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_377 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_378 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_379 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_380 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_381 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_382 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_383 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_384 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_385 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_386 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_387 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_388 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_389 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_390 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_391 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_392 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_393 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_394 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_395 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_396 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_397 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_398 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_399 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_400 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_401 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_402 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_403 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_404 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_405 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_406 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_407 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_408 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_409 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_410 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_411 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_412 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_413 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_414 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_415 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_416 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_417 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_418 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_419 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_420 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_421 }),
        .DOUT_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_DOUT_B_UNCONNECTED [71:0]),
        .EN_A(enb),
        .EN_B(1'b1),
        .INJECT_DBITERR_A(1'b0),
        .INJECT_DBITERR_B(1'b0),
        .INJECT_SBITERR_A(1'b0),
        .INJECT_SBITERR_B(1'b0),
        .OREG_CE_A(1'b1),
        .OREG_CE_B(1'b1),
        .OREG_ECC_CE_A(1'b1),
        .OREG_ECC_CE_B(1'b1),
        .RDACCESS_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_RDACCESS_A_UNCONNECTED ),
        .RDACCESS_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_RDACCESS_B_UNCONNECTED ),
        .RDB_WR_A(1'b0),
        .RDB_WR_B(1'b1),
        .RST_A(1'b0),
        .RST_B(1'b0),
        .SBITERR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_SBITERR_A_UNCONNECTED ),
        .SBITERR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_SBITERR_B_UNCONNECTED ),
        .SLEEP(1'b0));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "0" *) 
  (* \MEM.PORTA.ADDRESS_END  = "4095" *) 
  (* \MEM.PORTA.DATA_LSB  = "72" *) 
  (* \MEM.PORTA.DATA_MSB  = "90" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "0" *) 
  (* \MEM.PORTB.ADDRESS_END  = "4095" *) 
  (* \MEM.PORTB.DATA_LSB  = "72" *) 
  (* \MEM.PORTB.DATA_MSB  = "90" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "372736" *) 
  (* RTL_RAM_NAME = "xpm_memory_base/gen_wr_a.gen_word_narrow.mem_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "4095" *) 
  (* ram_slice_begin = "72" *) 
  (* ram_slice_end = "90" *) 
  URAM288 #(
    .AVG_CONS_INACTIVE_CYCLES(10),
    .BWE_MODE_A("PARITY_INDEPENDENT"),
    .BWE_MODE_B("PARITY_INDEPENDENT"),
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .EN_ECC_RD_A("FALSE"),
    .EN_ECC_RD_B("FALSE"),
    .EN_ECC_WR_A("FALSE"),
    .EN_ECC_WR_B("FALSE"),
    .IREG_PRE_A("FALSE"),
    .IREG_PRE_B("FALSE"),
    .IS_CLK_INVERTED(1'b0),
    .IS_EN_A_INVERTED(1'b0),
    .IS_EN_B_INVERTED(1'b0),
    .IS_RDB_WR_A_INVERTED(1'b0),
    .IS_RDB_WR_B_INVERTED(1'b0),
    .IS_RST_A_INVERTED(1'b0),
    .IS_RST_B_INVERTED(1'b0),
    .MATRIX_ID("gen_wr_a.gen_word_narrow.mem_reg_B7_M1"),
    .NUM_UNIQUE_SELF_ADDR_A(1),
    .NUM_UNIQUE_SELF_ADDR_B(1),
    .NUM_URAM_IN_MATRIX(1),
    .OREG_A("FALSE"),
    .OREG_B("FALSE"),
    .OREG_ECC_A("FALSE"),
    .OREG_ECC_B("FALSE"),
    .REG_CAS_A("FALSE"),
    .REG_CAS_B("FALSE"),
    .RST_MODE_A("SYNC"),
    .RST_MODE_B("SYNC"),
    .SELF_ADDR_A(11'h000),
    .SELF_ADDR_B(11'h000),
    .SELF_MASK_A(11'h7FF),
    .SELF_MASK_B(11'h7FF),
    .USE_EXT_CE_A("FALSE"),
    .USE_EXT_CE_B("FALSE")) 
    \gen_wr_a.gen_word_narrow.mem_reg_uram_1 
       (.ADDR_A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addrb}),
        .ADDR_B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addra}),
        .BWE_A({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .BWE_B({wea,wea,wea,wea,wea,wea,wea,wea,wea}),
        .CAS_IN_ADDR_A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_ADDR_B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_BWE_A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_BWE_B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_DBITERR_A(1'b0),
        .CAS_IN_DBITERR_B(1'b0),
        .CAS_IN_DIN_A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_DIN_B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_DOUT_A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_DOUT_B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_EN_A(1'b0),
        .CAS_IN_EN_B(1'b0),
        .CAS_IN_RDACCESS_A(1'b0),
        .CAS_IN_RDACCESS_B(1'b0),
        .CAS_IN_RDB_WR_A(1'b0),
        .CAS_IN_RDB_WR_B(1'b0),
        .CAS_IN_SBITERR_A(1'b0),
        .CAS_IN_SBITERR_B(1'b0),
        .CAS_OUT_ADDR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_ADDR_A_UNCONNECTED [22:0]),
        .CAS_OUT_ADDR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_ADDR_B_UNCONNECTED [22:0]),
        .CAS_OUT_BWE_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_BWE_A_UNCONNECTED [8:0]),
        .CAS_OUT_BWE_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_BWE_B_UNCONNECTED [8:0]),
        .CAS_OUT_DBITERR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DBITERR_A_UNCONNECTED ),
        .CAS_OUT_DBITERR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DBITERR_B_UNCONNECTED ),
        .CAS_OUT_DIN_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DIN_A_UNCONNECTED [71:0]),
        .CAS_OUT_DIN_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DIN_B_UNCONNECTED [71:0]),
        .CAS_OUT_DOUT_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DOUT_A_UNCONNECTED [71:0]),
        .CAS_OUT_DOUT_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_DOUT_B_UNCONNECTED [71:0]),
        .CAS_OUT_EN_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_EN_A_UNCONNECTED ),
        .CAS_OUT_EN_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_EN_B_UNCONNECTED ),
        .CAS_OUT_RDACCESS_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_RDACCESS_A_UNCONNECTED ),
        .CAS_OUT_RDACCESS_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_RDACCESS_B_UNCONNECTED ),
        .CAS_OUT_RDB_WR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_RDB_WR_A_UNCONNECTED ),
        .CAS_OUT_RDB_WR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_RDB_WR_B_UNCONNECTED ),
        .CAS_OUT_SBITERR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_SBITERR_A_UNCONNECTED ),
        .CAS_OUT_SBITERR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_CAS_OUT_SBITERR_B_UNCONNECTED ),
        .CLK(clkb),
        .DBITERR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DBITERR_A_UNCONNECTED ),
        .DBITERR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DBITERR_B_UNCONNECTED ),
        .DIN_A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIN_B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[90:72]}),
        .DOUT_A({\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DOUT_A_UNCONNECTED [71:19],\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_403 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_404 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_405 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_406 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_407 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_408 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_409 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_410 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_411 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_412 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_413 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_414 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_415 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_416 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_417 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_418 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_419 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_420 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_421 }),
        .DOUT_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DOUT_B_UNCONNECTED [71:0]),
        .EN_A(enb),
        .EN_B(1'b1),
        .INJECT_DBITERR_A(1'b0),
        .INJECT_DBITERR_B(1'b0),
        .INJECT_SBITERR_A(1'b0),
        .INJECT_SBITERR_B(1'b0),
        .OREG_CE_A(1'b1),
        .OREG_CE_B(1'b1),
        .OREG_ECC_CE_A(1'b1),
        .OREG_ECC_CE_B(1'b1),
        .RDACCESS_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_RDACCESS_A_UNCONNECTED ),
        .RDACCESS_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_RDACCESS_B_UNCONNECTED ),
        .RDB_WR_A(1'b0),
        .RDB_WR_B(1'b1),
        .RST_A(1'b0),
        .RST_B(1'b0),
        .SBITERR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_SBITERR_A_UNCONNECTED ),
        .SBITERR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_SBITERR_B_UNCONNECTED ),
        .SLEEP(1'b0));
endmodule

(* ADDR_WIDTH_A = "4" *) (* ADDR_WIDTH_B = "5" *) (* AUTO_SLEEP_TIME = "0" *) 
(* BYTE_WRITE_WIDTH_A = "82" *) (* BYTE_WRITE_WIDTH_B = "41" *) (* CASCADE_HEIGHT = "0" *) 
(* CLOCKING_MODE = "1" *) (* ECC_BIT_RANGE = "[7:0]" *) (* ECC_MODE = "0" *) 
(* ECC_TYPE = "NONE" *) (* IGNORE_INIT_SYNTH = "0" *) (* MAX_NUM_CHAR = "0" *) 
(* MEMORY_INIT_FILE = "none" *) (* MEMORY_INIT_PARAM = "" *) (* MEMORY_OPTIMIZATION = "true" *) 
(* MEMORY_PRIMITIVE = "0" *) (* MEMORY_SIZE = "1312" *) (* MEMORY_TYPE = "1" *) 
(* MESSAGE_CONTROL = "0" *) (* NUM_CHAR_LOC = "0" *) (* ORIG_REF_NAME = "xpm_memory_base" *) 
(* P_ECC_MODE = "0" *) (* P_ENABLE_BYTE_WRITE_A = "0" *) (* P_ENABLE_BYTE_WRITE_B = "0" *) 
(* P_MAX_DEPTH_DATA = "32" *) (* P_MEMORY_OPT = "yes" *) (* P_MEMORY_PRIMITIVE = "auto" *) 
(* P_MIN_WIDTH_DATA = "41" *) (* P_MIN_WIDTH_DATA_A = "82" *) (* P_MIN_WIDTH_DATA_B = "41" *) 
(* P_MIN_WIDTH_DATA_ECC = "41" *) (* P_MIN_WIDTH_DATA_LDW = "4" *) (* P_MIN_WIDTH_DATA_SHFT = "41" *) 
(* P_NUM_COLS_WRITE_A = "1" *) (* P_NUM_COLS_WRITE_B = "1" *) (* P_NUM_ROWS_READ_A = "2" *) 
(* P_NUM_ROWS_READ_B = "1" *) (* P_NUM_ROWS_WRITE_A = "2" *) (* P_NUM_ROWS_WRITE_B = "1" *) 
(* P_SDP_WRITE_MODE = "yes" *) (* P_WIDTH_ADDR_LSB_READ_A = "1" *) (* P_WIDTH_ADDR_LSB_READ_B = "0" *) 
(* P_WIDTH_ADDR_LSB_WRITE_A = "1" *) (* P_WIDTH_ADDR_LSB_WRITE_B = "0" *) (* P_WIDTH_ADDR_READ_A = "4" *) 
(* P_WIDTH_ADDR_READ_B = "5" *) (* P_WIDTH_ADDR_WRITE_A = "4" *) (* P_WIDTH_ADDR_WRITE_B = "5" *) 
(* P_WIDTH_COL_WRITE_A = "41" *) (* P_WIDTH_COL_WRITE_B = "41" *) (* RAM_DECOMP = "auto" *) 
(* READ_DATA_WIDTH_A = "82" *) (* READ_DATA_WIDTH_B = "41" *) (* READ_LATENCY_A = "2" *) 
(* READ_LATENCY_B = "2" *) (* READ_RESET_VALUE_A = "0" *) (* READ_RESET_VALUE_B = "0" *) 
(* RST_MODE_A = "SYNC" *) (* RST_MODE_B = "SYNC" *) (* SIM_ASSERT_CHK = "0" *) 
(* USE_EMBEDDED_CONSTRAINT = "0" *) (* USE_MEM_INIT = "0" *) (* USE_MEM_INIT_MMI = "0" *) 
(* VERSION = "0" *) (* WAKEUP_TIME = "0" *) (* WRITE_DATA_WIDTH_A = "82" *) 
(* WRITE_DATA_WIDTH_B = "41" *) (* WRITE_MODE_A = "2" *) (* WRITE_MODE_B = "2" *) 
(* WRITE_PROTECT = "1" *) (* XPM_MODULE = "TRUE" *) (* keep_hierarchy = "soft" *) 
(* rsta_loop_iter = "84" *) (* rstb_loop_iter = "44" *) 
module design_1_axi_video_0_3_xpm_memory_base__parameterized0
   (sleep,
    clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    injectsbiterra,
    injectdbiterra,
    douta,
    sbiterra,
    dbiterra,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    injectsbiterrb,
    injectdbiterrb,
    doutb,
    sbiterrb,
    dbiterrb);
  input sleep;
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [3:0]addra;
  input [81:0]dina;
  input injectsbiterra;
  input injectdbiterra;
  output [81:0]douta;
  output sbiterra;
  output dbiterra;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [4:0]addrb;
  input [40:0]dinb;
  input injectsbiterrb;
  input injectdbiterrb;
  output [40:0]doutb;
  output sbiterrb;
  output dbiterrb;

  wire \<const0> ;
  wire [3:0]addra;
  wire [4:0]addrb;
  wire clka;
  wire clkb;
  wire [81:0]dina;
  wire [40:0]doutb;
  wire ena;
  wire enb;
  wire \gen_wr_a.gen_word_wide.mem_reg_bram_1_n_43 ;
  wire \gen_wr_a.gen_word_wide.mem_reg_bram_1_n_44 ;
  wire \gen_wr_a.gen_word_wide.mem_reg_bram_1_n_45 ;
  wire \gen_wr_a.gen_word_wide.mem_reg_bram_1_n_46 ;
  wire \gen_wr_a.gen_word_wide.mem_reg_bram_1_n_47 ;
  wire regceb;
  wire rstb;
  wire sleep;
  wire \NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_CASOUTDBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_CASOUTSBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_CASDOUTA_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_CASDOUTPA_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_CASDOUTPB_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_RDADDRECC_UNCONNECTED ;
  wire [15:0]\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_1_CASDOUTA_UNCONNECTED ;
  wire [15:0]\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_1_CASDOUTB_UNCONNECTED ;
  wire [1:0]\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_1_CASDOUTPA_UNCONNECTED ;
  wire [1:0]\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_1_CASDOUTPB_UNCONNECTED ;
  wire [15:5]\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_1_DOUTADOUT_UNCONNECTED ;
  wire [15:0]\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_1_DOUTBDOUT_UNCONNECTED ;
  wire [1:0]\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_1_DOUTPADOUTP_UNCONNECTED ;
  wire [1:0]\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_1_DOUTPBDOUTP_UNCONNECTED ;

  assign dbiterra = \<const0> ;
  assign dbiterrb = \<const0> ;
  assign douta[81] = \<const0> ;
  assign douta[80] = \<const0> ;
  assign douta[79] = \<const0> ;
  assign douta[78] = \<const0> ;
  assign douta[77] = \<const0> ;
  assign douta[76] = \<const0> ;
  assign douta[75] = \<const0> ;
  assign douta[74] = \<const0> ;
  assign douta[73] = \<const0> ;
  assign douta[72] = \<const0> ;
  assign douta[71] = \<const0> ;
  assign douta[70] = \<const0> ;
  assign douta[69] = \<const0> ;
  assign douta[68] = \<const0> ;
  assign douta[67] = \<const0> ;
  assign douta[66] = \<const0> ;
  assign douta[65] = \<const0> ;
  assign douta[64] = \<const0> ;
  assign douta[63] = \<const0> ;
  assign douta[62] = \<const0> ;
  assign douta[61] = \<const0> ;
  assign douta[60] = \<const0> ;
  assign douta[59] = \<const0> ;
  assign douta[58] = \<const0> ;
  assign douta[57] = \<const0> ;
  assign douta[56] = \<const0> ;
  assign douta[55] = \<const0> ;
  assign douta[54] = \<const0> ;
  assign douta[53] = \<const0> ;
  assign douta[52] = \<const0> ;
  assign douta[51] = \<const0> ;
  assign douta[50] = \<const0> ;
  assign douta[49] = \<const0> ;
  assign douta[48] = \<const0> ;
  assign douta[47] = \<const0> ;
  assign douta[46] = \<const0> ;
  assign douta[45] = \<const0> ;
  assign douta[44] = \<const0> ;
  assign douta[43] = \<const0> ;
  assign douta[42] = \<const0> ;
  assign douta[41] = \<const0> ;
  assign douta[40] = \<const0> ;
  assign douta[39] = \<const0> ;
  assign douta[38] = \<const0> ;
  assign douta[37] = \<const0> ;
  assign douta[36] = \<const0> ;
  assign douta[35] = \<const0> ;
  assign douta[34] = \<const0> ;
  assign douta[33] = \<const0> ;
  assign douta[32] = \<const0> ;
  assign douta[31] = \<const0> ;
  assign douta[30] = \<const0> ;
  assign douta[29] = \<const0> ;
  assign douta[28] = \<const0> ;
  assign douta[27] = \<const0> ;
  assign douta[26] = \<const0> ;
  assign douta[25] = \<const0> ;
  assign douta[24] = \<const0> ;
  assign douta[23] = \<const0> ;
  assign douta[22] = \<const0> ;
  assign douta[21] = \<const0> ;
  assign douta[20] = \<const0> ;
  assign douta[19] = \<const0> ;
  assign douta[18] = \<const0> ;
  assign douta[17] = \<const0> ;
  assign douta[16] = \<const0> ;
  assign douta[15] = \<const0> ;
  assign douta[14] = \<const0> ;
  assign douta[13] = \<const0> ;
  assign douta[12] = \<const0> ;
  assign douta[11] = \<const0> ;
  assign douta[10] = \<const0> ;
  assign douta[9] = \<const0> ;
  assign douta[8] = \<const0> ;
  assign douta[7] = \<const0> ;
  assign douta[6] = \<const0> ;
  assign douta[5] = \<const0> ;
  assign douta[4] = \<const0> ;
  assign douta[3] = \<const0> ;
  assign douta[2] = \<const0> ;
  assign douta[1] = \<const0> ;
  assign douta[0] = \<const0> ;
  assign sbiterra = \<const0> ;
  assign sbiterrb = \<const0> ;
  GND GND
       (.G(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][36] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_wide.mem_reg_bram_1_n_47 ),
        .Q(doutb[36]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][37] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_wide.mem_reg_bram_1_n_46 ),
        .Q(doutb[37]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][38] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_wide.mem_reg_bram_1_n_45 ),
        .Q(doutb[38]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][39] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_wide.mem_reg_bram_1_n_44 ),
        .Q(doutb[39]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][40] 
       (.C(clkb),
        .CE(regceb),
        .D(\gen_wr_a.gen_word_wide.mem_reg_bram_1_n_43 ),
        .Q(doutb[40]),
        .R(rstb));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "0" *) 
  (* \MEM.PORTA.ADDRESS_END  = "31" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTA.DATA_LSB  = "0" *) 
  (* \MEM.PORTA.DATA_MSB  = "35" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "0" *) 
  (* \MEM.PORTB.ADDRESS_END  = "15" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p4_d32_p4_d32" *) 
  (* \MEM.PORTB.DATA_LSB  = "0" *) 
  (* \MEM.PORTB.DATA_MSB  = "71" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1312" *) 
  (* RTL_RAM_NAME = "xpm_memory_base/gen_wr_a.gen_word_wide.mem_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_aspect_ratio = "2" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "35" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(1),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("TRUE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("NO_CHANGE"),
    .WRITE_MODE_B("NO_CHANGE"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    \gen_wr_a.gen_word_wide.mem_reg_bram_0 
       (.ADDRARDADDR({1'b0,1'b0,1'b0,1'b0,1'b0,addrb,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,addra,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b0),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB(\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_CASDOUTB_UNCONNECTED [31:0]),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB(\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_CASDOUTPB_UNCONNECTED [3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_CASOUTDBITERR_UNCONNECTED ),
        .CASOUTSBITERR(\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_CASOUTSBITERR_UNCONNECTED ),
        .CLKARDCLK(clkb),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_DBITERR_UNCONNECTED ),
        .DINADIN(dina[31:0]),
        .DINBDIN(dina[72:41]),
        .DINPADINP(dina[35:32]),
        .DINPBDINP(dina[76:73]),
        .DOUTADOUT(doutb[31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(doutb[35:32]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(enb),
        .ENBWREN(ena),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(regceb),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(rstb),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_0_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({ena,ena,ena,ena,ena,ena,ena,ena}));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "0" *) 
  (* \MEM.PORTA.ADDRESS_END  = "31" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d5" *) 
  (* \MEM.PORTA.DATA_LSB  = "36" *) 
  (* \MEM.PORTA.DATA_MSB  = "40" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "0" *) 
  (* \MEM.PORTB.ADDRESS_END  = "15" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d10" *) 
  (* \MEM.PORTB.DATA_LSB  = "72" *) 
  (* \MEM.PORTB.DATA_MSB  = "81" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1312" *) 
  (* RTL_RAM_NAME = "xpm_memory_base/gen_wr_a.gen_word_wide.mem_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_aspect_ratio = "2" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "36" *) 
  (* ram_slice_end = "40" *) 
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("TRUE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("NO_CHANGE"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(18)) 
    \gen_wr_a.gen_word_wide.mem_reg_bram_1 
       (.ADDRARDADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addrb,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addra,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_1_CASDOUTA_UNCONNECTED [15:0]),
        .CASDOUTB(\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_1_CASDOUTB_UNCONNECTED [15:0]),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_1_CASDOUTPA_UNCONNECTED [1:0]),
        .CASDOUTPB(\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_1_CASDOUTPB_UNCONNECTED [1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(clkb),
        .CLKBWRCLK(clka),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINBDIN({1'b0,1'b0,1'b0,dina[81:77],1'b0,1'b0,1'b0,dina[40:36]}),
        .DINPADINP({1'b0,1'b0}),
        .DINPBDINP({1'b0,1'b0}),
        .DOUTADOUT({\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_1_DOUTADOUT_UNCONNECTED [15:5],\gen_wr_a.gen_word_wide.mem_reg_bram_1_n_43 ,\gen_wr_a.gen_word_wide.mem_reg_bram_1_n_44 ,\gen_wr_a.gen_word_wide.mem_reg_bram_1_n_45 ,\gen_wr_a.gen_word_wide.mem_reg_bram_1_n_46 ,\gen_wr_a.gen_word_wide.mem_reg_bram_1_n_47 }),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_1_DOUTBDOUT_UNCONNECTED [15:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_1_DOUTPADOUTP_UNCONNECTED [1:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_wide.mem_reg_bram_1_DOUTPBDOUTP_UNCONNECTED [1:0]),
        .ENARDEN(enb),
        .ENBWREN(ena),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,ena,ena}));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
