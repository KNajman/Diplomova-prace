// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Thu Jul  2 13:06:10 2026
// Host        : N166A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_hls_passthrough_0_0_sim_netlist.v
// Design      : design_1_hls_passthrough_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xck26-sfvc784-2LV-c
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_hls_passthrough_0_0,hls_passthrough,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "HLS" *) 
(* x_core_info = "hls_passthrough,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (s_axi_control_ARADDR,
    s_axi_control_ARREADY,
    s_axi_control_ARVALID,
    s_axi_control_AWADDR,
    s_axi_control_AWREADY,
    s_axi_control_AWVALID,
    s_axi_control_BREADY,
    s_axi_control_BRESP,
    s_axi_control_BVALID,
    s_axi_control_RDATA,
    s_axi_control_RREADY,
    s_axi_control_RRESP,
    s_axi_control_RVALID,
    s_axi_control_WDATA,
    s_axi_control_WREADY,
    s_axi_control_WSTRB,
    s_axi_control_WVALID,
    ap_clk,
    ap_rst_n,
    interrupt,
    in_stream_TDATA,
    in_stream_TKEEP,
    in_stream_TLAST,
    in_stream_TREADY,
    in_stream_TSTRB,
    in_stream_TUSER,
    in_stream_TVALID,
    out_stream_TDATA,
    out_stream_TKEEP,
    out_stream_TLAST,
    out_stream_TREADY,
    out_stream_TSTRB,
    out_stream_TUSER,
    out_stream_TVALID);
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR" *) (* x_interface_mode = "slave s_axi_control" *) (* x_interface_parameter = "XIL_INTERFACENAME s_axi_control, ADDR_WIDTH 5, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, FREQ_HZ 99999001, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [4:0]s_axi_control_ARADDR;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY" *) output s_axi_control_ARREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID" *) input s_axi_control_ARVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR" *) input [4:0]s_axi_control_AWADDR;
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* x_interface_mode = "slave ap_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_control:in_stream:out_stream, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *) input ap_clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *) (* x_interface_mode = "slave ap_rst_n" *) (* x_interface_parameter = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input ap_rst_n;
  (* x_interface_info = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *) (* x_interface_mode = "master interrupt" *) (* x_interface_parameter = "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1" *) output interrupt;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 in_stream TDATA" *) (* x_interface_mode = "slave in_stream" *) (* x_interface_parameter = "XIL_INTERFACENAME in_stream, TUSER_WIDTH 1, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *) input [31:0]in_stream_TDATA;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 in_stream TKEEP" *) input [3:0]in_stream_TKEEP;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 in_stream TLAST" *) input [0:0]in_stream_TLAST;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 in_stream TREADY" *) output in_stream_TREADY;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 in_stream TSTRB" *) input [3:0]in_stream_TSTRB;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 in_stream TUSER" *) input [0:0]in_stream_TUSER;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 in_stream TVALID" *) input in_stream_TVALID;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 out_stream TDATA" *) (* x_interface_mode = "master out_stream" *) (* x_interface_parameter = "XIL_INTERFACENAME out_stream, TUSER_WIDTH 1, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *) output [31:0]out_stream_TDATA;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 out_stream TKEEP" *) output [3:0]out_stream_TKEEP;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 out_stream TLAST" *) output [0:0]out_stream_TLAST;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 out_stream TREADY" *) input out_stream_TREADY;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 out_stream TSTRB" *) output [3:0]out_stream_TSTRB;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 out_stream TUSER" *) output [0:0]out_stream_TUSER;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 out_stream TVALID" *) output out_stream_TVALID;

  wire \<const0> ;
  wire ap_clk;
  wire ap_rst_n;
  wire [31:0]in_stream_TDATA;
  wire [3:0]in_stream_TKEEP;
  wire [0:0]in_stream_TLAST;
  wire in_stream_TREADY;
  wire [3:0]in_stream_TSTRB;
  wire [0:0]in_stream_TUSER;
  wire in_stream_TVALID;
  wire interrupt;
  wire [31:0]out_stream_TDATA;
  wire [3:0]out_stream_TKEEP;
  wire [0:0]out_stream_TLAST;
  wire out_stream_TREADY;
  wire [3:0]out_stream_TSTRB;
  wire [0:0]out_stream_TUSER;
  wire out_stream_TVALID;
  wire [4:0]s_axi_control_ARADDR;
  wire s_axi_control_ARREADY;
  wire s_axi_control_ARVALID;
  wire [4:0]s_axi_control_AWADDR;
  wire s_axi_control_AWREADY;
  wire s_axi_control_AWVALID;
  wire s_axi_control_BREADY;
  wire s_axi_control_BVALID;
  wire [31:0]s_axi_control_RDATA;
  wire s_axi_control_RREADY;
  wire s_axi_control_RVALID;
  wire [31:0]s_axi_control_WDATA;
  wire s_axi_control_WREADY;
  wire [3:0]s_axi_control_WSTRB;
  wire s_axi_control_WVALID;
  wire [1:0]NLW_U0_s_axi_control_BRESP_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_control_RRESP_UNCONNECTED;

  assign s_axi_control_BRESP[1] = \<const0> ;
  assign s_axi_control_BRESP[0] = \<const0> ;
  assign s_axi_control_RRESP[1] = \<const0> ;
  assign s_axi_control_RRESP[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_S_AXI_CONTROL_ADDR_WIDTH = "5" *) 
  (* C_S_AXI_CONTROL_DATA_WIDTH = "32" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* sdx_kernel = "true" *) 
  (* sdx_kernel_synth_inst = "U0" *) 
  (* sdx_kernel_type = "hls" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough U0
       (.ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .in_stream_TDATA(in_stream_TDATA),
        .in_stream_TKEEP(in_stream_TKEEP),
        .in_stream_TLAST(in_stream_TLAST),
        .in_stream_TREADY(in_stream_TREADY),
        .in_stream_TSTRB(in_stream_TSTRB),
        .in_stream_TUSER(in_stream_TUSER),
        .in_stream_TVALID(in_stream_TVALID),
        .interrupt(interrupt),
        .out_stream_TDATA(out_stream_TDATA),
        .out_stream_TKEEP(out_stream_TKEEP),
        .out_stream_TLAST(out_stream_TLAST),
        .out_stream_TREADY(out_stream_TREADY),
        .out_stream_TSTRB(out_stream_TSTRB),
        .out_stream_TUSER(out_stream_TUSER),
        .out_stream_TVALID(out_stream_TVALID),
        .s_axi_control_ARADDR(s_axi_control_ARADDR),
        .s_axi_control_ARREADY(s_axi_control_ARREADY),
        .s_axi_control_ARVALID(s_axi_control_ARVALID),
        .s_axi_control_AWADDR({s_axi_control_AWADDR[4:2],1'b0,1'b0}),
        .s_axi_control_AWREADY(s_axi_control_AWREADY),
        .s_axi_control_AWVALID(s_axi_control_AWVALID),
        .s_axi_control_BREADY(s_axi_control_BREADY),
        .s_axi_control_BRESP(NLW_U0_s_axi_control_BRESP_UNCONNECTED[1:0]),
        .s_axi_control_BVALID(s_axi_control_BVALID),
        .s_axi_control_RDATA(s_axi_control_RDATA),
        .s_axi_control_RREADY(s_axi_control_RREADY),
        .s_axi_control_RRESP(NLW_U0_s_axi_control_RRESP_UNCONNECTED[1:0]),
        .s_axi_control_RVALID(s_axi_control_RVALID),
        .s_axi_control_WDATA(s_axi_control_WDATA),
        .s_axi_control_WREADY(s_axi_control_WREADY),
        .s_axi_control_WSTRB(s_axi_control_WSTRB),
        .s_axi_control_WVALID(s_axi_control_WVALID));
endmodule

(* C_S_AXI_CONTROL_ADDR_WIDTH = "5" *) (* C_S_AXI_CONTROL_DATA_WIDTH = "32" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough
   (ap_clk,
    ap_rst_n,
    in_stream_TDATA,
    in_stream_TVALID,
    in_stream_TREADY,
    in_stream_TKEEP,
    in_stream_TSTRB,
    in_stream_TUSER,
    in_stream_TLAST,
    out_stream_TDATA,
    out_stream_TVALID,
    out_stream_TREADY,
    out_stream_TKEEP,
    out_stream_TSTRB,
    out_stream_TUSER,
    out_stream_TLAST,
    s_axi_control_AWVALID,
    s_axi_control_AWREADY,
    s_axi_control_AWADDR,
    s_axi_control_WVALID,
    s_axi_control_WREADY,
    s_axi_control_WDATA,
    s_axi_control_WSTRB,
    s_axi_control_ARVALID,
    s_axi_control_ARREADY,
    s_axi_control_ARADDR,
    s_axi_control_RVALID,
    s_axi_control_RREADY,
    s_axi_control_RDATA,
    s_axi_control_RRESP,
    s_axi_control_BVALID,
    s_axi_control_BREADY,
    s_axi_control_BRESP,
    interrupt);
  input ap_clk;
  input ap_rst_n;
  input [31:0]in_stream_TDATA;
  input in_stream_TVALID;
  output in_stream_TREADY;
  input [3:0]in_stream_TKEEP;
  input [3:0]in_stream_TSTRB;
  input [0:0]in_stream_TUSER;
  input [0:0]in_stream_TLAST;
  output [31:0]out_stream_TDATA;
  output out_stream_TVALID;
  input out_stream_TREADY;
  output [3:0]out_stream_TKEEP;
  output [3:0]out_stream_TSTRB;
  output [0:0]out_stream_TUSER;
  output [0:0]out_stream_TLAST;
  input s_axi_control_AWVALID;
  output s_axi_control_AWREADY;
  input [4:0]s_axi_control_AWADDR;
  input s_axi_control_WVALID;
  output s_axi_control_WREADY;
  input [31:0]s_axi_control_WDATA;
  input [3:0]s_axi_control_WSTRB;
  input s_axi_control_ARVALID;
  output s_axi_control_ARREADY;
  input [4:0]s_axi_control_ARADDR;
  output s_axi_control_RVALID;
  input s_axi_control_RREADY;
  output [31:0]s_axi_control_RDATA;
  output [1:0]s_axi_control_RRESP;
  output s_axi_control_BVALID;
  input s_axi_control_BREADY;
  output [1:0]s_axi_control_BRESP;
  output interrupt;

  wire \<const0> ;
  wire ack_in;
  wire \ap_CS_fsm_reg_n_0_[0] ;
  wire ap_CS_fsm_state2;
  wire ap_CS_fsm_state3;
  wire ap_CS_fsm_state4;
  wire [3:0]ap_NS_fsm;
  wire ap_clk;
  wire ap_rst;
  wire ap_rst_n;
  wire ap_start;
  wire control_s_axi_U_n_42;
  wire control_s_axi_U_n_43;
  wire control_s_axi_U_n_44;
  wire control_s_axi_U_n_45;
  wire control_s_axi_U_n_46;
  wire control_s_axi_U_n_47;
  wire control_s_axi_U_n_48;
  wire control_s_axi_U_n_49;
  wire control_s_axi_U_n_50;
  wire control_s_axi_U_n_51;
  wire control_s_axi_U_n_52;
  wire control_s_axi_U_n_53;
  wire control_s_axi_U_n_54;
  wire control_s_axi_U_n_55;
  wire control_s_axi_U_n_56;
  wire control_s_axi_U_n_57;
  wire control_s_axi_U_n_58;
  wire control_s_axi_U_n_59;
  wire control_s_axi_U_n_60;
  wire control_s_axi_U_n_61;
  wire control_s_axi_U_n_62;
  wire control_s_axi_U_n_63;
  wire control_s_axi_U_n_64;
  wire control_s_axi_U_n_65;
  wire control_s_axi_U_n_66;
  wire control_s_axi_U_n_67;
  wire control_s_axi_U_n_68;
  wire control_s_axi_U_n_69;
  wire control_s_axi_U_n_70;
  wire control_s_axi_U_n_71;
  wire control_s_axi_U_n_72;
  wire [31:0]data_in;
  wire grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_ap_start_reg_reg_n_0;
  wire grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_0;
  wire grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_10;
  wire grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_11;
  wire grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_12;
  wire grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_13;
  wire grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_7;
  wire grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_8;
  wire grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_9;
  wire [31:0]in_stream_TDATA;
  wire [3:0]in_stream_TKEEP;
  wire [3:0]in_stream_TKEEP_int_regslice;
  wire [0:0]in_stream_TLAST;
  wire [0:0]in_stream_TLAST_int_regslice;
  wire in_stream_TREADY;
  wire [3:0]in_stream_TSTRB;
  wire [3:0]in_stream_TSTRB_int_regslice;
  wire [0:0]in_stream_TUSER;
  wire [0:0]in_stream_TUSER_int_regslice;
  wire in_stream_TVALID;
  wire in_stream_TVALID_int_regslice;
  wire indvar_flatten_fu_602;
  wire int_height;
  wire interrupt;
  wire load_p2;
  wire load_p2_0;
  wire load_p2_1;
  wire mul_32ns_31ns_62_1_1_U12_n_0;
  wire mul_32ns_31ns_62_1_1_U12_n_1;
  wire mul_32ns_31ns_62_1_1_U12_n_10;
  wire mul_32ns_31ns_62_1_1_U12_n_100;
  wire mul_32ns_31ns_62_1_1_U12_n_101;
  wire mul_32ns_31ns_62_1_1_U12_n_102;
  wire mul_32ns_31ns_62_1_1_U12_n_103;
  wire mul_32ns_31ns_62_1_1_U12_n_104;
  wire mul_32ns_31ns_62_1_1_U12_n_105;
  wire mul_32ns_31ns_62_1_1_U12_n_106;
  wire mul_32ns_31ns_62_1_1_U12_n_107;
  wire mul_32ns_31ns_62_1_1_U12_n_108;
  wire mul_32ns_31ns_62_1_1_U12_n_109;
  wire mul_32ns_31ns_62_1_1_U12_n_11;
  wire mul_32ns_31ns_62_1_1_U12_n_110;
  wire mul_32ns_31ns_62_1_1_U12_n_111;
  wire mul_32ns_31ns_62_1_1_U12_n_112;
  wire mul_32ns_31ns_62_1_1_U12_n_113;
  wire mul_32ns_31ns_62_1_1_U12_n_114;
  wire mul_32ns_31ns_62_1_1_U12_n_115;
  wire mul_32ns_31ns_62_1_1_U12_n_116;
  wire mul_32ns_31ns_62_1_1_U12_n_117;
  wire mul_32ns_31ns_62_1_1_U12_n_118;
  wire mul_32ns_31ns_62_1_1_U12_n_119;
  wire mul_32ns_31ns_62_1_1_U12_n_12;
  wire mul_32ns_31ns_62_1_1_U12_n_120;
  wire mul_32ns_31ns_62_1_1_U12_n_121;
  wire mul_32ns_31ns_62_1_1_U12_n_122;
  wire mul_32ns_31ns_62_1_1_U12_n_123;
  wire mul_32ns_31ns_62_1_1_U12_n_124;
  wire mul_32ns_31ns_62_1_1_U12_n_125;
  wire mul_32ns_31ns_62_1_1_U12_n_126;
  wire mul_32ns_31ns_62_1_1_U12_n_127;
  wire mul_32ns_31ns_62_1_1_U12_n_128;
  wire mul_32ns_31ns_62_1_1_U12_n_129;
  wire mul_32ns_31ns_62_1_1_U12_n_13;
  wire mul_32ns_31ns_62_1_1_U12_n_14;
  wire mul_32ns_31ns_62_1_1_U12_n_15;
  wire mul_32ns_31ns_62_1_1_U12_n_16;
  wire mul_32ns_31ns_62_1_1_U12_n_17;
  wire mul_32ns_31ns_62_1_1_U12_n_18;
  wire mul_32ns_31ns_62_1_1_U12_n_19;
  wire mul_32ns_31ns_62_1_1_U12_n_2;
  wire mul_32ns_31ns_62_1_1_U12_n_20;
  wire mul_32ns_31ns_62_1_1_U12_n_21;
  wire mul_32ns_31ns_62_1_1_U12_n_22;
  wire mul_32ns_31ns_62_1_1_U12_n_23;
  wire mul_32ns_31ns_62_1_1_U12_n_24;
  wire mul_32ns_31ns_62_1_1_U12_n_25;
  wire mul_32ns_31ns_62_1_1_U12_n_26;
  wire mul_32ns_31ns_62_1_1_U12_n_27;
  wire mul_32ns_31ns_62_1_1_U12_n_28;
  wire mul_32ns_31ns_62_1_1_U12_n_29;
  wire mul_32ns_31ns_62_1_1_U12_n_3;
  wire mul_32ns_31ns_62_1_1_U12_n_30;
  wire mul_32ns_31ns_62_1_1_U12_n_31;
  wire mul_32ns_31ns_62_1_1_U12_n_32;
  wire mul_32ns_31ns_62_1_1_U12_n_33;
  wire mul_32ns_31ns_62_1_1_U12_n_34;
  wire mul_32ns_31ns_62_1_1_U12_n_35;
  wire mul_32ns_31ns_62_1_1_U12_n_36;
  wire mul_32ns_31ns_62_1_1_U12_n_37;
  wire mul_32ns_31ns_62_1_1_U12_n_38;
  wire mul_32ns_31ns_62_1_1_U12_n_39;
  wire mul_32ns_31ns_62_1_1_U12_n_4;
  wire mul_32ns_31ns_62_1_1_U12_n_40;
  wire mul_32ns_31ns_62_1_1_U12_n_41;
  wire mul_32ns_31ns_62_1_1_U12_n_42;
  wire mul_32ns_31ns_62_1_1_U12_n_43;
  wire mul_32ns_31ns_62_1_1_U12_n_44;
  wire mul_32ns_31ns_62_1_1_U12_n_45;
  wire mul_32ns_31ns_62_1_1_U12_n_46;
  wire mul_32ns_31ns_62_1_1_U12_n_47;
  wire mul_32ns_31ns_62_1_1_U12_n_48;
  wire mul_32ns_31ns_62_1_1_U12_n_49;
  wire mul_32ns_31ns_62_1_1_U12_n_5;
  wire mul_32ns_31ns_62_1_1_U12_n_50;
  wire mul_32ns_31ns_62_1_1_U12_n_51;
  wire mul_32ns_31ns_62_1_1_U12_n_52;
  wire mul_32ns_31ns_62_1_1_U12_n_53;
  wire mul_32ns_31ns_62_1_1_U12_n_54;
  wire mul_32ns_31ns_62_1_1_U12_n_55;
  wire mul_32ns_31ns_62_1_1_U12_n_56;
  wire mul_32ns_31ns_62_1_1_U12_n_57;
  wire mul_32ns_31ns_62_1_1_U12_n_58;
  wire mul_32ns_31ns_62_1_1_U12_n_59;
  wire mul_32ns_31ns_62_1_1_U12_n_6;
  wire mul_32ns_31ns_62_1_1_U12_n_60;
  wire mul_32ns_31ns_62_1_1_U12_n_61;
  wire mul_32ns_31ns_62_1_1_U12_n_62;
  wire mul_32ns_31ns_62_1_1_U12_n_63;
  wire mul_32ns_31ns_62_1_1_U12_n_64;
  wire mul_32ns_31ns_62_1_1_U12_n_65;
  wire mul_32ns_31ns_62_1_1_U12_n_66;
  wire mul_32ns_31ns_62_1_1_U12_n_67;
  wire mul_32ns_31ns_62_1_1_U12_n_68;
  wire mul_32ns_31ns_62_1_1_U12_n_69;
  wire mul_32ns_31ns_62_1_1_U12_n_7;
  wire mul_32ns_31ns_62_1_1_U12_n_70;
  wire mul_32ns_31ns_62_1_1_U12_n_71;
  wire mul_32ns_31ns_62_1_1_U12_n_72;
  wire mul_32ns_31ns_62_1_1_U12_n_73;
  wire mul_32ns_31ns_62_1_1_U12_n_74;
  wire mul_32ns_31ns_62_1_1_U12_n_75;
  wire mul_32ns_31ns_62_1_1_U12_n_76;
  wire mul_32ns_31ns_62_1_1_U12_n_77;
  wire mul_32ns_31ns_62_1_1_U12_n_78;
  wire mul_32ns_31ns_62_1_1_U12_n_79;
  wire mul_32ns_31ns_62_1_1_U12_n_8;
  wire mul_32ns_31ns_62_1_1_U12_n_80;
  wire mul_32ns_31ns_62_1_1_U12_n_81;
  wire mul_32ns_31ns_62_1_1_U12_n_82;
  wire mul_32ns_31ns_62_1_1_U12_n_83;
  wire mul_32ns_31ns_62_1_1_U12_n_84;
  wire mul_32ns_31ns_62_1_1_U12_n_85;
  wire mul_32ns_31ns_62_1_1_U12_n_86;
  wire mul_32ns_31ns_62_1_1_U12_n_87;
  wire mul_32ns_31ns_62_1_1_U12_n_88;
  wire mul_32ns_31ns_62_1_1_U12_n_89;
  wire mul_32ns_31ns_62_1_1_U12_n_9;
  wire mul_32ns_31ns_62_1_1_U12_n_90;
  wire mul_32ns_31ns_62_1_1_U12_n_91;
  wire mul_32ns_31ns_62_1_1_U12_n_92;
  wire mul_32ns_31ns_62_1_1_U12_n_93;
  wire mul_32ns_31ns_62_1_1_U12_n_94;
  wire mul_32ns_31ns_62_1_1_U12_n_95;
  wire mul_32ns_31ns_62_1_1_U12_n_96;
  wire mul_32ns_31ns_62_1_1_U12_n_97;
  wire mul_32ns_31ns_62_1_1_U12_n_98;
  wire mul_32ns_31ns_62_1_1_U12_n_99;
  wire \mul_ln9_reg_138_reg[0]__0_n_0 ;
  wire \mul_ln9_reg_138_reg[10]__0_n_0 ;
  wire \mul_ln9_reg_138_reg[11]__0_n_0 ;
  wire \mul_ln9_reg_138_reg[12]__0_n_0 ;
  wire \mul_ln9_reg_138_reg[13]__0_n_0 ;
  wire \mul_ln9_reg_138_reg[14]__0_n_0 ;
  wire \mul_ln9_reg_138_reg[15]__0_n_0 ;
  wire \mul_ln9_reg_138_reg[16]__0_n_0 ;
  wire \mul_ln9_reg_138_reg[1]__0_n_0 ;
  wire \mul_ln9_reg_138_reg[2]__0_n_0 ;
  wire \mul_ln9_reg_138_reg[3]__0_n_0 ;
  wire \mul_ln9_reg_138_reg[4]__0_n_0 ;
  wire \mul_ln9_reg_138_reg[5]__0_n_0 ;
  wire \mul_ln9_reg_138_reg[6]__0_n_0 ;
  wire \mul_ln9_reg_138_reg[7]__0_n_0 ;
  wire \mul_ln9_reg_138_reg[8]__0_n_0 ;
  wire \mul_ln9_reg_138_reg[9]__0_n_0 ;
  wire mul_ln9_reg_138_reg__0_n_100;
  wire mul_ln9_reg_138_reg__0_n_101;
  wire mul_ln9_reg_138_reg__0_n_102;
  wire mul_ln9_reg_138_reg__0_n_103;
  wire mul_ln9_reg_138_reg__0_n_104;
  wire mul_ln9_reg_138_reg__0_n_105;
  wire mul_ln9_reg_138_reg__0_n_58;
  wire mul_ln9_reg_138_reg__0_n_59;
  wire mul_ln9_reg_138_reg__0_n_60;
  wire mul_ln9_reg_138_reg__0_n_61;
  wire mul_ln9_reg_138_reg__0_n_62;
  wire mul_ln9_reg_138_reg__0_n_63;
  wire mul_ln9_reg_138_reg__0_n_64;
  wire mul_ln9_reg_138_reg__0_n_65;
  wire mul_ln9_reg_138_reg__0_n_66;
  wire mul_ln9_reg_138_reg__0_n_67;
  wire mul_ln9_reg_138_reg__0_n_68;
  wire mul_ln9_reg_138_reg__0_n_69;
  wire mul_ln9_reg_138_reg__0_n_70;
  wire mul_ln9_reg_138_reg__0_n_71;
  wire mul_ln9_reg_138_reg__0_n_72;
  wire mul_ln9_reg_138_reg__0_n_73;
  wire mul_ln9_reg_138_reg__0_n_74;
  wire mul_ln9_reg_138_reg__0_n_75;
  wire mul_ln9_reg_138_reg__0_n_76;
  wire mul_ln9_reg_138_reg__0_n_77;
  wire mul_ln9_reg_138_reg__0_n_78;
  wire mul_ln9_reg_138_reg__0_n_79;
  wire mul_ln9_reg_138_reg__0_n_80;
  wire mul_ln9_reg_138_reg__0_n_81;
  wire mul_ln9_reg_138_reg__0_n_82;
  wire mul_ln9_reg_138_reg__0_n_83;
  wire mul_ln9_reg_138_reg__0_n_84;
  wire mul_ln9_reg_138_reg__0_n_85;
  wire mul_ln9_reg_138_reg__0_n_86;
  wire mul_ln9_reg_138_reg__0_n_87;
  wire mul_ln9_reg_138_reg__0_n_88;
  wire mul_ln9_reg_138_reg__0_n_89;
  wire mul_ln9_reg_138_reg__0_n_90;
  wire mul_ln9_reg_138_reg__0_n_91;
  wire mul_ln9_reg_138_reg__0_n_92;
  wire mul_ln9_reg_138_reg__0_n_93;
  wire mul_ln9_reg_138_reg__0_n_94;
  wire mul_ln9_reg_138_reg__0_n_95;
  wire mul_ln9_reg_138_reg__0_n_96;
  wire mul_ln9_reg_138_reg__0_n_97;
  wire mul_ln9_reg_138_reg__0_n_98;
  wire mul_ln9_reg_138_reg__0_n_99;
  wire [61:16]mul_ln9_reg_138_reg__1;
  wire \mul_ln9_reg_138_reg_n_0_[0] ;
  wire \mul_ln9_reg_138_reg_n_0_[10] ;
  wire \mul_ln9_reg_138_reg_n_0_[11] ;
  wire \mul_ln9_reg_138_reg_n_0_[12] ;
  wire \mul_ln9_reg_138_reg_n_0_[13] ;
  wire \mul_ln9_reg_138_reg_n_0_[14] ;
  wire \mul_ln9_reg_138_reg_n_0_[15] ;
  wire \mul_ln9_reg_138_reg_n_0_[16] ;
  wire \mul_ln9_reg_138_reg_n_0_[1] ;
  wire \mul_ln9_reg_138_reg_n_0_[2] ;
  wire \mul_ln9_reg_138_reg_n_0_[3] ;
  wire \mul_ln9_reg_138_reg_n_0_[4] ;
  wire \mul_ln9_reg_138_reg_n_0_[5] ;
  wire \mul_ln9_reg_138_reg_n_0_[6] ;
  wire \mul_ln9_reg_138_reg_n_0_[7] ;
  wire \mul_ln9_reg_138_reg_n_0_[8] ;
  wire \mul_ln9_reg_138_reg_n_0_[9] ;
  wire mul_ln9_reg_138_reg_n_100;
  wire mul_ln9_reg_138_reg_n_101;
  wire mul_ln9_reg_138_reg_n_102;
  wire mul_ln9_reg_138_reg_n_103;
  wire mul_ln9_reg_138_reg_n_104;
  wire mul_ln9_reg_138_reg_n_105;
  wire mul_ln9_reg_138_reg_n_58;
  wire mul_ln9_reg_138_reg_n_59;
  wire mul_ln9_reg_138_reg_n_60;
  wire mul_ln9_reg_138_reg_n_61;
  wire mul_ln9_reg_138_reg_n_62;
  wire mul_ln9_reg_138_reg_n_63;
  wire mul_ln9_reg_138_reg_n_64;
  wire mul_ln9_reg_138_reg_n_65;
  wire mul_ln9_reg_138_reg_n_66;
  wire mul_ln9_reg_138_reg_n_67;
  wire mul_ln9_reg_138_reg_n_68;
  wire mul_ln9_reg_138_reg_n_69;
  wire mul_ln9_reg_138_reg_n_70;
  wire mul_ln9_reg_138_reg_n_71;
  wire mul_ln9_reg_138_reg_n_72;
  wire mul_ln9_reg_138_reg_n_73;
  wire mul_ln9_reg_138_reg_n_74;
  wire mul_ln9_reg_138_reg_n_75;
  wire mul_ln9_reg_138_reg_n_76;
  wire mul_ln9_reg_138_reg_n_77;
  wire mul_ln9_reg_138_reg_n_78;
  wire mul_ln9_reg_138_reg_n_79;
  wire mul_ln9_reg_138_reg_n_80;
  wire mul_ln9_reg_138_reg_n_81;
  wire mul_ln9_reg_138_reg_n_82;
  wire mul_ln9_reg_138_reg_n_83;
  wire mul_ln9_reg_138_reg_n_84;
  wire mul_ln9_reg_138_reg_n_85;
  wire mul_ln9_reg_138_reg_n_86;
  wire mul_ln9_reg_138_reg_n_87;
  wire mul_ln9_reg_138_reg_n_88;
  wire mul_ln9_reg_138_reg_n_89;
  wire mul_ln9_reg_138_reg_n_90;
  wire mul_ln9_reg_138_reg_n_91;
  wire mul_ln9_reg_138_reg_n_92;
  wire mul_ln9_reg_138_reg_n_93;
  wire mul_ln9_reg_138_reg_n_94;
  wire mul_ln9_reg_138_reg_n_95;
  wire mul_ln9_reg_138_reg_n_96;
  wire mul_ln9_reg_138_reg_n_97;
  wire mul_ln9_reg_138_reg_n_98;
  wire mul_ln9_reg_138_reg_n_99;
  wire [31:0]or0_out;
  wire [31:0]out_stream_TDATA;
  wire [31:0]out_stream_TDATA_reg;
  wire out_stream_TDATA_reg1;
  wire [3:0]out_stream_TKEEP;
  wire [3:0]out_stream_TKEEP_reg;
  wire [0:0]out_stream_TLAST;
  wire [0:0]out_stream_TLAST_reg;
  wire out_stream_TREADY;
  wire [3:0]out_stream_TSTRB;
  wire [3:0]out_stream_TSTRB_reg;
  wire [0:0]out_stream_TUSER;
  wire [0:0]out_stream_TUSER_reg;
  wire out_stream_TVALID;
  wire regslice_both_out_stream_V_data_V_U_n_2;
  wire regslice_both_out_stream_V_data_V_U_n_4;
  wire regslice_both_out_stream_V_data_V_U_n_6;
  wire regslice_both_out_stream_V_keep_V_U_n_0;
  wire regslice_both_out_stream_V_strb_V_U_n_0;
  wire [4:0]s_axi_control_ARADDR;
  wire s_axi_control_ARREADY;
  wire s_axi_control_ARVALID;
  wire [4:0]s_axi_control_AWADDR;
  wire s_axi_control_AWREADY;
  wire s_axi_control_AWVALID;
  wire s_axi_control_BREADY;
  wire s_axi_control_BVALID;
  wire [31:0]s_axi_control_RDATA;
  wire s_axi_control_RREADY;
  wire s_axi_control_RVALID;
  wire [31:0]s_axi_control_WDATA;
  wire s_axi_control_WREADY;
  wire [3:0]s_axi_control_WSTRB;
  wire s_axi_control_WVALID;
  wire NLW_mul_ln9_reg_138_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_mul_ln9_reg_138_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_mul_ln9_reg_138_reg_OVERFLOW_UNCONNECTED;
  wire NLW_mul_ln9_reg_138_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_mul_ln9_reg_138_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_mul_ln9_reg_138_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_mul_ln9_reg_138_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_mul_ln9_reg_138_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_mul_ln9_reg_138_reg_CARRYOUT_UNCONNECTED;
  wire [47:0]NLW_mul_ln9_reg_138_reg_PCOUT_UNCONNECTED;
  wire [7:0]NLW_mul_ln9_reg_138_reg_XOROUT_UNCONNECTED;
  wire NLW_mul_ln9_reg_138_reg__0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_mul_ln9_reg_138_reg__0_MULTSIGNOUT_UNCONNECTED;
  wire NLW_mul_ln9_reg_138_reg__0_OVERFLOW_UNCONNECTED;
  wire NLW_mul_ln9_reg_138_reg__0_PATTERNBDETECT_UNCONNECTED;
  wire NLW_mul_ln9_reg_138_reg__0_PATTERNDETECT_UNCONNECTED;
  wire NLW_mul_ln9_reg_138_reg__0_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_mul_ln9_reg_138_reg__0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_mul_ln9_reg_138_reg__0_BCOUT_UNCONNECTED;
  wire [3:0]NLW_mul_ln9_reg_138_reg__0_CARRYOUT_UNCONNECTED;
  wire [47:0]NLW_mul_ln9_reg_138_reg__0_PCOUT_UNCONNECTED;
  wire [7:0]NLW_mul_ln9_reg_138_reg__0_XOROUT_UNCONNECTED;

  assign s_axi_control_BRESP[1] = \<const0> ;
  assign s_axi_control_BRESP[0] = \<const0> ;
  assign s_axi_control_RRESP[1] = \<const0> ;
  assign s_axi_control_RRESP[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* FSM_ENCODING = "none" *) 
  FDSE #(
    .INIT(1'b1)) 
    \ap_CS_fsm_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[0]),
        .Q(\ap_CS_fsm_reg_n_0_[0] ),
        .S(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[1]),
        .Q(ap_CS_fsm_state2),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[2]),
        .Q(ap_CS_fsm_state3),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[3] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[3]),
        .Q(ap_CS_fsm_state4),
        .R(ap_rst));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_control_s_axi control_s_axi_U
       (.A({control_s_axi_U_n_56,control_s_axi_U_n_57,control_s_axi_U_n_58,control_s_axi_U_n_59,control_s_axi_U_n_60,control_s_axi_U_n_61,control_s_axi_U_n_62,control_s_axi_U_n_63,control_s_axi_U_n_64,control_s_axi_U_n_65,control_s_axi_U_n_66,control_s_axi_U_n_67,control_s_axi_U_n_68,control_s_axi_U_n_69,control_s_axi_U_n_70,control_s_axi_U_n_71,control_s_axi_U_n_72}),
        .B({control_s_axi_U_n_42,control_s_axi_U_n_43,control_s_axi_U_n_44,control_s_axi_U_n_45,control_s_axi_U_n_46,control_s_axi_U_n_47,control_s_axi_U_n_48,control_s_axi_U_n_49,control_s_axi_U_n_50,control_s_axi_U_n_51,control_s_axi_U_n_52,control_s_axi_U_n_53,control_s_axi_U_n_54,control_s_axi_U_n_55}),
        .CEA2(int_height),
        .D(ap_NS_fsm[1]),
        .\FSM_onehot_rstate_reg[1]_0 (s_axi_control_ARREADY),
        .\FSM_onehot_wstate_reg[1]_0 (s_axi_control_AWREADY),
        .\FSM_onehot_wstate_reg[2]_0 (s_axi_control_WREADY),
        .Q(\ap_CS_fsm_reg_n_0_[0] ),
        .RSTA(ap_rst),
        .ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .ap_start(ap_start),
        .int_ap_start_reg_0(regslice_both_out_stream_V_data_V_U_n_4),
        .interrupt(interrupt),
        .s_axi_control_ARADDR(s_axi_control_ARADDR),
        .s_axi_control_ARVALID(s_axi_control_ARVALID),
        .s_axi_control_AWADDR(s_axi_control_AWADDR[4:2]),
        .s_axi_control_AWVALID(s_axi_control_AWVALID),
        .s_axi_control_BREADY(s_axi_control_BREADY),
        .s_axi_control_BVALID(s_axi_control_BVALID),
        .s_axi_control_RDATA(s_axi_control_RDATA),
        .s_axi_control_RREADY(s_axi_control_RREADY),
        .s_axi_control_RVALID(s_axi_control_RVALID),
        .s_axi_control_WDATA(s_axi_control_WDATA),
        .\s_axi_control_WDATA[31] (or0_out),
        .s_axi_control_WSTRB(s_axi_control_WSTRB),
        .s_axi_control_WVALID(s_axi_control_WVALID));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80
       (.D(ap_NS_fsm[3:2]),
        .E(load_p2_1),
        .P({mul_ln9_reg_138_reg__0_n_61,mul_ln9_reg_138_reg__0_n_62,mul_ln9_reg_138_reg__0_n_63,mul_ln9_reg_138_reg__0_n_64,mul_ln9_reg_138_reg__0_n_65,mul_ln9_reg_138_reg__0_n_66}),
        .Q(in_stream_TVALID_int_regslice),
        .RSTA(ap_rst),
        .S({grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_7,grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_8,grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_9,grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_10,grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_11,grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_12}),
        .ack_in(ack_in),
        .\ap_CS_fsm_reg[1] (grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_13),
        .\ap_CS_fsm_reg[3] ({ap_CS_fsm_state3,ap_CS_fsm_state2}),
        .\ap_CS_fsm_reg[3]_0 (regslice_both_out_stream_V_data_V_U_n_6),
        .ap_clk(ap_clk),
        .ap_done_reg6_carry_0({\mul_ln9_reg_138_reg[15]__0_n_0 ,\mul_ln9_reg_138_reg[14]__0_n_0 ,\mul_ln9_reg_138_reg[13]__0_n_0 ,\mul_ln9_reg_138_reg[12]__0_n_0 ,\mul_ln9_reg_138_reg[11]__0_n_0 ,\mul_ln9_reg_138_reg[10]__0_n_0 ,\mul_ln9_reg_138_reg[9]__0_n_0 ,\mul_ln9_reg_138_reg[8]__0_n_0 ,\mul_ln9_reg_138_reg[7]__0_n_0 ,\mul_ln9_reg_138_reg[6]__0_n_0 ,\mul_ln9_reg_138_reg[5]__0_n_0 ,\mul_ln9_reg_138_reg[4]__0_n_0 ,\mul_ln9_reg_138_reg[3]__0_n_0 ,\mul_ln9_reg_138_reg[2]__0_n_0 ,\mul_ln9_reg_138_reg[1]__0_n_0 ,\mul_ln9_reg_138_reg[0]__0_n_0 }),
        .ap_enable_reg_pp0_iter1_reg_0(grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_ap_start_reg_reg_n_0),
        .ap_enable_reg_pp0_iter2_reg_0(grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_0),
        .ap_enable_reg_pp0_iter2_reg_1(load_p2_0),
        .ap_enable_reg_pp0_iter2_reg_2(load_p2),
        .ap_rst_n(ap_rst_n),
        .\data_p2_reg[3] (regslice_both_out_stream_V_keep_V_U_n_0),
        .\data_p2_reg[3]_0 (regslice_both_out_stream_V_strb_V_U_n_0),
        .indvar_flatten_fu_602(indvar_flatten_fu_602),
        .mul_ln9_reg_138_reg__1(mul_ln9_reg_138_reg__1),
        .out_stream_TDATA_reg1(out_stream_TDATA_reg1),
        .tmp_product_carry__4({mul_ln9_reg_138_reg_n_78,mul_ln9_reg_138_reg_n_79,mul_ln9_reg_138_reg_n_80,mul_ln9_reg_138_reg_n_81,mul_ln9_reg_138_reg_n_82,mul_ln9_reg_138_reg_n_83}));
  FDRE #(
    .INIT(1'b0)) 
    grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_ap_start_reg_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_13),
        .Q(grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_ap_start_reg_reg_n_0),
        .R(ap_rst));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_mul_32ns_31ns_62_1_1 mul_32ns_31ns_62_1_1_U12
       (.A({control_s_axi_U_n_56,control_s_axi_U_n_57,control_s_axi_U_n_58,control_s_axi_U_n_59,control_s_axi_U_n_60,control_s_axi_U_n_61,control_s_axi_U_n_62,control_s_axi_U_n_63,control_s_axi_U_n_64,control_s_axi_U_n_65,control_s_axi_U_n_66,control_s_axi_U_n_67,control_s_axi_U_n_68,control_s_axi_U_n_69,control_s_axi_U_n_70,control_s_axi_U_n_71,control_s_axi_U_n_72}),
        .CEA2(int_height),
        .D({mul_32ns_31ns_62_1_1_U12_n_0,mul_32ns_31ns_62_1_1_U12_n_1,mul_32ns_31ns_62_1_1_U12_n_2,mul_32ns_31ns_62_1_1_U12_n_3,mul_32ns_31ns_62_1_1_U12_n_4,mul_32ns_31ns_62_1_1_U12_n_5,mul_32ns_31ns_62_1_1_U12_n_6,mul_32ns_31ns_62_1_1_U12_n_7,mul_32ns_31ns_62_1_1_U12_n_8,mul_32ns_31ns_62_1_1_U12_n_9,mul_32ns_31ns_62_1_1_U12_n_10,mul_32ns_31ns_62_1_1_U12_n_11,mul_32ns_31ns_62_1_1_U12_n_12,mul_32ns_31ns_62_1_1_U12_n_13,mul_32ns_31ns_62_1_1_U12_n_14,mul_32ns_31ns_62_1_1_U12_n_15,mul_32ns_31ns_62_1_1_U12_n_16}),
        .DSP_ALU_INST(or0_out),
        .P({mul_ln9_reg_138_reg__0_n_62,mul_ln9_reg_138_reg__0_n_63,mul_ln9_reg_138_reg__0_n_64,mul_ln9_reg_138_reg__0_n_65,mul_ln9_reg_138_reg__0_n_66,mul_ln9_reg_138_reg__0_n_67,mul_ln9_reg_138_reg__0_n_68,mul_ln9_reg_138_reg__0_n_69,mul_ln9_reg_138_reg__0_n_70,mul_ln9_reg_138_reg__0_n_71,mul_ln9_reg_138_reg__0_n_72,mul_ln9_reg_138_reg__0_n_73,mul_ln9_reg_138_reg__0_n_74,mul_ln9_reg_138_reg__0_n_75,mul_ln9_reg_138_reg__0_n_76,mul_ln9_reg_138_reg__0_n_77,mul_ln9_reg_138_reg__0_n_78,mul_ln9_reg_138_reg__0_n_79,mul_ln9_reg_138_reg__0_n_80,mul_ln9_reg_138_reg__0_n_81,mul_ln9_reg_138_reg__0_n_82,mul_ln9_reg_138_reg__0_n_83,mul_ln9_reg_138_reg__0_n_84,mul_ln9_reg_138_reg__0_n_85,mul_ln9_reg_138_reg__0_n_86,mul_ln9_reg_138_reg__0_n_87,mul_ln9_reg_138_reg__0_n_88,mul_ln9_reg_138_reg__0_n_89,mul_ln9_reg_138_reg__0_n_90,mul_ln9_reg_138_reg__0_n_91,mul_ln9_reg_138_reg__0_n_92,mul_ln9_reg_138_reg__0_n_93,mul_ln9_reg_138_reg__0_n_94,mul_ln9_reg_138_reg__0_n_95,mul_ln9_reg_138_reg__0_n_96,mul_ln9_reg_138_reg__0_n_97,mul_ln9_reg_138_reg__0_n_98,mul_ln9_reg_138_reg__0_n_99,mul_ln9_reg_138_reg__0_n_100,mul_ln9_reg_138_reg__0_n_101,mul_ln9_reg_138_reg__0_n_102,mul_ln9_reg_138_reg__0_n_103,mul_ln9_reg_138_reg__0_n_104,mul_ln9_reg_138_reg__0_n_105}),
        .PCOUT({mul_32ns_31ns_62_1_1_U12_n_17,mul_32ns_31ns_62_1_1_U12_n_18,mul_32ns_31ns_62_1_1_U12_n_19,mul_32ns_31ns_62_1_1_U12_n_20,mul_32ns_31ns_62_1_1_U12_n_21,mul_32ns_31ns_62_1_1_U12_n_22,mul_32ns_31ns_62_1_1_U12_n_23,mul_32ns_31ns_62_1_1_U12_n_24,mul_32ns_31ns_62_1_1_U12_n_25,mul_32ns_31ns_62_1_1_U12_n_26,mul_32ns_31ns_62_1_1_U12_n_27,mul_32ns_31ns_62_1_1_U12_n_28,mul_32ns_31ns_62_1_1_U12_n_29,mul_32ns_31ns_62_1_1_U12_n_30,mul_32ns_31ns_62_1_1_U12_n_31,mul_32ns_31ns_62_1_1_U12_n_32,mul_32ns_31ns_62_1_1_U12_n_33,mul_32ns_31ns_62_1_1_U12_n_34,mul_32ns_31ns_62_1_1_U12_n_35,mul_32ns_31ns_62_1_1_U12_n_36,mul_32ns_31ns_62_1_1_U12_n_37,mul_32ns_31ns_62_1_1_U12_n_38,mul_32ns_31ns_62_1_1_U12_n_39,mul_32ns_31ns_62_1_1_U12_n_40,mul_32ns_31ns_62_1_1_U12_n_41,mul_32ns_31ns_62_1_1_U12_n_42,mul_32ns_31ns_62_1_1_U12_n_43,mul_32ns_31ns_62_1_1_U12_n_44,mul_32ns_31ns_62_1_1_U12_n_45,mul_32ns_31ns_62_1_1_U12_n_46,mul_32ns_31ns_62_1_1_U12_n_47,mul_32ns_31ns_62_1_1_U12_n_48,mul_32ns_31ns_62_1_1_U12_n_49,mul_32ns_31ns_62_1_1_U12_n_50,mul_32ns_31ns_62_1_1_U12_n_51,mul_32ns_31ns_62_1_1_U12_n_52,mul_32ns_31ns_62_1_1_U12_n_53,mul_32ns_31ns_62_1_1_U12_n_54,mul_32ns_31ns_62_1_1_U12_n_55,mul_32ns_31ns_62_1_1_U12_n_56,mul_32ns_31ns_62_1_1_U12_n_57,mul_32ns_31ns_62_1_1_U12_n_58,mul_32ns_31ns_62_1_1_U12_n_59,mul_32ns_31ns_62_1_1_U12_n_60,mul_32ns_31ns_62_1_1_U12_n_61,mul_32ns_31ns_62_1_1_U12_n_62,mul_32ns_31ns_62_1_1_U12_n_63,mul_32ns_31ns_62_1_1_U12_n_64}),
        .Q(\mul_ln9_reg_138_reg[16]__0_n_0 ),
        .RSTA(ap_rst),
        .S({grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_7,grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_8,grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_9,grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_10,grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_11,grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_12}),
        .ap_clk(ap_clk),
        .ap_clk_0({mul_32ns_31ns_62_1_1_U12_n_65,mul_32ns_31ns_62_1_1_U12_n_66,mul_32ns_31ns_62_1_1_U12_n_67,mul_32ns_31ns_62_1_1_U12_n_68,mul_32ns_31ns_62_1_1_U12_n_69,mul_32ns_31ns_62_1_1_U12_n_70,mul_32ns_31ns_62_1_1_U12_n_71,mul_32ns_31ns_62_1_1_U12_n_72,mul_32ns_31ns_62_1_1_U12_n_73,mul_32ns_31ns_62_1_1_U12_n_74,mul_32ns_31ns_62_1_1_U12_n_75,mul_32ns_31ns_62_1_1_U12_n_76,mul_32ns_31ns_62_1_1_U12_n_77,mul_32ns_31ns_62_1_1_U12_n_78,mul_32ns_31ns_62_1_1_U12_n_79,mul_32ns_31ns_62_1_1_U12_n_80,mul_32ns_31ns_62_1_1_U12_n_81}),
        .ap_clk_1({mul_32ns_31ns_62_1_1_U12_n_82,mul_32ns_31ns_62_1_1_U12_n_83,mul_32ns_31ns_62_1_1_U12_n_84,mul_32ns_31ns_62_1_1_U12_n_85,mul_32ns_31ns_62_1_1_U12_n_86,mul_32ns_31ns_62_1_1_U12_n_87,mul_32ns_31ns_62_1_1_U12_n_88,mul_32ns_31ns_62_1_1_U12_n_89,mul_32ns_31ns_62_1_1_U12_n_90,mul_32ns_31ns_62_1_1_U12_n_91,mul_32ns_31ns_62_1_1_U12_n_92,mul_32ns_31ns_62_1_1_U12_n_93,mul_32ns_31ns_62_1_1_U12_n_94,mul_32ns_31ns_62_1_1_U12_n_95,mul_32ns_31ns_62_1_1_U12_n_96,mul_32ns_31ns_62_1_1_U12_n_97,mul_32ns_31ns_62_1_1_U12_n_98,mul_32ns_31ns_62_1_1_U12_n_99,mul_32ns_31ns_62_1_1_U12_n_100,mul_32ns_31ns_62_1_1_U12_n_101,mul_32ns_31ns_62_1_1_U12_n_102,mul_32ns_31ns_62_1_1_U12_n_103,mul_32ns_31ns_62_1_1_U12_n_104,mul_32ns_31ns_62_1_1_U12_n_105,mul_32ns_31ns_62_1_1_U12_n_106,mul_32ns_31ns_62_1_1_U12_n_107,mul_32ns_31ns_62_1_1_U12_n_108,mul_32ns_31ns_62_1_1_U12_n_109,mul_32ns_31ns_62_1_1_U12_n_110,mul_32ns_31ns_62_1_1_U12_n_111,mul_32ns_31ns_62_1_1_U12_n_112,mul_32ns_31ns_62_1_1_U12_n_113,mul_32ns_31ns_62_1_1_U12_n_114,mul_32ns_31ns_62_1_1_U12_n_115,mul_32ns_31ns_62_1_1_U12_n_116,mul_32ns_31ns_62_1_1_U12_n_117,mul_32ns_31ns_62_1_1_U12_n_118,mul_32ns_31ns_62_1_1_U12_n_119,mul_32ns_31ns_62_1_1_U12_n_120,mul_32ns_31ns_62_1_1_U12_n_121,mul_32ns_31ns_62_1_1_U12_n_122,mul_32ns_31ns_62_1_1_U12_n_123,mul_32ns_31ns_62_1_1_U12_n_124,mul_32ns_31ns_62_1_1_U12_n_125,mul_32ns_31ns_62_1_1_U12_n_126,mul_32ns_31ns_62_1_1_U12_n_127,mul_32ns_31ns_62_1_1_U12_n_128,mul_32ns_31ns_62_1_1_U12_n_129}),
        .mul_ln9_reg_138_reg__1(mul_ln9_reg_138_reg__1),
        .tmp_product_carry__1_0({\mul_ln9_reg_138_reg_n_0_[16] ,\mul_ln9_reg_138_reg_n_0_[15] ,\mul_ln9_reg_138_reg_n_0_[14] ,\mul_ln9_reg_138_reg_n_0_[13] ,\mul_ln9_reg_138_reg_n_0_[12] ,\mul_ln9_reg_138_reg_n_0_[11] ,\mul_ln9_reg_138_reg_n_0_[10] ,\mul_ln9_reg_138_reg_n_0_[9] ,\mul_ln9_reg_138_reg_n_0_[8] ,\mul_ln9_reg_138_reg_n_0_[7] ,\mul_ln9_reg_138_reg_n_0_[6] ,\mul_ln9_reg_138_reg_n_0_[5] ,\mul_ln9_reg_138_reg_n_0_[4] ,\mul_ln9_reg_138_reg_n_0_[3] ,\mul_ln9_reg_138_reg_n_0_[2] ,\mul_ln9_reg_138_reg_n_0_[1] ,\mul_ln9_reg_138_reg_n_0_[0] }),
        .tmp_product_carry__3_0({mul_ln9_reg_138_reg_n_84,mul_ln9_reg_138_reg_n_85,mul_ln9_reg_138_reg_n_86,mul_ln9_reg_138_reg_n_87,mul_ln9_reg_138_reg_n_88,mul_ln9_reg_138_reg_n_89,mul_ln9_reg_138_reg_n_90,mul_ln9_reg_138_reg_n_91,mul_ln9_reg_138_reg_n_92,mul_ln9_reg_138_reg_n_93,mul_ln9_reg_138_reg_n_94,mul_ln9_reg_138_reg_n_95,mul_ln9_reg_138_reg_n_96,mul_ln9_reg_138_reg_n_97,mul_ln9_reg_138_reg_n_98,mul_ln9_reg_138_reg_n_99,mul_ln9_reg_138_reg_n_100,mul_ln9_reg_138_reg_n_101,mul_ln9_reg_138_reg_n_102,mul_ln9_reg_138_reg_n_103,mul_ln9_reg_138_reg_n_104,mul_ln9_reg_138_reg_n_105}));
  (* KEEP_HIERARCHY = "YES" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 16x15 4}}" *) 
  DSP48E2 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BMULTSEL("B"),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(1),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    mul_ln9_reg_138_reg
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,or0_out[31:17]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_mul_ln9_reg_138_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,control_s_axi_U_n_42,control_s_axi_U_n_43,control_s_axi_U_n_44,control_s_axi_U_n_45,control_s_axi_U_n_46,control_s_axi_U_n_47,control_s_axi_U_n_48,control_s_axi_U_n_49,control_s_axi_U_n_50,control_s_axi_U_n_51,control_s_axi_U_n_52,control_s_axi_U_n_53,control_s_axi_U_n_54,control_s_axi_U_n_55}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_mul_ln9_reg_138_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_mul_ln9_reg_138_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_mul_ln9_reg_138_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(int_height),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(ap_CS_fsm_state2),
        .CLK(ap_clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_mul_ln9_reg_138_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_mul_ln9_reg_138_reg_OVERFLOW_UNCONNECTED),
        .P({mul_ln9_reg_138_reg_n_58,mul_ln9_reg_138_reg_n_59,mul_ln9_reg_138_reg_n_60,mul_ln9_reg_138_reg_n_61,mul_ln9_reg_138_reg_n_62,mul_ln9_reg_138_reg_n_63,mul_ln9_reg_138_reg_n_64,mul_ln9_reg_138_reg_n_65,mul_ln9_reg_138_reg_n_66,mul_ln9_reg_138_reg_n_67,mul_ln9_reg_138_reg_n_68,mul_ln9_reg_138_reg_n_69,mul_ln9_reg_138_reg_n_70,mul_ln9_reg_138_reg_n_71,mul_ln9_reg_138_reg_n_72,mul_ln9_reg_138_reg_n_73,mul_ln9_reg_138_reg_n_74,mul_ln9_reg_138_reg_n_75,mul_ln9_reg_138_reg_n_76,mul_ln9_reg_138_reg_n_77,mul_ln9_reg_138_reg_n_78,mul_ln9_reg_138_reg_n_79,mul_ln9_reg_138_reg_n_80,mul_ln9_reg_138_reg_n_81,mul_ln9_reg_138_reg_n_82,mul_ln9_reg_138_reg_n_83,mul_ln9_reg_138_reg_n_84,mul_ln9_reg_138_reg_n_85,mul_ln9_reg_138_reg_n_86,mul_ln9_reg_138_reg_n_87,mul_ln9_reg_138_reg_n_88,mul_ln9_reg_138_reg_n_89,mul_ln9_reg_138_reg_n_90,mul_ln9_reg_138_reg_n_91,mul_ln9_reg_138_reg_n_92,mul_ln9_reg_138_reg_n_93,mul_ln9_reg_138_reg_n_94,mul_ln9_reg_138_reg_n_95,mul_ln9_reg_138_reg_n_96,mul_ln9_reg_138_reg_n_97,mul_ln9_reg_138_reg_n_98,mul_ln9_reg_138_reg_n_99,mul_ln9_reg_138_reg_n_100,mul_ln9_reg_138_reg_n_101,mul_ln9_reg_138_reg_n_102,mul_ln9_reg_138_reg_n_103,mul_ln9_reg_138_reg_n_104,mul_ln9_reg_138_reg_n_105}),
        .PATTERNBDETECT(NLW_mul_ln9_reg_138_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_mul_ln9_reg_138_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({mul_32ns_31ns_62_1_1_U12_n_17,mul_32ns_31ns_62_1_1_U12_n_18,mul_32ns_31ns_62_1_1_U12_n_19,mul_32ns_31ns_62_1_1_U12_n_20,mul_32ns_31ns_62_1_1_U12_n_21,mul_32ns_31ns_62_1_1_U12_n_22,mul_32ns_31ns_62_1_1_U12_n_23,mul_32ns_31ns_62_1_1_U12_n_24,mul_32ns_31ns_62_1_1_U12_n_25,mul_32ns_31ns_62_1_1_U12_n_26,mul_32ns_31ns_62_1_1_U12_n_27,mul_32ns_31ns_62_1_1_U12_n_28,mul_32ns_31ns_62_1_1_U12_n_29,mul_32ns_31ns_62_1_1_U12_n_30,mul_32ns_31ns_62_1_1_U12_n_31,mul_32ns_31ns_62_1_1_U12_n_32,mul_32ns_31ns_62_1_1_U12_n_33,mul_32ns_31ns_62_1_1_U12_n_34,mul_32ns_31ns_62_1_1_U12_n_35,mul_32ns_31ns_62_1_1_U12_n_36,mul_32ns_31ns_62_1_1_U12_n_37,mul_32ns_31ns_62_1_1_U12_n_38,mul_32ns_31ns_62_1_1_U12_n_39,mul_32ns_31ns_62_1_1_U12_n_40,mul_32ns_31ns_62_1_1_U12_n_41,mul_32ns_31ns_62_1_1_U12_n_42,mul_32ns_31ns_62_1_1_U12_n_43,mul_32ns_31ns_62_1_1_U12_n_44,mul_32ns_31ns_62_1_1_U12_n_45,mul_32ns_31ns_62_1_1_U12_n_46,mul_32ns_31ns_62_1_1_U12_n_47,mul_32ns_31ns_62_1_1_U12_n_48,mul_32ns_31ns_62_1_1_U12_n_49,mul_32ns_31ns_62_1_1_U12_n_50,mul_32ns_31ns_62_1_1_U12_n_51,mul_32ns_31ns_62_1_1_U12_n_52,mul_32ns_31ns_62_1_1_U12_n_53,mul_32ns_31ns_62_1_1_U12_n_54,mul_32ns_31ns_62_1_1_U12_n_55,mul_32ns_31ns_62_1_1_U12_n_56,mul_32ns_31ns_62_1_1_U12_n_57,mul_32ns_31ns_62_1_1_U12_n_58,mul_32ns_31ns_62_1_1_U12_n_59,mul_32ns_31ns_62_1_1_U12_n_60,mul_32ns_31ns_62_1_1_U12_n_61,mul_32ns_31ns_62_1_1_U12_n_62,mul_32ns_31ns_62_1_1_U12_n_63,mul_32ns_31ns_62_1_1_U12_n_64}),
        .PCOUT(NLW_mul_ln9_reg_138_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(ap_rst),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_mul_ln9_reg_138_reg_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_mul_ln9_reg_138_reg_XOROUT_UNCONNECTED[7:0]));
  FDRE \mul_ln9_reg_138_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_16),
        .Q(\mul_ln9_reg_138_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[0]__0 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_81),
        .Q(\mul_ln9_reg_138_reg[0]__0_n_0 ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_6),
        .Q(\mul_ln9_reg_138_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[10]__0 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_71),
        .Q(\mul_ln9_reg_138_reg[10]__0_n_0 ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[11] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_5),
        .Q(\mul_ln9_reg_138_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[11]__0 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_70),
        .Q(\mul_ln9_reg_138_reg[11]__0_n_0 ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[12] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_4),
        .Q(\mul_ln9_reg_138_reg_n_0_[12] ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[12]__0 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_69),
        .Q(\mul_ln9_reg_138_reg[12]__0_n_0 ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[13] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_3),
        .Q(\mul_ln9_reg_138_reg_n_0_[13] ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[13]__0 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_68),
        .Q(\mul_ln9_reg_138_reg[13]__0_n_0 ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[14] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_2),
        .Q(\mul_ln9_reg_138_reg_n_0_[14] ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[14]__0 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_67),
        .Q(\mul_ln9_reg_138_reg[14]__0_n_0 ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[15] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_1),
        .Q(\mul_ln9_reg_138_reg_n_0_[15] ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[15]__0 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_66),
        .Q(\mul_ln9_reg_138_reg[15]__0_n_0 ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[16] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_0),
        .Q(\mul_ln9_reg_138_reg_n_0_[16] ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[16]__0 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_65),
        .Q(\mul_ln9_reg_138_reg[16]__0_n_0 ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_15),
        .Q(\mul_ln9_reg_138_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[1]__0 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_80),
        .Q(\mul_ln9_reg_138_reg[1]__0_n_0 ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_14),
        .Q(\mul_ln9_reg_138_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[2]__0 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_79),
        .Q(\mul_ln9_reg_138_reg[2]__0_n_0 ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_13),
        .Q(\mul_ln9_reg_138_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[3]__0 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_78),
        .Q(\mul_ln9_reg_138_reg[3]__0_n_0 ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_12),
        .Q(\mul_ln9_reg_138_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[4]__0 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_77),
        .Q(\mul_ln9_reg_138_reg[4]__0_n_0 ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_11),
        .Q(\mul_ln9_reg_138_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[5]__0 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_76),
        .Q(\mul_ln9_reg_138_reg[5]__0_n_0 ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_10),
        .Q(\mul_ln9_reg_138_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[6]__0 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_75),
        .Q(\mul_ln9_reg_138_reg[6]__0_n_0 ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_9),
        .Q(\mul_ln9_reg_138_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[7]__0 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_74),
        .Q(\mul_ln9_reg_138_reg[7]__0_n_0 ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_8),
        .Q(\mul_ln9_reg_138_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[8]__0 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_73),
        .Q(\mul_ln9_reg_138_reg[8]__0_n_0 ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_7),
        .Q(\mul_ln9_reg_138_reg_n_0_[9] ),
        .R(1'b0));
  FDRE \mul_ln9_reg_138_reg[9]__0 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state2),
        .D(mul_32ns_31ns_62_1_1_U12_n_72),
        .Q(\mul_ln9_reg_138_reg[9]__0_n_0 ),
        .R(1'b0));
  (* KEEP_HIERARCHY = "YES" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x15 4}}" *) 
  DSP48E2 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BMULTSEL("B"),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(1),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    mul_ln9_reg_138_reg__0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,or0_out[16:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_mul_ln9_reg_138_reg__0_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,control_s_axi_U_n_42,control_s_axi_U_n_43,control_s_axi_U_n_44,control_s_axi_U_n_45,control_s_axi_U_n_46,control_s_axi_U_n_47,control_s_axi_U_n_48,control_s_axi_U_n_49,control_s_axi_U_n_50,control_s_axi_U_n_51,control_s_axi_U_n_52,control_s_axi_U_n_53,control_s_axi_U_n_54,control_s_axi_U_n_55}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_mul_ln9_reg_138_reg__0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_mul_ln9_reg_138_reg__0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_mul_ln9_reg_138_reg__0_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(int_height),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(ap_CS_fsm_state2),
        .CLK(ap_clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_mul_ln9_reg_138_reg__0_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_mul_ln9_reg_138_reg__0_OVERFLOW_UNCONNECTED),
        .P({mul_ln9_reg_138_reg__0_n_58,mul_ln9_reg_138_reg__0_n_59,mul_ln9_reg_138_reg__0_n_60,mul_ln9_reg_138_reg__0_n_61,mul_ln9_reg_138_reg__0_n_62,mul_ln9_reg_138_reg__0_n_63,mul_ln9_reg_138_reg__0_n_64,mul_ln9_reg_138_reg__0_n_65,mul_ln9_reg_138_reg__0_n_66,mul_ln9_reg_138_reg__0_n_67,mul_ln9_reg_138_reg__0_n_68,mul_ln9_reg_138_reg__0_n_69,mul_ln9_reg_138_reg__0_n_70,mul_ln9_reg_138_reg__0_n_71,mul_ln9_reg_138_reg__0_n_72,mul_ln9_reg_138_reg__0_n_73,mul_ln9_reg_138_reg__0_n_74,mul_ln9_reg_138_reg__0_n_75,mul_ln9_reg_138_reg__0_n_76,mul_ln9_reg_138_reg__0_n_77,mul_ln9_reg_138_reg__0_n_78,mul_ln9_reg_138_reg__0_n_79,mul_ln9_reg_138_reg__0_n_80,mul_ln9_reg_138_reg__0_n_81,mul_ln9_reg_138_reg__0_n_82,mul_ln9_reg_138_reg__0_n_83,mul_ln9_reg_138_reg__0_n_84,mul_ln9_reg_138_reg__0_n_85,mul_ln9_reg_138_reg__0_n_86,mul_ln9_reg_138_reg__0_n_87,mul_ln9_reg_138_reg__0_n_88,mul_ln9_reg_138_reg__0_n_89,mul_ln9_reg_138_reg__0_n_90,mul_ln9_reg_138_reg__0_n_91,mul_ln9_reg_138_reg__0_n_92,mul_ln9_reg_138_reg__0_n_93,mul_ln9_reg_138_reg__0_n_94,mul_ln9_reg_138_reg__0_n_95,mul_ln9_reg_138_reg__0_n_96,mul_ln9_reg_138_reg__0_n_97,mul_ln9_reg_138_reg__0_n_98,mul_ln9_reg_138_reg__0_n_99,mul_ln9_reg_138_reg__0_n_100,mul_ln9_reg_138_reg__0_n_101,mul_ln9_reg_138_reg__0_n_102,mul_ln9_reg_138_reg__0_n_103,mul_ln9_reg_138_reg__0_n_104,mul_ln9_reg_138_reg__0_n_105}),
        .PATTERNBDETECT(NLW_mul_ln9_reg_138_reg__0_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_mul_ln9_reg_138_reg__0_PATTERNDETECT_UNCONNECTED),
        .PCIN({mul_32ns_31ns_62_1_1_U12_n_82,mul_32ns_31ns_62_1_1_U12_n_83,mul_32ns_31ns_62_1_1_U12_n_84,mul_32ns_31ns_62_1_1_U12_n_85,mul_32ns_31ns_62_1_1_U12_n_86,mul_32ns_31ns_62_1_1_U12_n_87,mul_32ns_31ns_62_1_1_U12_n_88,mul_32ns_31ns_62_1_1_U12_n_89,mul_32ns_31ns_62_1_1_U12_n_90,mul_32ns_31ns_62_1_1_U12_n_91,mul_32ns_31ns_62_1_1_U12_n_92,mul_32ns_31ns_62_1_1_U12_n_93,mul_32ns_31ns_62_1_1_U12_n_94,mul_32ns_31ns_62_1_1_U12_n_95,mul_32ns_31ns_62_1_1_U12_n_96,mul_32ns_31ns_62_1_1_U12_n_97,mul_32ns_31ns_62_1_1_U12_n_98,mul_32ns_31ns_62_1_1_U12_n_99,mul_32ns_31ns_62_1_1_U12_n_100,mul_32ns_31ns_62_1_1_U12_n_101,mul_32ns_31ns_62_1_1_U12_n_102,mul_32ns_31ns_62_1_1_U12_n_103,mul_32ns_31ns_62_1_1_U12_n_104,mul_32ns_31ns_62_1_1_U12_n_105,mul_32ns_31ns_62_1_1_U12_n_106,mul_32ns_31ns_62_1_1_U12_n_107,mul_32ns_31ns_62_1_1_U12_n_108,mul_32ns_31ns_62_1_1_U12_n_109,mul_32ns_31ns_62_1_1_U12_n_110,mul_32ns_31ns_62_1_1_U12_n_111,mul_32ns_31ns_62_1_1_U12_n_112,mul_32ns_31ns_62_1_1_U12_n_113,mul_32ns_31ns_62_1_1_U12_n_114,mul_32ns_31ns_62_1_1_U12_n_115,mul_32ns_31ns_62_1_1_U12_n_116,mul_32ns_31ns_62_1_1_U12_n_117,mul_32ns_31ns_62_1_1_U12_n_118,mul_32ns_31ns_62_1_1_U12_n_119,mul_32ns_31ns_62_1_1_U12_n_120,mul_32ns_31ns_62_1_1_U12_n_121,mul_32ns_31ns_62_1_1_U12_n_122,mul_32ns_31ns_62_1_1_U12_n_123,mul_32ns_31ns_62_1_1_U12_n_124,mul_32ns_31ns_62_1_1_U12_n_125,mul_32ns_31ns_62_1_1_U12_n_126,mul_32ns_31ns_62_1_1_U12_n_127,mul_32ns_31ns_62_1_1_U12_n_128,mul_32ns_31ns_62_1_1_U12_n_129}),
        .PCOUT(NLW_mul_ln9_reg_138_reg__0_PCOUT_UNCONNECTED[47:0]),
        .RSTA(ap_rst),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_mul_ln9_reg_138_reg__0_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_mul_ln9_reg_138_reg__0_XOROUT_UNCONNECTED[7:0]));
  FDRE \out_stream_TDATA_reg_reg[0] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[0]),
        .Q(out_stream_TDATA_reg[0]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[10] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[10]),
        .Q(out_stream_TDATA_reg[10]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[11] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[11]),
        .Q(out_stream_TDATA_reg[11]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[12] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[12]),
        .Q(out_stream_TDATA_reg[12]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[13] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[13]),
        .Q(out_stream_TDATA_reg[13]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[14] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[14]),
        .Q(out_stream_TDATA_reg[14]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[15] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[15]),
        .Q(out_stream_TDATA_reg[15]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[16] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[16]),
        .Q(out_stream_TDATA_reg[16]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[17] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[17]),
        .Q(out_stream_TDATA_reg[17]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[18] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[18]),
        .Q(out_stream_TDATA_reg[18]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[19] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[19]),
        .Q(out_stream_TDATA_reg[19]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[1] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[1]),
        .Q(out_stream_TDATA_reg[1]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[20] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[20]),
        .Q(out_stream_TDATA_reg[20]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[21] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[21]),
        .Q(out_stream_TDATA_reg[21]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[22] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[22]),
        .Q(out_stream_TDATA_reg[22]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[23] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[23]),
        .Q(out_stream_TDATA_reg[23]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[24] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[24]),
        .Q(out_stream_TDATA_reg[24]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[25] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[25]),
        .Q(out_stream_TDATA_reg[25]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[26] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[26]),
        .Q(out_stream_TDATA_reg[26]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[27] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[27]),
        .Q(out_stream_TDATA_reg[27]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[28] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[28]),
        .Q(out_stream_TDATA_reg[28]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[29] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[29]),
        .Q(out_stream_TDATA_reg[29]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[2] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[2]),
        .Q(out_stream_TDATA_reg[2]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[30] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[30]),
        .Q(out_stream_TDATA_reg[30]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[31] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[31]),
        .Q(out_stream_TDATA_reg[31]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[3] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[3]),
        .Q(out_stream_TDATA_reg[3]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[4] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[4]),
        .Q(out_stream_TDATA_reg[4]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[5] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[5]),
        .Q(out_stream_TDATA_reg[5]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[6] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[6]),
        .Q(out_stream_TDATA_reg[6]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[7] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[7]),
        .Q(out_stream_TDATA_reg[7]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[8] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[8]),
        .Q(out_stream_TDATA_reg[8]),
        .R(1'b0));
  FDRE \out_stream_TDATA_reg_reg[9] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(data_in[9]),
        .Q(out_stream_TDATA_reg[9]),
        .R(1'b0));
  FDRE \out_stream_TKEEP_reg_reg[0] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(in_stream_TKEEP_int_regslice[0]),
        .Q(out_stream_TKEEP_reg[0]),
        .R(1'b0));
  FDRE \out_stream_TKEEP_reg_reg[1] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(in_stream_TKEEP_int_regslice[1]),
        .Q(out_stream_TKEEP_reg[1]),
        .R(1'b0));
  FDRE \out_stream_TKEEP_reg_reg[2] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(in_stream_TKEEP_int_regslice[2]),
        .Q(out_stream_TKEEP_reg[2]),
        .R(1'b0));
  FDRE \out_stream_TKEEP_reg_reg[3] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(in_stream_TKEEP_int_regslice[3]),
        .Q(out_stream_TKEEP_reg[3]),
        .R(1'b0));
  FDRE \out_stream_TLAST_reg_reg[0] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(in_stream_TLAST_int_regslice),
        .Q(out_stream_TLAST_reg),
        .R(1'b0));
  FDRE \out_stream_TSTRB_reg_reg[0] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(in_stream_TSTRB_int_regslice[0]),
        .Q(out_stream_TSTRB_reg[0]),
        .R(1'b0));
  FDRE \out_stream_TSTRB_reg_reg[1] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(in_stream_TSTRB_int_regslice[1]),
        .Q(out_stream_TSTRB_reg[1]),
        .R(1'b0));
  FDRE \out_stream_TSTRB_reg_reg[2] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(in_stream_TSTRB_int_regslice[2]),
        .Q(out_stream_TSTRB_reg[2]),
        .R(1'b0));
  FDRE \out_stream_TSTRB_reg_reg[3] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(in_stream_TSTRB_int_regslice[3]),
        .Q(out_stream_TSTRB_reg[3]),
        .R(1'b0));
  FDRE \out_stream_TUSER_reg_reg[0] 
       (.C(ap_clk),
        .CE(out_stream_TDATA_reg1),
        .D(in_stream_TUSER_int_regslice),
        .Q(out_stream_TUSER_reg),
        .R(1'b0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_regslice_both regslice_both_in_stream_V_data_V_U
       (.Q(ap_CS_fsm_state3),
        .RSTA(ap_rst),
        .ack_in(ack_in),
        .ack_in_t_reg_0(in_stream_TREADY),
        .ack_in_t_reg_1(regslice_both_out_stream_V_data_V_U_n_2),
        .ap_clk(ap_clk),
        .\data_p1_reg[31]_0 (data_in),
        .in_stream_TDATA(in_stream_TDATA),
        .in_stream_TVALID(in_stream_TVALID),
        .\state_reg[0]_0 (in_stream_TVALID_int_regslice),
        .\state_reg[1]_0 (grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_regslice_both__parameterized1 regslice_both_in_stream_V_keep_V_U
       (.Q(ap_CS_fsm_state3),
        .RSTA(ap_rst),
        .ack_in_t_reg_0(regslice_both_out_stream_V_data_V_U_n_2),
        .ap_clk(ap_clk),
        .\data_p1_reg[3]_0 (in_stream_TKEEP_int_regslice),
        .in_stream_TKEEP(in_stream_TKEEP),
        .in_stream_TVALID(in_stream_TVALID));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_regslice_both__parameterized3 regslice_both_in_stream_V_last_V_U
       (.Q(ap_CS_fsm_state3),
        .RSTA(ap_rst),
        .ack_in_t_reg_0(regslice_both_out_stream_V_data_V_U_n_2),
        .ap_clk(ap_clk),
        .in_stream_TLAST(in_stream_TLAST),
        .in_stream_TLAST_int_regslice(in_stream_TLAST_int_regslice),
        .in_stream_TVALID(in_stream_TVALID));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_regslice_both__parameterized1_0 regslice_both_in_stream_V_strb_V_U
       (.Q(ap_CS_fsm_state3),
        .RSTA(ap_rst),
        .ack_in_t_reg_0(regslice_both_out_stream_V_data_V_U_n_2),
        .ap_clk(ap_clk),
        .\data_p1_reg[3]_0 (in_stream_TSTRB_int_regslice),
        .in_stream_TSTRB(in_stream_TSTRB),
        .in_stream_TVALID(in_stream_TVALID));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_regslice_both__parameterized3_1 regslice_both_in_stream_V_user_V_U
       (.Q(ap_CS_fsm_state3),
        .RSTA(ap_rst),
        .ack_in_t_reg_0(regslice_both_out_stream_V_data_V_U_n_2),
        .ap_clk(ap_clk),
        .in_stream_TUSER(in_stream_TUSER),
        .in_stream_TUSER_int_regslice(in_stream_TUSER_int_regslice),
        .in_stream_TVALID(in_stream_TVALID));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_regslice_both_2 regslice_both_out_stream_V_data_V_U
       (.D(ap_NS_fsm[0]),
        .E(load_p2_1),
        .Q({ap_CS_fsm_state4,ap_CS_fsm_state3,\ap_CS_fsm_reg_n_0_[0] }),
        .RSTA(ap_rst),
        .ack_in(ack_in),
        .\ap_CS_fsm_reg[2] (regslice_both_out_stream_V_data_V_U_n_2),
        .\ap_CS_fsm_reg[3] (regslice_both_out_stream_V_data_V_U_n_4),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter2_reg(in_stream_TVALID_int_regslice),
        .ap_enable_reg_pp0_iter2_reg_0(grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_n_0),
        .ap_start(ap_start),
        .\data_p2_reg[31]_0 (data_in),
        .indvar_flatten_fu_602(indvar_flatten_fu_602),
        .out_stream_TDATA(out_stream_TDATA),
        .out_stream_TDATA_reg(out_stream_TDATA_reg),
        .out_stream_TDATA_reg1(out_stream_TDATA_reg1),
        .out_stream_TREADY(out_stream_TREADY),
        .out_stream_TREADY_0(regslice_both_out_stream_V_data_V_U_n_6),
        .out_stream_TVALID(out_stream_TVALID));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_regslice_both__parameterized1_3 regslice_both_out_stream_V_keep_V_U
       (.D(in_stream_TKEEP_int_regslice),
        .E(load_p2_0),
        .RSTA(ap_rst),
        .ack_in_t_reg_0(regslice_both_out_stream_V_keep_V_U_n_0),
        .ack_in_t_reg_1(regslice_both_out_stream_V_data_V_U_n_2),
        .ap_clk(ap_clk),
        .out_stream_TDATA_reg1(out_stream_TDATA_reg1),
        .out_stream_TKEEP(out_stream_TKEEP),
        .out_stream_TKEEP_reg(out_stream_TKEEP_reg),
        .out_stream_TREADY(out_stream_TREADY));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_regslice_both__parameterized3_4 regslice_both_out_stream_V_last_V_U
       (.Q(ap_CS_fsm_state3),
        .RSTA(ap_rst),
        .ack_in_t_reg_0(regslice_both_out_stream_V_data_V_U_n_2),
        .ap_clk(ap_clk),
        .in_stream_TLAST_int_regslice(in_stream_TLAST_int_regslice),
        .out_stream_TDATA_reg1(out_stream_TDATA_reg1),
        .out_stream_TLAST(out_stream_TLAST),
        .out_stream_TLAST_reg(out_stream_TLAST_reg),
        .out_stream_TREADY(out_stream_TREADY));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_regslice_both__parameterized1_5 regslice_both_out_stream_V_strb_V_U
       (.D(in_stream_TSTRB_int_regslice),
        .E(load_p2),
        .RSTA(ap_rst),
        .ack_in_t_reg_0(regslice_both_out_stream_V_strb_V_U_n_0),
        .ack_in_t_reg_1(regslice_both_out_stream_V_data_V_U_n_2),
        .ap_clk(ap_clk),
        .out_stream_TDATA_reg1(out_stream_TDATA_reg1),
        .out_stream_TREADY(out_stream_TREADY),
        .out_stream_TSTRB(out_stream_TSTRB),
        .out_stream_TSTRB_reg(out_stream_TSTRB_reg));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_regslice_both__parameterized3_6 regslice_both_out_stream_V_user_V_U
       (.Q(ap_CS_fsm_state3),
        .RSTA(ap_rst),
        .ack_in_t_reg_0(regslice_both_out_stream_V_data_V_U_n_2),
        .ap_clk(ap_clk),
        .in_stream_TUSER_int_regslice(in_stream_TUSER_int_regslice),
        .out_stream_TDATA_reg1(out_stream_TDATA_reg1),
        .out_stream_TREADY(out_stream_TREADY),
        .out_stream_TUSER(out_stream_TUSER),
        .out_stream_TUSER_reg(out_stream_TUSER_reg));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_control_s_axi
   (RSTA,
    interrupt,
    s_axi_control_BVALID,
    \FSM_onehot_wstate_reg[2]_0 ,
    \FSM_onehot_wstate_reg[1]_0 ,
    \FSM_onehot_rstate_reg[1]_0 ,
    s_axi_control_RVALID,
    CEA2,
    D,
    ap_start,
    \s_axi_control_WDATA[31] ,
    B,
    A,
    s_axi_control_RDATA,
    ap_clk,
    s_axi_control_BREADY,
    s_axi_control_AWVALID,
    s_axi_control_WVALID,
    s_axi_control_ARVALID,
    s_axi_control_RREADY,
    s_axi_control_ARADDR,
    s_axi_control_WSTRB,
    Q,
    ap_rst_n,
    s_axi_control_WDATA,
    int_ap_start_reg_0,
    s_axi_control_AWADDR);
  output RSTA;
  output interrupt;
  output s_axi_control_BVALID;
  output \FSM_onehot_wstate_reg[2]_0 ;
  output \FSM_onehot_wstate_reg[1]_0 ;
  output \FSM_onehot_rstate_reg[1]_0 ;
  output s_axi_control_RVALID;
  output CEA2;
  output [0:0]D;
  output ap_start;
  output [31:0]\s_axi_control_WDATA[31] ;
  output [13:0]B;
  output [16:0]A;
  output [31:0]s_axi_control_RDATA;
  input ap_clk;
  input s_axi_control_BREADY;
  input s_axi_control_AWVALID;
  input s_axi_control_WVALID;
  input s_axi_control_ARVALID;
  input s_axi_control_RREADY;
  input [4:0]s_axi_control_ARADDR;
  input [3:0]s_axi_control_WSTRB;
  input [0:0]Q;
  input ap_rst_n;
  input [31:0]s_axi_control_WDATA;
  input int_ap_start_reg_0;
  input [2:0]s_axi_control_AWADDR;

  wire [16:0]A;
  wire [13:0]B;
  wire CEA2;
  wire [0:0]D;
  wire \FSM_onehot_rstate_reg[1]_0 ;
  wire \FSM_onehot_wstate[1]_i_1_n_0 ;
  wire \FSM_onehot_wstate[2]_i_1_n_0 ;
  wire \FSM_onehot_wstate[3]_i_1_n_0 ;
  wire \FSM_onehot_wstate_reg[1]_0 ;
  wire \FSM_onehot_wstate_reg[2]_0 ;
  wire [0:0]Q;
  wire RSTA;
  wire ap_clk;
  wire ap_idle;
  wire ap_rst_n;
  wire ap_start;
  wire ar_hs;
  wire auto_restart_status_i_1_n_0;
  wire auto_restart_status_reg_n_0;
  wire int_ap_ready;
  wire int_ap_ready_i_1_n_0;
  wire int_ap_start1;
  wire int_ap_start_i_1_n_0;
  wire int_ap_start_reg_0;
  wire int_auto_restart_i_1_n_0;
  wire int_gie;
  wire int_gie_i_1_n_0;
  wire int_ier11_out;
  wire int_interrupt0;
  wire int_isr8_out;
  wire \int_isr[0]_i_1_n_0 ;
  wire \int_isr[1]_i_1_n_0 ;
  wire \int_isr_reg_n_0_[0] ;
  wire int_task_ap_done;
  wire int_task_ap_done0__4;
  wire int_task_ap_done_i_1_n_0;
  wire int_width;
  wire \int_width_reg_n_0_[0] ;
  wire \int_width_reg_n_0_[10] ;
  wire \int_width_reg_n_0_[11] ;
  wire \int_width_reg_n_0_[12] ;
  wire \int_width_reg_n_0_[13] ;
  wire \int_width_reg_n_0_[14] ;
  wire \int_width_reg_n_0_[15] ;
  wire \int_width_reg_n_0_[16] ;
  wire \int_width_reg_n_0_[17] ;
  wire \int_width_reg_n_0_[18] ;
  wire \int_width_reg_n_0_[19] ;
  wire \int_width_reg_n_0_[1] ;
  wire \int_width_reg_n_0_[20] ;
  wire \int_width_reg_n_0_[21] ;
  wire \int_width_reg_n_0_[22] ;
  wire \int_width_reg_n_0_[23] ;
  wire \int_width_reg_n_0_[24] ;
  wire \int_width_reg_n_0_[25] ;
  wire \int_width_reg_n_0_[26] ;
  wire \int_width_reg_n_0_[27] ;
  wire \int_width_reg_n_0_[28] ;
  wire \int_width_reg_n_0_[29] ;
  wire \int_width_reg_n_0_[2] ;
  wire \int_width_reg_n_0_[30] ;
  wire \int_width_reg_n_0_[31] ;
  wire \int_width_reg_n_0_[3] ;
  wire \int_width_reg_n_0_[4] ;
  wire \int_width_reg_n_0_[5] ;
  wire \int_width_reg_n_0_[6] ;
  wire \int_width_reg_n_0_[7] ;
  wire \int_width_reg_n_0_[8] ;
  wire \int_width_reg_n_0_[9] ;
  wire interrupt;
  wire [31:0]mul_ln9_fu_105_p00;
  wire [31:0]\or ;
  wire p_0_in;
  wire p_1_in;
  wire [1:0]p_2_in;
  wire [0:0]p_3_in;
  wire [7:2]p_4_in;
  wire \rdata_data[0]_i_1_n_0 ;
  wire \rdata_data[0]_i_2_n_0 ;
  wire \rdata_data[10]_i_1_n_0 ;
  wire \rdata_data[11]_i_1_n_0 ;
  wire \rdata_data[12]_i_1_n_0 ;
  wire \rdata_data[13]_i_1_n_0 ;
  wire \rdata_data[14]_i_1_n_0 ;
  wire \rdata_data[15]_i_1_n_0 ;
  wire \rdata_data[16]_i_1_n_0 ;
  wire \rdata_data[17]_i_1_n_0 ;
  wire \rdata_data[18]_i_1_n_0 ;
  wire \rdata_data[19]_i_1_n_0 ;
  wire \rdata_data[1]_i_1_n_0 ;
  wire \rdata_data[1]_i_2_n_0 ;
  wire \rdata_data[1]_i_3_n_0 ;
  wire \rdata_data[1]_i_4_n_0 ;
  wire \rdata_data[20]_i_1_n_0 ;
  wire \rdata_data[21]_i_1_n_0 ;
  wire \rdata_data[22]_i_1_n_0 ;
  wire \rdata_data[23]_i_1_n_0 ;
  wire \rdata_data[24]_i_1_n_0 ;
  wire \rdata_data[25]_i_1_n_0 ;
  wire \rdata_data[26]_i_1_n_0 ;
  wire \rdata_data[27]_i_1_n_0 ;
  wire \rdata_data[28]_i_1_n_0 ;
  wire \rdata_data[29]_i_1_n_0 ;
  wire \rdata_data[2]_i_1_n_0 ;
  wire \rdata_data[2]_i_2_n_0 ;
  wire \rdata_data[30]_i_1_n_0 ;
  wire \rdata_data[31]_i_1_n_0 ;
  wire \rdata_data[31]_i_3_n_0 ;
  wire \rdata_data[3]_i_1_n_0 ;
  wire \rdata_data[3]_i_2_n_0 ;
  wire \rdata_data[4]_i_1_n_0 ;
  wire \rdata_data[5]_i_1_n_0 ;
  wire \rdata_data[6]_i_1_n_0 ;
  wire \rdata_data[7]_i_1_n_0 ;
  wire \rdata_data[7]_i_2_n_0 ;
  wire \rdata_data[8]_i_1_n_0 ;
  wire \rdata_data[9]_i_1_n_0 ;
  wire \rdata_data[9]_i_2_n_0 ;
  wire [2:1]rnext;
  wire [4:0]s_axi_control_ARADDR;
  wire s_axi_control_ARVALID;
  wire [2:0]s_axi_control_AWADDR;
  wire s_axi_control_AWVALID;
  wire s_axi_control_BREADY;
  wire s_axi_control_BVALID;
  wire [31:0]s_axi_control_RDATA;
  wire s_axi_control_RREADY;
  wire s_axi_control_RVALID;
  wire [31:0]s_axi_control_WDATA;
  wire [31:0]\s_axi_control_WDATA[31] ;
  wire [3:0]s_axi_control_WSTRB;
  wire s_axi_control_WVALID;
  wire tmp_product_i_18_n_1;
  wire tmp_product_i_18_n_2;
  wire tmp_product_i_18_n_3;
  wire tmp_product_i_18_n_4;
  wire tmp_product_i_18_n_5;
  wire tmp_product_i_18_n_6;
  wire tmp_product_i_18_n_7;
  wire tmp_product_i_19_n_0;
  wire tmp_product_i_19_n_1;
  wire tmp_product_i_19_n_2;
  wire tmp_product_i_19_n_3;
  wire tmp_product_i_19_n_4;
  wire tmp_product_i_19_n_5;
  wire tmp_product_i_19_n_6;
  wire tmp_product_i_19_n_7;
  wire tmp_product_i_20_n_0;
  wire tmp_product_i_21_n_0;
  wire tmp_product_i_22_n_0;
  wire tmp_product_i_23_n_0;
  wire tmp_product_i_24_n_0;
  wire tmp_product_i_25_n_0;
  wire tmp_product_i_26_n_0;
  wire tmp_product_i_27_n_0;
  wire tmp_product_i_28_n_0;
  wire tmp_product_i_29_n_0;
  wire tmp_product_i_30_n_0;
  wire tmp_product_i_31_n_0;
  wire tmp_product_i_32_n_0;
  wire tmp_product_i_33_n_0;
  wire tmp_product_i_34_n_0;
  wire tmp_product_i_35_n_0;
  wire tmp_product_i_36_n_0;
  wire tmp_product_i_37_n_0;
  wire tmp_product_i_38_n_0;
  wire tmp_product_i_39_n_0;
  wire tmp_product_i_40_n_0;
  wire tmp_product_i_41_n_0;
  wire tmp_product_i_42_n_0;
  wire tmp_product_i_43_n_0;
  wire tmp_product_i_44_n_0;
  wire tmp_product_i_45_n_0;
  wire tmp_product_i_46_n_0;
  wire tmp_product_i_47_n_0;
  wire tmp_product_i_48_n_0;
  wire tmp_product_i_49_n_0;
  wire tmp_product_i_50_n_0;
  wire tmp_product_i_51_n_0;
  wire waddr;
  wire \waddr_reg_n_0_[2] ;
  wire \waddr_reg_n_0_[3] ;
  wire \waddr_reg_n_0_[4] ;
  wire [7:0]NLW_tmp_product_i_18_O_UNCONNECTED;
  wire [7:0]NLW_tmp_product_i_19_O_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hF747)) 
    \FSM_onehot_rstate[1]_i_1 
       (.I0(s_axi_control_ARVALID),
        .I1(\FSM_onehot_rstate_reg[1]_0 ),
        .I2(s_axi_control_RVALID),
        .I3(s_axi_control_RREADY),
        .O(rnext[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_rstate[2]_i_1 
       (.I0(s_axi_control_ARVALID),
        .I1(\FSM_onehot_rstate_reg[1]_0 ),
        .I2(s_axi_control_RREADY),
        .I3(s_axi_control_RVALID),
        .O(rnext[2]));
  (* FSM_ENCODED_STATES = "rddata:100,rdidle:010,iSTATE:001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_rstate_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rnext[1]),
        .Q(\FSM_onehot_rstate_reg[1]_0 ),
        .R(RSTA));
  (* FSM_ENCODED_STATES = "rddata:100,rdidle:010,iSTATE:001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_rstate_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rnext[2]),
        .Q(s_axi_control_RVALID),
        .R(RSTA));
  LUT5 #(
    .INIT(32'h888BFF8B)) 
    \FSM_onehot_wstate[1]_i_1 
       (.I0(s_axi_control_BREADY),
        .I1(s_axi_control_BVALID),
        .I2(\FSM_onehot_wstate_reg[2]_0 ),
        .I3(\FSM_onehot_wstate_reg[1]_0 ),
        .I4(s_axi_control_AWVALID),
        .O(\FSM_onehot_wstate[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_wstate[2]_i_1 
       (.I0(s_axi_control_AWVALID),
        .I1(\FSM_onehot_wstate_reg[1]_0 ),
        .I2(s_axi_control_WVALID),
        .I3(\FSM_onehot_wstate_reg[2]_0 ),
        .O(\FSM_onehot_wstate[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_wstate[3]_i_1 
       (.I0(s_axi_control_WVALID),
        .I1(\FSM_onehot_wstate_reg[2]_0 ),
        .I2(s_axi_control_BREADY),
        .I3(s_axi_control_BVALID),
        .O(\FSM_onehot_wstate[3]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "wrdata:0100,wrresp:1000,wridle:0010,iSTATE:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_wstate_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_wstate[1]_i_1_n_0 ),
        .Q(\FSM_onehot_wstate_reg[1]_0 ),
        .R(RSTA));
  (* FSM_ENCODED_STATES = "wrdata:0100,wrresp:1000,wridle:0010,iSTATE:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_wstate_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_wstate[2]_i_1_n_0 ),
        .Q(\FSM_onehot_wstate_reg[2]_0 ),
        .R(RSTA));
  (* FSM_ENCODED_STATES = "wrdata:0100,wrresp:1000,wridle:0010,iSTATE:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_wstate_reg[3] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_wstate[3]_i_1_n_0 ),
        .Q(s_axi_control_BVALID),
        .R(RSTA));
  LUT1 #(
    .INIT(2'h1)) 
    ack_in_t_i_1
       (.I0(ap_rst_n),
        .O(RSTA));
  LUT2 #(
    .INIT(4'h8)) 
    \ap_CS_fsm[1]_i_1 
       (.I0(ap_start),
        .I1(Q),
        .O(D));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hEFAA)) 
    auto_restart_status_i_1
       (.I0(p_4_in[7]),
        .I1(ap_start),
        .I2(Q),
        .I3(auto_restart_status_reg_n_0),
        .O(auto_restart_status_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    auto_restart_status_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(auto_restart_status_i_1_n_0),
        .Q(auto_restart_status_reg_n_0),
        .R(RSTA));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    int_ap_idle_i_1
       (.I0(Q),
        .I1(ap_start),
        .O(ap_idle));
  FDRE #(
    .INIT(1'b0)) 
    int_ap_idle_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_idle),
        .Q(p_4_in[2]),
        .R(RSTA));
  LUT4 #(
    .INIT(16'h4F44)) 
    int_ap_ready_i_1
       (.I0(p_4_in[7]),
        .I1(int_ap_start_reg_0),
        .I2(int_task_ap_done0__4),
        .I3(int_ap_ready),
        .O(int_ap_ready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    int_ap_ready_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(int_ap_ready_i_1_n_0),
        .Q(int_ap_ready),
        .R(RSTA));
  LUT5 #(
    .INIT(32'hFBBBF888)) 
    int_ap_start_i_1
       (.I0(p_4_in[7]),
        .I1(int_ap_start_reg_0),
        .I2(s_axi_control_WDATA[0]),
        .I3(int_ap_start1),
        .I4(ap_start),
        .O(int_ap_start_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000080)) 
    int_ap_start_i_3
       (.I0(\FSM_onehot_wstate_reg[2]_0 ),
        .I1(s_axi_control_WVALID),
        .I2(s_axi_control_WSTRB[0]),
        .I3(\waddr_reg_n_0_[3] ),
        .I4(\waddr_reg_n_0_[2] ),
        .I5(\waddr_reg_n_0_[4] ),
        .O(int_ap_start1));
  FDRE #(
    .INIT(1'b0)) 
    int_ap_start_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(int_ap_start_i_1_n_0),
        .Q(ap_start),
        .R(RSTA));
  LUT3 #(
    .INIT(8'hB8)) 
    int_auto_restart_i_1
       (.I0(s_axi_control_WDATA[7]),
        .I1(int_ap_start1),
        .I2(p_4_in[7]),
        .O(int_auto_restart_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    int_auto_restart_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(int_auto_restart_i_1_n_0),
        .Q(p_4_in[7]),
        .R(RSTA));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    int_gie_i_1
       (.I0(s_axi_control_WDATA[0]),
        .I1(int_gie),
        .I2(p_3_in),
        .O(int_gie_i_1_n_0));
  LUT6 #(
    .INIT(64'h0008000000000000)) 
    int_gie_i_2
       (.I0(s_axi_control_WSTRB[0]),
        .I1(\waddr_reg_n_0_[2] ),
        .I2(\waddr_reg_n_0_[4] ),
        .I3(\waddr_reg_n_0_[3] ),
        .I4(s_axi_control_WVALID),
        .I5(\FSM_onehot_wstate_reg[2]_0 ),
        .O(int_gie));
  FDRE #(
    .INIT(1'b0)) 
    int_gie_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(int_gie_i_1_n_0),
        .Q(p_3_in),
        .R(RSTA));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[0]_i_1 
       (.I0(s_axi_control_WDATA[0]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(mul_ln9_fu_105_p00[0]),
        .O(\s_axi_control_WDATA[31] [0]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[10]_i_1 
       (.I0(s_axi_control_WDATA[10]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(mul_ln9_fu_105_p00[10]),
        .O(\s_axi_control_WDATA[31] [10]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[11]_i_1 
       (.I0(s_axi_control_WDATA[11]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(mul_ln9_fu_105_p00[11]),
        .O(\s_axi_control_WDATA[31] [11]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[12]_i_1 
       (.I0(s_axi_control_WDATA[12]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(mul_ln9_fu_105_p00[12]),
        .O(\s_axi_control_WDATA[31] [12]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[13]_i_1 
       (.I0(s_axi_control_WDATA[13]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(mul_ln9_fu_105_p00[13]),
        .O(\s_axi_control_WDATA[31] [13]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[14]_i_1 
       (.I0(s_axi_control_WDATA[14]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(mul_ln9_fu_105_p00[14]),
        .O(\s_axi_control_WDATA[31] [14]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[15]_i_1 
       (.I0(s_axi_control_WDATA[15]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(mul_ln9_fu_105_p00[15]),
        .O(\s_axi_control_WDATA[31] [15]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[16]_i_1 
       (.I0(s_axi_control_WDATA[16]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(mul_ln9_fu_105_p00[16]),
        .O(\s_axi_control_WDATA[31] [16]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[17]_i_1 
       (.I0(s_axi_control_WDATA[17]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(mul_ln9_fu_105_p00[17]),
        .O(\s_axi_control_WDATA[31] [17]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[18]_i_1 
       (.I0(s_axi_control_WDATA[18]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(mul_ln9_fu_105_p00[18]),
        .O(\s_axi_control_WDATA[31] [18]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[19]_i_1 
       (.I0(s_axi_control_WDATA[19]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(mul_ln9_fu_105_p00[19]),
        .O(\s_axi_control_WDATA[31] [19]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[1]_i_1 
       (.I0(s_axi_control_WDATA[1]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(mul_ln9_fu_105_p00[1]),
        .O(\s_axi_control_WDATA[31] [1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[20]_i_1 
       (.I0(s_axi_control_WDATA[20]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(mul_ln9_fu_105_p00[20]),
        .O(\s_axi_control_WDATA[31] [20]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[21]_i_1 
       (.I0(s_axi_control_WDATA[21]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(mul_ln9_fu_105_p00[21]),
        .O(\s_axi_control_WDATA[31] [21]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[22]_i_1 
       (.I0(s_axi_control_WDATA[22]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(mul_ln9_fu_105_p00[22]),
        .O(\s_axi_control_WDATA[31] [22]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[23]_i_1 
       (.I0(s_axi_control_WDATA[23]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(mul_ln9_fu_105_p00[23]),
        .O(\s_axi_control_WDATA[31] [23]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[24]_i_1 
       (.I0(s_axi_control_WDATA[24]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(mul_ln9_fu_105_p00[24]),
        .O(\s_axi_control_WDATA[31] [24]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[25]_i_1 
       (.I0(s_axi_control_WDATA[25]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(mul_ln9_fu_105_p00[25]),
        .O(\s_axi_control_WDATA[31] [25]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[26]_i_1 
       (.I0(s_axi_control_WDATA[26]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(mul_ln9_fu_105_p00[26]),
        .O(\s_axi_control_WDATA[31] [26]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[27]_i_1 
       (.I0(s_axi_control_WDATA[27]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(mul_ln9_fu_105_p00[27]),
        .O(\s_axi_control_WDATA[31] [27]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[28]_i_1 
       (.I0(s_axi_control_WDATA[28]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(mul_ln9_fu_105_p00[28]),
        .O(\s_axi_control_WDATA[31] [28]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[29]_i_1 
       (.I0(s_axi_control_WDATA[29]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(mul_ln9_fu_105_p00[29]),
        .O(\s_axi_control_WDATA[31] [29]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[2]_i_1 
       (.I0(s_axi_control_WDATA[2]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(mul_ln9_fu_105_p00[2]),
        .O(\s_axi_control_WDATA[31] [2]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[30]_i_1 
       (.I0(s_axi_control_WDATA[30]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(mul_ln9_fu_105_p00[30]),
        .O(\s_axi_control_WDATA[31] [30]));
  LUT5 #(
    .INIT(32'h00080000)) 
    \int_height[31]_i_1 
       (.I0(\FSM_onehot_wstate_reg[2]_0 ),
        .I1(s_axi_control_WVALID),
        .I2(\waddr_reg_n_0_[3] ),
        .I3(\waddr_reg_n_0_[2] ),
        .I4(\waddr_reg_n_0_[4] ),
        .O(CEA2));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[31]_i_2 
       (.I0(s_axi_control_WDATA[31]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(mul_ln9_fu_105_p00[31]),
        .O(\s_axi_control_WDATA[31] [31]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[3]_i_1 
       (.I0(s_axi_control_WDATA[3]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(mul_ln9_fu_105_p00[3]),
        .O(\s_axi_control_WDATA[31] [3]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[4]_i_1 
       (.I0(s_axi_control_WDATA[4]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(mul_ln9_fu_105_p00[4]),
        .O(\s_axi_control_WDATA[31] [4]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[5]_i_1 
       (.I0(s_axi_control_WDATA[5]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(mul_ln9_fu_105_p00[5]),
        .O(\s_axi_control_WDATA[31] [5]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[6]_i_1 
       (.I0(s_axi_control_WDATA[6]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(mul_ln9_fu_105_p00[6]),
        .O(\s_axi_control_WDATA[31] [6]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[7]_i_1 
       (.I0(s_axi_control_WDATA[7]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(mul_ln9_fu_105_p00[7]),
        .O(\s_axi_control_WDATA[31] [7]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[8]_i_1 
       (.I0(s_axi_control_WDATA[8]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(mul_ln9_fu_105_p00[8]),
        .O(\s_axi_control_WDATA[31] [8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_height[9]_i_1 
       (.I0(s_axi_control_WDATA[9]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(mul_ln9_fu_105_p00[9]),
        .O(\s_axi_control_WDATA[31] [9]));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[0] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [0]),
        .Q(mul_ln9_fu_105_p00[0]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[10] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [10]),
        .Q(mul_ln9_fu_105_p00[10]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[11] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [11]),
        .Q(mul_ln9_fu_105_p00[11]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[12] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [12]),
        .Q(mul_ln9_fu_105_p00[12]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[13] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [13]),
        .Q(mul_ln9_fu_105_p00[13]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[14] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [14]),
        .Q(mul_ln9_fu_105_p00[14]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[15] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [15]),
        .Q(mul_ln9_fu_105_p00[15]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[16] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [16]),
        .Q(mul_ln9_fu_105_p00[16]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[17] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [17]),
        .Q(mul_ln9_fu_105_p00[17]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[18] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [18]),
        .Q(mul_ln9_fu_105_p00[18]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[19] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [19]),
        .Q(mul_ln9_fu_105_p00[19]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[1] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [1]),
        .Q(mul_ln9_fu_105_p00[1]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[20] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [20]),
        .Q(mul_ln9_fu_105_p00[20]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[21] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [21]),
        .Q(mul_ln9_fu_105_p00[21]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[22] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [22]),
        .Q(mul_ln9_fu_105_p00[22]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[23] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [23]),
        .Q(mul_ln9_fu_105_p00[23]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[24] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [24]),
        .Q(mul_ln9_fu_105_p00[24]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[25] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [25]),
        .Q(mul_ln9_fu_105_p00[25]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[26] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [26]),
        .Q(mul_ln9_fu_105_p00[26]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[27] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [27]),
        .Q(mul_ln9_fu_105_p00[27]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[28] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [28]),
        .Q(mul_ln9_fu_105_p00[28]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[29] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [29]),
        .Q(mul_ln9_fu_105_p00[29]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[2] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [2]),
        .Q(mul_ln9_fu_105_p00[2]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[30] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [30]),
        .Q(mul_ln9_fu_105_p00[30]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[31] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [31]),
        .Q(mul_ln9_fu_105_p00[31]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[3] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [3]),
        .Q(mul_ln9_fu_105_p00[3]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[4] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [4]),
        .Q(mul_ln9_fu_105_p00[4]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[5] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [5]),
        .Q(mul_ln9_fu_105_p00[5]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[6] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [6]),
        .Q(mul_ln9_fu_105_p00[6]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[7] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [7]),
        .Q(mul_ln9_fu_105_p00[7]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[8] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [8]),
        .Q(mul_ln9_fu_105_p00[8]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_height_reg[9] 
       (.C(ap_clk),
        .CE(CEA2),
        .D(\s_axi_control_WDATA[31] [9]),
        .Q(mul_ln9_fu_105_p00[9]),
        .R(RSTA));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \int_ier[1]_i_1 
       (.I0(s_axi_control_WSTRB[0]),
        .I1(s_axi_control_WVALID),
        .I2(\FSM_onehot_wstate_reg[2]_0 ),
        .I3(\waddr_reg_n_0_[3] ),
        .I4(\waddr_reg_n_0_[2] ),
        .I5(\waddr_reg_n_0_[4] ),
        .O(int_ier11_out));
  FDRE #(
    .INIT(1'b0)) 
    \int_ier_reg[0] 
       (.C(ap_clk),
        .CE(int_ier11_out),
        .D(s_axi_control_WDATA[0]),
        .Q(p_2_in[0]),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_ier_reg[1] 
       (.C(ap_clk),
        .CE(int_ier11_out),
        .D(s_axi_control_WDATA[1]),
        .Q(p_2_in[1]),
        .R(RSTA));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    int_interrupt_i_1
       (.I0(p_3_in),
        .I1(p_1_in),
        .I2(\int_isr_reg_n_0_[0] ),
        .O(int_interrupt0));
  FDRE #(
    .INIT(1'b0)) 
    int_interrupt_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(int_interrupt0),
        .Q(interrupt),
        .R(RSTA));
  LUT5 #(
    .INIT(32'hF777F888)) 
    \int_isr[0]_i_1 
       (.I0(s_axi_control_WDATA[0]),
        .I1(int_isr8_out),
        .I2(int_ap_start_reg_0),
        .I3(p_2_in[0]),
        .I4(\int_isr_reg_n_0_[0] ),
        .O(\int_isr[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0800000000000000)) 
    \int_isr[0]_i_2 
       (.I0(s_axi_control_WSTRB[0]),
        .I1(\waddr_reg_n_0_[2] ),
        .I2(\waddr_reg_n_0_[4] ),
        .I3(\waddr_reg_n_0_[3] ),
        .I4(s_axi_control_WVALID),
        .I5(\FSM_onehot_wstate_reg[2]_0 ),
        .O(int_isr8_out));
  LUT5 #(
    .INIT(32'hF777F888)) 
    \int_isr[1]_i_1 
       (.I0(s_axi_control_WDATA[1]),
        .I1(int_isr8_out),
        .I2(p_2_in[1]),
        .I3(int_ap_start_reg_0),
        .I4(p_1_in),
        .O(\int_isr[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \int_isr_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\int_isr[0]_i_1_n_0 ),
        .Q(\int_isr_reg_n_0_[0] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_isr_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\int_isr[1]_i_1_n_0 ),
        .Q(p_1_in),
        .R(RSTA));
  LUT6 #(
    .INIT(64'h7520FFFF75207520)) 
    int_task_ap_done_i_1
       (.I0(auto_restart_status_reg_n_0),
        .I1(p_4_in[2]),
        .I2(ap_idle),
        .I3(int_ap_start_reg_0),
        .I4(int_task_ap_done0__4),
        .I5(int_task_ap_done),
        .O(int_task_ap_done_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    int_task_ap_done_i_2
       (.I0(ar_hs),
        .I1(s_axi_control_ARADDR[2]),
        .I2(s_axi_control_ARADDR[4]),
        .I3(s_axi_control_ARADDR[0]),
        .I4(s_axi_control_ARADDR[1]),
        .I5(s_axi_control_ARADDR[3]),
        .O(int_task_ap_done0__4));
  FDRE #(
    .INIT(1'b0)) 
    int_task_ap_done_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(int_task_ap_done_i_1_n_0),
        .Q(int_task_ap_done),
        .R(RSTA));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[0]_i_1 
       (.I0(s_axi_control_WDATA[0]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_width_reg_n_0_[0] ),
        .O(\or [0]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[10]_i_1 
       (.I0(s_axi_control_WDATA[10]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_width_reg_n_0_[10] ),
        .O(\or [10]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[11]_i_1 
       (.I0(s_axi_control_WDATA[11]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_width_reg_n_0_[11] ),
        .O(\or [11]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[12]_i_1 
       (.I0(s_axi_control_WDATA[12]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_width_reg_n_0_[12] ),
        .O(\or [12]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[13]_i_1 
       (.I0(s_axi_control_WDATA[13]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_width_reg_n_0_[13] ),
        .O(\or [13]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[14]_i_1 
       (.I0(s_axi_control_WDATA[14]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_width_reg_n_0_[14] ),
        .O(\or [14]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[15]_i_1 
       (.I0(s_axi_control_WDATA[15]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_width_reg_n_0_[15] ),
        .O(\or [15]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[16]_i_1 
       (.I0(s_axi_control_WDATA[16]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_width_reg_n_0_[16] ),
        .O(\or [16]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[17]_i_1 
       (.I0(s_axi_control_WDATA[17]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_width_reg_n_0_[17] ),
        .O(\or [17]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[18]_i_1 
       (.I0(s_axi_control_WDATA[18]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_width_reg_n_0_[18] ),
        .O(\or [18]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[19]_i_1 
       (.I0(s_axi_control_WDATA[19]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_width_reg_n_0_[19] ),
        .O(\or [19]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[1]_i_1 
       (.I0(s_axi_control_WDATA[1]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_width_reg_n_0_[1] ),
        .O(\or [1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[20]_i_1 
       (.I0(s_axi_control_WDATA[20]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_width_reg_n_0_[20] ),
        .O(\or [20]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[21]_i_1 
       (.I0(s_axi_control_WDATA[21]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_width_reg_n_0_[21] ),
        .O(\or [21]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[22]_i_1 
       (.I0(s_axi_control_WDATA[22]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_width_reg_n_0_[22] ),
        .O(\or [22]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[23]_i_1 
       (.I0(s_axi_control_WDATA[23]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_width_reg_n_0_[23] ),
        .O(\or [23]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[24]_i_1 
       (.I0(s_axi_control_WDATA[24]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_width_reg_n_0_[24] ),
        .O(\or [24]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[25]_i_1 
       (.I0(s_axi_control_WDATA[25]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_width_reg_n_0_[25] ),
        .O(\or [25]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[26]_i_1 
       (.I0(s_axi_control_WDATA[26]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_width_reg_n_0_[26] ),
        .O(\or [26]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[27]_i_1 
       (.I0(s_axi_control_WDATA[27]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_width_reg_n_0_[27] ),
        .O(\or [27]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[28]_i_1 
       (.I0(s_axi_control_WDATA[28]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_width_reg_n_0_[28] ),
        .O(\or [28]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[29]_i_1 
       (.I0(s_axi_control_WDATA[29]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_width_reg_n_0_[29] ),
        .O(\or [29]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[2]_i_1 
       (.I0(s_axi_control_WDATA[2]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_width_reg_n_0_[2] ),
        .O(\or [2]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[30]_i_1 
       (.I0(s_axi_control_WDATA[30]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_width_reg_n_0_[30] ),
        .O(\or [30]));
  LUT5 #(
    .INIT(32'h40000000)) 
    \int_width[31]_i_1 
       (.I0(\waddr_reg_n_0_[2] ),
        .I1(\waddr_reg_n_0_[3] ),
        .I2(\waddr_reg_n_0_[4] ),
        .I3(\FSM_onehot_wstate_reg[2]_0 ),
        .I4(s_axi_control_WVALID),
        .O(int_width));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[31]_i_2 
       (.I0(s_axi_control_WDATA[31]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_width_reg_n_0_[31] ),
        .O(\or [31]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[3]_i_1 
       (.I0(s_axi_control_WDATA[3]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_width_reg_n_0_[3] ),
        .O(\or [3]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[4]_i_1 
       (.I0(s_axi_control_WDATA[4]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_width_reg_n_0_[4] ),
        .O(\or [4]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[5]_i_1 
       (.I0(s_axi_control_WDATA[5]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_width_reg_n_0_[5] ),
        .O(\or [5]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[6]_i_1 
       (.I0(s_axi_control_WDATA[6]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_width_reg_n_0_[6] ),
        .O(\or [6]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[7]_i_1 
       (.I0(s_axi_control_WDATA[7]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_width_reg_n_0_[7] ),
        .O(\or [7]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[8]_i_1 
       (.I0(s_axi_control_WDATA[8]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_width_reg_n_0_[8] ),
        .O(\or [8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_width[9]_i_1 
       (.I0(s_axi_control_WDATA[9]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_width_reg_n_0_[9] ),
        .O(\or [9]));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[0] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [0]),
        .Q(\int_width_reg_n_0_[0] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[10] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [10]),
        .Q(\int_width_reg_n_0_[10] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[11] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [11]),
        .Q(\int_width_reg_n_0_[11] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[12] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [12]),
        .Q(\int_width_reg_n_0_[12] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[13] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [13]),
        .Q(\int_width_reg_n_0_[13] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[14] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [14]),
        .Q(\int_width_reg_n_0_[14] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[15] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [15]),
        .Q(\int_width_reg_n_0_[15] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[16] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [16]),
        .Q(\int_width_reg_n_0_[16] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[17] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [17]),
        .Q(\int_width_reg_n_0_[17] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[18] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [18]),
        .Q(\int_width_reg_n_0_[18] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[19] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [19]),
        .Q(\int_width_reg_n_0_[19] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[1] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [1]),
        .Q(\int_width_reg_n_0_[1] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[20] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [20]),
        .Q(\int_width_reg_n_0_[20] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[21] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [21]),
        .Q(\int_width_reg_n_0_[21] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[22] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [22]),
        .Q(\int_width_reg_n_0_[22] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[23] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [23]),
        .Q(\int_width_reg_n_0_[23] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[24] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [24]),
        .Q(\int_width_reg_n_0_[24] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[25] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [25]),
        .Q(\int_width_reg_n_0_[25] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[26] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [26]),
        .Q(\int_width_reg_n_0_[26] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[27] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [27]),
        .Q(\int_width_reg_n_0_[27] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[28] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [28]),
        .Q(\int_width_reg_n_0_[28] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[29] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [29]),
        .Q(\int_width_reg_n_0_[29] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[2] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [2]),
        .Q(\int_width_reg_n_0_[2] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[30] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [30]),
        .Q(\int_width_reg_n_0_[30] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[31] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [31]),
        .Q(\int_width_reg_n_0_[31] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[3] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [3]),
        .Q(\int_width_reg_n_0_[3] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[4] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [4]),
        .Q(\int_width_reg_n_0_[4] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[5] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [5]),
        .Q(\int_width_reg_n_0_[5] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[6] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [6]),
        .Q(\int_width_reg_n_0_[6] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[7] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [7]),
        .Q(\int_width_reg_n_0_[7] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[8] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [8]),
        .Q(\int_width_reg_n_0_[8] ),
        .R(RSTA));
  FDRE #(
    .INIT(1'b0)) 
    \int_width_reg[9] 
       (.C(ap_clk),
        .CE(int_width),
        .D(\or [9]),
        .Q(\int_width_reg_n_0_[9] ),
        .R(RSTA));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'h8)) 
    mul_ln9_reg_138_reg_i_1
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[30] ),
        .O(B[13]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT2 #(
    .INIT(4'h8)) 
    mul_ln9_reg_138_reg_i_10
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[21] ),
        .O(B[4]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT2 #(
    .INIT(4'h8)) 
    mul_ln9_reg_138_reg_i_11
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[20] ),
        .O(B[3]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'h8)) 
    mul_ln9_reg_138_reg_i_12
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[19] ),
        .O(B[2]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'h8)) 
    mul_ln9_reg_138_reg_i_13
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[18] ),
        .O(B[1]));
  LUT2 #(
    .INIT(4'h8)) 
    mul_ln9_reg_138_reg_i_14
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[17] ),
        .O(B[0]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h8)) 
    mul_ln9_reg_138_reg_i_2
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[29] ),
        .O(B[12]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h8)) 
    mul_ln9_reg_138_reg_i_3
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[28] ),
        .O(B[11]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT2 #(
    .INIT(4'h8)) 
    mul_ln9_reg_138_reg_i_4
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[27] ),
        .O(B[10]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT2 #(
    .INIT(4'h8)) 
    mul_ln9_reg_138_reg_i_5
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[26] ),
        .O(B[9]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT2 #(
    .INIT(4'h8)) 
    mul_ln9_reg_138_reg_i_6
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[25] ),
        .O(B[8]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT2 #(
    .INIT(4'h8)) 
    mul_ln9_reg_138_reg_i_7
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[24] ),
        .O(B[7]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'h8)) 
    mul_ln9_reg_138_reg_i_8
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[23] ),
        .O(B[6]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'h8)) 
    mul_ln9_reg_138_reg_i_9
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[22] ),
        .O(B[5]));
  LUT6 #(
    .INIT(64'h00000000CCE200E2)) 
    \rdata_data[0]_i_1 
       (.I0(mul_ln9_fu_105_p00[0]),
        .I1(\rdata_data[1]_i_2_n_0 ),
        .I2(\int_width_reg_n_0_[0] ),
        .I3(\rdata_data[1]_i_3_n_0 ),
        .I4(\rdata_data[0]_i_2_n_0 ),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata_data[0]_i_2 
       (.I0(\int_isr_reg_n_0_[0] ),
        .I1(p_3_in),
        .I2(s_axi_control_ARADDR[2]),
        .I3(p_2_in[0]),
        .I4(s_axi_control_ARADDR[3]),
        .I5(ap_start),
        .O(\rdata_data[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[10]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[10] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[10]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[11]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[11] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[11]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[12]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[12] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[12]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[13]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[13] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[13]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[14]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[14] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[14]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[15]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[15] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[15]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[16]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[16] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[16]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[17]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[17] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[17]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[18]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[18] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[18]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[19]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[19] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[19]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFE200E2)) 
    \rdata_data[1]_i_1 
       (.I0(mul_ln9_fu_105_p00[1]),
        .I1(\rdata_data[1]_i_2_n_0 ),
        .I2(\int_width_reg_n_0_[1] ),
        .I3(\rdata_data[1]_i_3_n_0 ),
        .I4(\rdata_data[1]_i_4_n_0 ),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'h5D)) 
    \rdata_data[1]_i_2 
       (.I0(s_axi_control_ARADDR[4]),
        .I1(s_axi_control_ARADDR[3]),
        .I2(s_axi_control_ARADDR[2]),
        .O(\rdata_data[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \rdata_data[1]_i_3 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .O(\rdata_data[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h5050F4040000F404)) 
    \rdata_data[1]_i_4 
       (.I0(s_axi_control_ARADDR[4]),
        .I1(int_task_ap_done),
        .I2(s_axi_control_ARADDR[3]),
        .I3(p_2_in[1]),
        .I4(s_axi_control_ARADDR[2]),
        .I5(p_1_in),
        .O(\rdata_data[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[20]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[20] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[20]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[21]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[21] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[21]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[22]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[22] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[22]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[23]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[23] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[23]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[24]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[24] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[24]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[25]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[25] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[25]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[26]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[26] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[26]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[27]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[27] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[27]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[28]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[28] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[28]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[29]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[29] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[29]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \rdata_data[2]_i_1 
       (.I0(\rdata_data[2]_i_2_n_0 ),
        .I1(s_axi_control_ARADDR[0]),
        .O(\rdata_data[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3000323230000202)) 
    \rdata_data[2]_i_2 
       (.I0(p_4_in[2]),
        .I1(s_axi_control_ARADDR[2]),
        .I2(s_axi_control_ARADDR[4]),
        .I3(\int_width_reg_n_0_[2] ),
        .I4(s_axi_control_ARADDR[3]),
        .I5(mul_ln9_fu_105_p00[2]),
        .O(\rdata_data[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[30]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[30] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[30]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[30]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \rdata_data[31]_i_1 
       (.I0(s_axi_control_ARADDR[1]),
        .I1(\FSM_onehot_rstate_reg[1]_0 ),
        .I2(s_axi_control_ARVALID),
        .O(\rdata_data[31]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rdata_data[31]_i_2 
       (.I0(s_axi_control_ARVALID),
        .I1(\FSM_onehot_rstate_reg[1]_0 ),
        .O(ar_hs));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[31]_i_3 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[31] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[31]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \rdata_data[3]_i_1 
       (.I0(\rdata_data[3]_i_2_n_0 ),
        .I1(s_axi_control_ARADDR[0]),
        .O(\rdata_data[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3000323230000202)) 
    \rdata_data[3]_i_2 
       (.I0(int_ap_ready),
        .I1(s_axi_control_ARADDR[2]),
        .I2(s_axi_control_ARADDR[4]),
        .I3(\int_width_reg_n_0_[3] ),
        .I4(s_axi_control_ARADDR[3]),
        .I5(mul_ln9_fu_105_p00[3]),
        .O(\rdata_data[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[4]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[4] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[4]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[5]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[5] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[5]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[6]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[6] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[6]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \rdata_data[7]_i_1 
       (.I0(\rdata_data[7]_i_2_n_0 ),
        .I1(s_axi_control_ARADDR[0]),
        .O(\rdata_data[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3000323230000202)) 
    \rdata_data[7]_i_2 
       (.I0(p_4_in[7]),
        .I1(s_axi_control_ARADDR[2]),
        .I2(s_axi_control_ARADDR[4]),
        .I3(\int_width_reg_n_0_[7] ),
        .I4(s_axi_control_ARADDR[3]),
        .I5(mul_ln9_fu_105_p00[7]),
        .O(\rdata_data[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040444000)) 
    \rdata_data[8]_i_1 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\int_width_reg_n_0_[8] ),
        .I3(s_axi_control_ARADDR[3]),
        .I4(mul_ln9_fu_105_p00[8]),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata_data[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \rdata_data[9]_i_1 
       (.I0(\rdata_data[9]_i_2_n_0 ),
        .I1(s_axi_control_ARADDR[0]),
        .O(\rdata_data[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3000323230000202)) 
    \rdata_data[9]_i_2 
       (.I0(interrupt),
        .I1(s_axi_control_ARADDR[2]),
        .I2(s_axi_control_ARADDR[4]),
        .I3(\int_width_reg_n_0_[9] ),
        .I4(s_axi_control_ARADDR[3]),
        .I5(mul_ln9_fu_105_p00[9]),
        .O(\rdata_data[9]_i_2_n_0 ));
  FDRE \rdata_data_reg[0] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[0]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[0]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[10] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[10]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[10]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[11] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[11]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[11]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[12] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[12]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[12]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[13] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[13]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[13]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[14] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[14]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[14]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[15] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[15]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[15]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[16] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[16]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[16]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[17] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[17]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[17]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[18] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[18]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[18]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[19] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[19]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[19]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[1] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[1]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[1]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[20] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[20]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[20]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[21] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[21]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[21]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[22] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[22]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[22]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[23] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[23]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[23]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[24] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[24]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[24]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[25] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[25]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[25]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[26] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[26]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[26]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[27] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[27]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[27]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[28] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[28]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[28]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[29] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[29]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[29]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[2] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[2]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[2]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[30] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[30]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[30]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[31] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[31]_i_3_n_0 ),
        .Q(s_axi_control_RDATA[31]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[3] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[3]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[3]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[4] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[4]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[4]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[5] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[5]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[5]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[6] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[6]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[6]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[7] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[7]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[7]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[8] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[8]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[8]),
        .R(\rdata_data[31]_i_1_n_0 ));
  FDRE \rdata_data_reg[9] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(\rdata_data[9]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[9]),
        .R(\rdata_data[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h8)) 
    tmp_product_i_1
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[16] ),
        .O(A[16]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h8)) 
    tmp_product_i_10
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[7] ),
        .O(A[7]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h8)) 
    tmp_product_i_11
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[6] ),
        .O(A[6]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h8)) 
    tmp_product_i_12
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[5] ),
        .O(A[5]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h8)) 
    tmp_product_i_13
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[4] ),
        .O(A[4]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h8)) 
    tmp_product_i_14
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[3] ),
        .O(A[3]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h8)) 
    tmp_product_i_15
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[2] ),
        .O(A[2]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h8)) 
    tmp_product_i_16
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[1] ),
        .O(A[1]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'h8)) 
    tmp_product_i_17
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[0] ),
        .O(A[0]));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY8 tmp_product_i_18
       (.CI(tmp_product_i_19_n_0),
        .CI_TOP(1'b0),
        .CO({p_0_in,tmp_product_i_18_n_1,tmp_product_i_18_n_2,tmp_product_i_18_n_3,tmp_product_i_18_n_4,tmp_product_i_18_n_5,tmp_product_i_18_n_6,tmp_product_i_18_n_7}),
        .DI({tmp_product_i_20_n_0,tmp_product_i_21_n_0,tmp_product_i_22_n_0,tmp_product_i_23_n_0,tmp_product_i_24_n_0,tmp_product_i_25_n_0,tmp_product_i_26_n_0,tmp_product_i_27_n_0}),
        .O(NLW_tmp_product_i_18_O_UNCONNECTED[7:0]),
        .S({tmp_product_i_28_n_0,tmp_product_i_29_n_0,tmp_product_i_30_n_0,tmp_product_i_31_n_0,tmp_product_i_32_n_0,tmp_product_i_33_n_0,tmp_product_i_34_n_0,tmp_product_i_35_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY8 tmp_product_i_19
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({tmp_product_i_19_n_0,tmp_product_i_19_n_1,tmp_product_i_19_n_2,tmp_product_i_19_n_3,tmp_product_i_19_n_4,tmp_product_i_19_n_5,tmp_product_i_19_n_6,tmp_product_i_19_n_7}),
        .DI({tmp_product_i_36_n_0,tmp_product_i_37_n_0,tmp_product_i_38_n_0,tmp_product_i_39_n_0,tmp_product_i_40_n_0,tmp_product_i_41_n_0,tmp_product_i_42_n_0,tmp_product_i_43_n_0}),
        .O(NLW_tmp_product_i_19_O_UNCONNECTED[7:0]),
        .S({tmp_product_i_44_n_0,tmp_product_i_45_n_0,tmp_product_i_46_n_0,tmp_product_i_47_n_0,tmp_product_i_48_n_0,tmp_product_i_49_n_0,tmp_product_i_50_n_0,tmp_product_i_51_n_0}));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h8)) 
    tmp_product_i_2
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[15] ),
        .O(A[15]));
  LUT2 #(
    .INIT(4'h2)) 
    tmp_product_i_20
       (.I0(\int_width_reg_n_0_[30] ),
        .I1(\int_width_reg_n_0_[31] ),
        .O(tmp_product_i_20_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    tmp_product_i_21
       (.I0(\int_width_reg_n_0_[28] ),
        .I1(\int_width_reg_n_0_[29] ),
        .O(tmp_product_i_21_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    tmp_product_i_22
       (.I0(\int_width_reg_n_0_[26] ),
        .I1(\int_width_reg_n_0_[27] ),
        .O(tmp_product_i_22_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    tmp_product_i_23
       (.I0(\int_width_reg_n_0_[24] ),
        .I1(\int_width_reg_n_0_[25] ),
        .O(tmp_product_i_23_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    tmp_product_i_24
       (.I0(\int_width_reg_n_0_[22] ),
        .I1(\int_width_reg_n_0_[23] ),
        .O(tmp_product_i_24_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    tmp_product_i_25
       (.I0(\int_width_reg_n_0_[20] ),
        .I1(\int_width_reg_n_0_[21] ),
        .O(tmp_product_i_25_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    tmp_product_i_26
       (.I0(\int_width_reg_n_0_[18] ),
        .I1(\int_width_reg_n_0_[19] ),
        .O(tmp_product_i_26_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    tmp_product_i_27
       (.I0(\int_width_reg_n_0_[16] ),
        .I1(\int_width_reg_n_0_[17] ),
        .O(tmp_product_i_27_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    tmp_product_i_28
       (.I0(\int_width_reg_n_0_[30] ),
        .I1(\int_width_reg_n_0_[31] ),
        .O(tmp_product_i_28_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    tmp_product_i_29
       (.I0(\int_width_reg_n_0_[28] ),
        .I1(\int_width_reg_n_0_[29] ),
        .O(tmp_product_i_29_n_0));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h8)) 
    tmp_product_i_3
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[14] ),
        .O(A[14]));
  LUT2 #(
    .INIT(4'h1)) 
    tmp_product_i_30
       (.I0(\int_width_reg_n_0_[26] ),
        .I1(\int_width_reg_n_0_[27] ),
        .O(tmp_product_i_30_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    tmp_product_i_31
       (.I0(\int_width_reg_n_0_[24] ),
        .I1(\int_width_reg_n_0_[25] ),
        .O(tmp_product_i_31_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    tmp_product_i_32
       (.I0(\int_width_reg_n_0_[22] ),
        .I1(\int_width_reg_n_0_[23] ),
        .O(tmp_product_i_32_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    tmp_product_i_33
       (.I0(\int_width_reg_n_0_[20] ),
        .I1(\int_width_reg_n_0_[21] ),
        .O(tmp_product_i_33_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    tmp_product_i_34
       (.I0(\int_width_reg_n_0_[18] ),
        .I1(\int_width_reg_n_0_[19] ),
        .O(tmp_product_i_34_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    tmp_product_i_35
       (.I0(\int_width_reg_n_0_[16] ),
        .I1(\int_width_reg_n_0_[17] ),
        .O(tmp_product_i_35_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    tmp_product_i_36
       (.I0(\int_width_reg_n_0_[14] ),
        .I1(\int_width_reg_n_0_[15] ),
        .O(tmp_product_i_36_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    tmp_product_i_37
       (.I0(\int_width_reg_n_0_[12] ),
        .I1(\int_width_reg_n_0_[13] ),
        .O(tmp_product_i_37_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    tmp_product_i_38
       (.I0(\int_width_reg_n_0_[10] ),
        .I1(\int_width_reg_n_0_[11] ),
        .O(tmp_product_i_38_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    tmp_product_i_39
       (.I0(\int_width_reg_n_0_[8] ),
        .I1(\int_width_reg_n_0_[9] ),
        .O(tmp_product_i_39_n_0));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h8)) 
    tmp_product_i_4
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[13] ),
        .O(A[13]));
  LUT2 #(
    .INIT(4'hE)) 
    tmp_product_i_40
       (.I0(\int_width_reg_n_0_[6] ),
        .I1(\int_width_reg_n_0_[7] ),
        .O(tmp_product_i_40_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    tmp_product_i_41
       (.I0(\int_width_reg_n_0_[4] ),
        .I1(\int_width_reg_n_0_[5] ),
        .O(tmp_product_i_41_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    tmp_product_i_42
       (.I0(\int_width_reg_n_0_[2] ),
        .I1(\int_width_reg_n_0_[3] ),
        .O(tmp_product_i_42_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    tmp_product_i_43
       (.I0(\int_width_reg_n_0_[0] ),
        .I1(\int_width_reg_n_0_[1] ),
        .O(tmp_product_i_43_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    tmp_product_i_44
       (.I0(\int_width_reg_n_0_[14] ),
        .I1(\int_width_reg_n_0_[15] ),
        .O(tmp_product_i_44_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    tmp_product_i_45
       (.I0(\int_width_reg_n_0_[12] ),
        .I1(\int_width_reg_n_0_[13] ),
        .O(tmp_product_i_45_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    tmp_product_i_46
       (.I0(\int_width_reg_n_0_[10] ),
        .I1(\int_width_reg_n_0_[11] ),
        .O(tmp_product_i_46_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    tmp_product_i_47
       (.I0(\int_width_reg_n_0_[8] ),
        .I1(\int_width_reg_n_0_[9] ),
        .O(tmp_product_i_47_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    tmp_product_i_48
       (.I0(\int_width_reg_n_0_[6] ),
        .I1(\int_width_reg_n_0_[7] ),
        .O(tmp_product_i_48_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    tmp_product_i_49
       (.I0(\int_width_reg_n_0_[4] ),
        .I1(\int_width_reg_n_0_[5] ),
        .O(tmp_product_i_49_n_0));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'h8)) 
    tmp_product_i_5
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[12] ),
        .O(A[12]));
  LUT2 #(
    .INIT(4'h1)) 
    tmp_product_i_50
       (.I0(\int_width_reg_n_0_[2] ),
        .I1(\int_width_reg_n_0_[3] ),
        .O(tmp_product_i_50_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    tmp_product_i_51
       (.I0(\int_width_reg_n_0_[0] ),
        .I1(\int_width_reg_n_0_[1] ),
        .O(tmp_product_i_51_n_0));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'h8)) 
    tmp_product_i_6
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[11] ),
        .O(A[11]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h8)) 
    tmp_product_i_7
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[10] ),
        .O(A[10]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h8)) 
    tmp_product_i_8
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[9] ),
        .O(A[9]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h8)) 
    tmp_product_i_9
       (.I0(p_0_in),
        .I1(\int_width_reg_n_0_[8] ),
        .O(A[8]));
  LUT2 #(
    .INIT(4'h8)) 
    \waddr[4]_i_1 
       (.I0(s_axi_control_AWVALID),
        .I1(\FSM_onehot_wstate_reg[1]_0 ),
        .O(waddr));
  FDRE \waddr_reg[2] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_control_AWADDR[0]),
        .Q(\waddr_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \waddr_reg[3] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_control_AWADDR[1]),
        .Q(\waddr_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \waddr_reg[4] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_control_AWADDR[2]),
        .Q(\waddr_reg_n_0_[4] ),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_flow_control_loop_pipe_sequential_init
   (D,
    ap_block_pp0_stage0_11001__1,
    S,
    \ap_CS_fsm_reg[1] ,
    grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_ap_start_reg_reg,
    RSTA,
    ap_clk,
    \ap_CS_fsm_reg[3] ,
    ap_enable_reg_pp0_iter1,
    CO,
    \ap_CS_fsm_reg[3]_0 ,
    ap_loop_init_int_reg_0,
    ap_rst_n,
    indvar_flatten_fu_60_reg_0_sp_1,
    Q,
    ack_in,
    indvar_flatten_fu_60_reg,
    mul_ln9_reg_138_reg__1,
    P,
    tmp_product_carry__4);
  output [1:0]D;
  output ap_block_pp0_stage0_11001__1;
  output [4:0]S;
  output [5:0]\ap_CS_fsm_reg[1] ;
  output grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_ap_start_reg_reg;
  input RSTA;
  input ap_clk;
  input [1:0]\ap_CS_fsm_reg[3] ;
  input ap_enable_reg_pp0_iter1;
  input [0:0]CO;
  input \ap_CS_fsm_reg[3]_0 ;
  input ap_loop_init_int_reg_0;
  input ap_rst_n;
  input indvar_flatten_fu_60_reg_0_sp_1;
  input [0:0]Q;
  input ack_in;
  input [13:0]indvar_flatten_fu_60_reg;
  input [13:0]mul_ln9_reg_138_reg__1;
  input [5:0]P;
  input [5:0]tmp_product_carry__4;

  wire [0:0]CO;
  wire [1:0]D;
  wire [5:0]P;
  wire [0:0]Q;
  wire RSTA;
  wire [4:0]S;
  wire ack_in;
  wire \ap_CS_fsm[3]_i_2_n_0 ;
  wire [5:0]\ap_CS_fsm_reg[1] ;
  wire [1:0]\ap_CS_fsm_reg[3] ;
  wire \ap_CS_fsm_reg[3]_0 ;
  wire ap_block_pp0_stage0_11001__1;
  wire ap_clk;
  wire ap_done_cache;
  wire ap_done_cache_i_1_n_0;
  wire ap_enable_reg_pp0_iter1;
  wire ap_loop_init_int;
  wire ap_loop_init_int_i_1_n_0;
  wire ap_loop_init_int_reg_0;
  wire ap_rst_n;
  wire grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_ap_start_reg_reg;
  wire [13:0]indvar_flatten_fu_60_reg;
  wire indvar_flatten_fu_60_reg_0_sn_1;
  wire [13:0]mul_ln9_reg_138_reg__1;
  wire [5:0]tmp_product_carry__4;

  assign indvar_flatten_fu_60_reg_0_sn_1 = indvar_flatten_fu_60_reg_0_sp_1;
  LUT6 #(
    .INIT(64'hBBBBABBBAAAAAAAA)) 
    \ap_CS_fsm[2]_i_1 
       (.I0(\ap_CS_fsm_reg[3] [0]),
        .I1(\ap_CS_fsm[3]_i_2_n_0 ),
        .I2(ap_enable_reg_pp0_iter1),
        .I3(CO),
        .I4(ap_block_pp0_stage0_11001__1),
        .I5(\ap_CS_fsm_reg[3] [1]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAEA0000)) 
    \ap_CS_fsm[3]_i_1 
       (.I0(\ap_CS_fsm[3]_i_2_n_0 ),
        .I1(ap_enable_reg_pp0_iter1),
        .I2(CO),
        .I3(ap_block_pp0_stage0_11001__1),
        .I4(\ap_CS_fsm_reg[3] [1]),
        .I5(\ap_CS_fsm_reg[3]_0 ),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \ap_CS_fsm[3]_i_2 
       (.I0(ap_done_cache),
        .I1(ap_loop_init_int_reg_0),
        .O(\ap_CS_fsm[3]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h2AAA)) 
    \ap_CS_fsm[3]_i_3 
       (.I0(indvar_flatten_fu_60_reg_0_sn_1),
        .I1(Q),
        .I2(ack_in),
        .I3(\ap_CS_fsm_reg[3] [1]),
        .O(ap_block_pp0_stage0_11001__1));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT5 #(
    .INIT(32'h40FF4040)) 
    ap_done_cache_i_1
       (.I0(ap_block_pp0_stage0_11001__1),
        .I1(CO),
        .I2(ap_enable_reg_pp0_iter1),
        .I3(ap_loop_init_int_reg_0),
        .I4(ap_done_cache),
        .O(ap_done_cache_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ap_done_cache_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_done_cache_i_1_n_0),
        .Q(ap_done_cache),
        .R(RSTA));
  LUT4 #(
    .INIT(16'h9009)) 
    ap_done_reg6_carry__1_i_1
       (.I0(indvar_flatten_fu_60_reg[12]),
        .I1(mul_ln9_reg_138_reg__1[12]),
        .I2(indvar_flatten_fu_60_reg[13]),
        .I3(mul_ln9_reg_138_reg__1[13]),
        .O(S[4]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ap_done_reg6_carry__1_i_2
       (.I0(indvar_flatten_fu_60_reg[9]),
        .I1(mul_ln9_reg_138_reg__1[9]),
        .I2(mul_ln9_reg_138_reg__1[11]),
        .I3(indvar_flatten_fu_60_reg[11]),
        .I4(mul_ln9_reg_138_reg__1[10]),
        .I5(indvar_flatten_fu_60_reg[10]),
        .O(S[3]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ap_done_reg6_carry__1_i_3
       (.I0(indvar_flatten_fu_60_reg[6]),
        .I1(mul_ln9_reg_138_reg__1[6]),
        .I2(mul_ln9_reg_138_reg__1[8]),
        .I3(indvar_flatten_fu_60_reg[8]),
        .I4(mul_ln9_reg_138_reg__1[7]),
        .I5(indvar_flatten_fu_60_reg[7]),
        .O(S[2]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ap_done_reg6_carry__1_i_4
       (.I0(indvar_flatten_fu_60_reg[3]),
        .I1(mul_ln9_reg_138_reg__1[3]),
        .I2(mul_ln9_reg_138_reg__1[5]),
        .I3(indvar_flatten_fu_60_reg[5]),
        .I4(mul_ln9_reg_138_reg__1[4]),
        .I5(indvar_flatten_fu_60_reg[4]),
        .O(S[1]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ap_done_reg6_carry__1_i_5
       (.I0(indvar_flatten_fu_60_reg[0]),
        .I1(mul_ln9_reg_138_reg__1[0]),
        .I2(mul_ln9_reg_138_reg__1[2]),
        .I3(indvar_flatten_fu_60_reg[2]),
        .I4(mul_ln9_reg_138_reg__1[1]),
        .I5(indvar_flatten_fu_60_reg[1]),
        .O(S[0]));
  LUT6 #(
    .INIT(64'hCFCFCFCFFF4F4F4F)) 
    ap_loop_init_int_i_1
       (.I0(ap_loop_init_int_reg_0),
        .I1(ap_loop_init_int),
        .I2(ap_rst_n),
        .I3(ap_enable_reg_pp0_iter1),
        .I4(CO),
        .I5(ap_block_pp0_stage0_11001__1),
        .O(ap_loop_init_int_i_1_n_0));
  FDRE #(
    .INIT(1'b1)) 
    ap_loop_init_int_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_loop_init_int_i_1_n_0),
        .Q(ap_loop_init_int),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h8000000088888888)) 
    \indvar_flatten_fu_60[0]_i_1 
       (.I0(ap_loop_init_int_reg_0),
        .I1(ap_loop_init_int),
        .I2(\ap_CS_fsm_reg[3] [1]),
        .I3(ack_in),
        .I4(Q),
        .I5(indvar_flatten_fu_60_reg_0_sn_1),
        .O(grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_ap_start_reg_reg));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__4_i_1
       (.I0(P[5]),
        .I1(tmp_product_carry__4[5]),
        .O(\ap_CS_fsm_reg[1] [5]));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__4_i_2
       (.I0(P[4]),
        .I1(tmp_product_carry__4[4]),
        .O(\ap_CS_fsm_reg[1] [4]));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__4_i_3
       (.I0(P[3]),
        .I1(tmp_product_carry__4[3]),
        .O(\ap_CS_fsm_reg[1] [3]));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__4_i_4
       (.I0(P[2]),
        .I1(tmp_product_carry__4[2]),
        .O(\ap_CS_fsm_reg[1] [2]));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__4_i_5
       (.I0(P[1]),
        .I1(tmp_product_carry__4[1]),
        .O(\ap_CS_fsm_reg[1] [1]));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__4_i_6
       (.I0(P[0]),
        .I1(tmp_product_carry__4[0]),
        .O(\ap_CS_fsm_reg[1] [0]));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP
   (ap_enable_reg_pp0_iter2_reg_0,
    E,
    ap_enable_reg_pp0_iter2_reg_1,
    ap_enable_reg_pp0_iter2_reg_2,
    D,
    out_stream_TDATA_reg1,
    S,
    \ap_CS_fsm_reg[1] ,
    indvar_flatten_fu_602,
    ap_enable_reg_pp0_iter1_reg_0,
    ap_clk,
    RSTA,
    Q,
    \ap_CS_fsm_reg[3] ,
    ack_in,
    \data_p2_reg[3] ,
    \data_p2_reg[3]_0 ,
    \ap_CS_fsm_reg[3]_0 ,
    ap_rst_n,
    ap_done_reg6_carry_0,
    mul_ln9_reg_138_reg__1,
    P,
    tmp_product_carry__4);
  output ap_enable_reg_pp0_iter2_reg_0;
  output [0:0]E;
  output [0:0]ap_enable_reg_pp0_iter2_reg_1;
  output [0:0]ap_enable_reg_pp0_iter2_reg_2;
  output [1:0]D;
  output out_stream_TDATA_reg1;
  output [5:0]S;
  output \ap_CS_fsm_reg[1] ;
  input indvar_flatten_fu_602;
  input ap_enable_reg_pp0_iter1_reg_0;
  input ap_clk;
  input RSTA;
  input [0:0]Q;
  input [1:0]\ap_CS_fsm_reg[3] ;
  input ack_in;
  input \data_p2_reg[3] ;
  input \data_p2_reg[3]_0 ;
  input \ap_CS_fsm_reg[3]_0 ;
  input ap_rst_n;
  input [15:0]ap_done_reg6_carry_0;
  input [45:0]mul_ln9_reg_138_reg__1;
  input [5:0]P;
  input [5:0]tmp_product_carry__4;

  wire [1:0]D;
  wire [0:0]E;
  wire [5:0]P;
  wire [0:0]Q;
  wire RSTA;
  wire [5:0]S;
  wire ack_in;
  wire \ap_CS_fsm_reg[1] ;
  wire [1:0]\ap_CS_fsm_reg[3] ;
  wire \ap_CS_fsm_reg[3]_0 ;
  wire ap_block_pp0_stage0_11001__1;
  wire ap_clk;
  wire [15:0]ap_done_reg6_carry_0;
  wire ap_done_reg6_carry__0_i_1_n_0;
  wire ap_done_reg6_carry__0_i_2_n_0;
  wire ap_done_reg6_carry__0_i_3_n_0;
  wire ap_done_reg6_carry__0_i_4_n_0;
  wire ap_done_reg6_carry__0_i_5_n_0;
  wire ap_done_reg6_carry__0_i_6_n_0;
  wire ap_done_reg6_carry__0_i_7_n_0;
  wire ap_done_reg6_carry__0_i_8_n_0;
  wire ap_done_reg6_carry__0_n_0;
  wire ap_done_reg6_carry__0_n_1;
  wire ap_done_reg6_carry__0_n_2;
  wire ap_done_reg6_carry__0_n_3;
  wire ap_done_reg6_carry__0_n_4;
  wire ap_done_reg6_carry__0_n_5;
  wire ap_done_reg6_carry__0_n_6;
  wire ap_done_reg6_carry__0_n_7;
  wire ap_done_reg6_carry__1_n_4;
  wire ap_done_reg6_carry__1_n_5;
  wire ap_done_reg6_carry__1_n_6;
  wire ap_done_reg6_carry__1_n_7;
  wire ap_done_reg6_carry_i_1_n_0;
  wire ap_done_reg6_carry_i_2_n_0;
  wire ap_done_reg6_carry_i_3_n_0;
  wire ap_done_reg6_carry_i_4_n_0;
  wire ap_done_reg6_carry_i_5_n_0;
  wire ap_done_reg6_carry_i_6_n_0;
  wire ap_done_reg6_carry_i_7_n_0;
  wire ap_done_reg6_carry_i_8_n_0;
  wire ap_done_reg6_carry_n_0;
  wire ap_done_reg6_carry_n_1;
  wire ap_done_reg6_carry_n_2;
  wire ap_done_reg6_carry_n_3;
  wire ap_done_reg6_carry_n_4;
  wire ap_done_reg6_carry_n_5;
  wire ap_done_reg6_carry_n_6;
  wire ap_done_reg6_carry_n_7;
  wire ap_enable_reg_pp0_iter1;
  wire ap_enable_reg_pp0_iter1_i_1_n_0;
  wire ap_enable_reg_pp0_iter1_reg_0;
  wire ap_enable_reg_pp0_iter2_reg_0;
  wire [0:0]ap_enable_reg_pp0_iter2_reg_1;
  wire [0:0]ap_enable_reg_pp0_iter2_reg_2;
  wire ap_rst_n;
  wire \data_p2_reg[3] ;
  wire \data_p2_reg[3]_0 ;
  wire flow_control_loop_pipe_sequential_init_U_n_14;
  wire flow_control_loop_pipe_sequential_init_U_n_3;
  wire flow_control_loop_pipe_sequential_init_U_n_4;
  wire flow_control_loop_pipe_sequential_init_U_n_5;
  wire flow_control_loop_pipe_sequential_init_U_n_6;
  wire flow_control_loop_pipe_sequential_init_U_n_7;
  wire [0:0]icmp_ln21_fu_111_p2;
  wire indvar_flatten_fu_60;
  wire indvar_flatten_fu_602;
  wire \indvar_flatten_fu_60[0]_i_4_n_0 ;
  wire [61:0]indvar_flatten_fu_60_reg;
  wire \indvar_flatten_fu_60_reg[0]_i_3_n_0 ;
  wire \indvar_flatten_fu_60_reg[0]_i_3_n_1 ;
  wire \indvar_flatten_fu_60_reg[0]_i_3_n_10 ;
  wire \indvar_flatten_fu_60_reg[0]_i_3_n_11 ;
  wire \indvar_flatten_fu_60_reg[0]_i_3_n_12 ;
  wire \indvar_flatten_fu_60_reg[0]_i_3_n_13 ;
  wire \indvar_flatten_fu_60_reg[0]_i_3_n_14 ;
  wire \indvar_flatten_fu_60_reg[0]_i_3_n_15 ;
  wire \indvar_flatten_fu_60_reg[0]_i_3_n_2 ;
  wire \indvar_flatten_fu_60_reg[0]_i_3_n_3 ;
  wire \indvar_flatten_fu_60_reg[0]_i_3_n_4 ;
  wire \indvar_flatten_fu_60_reg[0]_i_3_n_5 ;
  wire \indvar_flatten_fu_60_reg[0]_i_3_n_6 ;
  wire \indvar_flatten_fu_60_reg[0]_i_3_n_7 ;
  wire \indvar_flatten_fu_60_reg[0]_i_3_n_8 ;
  wire \indvar_flatten_fu_60_reg[0]_i_3_n_9 ;
  wire \indvar_flatten_fu_60_reg[16]_i_1_n_0 ;
  wire \indvar_flatten_fu_60_reg[16]_i_1_n_1 ;
  wire \indvar_flatten_fu_60_reg[16]_i_1_n_10 ;
  wire \indvar_flatten_fu_60_reg[16]_i_1_n_11 ;
  wire \indvar_flatten_fu_60_reg[16]_i_1_n_12 ;
  wire \indvar_flatten_fu_60_reg[16]_i_1_n_13 ;
  wire \indvar_flatten_fu_60_reg[16]_i_1_n_14 ;
  wire \indvar_flatten_fu_60_reg[16]_i_1_n_15 ;
  wire \indvar_flatten_fu_60_reg[16]_i_1_n_2 ;
  wire \indvar_flatten_fu_60_reg[16]_i_1_n_3 ;
  wire \indvar_flatten_fu_60_reg[16]_i_1_n_4 ;
  wire \indvar_flatten_fu_60_reg[16]_i_1_n_5 ;
  wire \indvar_flatten_fu_60_reg[16]_i_1_n_6 ;
  wire \indvar_flatten_fu_60_reg[16]_i_1_n_7 ;
  wire \indvar_flatten_fu_60_reg[16]_i_1_n_8 ;
  wire \indvar_flatten_fu_60_reg[16]_i_1_n_9 ;
  wire \indvar_flatten_fu_60_reg[24]_i_1_n_0 ;
  wire \indvar_flatten_fu_60_reg[24]_i_1_n_1 ;
  wire \indvar_flatten_fu_60_reg[24]_i_1_n_10 ;
  wire \indvar_flatten_fu_60_reg[24]_i_1_n_11 ;
  wire \indvar_flatten_fu_60_reg[24]_i_1_n_12 ;
  wire \indvar_flatten_fu_60_reg[24]_i_1_n_13 ;
  wire \indvar_flatten_fu_60_reg[24]_i_1_n_14 ;
  wire \indvar_flatten_fu_60_reg[24]_i_1_n_15 ;
  wire \indvar_flatten_fu_60_reg[24]_i_1_n_2 ;
  wire \indvar_flatten_fu_60_reg[24]_i_1_n_3 ;
  wire \indvar_flatten_fu_60_reg[24]_i_1_n_4 ;
  wire \indvar_flatten_fu_60_reg[24]_i_1_n_5 ;
  wire \indvar_flatten_fu_60_reg[24]_i_1_n_6 ;
  wire \indvar_flatten_fu_60_reg[24]_i_1_n_7 ;
  wire \indvar_flatten_fu_60_reg[24]_i_1_n_8 ;
  wire \indvar_flatten_fu_60_reg[24]_i_1_n_9 ;
  wire \indvar_flatten_fu_60_reg[32]_i_1_n_0 ;
  wire \indvar_flatten_fu_60_reg[32]_i_1_n_1 ;
  wire \indvar_flatten_fu_60_reg[32]_i_1_n_10 ;
  wire \indvar_flatten_fu_60_reg[32]_i_1_n_11 ;
  wire \indvar_flatten_fu_60_reg[32]_i_1_n_12 ;
  wire \indvar_flatten_fu_60_reg[32]_i_1_n_13 ;
  wire \indvar_flatten_fu_60_reg[32]_i_1_n_14 ;
  wire \indvar_flatten_fu_60_reg[32]_i_1_n_15 ;
  wire \indvar_flatten_fu_60_reg[32]_i_1_n_2 ;
  wire \indvar_flatten_fu_60_reg[32]_i_1_n_3 ;
  wire \indvar_flatten_fu_60_reg[32]_i_1_n_4 ;
  wire \indvar_flatten_fu_60_reg[32]_i_1_n_5 ;
  wire \indvar_flatten_fu_60_reg[32]_i_1_n_6 ;
  wire \indvar_flatten_fu_60_reg[32]_i_1_n_7 ;
  wire \indvar_flatten_fu_60_reg[32]_i_1_n_8 ;
  wire \indvar_flatten_fu_60_reg[32]_i_1_n_9 ;
  wire \indvar_flatten_fu_60_reg[40]_i_1_n_0 ;
  wire \indvar_flatten_fu_60_reg[40]_i_1_n_1 ;
  wire \indvar_flatten_fu_60_reg[40]_i_1_n_10 ;
  wire \indvar_flatten_fu_60_reg[40]_i_1_n_11 ;
  wire \indvar_flatten_fu_60_reg[40]_i_1_n_12 ;
  wire \indvar_flatten_fu_60_reg[40]_i_1_n_13 ;
  wire \indvar_flatten_fu_60_reg[40]_i_1_n_14 ;
  wire \indvar_flatten_fu_60_reg[40]_i_1_n_15 ;
  wire \indvar_flatten_fu_60_reg[40]_i_1_n_2 ;
  wire \indvar_flatten_fu_60_reg[40]_i_1_n_3 ;
  wire \indvar_flatten_fu_60_reg[40]_i_1_n_4 ;
  wire \indvar_flatten_fu_60_reg[40]_i_1_n_5 ;
  wire \indvar_flatten_fu_60_reg[40]_i_1_n_6 ;
  wire \indvar_flatten_fu_60_reg[40]_i_1_n_7 ;
  wire \indvar_flatten_fu_60_reg[40]_i_1_n_8 ;
  wire \indvar_flatten_fu_60_reg[40]_i_1_n_9 ;
  wire \indvar_flatten_fu_60_reg[48]_i_1_n_0 ;
  wire \indvar_flatten_fu_60_reg[48]_i_1_n_1 ;
  wire \indvar_flatten_fu_60_reg[48]_i_1_n_10 ;
  wire \indvar_flatten_fu_60_reg[48]_i_1_n_11 ;
  wire \indvar_flatten_fu_60_reg[48]_i_1_n_12 ;
  wire \indvar_flatten_fu_60_reg[48]_i_1_n_13 ;
  wire \indvar_flatten_fu_60_reg[48]_i_1_n_14 ;
  wire \indvar_flatten_fu_60_reg[48]_i_1_n_15 ;
  wire \indvar_flatten_fu_60_reg[48]_i_1_n_2 ;
  wire \indvar_flatten_fu_60_reg[48]_i_1_n_3 ;
  wire \indvar_flatten_fu_60_reg[48]_i_1_n_4 ;
  wire \indvar_flatten_fu_60_reg[48]_i_1_n_5 ;
  wire \indvar_flatten_fu_60_reg[48]_i_1_n_6 ;
  wire \indvar_flatten_fu_60_reg[48]_i_1_n_7 ;
  wire \indvar_flatten_fu_60_reg[48]_i_1_n_8 ;
  wire \indvar_flatten_fu_60_reg[48]_i_1_n_9 ;
  wire \indvar_flatten_fu_60_reg[56]_i_1_n_10 ;
  wire \indvar_flatten_fu_60_reg[56]_i_1_n_11 ;
  wire \indvar_flatten_fu_60_reg[56]_i_1_n_12 ;
  wire \indvar_flatten_fu_60_reg[56]_i_1_n_13 ;
  wire \indvar_flatten_fu_60_reg[56]_i_1_n_14 ;
  wire \indvar_flatten_fu_60_reg[56]_i_1_n_15 ;
  wire \indvar_flatten_fu_60_reg[56]_i_1_n_3 ;
  wire \indvar_flatten_fu_60_reg[56]_i_1_n_4 ;
  wire \indvar_flatten_fu_60_reg[56]_i_1_n_5 ;
  wire \indvar_flatten_fu_60_reg[56]_i_1_n_6 ;
  wire \indvar_flatten_fu_60_reg[56]_i_1_n_7 ;
  wire \indvar_flatten_fu_60_reg[8]_i_1_n_0 ;
  wire \indvar_flatten_fu_60_reg[8]_i_1_n_1 ;
  wire \indvar_flatten_fu_60_reg[8]_i_1_n_10 ;
  wire \indvar_flatten_fu_60_reg[8]_i_1_n_11 ;
  wire \indvar_flatten_fu_60_reg[8]_i_1_n_12 ;
  wire \indvar_flatten_fu_60_reg[8]_i_1_n_13 ;
  wire \indvar_flatten_fu_60_reg[8]_i_1_n_14 ;
  wire \indvar_flatten_fu_60_reg[8]_i_1_n_15 ;
  wire \indvar_flatten_fu_60_reg[8]_i_1_n_2 ;
  wire \indvar_flatten_fu_60_reg[8]_i_1_n_3 ;
  wire \indvar_flatten_fu_60_reg[8]_i_1_n_4 ;
  wire \indvar_flatten_fu_60_reg[8]_i_1_n_5 ;
  wire \indvar_flatten_fu_60_reg[8]_i_1_n_6 ;
  wire \indvar_flatten_fu_60_reg[8]_i_1_n_7 ;
  wire \indvar_flatten_fu_60_reg[8]_i_1_n_8 ;
  wire \indvar_flatten_fu_60_reg[8]_i_1_n_9 ;
  wire [45:0]mul_ln9_reg_138_reg__1;
  wire out_stream_TDATA_reg1;
  wire [5:0]tmp_product_carry__4;
  wire [7:0]NLW_ap_done_reg6_carry_O_UNCONNECTED;
  wire [7:0]NLW_ap_done_reg6_carry__0_O_UNCONNECTED;
  wire [7:5]NLW_ap_done_reg6_carry__1_CO_UNCONNECTED;
  wire [7:0]NLW_ap_done_reg6_carry__1_O_UNCONNECTED;
  wire [7:5]\NLW_indvar_flatten_fu_60_reg[56]_i_1_CO_UNCONNECTED ;
  wire [7:6]\NLW_indvar_flatten_fu_60_reg[56]_i_1_O_UNCONNECTED ;

  CARRY8 ap_done_reg6_carry
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({ap_done_reg6_carry_n_0,ap_done_reg6_carry_n_1,ap_done_reg6_carry_n_2,ap_done_reg6_carry_n_3,ap_done_reg6_carry_n_4,ap_done_reg6_carry_n_5,ap_done_reg6_carry_n_6,ap_done_reg6_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_ap_done_reg6_carry_O_UNCONNECTED[7:0]),
        .S({ap_done_reg6_carry_i_1_n_0,ap_done_reg6_carry_i_2_n_0,ap_done_reg6_carry_i_3_n_0,ap_done_reg6_carry_i_4_n_0,ap_done_reg6_carry_i_5_n_0,ap_done_reg6_carry_i_6_n_0,ap_done_reg6_carry_i_7_n_0,ap_done_reg6_carry_i_8_n_0}));
  CARRY8 ap_done_reg6_carry__0
       (.CI(ap_done_reg6_carry_n_0),
        .CI_TOP(1'b0),
        .CO({ap_done_reg6_carry__0_n_0,ap_done_reg6_carry__0_n_1,ap_done_reg6_carry__0_n_2,ap_done_reg6_carry__0_n_3,ap_done_reg6_carry__0_n_4,ap_done_reg6_carry__0_n_5,ap_done_reg6_carry__0_n_6,ap_done_reg6_carry__0_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_ap_done_reg6_carry__0_O_UNCONNECTED[7:0]),
        .S({ap_done_reg6_carry__0_i_1_n_0,ap_done_reg6_carry__0_i_2_n_0,ap_done_reg6_carry__0_i_3_n_0,ap_done_reg6_carry__0_i_4_n_0,ap_done_reg6_carry__0_i_5_n_0,ap_done_reg6_carry__0_i_6_n_0,ap_done_reg6_carry__0_i_7_n_0,ap_done_reg6_carry__0_i_8_n_0}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ap_done_reg6_carry__0_i_1
       (.I0(indvar_flatten_fu_60_reg[45]),
        .I1(mul_ln9_reg_138_reg__1[29]),
        .I2(mul_ln9_reg_138_reg__1[31]),
        .I3(indvar_flatten_fu_60_reg[47]),
        .I4(mul_ln9_reg_138_reg__1[30]),
        .I5(indvar_flatten_fu_60_reg[46]),
        .O(ap_done_reg6_carry__0_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ap_done_reg6_carry__0_i_2
       (.I0(indvar_flatten_fu_60_reg[42]),
        .I1(mul_ln9_reg_138_reg__1[26]),
        .I2(mul_ln9_reg_138_reg__1[28]),
        .I3(indvar_flatten_fu_60_reg[44]),
        .I4(mul_ln9_reg_138_reg__1[27]),
        .I5(indvar_flatten_fu_60_reg[43]),
        .O(ap_done_reg6_carry__0_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ap_done_reg6_carry__0_i_3
       (.I0(indvar_flatten_fu_60_reg[39]),
        .I1(mul_ln9_reg_138_reg__1[23]),
        .I2(mul_ln9_reg_138_reg__1[25]),
        .I3(indvar_flatten_fu_60_reg[41]),
        .I4(mul_ln9_reg_138_reg__1[24]),
        .I5(indvar_flatten_fu_60_reg[40]),
        .O(ap_done_reg6_carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ap_done_reg6_carry__0_i_4
       (.I0(indvar_flatten_fu_60_reg[36]),
        .I1(mul_ln9_reg_138_reg__1[20]),
        .I2(mul_ln9_reg_138_reg__1[22]),
        .I3(indvar_flatten_fu_60_reg[38]),
        .I4(mul_ln9_reg_138_reg__1[21]),
        .I5(indvar_flatten_fu_60_reg[37]),
        .O(ap_done_reg6_carry__0_i_4_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ap_done_reg6_carry__0_i_5
       (.I0(indvar_flatten_fu_60_reg[33]),
        .I1(mul_ln9_reg_138_reg__1[17]),
        .I2(mul_ln9_reg_138_reg__1[19]),
        .I3(indvar_flatten_fu_60_reg[35]),
        .I4(mul_ln9_reg_138_reg__1[18]),
        .I5(indvar_flatten_fu_60_reg[34]),
        .O(ap_done_reg6_carry__0_i_5_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ap_done_reg6_carry__0_i_6
       (.I0(indvar_flatten_fu_60_reg[30]),
        .I1(mul_ln9_reg_138_reg__1[14]),
        .I2(mul_ln9_reg_138_reg__1[16]),
        .I3(indvar_flatten_fu_60_reg[32]),
        .I4(mul_ln9_reg_138_reg__1[15]),
        .I5(indvar_flatten_fu_60_reg[31]),
        .O(ap_done_reg6_carry__0_i_6_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ap_done_reg6_carry__0_i_7
       (.I0(indvar_flatten_fu_60_reg[27]),
        .I1(mul_ln9_reg_138_reg__1[11]),
        .I2(mul_ln9_reg_138_reg__1[13]),
        .I3(indvar_flatten_fu_60_reg[29]),
        .I4(mul_ln9_reg_138_reg__1[12]),
        .I5(indvar_flatten_fu_60_reg[28]),
        .O(ap_done_reg6_carry__0_i_7_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ap_done_reg6_carry__0_i_8
       (.I0(indvar_flatten_fu_60_reg[24]),
        .I1(mul_ln9_reg_138_reg__1[8]),
        .I2(mul_ln9_reg_138_reg__1[10]),
        .I3(indvar_flatten_fu_60_reg[26]),
        .I4(mul_ln9_reg_138_reg__1[9]),
        .I5(indvar_flatten_fu_60_reg[25]),
        .O(ap_done_reg6_carry__0_i_8_n_0));
  CARRY8 ap_done_reg6_carry__1
       (.CI(ap_done_reg6_carry__0_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_ap_done_reg6_carry__1_CO_UNCONNECTED[7:5],icmp_ln21_fu_111_p2,ap_done_reg6_carry__1_n_4,ap_done_reg6_carry__1_n_5,ap_done_reg6_carry__1_n_6,ap_done_reg6_carry__1_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_ap_done_reg6_carry__1_O_UNCONNECTED[7:0]),
        .S({1'b0,1'b0,1'b0,flow_control_loop_pipe_sequential_init_U_n_3,flow_control_loop_pipe_sequential_init_U_n_4,flow_control_loop_pipe_sequential_init_U_n_5,flow_control_loop_pipe_sequential_init_U_n_6,flow_control_loop_pipe_sequential_init_U_n_7}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ap_done_reg6_carry_i_1
       (.I0(indvar_flatten_fu_60_reg[21]),
        .I1(mul_ln9_reg_138_reg__1[5]),
        .I2(mul_ln9_reg_138_reg__1[7]),
        .I3(indvar_flatten_fu_60_reg[23]),
        .I4(mul_ln9_reg_138_reg__1[6]),
        .I5(indvar_flatten_fu_60_reg[22]),
        .O(ap_done_reg6_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ap_done_reg6_carry_i_2
       (.I0(indvar_flatten_fu_60_reg[18]),
        .I1(mul_ln9_reg_138_reg__1[2]),
        .I2(mul_ln9_reg_138_reg__1[4]),
        .I3(indvar_flatten_fu_60_reg[20]),
        .I4(mul_ln9_reg_138_reg__1[3]),
        .I5(indvar_flatten_fu_60_reg[19]),
        .O(ap_done_reg6_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ap_done_reg6_carry_i_3
       (.I0(indvar_flatten_fu_60_reg[15]),
        .I1(ap_done_reg6_carry_0[15]),
        .I2(mul_ln9_reg_138_reg__1[1]),
        .I3(indvar_flatten_fu_60_reg[17]),
        .I4(mul_ln9_reg_138_reg__1[0]),
        .I5(indvar_flatten_fu_60_reg[16]),
        .O(ap_done_reg6_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ap_done_reg6_carry_i_4
       (.I0(indvar_flatten_fu_60_reg[12]),
        .I1(ap_done_reg6_carry_0[12]),
        .I2(ap_done_reg6_carry_0[14]),
        .I3(indvar_flatten_fu_60_reg[14]),
        .I4(ap_done_reg6_carry_0[13]),
        .I5(indvar_flatten_fu_60_reg[13]),
        .O(ap_done_reg6_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ap_done_reg6_carry_i_5
       (.I0(indvar_flatten_fu_60_reg[9]),
        .I1(ap_done_reg6_carry_0[9]),
        .I2(ap_done_reg6_carry_0[11]),
        .I3(indvar_flatten_fu_60_reg[11]),
        .I4(ap_done_reg6_carry_0[10]),
        .I5(indvar_flatten_fu_60_reg[10]),
        .O(ap_done_reg6_carry_i_5_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ap_done_reg6_carry_i_6
       (.I0(indvar_flatten_fu_60_reg[6]),
        .I1(ap_done_reg6_carry_0[6]),
        .I2(ap_done_reg6_carry_0[8]),
        .I3(indvar_flatten_fu_60_reg[8]),
        .I4(ap_done_reg6_carry_0[7]),
        .I5(indvar_flatten_fu_60_reg[7]),
        .O(ap_done_reg6_carry_i_6_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ap_done_reg6_carry_i_7
       (.I0(indvar_flatten_fu_60_reg[3]),
        .I1(ap_done_reg6_carry_0[3]),
        .I2(ap_done_reg6_carry_0[5]),
        .I3(indvar_flatten_fu_60_reg[5]),
        .I4(ap_done_reg6_carry_0[4]),
        .I5(indvar_flatten_fu_60_reg[4]),
        .O(ap_done_reg6_carry_i_7_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ap_done_reg6_carry_i_8
       (.I0(indvar_flatten_fu_60_reg[0]),
        .I1(ap_done_reg6_carry_0[0]),
        .I2(ap_done_reg6_carry_0[2]),
        .I3(indvar_flatten_fu_60_reg[2]),
        .I4(ap_done_reg6_carry_0[1]),
        .I5(indvar_flatten_fu_60_reg[1]),
        .O(ap_done_reg6_carry_i_8_n_0));
  LUT4 #(
    .INIT(16'h40FF)) 
    ap_enable_reg_pp0_iter1_i_1
       (.I0(ap_block_pp0_stage0_11001__1),
        .I1(ap_enable_reg_pp0_iter1),
        .I2(icmp_ln21_fu_111_p2),
        .I3(ap_rst_n),
        .O(ap_enable_reg_pp0_iter1_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ap_enable_reg_pp0_iter1_reg
       (.C(ap_clk),
        .CE(indvar_flatten_fu_602),
        .D(ap_enable_reg_pp0_iter1_reg_0),
        .Q(ap_enable_reg_pp0_iter1),
        .R(ap_enable_reg_pp0_iter1_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ap_enable_reg_pp0_iter2_reg
       (.C(ap_clk),
        .CE(indvar_flatten_fu_602),
        .D(ap_enable_reg_pp0_iter1),
        .Q(ap_enable_reg_pp0_iter2_reg_0),
        .R(ap_enable_reg_pp0_iter1_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \data_p2[31]_i_1__0 
       (.I0(ap_enable_reg_pp0_iter2_reg_0),
        .I1(Q),
        .I2(\ap_CS_fsm_reg[3] [1]),
        .I3(ack_in),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \data_p2[3]_i_1__1 
       (.I0(ap_enable_reg_pp0_iter2_reg_0),
        .I1(Q),
        .I2(ack_in),
        .I3(\ap_CS_fsm_reg[3] [1]),
        .I4(\data_p2_reg[3] ),
        .O(ap_enable_reg_pp0_iter2_reg_1));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \data_p2[3]_i_1__2 
       (.I0(ap_enable_reg_pp0_iter2_reg_0),
        .I1(Q),
        .I2(ack_in),
        .I3(\ap_CS_fsm_reg[3] [1]),
        .I4(\data_p2_reg[3]_0 ),
        .O(ap_enable_reg_pp0_iter2_reg_2));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U
       (.CO(icmp_ln21_fu_111_p2),
        .D(D),
        .P(P),
        .Q(Q),
        .RSTA(RSTA),
        .S({flow_control_loop_pipe_sequential_init_U_n_3,flow_control_loop_pipe_sequential_init_U_n_4,flow_control_loop_pipe_sequential_init_U_n_5,flow_control_loop_pipe_sequential_init_U_n_6,flow_control_loop_pipe_sequential_init_U_n_7}),
        .ack_in(ack_in),
        .\ap_CS_fsm_reg[1] (S),
        .\ap_CS_fsm_reg[3] (\ap_CS_fsm_reg[3] ),
        .\ap_CS_fsm_reg[3]_0 (\ap_CS_fsm_reg[3]_0 ),
        .ap_block_pp0_stage0_11001__1(ap_block_pp0_stage0_11001__1),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter1(ap_enable_reg_pp0_iter1),
        .ap_loop_init_int_reg_0(ap_enable_reg_pp0_iter1_reg_0),
        .ap_rst_n(ap_rst_n),
        .grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_ap_start_reg_reg(flow_control_loop_pipe_sequential_init_U_n_14),
        .indvar_flatten_fu_60_reg(indvar_flatten_fu_60_reg[61:48]),
        .indvar_flatten_fu_60_reg_0_sp_1(ap_enable_reg_pp0_iter2_reg_0),
        .mul_ln9_reg_138_reg__1(mul_ln9_reg_138_reg__1[45:32]),
        .tmp_product_carry__4(tmp_product_carry__4));
  LUT5 #(
    .INIT(32'hEFFFAAAA)) 
    grp_hls_passthrough_Pipeline_HLS_HEIGHT_LOOP_HLS_WIDTH_LOOP_fu_80_ap_start_reg_i_1
       (.I0(\ap_CS_fsm_reg[3] [0]),
        .I1(ap_block_pp0_stage0_11001__1),
        .I2(ap_enable_reg_pp0_iter1),
        .I3(icmp_ln21_fu_111_p2),
        .I4(ap_enable_reg_pp0_iter1_reg_0),
        .O(\ap_CS_fsm_reg[1] ));
  LUT6 #(
    .INIT(64'h00000000D5550000)) 
    \indvar_flatten_fu_60[0]_i_2 
       (.I0(ap_enable_reg_pp0_iter2_reg_0),
        .I1(Q),
        .I2(ack_in),
        .I3(\ap_CS_fsm_reg[3] [1]),
        .I4(ap_enable_reg_pp0_iter1),
        .I5(icmp_ln21_fu_111_p2),
        .O(indvar_flatten_fu_60));
  LUT1 #(
    .INIT(2'h1)) 
    \indvar_flatten_fu_60[0]_i_4 
       (.I0(indvar_flatten_fu_60_reg[0]),
        .O(\indvar_flatten_fu_60[0]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[0] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[0]_i_3_n_15 ),
        .Q(indvar_flatten_fu_60_reg[0]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \indvar_flatten_fu_60_reg[0]_i_3 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\indvar_flatten_fu_60_reg[0]_i_3_n_0 ,\indvar_flatten_fu_60_reg[0]_i_3_n_1 ,\indvar_flatten_fu_60_reg[0]_i_3_n_2 ,\indvar_flatten_fu_60_reg[0]_i_3_n_3 ,\indvar_flatten_fu_60_reg[0]_i_3_n_4 ,\indvar_flatten_fu_60_reg[0]_i_3_n_5 ,\indvar_flatten_fu_60_reg[0]_i_3_n_6 ,\indvar_flatten_fu_60_reg[0]_i_3_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .O({\indvar_flatten_fu_60_reg[0]_i_3_n_8 ,\indvar_flatten_fu_60_reg[0]_i_3_n_9 ,\indvar_flatten_fu_60_reg[0]_i_3_n_10 ,\indvar_flatten_fu_60_reg[0]_i_3_n_11 ,\indvar_flatten_fu_60_reg[0]_i_3_n_12 ,\indvar_flatten_fu_60_reg[0]_i_3_n_13 ,\indvar_flatten_fu_60_reg[0]_i_3_n_14 ,\indvar_flatten_fu_60_reg[0]_i_3_n_15 }),
        .S({indvar_flatten_fu_60_reg[7:1],\indvar_flatten_fu_60[0]_i_4_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[10] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[8]_i_1_n_13 ),
        .Q(indvar_flatten_fu_60_reg[10]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[11] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[8]_i_1_n_12 ),
        .Q(indvar_flatten_fu_60_reg[11]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[12] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[8]_i_1_n_11 ),
        .Q(indvar_flatten_fu_60_reg[12]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[13] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[8]_i_1_n_10 ),
        .Q(indvar_flatten_fu_60_reg[13]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[14] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[8]_i_1_n_9 ),
        .Q(indvar_flatten_fu_60_reg[14]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[15] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[8]_i_1_n_8 ),
        .Q(indvar_flatten_fu_60_reg[15]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[16] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[16]_i_1_n_15 ),
        .Q(indvar_flatten_fu_60_reg[16]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \indvar_flatten_fu_60_reg[16]_i_1 
       (.CI(\indvar_flatten_fu_60_reg[8]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\indvar_flatten_fu_60_reg[16]_i_1_n_0 ,\indvar_flatten_fu_60_reg[16]_i_1_n_1 ,\indvar_flatten_fu_60_reg[16]_i_1_n_2 ,\indvar_flatten_fu_60_reg[16]_i_1_n_3 ,\indvar_flatten_fu_60_reg[16]_i_1_n_4 ,\indvar_flatten_fu_60_reg[16]_i_1_n_5 ,\indvar_flatten_fu_60_reg[16]_i_1_n_6 ,\indvar_flatten_fu_60_reg[16]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\indvar_flatten_fu_60_reg[16]_i_1_n_8 ,\indvar_flatten_fu_60_reg[16]_i_1_n_9 ,\indvar_flatten_fu_60_reg[16]_i_1_n_10 ,\indvar_flatten_fu_60_reg[16]_i_1_n_11 ,\indvar_flatten_fu_60_reg[16]_i_1_n_12 ,\indvar_flatten_fu_60_reg[16]_i_1_n_13 ,\indvar_flatten_fu_60_reg[16]_i_1_n_14 ,\indvar_flatten_fu_60_reg[16]_i_1_n_15 }),
        .S(indvar_flatten_fu_60_reg[23:16]));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[17] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[16]_i_1_n_14 ),
        .Q(indvar_flatten_fu_60_reg[17]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[18] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[16]_i_1_n_13 ),
        .Q(indvar_flatten_fu_60_reg[18]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[19] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[16]_i_1_n_12 ),
        .Q(indvar_flatten_fu_60_reg[19]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[1] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[0]_i_3_n_14 ),
        .Q(indvar_flatten_fu_60_reg[1]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[20] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[16]_i_1_n_11 ),
        .Q(indvar_flatten_fu_60_reg[20]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[21] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[16]_i_1_n_10 ),
        .Q(indvar_flatten_fu_60_reg[21]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[22] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[16]_i_1_n_9 ),
        .Q(indvar_flatten_fu_60_reg[22]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[23] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[16]_i_1_n_8 ),
        .Q(indvar_flatten_fu_60_reg[23]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[24] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[24]_i_1_n_15 ),
        .Q(indvar_flatten_fu_60_reg[24]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \indvar_flatten_fu_60_reg[24]_i_1 
       (.CI(\indvar_flatten_fu_60_reg[16]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\indvar_flatten_fu_60_reg[24]_i_1_n_0 ,\indvar_flatten_fu_60_reg[24]_i_1_n_1 ,\indvar_flatten_fu_60_reg[24]_i_1_n_2 ,\indvar_flatten_fu_60_reg[24]_i_1_n_3 ,\indvar_flatten_fu_60_reg[24]_i_1_n_4 ,\indvar_flatten_fu_60_reg[24]_i_1_n_5 ,\indvar_flatten_fu_60_reg[24]_i_1_n_6 ,\indvar_flatten_fu_60_reg[24]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\indvar_flatten_fu_60_reg[24]_i_1_n_8 ,\indvar_flatten_fu_60_reg[24]_i_1_n_9 ,\indvar_flatten_fu_60_reg[24]_i_1_n_10 ,\indvar_flatten_fu_60_reg[24]_i_1_n_11 ,\indvar_flatten_fu_60_reg[24]_i_1_n_12 ,\indvar_flatten_fu_60_reg[24]_i_1_n_13 ,\indvar_flatten_fu_60_reg[24]_i_1_n_14 ,\indvar_flatten_fu_60_reg[24]_i_1_n_15 }),
        .S(indvar_flatten_fu_60_reg[31:24]));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[25] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[24]_i_1_n_14 ),
        .Q(indvar_flatten_fu_60_reg[25]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[26] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[24]_i_1_n_13 ),
        .Q(indvar_flatten_fu_60_reg[26]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[27] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[24]_i_1_n_12 ),
        .Q(indvar_flatten_fu_60_reg[27]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[28] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[24]_i_1_n_11 ),
        .Q(indvar_flatten_fu_60_reg[28]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[29] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[24]_i_1_n_10 ),
        .Q(indvar_flatten_fu_60_reg[29]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[2] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[0]_i_3_n_13 ),
        .Q(indvar_flatten_fu_60_reg[2]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[30] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[24]_i_1_n_9 ),
        .Q(indvar_flatten_fu_60_reg[30]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[31] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[24]_i_1_n_8 ),
        .Q(indvar_flatten_fu_60_reg[31]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[32] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[32]_i_1_n_15 ),
        .Q(indvar_flatten_fu_60_reg[32]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \indvar_flatten_fu_60_reg[32]_i_1 
       (.CI(\indvar_flatten_fu_60_reg[24]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\indvar_flatten_fu_60_reg[32]_i_1_n_0 ,\indvar_flatten_fu_60_reg[32]_i_1_n_1 ,\indvar_flatten_fu_60_reg[32]_i_1_n_2 ,\indvar_flatten_fu_60_reg[32]_i_1_n_3 ,\indvar_flatten_fu_60_reg[32]_i_1_n_4 ,\indvar_flatten_fu_60_reg[32]_i_1_n_5 ,\indvar_flatten_fu_60_reg[32]_i_1_n_6 ,\indvar_flatten_fu_60_reg[32]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\indvar_flatten_fu_60_reg[32]_i_1_n_8 ,\indvar_flatten_fu_60_reg[32]_i_1_n_9 ,\indvar_flatten_fu_60_reg[32]_i_1_n_10 ,\indvar_flatten_fu_60_reg[32]_i_1_n_11 ,\indvar_flatten_fu_60_reg[32]_i_1_n_12 ,\indvar_flatten_fu_60_reg[32]_i_1_n_13 ,\indvar_flatten_fu_60_reg[32]_i_1_n_14 ,\indvar_flatten_fu_60_reg[32]_i_1_n_15 }),
        .S(indvar_flatten_fu_60_reg[39:32]));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[33] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[32]_i_1_n_14 ),
        .Q(indvar_flatten_fu_60_reg[33]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[34] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[32]_i_1_n_13 ),
        .Q(indvar_flatten_fu_60_reg[34]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[35] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[32]_i_1_n_12 ),
        .Q(indvar_flatten_fu_60_reg[35]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[36] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[32]_i_1_n_11 ),
        .Q(indvar_flatten_fu_60_reg[36]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[37] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[32]_i_1_n_10 ),
        .Q(indvar_flatten_fu_60_reg[37]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[38] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[32]_i_1_n_9 ),
        .Q(indvar_flatten_fu_60_reg[38]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[39] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[32]_i_1_n_8 ),
        .Q(indvar_flatten_fu_60_reg[39]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[3] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[0]_i_3_n_12 ),
        .Q(indvar_flatten_fu_60_reg[3]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[40] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[40]_i_1_n_15 ),
        .Q(indvar_flatten_fu_60_reg[40]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \indvar_flatten_fu_60_reg[40]_i_1 
       (.CI(\indvar_flatten_fu_60_reg[32]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\indvar_flatten_fu_60_reg[40]_i_1_n_0 ,\indvar_flatten_fu_60_reg[40]_i_1_n_1 ,\indvar_flatten_fu_60_reg[40]_i_1_n_2 ,\indvar_flatten_fu_60_reg[40]_i_1_n_3 ,\indvar_flatten_fu_60_reg[40]_i_1_n_4 ,\indvar_flatten_fu_60_reg[40]_i_1_n_5 ,\indvar_flatten_fu_60_reg[40]_i_1_n_6 ,\indvar_flatten_fu_60_reg[40]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\indvar_flatten_fu_60_reg[40]_i_1_n_8 ,\indvar_flatten_fu_60_reg[40]_i_1_n_9 ,\indvar_flatten_fu_60_reg[40]_i_1_n_10 ,\indvar_flatten_fu_60_reg[40]_i_1_n_11 ,\indvar_flatten_fu_60_reg[40]_i_1_n_12 ,\indvar_flatten_fu_60_reg[40]_i_1_n_13 ,\indvar_flatten_fu_60_reg[40]_i_1_n_14 ,\indvar_flatten_fu_60_reg[40]_i_1_n_15 }),
        .S(indvar_flatten_fu_60_reg[47:40]));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[41] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[40]_i_1_n_14 ),
        .Q(indvar_flatten_fu_60_reg[41]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[42] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[40]_i_1_n_13 ),
        .Q(indvar_flatten_fu_60_reg[42]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[43] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[40]_i_1_n_12 ),
        .Q(indvar_flatten_fu_60_reg[43]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[44] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[40]_i_1_n_11 ),
        .Q(indvar_flatten_fu_60_reg[44]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[45] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[40]_i_1_n_10 ),
        .Q(indvar_flatten_fu_60_reg[45]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[46] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[40]_i_1_n_9 ),
        .Q(indvar_flatten_fu_60_reg[46]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[47] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[40]_i_1_n_8 ),
        .Q(indvar_flatten_fu_60_reg[47]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[48] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[48]_i_1_n_15 ),
        .Q(indvar_flatten_fu_60_reg[48]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \indvar_flatten_fu_60_reg[48]_i_1 
       (.CI(\indvar_flatten_fu_60_reg[40]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\indvar_flatten_fu_60_reg[48]_i_1_n_0 ,\indvar_flatten_fu_60_reg[48]_i_1_n_1 ,\indvar_flatten_fu_60_reg[48]_i_1_n_2 ,\indvar_flatten_fu_60_reg[48]_i_1_n_3 ,\indvar_flatten_fu_60_reg[48]_i_1_n_4 ,\indvar_flatten_fu_60_reg[48]_i_1_n_5 ,\indvar_flatten_fu_60_reg[48]_i_1_n_6 ,\indvar_flatten_fu_60_reg[48]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\indvar_flatten_fu_60_reg[48]_i_1_n_8 ,\indvar_flatten_fu_60_reg[48]_i_1_n_9 ,\indvar_flatten_fu_60_reg[48]_i_1_n_10 ,\indvar_flatten_fu_60_reg[48]_i_1_n_11 ,\indvar_flatten_fu_60_reg[48]_i_1_n_12 ,\indvar_flatten_fu_60_reg[48]_i_1_n_13 ,\indvar_flatten_fu_60_reg[48]_i_1_n_14 ,\indvar_flatten_fu_60_reg[48]_i_1_n_15 }),
        .S(indvar_flatten_fu_60_reg[55:48]));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[49] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[48]_i_1_n_14 ),
        .Q(indvar_flatten_fu_60_reg[49]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[4] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[0]_i_3_n_11 ),
        .Q(indvar_flatten_fu_60_reg[4]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[50] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[48]_i_1_n_13 ),
        .Q(indvar_flatten_fu_60_reg[50]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[51] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[48]_i_1_n_12 ),
        .Q(indvar_flatten_fu_60_reg[51]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[52] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[48]_i_1_n_11 ),
        .Q(indvar_flatten_fu_60_reg[52]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[53] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[48]_i_1_n_10 ),
        .Q(indvar_flatten_fu_60_reg[53]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[54] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[48]_i_1_n_9 ),
        .Q(indvar_flatten_fu_60_reg[54]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[55] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[48]_i_1_n_8 ),
        .Q(indvar_flatten_fu_60_reg[55]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[56] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[56]_i_1_n_15 ),
        .Q(indvar_flatten_fu_60_reg[56]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \indvar_flatten_fu_60_reg[56]_i_1 
       (.CI(\indvar_flatten_fu_60_reg[48]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_indvar_flatten_fu_60_reg[56]_i_1_CO_UNCONNECTED [7:5],\indvar_flatten_fu_60_reg[56]_i_1_n_3 ,\indvar_flatten_fu_60_reg[56]_i_1_n_4 ,\indvar_flatten_fu_60_reg[56]_i_1_n_5 ,\indvar_flatten_fu_60_reg[56]_i_1_n_6 ,\indvar_flatten_fu_60_reg[56]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_indvar_flatten_fu_60_reg[56]_i_1_O_UNCONNECTED [7:6],\indvar_flatten_fu_60_reg[56]_i_1_n_10 ,\indvar_flatten_fu_60_reg[56]_i_1_n_11 ,\indvar_flatten_fu_60_reg[56]_i_1_n_12 ,\indvar_flatten_fu_60_reg[56]_i_1_n_13 ,\indvar_flatten_fu_60_reg[56]_i_1_n_14 ,\indvar_flatten_fu_60_reg[56]_i_1_n_15 }),
        .S({1'b0,1'b0,indvar_flatten_fu_60_reg[61:56]}));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[57] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[56]_i_1_n_14 ),
        .Q(indvar_flatten_fu_60_reg[57]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[58] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[56]_i_1_n_13 ),
        .Q(indvar_flatten_fu_60_reg[58]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[59] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[56]_i_1_n_12 ),
        .Q(indvar_flatten_fu_60_reg[59]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[5] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[0]_i_3_n_10 ),
        .Q(indvar_flatten_fu_60_reg[5]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[60] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[56]_i_1_n_11 ),
        .Q(indvar_flatten_fu_60_reg[60]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[61] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[56]_i_1_n_10 ),
        .Q(indvar_flatten_fu_60_reg[61]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[6] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[0]_i_3_n_9 ),
        .Q(indvar_flatten_fu_60_reg[6]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[7] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[0]_i_3_n_8 ),
        .Q(indvar_flatten_fu_60_reg[7]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[8] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[8]_i_1_n_15 ),
        .Q(indvar_flatten_fu_60_reg[8]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \indvar_flatten_fu_60_reg[8]_i_1 
       (.CI(\indvar_flatten_fu_60_reg[0]_i_3_n_0 ),
        .CI_TOP(1'b0),
        .CO({\indvar_flatten_fu_60_reg[8]_i_1_n_0 ,\indvar_flatten_fu_60_reg[8]_i_1_n_1 ,\indvar_flatten_fu_60_reg[8]_i_1_n_2 ,\indvar_flatten_fu_60_reg[8]_i_1_n_3 ,\indvar_flatten_fu_60_reg[8]_i_1_n_4 ,\indvar_flatten_fu_60_reg[8]_i_1_n_5 ,\indvar_flatten_fu_60_reg[8]_i_1_n_6 ,\indvar_flatten_fu_60_reg[8]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\indvar_flatten_fu_60_reg[8]_i_1_n_8 ,\indvar_flatten_fu_60_reg[8]_i_1_n_9 ,\indvar_flatten_fu_60_reg[8]_i_1_n_10 ,\indvar_flatten_fu_60_reg[8]_i_1_n_11 ,\indvar_flatten_fu_60_reg[8]_i_1_n_12 ,\indvar_flatten_fu_60_reg[8]_i_1_n_13 ,\indvar_flatten_fu_60_reg[8]_i_1_n_14 ,\indvar_flatten_fu_60_reg[8]_i_1_n_15 }),
        .S(indvar_flatten_fu_60_reg[15:8]));
  FDRE #(
    .INIT(1'b0)) 
    \indvar_flatten_fu_60_reg[9] 
       (.C(ap_clk),
        .CE(indvar_flatten_fu_60),
        .D(\indvar_flatten_fu_60_reg[8]_i_1_n_14 ),
        .Q(indvar_flatten_fu_60_reg[9]),
        .R(flow_control_loop_pipe_sequential_init_U_n_14));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \out_stream_TDATA_reg[31]_i_1 
       (.I0(ap_enable_reg_pp0_iter2_reg_0),
        .I1(Q),
        .I2(ack_in),
        .I3(\ap_CS_fsm_reg[3] [1]),
        .O(out_stream_TDATA_reg1));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_mul_32ns_31ns_62_1_1
   (D,
    PCOUT,
    ap_clk_0,
    ap_clk_1,
    mul_ln9_reg_138_reg__1,
    CEA2,
    ap_clk,
    RSTA,
    DSP_ALU_INST,
    A,
    P,
    Q,
    S,
    tmp_product_carry__1_0,
    tmp_product_carry__3_0);
  output [16:0]D;
  output [47:0]PCOUT;
  output [16:0]ap_clk_0;
  output [47:0]ap_clk_1;
  output [45:0]mul_ln9_reg_138_reg__1;
  input CEA2;
  input ap_clk;
  input RSTA;
  input [31:0]DSP_ALU_INST;
  input [16:0]A;
  input [43:0]P;
  input [0:0]Q;
  input [5:0]S;
  input [16:0]tmp_product_carry__1_0;
  input [21:0]tmp_product_carry__3_0;

  wire [16:0]A;
  wire CEA2;
  wire [16:0]D;
  wire [31:0]DSP_ALU_INST;
  wire [43:0]P;
  wire [47:0]PCOUT;
  wire [0:0]Q;
  wire RSTA;
  wire [5:0]S;
  wire ap_clk;
  wire [16:0]ap_clk_0;
  wire [47:0]ap_clk_1;
  wire [45:0]mul_ln9_reg_138_reg__1;
  wire tmp_product__0_n_58;
  wire tmp_product__0_n_59;
  wire tmp_product__0_n_60;
  wire tmp_product__0_n_61;
  wire tmp_product__0_n_62;
  wire tmp_product__0_n_63;
  wire tmp_product__0_n_64;
  wire tmp_product__0_n_65;
  wire tmp_product__0_n_66;
  wire tmp_product__0_n_67;
  wire tmp_product__0_n_68;
  wire tmp_product__0_n_69;
  wire tmp_product__0_n_70;
  wire tmp_product__0_n_71;
  wire tmp_product__0_n_72;
  wire tmp_product__0_n_73;
  wire tmp_product__0_n_74;
  wire tmp_product__0_n_75;
  wire tmp_product__0_n_76;
  wire tmp_product__0_n_77;
  wire tmp_product__0_n_78;
  wire tmp_product__0_n_79;
  wire tmp_product__0_n_80;
  wire tmp_product__0_n_81;
  wire tmp_product__0_n_82;
  wire tmp_product__0_n_83;
  wire tmp_product__0_n_84;
  wire tmp_product__0_n_85;
  wire tmp_product__0_n_86;
  wire tmp_product__0_n_87;
  wire tmp_product__0_n_88;
  wire tmp_product_carry__0_i_1_n_0;
  wire tmp_product_carry__0_i_2_n_0;
  wire tmp_product_carry__0_i_3_n_0;
  wire tmp_product_carry__0_i_4_n_0;
  wire tmp_product_carry__0_i_5_n_0;
  wire tmp_product_carry__0_i_6_n_0;
  wire tmp_product_carry__0_i_7_n_0;
  wire tmp_product_carry__0_i_8_n_0;
  wire tmp_product_carry__0_n_0;
  wire tmp_product_carry__0_n_1;
  wire tmp_product_carry__0_n_2;
  wire tmp_product_carry__0_n_3;
  wire tmp_product_carry__0_n_4;
  wire tmp_product_carry__0_n_5;
  wire tmp_product_carry__0_n_6;
  wire tmp_product_carry__0_n_7;
  wire [16:0]tmp_product_carry__1_0;
  wire tmp_product_carry__1_i_1_n_0;
  wire tmp_product_carry__1_i_2_n_0;
  wire tmp_product_carry__1_i_3_n_0;
  wire tmp_product_carry__1_i_4_n_0;
  wire tmp_product_carry__1_i_5_n_0;
  wire tmp_product_carry__1_i_6_n_0;
  wire tmp_product_carry__1_i_7_n_0;
  wire tmp_product_carry__1_i_8_n_0;
  wire tmp_product_carry__1_n_0;
  wire tmp_product_carry__1_n_1;
  wire tmp_product_carry__1_n_2;
  wire tmp_product_carry__1_n_3;
  wire tmp_product_carry__1_n_4;
  wire tmp_product_carry__1_n_5;
  wire tmp_product_carry__1_n_6;
  wire tmp_product_carry__1_n_7;
  wire tmp_product_carry__2_i_1_n_0;
  wire tmp_product_carry__2_i_2_n_0;
  wire tmp_product_carry__2_i_3_n_0;
  wire tmp_product_carry__2_i_4_n_0;
  wire tmp_product_carry__2_i_5_n_0;
  wire tmp_product_carry__2_i_6_n_0;
  wire tmp_product_carry__2_i_7_n_0;
  wire tmp_product_carry__2_i_8_n_0;
  wire tmp_product_carry__2_n_0;
  wire tmp_product_carry__2_n_1;
  wire tmp_product_carry__2_n_2;
  wire tmp_product_carry__2_n_3;
  wire tmp_product_carry__2_n_4;
  wire tmp_product_carry__2_n_5;
  wire tmp_product_carry__2_n_6;
  wire tmp_product_carry__2_n_7;
  wire [21:0]tmp_product_carry__3_0;
  wire tmp_product_carry__3_i_1_n_0;
  wire tmp_product_carry__3_i_2_n_0;
  wire tmp_product_carry__3_i_3_n_0;
  wire tmp_product_carry__3_i_4_n_0;
  wire tmp_product_carry__3_i_5_n_0;
  wire tmp_product_carry__3_i_6_n_0;
  wire tmp_product_carry__3_i_7_n_0;
  wire tmp_product_carry__3_i_8_n_0;
  wire tmp_product_carry__3_n_0;
  wire tmp_product_carry__3_n_1;
  wire tmp_product_carry__3_n_2;
  wire tmp_product_carry__3_n_3;
  wire tmp_product_carry__3_n_4;
  wire tmp_product_carry__3_n_5;
  wire tmp_product_carry__3_n_6;
  wire tmp_product_carry__3_n_7;
  wire tmp_product_carry__4_n_3;
  wire tmp_product_carry__4_n_4;
  wire tmp_product_carry__4_n_5;
  wire tmp_product_carry__4_n_6;
  wire tmp_product_carry__4_n_7;
  wire tmp_product_carry_i_1_n_0;
  wire tmp_product_carry_i_2_n_0;
  wire tmp_product_carry_i_3_n_0;
  wire tmp_product_carry_i_4_n_0;
  wire tmp_product_carry_i_5_n_0;
  wire tmp_product_carry_i_6_n_0;
  wire tmp_product_carry_i_7_n_0;
  wire tmp_product_carry_n_0;
  wire tmp_product_carry_n_1;
  wire tmp_product_carry_n_2;
  wire tmp_product_carry_n_3;
  wire tmp_product_carry_n_4;
  wire tmp_product_carry_n_5;
  wire tmp_product_carry_n_6;
  wire tmp_product_carry_n_7;
  wire tmp_product_n_58;
  wire tmp_product_n_59;
  wire tmp_product_n_60;
  wire tmp_product_n_61;
  wire tmp_product_n_62;
  wire tmp_product_n_63;
  wire tmp_product_n_64;
  wire tmp_product_n_65;
  wire tmp_product_n_66;
  wire tmp_product_n_67;
  wire tmp_product_n_68;
  wire tmp_product_n_69;
  wire tmp_product_n_70;
  wire tmp_product_n_71;
  wire tmp_product_n_72;
  wire tmp_product_n_73;
  wire tmp_product_n_74;
  wire tmp_product_n_75;
  wire tmp_product_n_76;
  wire tmp_product_n_77;
  wire tmp_product_n_78;
  wire tmp_product_n_79;
  wire tmp_product_n_80;
  wire tmp_product_n_81;
  wire tmp_product_n_82;
  wire tmp_product_n_83;
  wire tmp_product_n_84;
  wire tmp_product_n_85;
  wire tmp_product_n_86;
  wire tmp_product_n_87;
  wire tmp_product_n_88;
  wire NLW_tmp_product_CARRYCASCOUT_UNCONNECTED;
  wire NLW_tmp_product_MULTSIGNOUT_UNCONNECTED;
  wire NLW_tmp_product_OVERFLOW_UNCONNECTED;
  wire NLW_tmp_product_PATTERNBDETECT_UNCONNECTED;
  wire NLW_tmp_product_PATTERNDETECT_UNCONNECTED;
  wire NLW_tmp_product_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_tmp_product_ACOUT_UNCONNECTED;
  wire [17:0]NLW_tmp_product_BCOUT_UNCONNECTED;
  wire [3:0]NLW_tmp_product_CARRYOUT_UNCONNECTED;
  wire [7:0]NLW_tmp_product_XOROUT_UNCONNECTED;
  wire NLW_tmp_product__0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_tmp_product__0_MULTSIGNOUT_UNCONNECTED;
  wire NLW_tmp_product__0_OVERFLOW_UNCONNECTED;
  wire NLW_tmp_product__0_PATTERNBDETECT_UNCONNECTED;
  wire NLW_tmp_product__0_PATTERNDETECT_UNCONNECTED;
  wire NLW_tmp_product__0_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_tmp_product__0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_tmp_product__0_BCOUT_UNCONNECTED;
  wire [3:0]NLW_tmp_product__0_CARRYOUT_UNCONNECTED;
  wire [7:0]NLW_tmp_product__0_XOROUT_UNCONNECTED;
  wire [7:5]NLW_tmp_product_carry__4_CO_UNCONNECTED;
  wire [7:6]NLW_tmp_product_carry__4_O_UNCONNECTED;

  (* KEEP_HIERARCHY = "YES" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 16x18 4}}" *) 
  DSP48E2 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BMULTSEL("B"),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(0),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    tmp_product
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,A}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_tmp_product_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,DSP_ALU_INST[31:17]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_tmp_product_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_tmp_product_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_tmp_product_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(CEA2),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(ap_clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_tmp_product_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_tmp_product_OVERFLOW_UNCONNECTED),
        .P({tmp_product_n_58,tmp_product_n_59,tmp_product_n_60,tmp_product_n_61,tmp_product_n_62,tmp_product_n_63,tmp_product_n_64,tmp_product_n_65,tmp_product_n_66,tmp_product_n_67,tmp_product_n_68,tmp_product_n_69,tmp_product_n_70,tmp_product_n_71,tmp_product_n_72,tmp_product_n_73,tmp_product_n_74,tmp_product_n_75,tmp_product_n_76,tmp_product_n_77,tmp_product_n_78,tmp_product_n_79,tmp_product_n_80,tmp_product_n_81,tmp_product_n_82,tmp_product_n_83,tmp_product_n_84,tmp_product_n_85,tmp_product_n_86,tmp_product_n_87,tmp_product_n_88,D}),
        .PATTERNBDETECT(NLW_tmp_product_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_tmp_product_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(RSTA),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_tmp_product_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_tmp_product_XOROUT_UNCONNECTED[7:0]));
  (* KEEP_HIERARCHY = "YES" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x18 4}}" *) 
  DSP48E2 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BMULTSEL("B"),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(0),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    tmp_product__0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,DSP_ALU_INST[16:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_tmp_product__0_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,A}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_tmp_product__0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_tmp_product__0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_tmp_product__0_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(CEA2),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(ap_clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_tmp_product__0_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_tmp_product__0_OVERFLOW_UNCONNECTED),
        .P({tmp_product__0_n_58,tmp_product__0_n_59,tmp_product__0_n_60,tmp_product__0_n_61,tmp_product__0_n_62,tmp_product__0_n_63,tmp_product__0_n_64,tmp_product__0_n_65,tmp_product__0_n_66,tmp_product__0_n_67,tmp_product__0_n_68,tmp_product__0_n_69,tmp_product__0_n_70,tmp_product__0_n_71,tmp_product__0_n_72,tmp_product__0_n_73,tmp_product__0_n_74,tmp_product__0_n_75,tmp_product__0_n_76,tmp_product__0_n_77,tmp_product__0_n_78,tmp_product__0_n_79,tmp_product__0_n_80,tmp_product__0_n_81,tmp_product__0_n_82,tmp_product__0_n_83,tmp_product__0_n_84,tmp_product__0_n_85,tmp_product__0_n_86,tmp_product__0_n_87,tmp_product__0_n_88,ap_clk_0}),
        .PATTERNBDETECT(NLW_tmp_product__0_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_tmp_product__0_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(ap_clk_1),
        .RSTA(RSTA),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_tmp_product__0_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_tmp_product__0_XOROUT_UNCONNECTED[7:0]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 tmp_product_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({tmp_product_carry_n_0,tmp_product_carry_n_1,tmp_product_carry_n_2,tmp_product_carry_n_3,tmp_product_carry_n_4,tmp_product_carry_n_5,tmp_product_carry_n_6,tmp_product_carry_n_7}),
        .DI({P[6:0],1'b0}),
        .O(mul_ln9_reg_138_reg__1[7:0]),
        .S({tmp_product_carry_i_1_n_0,tmp_product_carry_i_2_n_0,tmp_product_carry_i_3_n_0,tmp_product_carry_i_4_n_0,tmp_product_carry_i_5_n_0,tmp_product_carry_i_6_n_0,tmp_product_carry_i_7_n_0,Q}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 tmp_product_carry__0
       (.CI(tmp_product_carry_n_0),
        .CI_TOP(1'b0),
        .CO({tmp_product_carry__0_n_0,tmp_product_carry__0_n_1,tmp_product_carry__0_n_2,tmp_product_carry__0_n_3,tmp_product_carry__0_n_4,tmp_product_carry__0_n_5,tmp_product_carry__0_n_6,tmp_product_carry__0_n_7}),
        .DI(P[14:7]),
        .O(mul_ln9_reg_138_reg__1[15:8]),
        .S({tmp_product_carry__0_i_1_n_0,tmp_product_carry__0_i_2_n_0,tmp_product_carry__0_i_3_n_0,tmp_product_carry__0_i_4_n_0,tmp_product_carry__0_i_5_n_0,tmp_product_carry__0_i_6_n_0,tmp_product_carry__0_i_7_n_0,tmp_product_carry__0_i_8_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__0_i_1
       (.I0(P[14]),
        .I1(tmp_product_carry__1_0[14]),
        .O(tmp_product_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__0_i_2
       (.I0(P[13]),
        .I1(tmp_product_carry__1_0[13]),
        .O(tmp_product_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__0_i_3
       (.I0(P[12]),
        .I1(tmp_product_carry__1_0[12]),
        .O(tmp_product_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__0_i_4
       (.I0(P[11]),
        .I1(tmp_product_carry__1_0[11]),
        .O(tmp_product_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__0_i_5
       (.I0(P[10]),
        .I1(tmp_product_carry__1_0[10]),
        .O(tmp_product_carry__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__0_i_6
       (.I0(P[9]),
        .I1(tmp_product_carry__1_0[9]),
        .O(tmp_product_carry__0_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__0_i_7
       (.I0(P[8]),
        .I1(tmp_product_carry__1_0[8]),
        .O(tmp_product_carry__0_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__0_i_8
       (.I0(P[7]),
        .I1(tmp_product_carry__1_0[7]),
        .O(tmp_product_carry__0_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 tmp_product_carry__1
       (.CI(tmp_product_carry__0_n_0),
        .CI_TOP(1'b0),
        .CO({tmp_product_carry__1_n_0,tmp_product_carry__1_n_1,tmp_product_carry__1_n_2,tmp_product_carry__1_n_3,tmp_product_carry__1_n_4,tmp_product_carry__1_n_5,tmp_product_carry__1_n_6,tmp_product_carry__1_n_7}),
        .DI(P[22:15]),
        .O(mul_ln9_reg_138_reg__1[23:16]),
        .S({tmp_product_carry__1_i_1_n_0,tmp_product_carry__1_i_2_n_0,tmp_product_carry__1_i_3_n_0,tmp_product_carry__1_i_4_n_0,tmp_product_carry__1_i_5_n_0,tmp_product_carry__1_i_6_n_0,tmp_product_carry__1_i_7_n_0,tmp_product_carry__1_i_8_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__1_i_1
       (.I0(P[22]),
        .I1(tmp_product_carry__3_0[5]),
        .O(tmp_product_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__1_i_2
       (.I0(P[21]),
        .I1(tmp_product_carry__3_0[4]),
        .O(tmp_product_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__1_i_3
       (.I0(P[20]),
        .I1(tmp_product_carry__3_0[3]),
        .O(tmp_product_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__1_i_4
       (.I0(P[19]),
        .I1(tmp_product_carry__3_0[2]),
        .O(tmp_product_carry__1_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__1_i_5
       (.I0(P[18]),
        .I1(tmp_product_carry__3_0[1]),
        .O(tmp_product_carry__1_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__1_i_6
       (.I0(P[17]),
        .I1(tmp_product_carry__3_0[0]),
        .O(tmp_product_carry__1_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__1_i_7
       (.I0(P[16]),
        .I1(tmp_product_carry__1_0[16]),
        .O(tmp_product_carry__1_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__1_i_8
       (.I0(P[15]),
        .I1(tmp_product_carry__1_0[15]),
        .O(tmp_product_carry__1_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 tmp_product_carry__2
       (.CI(tmp_product_carry__1_n_0),
        .CI_TOP(1'b0),
        .CO({tmp_product_carry__2_n_0,tmp_product_carry__2_n_1,tmp_product_carry__2_n_2,tmp_product_carry__2_n_3,tmp_product_carry__2_n_4,tmp_product_carry__2_n_5,tmp_product_carry__2_n_6,tmp_product_carry__2_n_7}),
        .DI(P[30:23]),
        .O(mul_ln9_reg_138_reg__1[31:24]),
        .S({tmp_product_carry__2_i_1_n_0,tmp_product_carry__2_i_2_n_0,tmp_product_carry__2_i_3_n_0,tmp_product_carry__2_i_4_n_0,tmp_product_carry__2_i_5_n_0,tmp_product_carry__2_i_6_n_0,tmp_product_carry__2_i_7_n_0,tmp_product_carry__2_i_8_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__2_i_1
       (.I0(P[30]),
        .I1(tmp_product_carry__3_0[13]),
        .O(tmp_product_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__2_i_2
       (.I0(P[29]),
        .I1(tmp_product_carry__3_0[12]),
        .O(tmp_product_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__2_i_3
       (.I0(P[28]),
        .I1(tmp_product_carry__3_0[11]),
        .O(tmp_product_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__2_i_4
       (.I0(P[27]),
        .I1(tmp_product_carry__3_0[10]),
        .O(tmp_product_carry__2_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__2_i_5
       (.I0(P[26]),
        .I1(tmp_product_carry__3_0[9]),
        .O(tmp_product_carry__2_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__2_i_6
       (.I0(P[25]),
        .I1(tmp_product_carry__3_0[8]),
        .O(tmp_product_carry__2_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__2_i_7
       (.I0(P[24]),
        .I1(tmp_product_carry__3_0[7]),
        .O(tmp_product_carry__2_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__2_i_8
       (.I0(P[23]),
        .I1(tmp_product_carry__3_0[6]),
        .O(tmp_product_carry__2_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 tmp_product_carry__3
       (.CI(tmp_product_carry__2_n_0),
        .CI_TOP(1'b0),
        .CO({tmp_product_carry__3_n_0,tmp_product_carry__3_n_1,tmp_product_carry__3_n_2,tmp_product_carry__3_n_3,tmp_product_carry__3_n_4,tmp_product_carry__3_n_5,tmp_product_carry__3_n_6,tmp_product_carry__3_n_7}),
        .DI(P[38:31]),
        .O(mul_ln9_reg_138_reg__1[39:32]),
        .S({tmp_product_carry__3_i_1_n_0,tmp_product_carry__3_i_2_n_0,tmp_product_carry__3_i_3_n_0,tmp_product_carry__3_i_4_n_0,tmp_product_carry__3_i_5_n_0,tmp_product_carry__3_i_6_n_0,tmp_product_carry__3_i_7_n_0,tmp_product_carry__3_i_8_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__3_i_1
       (.I0(P[38]),
        .I1(tmp_product_carry__3_0[21]),
        .O(tmp_product_carry__3_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__3_i_2
       (.I0(P[37]),
        .I1(tmp_product_carry__3_0[20]),
        .O(tmp_product_carry__3_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__3_i_3
       (.I0(P[36]),
        .I1(tmp_product_carry__3_0[19]),
        .O(tmp_product_carry__3_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__3_i_4
       (.I0(P[35]),
        .I1(tmp_product_carry__3_0[18]),
        .O(tmp_product_carry__3_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__3_i_5
       (.I0(P[34]),
        .I1(tmp_product_carry__3_0[17]),
        .O(tmp_product_carry__3_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__3_i_6
       (.I0(P[33]),
        .I1(tmp_product_carry__3_0[16]),
        .O(tmp_product_carry__3_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__3_i_7
       (.I0(P[32]),
        .I1(tmp_product_carry__3_0[15]),
        .O(tmp_product_carry__3_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry__3_i_8
       (.I0(P[31]),
        .I1(tmp_product_carry__3_0[14]),
        .O(tmp_product_carry__3_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 tmp_product_carry__4
       (.CI(tmp_product_carry__3_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_tmp_product_carry__4_CO_UNCONNECTED[7:5],tmp_product_carry__4_n_3,tmp_product_carry__4_n_4,tmp_product_carry__4_n_5,tmp_product_carry__4_n_6,tmp_product_carry__4_n_7}),
        .DI({1'b0,1'b0,1'b0,P[43:39]}),
        .O({NLW_tmp_product_carry__4_O_UNCONNECTED[7:6],mul_ln9_reg_138_reg__1[45:40]}),
        .S({1'b0,1'b0,S}));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry_i_1
       (.I0(P[6]),
        .I1(tmp_product_carry__1_0[6]),
        .O(tmp_product_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry_i_2
       (.I0(P[5]),
        .I1(tmp_product_carry__1_0[5]),
        .O(tmp_product_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry_i_3
       (.I0(P[4]),
        .I1(tmp_product_carry__1_0[4]),
        .O(tmp_product_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry_i_4
       (.I0(P[3]),
        .I1(tmp_product_carry__1_0[3]),
        .O(tmp_product_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry_i_5
       (.I0(P[2]),
        .I1(tmp_product_carry__1_0[2]),
        .O(tmp_product_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry_i_6
       (.I0(P[1]),
        .I1(tmp_product_carry__1_0[1]),
        .O(tmp_product_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    tmp_product_carry_i_7
       (.I0(P[0]),
        .I1(tmp_product_carry__1_0[0]),
        .O(tmp_product_carry_i_7_n_0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_regslice_both
   (ack_in_t_reg_0,
    \state_reg[0]_0 ,
    \data_p1_reg[31]_0 ,
    RSTA,
    ap_clk,
    Q,
    ack_in_t_reg_1,
    in_stream_TVALID,
    in_stream_TDATA,
    ack_in,
    \state_reg[1]_0 );
  output ack_in_t_reg_0;
  output [0:0]\state_reg[0]_0 ;
  output [31:0]\data_p1_reg[31]_0 ;
  input RSTA;
  input ap_clk;
  input [0:0]Q;
  input ack_in_t_reg_1;
  input in_stream_TVALID;
  input [31:0]in_stream_TDATA;
  input ack_in;
  input \state_reg[1]_0 ;

  wire \FSM_sequential_state[0]_i_1__3_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire [0:0]Q;
  wire RSTA;
  wire ack_in;
  wire ack_in_t_i_2_n_0;
  wire ack_in_t_reg_0;
  wire ack_in_t_reg_1;
  wire ap_clk;
  wire \data_p1[0]_i_1__4_n_0 ;
  wire \data_p1[10]_i_1__0_n_0 ;
  wire \data_p1[11]_i_1__0_n_0 ;
  wire \data_p1[12]_i_1__0_n_0 ;
  wire \data_p1[13]_i_1__0_n_0 ;
  wire \data_p1[14]_i_1__0_n_0 ;
  wire \data_p1[15]_i_1__0_n_0 ;
  wire \data_p1[16]_i_1__0_n_0 ;
  wire \data_p1[17]_i_1__0_n_0 ;
  wire \data_p1[18]_i_1__0_n_0 ;
  wire \data_p1[19]_i_1__0_n_0 ;
  wire \data_p1[1]_i_1__4_n_0 ;
  wire \data_p1[20]_i_1__0_n_0 ;
  wire \data_p1[21]_i_1__0_n_0 ;
  wire \data_p1[22]_i_1__0_n_0 ;
  wire \data_p1[23]_i_1__0_n_0 ;
  wire \data_p1[24]_i_1__0_n_0 ;
  wire \data_p1[25]_i_1__0_n_0 ;
  wire \data_p1[26]_i_1__0_n_0 ;
  wire \data_p1[27]_i_1__0_n_0 ;
  wire \data_p1[28]_i_1__0_n_0 ;
  wire \data_p1[29]_i_1__0_n_0 ;
  wire \data_p1[2]_i_1__4_n_0 ;
  wire \data_p1[30]_i_1__0_n_0 ;
  wire \data_p1[31]_i_2__0_n_0 ;
  wire \data_p1[3]_i_1__4_n_0 ;
  wire \data_p1[4]_i_1__0_n_0 ;
  wire \data_p1[5]_i_1__0_n_0 ;
  wire \data_p1[6]_i_1__0_n_0 ;
  wire \data_p1[7]_i_1__0_n_0 ;
  wire \data_p1[8]_i_1__0_n_0 ;
  wire \data_p1[9]_i_1__0_n_0 ;
  wire [31:0]\data_p1_reg[31]_0 ;
  wire \data_p2_reg_n_0_[0] ;
  wire \data_p2_reg_n_0_[10] ;
  wire \data_p2_reg_n_0_[11] ;
  wire \data_p2_reg_n_0_[12] ;
  wire \data_p2_reg_n_0_[13] ;
  wire \data_p2_reg_n_0_[14] ;
  wire \data_p2_reg_n_0_[15] ;
  wire \data_p2_reg_n_0_[16] ;
  wire \data_p2_reg_n_0_[17] ;
  wire \data_p2_reg_n_0_[18] ;
  wire \data_p2_reg_n_0_[19] ;
  wire \data_p2_reg_n_0_[1] ;
  wire \data_p2_reg_n_0_[20] ;
  wire \data_p2_reg_n_0_[21] ;
  wire \data_p2_reg_n_0_[22] ;
  wire \data_p2_reg_n_0_[23] ;
  wire \data_p2_reg_n_0_[24] ;
  wire \data_p2_reg_n_0_[25] ;
  wire \data_p2_reg_n_0_[26] ;
  wire \data_p2_reg_n_0_[27] ;
  wire \data_p2_reg_n_0_[28] ;
  wire \data_p2_reg_n_0_[29] ;
  wire \data_p2_reg_n_0_[2] ;
  wire \data_p2_reg_n_0_[30] ;
  wire \data_p2_reg_n_0_[31] ;
  wire \data_p2_reg_n_0_[3] ;
  wire \data_p2_reg_n_0_[4] ;
  wire \data_p2_reg_n_0_[5] ;
  wire \data_p2_reg_n_0_[6] ;
  wire \data_p2_reg_n_0_[7] ;
  wire \data_p2_reg_n_0_[8] ;
  wire \data_p2_reg_n_0_[9] ;
  wire [31:0]in_stream_TDATA;
  wire in_stream_TVALID;
  wire load_p1;
  wire load_p2;
  wire [1:1]state;
  wire \state[0]_i_1_n_0 ;
  wire \state[1]_i_1_n_0 ;
  wire [1:0]state__0;
  wire [0:0]\state_reg[0]_0 ;
  wire \state_reg[1]_0 ;

  LUT5 #(
    .INIT(32'h88F8FFFF)) 
    \FSM_sequential_state[0]_i_1__3 
       (.I0(ack_in_t_reg_1),
        .I1(Q),
        .I2(state__0[0]),
        .I3(in_stream_TVALID),
        .I4(state__0[1]),
        .O(\FSM_sequential_state[0]_i_1__3_n_0 ));
  LUT6 #(
    .INIT(64'hFFF0F0F070F070F0)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(Q),
        .I1(ack_in_t_reg_1),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .I4(ack_in_t_reg_0),
        .I5(in_stream_TVALID),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "zero:01,two:10,one:11,iSTATE:00" *) 
  FDSE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_sequential_state[0]_i_1__3_n_0 ),
        .Q(state__0[0]),
        .S(RSTA));
  (* FSM_ENCODED_STATES = "zero:01,two:10,one:11,iSTATE:00" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(state__0[1]),
        .R(RSTA));
  LUT6 #(
    .INIT(64'h8F00FFFFFF88FF00)) 
    ack_in_t_i_2
       (.I0(ack_in_t_reg_1),
        .I1(Q),
        .I2(in_stream_TVALID),
        .I3(ack_in_t_reg_0),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(ack_in_t_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ack_in_t_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ack_in_t_i_2_n_0),
        .Q(ack_in_t_reg_0),
        .R(RSTA));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[0]_i_1__4 
       (.I0(\data_p2_reg_n_0_[0] ),
        .I1(in_stream_TDATA[0]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[0]_i_1__4_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[10]_i_1__0 
       (.I0(\data_p2_reg_n_0_[10] ),
        .I1(in_stream_TDATA[10]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[10]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[11]_i_1__0 
       (.I0(\data_p2_reg_n_0_[11] ),
        .I1(in_stream_TDATA[11]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[11]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[12]_i_1__0 
       (.I0(\data_p2_reg_n_0_[12] ),
        .I1(in_stream_TDATA[12]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[12]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[13]_i_1__0 
       (.I0(\data_p2_reg_n_0_[13] ),
        .I1(in_stream_TDATA[13]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[13]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[14]_i_1__0 
       (.I0(\data_p2_reg_n_0_[14] ),
        .I1(in_stream_TDATA[14]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[14]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[15]_i_1__0 
       (.I0(\data_p2_reg_n_0_[15] ),
        .I1(in_stream_TDATA[15]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[15]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[16]_i_1__0 
       (.I0(\data_p2_reg_n_0_[16] ),
        .I1(in_stream_TDATA[16]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[16]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[17]_i_1__0 
       (.I0(\data_p2_reg_n_0_[17] ),
        .I1(in_stream_TDATA[17]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[17]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[18]_i_1__0 
       (.I0(\data_p2_reg_n_0_[18] ),
        .I1(in_stream_TDATA[18]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[18]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[19]_i_1__0 
       (.I0(\data_p2_reg_n_0_[19] ),
        .I1(in_stream_TDATA[19]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[19]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[1]_i_1__4 
       (.I0(\data_p2_reg_n_0_[1] ),
        .I1(in_stream_TDATA[1]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[1]_i_1__4_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[20]_i_1__0 
       (.I0(\data_p2_reg_n_0_[20] ),
        .I1(in_stream_TDATA[20]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[20]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[21]_i_1__0 
       (.I0(\data_p2_reg_n_0_[21] ),
        .I1(in_stream_TDATA[21]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[21]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[22]_i_1__0 
       (.I0(\data_p2_reg_n_0_[22] ),
        .I1(in_stream_TDATA[22]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[22]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[23]_i_1__0 
       (.I0(\data_p2_reg_n_0_[23] ),
        .I1(in_stream_TDATA[23]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[23]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[24]_i_1__0 
       (.I0(\data_p2_reg_n_0_[24] ),
        .I1(in_stream_TDATA[24]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[24]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[25]_i_1__0 
       (.I0(\data_p2_reg_n_0_[25] ),
        .I1(in_stream_TDATA[25]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[25]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[26]_i_1__0 
       (.I0(\data_p2_reg_n_0_[26] ),
        .I1(in_stream_TDATA[26]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[26]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[27]_i_1__0 
       (.I0(\data_p2_reg_n_0_[27] ),
        .I1(in_stream_TDATA[27]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[27]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[28]_i_1__0 
       (.I0(\data_p2_reg_n_0_[28] ),
        .I1(in_stream_TDATA[28]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[28]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[29]_i_1__0 
       (.I0(\data_p2_reg_n_0_[29] ),
        .I1(in_stream_TDATA[29]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[29]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[2]_i_1__4 
       (.I0(\data_p2_reg_n_0_[2] ),
        .I1(in_stream_TDATA[2]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[2]_i_1__4_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[30]_i_1__0 
       (.I0(\data_p2_reg_n_0_[30] ),
        .I1(in_stream_TDATA[30]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[30]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hE2404040)) 
    \data_p1[31]_i_1 
       (.I0(state__0[1]),
        .I1(state__0[0]),
        .I2(in_stream_TVALID),
        .I3(Q),
        .I4(ack_in_t_reg_1),
        .O(load_p1));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[31]_i_2__0 
       (.I0(\data_p2_reg_n_0_[31] ),
        .I1(in_stream_TDATA[31]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[31]_i_2__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[3]_i_1__4 
       (.I0(\data_p2_reg_n_0_[3] ),
        .I1(in_stream_TDATA[3]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[3]_i_1__4_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[4]_i_1__0 
       (.I0(\data_p2_reg_n_0_[4] ),
        .I1(in_stream_TDATA[4]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[4]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[5]_i_1__0 
       (.I0(\data_p2_reg_n_0_[5] ),
        .I1(in_stream_TDATA[5]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[5]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[6]_i_1__0 
       (.I0(\data_p2_reg_n_0_[6] ),
        .I1(in_stream_TDATA[6]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[6]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[7]_i_1__0 
       (.I0(\data_p2_reg_n_0_[7] ),
        .I1(in_stream_TDATA[7]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[7]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[8]_i_1__0 
       (.I0(\data_p2_reg_n_0_[8] ),
        .I1(in_stream_TDATA[8]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[8]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hCCAC)) 
    \data_p1[9]_i_1__0 
       (.I0(\data_p2_reg_n_0_[9] ),
        .I1(in_stream_TDATA[9]),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\data_p1[9]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[0] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[0]_i_1__4_n_0 ),
        .Q(\data_p1_reg[31]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[10] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[10]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[11] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[11]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[12] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[12]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[13] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[13]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[14] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[14]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[15] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[15]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[16] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[16]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[17] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[17]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[18] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[18]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[19] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[19]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[1] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[1]_i_1__4_n_0 ),
        .Q(\data_p1_reg[31]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[20] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[20]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[21] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[21]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[22] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[22]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[23] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[23]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[24] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[24]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[25] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[25]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[26] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[26]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[27] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[27]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[28] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[28]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[29] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[29]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[2] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[2]_i_1__4_n_0 ),
        .Q(\data_p1_reg[31]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[30] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[30]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[31] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[31]_i_2__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[3] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[3]_i_1__4_n_0 ),
        .Q(\data_p1_reg[31]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[4] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[4]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[5] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[5]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[6] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[6]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[7] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[7]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[8] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[8]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[9] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[9]_i_1__0_n_0 ),
        .Q(\data_p1_reg[31]_0 [9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    \data_p2[31]_i_1 
       (.I0(in_stream_TVALID),
        .I1(ack_in_t_reg_0),
        .O(load_p2));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[0] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[0]),
        .Q(\data_p2_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[10] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[10]),
        .Q(\data_p2_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[11] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[11]),
        .Q(\data_p2_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[12] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[12]),
        .Q(\data_p2_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[13] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[13]),
        .Q(\data_p2_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[14] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[14]),
        .Q(\data_p2_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[15] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[15]),
        .Q(\data_p2_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[16] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[16]),
        .Q(\data_p2_reg_n_0_[16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[17] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[17]),
        .Q(\data_p2_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[18] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[18]),
        .Q(\data_p2_reg_n_0_[18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[19] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[19]),
        .Q(\data_p2_reg_n_0_[19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[1] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[1]),
        .Q(\data_p2_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[20] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[20]),
        .Q(\data_p2_reg_n_0_[20] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[21] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[21]),
        .Q(\data_p2_reg_n_0_[21] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[22] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[22]),
        .Q(\data_p2_reg_n_0_[22] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[23] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[23]),
        .Q(\data_p2_reg_n_0_[23] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[24] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[24]),
        .Q(\data_p2_reg_n_0_[24] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[25] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[25]),
        .Q(\data_p2_reg_n_0_[25] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[26] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[26]),
        .Q(\data_p2_reg_n_0_[26] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[27] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[27]),
        .Q(\data_p2_reg_n_0_[27] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[28] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[28]),
        .Q(\data_p2_reg_n_0_[28] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[29] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[29]),
        .Q(\data_p2_reg_n_0_[29] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[2] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[2]),
        .Q(\data_p2_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[30] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[30]),
        .Q(\data_p2_reg_n_0_[30] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[31] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[31]),
        .Q(\data_p2_reg_n_0_[31] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[3] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[3]),
        .Q(\data_p2_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[4] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[4]),
        .Q(\data_p2_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[5] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[5]),
        .Q(\data_p2_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[6] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[6]),
        .Q(\data_p2_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[7] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[7]),
        .Q(\data_p2_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[8] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[8]),
        .Q(\data_p2_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[9] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TDATA[9]),
        .Q(\data_p2_reg_n_0_[9] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFF0F0F070F070F0)) 
    \state[0]_i_1 
       (.I0(Q),
        .I1(ack_in_t_reg_1),
        .I2(\state_reg[0]_0 ),
        .I3(state),
        .I4(ack_in_t_reg_0),
        .I5(in_stream_TVALID),
        .O(\state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8080FF80FFFFFFFF)) 
    \state[1]_i_1 
       (.I0(Q),
        .I1(ack_in),
        .I2(\state_reg[1]_0 ),
        .I3(state),
        .I4(in_stream_TVALID),
        .I5(\state_reg[0]_0 ),
        .O(\state[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\state[0]_i_1_n_0 ),
        .Q(\state_reg[0]_0 ),
        .R(RSTA));
  FDSE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\state[1]_i_1_n_0 ),
        .Q(state),
        .S(RSTA));
endmodule

(* ORIG_REF_NAME = "hls_passthrough_regslice_both" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_regslice_both_2
   (ack_in,
    out_stream_TVALID,
    \ap_CS_fsm_reg[2] ,
    D,
    \ap_CS_fsm_reg[3] ,
    indvar_flatten_fu_602,
    out_stream_TREADY_0,
    out_stream_TDATA,
    RSTA,
    ap_clk,
    out_stream_TREADY,
    Q,
    ap_start,
    \data_p2_reg[31]_0 ,
    out_stream_TDATA_reg,
    out_stream_TDATA_reg1,
    ap_enable_reg_pp0_iter2_reg,
    ap_enable_reg_pp0_iter2_reg_0,
    E);
  output ack_in;
  output out_stream_TVALID;
  output \ap_CS_fsm_reg[2] ;
  output [0:0]D;
  output \ap_CS_fsm_reg[3] ;
  output indvar_flatten_fu_602;
  output out_stream_TREADY_0;
  output [31:0]out_stream_TDATA;
  input RSTA;
  input ap_clk;
  input out_stream_TREADY;
  input [2:0]Q;
  input ap_start;
  input [31:0]\data_p2_reg[31]_0 ;
  input [31:0]out_stream_TDATA_reg;
  input out_stream_TDATA_reg1;
  input [0:0]ap_enable_reg_pp0_iter2_reg;
  input ap_enable_reg_pp0_iter2_reg_0;
  input [0:0]E;

  wire [0:0]D;
  wire [0:0]E;
  wire \FSM_sequential_state[0]_i_1__8_n_0 ;
  wire \FSM_sequential_state[1]_i_1__4_n_0 ;
  wire [2:0]Q;
  wire RSTA;
  wire ack_in;
  wire ack_in_t_i_1__4_n_0;
  wire \ap_CS_fsm_reg[2] ;
  wire \ap_CS_fsm_reg[3] ;
  wire ap_clk;
  wire [0:0]ap_enable_reg_pp0_iter2_reg;
  wire ap_enable_reg_pp0_iter2_reg_0;
  wire ap_start;
  wire \data_p1[0]_i_1_n_0 ;
  wire \data_p1[10]_i_1_n_0 ;
  wire \data_p1[11]_i_1_n_0 ;
  wire \data_p1[12]_i_1_n_0 ;
  wire \data_p1[13]_i_1_n_0 ;
  wire \data_p1[14]_i_1_n_0 ;
  wire \data_p1[15]_i_1_n_0 ;
  wire \data_p1[16]_i_1_n_0 ;
  wire \data_p1[17]_i_1_n_0 ;
  wire \data_p1[18]_i_1_n_0 ;
  wire \data_p1[19]_i_1_n_0 ;
  wire \data_p1[1]_i_1_n_0 ;
  wire \data_p1[20]_i_1_n_0 ;
  wire \data_p1[21]_i_1_n_0 ;
  wire \data_p1[22]_i_1_n_0 ;
  wire \data_p1[23]_i_1_n_0 ;
  wire \data_p1[24]_i_1_n_0 ;
  wire \data_p1[25]_i_1_n_0 ;
  wire \data_p1[26]_i_1_n_0 ;
  wire \data_p1[27]_i_1_n_0 ;
  wire \data_p1[28]_i_1_n_0 ;
  wire \data_p1[29]_i_1_n_0 ;
  wire \data_p1[2]_i_1_n_0 ;
  wire \data_p1[30]_i_1_n_0 ;
  wire \data_p1[31]_i_2_n_0 ;
  wire \data_p1[3]_i_1__1_n_0 ;
  wire \data_p1[4]_i_1_n_0 ;
  wire \data_p1[5]_i_1_n_0 ;
  wire \data_p1[6]_i_1_n_0 ;
  wire \data_p1[7]_i_1_n_0 ;
  wire \data_p1[8]_i_1_n_0 ;
  wire \data_p1[9]_i_1_n_0 ;
  wire [31:0]\data_p2_reg[31]_0 ;
  wire \data_p2_reg_n_0_[0] ;
  wire \data_p2_reg_n_0_[10] ;
  wire \data_p2_reg_n_0_[11] ;
  wire \data_p2_reg_n_0_[12] ;
  wire \data_p2_reg_n_0_[13] ;
  wire \data_p2_reg_n_0_[14] ;
  wire \data_p2_reg_n_0_[15] ;
  wire \data_p2_reg_n_0_[16] ;
  wire \data_p2_reg_n_0_[17] ;
  wire \data_p2_reg_n_0_[18] ;
  wire \data_p2_reg_n_0_[19] ;
  wire \data_p2_reg_n_0_[1] ;
  wire \data_p2_reg_n_0_[20] ;
  wire \data_p2_reg_n_0_[21] ;
  wire \data_p2_reg_n_0_[22] ;
  wire \data_p2_reg_n_0_[23] ;
  wire \data_p2_reg_n_0_[24] ;
  wire \data_p2_reg_n_0_[25] ;
  wire \data_p2_reg_n_0_[26] ;
  wire \data_p2_reg_n_0_[27] ;
  wire \data_p2_reg_n_0_[28] ;
  wire \data_p2_reg_n_0_[29] ;
  wire \data_p2_reg_n_0_[2] ;
  wire \data_p2_reg_n_0_[30] ;
  wire \data_p2_reg_n_0_[31] ;
  wire \data_p2_reg_n_0_[3] ;
  wire \data_p2_reg_n_0_[4] ;
  wire \data_p2_reg_n_0_[5] ;
  wire \data_p2_reg_n_0_[6] ;
  wire \data_p2_reg_n_0_[7] ;
  wire \data_p2_reg_n_0_[8] ;
  wire \data_p2_reg_n_0_[9] ;
  wire indvar_flatten_fu_602;
  wire load_p1;
  wire [31:0]out_stream_TDATA;
  wire [31:0]out_stream_TDATA_reg;
  wire out_stream_TDATA_reg1;
  wire out_stream_TREADY;
  wire out_stream_TREADY_0;
  wire out_stream_TVALID;
  wire [1:1]state;
  wire \state[0]_i_1__0_n_0 ;
  wire \state[1]_i_1__0_n_0 ;
  wire [1:0]state__0;

  LUT4 #(
    .INIT(16'hAEFF)) 
    \FSM_sequential_state[0]_i_1__8 
       (.I0(out_stream_TREADY),
        .I1(state__0[0]),
        .I2(\ap_CS_fsm_reg[2] ),
        .I3(state__0[1]),
        .O(\FSM_sequential_state[0]_i_1__8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT5 #(
    .INIT(32'hFCCC4C4C)) 
    \FSM_sequential_state[1]_i_1__4 
       (.I0(out_stream_TREADY),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(ack_in),
        .I4(\ap_CS_fsm_reg[2] ),
        .O(\FSM_sequential_state[1]_i_1__4_n_0 ));
  (* FSM_ENCODED_STATES = "zero:01,two:10,one:11,iSTATE:00" *) 
  FDSE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_sequential_state[0]_i_1__8_n_0 ),
        .Q(state__0[0]),
        .S(RSTA));
  (* FSM_ENCODED_STATES = "zero:01,two:10,one:11,iSTATE:00" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_sequential_state[1]_i_1__4_n_0 ),
        .Q(state__0[1]),
        .R(RSTA));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT5 #(
    .INIT(32'hB0FFFAF0)) 
    ack_in_t_i_1__4
       (.I0(out_stream_TREADY),
        .I1(\ap_CS_fsm_reg[2] ),
        .I2(ack_in),
        .I3(state__0[1]),
        .I4(state__0[0]),
        .O(ack_in_t_i_1__4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    ack_in_t_i_3
       (.I0(Q[1]),
        .I1(ack_in),
        .I2(ap_enable_reg_pp0_iter2_reg),
        .I3(ap_enable_reg_pp0_iter2_reg_0),
        .O(\ap_CS_fsm_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    ack_in_t_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ack_in_t_i_1__4_n_0),
        .Q(ack_in),
        .R(RSTA));
  LUT6 #(
    .INIT(64'hF2F222F222F222F2)) 
    \ap_CS_fsm[0]_i_1 
       (.I0(Q[0]),
        .I1(ap_start),
        .I2(Q[2]),
        .I3(state__0[1]),
        .I4(state__0[0]),
        .I5(out_stream_TREADY),
        .O(D));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT4 #(
    .INIT(16'h7000)) 
    \ap_CS_fsm[3]_i_4 
       (.I0(out_stream_TREADY),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(Q[2]),
        .O(out_stream_TREADY_0));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT4 #(
    .INIT(16'h80FF)) 
    ap_enable_reg_pp0_iter1_i_2
       (.I0(Q[1]),
        .I1(ack_in),
        .I2(ap_enable_reg_pp0_iter2_reg),
        .I3(ap_enable_reg_pp0_iter2_reg_0),
        .O(indvar_flatten_fu_602));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[0]_i_1 
       (.I0(\data_p2_reg_n_0_[0] ),
        .I1(\data_p2_reg[31]_0 [0]),
        .I2(out_stream_TDATA_reg[0]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[10]_i_1 
       (.I0(\data_p2_reg_n_0_[10] ),
        .I1(\data_p2_reg[31]_0 [10]),
        .I2(out_stream_TDATA_reg[10]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[11]_i_1 
       (.I0(\data_p2_reg_n_0_[11] ),
        .I1(\data_p2_reg[31]_0 [11]),
        .I2(out_stream_TDATA_reg[11]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[12]_i_1 
       (.I0(\data_p2_reg_n_0_[12] ),
        .I1(\data_p2_reg[31]_0 [12]),
        .I2(out_stream_TDATA_reg[12]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[13]_i_1 
       (.I0(\data_p2_reg_n_0_[13] ),
        .I1(\data_p2_reg[31]_0 [13]),
        .I2(out_stream_TDATA_reg[13]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[14]_i_1 
       (.I0(\data_p2_reg_n_0_[14] ),
        .I1(\data_p2_reg[31]_0 [14]),
        .I2(out_stream_TDATA_reg[14]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[15]_i_1 
       (.I0(\data_p2_reg_n_0_[15] ),
        .I1(\data_p2_reg[31]_0 [15]),
        .I2(out_stream_TDATA_reg[15]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[16]_i_1 
       (.I0(\data_p2_reg_n_0_[16] ),
        .I1(\data_p2_reg[31]_0 [16]),
        .I2(out_stream_TDATA_reg[16]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[17]_i_1 
       (.I0(\data_p2_reg_n_0_[17] ),
        .I1(\data_p2_reg[31]_0 [17]),
        .I2(out_stream_TDATA_reg[17]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[18]_i_1 
       (.I0(\data_p2_reg_n_0_[18] ),
        .I1(\data_p2_reg[31]_0 [18]),
        .I2(out_stream_TDATA_reg[18]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[19]_i_1 
       (.I0(\data_p2_reg_n_0_[19] ),
        .I1(\data_p2_reg[31]_0 [19]),
        .I2(out_stream_TDATA_reg[19]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[1]_i_1 
       (.I0(\data_p2_reg_n_0_[1] ),
        .I1(\data_p2_reg[31]_0 [1]),
        .I2(out_stream_TDATA_reg[1]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[20]_i_1 
       (.I0(\data_p2_reg_n_0_[20] ),
        .I1(\data_p2_reg[31]_0 [20]),
        .I2(out_stream_TDATA_reg[20]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[21]_i_1 
       (.I0(\data_p2_reg_n_0_[21] ),
        .I1(\data_p2_reg[31]_0 [21]),
        .I2(out_stream_TDATA_reg[21]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[22]_i_1 
       (.I0(\data_p2_reg_n_0_[22] ),
        .I1(\data_p2_reg[31]_0 [22]),
        .I2(out_stream_TDATA_reg[22]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[23]_i_1 
       (.I0(\data_p2_reg_n_0_[23] ),
        .I1(\data_p2_reg[31]_0 [23]),
        .I2(out_stream_TDATA_reg[23]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[24]_i_1 
       (.I0(\data_p2_reg_n_0_[24] ),
        .I1(\data_p2_reg[31]_0 [24]),
        .I2(out_stream_TDATA_reg[24]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[25]_i_1 
       (.I0(\data_p2_reg_n_0_[25] ),
        .I1(\data_p2_reg[31]_0 [25]),
        .I2(out_stream_TDATA_reg[25]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[26]_i_1 
       (.I0(\data_p2_reg_n_0_[26] ),
        .I1(\data_p2_reg[31]_0 [26]),
        .I2(out_stream_TDATA_reg[26]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[27]_i_1 
       (.I0(\data_p2_reg_n_0_[27] ),
        .I1(\data_p2_reg[31]_0 [27]),
        .I2(out_stream_TDATA_reg[27]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[28]_i_1 
       (.I0(\data_p2_reg_n_0_[28] ),
        .I1(\data_p2_reg[31]_0 [28]),
        .I2(out_stream_TDATA_reg[28]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[29]_i_1 
       (.I0(\data_p2_reg_n_0_[29] ),
        .I1(\data_p2_reg[31]_0 [29]),
        .I2(out_stream_TDATA_reg[29]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[2]_i_1 
       (.I0(\data_p2_reg_n_0_[2] ),
        .I1(\data_p2_reg[31]_0 [2]),
        .I2(out_stream_TDATA_reg[2]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[30]_i_1 
       (.I0(\data_p2_reg_n_0_[30] ),
        .I1(\data_p2_reg[31]_0 [30]),
        .I2(out_stream_TDATA_reg[30]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[30]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hE240)) 
    \data_p1[31]_i_1__0 
       (.I0(state__0[1]),
        .I1(state__0[0]),
        .I2(\ap_CS_fsm_reg[2] ),
        .I3(out_stream_TREADY),
        .O(load_p1));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[31]_i_2 
       (.I0(\data_p2_reg_n_0_[31] ),
        .I1(\data_p2_reg[31]_0 [31]),
        .I2(out_stream_TDATA_reg[31]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[3]_i_1__1 
       (.I0(\data_p2_reg_n_0_[3] ),
        .I1(\data_p2_reg[31]_0 [3]),
        .I2(out_stream_TDATA_reg[3]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[3]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[4]_i_1 
       (.I0(\data_p2_reg_n_0_[4] ),
        .I1(\data_p2_reg[31]_0 [4]),
        .I2(out_stream_TDATA_reg[4]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[5]_i_1 
       (.I0(\data_p2_reg_n_0_[5] ),
        .I1(\data_p2_reg[31]_0 [5]),
        .I2(out_stream_TDATA_reg[5]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[6]_i_1 
       (.I0(\data_p2_reg_n_0_[6] ),
        .I1(\data_p2_reg[31]_0 [6]),
        .I2(out_stream_TDATA_reg[6]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[7]_i_1 
       (.I0(\data_p2_reg_n_0_[7] ),
        .I1(\data_p2_reg[31]_0 [7]),
        .I2(out_stream_TDATA_reg[7]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[8]_i_1 
       (.I0(\data_p2_reg_n_0_[8] ),
        .I1(\data_p2_reg[31]_0 [8]),
        .I2(out_stream_TDATA_reg[8]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCF0CCF0AAAACCF0)) 
    \data_p1[9]_i_1 
       (.I0(\data_p2_reg_n_0_[9] ),
        .I1(\data_p2_reg[31]_0 [9]),
        .I2(out_stream_TDATA_reg[9]),
        .I3(out_stream_TDATA_reg1),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(\data_p1[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[0] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[0]_i_1_n_0 ),
        .Q(out_stream_TDATA[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[10] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[10]_i_1_n_0 ),
        .Q(out_stream_TDATA[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[11] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[11]_i_1_n_0 ),
        .Q(out_stream_TDATA[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[12] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[12]_i_1_n_0 ),
        .Q(out_stream_TDATA[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[13] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[13]_i_1_n_0 ),
        .Q(out_stream_TDATA[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[14] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[14]_i_1_n_0 ),
        .Q(out_stream_TDATA[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[15] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[15]_i_1_n_0 ),
        .Q(out_stream_TDATA[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[16] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[16]_i_1_n_0 ),
        .Q(out_stream_TDATA[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[17] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[17]_i_1_n_0 ),
        .Q(out_stream_TDATA[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[18] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[18]_i_1_n_0 ),
        .Q(out_stream_TDATA[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[19] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[19]_i_1_n_0 ),
        .Q(out_stream_TDATA[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[1] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[1]_i_1_n_0 ),
        .Q(out_stream_TDATA[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[20] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[20]_i_1_n_0 ),
        .Q(out_stream_TDATA[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[21] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[21]_i_1_n_0 ),
        .Q(out_stream_TDATA[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[22] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[22]_i_1_n_0 ),
        .Q(out_stream_TDATA[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[23] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[23]_i_1_n_0 ),
        .Q(out_stream_TDATA[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[24] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[24]_i_1_n_0 ),
        .Q(out_stream_TDATA[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[25] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[25]_i_1_n_0 ),
        .Q(out_stream_TDATA[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[26] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[26]_i_1_n_0 ),
        .Q(out_stream_TDATA[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[27] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[27]_i_1_n_0 ),
        .Q(out_stream_TDATA[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[28] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[28]_i_1_n_0 ),
        .Q(out_stream_TDATA[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[29] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[29]_i_1_n_0 ),
        .Q(out_stream_TDATA[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[2] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[2]_i_1_n_0 ),
        .Q(out_stream_TDATA[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[30] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[30]_i_1_n_0 ),
        .Q(out_stream_TDATA[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[31] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[31]_i_2_n_0 ),
        .Q(out_stream_TDATA[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[3] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[3]_i_1__1_n_0 ),
        .Q(out_stream_TDATA[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[4] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[4]_i_1_n_0 ),
        .Q(out_stream_TDATA[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[5] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[5]_i_1_n_0 ),
        .Q(out_stream_TDATA[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[6] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[6]_i_1_n_0 ),
        .Q(out_stream_TDATA[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[7] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[7]_i_1_n_0 ),
        .Q(out_stream_TDATA[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[8] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[8]_i_1_n_0 ),
        .Q(out_stream_TDATA[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[9] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[9]_i_1_n_0 ),
        .Q(out_stream_TDATA[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[0] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [0]),
        .Q(\data_p2_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[10] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [10]),
        .Q(\data_p2_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[11] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [11]),
        .Q(\data_p2_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[12] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [12]),
        .Q(\data_p2_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[13] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [13]),
        .Q(\data_p2_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[14] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [14]),
        .Q(\data_p2_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[15] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [15]),
        .Q(\data_p2_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[16] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [16]),
        .Q(\data_p2_reg_n_0_[16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[17] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [17]),
        .Q(\data_p2_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[18] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [18]),
        .Q(\data_p2_reg_n_0_[18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[19] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [19]),
        .Q(\data_p2_reg_n_0_[19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[1] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [1]),
        .Q(\data_p2_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[20] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [20]),
        .Q(\data_p2_reg_n_0_[20] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[21] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [21]),
        .Q(\data_p2_reg_n_0_[21] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[22] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [22]),
        .Q(\data_p2_reg_n_0_[22] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[23] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [23]),
        .Q(\data_p2_reg_n_0_[23] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[24] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [24]),
        .Q(\data_p2_reg_n_0_[24] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[25] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [25]),
        .Q(\data_p2_reg_n_0_[25] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[26] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [26]),
        .Q(\data_p2_reg_n_0_[26] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[27] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [27]),
        .Q(\data_p2_reg_n_0_[27] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[28] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [28]),
        .Q(\data_p2_reg_n_0_[28] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[29] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [29]),
        .Q(\data_p2_reg_n_0_[29] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[2] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [2]),
        .Q(\data_p2_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[30] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [30]),
        .Q(\data_p2_reg_n_0_[30] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[31] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [31]),
        .Q(\data_p2_reg_n_0_[31] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[3] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [3]),
        .Q(\data_p2_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[4] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [4]),
        .Q(\data_p2_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[5] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [5]),
        .Q(\data_p2_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[6] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [6]),
        .Q(\data_p2_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[7] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [7]),
        .Q(\data_p2_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[8] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [8]),
        .Q(\data_p2_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[9] 
       (.C(ap_clk),
        .CE(E),
        .D(\data_p2_reg[31]_0 [9]),
        .Q(\data_p2_reg_n_0_[9] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT4 #(
    .INIT(16'hA222)) 
    int_ap_start_i_2
       (.I0(Q[2]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(out_stream_TREADY),
        .O(\ap_CS_fsm_reg[3] ));
  LUT5 #(
    .INIT(32'hFCCC4C4C)) 
    \state[0]_i_1__0 
       (.I0(out_stream_TREADY),
        .I1(out_stream_TVALID),
        .I2(state),
        .I3(ack_in),
        .I4(\ap_CS_fsm_reg[2] ),
        .O(\state[0]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hAEFF)) 
    \state[1]_i_1__0 
       (.I0(out_stream_TREADY),
        .I1(state),
        .I2(\ap_CS_fsm_reg[2] ),
        .I3(out_stream_TVALID),
        .O(\state[1]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\state[0]_i_1__0_n_0 ),
        .Q(out_stream_TVALID),
        .R(RSTA));
  FDSE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\state[1]_i_1__0_n_0 ),
        .Q(state),
        .S(RSTA));
endmodule

(* ORIG_REF_NAME = "hls_passthrough_regslice_both" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_regslice_both__parameterized1
   (\data_p1_reg[3]_0 ,
    RSTA,
    ap_clk,
    Q,
    ack_in_t_reg_0,
    in_stream_TVALID,
    in_stream_TKEEP);
  output [3:0]\data_p1_reg[3]_0 ;
  input RSTA;
  input ap_clk;
  input [0:0]Q;
  input ack_in_t_reg_0;
  input in_stream_TVALID;
  input [3:0]in_stream_TKEEP;

  wire [0:0]Q;
  wire RSTA;
  wire ack_in_t_i_1__0_n_0;
  wire ack_in_t_reg_0;
  wire ack_in_t_reg_n_0;
  wire ap_clk;
  wire \data_p1[0]_i_1__2_n_0 ;
  wire \data_p1[1]_i_1__2_n_0 ;
  wire \data_p1[2]_i_1__2_n_0 ;
  wire \data_p1[3]_i_2__1_n_0 ;
  wire [3:0]\data_p1_reg[3]_0 ;
  wire [3:0]data_p2;
  wire [3:0]in_stream_TKEEP;
  wire in_stream_TVALID;
  wire load_p1;
  wire load_p2;
  wire [1:0]next_st__0;
  wire [1:0]state__0;

  LUT5 #(
    .INIT(32'h88F8FFFF)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(ack_in_t_reg_0),
        .I1(Q),
        .I2(state__0[0]),
        .I3(in_stream_TVALID),
        .I4(state__0[1]),
        .O(next_st__0[0]));
  LUT6 #(
    .INIT(64'hFFF0F0F070F070F0)) 
    \FSM_sequential_state[1]_i_1__3 
       (.I0(Q),
        .I1(ack_in_t_reg_0),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .I4(ack_in_t_reg_n_0),
        .I5(in_stream_TVALID),
        .O(next_st__0[1]));
  (* FSM_ENCODED_STATES = "zero:01,two:10,one:11,iSTATE:00" *) 
  FDSE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(next_st__0[0]),
        .Q(state__0[0]),
        .S(RSTA));
  (* FSM_ENCODED_STATES = "zero:01,two:10,one:11,iSTATE:00" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(next_st__0[1]),
        .Q(state__0[1]),
        .R(RSTA));
  LUT6 #(
    .INIT(64'h8F00FFFFFF88FF00)) 
    ack_in_t_i_1__0
       (.I0(ack_in_t_reg_0),
        .I1(Q),
        .I2(in_stream_TVALID),
        .I3(ack_in_t_reg_n_0),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(ack_in_t_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ack_in_t_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ack_in_t_i_1__0_n_0),
        .Q(ack_in_t_reg_n_0),
        .R(RSTA));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[0]_i_1__2 
       (.I0(data_p2[0]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(in_stream_TKEEP[0]),
        .O(\data_p1[0]_i_1__2_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[1]_i_1__2 
       (.I0(data_p2[1]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(in_stream_TKEEP[1]),
        .O(\data_p1[1]_i_1__2_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[2]_i_1__2 
       (.I0(data_p2[2]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(in_stream_TKEEP[2]),
        .O(\data_p1[2]_i_1__2_n_0 ));
  LUT5 #(
    .INIT(32'hE2404040)) 
    \data_p1[3]_i_1__0 
       (.I0(state__0[1]),
        .I1(state__0[0]),
        .I2(in_stream_TVALID),
        .I3(Q),
        .I4(ack_in_t_reg_0),
        .O(load_p1));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[3]_i_2__1 
       (.I0(data_p2[3]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(in_stream_TKEEP[3]),
        .O(\data_p1[3]_i_2__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[0] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[0]_i_1__2_n_0 ),
        .Q(\data_p1_reg[3]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[1] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[1]_i_1__2_n_0 ),
        .Q(\data_p1_reg[3]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[2] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[2]_i_1__2_n_0 ),
        .Q(\data_p1_reg[3]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[3] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[3]_i_2__1_n_0 ),
        .Q(\data_p1_reg[3]_0 [3]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    \data_p2[3]_i_1 
       (.I0(in_stream_TVALID),
        .I1(ack_in_t_reg_n_0),
        .O(load_p2));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[0] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TKEEP[0]),
        .Q(data_p2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[1] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TKEEP[1]),
        .Q(data_p2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[2] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TKEEP[2]),
        .Q(data_p2[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[3] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TKEEP[3]),
        .Q(data_p2[3]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "hls_passthrough_regslice_both" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_regslice_both__parameterized1_0
   (\data_p1_reg[3]_0 ,
    RSTA,
    ap_clk,
    Q,
    ack_in_t_reg_0,
    in_stream_TVALID,
    in_stream_TSTRB);
  output [3:0]\data_p1_reg[3]_0 ;
  input RSTA;
  input ap_clk;
  input [0:0]Q;
  input ack_in_t_reg_0;
  input in_stream_TVALID;
  input [3:0]in_stream_TSTRB;

  wire [0:0]Q;
  wire RSTA;
  wire ack_in_t_i_1__1_n_0;
  wire ack_in_t_reg_0;
  wire ack_in_t_reg_n_0;
  wire ap_clk;
  wire \data_p1[0]_i_1__3_n_0 ;
  wire \data_p1[1]_i_1__3_n_0 ;
  wire \data_p1[2]_i_1__3_n_0 ;
  wire \data_p1[3]_i_2__2_n_0 ;
  wire [3:0]\data_p1_reg[3]_0 ;
  wire [3:0]data_p2;
  wire [3:0]in_stream_TSTRB;
  wire in_stream_TVALID;
  wire load_p1;
  wire load_p2;
  wire [1:0]next_st__0;
  wire [1:0]state__0;

  LUT5 #(
    .INIT(32'h88F8FFFF)) 
    \FSM_sequential_state[0]_i_1__0 
       (.I0(ack_in_t_reg_0),
        .I1(Q),
        .I2(state__0[0]),
        .I3(in_stream_TVALID),
        .I4(state__0[1]),
        .O(next_st__0[0]));
  LUT6 #(
    .INIT(64'hFFF0F0F070F070F0)) 
    \FSM_sequential_state[1]_i_1__2 
       (.I0(Q),
        .I1(ack_in_t_reg_0),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .I4(ack_in_t_reg_n_0),
        .I5(in_stream_TVALID),
        .O(next_st__0[1]));
  (* FSM_ENCODED_STATES = "zero:01,two:10,one:11,iSTATE:00" *) 
  FDSE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(next_st__0[0]),
        .Q(state__0[0]),
        .S(RSTA));
  (* FSM_ENCODED_STATES = "zero:01,two:10,one:11,iSTATE:00" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(next_st__0[1]),
        .Q(state__0[1]),
        .R(RSTA));
  LUT6 #(
    .INIT(64'h8F00FFFFFF88FF00)) 
    ack_in_t_i_1__1
       (.I0(ack_in_t_reg_0),
        .I1(Q),
        .I2(in_stream_TVALID),
        .I3(ack_in_t_reg_n_0),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(ack_in_t_i_1__1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ack_in_t_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ack_in_t_i_1__1_n_0),
        .Q(ack_in_t_reg_n_0),
        .R(RSTA));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[0]_i_1__3 
       (.I0(data_p2[0]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(in_stream_TSTRB[0]),
        .O(\data_p1[0]_i_1__3_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[1]_i_1__3 
       (.I0(data_p2[1]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(in_stream_TSTRB[1]),
        .O(\data_p1[1]_i_1__3_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[2]_i_1__3 
       (.I0(data_p2[2]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(in_stream_TSTRB[2]),
        .O(\data_p1[2]_i_1__3_n_0 ));
  LUT5 #(
    .INIT(32'hE2404040)) 
    \data_p1[3]_i_1 
       (.I0(state__0[1]),
        .I1(state__0[0]),
        .I2(in_stream_TVALID),
        .I3(Q),
        .I4(ack_in_t_reg_0),
        .O(load_p1));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[3]_i_2__2 
       (.I0(data_p2[3]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(in_stream_TSTRB[3]),
        .O(\data_p1[3]_i_2__2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[0] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[0]_i_1__3_n_0 ),
        .Q(\data_p1_reg[3]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[1] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[1]_i_1__3_n_0 ),
        .Q(\data_p1_reg[3]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[2] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[2]_i_1__3_n_0 ),
        .Q(\data_p1_reg[3]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[3] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[3]_i_2__2_n_0 ),
        .Q(\data_p1_reg[3]_0 [3]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    \data_p2[3]_i_1__0 
       (.I0(in_stream_TVALID),
        .I1(ack_in_t_reg_n_0),
        .O(load_p2));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[0] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TSTRB[0]),
        .Q(data_p2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[1] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TSTRB[1]),
        .Q(data_p2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[2] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TSTRB[2]),
        .Q(data_p2[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[3] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(in_stream_TSTRB[3]),
        .Q(data_p2[3]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "hls_passthrough_regslice_both" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_regslice_both__parameterized1_3
   (ack_in_t_reg_0,
    out_stream_TKEEP,
    RSTA,
    ap_clk,
    out_stream_TREADY,
    ack_in_t_reg_1,
    D,
    out_stream_TDATA_reg1,
    out_stream_TKEEP_reg,
    E);
  output ack_in_t_reg_0;
  output [3:0]out_stream_TKEEP;
  input RSTA;
  input ap_clk;
  input out_stream_TREADY;
  input ack_in_t_reg_1;
  input [3:0]D;
  input out_stream_TDATA_reg1;
  input [3:0]out_stream_TKEEP_reg;
  input [0:0]E;

  wire [3:0]D;
  wire [0:0]E;
  wire RSTA;
  wire ack_in_t_i_1__5_n_0;
  wire ack_in_t_reg_0;
  wire ack_in_t_reg_1;
  wire ap_clk;
  wire \data_p1[0]_i_1__1_n_0 ;
  wire \data_p1[1]_i_1__1_n_0 ;
  wire \data_p1[2]_i_1__1_n_0 ;
  wire \data_p1[3]_i_2__0_n_0 ;
  wire [3:0]data_p2;
  wire load_p1;
  wire [1:0]next_st__0;
  wire out_stream_TDATA_reg1;
  wire [3:0]out_stream_TKEEP;
  wire [3:0]out_stream_TKEEP_reg;
  wire out_stream_TREADY;
  wire [1:0]state__0;

  LUT4 #(
    .INIT(16'hAEFF)) 
    \FSM_sequential_state[0]_i_1__4 
       (.I0(out_stream_TREADY),
        .I1(state__0[0]),
        .I2(ack_in_t_reg_1),
        .I3(state__0[1]),
        .O(next_st__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT5 #(
    .INIT(32'hFCCC4C4C)) 
    \FSM_sequential_state[1]_i_1__5 
       (.I0(out_stream_TREADY),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(ack_in_t_reg_0),
        .I4(ack_in_t_reg_1),
        .O(next_st__0[1]));
  (* FSM_ENCODED_STATES = "zero:01,two:10,one:11,iSTATE:00" *) 
  FDSE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(next_st__0[0]),
        .Q(state__0[0]),
        .S(RSTA));
  (* FSM_ENCODED_STATES = "zero:01,two:10,one:11,iSTATE:00" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(next_st__0[1]),
        .Q(state__0[1]),
        .R(RSTA));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT5 #(
    .INIT(32'hB0FFFAF0)) 
    ack_in_t_i_1__5
       (.I0(out_stream_TREADY),
        .I1(ack_in_t_reg_1),
        .I2(ack_in_t_reg_0),
        .I3(state__0[1]),
        .I4(state__0[0]),
        .O(ack_in_t_i_1__5_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ack_in_t_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ack_in_t_i_1__5_n_0),
        .Q(ack_in_t_reg_0),
        .R(RSTA));
  LUT6 #(
    .INIT(64'hFB08FBFBFB080808)) 
    \data_p1[0]_i_1__1 
       (.I0(data_p2[0]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(D[0]),
        .I4(out_stream_TDATA_reg1),
        .I5(out_stream_TKEEP_reg[0]),
        .O(\data_p1[0]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'hFB08FBFBFB080808)) 
    \data_p1[1]_i_1__1 
       (.I0(data_p2[1]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(D[1]),
        .I4(out_stream_TDATA_reg1),
        .I5(out_stream_TKEEP_reg[1]),
        .O(\data_p1[1]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'hFB08FBFBFB080808)) 
    \data_p1[2]_i_1__1 
       (.I0(data_p2[2]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(D[2]),
        .I4(out_stream_TDATA_reg1),
        .I5(out_stream_TKEEP_reg[2]),
        .O(\data_p1[2]_i_1__1_n_0 ));
  LUT4 #(
    .INIT(16'hE240)) 
    \data_p1[3]_i_1__2 
       (.I0(state__0[1]),
        .I1(state__0[0]),
        .I2(ack_in_t_reg_1),
        .I3(out_stream_TREADY),
        .O(load_p1));
  LUT6 #(
    .INIT(64'hFB08FBFBFB080808)) 
    \data_p1[3]_i_2__0 
       (.I0(data_p2[3]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(D[3]),
        .I4(out_stream_TDATA_reg1),
        .I5(out_stream_TKEEP_reg[3]),
        .O(\data_p1[3]_i_2__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[0] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[0]_i_1__1_n_0 ),
        .Q(out_stream_TKEEP[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[1] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[1]_i_1__1_n_0 ),
        .Q(out_stream_TKEEP[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[2] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[2]_i_1__1_n_0 ),
        .Q(out_stream_TKEEP[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[3] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[3]_i_2__0_n_0 ),
        .Q(out_stream_TKEEP[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[0] 
       (.C(ap_clk),
        .CE(E),
        .D(D[0]),
        .Q(data_p2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[1] 
       (.C(ap_clk),
        .CE(E),
        .D(D[1]),
        .Q(data_p2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[2] 
       (.C(ap_clk),
        .CE(E),
        .D(D[2]),
        .Q(data_p2[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[3] 
       (.C(ap_clk),
        .CE(E),
        .D(D[3]),
        .Q(data_p2[3]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "hls_passthrough_regslice_both" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_regslice_both__parameterized1_5
   (ack_in_t_reg_0,
    out_stream_TSTRB,
    RSTA,
    ap_clk,
    out_stream_TREADY,
    ack_in_t_reg_1,
    D,
    out_stream_TDATA_reg1,
    out_stream_TSTRB_reg,
    E);
  output ack_in_t_reg_0;
  output [3:0]out_stream_TSTRB;
  input RSTA;
  input ap_clk;
  input out_stream_TREADY;
  input ack_in_t_reg_1;
  input [3:0]D;
  input out_stream_TDATA_reg1;
  input [3:0]out_stream_TSTRB_reg;
  input [0:0]E;

  wire [3:0]D;
  wire [0:0]E;
  wire RSTA;
  wire ack_in_t_i_1__6_n_0;
  wire ack_in_t_reg_0;
  wire ack_in_t_reg_1;
  wire ap_clk;
  wire \data_p1[0]_i_1__0_n_0 ;
  wire \data_p1[1]_i_1__0_n_0 ;
  wire \data_p1[2]_i_1__0_n_0 ;
  wire \data_p1[3]_i_2_n_0 ;
  wire [3:0]data_p2;
  wire load_p1;
  wire [1:0]next_st__0;
  wire out_stream_TDATA_reg1;
  wire out_stream_TREADY;
  wire [3:0]out_stream_TSTRB;
  wire [3:0]out_stream_TSTRB_reg;
  wire [1:0]state__0;

  LUT4 #(
    .INIT(16'hAEFF)) 
    \FSM_sequential_state[0]_i_1__5 
       (.I0(out_stream_TREADY),
        .I1(state__0[0]),
        .I2(ack_in_t_reg_1),
        .I3(state__0[1]),
        .O(next_st__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT5 #(
    .INIT(32'hFCCC4C4C)) 
    \FSM_sequential_state[1]_i_1__6 
       (.I0(out_stream_TREADY),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(ack_in_t_reg_0),
        .I4(ack_in_t_reg_1),
        .O(next_st__0[1]));
  (* FSM_ENCODED_STATES = "zero:01,two:10,one:11,iSTATE:00" *) 
  FDSE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(next_st__0[0]),
        .Q(state__0[0]),
        .S(RSTA));
  (* FSM_ENCODED_STATES = "zero:01,two:10,one:11,iSTATE:00" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(next_st__0[1]),
        .Q(state__0[1]),
        .R(RSTA));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT5 #(
    .INIT(32'hB0FFFAF0)) 
    ack_in_t_i_1__6
       (.I0(out_stream_TREADY),
        .I1(ack_in_t_reg_1),
        .I2(ack_in_t_reg_0),
        .I3(state__0[1]),
        .I4(state__0[0]),
        .O(ack_in_t_i_1__6_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ack_in_t_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ack_in_t_i_1__6_n_0),
        .Q(ack_in_t_reg_0),
        .R(RSTA));
  LUT6 #(
    .INIT(64'hFB08FBFBFB080808)) 
    \data_p1[0]_i_1__0 
       (.I0(data_p2[0]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(D[0]),
        .I4(out_stream_TDATA_reg1),
        .I5(out_stream_TSTRB_reg[0]),
        .O(\data_p1[0]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFB08FBFBFB080808)) 
    \data_p1[1]_i_1__0 
       (.I0(data_p2[1]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(D[1]),
        .I4(out_stream_TDATA_reg1),
        .I5(out_stream_TSTRB_reg[1]),
        .O(\data_p1[1]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFB08FBFBFB080808)) 
    \data_p1[2]_i_1__0 
       (.I0(data_p2[2]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(D[2]),
        .I4(out_stream_TDATA_reg1),
        .I5(out_stream_TSTRB_reg[2]),
        .O(\data_p1[2]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hE240)) 
    \data_p1[3]_i_1__3 
       (.I0(state__0[1]),
        .I1(state__0[0]),
        .I2(ack_in_t_reg_1),
        .I3(out_stream_TREADY),
        .O(load_p1));
  LUT6 #(
    .INIT(64'hFB08FBFBFB080808)) 
    \data_p1[3]_i_2 
       (.I0(data_p2[3]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(D[3]),
        .I4(out_stream_TDATA_reg1),
        .I5(out_stream_TSTRB_reg[3]),
        .O(\data_p1[3]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[0] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[0]_i_1__0_n_0 ),
        .Q(out_stream_TSTRB[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[1] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[1]_i_1__0_n_0 ),
        .Q(out_stream_TSTRB[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[2] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[2]_i_1__0_n_0 ),
        .Q(out_stream_TSTRB[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[3] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[3]_i_2_n_0 ),
        .Q(out_stream_TSTRB[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[0] 
       (.C(ap_clk),
        .CE(E),
        .D(D[0]),
        .Q(data_p2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[1] 
       (.C(ap_clk),
        .CE(E),
        .D(D[1]),
        .Q(data_p2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[2] 
       (.C(ap_clk),
        .CE(E),
        .D(D[2]),
        .Q(data_p2[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[3] 
       (.C(ap_clk),
        .CE(E),
        .D(D[3]),
        .Q(data_p2[3]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "hls_passthrough_regslice_both" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_regslice_both__parameterized3
   (in_stream_TLAST_int_regslice,
    RSTA,
    ap_clk,
    Q,
    ack_in_t_reg_0,
    in_stream_TVALID,
    in_stream_TLAST);
  output [0:0]in_stream_TLAST_int_regslice;
  input RSTA;
  input ap_clk;
  input [0:0]Q;
  input ack_in_t_reg_0;
  input in_stream_TVALID;
  input [0:0]in_stream_TLAST;

  wire [0:0]Q;
  wire RSTA;
  wire ack_in_t_i_1__3_n_0;
  wire ack_in_t_reg_0;
  wire ack_in_t_reg_n_0;
  wire ap_clk;
  wire \data_p1[0]_i_1__6_n_0 ;
  wire [0:0]data_p2;
  wire \data_p2[0]_i_1__0_n_0 ;
  wire [0:0]in_stream_TLAST;
  wire [0:0]in_stream_TLAST_int_regslice;
  wire in_stream_TVALID;
  wire load_p1;
  wire [1:0]next_st__0;
  wire [1:0]state__0;

  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT5 #(
    .INIT(32'h88F8FFFF)) 
    \FSM_sequential_state[0]_i_1__2 
       (.I0(ack_in_t_reg_0),
        .I1(Q),
        .I2(state__0[0]),
        .I3(in_stream_TVALID),
        .I4(state__0[1]),
        .O(next_st__0[0]));
  LUT6 #(
    .INIT(64'hFFF0F0F070F070F0)) 
    \FSM_sequential_state[1]_i_1__0 
       (.I0(Q),
        .I1(ack_in_t_reg_0),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .I4(ack_in_t_reg_n_0),
        .I5(in_stream_TVALID),
        .O(next_st__0[1]));
  (* FSM_ENCODED_STATES = "zero:01,two:10,one:11,iSTATE:00" *) 
  FDSE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(next_st__0[0]),
        .Q(state__0[0]),
        .S(RSTA));
  (* FSM_ENCODED_STATES = "zero:01,two:10,one:11,iSTATE:00" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(next_st__0[1]),
        .Q(state__0[1]),
        .R(RSTA));
  LUT6 #(
    .INIT(64'h8F00FFFFFF88FF00)) 
    ack_in_t_i_1__3
       (.I0(ack_in_t_reg_0),
        .I1(Q),
        .I2(in_stream_TVALID),
        .I3(ack_in_t_reg_n_0),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(ack_in_t_i_1__3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ack_in_t_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ack_in_t_i_1__3_n_0),
        .Q(ack_in_t_reg_n_0),
        .R(RSTA));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    \data_p1[0]_i_1__6 
       (.I0(data_p2),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(in_stream_TLAST),
        .I4(load_p1),
        .I5(in_stream_TLAST_int_regslice),
        .O(\data_p1[0]_i_1__6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT5 #(
    .INIT(32'hE2404040)) 
    \data_p1[0]_i_2__1 
       (.I0(state__0[1]),
        .I1(state__0[0]),
        .I2(in_stream_TVALID),
        .I3(Q),
        .I4(ack_in_t_reg_0),
        .O(load_p1));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\data_p1[0]_i_1__6_n_0 ),
        .Q(in_stream_TLAST_int_regslice),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hBF80)) 
    \data_p2[0]_i_1__0 
       (.I0(in_stream_TLAST),
        .I1(in_stream_TVALID),
        .I2(ack_in_t_reg_n_0),
        .I3(data_p2),
        .O(\data_p2[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\data_p2[0]_i_1__0_n_0 ),
        .Q(data_p2),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "hls_passthrough_regslice_both" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_regslice_both__parameterized3_1
   (in_stream_TUSER_int_regslice,
    RSTA,
    ap_clk,
    Q,
    ack_in_t_reg_0,
    in_stream_TVALID,
    in_stream_TUSER);
  output [0:0]in_stream_TUSER_int_regslice;
  input RSTA;
  input ap_clk;
  input [0:0]Q;
  input ack_in_t_reg_0;
  input in_stream_TVALID;
  input [0:0]in_stream_TUSER;

  wire [0:0]Q;
  wire RSTA;
  wire ack_in_t_i_1__2_n_0;
  wire ack_in_t_reg_0;
  wire ack_in_t_reg_n_0;
  wire ap_clk;
  wire \data_p1[0]_i_1__5_n_0 ;
  wire [0:0]data_p2;
  wire \data_p2[0]_i_1_n_0 ;
  wire [0:0]in_stream_TUSER;
  wire [0:0]in_stream_TUSER_int_regslice;
  wire in_stream_TVALID;
  wire load_p1;
  wire [1:0]next_st__0;
  wire [1:0]state__0;

  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT5 #(
    .INIT(32'h88F8FFFF)) 
    \FSM_sequential_state[0]_i_1__1 
       (.I0(ack_in_t_reg_0),
        .I1(Q),
        .I2(state__0[0]),
        .I3(in_stream_TVALID),
        .I4(state__0[1]),
        .O(next_st__0[0]));
  LUT6 #(
    .INIT(64'hFFF0F0F070F070F0)) 
    \FSM_sequential_state[1]_i_1__1 
       (.I0(Q),
        .I1(ack_in_t_reg_0),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .I4(ack_in_t_reg_n_0),
        .I5(in_stream_TVALID),
        .O(next_st__0[1]));
  (* FSM_ENCODED_STATES = "zero:01,two:10,one:11,iSTATE:00" *) 
  FDSE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(next_st__0[0]),
        .Q(state__0[0]),
        .S(RSTA));
  (* FSM_ENCODED_STATES = "zero:01,two:10,one:11,iSTATE:00" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(next_st__0[1]),
        .Q(state__0[1]),
        .R(RSTA));
  LUT6 #(
    .INIT(64'h8F00FFFFFF88FF00)) 
    ack_in_t_i_1__2
       (.I0(ack_in_t_reg_0),
        .I1(Q),
        .I2(in_stream_TVALID),
        .I3(ack_in_t_reg_n_0),
        .I4(state__0[1]),
        .I5(state__0[0]),
        .O(ack_in_t_i_1__2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ack_in_t_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ack_in_t_i_1__2_n_0),
        .Q(ack_in_t_reg_n_0),
        .R(RSTA));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    \data_p1[0]_i_1__5 
       (.I0(data_p2),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(in_stream_TUSER),
        .I4(load_p1),
        .I5(in_stream_TUSER_int_regslice),
        .O(\data_p1[0]_i_1__5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT5 #(
    .INIT(32'hE2404040)) 
    \data_p1[0]_i_2__2 
       (.I0(state__0[1]),
        .I1(state__0[0]),
        .I2(in_stream_TVALID),
        .I3(Q),
        .I4(ack_in_t_reg_0),
        .O(load_p1));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\data_p1[0]_i_1__5_n_0 ),
        .Q(in_stream_TUSER_int_regslice),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hBF80)) 
    \data_p2[0]_i_1 
       (.I0(in_stream_TUSER),
        .I1(in_stream_TVALID),
        .I2(ack_in_t_reg_n_0),
        .I3(data_p2),
        .O(\data_p2[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\data_p2[0]_i_1_n_0 ),
        .Q(data_p2),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "hls_passthrough_regslice_both" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_regslice_both__parameterized3_4
   (out_stream_TLAST,
    RSTA,
    ap_clk,
    out_stream_TREADY,
    ack_in_t_reg_0,
    in_stream_TLAST_int_regslice,
    out_stream_TDATA_reg1,
    out_stream_TLAST_reg,
    Q);
  output [0:0]out_stream_TLAST;
  input RSTA;
  input ap_clk;
  input out_stream_TREADY;
  input ack_in_t_reg_0;
  input [0:0]in_stream_TLAST_int_regslice;
  input out_stream_TDATA_reg1;
  input [0:0]out_stream_TLAST_reg;
  input [0:0]Q;

  wire [0:0]Q;
  wire RSTA;
  wire ack_in_t_i_1__8_n_0;
  wire ack_in_t_reg_0;
  wire ack_in_t_reg_n_0;
  wire ap_clk;
  wire \data_p1[0]_i_1__8_n_0 ;
  wire \data_p1[0]_i_2__0_n_0 ;
  wire [0:0]data_p2;
  wire \data_p2[0]_i_1__2_n_0 ;
  wire [0:0]in_stream_TLAST_int_regslice;
  wire [1:0]next_st__0;
  wire out_stream_TDATA_reg1;
  wire [0:0]out_stream_TLAST;
  wire [0:0]out_stream_TLAST_reg;
  wire out_stream_TREADY;
  wire [1:0]state__0;

  LUT4 #(
    .INIT(16'hAEFF)) 
    \FSM_sequential_state[0]_i_1__7 
       (.I0(out_stream_TREADY),
        .I1(state__0[0]),
        .I2(ack_in_t_reg_0),
        .I3(state__0[1]),
        .O(next_st__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT5 #(
    .INIT(32'hFCCC4C4C)) 
    \FSM_sequential_state[1]_i_1__8 
       (.I0(out_stream_TREADY),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(ack_in_t_reg_n_0),
        .I4(ack_in_t_reg_0),
        .O(next_st__0[1]));
  (* FSM_ENCODED_STATES = "zero:01,two:10,one:11,iSTATE:00" *) 
  FDSE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(next_st__0[0]),
        .Q(state__0[0]),
        .S(RSTA));
  (* FSM_ENCODED_STATES = "zero:01,two:10,one:11,iSTATE:00" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(next_st__0[1]),
        .Q(state__0[1]),
        .R(RSTA));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT5 #(
    .INIT(32'hB0FFFAF0)) 
    ack_in_t_i_1__8
       (.I0(out_stream_TREADY),
        .I1(ack_in_t_reg_0),
        .I2(ack_in_t_reg_n_0),
        .I3(state__0[1]),
        .I4(state__0[0]),
        .O(ack_in_t_i_1__8_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ack_in_t_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ack_in_t_i_1__8_n_0),
        .Q(ack_in_t_reg_n_0),
        .R(RSTA));
  LUT6 #(
    .INIT(64'hABFBEFFFA8082000)) 
    \data_p1[0]_i_1__8 
       (.I0(\data_p1[0]_i_2__0_n_0 ),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(ack_in_t_reg_0),
        .I4(out_stream_TREADY),
        .I5(out_stream_TLAST),
        .O(\data_p1[0]_i_1__8_n_0 ));
  LUT6 #(
    .INIT(64'hFB08FBFBFB080808)) 
    \data_p1[0]_i_2__0 
       (.I0(data_p2),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(in_stream_TLAST_int_regslice),
        .I4(out_stream_TDATA_reg1),
        .I5(out_stream_TLAST_reg),
        .O(\data_p1[0]_i_2__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\data_p1[0]_i_1__8_n_0 ),
        .Q(out_stream_TLAST),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \data_p2[0]_i_1__2 
       (.I0(in_stream_TLAST_int_regslice),
        .I1(Q),
        .I2(out_stream_TLAST_reg),
        .I3(ack_in_t_reg_0),
        .I4(ack_in_t_reg_n_0),
        .I5(data_p2),
        .O(\data_p2[0]_i_1__2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\data_p2[0]_i_1__2_n_0 ),
        .Q(data_p2),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "hls_passthrough_regslice_both" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_hls_passthrough_regslice_both__parameterized3_6
   (out_stream_TUSER,
    RSTA,
    ap_clk,
    out_stream_TREADY,
    ack_in_t_reg_0,
    in_stream_TUSER_int_regslice,
    out_stream_TDATA_reg1,
    out_stream_TUSER_reg,
    Q);
  output [0:0]out_stream_TUSER;
  input RSTA;
  input ap_clk;
  input out_stream_TREADY;
  input ack_in_t_reg_0;
  input [0:0]in_stream_TUSER_int_regslice;
  input out_stream_TDATA_reg1;
  input [0:0]out_stream_TUSER_reg;
  input [0:0]Q;

  wire [0:0]Q;
  wire RSTA;
  wire ack_in_t_i_1__7_n_0;
  wire ack_in_t_reg_0;
  wire ack_in_t_reg_n_0;
  wire ap_clk;
  wire \data_p1[0]_i_1__7_n_0 ;
  wire \data_p1[0]_i_2_n_0 ;
  wire [0:0]data_p2;
  wire \data_p2[0]_i_1__1_n_0 ;
  wire [0:0]in_stream_TUSER_int_regslice;
  wire [1:0]next_st__0;
  wire out_stream_TDATA_reg1;
  wire out_stream_TREADY;
  wire [0:0]out_stream_TUSER;
  wire [0:0]out_stream_TUSER_reg;
  wire [1:0]state__0;

  LUT4 #(
    .INIT(16'hAEFF)) 
    \FSM_sequential_state[0]_i_1__6 
       (.I0(out_stream_TREADY),
        .I1(state__0[0]),
        .I2(ack_in_t_reg_0),
        .I3(state__0[1]),
        .O(next_st__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT5 #(
    .INIT(32'hFCCC4C4C)) 
    \FSM_sequential_state[1]_i_1__7 
       (.I0(out_stream_TREADY),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(ack_in_t_reg_n_0),
        .I4(ack_in_t_reg_0),
        .O(next_st__0[1]));
  (* FSM_ENCODED_STATES = "zero:01,two:10,one:11,iSTATE:00" *) 
  FDSE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(next_st__0[0]),
        .Q(state__0[0]),
        .S(RSTA));
  (* FSM_ENCODED_STATES = "zero:01,two:10,one:11,iSTATE:00" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(next_st__0[1]),
        .Q(state__0[1]),
        .R(RSTA));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT5 #(
    .INIT(32'hB0FFFAF0)) 
    ack_in_t_i_1__7
       (.I0(out_stream_TREADY),
        .I1(ack_in_t_reg_0),
        .I2(ack_in_t_reg_n_0),
        .I3(state__0[1]),
        .I4(state__0[0]),
        .O(ack_in_t_i_1__7_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ack_in_t_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ack_in_t_i_1__7_n_0),
        .Q(ack_in_t_reg_n_0),
        .R(RSTA));
  LUT6 #(
    .INIT(64'hABFBEFFFA8082000)) 
    \data_p1[0]_i_1__7 
       (.I0(\data_p1[0]_i_2_n_0 ),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(ack_in_t_reg_0),
        .I4(out_stream_TREADY),
        .I5(out_stream_TUSER),
        .O(\data_p1[0]_i_1__7_n_0 ));
  LUT6 #(
    .INIT(64'hFB08FBFBFB080808)) 
    \data_p1[0]_i_2 
       (.I0(data_p2),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(in_stream_TUSER_int_regslice),
        .I4(out_stream_TDATA_reg1),
        .I5(out_stream_TUSER_reg),
        .O(\data_p1[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_p1_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\data_p1[0]_i_1__7_n_0 ),
        .Q(out_stream_TUSER),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hB8FFFFFFB8000000)) 
    \data_p2[0]_i_1__1 
       (.I0(in_stream_TUSER_int_regslice),
        .I1(Q),
        .I2(out_stream_TUSER_reg),
        .I3(ack_in_t_reg_0),
        .I4(ack_in_t_reg_n_0),
        .I5(data_p2),
        .O(\data_p2[0]_i_1__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_p2_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\data_p2[0]_i_1__1_n_0 ),
        .Q(data_p2),
        .R(1'b0));
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
