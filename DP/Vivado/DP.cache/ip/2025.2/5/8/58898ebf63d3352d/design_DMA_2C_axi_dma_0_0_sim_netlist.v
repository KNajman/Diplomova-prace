// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Tue May  5 23:05:30 2026
// Host        : N166A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_DMA_2C_axi_dma_0_0_sim_netlist.v
// Design      : design_DMA_2C_axi_dma_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xck26-sfvc784-2LV-c
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover
   (m_axis_mm2s_tvalid,
    s_axis_s2mm_tready,
    m_axi_s2mm_wvalid,
    sig_rst2all_stop_request,
    m_axi_mm2s_arsize,
    m_axi_mm2s_arburst,
    m_axi_mm2s_arvalid,
    m_axis_mm2s_tlast,
    sig_s_h_halt_reg,
    m_axi_s2mm_awsize,
    m_axi_s2mm_awburst,
    m_axi_s2mm_awvalid,
    m_axi_s2mm_wlast,
    s_axis_mm2s_cmd_tready,
    m_axis_mm2s_sts_tvalid_int,
    s_axis_s2mm_cmd_tready,
    m_axis_s2mm_sts_tvalid_int,
    mm2s_decerr_i,
    mm2s_interr_i,
    mm2s_slverr_i,
    s2mm_decerr_i,
    s2mm_interr_i,
    s2mm_slverr_i,
    m_axi_mm2s_rready,
    m_axi_s2mm_bready,
    mm2s_halt_cmplt,
    m_axi_mm2s_araddr,
    m_axi_mm2s_arlen,
    m_axis_mm2s_tdata,
    m_axis_mm2s_tkeep,
    s2mm_halt_cmplt,
    m_axi_s2mm_awaddr,
    m_axi_s2mm_awlen,
    m_axi_s2mm_wdata,
    m_axi_s2mm_wstrb,
    s_axi_lite_aclk,
    out,
    m_axi_mm2s_aclk,
    sig_s_h_halt_reg_reg,
    sig_cmd_stat_rst_int_reg_n_reg,
    m_axi_s2mm_aclk,
    sig_s_h_halt_reg_reg_0,
    mm2s_sts_received,
    s2mm_sts_received,
    s_axis_mm2s_cmd_tvalid_split,
    m_axis_mm2s_sts_tready,
    m_axi_mm2s_rlast,
    m_axis_mm2s_tready,
    m_axi_mm2s_rvalid,
    m_axi_mm2s_rresp,
    s_axis_s2mm_cmd_tvalid_split,
    m_axis_s2mm_sts_tready,
    m_axi_s2mm_bvalid,
    m_axi_s2mm_wready,
    s_axis_s2mm_tvalid,
    s_axis_s2mm_tlast,
    m_axi_mm2s_arready,
    m_axi_s2mm_awready,
    s_axis_s2mm_tkeep,
    m_axi_mm2s_rdata,
    s_axis_s2mm_tdata,
    m_axi_s2mm_bresp,
    E,
    D,
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0] ,
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95] );
  output m_axis_mm2s_tvalid;
  output s_axis_s2mm_tready;
  output m_axi_s2mm_wvalid;
  output sig_rst2all_stop_request;
  output [0:0]m_axi_mm2s_arsize;
  output [0:0]m_axi_mm2s_arburst;
  output m_axi_mm2s_arvalid;
  output m_axis_mm2s_tlast;
  output sig_s_h_halt_reg;
  output [0:0]m_axi_s2mm_awsize;
  output [0:0]m_axi_s2mm_awburst;
  output m_axi_s2mm_awvalid;
  output m_axi_s2mm_wlast;
  output s_axis_mm2s_cmd_tready;
  output m_axis_mm2s_sts_tvalid_int;
  output s_axis_s2mm_cmd_tready;
  output m_axis_s2mm_sts_tvalid_int;
  output mm2s_decerr_i;
  output mm2s_interr_i;
  output mm2s_slverr_i;
  output s2mm_decerr_i;
  output s2mm_interr_i;
  output s2mm_slverr_i;
  output m_axi_mm2s_rready;
  output m_axi_s2mm_bready;
  output mm2s_halt_cmplt;
  output [63:0]m_axi_mm2s_araddr;
  output [4:0]m_axi_mm2s_arlen;
  output [31:0]m_axis_mm2s_tdata;
  output [3:0]m_axis_mm2s_tkeep;
  output s2mm_halt_cmplt;
  output [63:0]m_axi_s2mm_awaddr;
  output [4:0]m_axi_s2mm_awlen;
  output [31:0]m_axi_s2mm_wdata;
  output [3:0]m_axi_s2mm_wstrb;
  input s_axi_lite_aclk;
  input out;
  input m_axi_mm2s_aclk;
  input sig_s_h_halt_reg_reg;
  input sig_cmd_stat_rst_int_reg_n_reg;
  input m_axi_s2mm_aclk;
  input sig_s_h_halt_reg_reg_0;
  input mm2s_sts_received;
  input s2mm_sts_received;
  input s_axis_mm2s_cmd_tvalid_split;
  input m_axis_mm2s_sts_tready;
  input m_axi_mm2s_rlast;
  input m_axis_mm2s_tready;
  input m_axi_mm2s_rvalid;
  input [1:0]m_axi_mm2s_rresp;
  input s_axis_s2mm_cmd_tvalid_split;
  input m_axis_s2mm_sts_tready;
  input m_axi_s2mm_bvalid;
  input m_axi_s2mm_wready;
  input s_axis_s2mm_tvalid;
  input s_axis_s2mm_tlast;
  input m_axi_mm2s_arready;
  input m_axi_s2mm_awready;
  input [3:0]s_axis_s2mm_tkeep;
  input [31:0]m_axi_mm2s_rdata;
  input [31:0]s_axis_s2mm_tdata;
  input [1:0]m_axi_s2mm_bresp;
  input [0:0]E;
  input [72:0]D;
  input [0:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0] ;
  input [72:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95] ;

  wire [72:0]D;
  wire [0:0]E;
  wire [0:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0] ;
  wire [72:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95] ;
  wire m_axi_mm2s_aclk;
  wire [63:0]m_axi_mm2s_araddr;
  wire [0:0]m_axi_mm2s_arburst;
  wire [4:0]m_axi_mm2s_arlen;
  wire m_axi_mm2s_arready;
  wire [0:0]m_axi_mm2s_arsize;
  wire m_axi_mm2s_arvalid;
  wire [31:0]m_axi_mm2s_rdata;
  wire m_axi_mm2s_rlast;
  wire m_axi_mm2s_rready;
  wire [1:0]m_axi_mm2s_rresp;
  wire m_axi_mm2s_rvalid;
  wire m_axi_s2mm_aclk;
  wire [63:0]m_axi_s2mm_awaddr;
  wire [0:0]m_axi_s2mm_awburst;
  wire [4:0]m_axi_s2mm_awlen;
  wire m_axi_s2mm_awready;
  wire [0:0]m_axi_s2mm_awsize;
  wire m_axi_s2mm_awvalid;
  wire m_axi_s2mm_bready;
  wire [1:0]m_axi_s2mm_bresp;
  wire m_axi_s2mm_bvalid;
  wire [31:0]m_axi_s2mm_wdata;
  wire m_axi_s2mm_wlast;
  wire m_axi_s2mm_wready;
  wire [3:0]m_axi_s2mm_wstrb;
  wire m_axi_s2mm_wvalid;
  wire m_axis_mm2s_sts_tready;
  wire m_axis_mm2s_sts_tvalid_int;
  wire [31:0]m_axis_mm2s_tdata;
  wire [3:0]m_axis_mm2s_tkeep;
  wire m_axis_mm2s_tlast;
  wire m_axis_mm2s_tready;
  wire m_axis_mm2s_tvalid;
  wire m_axis_s2mm_sts_tready;
  wire m_axis_s2mm_sts_tvalid_int;
  wire mm2s_decerr_i;
  wire mm2s_halt_cmplt;
  wire mm2s_interr_i;
  wire mm2s_slverr_i;
  wire mm2s_sts_received;
  wire out;
  wire s2mm_decerr_i;
  wire s2mm_halt_cmplt;
  wire s2mm_interr_i;
  wire s2mm_slverr_i;
  wire s2mm_sts_received;
  (* DONT_TOUCH *) wire s_axi_lite_aclk;
  wire s_axis_mm2s_cmd_tready;
  wire s_axis_mm2s_cmd_tvalid_split;
  wire s_axis_s2mm_cmd_tready;
  wire s_axis_s2mm_cmd_tvalid_split;
  wire [31:0]s_axis_s2mm_tdata;
  wire [3:0]s_axis_s2mm_tkeep;
  wire s_axis_s2mm_tlast;
  wire s_axis_s2mm_tready;
  wire s_axis_s2mm_tvalid;
  wire sig_cmd_stat_rst_int_reg_n_reg;
  wire sig_rst2all_stop_request;
  wire sig_s_h_halt_reg;
  wire sig_s_h_halt_reg_reg;
  wire sig_s_h_halt_reg_reg_0;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_mm2s_basic_wrap \GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER 
       (.D(D),
        .E(E),
        .\USE_SINGLE_REG.sig_regfifo_full_reg_reg (m_axis_mm2s_sts_tvalid_int),
        .m_axi_mm2s_aclk(m_axi_mm2s_aclk),
        .m_axi_mm2s_araddr(m_axi_mm2s_araddr),
        .m_axi_mm2s_arburst(m_axi_mm2s_arburst),
        .m_axi_mm2s_arlen(m_axi_mm2s_arlen),
        .m_axi_mm2s_arready(m_axi_mm2s_arready),
        .m_axi_mm2s_arsize(m_axi_mm2s_arsize),
        .m_axi_mm2s_arvalid(m_axi_mm2s_arvalid),
        .m_axi_mm2s_rdata(m_axi_mm2s_rdata),
        .m_axi_mm2s_rlast(m_axi_mm2s_rlast),
        .m_axi_mm2s_rready(m_axi_mm2s_rready),
        .m_axi_mm2s_rresp(m_axi_mm2s_rresp),
        .m_axi_mm2s_rvalid(m_axi_mm2s_rvalid),
        .m_axis_mm2s_sts_tready(m_axis_mm2s_sts_tready),
        .m_axis_mm2s_tdata(m_axis_mm2s_tdata),
        .m_axis_mm2s_tkeep(m_axis_mm2s_tkeep),
        .m_axis_mm2s_tlast(m_axis_mm2s_tlast),
        .m_axis_mm2s_tready(m_axis_mm2s_tready),
        .m_axis_mm2s_tvalid(m_axis_mm2s_tvalid),
        .mm2s_decerr_i(mm2s_decerr_i),
        .mm2s_halt_cmplt(mm2s_halt_cmplt),
        .mm2s_interr_i(mm2s_interr_i),
        .mm2s_slverr_i(mm2s_slverr_i),
        .mm2s_sts_received(mm2s_sts_received),
        .out(out),
        .s_axis_mm2s_cmd_tready(s_axis_mm2s_cmd_tready),
        .s_axis_mm2s_cmd_tvalid_split(s_axis_mm2s_cmd_tvalid_split),
        .sig_rst2all_stop_request(sig_rst2all_stop_request),
        .sig_s_h_halt_reg_reg(sig_s_h_halt_reg_reg));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_s2mm_basic_wrap \GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER 
       (.\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0] (\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0] ),
        .\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95] (\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95] ),
        .\USE_SINGLE_REG.sig_regfifo_full_reg_reg (m_axis_s2mm_sts_tvalid_int),
        .m_axi_s2mm_aclk(m_axi_s2mm_aclk),
        .m_axi_s2mm_awaddr(m_axi_s2mm_awaddr),
        .m_axi_s2mm_awburst(m_axi_s2mm_awburst),
        .m_axi_s2mm_awlen(m_axi_s2mm_awlen),
        .m_axi_s2mm_awready(m_axi_s2mm_awready),
        .m_axi_s2mm_awsize(m_axi_s2mm_awsize),
        .m_axi_s2mm_awvalid(m_axi_s2mm_awvalid),
        .m_axi_s2mm_bready(m_axi_s2mm_bready),
        .m_axi_s2mm_bresp(m_axi_s2mm_bresp),
        .m_axi_s2mm_bvalid(m_axi_s2mm_bvalid),
        .m_axi_s2mm_wdata(m_axi_s2mm_wdata),
        .m_axi_s2mm_wlast(m_axi_s2mm_wlast),
        .m_axi_s2mm_wready(m_axi_s2mm_wready),
        .m_axi_s2mm_wstrb(m_axi_s2mm_wstrb),
        .m_axi_s2mm_wvalid(m_axi_s2mm_wvalid),
        .m_axis_s2mm_sts_tready(m_axis_s2mm_sts_tready),
        .s2mm_decerr_i(s2mm_decerr_i),
        .s2mm_halt_cmplt(s2mm_halt_cmplt),
        .s2mm_interr_i(s2mm_interr_i),
        .s2mm_slverr_i(s2mm_slverr_i),
        .s2mm_sts_received(s2mm_sts_received),
        .s_axis_s2mm_cmd_tready(s_axis_s2mm_cmd_tready),
        .s_axis_s2mm_cmd_tvalid_split(s_axis_s2mm_cmd_tvalid_split),
        .s_axis_s2mm_tdata(s_axis_s2mm_tdata),
        .s_axis_s2mm_tkeep(s_axis_s2mm_tkeep),
        .s_axis_s2mm_tlast(s_axis_s2mm_tlast),
        .s_axis_s2mm_tready(s_axis_s2mm_tready),
        .s_axis_s2mm_tvalid(s_axis_s2mm_tvalid),
        .sig_cmd_stat_rst_int_reg_n_reg(sig_cmd_stat_rst_int_reg_n_reg),
        .sig_s_h_halt_reg(sig_s_h_halt_reg),
        .sig_s_h_halt_reg_reg(sig_s_h_halt_reg_reg_0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_addr_cntl
   (out,
    sig_addr_reg_empty,
    sig_addr2rsc_calc_error,
    m_axi_mm2s_arsize,
    m_axi_mm2s_arburst,
    m_axi_mm2s_arvalid,
    \USE_SRL_FIFO.sig_wr_fifo ,
    sig_mmap_rst_reg_n_reg,
    m_axi_mm2s_araddr,
    m_axi_mm2s_arlen,
    sig_mmap_rst,
    m_axi_mm2s_aclk,
    sig_data2addr_stop_req,
    sig_mstr2addr_cmd_valid,
    sig_mmap_rst_reg_n,
    sig_init_done,
    m_axi_mm2s_arready,
    in);
  output out;
  output sig_addr_reg_empty;
  output sig_addr2rsc_calc_error;
  output [0:0]m_axi_mm2s_arsize;
  output [0:0]m_axi_mm2s_arburst;
  output m_axi_mm2s_arvalid;
  output \USE_SRL_FIFO.sig_wr_fifo ;
  output sig_mmap_rst_reg_n_reg;
  output [63:0]m_axi_mm2s_araddr;
  output [4:0]m_axi_mm2s_arlen;
  input sig_mmap_rst;
  input m_axi_mm2s_aclk;
  input sig_data2addr_stop_req;
  input sig_mstr2addr_cmd_valid;
  input sig_mmap_rst_reg_n;
  input sig_init_done;
  input m_axi_mm2s_arready;
  input [70:0]in;

  wire \GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO_n_2 ;
  wire \GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO_n_4 ;
  wire \USE_SRL_FIFO.sig_wr_fifo ;
  wire [70:0]in;
  wire m_axi_mm2s_aclk;
  wire [63:0]m_axi_mm2s_araddr;
  wire [0:0]m_axi_mm2s_arburst;
  wire [4:0]m_axi_mm2s_arlen;
  wire m_axi_mm2s_arready;
  wire [0:0]m_axi_mm2s_arsize;
  wire m_axi_mm2s_arvalid;
  wire sig_addr2rsc_calc_error;
  wire sig_addr_reg_empty;
  wire sig_addr_reg_full;
  wire [82:4]sig_aq_fifo_data_out;
  wire sig_data2addr_stop_req;
  wire sig_init_done;
  wire sig_mmap_rst;
  wire sig_mmap_rst_reg_n;
  wire sig_mmap_rst_reg_n_reg;
  wire sig_mstr2addr_cmd_valid;
  wire sig_next_addr_reg0;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire sig_posted_to_axi;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire sig_posted_to_axi_2;
  wire sig_push_addr_reg1_out;

  assign out = sig_posted_to_axi;
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized1_8 \GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO 
       (.FIFO_Full_reg(sig_addr_reg_empty),
        .\addr_i_reg[2] (\GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO_n_2 ),
        .in(in),
        .m_axi_mm2s_aclk(m_axi_mm2s_aclk),
        .out({sig_aq_fifo_data_out[82],sig_aq_fifo_data_out[79],sig_aq_fifo_data_out[77],sig_aq_fifo_data_out[72:4]}),
        .sel(\USE_SRL_FIFO.sig_wr_fifo ),
        .sig_data2addr_stop_req(sig_data2addr_stop_req),
        .sig_init_done(sig_init_done),
        .sig_mmap_rst(sig_mmap_rst),
        .sig_mmap_rst_reg_n(sig_mmap_rst_reg_n),
        .sig_mmap_rst_reg_n_reg(sig_mmap_rst_reg_n_reg),
        .sig_mstr2addr_cmd_valid(sig_mstr2addr_cmd_valid),
        .sig_push_addr_reg1_out(sig_push_addr_reg1_out),
        .sm_set_error_reg(\GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO_n_4 ));
  FDSE #(
    .INIT(1'b0)) 
    sig_addr_reg_empty_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(1'b0),
        .Q(sig_addr_reg_empty),
        .S(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    sig_addr_reg_full_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(1'b1),
        .Q(sig_addr_reg_full),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    sig_addr_valid_reg_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(\GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO_n_4 ),
        .Q(m_axi_mm2s_arvalid),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    sig_calc_error_reg_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[82]),
        .Q(sig_addr2rsc_calc_error),
        .R(sig_next_addr_reg0));
  LUT4 #(
    .INIT(16'h08FF)) 
    \sig_next_addr_reg[63]_i_1 
       (.I0(m_axi_mm2s_arready),
        .I1(sig_addr_reg_full),
        .I2(sig_addr2rsc_calc_error),
        .I3(sig_mmap_rst_reg_n),
        .O(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[0] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[4]),
        .Q(m_axi_mm2s_araddr[0]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[10] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[14]),
        .Q(m_axi_mm2s_araddr[10]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[11] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[15]),
        .Q(m_axi_mm2s_araddr[11]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[12] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[16]),
        .Q(m_axi_mm2s_araddr[12]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[13] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[17]),
        .Q(m_axi_mm2s_araddr[13]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[14] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[18]),
        .Q(m_axi_mm2s_araddr[14]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[15] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[19]),
        .Q(m_axi_mm2s_araddr[15]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[16] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[20]),
        .Q(m_axi_mm2s_araddr[16]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[17] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[21]),
        .Q(m_axi_mm2s_araddr[17]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[18] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[22]),
        .Q(m_axi_mm2s_araddr[18]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[19] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[23]),
        .Q(m_axi_mm2s_araddr[19]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[1] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[5]),
        .Q(m_axi_mm2s_araddr[1]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[20] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[24]),
        .Q(m_axi_mm2s_araddr[20]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[21] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[25]),
        .Q(m_axi_mm2s_araddr[21]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[22] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[26]),
        .Q(m_axi_mm2s_araddr[22]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[23] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[27]),
        .Q(m_axi_mm2s_araddr[23]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[24] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[28]),
        .Q(m_axi_mm2s_araddr[24]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[25] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[29]),
        .Q(m_axi_mm2s_araddr[25]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[26] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[30]),
        .Q(m_axi_mm2s_araddr[26]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[27] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[31]),
        .Q(m_axi_mm2s_araddr[27]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[28] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[32]),
        .Q(m_axi_mm2s_araddr[28]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[29] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[33]),
        .Q(m_axi_mm2s_araddr[29]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[2] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[6]),
        .Q(m_axi_mm2s_araddr[2]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[30] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[34]),
        .Q(m_axi_mm2s_araddr[30]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[31] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[35]),
        .Q(m_axi_mm2s_araddr[31]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[32] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[36]),
        .Q(m_axi_mm2s_araddr[32]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[33] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[37]),
        .Q(m_axi_mm2s_araddr[33]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[34] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[38]),
        .Q(m_axi_mm2s_araddr[34]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[35] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[39]),
        .Q(m_axi_mm2s_araddr[35]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[36] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[40]),
        .Q(m_axi_mm2s_araddr[36]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[37] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[41]),
        .Q(m_axi_mm2s_araddr[37]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[38] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[42]),
        .Q(m_axi_mm2s_araddr[38]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[39] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[43]),
        .Q(m_axi_mm2s_araddr[39]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[3] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[7]),
        .Q(m_axi_mm2s_araddr[3]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[40] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[44]),
        .Q(m_axi_mm2s_araddr[40]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[41] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[45]),
        .Q(m_axi_mm2s_araddr[41]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[42] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[46]),
        .Q(m_axi_mm2s_araddr[42]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[43] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[47]),
        .Q(m_axi_mm2s_araddr[43]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[44] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[48]),
        .Q(m_axi_mm2s_araddr[44]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[45] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[49]),
        .Q(m_axi_mm2s_araddr[45]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[46] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[50]),
        .Q(m_axi_mm2s_araddr[46]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[47] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[51]),
        .Q(m_axi_mm2s_araddr[47]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[48] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[52]),
        .Q(m_axi_mm2s_araddr[48]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[49] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[53]),
        .Q(m_axi_mm2s_araddr[49]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[4] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[8]),
        .Q(m_axi_mm2s_araddr[4]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[50] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[54]),
        .Q(m_axi_mm2s_araddr[50]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[51] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[55]),
        .Q(m_axi_mm2s_araddr[51]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[52] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[56]),
        .Q(m_axi_mm2s_araddr[52]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[53] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[57]),
        .Q(m_axi_mm2s_araddr[53]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[54] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[58]),
        .Q(m_axi_mm2s_araddr[54]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[55] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[59]),
        .Q(m_axi_mm2s_araddr[55]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[56] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[60]),
        .Q(m_axi_mm2s_araddr[56]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[57] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[61]),
        .Q(m_axi_mm2s_araddr[57]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[58] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[62]),
        .Q(m_axi_mm2s_araddr[58]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[59] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[63]),
        .Q(m_axi_mm2s_araddr[59]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[5] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[9]),
        .Q(m_axi_mm2s_araddr[5]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[60] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[64]),
        .Q(m_axi_mm2s_araddr[60]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[61] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[65]),
        .Q(m_axi_mm2s_araddr[61]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[62] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[66]),
        .Q(m_axi_mm2s_araddr[62]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[63] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[67]),
        .Q(m_axi_mm2s_araddr[63]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[6] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[10]),
        .Q(m_axi_mm2s_araddr[6]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[7] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[11]),
        .Q(m_axi_mm2s_araddr[7]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[8] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[12]),
        .Q(m_axi_mm2s_araddr[8]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[9] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[13]),
        .Q(m_axi_mm2s_araddr[9]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_burst_reg_reg[0] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[79]),
        .Q(m_axi_mm2s_arburst),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_len_reg_reg[0] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[68]),
        .Q(m_axi_mm2s_arlen[0]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_len_reg_reg[1] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[69]),
        .Q(m_axi_mm2s_arlen[1]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_len_reg_reg[2] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[70]),
        .Q(m_axi_mm2s_arlen[2]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_len_reg_reg[3] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[71]),
        .Q(m_axi_mm2s_arlen[3]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_len_reg_reg[4] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[72]),
        .Q(m_axi_mm2s_arlen[4]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_size_reg_reg[1] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[77]),
        .Q(m_axi_mm2s_arsize),
        .R(sig_next_addr_reg0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_posted_to_axi_2_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(\GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO_n_2 ),
        .Q(sig_posted_to_axi_2),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_posted_to_axi_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(\GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO_n_2 ),
        .Q(sig_posted_to_axi),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_datamover_addr_cntl" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_addr_cntl__parameterized0
   (out,
    sig_addr_reg_empty,
    sig_addr2wsc_calc_error,
    m_axi_s2mm_awsize,
    m_axi_s2mm_awburst,
    m_axi_s2mm_awvalid,
    sig_init_done,
    \USE_SRL_FIFO.sig_wr_fifo ,
    m_axi_s2mm_awaddr,
    m_axi_s2mm_awlen,
    SR,
    m_axi_s2mm_aclk,
    sig_init_done_reg,
    sig_mstr2addr_cmd_valid,
    sig_halt_reg,
    sig_data2all_tlast_error,
    sig_posted_to_axi_reg_0,
    m_axi_s2mm_awready,
    in);
  output out;
  output sig_addr_reg_empty;
  output sig_addr2wsc_calc_error;
  output [0:0]m_axi_s2mm_awsize;
  output [0:0]m_axi_s2mm_awburst;
  output m_axi_s2mm_awvalid;
  output sig_init_done;
  output \USE_SRL_FIFO.sig_wr_fifo ;
  output [63:0]m_axi_s2mm_awaddr;
  output [4:0]m_axi_s2mm_awlen;
  input [0:0]SR;
  input m_axi_s2mm_aclk;
  input sig_init_done_reg;
  input sig_mstr2addr_cmd_valid;
  input sig_halt_reg;
  input sig_data2all_tlast_error;
  input sig_posted_to_axi_reg_0;
  input m_axi_s2mm_awready;
  input [70:0]in;

  wire \GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO_n_3 ;
  wire \GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO_n_4 ;
  wire [0:0]SR;
  wire \USE_SRL_FIFO.sig_wr_fifo ;
  wire [70:0]in;
  wire m_axi_s2mm_aclk;
  wire [63:0]m_axi_s2mm_awaddr;
  wire [0:0]m_axi_s2mm_awburst;
  wire [4:0]m_axi_s2mm_awlen;
  wire m_axi_s2mm_awready;
  wire [0:0]m_axi_s2mm_awsize;
  wire m_axi_s2mm_awvalid;
  wire sig_addr2wsc_calc_error;
  wire sig_addr_reg_empty;
  wire sig_addr_reg_full;
  wire [82:4]sig_aq_fifo_data_out;
  wire sig_data2all_tlast_error;
  wire sig_halt_reg;
  wire sig_init_done;
  wire sig_init_done_reg;
  wire sig_mstr2addr_cmd_valid;
  wire sig_next_addr_reg0;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire sig_posted_to_axi;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire sig_posted_to_axi_2;
  wire sig_posted_to_axi_reg_0;
  wire sig_push_addr_reg1_out;

  assign out = sig_posted_to_axi;
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized1 \GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO 
       (.SR(SR),
        .in(in),
        .m_axi_s2mm_aclk(m_axi_s2mm_aclk),
        .out({sig_aq_fifo_data_out[82],sig_aq_fifo_data_out[79],sig_aq_fifo_data_out[77],sig_aq_fifo_data_out[72:4]}),
        .sel(\USE_SRL_FIFO.sig_wr_fifo ),
        .sig_addr_reg_empty(sig_addr_reg_empty),
        .sig_data2all_tlast_error(sig_data2all_tlast_error),
        .sig_halt_reg(sig_halt_reg),
        .sig_halt_reg_reg(\GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO_n_3 ),
        .sig_init_done(sig_init_done),
        .sig_init_done_reg_0(sig_init_done_reg),
        .sig_mstr2addr_cmd_valid(sig_mstr2addr_cmd_valid),
        .sig_posted_to_axi_reg(sig_posted_to_axi_reg_0),
        .sig_push_addr_reg1_out(sig_push_addr_reg1_out),
        .sm_set_error_reg(\GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO_n_4 ));
  FDSE #(
    .INIT(1'b0)) 
    sig_addr_reg_empty_reg
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(1'b0),
        .Q(sig_addr_reg_empty),
        .S(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    sig_addr_reg_full_reg
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(1'b1),
        .Q(sig_addr_reg_full),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    sig_addr_valid_reg_reg
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(\GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO_n_4 ),
        .Q(m_axi_s2mm_awvalid),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    sig_calc_error_reg_reg
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[82]),
        .Q(sig_addr2wsc_calc_error),
        .R(sig_next_addr_reg0));
  LUT4 #(
    .INIT(16'h08FF)) 
    \sig_next_addr_reg[63]_i_1__0 
       (.I0(m_axi_s2mm_awready),
        .I1(sig_addr_reg_full),
        .I2(sig_addr2wsc_calc_error),
        .I3(sig_posted_to_axi_reg_0),
        .O(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[4]),
        .Q(m_axi_s2mm_awaddr[0]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[10] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[14]),
        .Q(m_axi_s2mm_awaddr[10]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[11] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[15]),
        .Q(m_axi_s2mm_awaddr[11]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[12] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[16]),
        .Q(m_axi_s2mm_awaddr[12]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[13] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[17]),
        .Q(m_axi_s2mm_awaddr[13]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[14] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[18]),
        .Q(m_axi_s2mm_awaddr[14]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[15] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[19]),
        .Q(m_axi_s2mm_awaddr[15]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[16] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[20]),
        .Q(m_axi_s2mm_awaddr[16]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[17] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[21]),
        .Q(m_axi_s2mm_awaddr[17]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[18] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[22]),
        .Q(m_axi_s2mm_awaddr[18]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[19] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[23]),
        .Q(m_axi_s2mm_awaddr[19]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[5]),
        .Q(m_axi_s2mm_awaddr[1]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[20] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[24]),
        .Q(m_axi_s2mm_awaddr[20]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[21] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[25]),
        .Q(m_axi_s2mm_awaddr[21]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[22] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[26]),
        .Q(m_axi_s2mm_awaddr[22]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[23] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[27]),
        .Q(m_axi_s2mm_awaddr[23]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[24] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[28]),
        .Q(m_axi_s2mm_awaddr[24]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[25] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[29]),
        .Q(m_axi_s2mm_awaddr[25]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[26] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[30]),
        .Q(m_axi_s2mm_awaddr[26]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[27] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[31]),
        .Q(m_axi_s2mm_awaddr[27]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[28] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[32]),
        .Q(m_axi_s2mm_awaddr[28]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[29] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[33]),
        .Q(m_axi_s2mm_awaddr[29]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[6]),
        .Q(m_axi_s2mm_awaddr[2]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[30] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[34]),
        .Q(m_axi_s2mm_awaddr[30]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[31] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[35]),
        .Q(m_axi_s2mm_awaddr[31]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[32] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[36]),
        .Q(m_axi_s2mm_awaddr[32]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[33] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[37]),
        .Q(m_axi_s2mm_awaddr[33]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[34] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[38]),
        .Q(m_axi_s2mm_awaddr[34]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[35] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[39]),
        .Q(m_axi_s2mm_awaddr[35]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[36] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[40]),
        .Q(m_axi_s2mm_awaddr[36]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[37] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[41]),
        .Q(m_axi_s2mm_awaddr[37]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[38] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[42]),
        .Q(m_axi_s2mm_awaddr[38]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[39] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[43]),
        .Q(m_axi_s2mm_awaddr[39]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[3] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[7]),
        .Q(m_axi_s2mm_awaddr[3]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[40] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[44]),
        .Q(m_axi_s2mm_awaddr[40]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[41] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[45]),
        .Q(m_axi_s2mm_awaddr[41]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[42] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[46]),
        .Q(m_axi_s2mm_awaddr[42]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[43] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[47]),
        .Q(m_axi_s2mm_awaddr[43]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[44] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[48]),
        .Q(m_axi_s2mm_awaddr[44]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[45] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[49]),
        .Q(m_axi_s2mm_awaddr[45]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[46] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[50]),
        .Q(m_axi_s2mm_awaddr[46]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[47] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[51]),
        .Q(m_axi_s2mm_awaddr[47]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[48] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[52]),
        .Q(m_axi_s2mm_awaddr[48]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[49] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[53]),
        .Q(m_axi_s2mm_awaddr[49]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[4] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[8]),
        .Q(m_axi_s2mm_awaddr[4]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[50] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[54]),
        .Q(m_axi_s2mm_awaddr[50]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[51] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[55]),
        .Q(m_axi_s2mm_awaddr[51]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[52] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[56]),
        .Q(m_axi_s2mm_awaddr[52]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[53] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[57]),
        .Q(m_axi_s2mm_awaddr[53]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[54] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[58]),
        .Q(m_axi_s2mm_awaddr[54]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[55] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[59]),
        .Q(m_axi_s2mm_awaddr[55]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[56] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[60]),
        .Q(m_axi_s2mm_awaddr[56]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[57] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[61]),
        .Q(m_axi_s2mm_awaddr[57]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[58] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[62]),
        .Q(m_axi_s2mm_awaddr[58]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[59] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[63]),
        .Q(m_axi_s2mm_awaddr[59]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[5] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[9]),
        .Q(m_axi_s2mm_awaddr[5]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[60] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[64]),
        .Q(m_axi_s2mm_awaddr[60]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[61] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[65]),
        .Q(m_axi_s2mm_awaddr[61]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[62] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[66]),
        .Q(m_axi_s2mm_awaddr[62]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[63] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[67]),
        .Q(m_axi_s2mm_awaddr[63]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[6] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[10]),
        .Q(m_axi_s2mm_awaddr[6]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[7] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[11]),
        .Q(m_axi_s2mm_awaddr[7]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[8] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[12]),
        .Q(m_axi_s2mm_awaddr[8]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_addr_reg_reg[9] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[13]),
        .Q(m_axi_s2mm_awaddr[9]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_burst_reg_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[79]),
        .Q(m_axi_s2mm_awburst),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_len_reg_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[68]),
        .Q(m_axi_s2mm_awlen[0]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_len_reg_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[69]),
        .Q(m_axi_s2mm_awlen[1]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_len_reg_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[70]),
        .Q(m_axi_s2mm_awlen[2]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_len_reg_reg[3] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[71]),
        .Q(m_axi_s2mm_awlen[3]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_len_reg_reg[4] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[72]),
        .Q(m_axi_s2mm_awlen[4]),
        .R(sig_next_addr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_size_reg_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_addr_reg1_out),
        .D(sig_aq_fifo_data_out[77]),
        .Q(m_axi_s2mm_awsize),
        .R(sig_next_addr_reg0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_posted_to_axi_2_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(\GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO_n_3 ),
        .Q(sig_posted_to_axi_2),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_posted_to_axi_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(\GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO_n_3 ),
        .Q(sig_posted_to_axi),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_cmd_status
   (sig_cmd2mstr_cmd_valid,
    s_axis_s2mm_cmd_tready,
    \USE_SINGLE_REG.sig_regfifo_full_reg_reg ,
    sig_stat2wsc_status_ready,
    s2mm_decerr_i,
    s2mm_interr_i,
    s2mm_slverr_i,
    sig_coelsc_tag_reg0,
    Q,
    SR,
    m_axi_s2mm_aclk,
    s2mm_sts_received,
    sig_init_done_reg,
    s_axis_s2mm_cmd_tvalid_split,
    sig_cmd_reg_empty,
    sm_scc_sm_ready,
    sig_wsc2stat_status_valid,
    m_axis_s2mm_sts_tready,
    \GEN_OMIT_INDET_BTT.sig_coelsc_interr_reg_reg ,
    E,
    D,
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0] ,
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95] );
  output sig_cmd2mstr_cmd_valid;
  output s_axis_s2mm_cmd_tready;
  output \USE_SINGLE_REG.sig_regfifo_full_reg_reg ;
  output sig_stat2wsc_status_ready;
  output s2mm_decerr_i;
  output s2mm_interr_i;
  output s2mm_slverr_i;
  output sig_coelsc_tag_reg0;
  output [72:0]Q;
  input [0:0]SR;
  input m_axi_s2mm_aclk;
  input s2mm_sts_received;
  input sig_init_done_reg;
  input s_axis_s2mm_cmd_tvalid_split;
  input sig_cmd_reg_empty;
  input sm_scc_sm_ready;
  input sig_wsc2stat_status_valid;
  input m_axis_s2mm_sts_tready;
  input \GEN_OMIT_INDET_BTT.sig_coelsc_interr_reg_reg ;
  input [0:0]E;
  input [2:0]D;
  input [0:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0] ;
  input [72:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95] ;

  wire [2:0]D;
  wire [0:0]E;
  wire \GEN_OMIT_INDET_BTT.sig_coelsc_interr_reg_reg ;
  wire I_CMD_FIFO_n_2;
  wire [72:0]Q;
  wire [0:0]SR;
  wire [0:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0] ;
  wire [72:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95] ;
  wire \USE_SINGLE_REG.sig_regfifo_full_reg_reg ;
  wire m_axi_s2mm_aclk;
  wire m_axis_s2mm_sts_tready;
  wire s2mm_decerr_i;
  wire s2mm_interr_i;
  wire s2mm_slverr_i;
  wire s2mm_sts_received;
  wire s_axis_s2mm_cmd_tready;
  wire s_axis_s2mm_cmd_tvalid_split;
  wire sig_cmd2mstr_cmd_valid;
  wire sig_cmd_reg_empty;
  wire sig_coelsc_tag_reg0;
  wire sig_init_done;
  wire sig_init_done_reg;
  wire sig_stat2wsc_status_ready;
  wire sig_wsc2stat_status_valid;
  wire sm_scc_sm_ready;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized0 \GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO 
       (.D(D),
        .E(E),
        .\GEN_OMIT_INDET_BTT.sig_coelsc_interr_reg_reg (\GEN_OMIT_INDET_BTT.sig_coelsc_interr_reg_reg ),
        .SR(SR),
        .\USE_SINGLE_REG.sig_regfifo_empty_reg_reg_0 (sig_stat2wsc_status_ready),
        .\USE_SINGLE_REG.sig_regfifo_full_reg_reg_0 (\USE_SINGLE_REG.sig_regfifo_full_reg_reg ),
        .\USE_SINGLE_REG.sig_regfifo_full_reg_reg_1 (sig_init_done_reg),
        .m_axi_s2mm_aclk(m_axi_s2mm_aclk),
        .m_axis_s2mm_sts_tready(m_axis_s2mm_sts_tready),
        .s2mm_decerr_i(s2mm_decerr_i),
        .s2mm_interr_i(s2mm_interr_i),
        .s2mm_slverr_i(s2mm_slverr_i),
        .s2mm_sts_received(s2mm_sts_received),
        .sig_coelsc_tag_reg0(sig_coelsc_tag_reg0),
        .sig_init_done(sig_init_done),
        .sig_init_done_reg_0(I_CMD_FIFO_n_2),
        .sig_wsc2stat_status_valid(sig_wsc2stat_status_valid));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo I_CMD_FIFO
       (.Q(Q),
        .SR(SR),
        .\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 (\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0] ),
        .\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 (\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95] ),
        .m_axi_s2mm_aclk(m_axi_s2mm_aclk),
        .s_axis_s2mm_cmd_tready(s_axis_s2mm_cmd_tready),
        .s_axis_s2mm_cmd_tvalid_split(s_axis_s2mm_cmd_tvalid_split),
        .sig_cmd2mstr_cmd_valid(sig_cmd2mstr_cmd_valid),
        .sig_cmd_reg_empty(sig_cmd_reg_empty),
        .sig_cmd_stat_rst_int_reg_n_reg(I_CMD_FIFO_n_2),
        .sig_init_done(sig_init_done),
        .sig_init_done_reg_0(sig_init_done_reg),
        .sm_scc_sm_ready(sm_scc_sm_ready));
endmodule

(* ORIG_REF_NAME = "axi_datamover_cmd_status" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_cmd_status_3
   (sig_cmd2mstr_cmd_valid,
    s_axis_mm2s_cmd_tready,
    \USE_SINGLE_REG.sig_regfifo_full_reg_reg ,
    sig_stat2rsc_status_ready,
    mm2s_decerr_i,
    mm2s_interr_i,
    mm2s_slverr_i,
    sig_rd_sts_tag_reg0,
    Q,
    SR,
    m_axi_mm2s_aclk,
    mm2s_sts_received,
    sig_cmd_stat_rst_int_reg_n,
    s_axis_mm2s_cmd_tvalid_split,
    sig_cmd_reg_empty,
    sm_scc_sm_ready,
    sig_rsc2stat_status_valid,
    m_axis_mm2s_sts_tready,
    sig_mmap_rst_reg_n,
    E,
    D,
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0] ,
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95] );
  output sig_cmd2mstr_cmd_valid;
  output s_axis_mm2s_cmd_tready;
  output \USE_SINGLE_REG.sig_regfifo_full_reg_reg ;
  output sig_stat2rsc_status_ready;
  output mm2s_decerr_i;
  output mm2s_interr_i;
  output mm2s_slverr_i;
  output sig_rd_sts_tag_reg0;
  output [72:0]Q;
  input [0:0]SR;
  input m_axi_mm2s_aclk;
  input mm2s_sts_received;
  input sig_cmd_stat_rst_int_reg_n;
  input s_axis_mm2s_cmd_tvalid_split;
  input sig_cmd_reg_empty;
  input sm_scc_sm_ready;
  input sig_rsc2stat_status_valid;
  input m_axis_mm2s_sts_tready;
  input sig_mmap_rst_reg_n;
  input [0:0]E;
  input [2:0]D;
  input [0:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0] ;
  input [72:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95] ;

  wire [2:0]D;
  wire [0:0]E;
  wire I_CMD_FIFO_n_2;
  wire [72:0]Q;
  wire [0:0]SR;
  wire [0:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0] ;
  wire [72:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95] ;
  wire \USE_SINGLE_REG.sig_regfifo_full_reg_reg ;
  wire m_axi_mm2s_aclk;
  wire m_axis_mm2s_sts_tready;
  wire mm2s_decerr_i;
  wire mm2s_interr_i;
  wire mm2s_slverr_i;
  wire mm2s_sts_received;
  wire s_axis_mm2s_cmd_tready;
  wire s_axis_mm2s_cmd_tvalid_split;
  wire sig_cmd2mstr_cmd_valid;
  wire sig_cmd_reg_empty;
  wire sig_cmd_stat_rst_int_reg_n;
  wire sig_init_done;
  wire sig_mmap_rst_reg_n;
  wire sig_rd_sts_tag_reg0;
  wire sig_rsc2stat_status_valid;
  wire sig_stat2rsc_status_ready;
  wire sm_scc_sm_ready;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized0_6 \GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO 
       (.D(D),
        .E(E),
        .SR(SR),
        .\USE_SINGLE_REG.sig_regfifo_empty_reg_reg_0 (sig_stat2rsc_status_ready),
        .\USE_SINGLE_REG.sig_regfifo_full_reg_reg_0 (\USE_SINGLE_REG.sig_regfifo_full_reg_reg ),
        .m_axi_mm2s_aclk(m_axi_mm2s_aclk),
        .m_axis_mm2s_sts_tready(m_axis_mm2s_sts_tready),
        .mm2s_decerr_i(mm2s_decerr_i),
        .mm2s_interr_i(mm2s_interr_i),
        .mm2s_slverr_i(mm2s_slverr_i),
        .mm2s_sts_received(mm2s_sts_received),
        .sig_cmd_stat_rst_int_reg_n(sig_cmd_stat_rst_int_reg_n),
        .sig_init_done(sig_init_done),
        .sig_init_done_reg_0(I_CMD_FIFO_n_2),
        .sig_mmap_rst_reg_n(sig_mmap_rst_reg_n),
        .sig_rd_sts_tag_reg0(sig_rd_sts_tag_reg0),
        .sig_rsc2stat_status_valid(sig_rsc2stat_status_valid));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo_7 I_CMD_FIFO
       (.Q(Q),
        .SR(SR),
        .\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 (\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0] ),
        .\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 (\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95] ),
        .m_axi_mm2s_aclk(m_axi_mm2s_aclk),
        .s_axis_mm2s_cmd_tready(s_axis_mm2s_cmd_tready),
        .s_axis_mm2s_cmd_tvalid_split(s_axis_mm2s_cmd_tvalid_split),
        .sig_cmd2mstr_cmd_valid(sig_cmd2mstr_cmd_valid),
        .sig_cmd_reg_empty(sig_cmd_reg_empty),
        .sig_cmd_stat_rst_int_reg_n(sig_cmd_stat_rst_int_reg_n),
        .sig_cmd_stat_rst_int_reg_n_reg(I_CMD_FIFO_n_2),
        .sig_init_done(sig_init_done),
        .sm_scc_sm_ready(sm_scc_sm_ready));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo
   (sig_cmd2mstr_cmd_valid,
    s_axis_s2mm_cmd_tready,
    sig_cmd_stat_rst_int_reg_n_reg,
    Q,
    SR,
    m_axi_s2mm_aclk,
    sig_init_done_reg_0,
    s_axis_s2mm_cmd_tvalid_split,
    sig_cmd_reg_empty,
    sm_scc_sm_ready,
    sig_init_done,
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ,
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 );
  output sig_cmd2mstr_cmd_valid;
  output s_axis_s2mm_cmd_tready;
  output sig_cmd_stat_rst_int_reg_n_reg;
  output [72:0]Q;
  input [0:0]SR;
  input m_axi_s2mm_aclk;
  input sig_init_done_reg_0;
  input s_axis_s2mm_cmd_tvalid_split;
  input sig_cmd_reg_empty;
  input sm_scc_sm_ready;
  input sig_init_done;
  input [0:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ;
  input [72:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 ;

  wire \GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg ;
  wire \GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg2 ;
  wire [72:0]Q;
  wire [0:0]SR;
  wire [0:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ;
  wire [72:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 ;
  wire \USE_SINGLE_REG.sig_regfifo_empty_reg_i_1__1_n_0 ;
  wire \USE_SINGLE_REG.sig_regfifo_full_reg_i_1__1_n_0 ;
  wire m_axi_s2mm_aclk;
  wire s_axis_s2mm_cmd_tready;
  wire s_axis_s2mm_cmd_tvalid_split;
  wire sig_cmd2mstr_cmd_valid;
  wire sig_cmd_reg_empty;
  wire sig_cmd_stat_rst_int_reg_n_reg;
  wire sig_init_done;
  wire sig_init_done_0;
  wire sig_init_done_i_1__7_n_0;
  wire sig_init_done_reg_0;
  wire sm_scc_sm_ready;

  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [0]),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [1]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[23] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [7]),
        .Q(Q[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [2]),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[30] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [8]),
        .Q(Q[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[32] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [9]),
        .Q(Q[9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[33] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [10]),
        .Q(Q[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[34] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [11]),
        .Q(Q[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[35] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [12]),
        .Q(Q[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[36] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [13]),
        .Q(Q[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[37] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [14]),
        .Q(Q[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[38] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [15]),
        .Q(Q[15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[39] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [16]),
        .Q(Q[16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[3] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [3]),
        .Q(Q[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[40] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [17]),
        .Q(Q[17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[41] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [18]),
        .Q(Q[18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[42] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [19]),
        .Q(Q[19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[43] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [20]),
        .Q(Q[20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[44] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [21]),
        .Q(Q[21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[45] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [22]),
        .Q(Q[22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[46] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [23]),
        .Q(Q[23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[47] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [24]),
        .Q(Q[24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[48] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [25]),
        .Q(Q[25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[49] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [26]),
        .Q(Q[26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[4] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [4]),
        .Q(Q[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[50] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [27]),
        .Q(Q[27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[51] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [28]),
        .Q(Q[28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[52] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [29]),
        .Q(Q[29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[53] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [30]),
        .Q(Q[30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[54] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [31]),
        .Q(Q[31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[55] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [32]),
        .Q(Q[32]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[56] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [33]),
        .Q(Q[33]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[57] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [34]),
        .Q(Q[34]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[58] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [35]),
        .Q(Q[35]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[59] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [36]),
        .Q(Q[36]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[5] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [5]),
        .Q(Q[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[60] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [37]),
        .Q(Q[37]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[61] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [38]),
        .Q(Q[38]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[62] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [39]),
        .Q(Q[39]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[63] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [40]),
        .Q(Q[40]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[64] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [41]),
        .Q(Q[41]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[65] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [42]),
        .Q(Q[42]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[66] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [43]),
        .Q(Q[43]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[67] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [44]),
        .Q(Q[44]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[68] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [45]),
        .Q(Q[45]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[69] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [46]),
        .Q(Q[46]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[6] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [6]),
        .Q(Q[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[70] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [47]),
        .Q(Q[47]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[71] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [48]),
        .Q(Q[48]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[72] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [49]),
        .Q(Q[49]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[73] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [50]),
        .Q(Q[50]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[74] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [51]),
        .Q(Q[51]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[75] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [52]),
        .Q(Q[52]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[76] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [53]),
        .Q(Q[53]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[77] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [54]),
        .Q(Q[54]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[78] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [55]),
        .Q(Q[55]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[79] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [56]),
        .Q(Q[56]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[80] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [57]),
        .Q(Q[57]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[81] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [58]),
        .Q(Q[58]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[82] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [59]),
        .Q(Q[59]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[83] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [60]),
        .Q(Q[60]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[84] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [61]),
        .Q(Q[61]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[85] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [62]),
        .Q(Q[62]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[86] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [63]),
        .Q(Q[63]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[87] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [64]),
        .Q(Q[64]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[88] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [65]),
        .Q(Q[65]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[89] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [66]),
        .Q(Q[66]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[90] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [67]),
        .Q(Q[67]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[91] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [68]),
        .Q(Q[68]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[92] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [69]),
        .Q(Q[69]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[93] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [70]),
        .Q(Q[70]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[94] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [71]),
        .Q(Q[71]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95] 
       (.C(m_axi_s2mm_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [72]),
        .Q(Q[72]),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFBABABABABABABA)) 
    \USE_SINGLE_REG.sig_regfifo_empty_reg_i_1__1 
       (.I0(sig_init_done_0),
        .I1(s_axis_s2mm_cmd_tvalid_split),
        .I2(s_axis_s2mm_cmd_tready),
        .I3(sig_cmd_reg_empty),
        .I4(sm_scc_sm_ready),
        .I5(sig_cmd2mstr_cmd_valid),
        .O(\USE_SINGLE_REG.sig_regfifo_empty_reg_i_1__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_empty_reg_reg 
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(\USE_SINGLE_REG.sig_regfifo_empty_reg_i_1__1_n_0 ),
        .Q(s_axis_s2mm_cmd_tready),
        .R(SR));
  LUT6 #(
    .INIT(64'h00AAAAAA80808080)) 
    \USE_SINGLE_REG.sig_regfifo_full_reg_i_1__1 
       (.I0(sig_init_done_reg_0),
        .I1(s_axis_s2mm_cmd_tready),
        .I2(s_axis_s2mm_cmd_tvalid_split),
        .I3(sig_cmd_reg_empty),
        .I4(sm_scc_sm_ready),
        .I5(sig_cmd2mstr_cmd_valid),
        .O(\USE_SINGLE_REG.sig_regfifo_full_reg_i_1__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_full_reg_reg 
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(\USE_SINGLE_REG.sig_regfifo_full_reg_i_1__1_n_0 ),
        .Q(sig_cmd2mstr_cmd_valid),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    sig_init_done_i_1__7
       (.I0(sig_init_done_reg_0),
        .I1(sig_init_done_0),
        .I2(\GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg ),
        .I3(\GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg2 ),
        .O(sig_init_done_i_1__7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    sig_init_done_i_1__8
       (.I0(sig_init_done_reg_0),
        .I1(sig_init_done),
        .I2(\GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg ),
        .I3(\GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg2 ),
        .O(sig_cmd_stat_rst_int_reg_n_reg));
  FDRE #(
    .INIT(1'b0)) 
    sig_init_done_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_init_done_i_1__7_n_0),
        .Q(sig_init_done_0),
        .R(1'b0));
  FDSE #(
    .INIT(1'b0)) 
    sig_init_reg2_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(\GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg ),
        .Q(\GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg2 ),
        .S(SR));
  FDRE #(
    .INIT(1'b0)) 
    sig_init_reg_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(SR),
        .Q(\GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg ),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_datamover_fifo" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo_7
   (sig_cmd2mstr_cmd_valid,
    s_axis_mm2s_cmd_tready,
    sig_cmd_stat_rst_int_reg_n_reg,
    Q,
    SR,
    m_axi_mm2s_aclk,
    sig_cmd_stat_rst_int_reg_n,
    s_axis_mm2s_cmd_tvalid_split,
    sig_cmd_reg_empty,
    sm_scc_sm_ready,
    sig_init_done,
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ,
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 );
  output sig_cmd2mstr_cmd_valid;
  output s_axis_mm2s_cmd_tready;
  output sig_cmd_stat_rst_int_reg_n_reg;
  output [72:0]Q;
  input [0:0]SR;
  input m_axi_mm2s_aclk;
  input sig_cmd_stat_rst_int_reg_n;
  input s_axis_mm2s_cmd_tvalid_split;
  input sig_cmd_reg_empty;
  input sm_scc_sm_ready;
  input sig_init_done;
  input [0:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ;
  input [72:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 ;

  wire \GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg ;
  wire \GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg2 ;
  wire [72:0]Q;
  wire [0:0]SR;
  wire [0:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ;
  wire [72:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 ;
  wire \USE_SINGLE_REG.sig_regfifo_empty_reg_i_1_n_0 ;
  wire \USE_SINGLE_REG.sig_regfifo_full_reg_i_1_n_0 ;
  wire m_axi_mm2s_aclk;
  wire s_axis_mm2s_cmd_tready;
  wire s_axis_mm2s_cmd_tvalid_split;
  wire sig_cmd2mstr_cmd_valid;
  wire sig_cmd_reg_empty;
  wire sig_cmd_stat_rst_int_reg_n;
  wire sig_cmd_stat_rst_int_reg_n_reg;
  wire sig_init_done;
  wire sig_init_done_0;
  wire sig_init_done_i_1__3_n_0;
  wire sm_scc_sm_ready;

  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [0]),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[1] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [1]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[23] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [7]),
        .Q(Q[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[2] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [2]),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[30] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [8]),
        .Q(Q[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[32] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [9]),
        .Q(Q[9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[33] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [10]),
        .Q(Q[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[34] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [11]),
        .Q(Q[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[35] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [12]),
        .Q(Q[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[36] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [13]),
        .Q(Q[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[37] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [14]),
        .Q(Q[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[38] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [15]),
        .Q(Q[15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[39] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [16]),
        .Q(Q[16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[3] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [3]),
        .Q(Q[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[40] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [17]),
        .Q(Q[17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[41] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [18]),
        .Q(Q[18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[42] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [19]),
        .Q(Q[19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[43] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [20]),
        .Q(Q[20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[44] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [21]),
        .Q(Q[21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[45] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [22]),
        .Q(Q[22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[46] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [23]),
        .Q(Q[23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[47] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [24]),
        .Q(Q[24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[48] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [25]),
        .Q(Q[25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[49] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [26]),
        .Q(Q[26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[4] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [4]),
        .Q(Q[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[50] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [27]),
        .Q(Q[27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[51] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [28]),
        .Q(Q[28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[52] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [29]),
        .Q(Q[29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[53] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [30]),
        .Q(Q[30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[54] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [31]),
        .Q(Q[31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[55] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [32]),
        .Q(Q[32]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[56] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [33]),
        .Q(Q[33]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[57] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [34]),
        .Q(Q[34]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[58] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [35]),
        .Q(Q[35]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[59] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [36]),
        .Q(Q[36]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[5] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [5]),
        .Q(Q[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[60] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [37]),
        .Q(Q[37]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[61] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [38]),
        .Q(Q[38]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[62] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [39]),
        .Q(Q[39]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[63] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [40]),
        .Q(Q[40]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[64] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [41]),
        .Q(Q[41]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[65] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [42]),
        .Q(Q[42]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[66] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [43]),
        .Q(Q[43]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[67] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [44]),
        .Q(Q[44]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[68] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [45]),
        .Q(Q[45]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[69] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [46]),
        .Q(Q[46]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[6] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [6]),
        .Q(Q[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[70] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [47]),
        .Q(Q[47]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[71] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [48]),
        .Q(Q[48]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[72] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [49]),
        .Q(Q[49]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[73] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [50]),
        .Q(Q[50]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[74] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [51]),
        .Q(Q[51]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[75] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [52]),
        .Q(Q[52]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[76] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [53]),
        .Q(Q[53]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[77] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [54]),
        .Q(Q[54]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[78] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [55]),
        .Q(Q[55]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[79] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [56]),
        .Q(Q[56]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[80] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [57]),
        .Q(Q[57]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[81] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [58]),
        .Q(Q[58]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[82] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [59]),
        .Q(Q[59]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[83] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [60]),
        .Q(Q[60]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[84] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [61]),
        .Q(Q[61]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[85] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [62]),
        .Q(Q[62]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[86] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [63]),
        .Q(Q[63]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[87] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [64]),
        .Q(Q[64]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[88] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [65]),
        .Q(Q[65]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[89] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [66]),
        .Q(Q[66]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[90] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [67]),
        .Q(Q[67]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[91] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [68]),
        .Q(Q[68]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[92] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [69]),
        .Q(Q[69]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[93] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [70]),
        .Q(Q[70]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[94] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [71]),
        .Q(Q[71]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95] 
       (.C(m_axi_mm2s_aclk),
        .CE(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0]_0 ),
        .D(\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95]_0 [72]),
        .Q(Q[72]),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFBABABABABABABA)) 
    \USE_SINGLE_REG.sig_regfifo_empty_reg_i_1 
       (.I0(sig_init_done_0),
        .I1(s_axis_mm2s_cmd_tvalid_split),
        .I2(s_axis_mm2s_cmd_tready),
        .I3(sig_cmd_reg_empty),
        .I4(sm_scc_sm_ready),
        .I5(sig_cmd2mstr_cmd_valid),
        .O(\USE_SINGLE_REG.sig_regfifo_empty_reg_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_empty_reg_reg 
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(\USE_SINGLE_REG.sig_regfifo_empty_reg_i_1_n_0 ),
        .Q(s_axis_mm2s_cmd_tready),
        .R(SR));
  LUT6 #(
    .INIT(64'h00AAAAAA80808080)) 
    \USE_SINGLE_REG.sig_regfifo_full_reg_i_1 
       (.I0(sig_cmd_stat_rst_int_reg_n),
        .I1(s_axis_mm2s_cmd_tready),
        .I2(s_axis_mm2s_cmd_tvalid_split),
        .I3(sig_cmd_reg_empty),
        .I4(sm_scc_sm_ready),
        .I5(sig_cmd2mstr_cmd_valid),
        .O(\USE_SINGLE_REG.sig_regfifo_full_reg_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_full_reg_reg 
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(\USE_SINGLE_REG.sig_regfifo_full_reg_i_1_n_0 ),
        .Q(sig_cmd2mstr_cmd_valid),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    sig_init_done_i_1__3
       (.I0(sig_cmd_stat_rst_int_reg_n),
        .I1(sig_init_done_0),
        .I2(\GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg ),
        .I3(\GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg2 ),
        .O(sig_init_done_i_1__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    sig_init_done_i_1__4
       (.I0(sig_cmd_stat_rst_int_reg_n),
        .I1(sig_init_done),
        .I2(\GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg ),
        .I3(\GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg2 ),
        .O(sig_cmd_stat_rst_int_reg_n_reg));
  FDRE #(
    .INIT(1'b0)) 
    sig_init_done_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sig_init_done_i_1__3_n_0),
        .Q(sig_init_done_0),
        .R(1'b0));
  FDSE #(
    .INIT(1'b0)) 
    sig_init_reg2_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(\GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg ),
        .Q(\GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg2 ),
        .S(SR));
  FDRE #(
    .INIT(1'b0)) 
    sig_init_reg_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(SR),
        .Q(\GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/sig_init_reg ),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_datamover_fifo" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized0
   (sig_init_done,
    \USE_SINGLE_REG.sig_regfifo_full_reg_reg_0 ,
    \USE_SINGLE_REG.sig_regfifo_empty_reg_reg_0 ,
    s2mm_decerr_i,
    s2mm_interr_i,
    s2mm_slverr_i,
    sig_coelsc_tag_reg0,
    sig_init_done_reg_0,
    m_axi_s2mm_aclk,
    SR,
    s2mm_sts_received,
    sig_wsc2stat_status_valid,
    \USE_SINGLE_REG.sig_regfifo_full_reg_reg_1 ,
    m_axis_s2mm_sts_tready,
    \GEN_OMIT_INDET_BTT.sig_coelsc_interr_reg_reg ,
    E,
    D);
  output sig_init_done;
  output \USE_SINGLE_REG.sig_regfifo_full_reg_reg_0 ;
  output \USE_SINGLE_REG.sig_regfifo_empty_reg_reg_0 ;
  output s2mm_decerr_i;
  output s2mm_interr_i;
  output s2mm_slverr_i;
  output sig_coelsc_tag_reg0;
  input sig_init_done_reg_0;
  input m_axi_s2mm_aclk;
  input [0:0]SR;
  input s2mm_sts_received;
  input sig_wsc2stat_status_valid;
  input \USE_SINGLE_REG.sig_regfifo_full_reg_reg_1 ;
  input m_axis_s2mm_sts_tready;
  input \GEN_OMIT_INDET_BTT.sig_coelsc_interr_reg_reg ;
  input [0:0]E;
  input [2:0]D;

  wire [2:0]D;
  wire [0:0]E;
  wire \GEN_OMIT_INDET_BTT.sig_coelsc_interr_reg_reg ;
  wire [0:0]SR;
  wire \USE_SINGLE_REG.sig_regfifo_empty_reg_i_1__2_n_0 ;
  wire \USE_SINGLE_REG.sig_regfifo_empty_reg_reg_0 ;
  wire \USE_SINGLE_REG.sig_regfifo_full_reg_i_1__2_n_0 ;
  wire \USE_SINGLE_REG.sig_regfifo_full_reg_reg_0 ;
  wire \USE_SINGLE_REG.sig_regfifo_full_reg_reg_1 ;
  wire m_axi_s2mm_aclk;
  wire [6:4]m_axis_s2mm_sts_tdata_int;
  wire m_axis_s2mm_sts_tready;
  wire s2mm_decerr_i;
  wire s2mm_interr_i;
  wire s2mm_slverr_i;
  wire s2mm_sts_received;
  wire sig_coelsc_tag_reg0;
  wire sig_init_done;
  wire sig_init_done_reg_0;
  wire sig_wsc2stat_status_valid;

  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \DETERMINATE_BTT_MODE.s2mm_decerr_i_i_1 
       (.I0(s2mm_sts_received),
        .I1(\USE_SINGLE_REG.sig_regfifo_full_reg_reg_0 ),
        .I2(m_axis_s2mm_sts_tdata_int[5]),
        .O(s2mm_decerr_i));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \DETERMINATE_BTT_MODE.s2mm_interr_i_i_1 
       (.I0(s2mm_sts_received),
        .I1(\USE_SINGLE_REG.sig_regfifo_full_reg_reg_0 ),
        .I2(m_axis_s2mm_sts_tdata_int[4]),
        .O(s2mm_interr_i));
  LUT3 #(
    .INIT(8'h40)) 
    \DETERMINATE_BTT_MODE.s2mm_slverr_i_i_1 
       (.I0(s2mm_sts_received),
        .I1(\USE_SINGLE_REG.sig_regfifo_full_reg_reg_0 ),
        .I2(m_axis_s2mm_sts_tdata_int[6]),
        .O(s2mm_slverr_i));
  LUT3 #(
    .INIT(8'h8F)) 
    \GEN_OMIT_INDET_BTT.sig_coelsc_interr_reg_i_1 
       (.I0(\USE_SINGLE_REG.sig_regfifo_empty_reg_reg_0 ),
        .I1(sig_wsc2stat_status_valid),
        .I2(\GEN_OMIT_INDET_BTT.sig_coelsc_interr_reg_reg ),
        .O(sig_coelsc_tag_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[4] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(D[0]),
        .Q(m_axis_s2mm_sts_tdata_int[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[5] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(D[1]),
        .Q(m_axis_s2mm_sts_tdata_int[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[6] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(D[2]),
        .Q(m_axis_s2mm_sts_tdata_int[6]),
        .R(SR));
  LUT5 #(
    .INIT(32'hEAEAFFEA)) 
    \USE_SINGLE_REG.sig_regfifo_empty_reg_i_1__2 
       (.I0(sig_init_done),
        .I1(\USE_SINGLE_REG.sig_regfifo_full_reg_reg_0 ),
        .I2(m_axis_s2mm_sts_tready),
        .I3(\USE_SINGLE_REG.sig_regfifo_empty_reg_reg_0 ),
        .I4(sig_wsc2stat_status_valid),
        .O(\USE_SINGLE_REG.sig_regfifo_empty_reg_i_1__2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_empty_reg_reg 
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(\USE_SINGLE_REG.sig_regfifo_empty_reg_i_1__2_n_0 ),
        .Q(\USE_SINGLE_REG.sig_regfifo_empty_reg_reg_0 ),
        .R(SR));
  LUT5 #(
    .INIT(32'h0080F080)) 
    \USE_SINGLE_REG.sig_regfifo_full_reg_i_1__2 
       (.I0(sig_wsc2stat_status_valid),
        .I1(\USE_SINGLE_REG.sig_regfifo_empty_reg_reg_0 ),
        .I2(\USE_SINGLE_REG.sig_regfifo_full_reg_reg_1 ),
        .I3(\USE_SINGLE_REG.sig_regfifo_full_reg_reg_0 ),
        .I4(m_axis_s2mm_sts_tready),
        .O(\USE_SINGLE_REG.sig_regfifo_full_reg_i_1__2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_full_reg_reg 
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(\USE_SINGLE_REG.sig_regfifo_full_reg_i_1__2_n_0 ),
        .Q(\USE_SINGLE_REG.sig_regfifo_full_reg_reg_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    sig_init_done_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_init_done_reg_0),
        .Q(sig_init_done),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_datamover_fifo" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized0_6
   (sig_init_done,
    \USE_SINGLE_REG.sig_regfifo_full_reg_reg_0 ,
    \USE_SINGLE_REG.sig_regfifo_empty_reg_reg_0 ,
    mm2s_decerr_i,
    mm2s_interr_i,
    mm2s_slverr_i,
    sig_rd_sts_tag_reg0,
    sig_init_done_reg_0,
    m_axi_mm2s_aclk,
    SR,
    mm2s_sts_received,
    sig_rsc2stat_status_valid,
    sig_cmd_stat_rst_int_reg_n,
    m_axis_mm2s_sts_tready,
    sig_mmap_rst_reg_n,
    E,
    D);
  output sig_init_done;
  output \USE_SINGLE_REG.sig_regfifo_full_reg_reg_0 ;
  output \USE_SINGLE_REG.sig_regfifo_empty_reg_reg_0 ;
  output mm2s_decerr_i;
  output mm2s_interr_i;
  output mm2s_slverr_i;
  output sig_rd_sts_tag_reg0;
  input sig_init_done_reg_0;
  input m_axi_mm2s_aclk;
  input [0:0]SR;
  input mm2s_sts_received;
  input sig_rsc2stat_status_valid;
  input sig_cmd_stat_rst_int_reg_n;
  input m_axis_mm2s_sts_tready;
  input sig_mmap_rst_reg_n;
  input [0:0]E;
  input [2:0]D;

  wire [2:0]D;
  wire [0:0]E;
  wire [0:0]SR;
  wire \USE_SINGLE_REG.sig_regfifo_empty_reg_i_1__0_n_0 ;
  wire \USE_SINGLE_REG.sig_regfifo_empty_reg_reg_0 ;
  wire \USE_SINGLE_REG.sig_regfifo_full_reg_i_1__0_n_0 ;
  wire \USE_SINGLE_REG.sig_regfifo_full_reg_reg_0 ;
  wire m_axi_mm2s_aclk;
  wire [6:4]m_axis_mm2s_sts_tdata_int;
  wire m_axis_mm2s_sts_tready;
  wire mm2s_decerr_i;
  wire mm2s_interr_i;
  wire mm2s_slverr_i;
  wire mm2s_sts_received;
  wire sig_cmd_stat_rst_int_reg_n;
  wire sig_init_done;
  wire sig_init_done_reg_0;
  wire sig_mmap_rst_reg_n;
  wire sig_rd_sts_tag_reg0;
  wire sig_rsc2stat_status_valid;

  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[4] 
       (.C(m_axi_mm2s_aclk),
        .CE(E),
        .D(D[0]),
        .Q(m_axis_mm2s_sts_tdata_int[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[5] 
       (.C(m_axi_mm2s_aclk),
        .CE(E),
        .D(D[1]),
        .Q(m_axis_mm2s_sts_tdata_int[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[6] 
       (.C(m_axi_mm2s_aclk),
        .CE(E),
        .D(D[2]),
        .Q(m_axis_mm2s_sts_tdata_int[6]),
        .R(SR));
  LUT5 #(
    .INIT(32'hEAEAFFEA)) 
    \USE_SINGLE_REG.sig_regfifo_empty_reg_i_1__0 
       (.I0(sig_init_done),
        .I1(\USE_SINGLE_REG.sig_regfifo_full_reg_reg_0 ),
        .I2(m_axis_mm2s_sts_tready),
        .I3(\USE_SINGLE_REG.sig_regfifo_empty_reg_reg_0 ),
        .I4(sig_rsc2stat_status_valid),
        .O(\USE_SINGLE_REG.sig_regfifo_empty_reg_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_empty_reg_reg 
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(\USE_SINGLE_REG.sig_regfifo_empty_reg_i_1__0_n_0 ),
        .Q(\USE_SINGLE_REG.sig_regfifo_empty_reg_reg_0 ),
        .R(SR));
  LUT5 #(
    .INIT(32'h0080F080)) 
    \USE_SINGLE_REG.sig_regfifo_full_reg_i_1__0 
       (.I0(sig_rsc2stat_status_valid),
        .I1(\USE_SINGLE_REG.sig_regfifo_empty_reg_reg_0 ),
        .I2(sig_cmd_stat_rst_int_reg_n),
        .I3(\USE_SINGLE_REG.sig_regfifo_full_reg_reg_0 ),
        .I4(m_axis_mm2s_sts_tready),
        .O(\USE_SINGLE_REG.sig_regfifo_full_reg_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \USE_SINGLE_REG.sig_regfifo_full_reg_reg 
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(\USE_SINGLE_REG.sig_regfifo_full_reg_i_1__0_n_0 ),
        .Q(\USE_SINGLE_REG.sig_regfifo_full_reg_reg_0 ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h40)) 
    mm2s_decerr_i_i_1
       (.I0(mm2s_sts_received),
        .I1(\USE_SINGLE_REG.sig_regfifo_full_reg_reg_0 ),
        .I2(m_axis_mm2s_sts_tdata_int[5]),
        .O(mm2s_decerr_i));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h40)) 
    mm2s_interr_i_i_1
       (.I0(mm2s_sts_received),
        .I1(\USE_SINGLE_REG.sig_regfifo_full_reg_reg_0 ),
        .I2(m_axis_mm2s_sts_tdata_int[4]),
        .O(mm2s_interr_i));
  LUT3 #(
    .INIT(8'h40)) 
    mm2s_slverr_i_i_1
       (.I0(mm2s_sts_received),
        .I1(\USE_SINGLE_REG.sig_regfifo_full_reg_reg_0 ),
        .I2(m_axis_mm2s_sts_tdata_int[6]),
        .O(mm2s_slverr_i));
  FDRE #(
    .INIT(1'b0)) 
    sig_init_done_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sig_init_done_reg_0),
        .Q(sig_init_done),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h8F)) 
    sig_rd_sts_interr_reg_i_1
       (.I0(\USE_SINGLE_REG.sig_regfifo_empty_reg_reg_0 ),
        .I1(sig_rsc2stat_status_valid),
        .I2(sig_mmap_rst_reg_n),
        .O(sig_rd_sts_tag_reg0));
endmodule

(* ORIG_REF_NAME = "axi_datamover_fifo" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized1
   (sig_init_done,
    sel,
    sig_push_addr_reg1_out,
    sig_halt_reg_reg,
    sm_set_error_reg,
    out,
    SR,
    m_axi_s2mm_aclk,
    sig_init_done_reg_0,
    sig_mstr2addr_cmd_valid,
    sig_halt_reg,
    sig_data2all_tlast_error,
    sig_addr_reg_empty,
    sig_posted_to_axi_reg,
    in);
  output sig_init_done;
  output sel;
  output sig_push_addr_reg1_out;
  output sig_halt_reg_reg;
  output sm_set_error_reg;
  output [71:0]out;
  input [0:0]SR;
  input m_axi_s2mm_aclk;
  input sig_init_done_reg_0;
  input sig_mstr2addr_cmd_valid;
  input sig_halt_reg;
  input sig_data2all_tlast_error;
  input sig_addr_reg_empty;
  input sig_posted_to_axi_reg;
  input [70:0]in;

  wire [0:0]SR;
  wire [70:0]in;
  wire m_axi_s2mm_aclk;
  wire [71:0]out;
  wire sel;
  wire sig_addr_reg_empty;
  wire sig_data2all_tlast_error;
  wire sig_halt_reg;
  wire sig_halt_reg_reg;
  wire sig_inhibit_rdy_n;
  wire sig_inhibit_rdy_n_i_1_n_0;
  wire sig_init_done;
  wire sig_init_done_reg_0;
  wire sig_mstr2addr_cmd_valid;
  wire sig_posted_to_axi_reg;
  wire sig_push_addr_reg1_out;
  wire sm_set_error_reg;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo \USE_SRL_FIFO.I_SYNC_FIFO 
       (.FIFO_Full_reg_0(sel),
        .SR(SR),
        .\addr_i_reg[2]_0 (sig_push_addr_reg1_out),
        .in(in),
        .m_axi_s2mm_aclk(m_axi_s2mm_aclk),
        .out(out),
        .sig_addr_reg_empty(sig_addr_reg_empty),
        .sig_data2all_tlast_error(sig_data2all_tlast_error),
        .sig_halt_reg(sig_halt_reg),
        .sig_halt_reg_reg(sig_halt_reg_reg),
        .sig_inhibit_rdy_n(sig_inhibit_rdy_n),
        .sig_mstr2addr_cmd_valid(sig_mstr2addr_cmd_valid),
        .sig_posted_to_axi_reg(sig_posted_to_axi_reg),
        .sm_set_error_reg(sm_set_error_reg));
  LUT2 #(
    .INIT(4'hE)) 
    sig_inhibit_rdy_n_i_1
       (.I0(sig_init_done),
        .I1(sig_inhibit_rdy_n),
        .O(sig_inhibit_rdy_n_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_inhibit_rdy_n_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_inhibit_rdy_n_i_1_n_0),
        .Q(sig_inhibit_rdy_n),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    sig_init_done_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_init_done_reg_0),
        .Q(sig_init_done),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_datamover_fifo" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized1_8
   (sel,
    sig_push_addr_reg1_out,
    \addr_i_reg[2] ,
    sig_mmap_rst_reg_n_reg,
    sm_set_error_reg,
    out,
    sig_mmap_rst,
    m_axi_mm2s_aclk,
    sig_data2addr_stop_req,
    FIFO_Full_reg,
    sig_mstr2addr_cmd_valid,
    sig_mmap_rst_reg_n,
    sig_init_done,
    in);
  output sel;
  output sig_push_addr_reg1_out;
  output \addr_i_reg[2] ;
  output sig_mmap_rst_reg_n_reg;
  output sm_set_error_reg;
  output [71:0]out;
  input sig_mmap_rst;
  input m_axi_mm2s_aclk;
  input sig_data2addr_stop_req;
  input FIFO_Full_reg;
  input sig_mstr2addr_cmd_valid;
  input sig_mmap_rst_reg_n;
  input sig_init_done;
  input [70:0]in;

  wire FIFO_Full_reg;
  wire \I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg ;
  wire \I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg2 ;
  wire \addr_i_reg[2] ;
  wire [70:0]in;
  wire m_axi_mm2s_aclk;
  wire [71:0]out;
  wire sel;
  wire sig_data2addr_stop_req;
  wire sig_inhibit_rdy_n;
  wire sig_inhibit_rdy_n_i_1_n_0;
  wire sig_init_done;
  wire sig_init_done_0;
  wire sig_init_done_i_1__5_n_0;
  wire sig_mmap_rst;
  wire sig_mmap_rst_reg_n;
  wire sig_mmap_rst_reg_n_reg;
  wire sig_mstr2addr_cmd_valid;
  wire sig_push_addr_reg1_out;
  wire sm_set_error_reg;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo_9 \USE_SRL_FIFO.I_SYNC_FIFO 
       (.FIFO_Full_reg_0(sel),
        .FIFO_Full_reg_1(FIFO_Full_reg),
        .\addr_i_reg[2]_0 (\addr_i_reg[2] ),
        .in(in),
        .m_axi_mm2s_aclk(m_axi_mm2s_aclk),
        .out(out),
        .sig_data2addr_stop_req(sig_data2addr_stop_req),
        .sig_inhibit_rdy_n(sig_inhibit_rdy_n),
        .sig_mmap_rst(sig_mmap_rst),
        .sig_mmap_rst_reg_n(sig_mmap_rst_reg_n),
        .sig_mstr2addr_cmd_valid(sig_mstr2addr_cmd_valid),
        .sig_push_addr_reg1_out(sig_push_addr_reg1_out),
        .sm_set_error_reg(sm_set_error_reg));
  LUT2 #(
    .INIT(4'hE)) 
    sig_inhibit_rdy_n_i_1
       (.I0(sig_init_done_0),
        .I1(sig_inhibit_rdy_n),
        .O(sig_inhibit_rdy_n_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_inhibit_rdy_n_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sig_inhibit_rdy_n_i_1_n_0),
        .Q(sig_inhibit_rdy_n),
        .R(sig_mmap_rst));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    sig_init_done_i_1__5
       (.I0(sig_mmap_rst_reg_n),
        .I1(sig_init_done_0),
        .I2(\I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg ),
        .I3(\I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg2 ),
        .O(sig_init_done_i_1__5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    sig_init_done_i_1__6
       (.I0(sig_mmap_rst_reg_n),
        .I1(sig_init_done),
        .I2(\I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg ),
        .I3(\I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg2 ),
        .O(sig_mmap_rst_reg_n_reg));
  FDRE #(
    .INIT(1'b0)) 
    sig_init_done_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sig_init_done_i_1__5_n_0),
        .Q(sig_init_done_0),
        .R(1'b0));
  FDSE #(
    .INIT(1'b0)) 
    sig_init_reg2_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(\I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg ),
        .Q(\I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg2 ),
        .S(sig_mmap_rst));
  FDRE #(
    .INIT(1'b0)) 
    sig_init_reg_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sig_mmap_rst),
        .Q(\I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg ),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_datamover_fifo" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized2
   (sig_init_done,
    sig_first_dbeat_reg,
    sig_push_dqual_reg,
    sel,
    E,
    SR,
    D,
    out,
    sig_mmap_rst_reg_n_reg,
    sig_mmap_rst_reg_n_reg_0,
    sig_mmap_rst,
    m_axi_mm2s_aclk,
    sig_init_done_reg_0,
    sig_first_dbeat_reg_0,
    sig_mmap_rst_reg_n,
    sig_last_dbeat__1,
    sig_mstr2data_cmd_valid,
    \sig_dbeat_cntr_reg[0] ,
    sig_good_mmap_dbeat10_out__0,
    sig_dbeat_cntr_eq_1,
    m_axi_mm2s_rlast,
    sig_dqual_reg_full,
    sig_next_calc_error_reg,
    Q,
    \sig_dbeat_cntr_reg[5] ,
    \sig_dbeat_cntr_reg[4] ,
    sig_ld_new_cmd_reg,
    sig_dqual_reg_empty,
    sig_rsc2stat_status_valid,
    sig_stat2rsc_status_ready,
    sig_dqual_reg_empty_reg,
    sig_last_dbeat_reg,
    in);
  output sig_init_done;
  output sig_first_dbeat_reg;
  output sig_push_dqual_reg;
  output sel;
  output [0:0]E;
  output [0:0]SR;
  output [7:0]D;
  output [10:0]out;
  output sig_mmap_rst_reg_n_reg;
  output sig_mmap_rst_reg_n_reg_0;
  input sig_mmap_rst;
  input m_axi_mm2s_aclk;
  input sig_init_done_reg_0;
  input sig_first_dbeat_reg_0;
  input sig_mmap_rst_reg_n;
  input sig_last_dbeat__1;
  input sig_mstr2data_cmd_valid;
  input \sig_dbeat_cntr_reg[0] ;
  input sig_good_mmap_dbeat10_out__0;
  input sig_dbeat_cntr_eq_1;
  input m_axi_mm2s_rlast;
  input sig_dqual_reg_full;
  input sig_next_calc_error_reg;
  input [7:0]Q;
  input \sig_dbeat_cntr_reg[5] ;
  input \sig_dbeat_cntr_reg[4] ;
  input sig_ld_new_cmd_reg;
  input sig_dqual_reg_empty;
  input sig_rsc2stat_status_valid;
  input sig_stat2rsc_status_ready;
  input [2:0]sig_dqual_reg_empty_reg;
  input sig_last_dbeat_reg;
  input [9:0]in;

  wire [7:0]D;
  wire [0:0]E;
  wire [7:0]Q;
  wire [0:0]SR;
  wire [9:0]in;
  wire m_axi_mm2s_aclk;
  wire m_axi_mm2s_rlast;
  wire [10:0]out;
  wire sel;
  wire sig_dbeat_cntr_eq_1;
  wire \sig_dbeat_cntr_reg[0] ;
  wire \sig_dbeat_cntr_reg[4] ;
  wire \sig_dbeat_cntr_reg[5] ;
  wire sig_dqual_reg_empty;
  wire [2:0]sig_dqual_reg_empty_reg;
  wire sig_dqual_reg_full;
  wire sig_first_dbeat_reg;
  wire sig_first_dbeat_reg_0;
  wire sig_good_mmap_dbeat10_out__0;
  wire sig_inhibit_rdy_n;
  wire sig_inhibit_rdy_n_i_1_n_0;
  wire sig_init_done;
  wire sig_init_done_reg_0;
  wire sig_last_dbeat__1;
  wire sig_last_dbeat_reg;
  wire sig_ld_new_cmd_reg;
  wire sig_mmap_rst;
  wire sig_mmap_rst_reg_n;
  wire sig_mmap_rst_reg_n_reg;
  wire sig_mmap_rst_reg_n_reg_0;
  wire sig_mstr2data_cmd_valid;
  wire sig_next_calc_error_reg;
  wire sig_push_dqual_reg;
  wire sig_rsc2stat_status_valid;
  wire sig_stat2rsc_status_ready;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo__parameterized0 \USE_SRL_FIFO.I_SYNC_FIFO 
       (.D(D),
        .E(E),
        .FIFO_Full_reg_0(sel),
        .Q(Q),
        .SR(SR),
        .in(in),
        .m_axi_mm2s_aclk(m_axi_mm2s_aclk),
        .m_axi_mm2s_rlast(m_axi_mm2s_rlast),
        .out(out),
        .sig_dbeat_cntr_eq_1(sig_dbeat_cntr_eq_1),
        .\sig_dbeat_cntr_reg[0] (\sig_dbeat_cntr_reg[0] ),
        .\sig_dbeat_cntr_reg[4] (\sig_dbeat_cntr_reg[4] ),
        .\sig_dbeat_cntr_reg[5] (\sig_dbeat_cntr_reg[5] ),
        .sig_dqual_reg_empty(sig_dqual_reg_empty),
        .sig_dqual_reg_empty_reg(sig_push_dqual_reg),
        .sig_dqual_reg_empty_reg_0(sig_dqual_reg_empty_reg),
        .sig_dqual_reg_full(sig_dqual_reg_full),
        .sig_first_dbeat_reg(sig_first_dbeat_reg),
        .sig_first_dbeat_reg_0(sig_first_dbeat_reg_0),
        .sig_good_mmap_dbeat10_out__0(sig_good_mmap_dbeat10_out__0),
        .sig_inhibit_rdy_n(sig_inhibit_rdy_n),
        .sig_last_dbeat__1(sig_last_dbeat__1),
        .sig_last_dbeat_reg(sig_last_dbeat_reg),
        .sig_ld_new_cmd_reg(sig_ld_new_cmd_reg),
        .sig_mmap_rst(sig_mmap_rst),
        .sig_mmap_rst_reg_n(sig_mmap_rst_reg_n),
        .sig_mmap_rst_reg_n_reg(sig_mmap_rst_reg_n_reg),
        .sig_mmap_rst_reg_n_reg_0(sig_mmap_rst_reg_n_reg_0),
        .sig_mstr2data_cmd_valid(sig_mstr2data_cmd_valid),
        .sig_next_calc_error_reg(sig_next_calc_error_reg),
        .sig_rsc2stat_status_valid(sig_rsc2stat_status_valid),
        .sig_stat2rsc_status_ready(sig_stat2rsc_status_ready));
  LUT2 #(
    .INIT(4'hE)) 
    sig_inhibit_rdy_n_i_1
       (.I0(sig_init_done),
        .I1(sig_inhibit_rdy_n),
        .O(sig_inhibit_rdy_n_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_inhibit_rdy_n_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sig_inhibit_rdy_n_i_1_n_0),
        .Q(sig_inhibit_rdy_n),
        .R(sig_mmap_rst));
  FDRE #(
    .INIT(1'b0)) 
    sig_init_done_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sig_init_done_reg_0),
        .Q(sig_init_done),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_datamover_fifo" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized3
   (m_axi_s2mm_bready,
    E,
    D,
    \addr_i_reg[3] ,
    sig_mmap_rst_reg_n_reg,
    sig_mmap_rst_reg_n_reg_0,
    sig_mmap_rst_reg_n_reg_1,
    sig_coelsc_decerr_reg0,
    sig_coelsc_slverr_reg0,
    sig_init_reg_reg_0,
    sig_init_reg_reg_1,
    \addr_i_reg[3]_0 ,
    m_axi_s2mm_aclk,
    m_axi_s2mm_bready_0,
    Q,
    out,
    m_axi_s2mm_bvalid,
    sig_push_coelsc_reg,
    sig_init_done_reg_0,
    sig_init_done,
    sig_init_done_1,
    sig_init_done_0,
    \GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_reg ,
    \GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_reg_0 ,
    sig_s_ready_dup_reg,
    wdc2skid_wready,
    sig_s_ready_dup_reg_0,
    s_axis_s2mm_tvalid,
    sig_s_ready_dup_reg_1,
    sig_mvalid_stop,
    m_axi_s2mm_bresp);
  output m_axi_s2mm_bready;
  output [0:0]E;
  output [2:0]D;
  output [0:0]\addr_i_reg[3] ;
  output sig_mmap_rst_reg_n_reg;
  output sig_mmap_rst_reg_n_reg_0;
  output sig_mmap_rst_reg_n_reg_1;
  output sig_coelsc_decerr_reg0;
  output sig_coelsc_slverr_reg0;
  output sig_init_reg_reg_0;
  output sig_init_reg_reg_1;
  input [0:0]\addr_i_reg[3]_0 ;
  input m_axi_s2mm_aclk;
  input m_axi_s2mm_bready_0;
  input [3:0]Q;
  input out;
  input m_axi_s2mm_bvalid;
  input sig_push_coelsc_reg;
  input sig_init_done_reg_0;
  input sig_init_done;
  input sig_init_done_1;
  input sig_init_done_0;
  input [0:0]\GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_reg ;
  input [1:0]\GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_reg_0 ;
  input sig_s_ready_dup_reg;
  input wdc2skid_wready;
  input sig_s_ready_dup_reg_0;
  input s_axis_s2mm_tvalid;
  input sig_s_ready_dup_reg_1;
  input sig_mvalid_stop;
  input [1:0]m_axi_s2mm_bresp;

  wire [2:0]D;
  wire [0:0]E;
  wire [0:0]\GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_reg ;
  wire [1:0]\GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_reg_0 ;
  wire \I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg ;
  wire \I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg2 ;
  wire [3:0]Q;
  wire [0:0]\addr_i_reg[3] ;
  wire [0:0]\addr_i_reg[3]_0 ;
  wire m_axi_s2mm_aclk;
  wire m_axi_s2mm_bready;
  wire m_axi_s2mm_bready_0;
  wire [1:0]m_axi_s2mm_bresp;
  wire m_axi_s2mm_bvalid;
  wire out;
  wire s_axis_s2mm_tvalid;
  wire sig_coelsc_decerr_reg0;
  wire sig_coelsc_slverr_reg0;
  wire sig_inhibit_rdy_n;
  wire sig_inhibit_rdy_n_i_1_n_0;
  wire sig_init_done;
  wire sig_init_done_0;
  wire sig_init_done_1;
  wire sig_init_done_2;
  wire sig_init_done_i_1__2_n_0;
  wire sig_init_done_reg_0;
  wire sig_init_reg_reg_0;
  wire sig_init_reg_reg_1;
  wire sig_mmap_rst_reg_n_reg;
  wire sig_mmap_rst_reg_n_reg_0;
  wire sig_mmap_rst_reg_n_reg_1;
  wire sig_mvalid_stop;
  wire sig_push_coelsc_reg;
  wire sig_s_ready_dup_reg;
  wire sig_s_ready_dup_reg_0;
  wire sig_s_ready_dup_reg_1;
  wire wdc2skid_wready;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo__parameterized1 \USE_SRL_FIFO.I_SYNC_FIFO 
       (.D(D),
        .E(E),
        .\GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_reg (\GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_reg ),
        .\GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_reg_0 (\GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_reg_0 ),
        .Q(Q),
        .\addr_i_reg[3]_0 (\addr_i_reg[3] ),
        .\addr_i_reg[3]_1 (\addr_i_reg[3]_0 ),
        .m_axi_s2mm_aclk(m_axi_s2mm_aclk),
        .m_axi_s2mm_bready(m_axi_s2mm_bready),
        .m_axi_s2mm_bready_0(m_axi_s2mm_bready_0),
        .m_axi_s2mm_bresp(m_axi_s2mm_bresp),
        .m_axi_s2mm_bvalid(m_axi_s2mm_bvalid),
        .out(out),
        .sig_coelsc_decerr_reg0(sig_coelsc_decerr_reg0),
        .sig_coelsc_slverr_reg0(sig_coelsc_slverr_reg0),
        .sig_inhibit_rdy_n(sig_inhibit_rdy_n),
        .sig_push_coelsc_reg(sig_push_coelsc_reg));
  LUT2 #(
    .INIT(4'hE)) 
    sig_inhibit_rdy_n_i_1
       (.I0(sig_init_done_2),
        .I1(sig_inhibit_rdy_n),
        .O(sig_inhibit_rdy_n_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_inhibit_rdy_n_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_inhibit_rdy_n_i_1_n_0),
        .Q(sig_inhibit_rdy_n),
        .R(\addr_i_reg[3]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    sig_init_done_i_1
       (.I0(sig_init_done_reg_0),
        .I1(sig_init_done),
        .I2(\I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg ),
        .I3(\I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg2 ),
        .O(sig_mmap_rst_reg_n_reg));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    sig_init_done_i_1__0
       (.I0(sig_init_done_reg_0),
        .I1(sig_init_done_1),
        .I2(\I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg ),
        .I3(\I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg2 ),
        .O(sig_mmap_rst_reg_n_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    sig_init_done_i_1__1
       (.I0(sig_init_done_reg_0),
        .I1(sig_init_done_0),
        .I2(\I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg ),
        .I3(\I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg2 ),
        .O(sig_mmap_rst_reg_n_reg_1));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    sig_init_done_i_1__2
       (.I0(sig_init_done_reg_0),
        .I1(sig_init_done_2),
        .I2(\I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg ),
        .I3(\I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg2 ),
        .O(sig_init_done_i_1__2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_init_done_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_init_done_i_1__2_n_0),
        .Q(sig_init_done_2),
        .R(1'b0));
  FDSE #(
    .INIT(1'b0)) 
    sig_init_reg2_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(\I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg ),
        .Q(\I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg2 ),
        .S(\addr_i_reg[3]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    sig_init_reg_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(\addr_i_reg[3]_0 ),
        .Q(\I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg ),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h04)) 
    sig_m_valid_dup_i_3__0
       (.I0(\I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg ),
        .I1(sig_init_done_reg_0),
        .I2(sig_mvalid_stop),
        .O(sig_init_reg_reg_1));
  LUT6 #(
    .INIT(64'hA8AAAAAAA8A8A8A8)) 
    sig_s_ready_dup_i_1__1
       (.I0(sig_s_ready_dup_reg),
        .I1(\I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_reg ),
        .I2(wdc2skid_wready),
        .I3(sig_s_ready_dup_reg_0),
        .I4(s_axis_s2mm_tvalid),
        .I5(sig_s_ready_dup_reg_1),
        .O(sig_init_reg_reg_0));
endmodule

(* ORIG_REF_NAME = "axi_datamover_fifo" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized4
   (FIFO_Full_reg,
    sig_init_done,
    sig_coelsc_interr_reg0,
    out,
    sig_push_coelsc_reg,
    sig_inhibit_rdy_n,
    E,
    \sig_wdc_statcnt_reg[0] ,
    sig_data2wsc_cmd_cmplt_reg,
    \addr_i_reg[3] ,
    m_axi_s2mm_aclk,
    sig_init_done_reg_0,
    D,
    \USE_SRL_FIFO.sig_wr_fifo ,
    sig_push_to_wsc,
    sig_tlast_err_stop,
    Q,
    \GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ,
    sig_coelsc_reg_empty,
    in);
  output FIFO_Full_reg;
  output sig_init_done;
  output sig_coelsc_interr_reg0;
  output [1:0]out;
  output sig_push_coelsc_reg;
  output sig_inhibit_rdy_n;
  output [0:0]E;
  output [2:0]\sig_wdc_statcnt_reg[0] ;
  output sig_data2wsc_cmd_cmplt_reg;
  input [0:0]\addr_i_reg[3] ;
  input m_axi_s2mm_aclk;
  input sig_init_done_reg_0;
  input [0:0]D;
  input \USE_SRL_FIFO.sig_wr_fifo ;
  input sig_push_to_wsc;
  input sig_tlast_err_stop;
  input [3:0]Q;
  input [0:0]\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ;
  input sig_coelsc_reg_empty;
  input [2:0]in;

  wire [0:0]D;
  wire [0:0]E;
  wire FIFO_Full_reg;
  wire [0:0]\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ;
  wire [3:0]Q;
  wire \USE_SRL_FIFO.sig_wr_fifo ;
  wire [0:0]\addr_i_reg[3] ;
  wire [2:0]in;
  wire m_axi_s2mm_aclk;
  wire [1:0]out;
  wire sig_coelsc_interr_reg0;
  wire sig_coelsc_reg_empty;
  wire sig_data2wsc_cmd_cmplt_reg;
  wire sig_inhibit_rdy_n;
  wire sig_inhibit_rdy_n_i_1_n_0;
  wire sig_init_done;
  wire sig_init_done_reg_0;
  wire sig_push_coelsc_reg;
  wire sig_push_to_wsc;
  wire sig_tlast_err_stop;
  wire [2:0]\sig_wdc_statcnt_reg[0] ;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo__parameterized2 \USE_SRL_FIFO.I_SYNC_FIFO 
       (.D(D),
        .E(E),
        .FIFO_Full_reg_0(FIFO_Full_reg),
        .\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg (\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ),
        .Q(Q),
        .\USE_SRL_FIFO.sig_wr_fifo (\USE_SRL_FIFO.sig_wr_fifo ),
        .\addr_i_reg[3]_0 (sig_push_coelsc_reg),
        .\addr_i_reg[3]_1 (\addr_i_reg[3] ),
        .in(in),
        .m_axi_s2mm_aclk(m_axi_s2mm_aclk),
        .out(out),
        .sig_coelsc_interr_reg0(sig_coelsc_interr_reg0),
        .sig_coelsc_reg_empty(sig_coelsc_reg_empty),
        .sig_data2wsc_cmd_cmplt_reg(sig_data2wsc_cmd_cmplt_reg),
        .sig_inhibit_rdy_n(sig_inhibit_rdy_n),
        .sig_push_to_wsc(sig_push_to_wsc),
        .sig_tlast_err_stop(sig_tlast_err_stop),
        .\sig_wdc_statcnt_reg[0] (\sig_wdc_statcnt_reg[0] ));
  LUT2 #(
    .INIT(4'hE)) 
    sig_inhibit_rdy_n_i_1
       (.I0(sig_init_done),
        .I1(sig_inhibit_rdy_n),
        .O(sig_inhibit_rdy_n_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_inhibit_rdy_n_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_inhibit_rdy_n_i_1_n_0),
        .Q(sig_inhibit_rdy_n),
        .R(\addr_i_reg[3] ));
  FDRE #(
    .INIT(1'b0)) 
    sig_init_done_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_init_done_reg_0),
        .Q(sig_init_done),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_datamover_fifo" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized5
   (sig_init_done,
    sig_first_dbeat_reg,
    sig_push_dqual_reg,
    SR,
    E,
    sel,
    sig_ld_new_cmd_reg_reg,
    D,
    out,
    sig_mmap_rst_reg_n_reg,
    \addr_i_reg[2] ,
    m_axi_s2mm_aclk,
    sig_init_done_reg_0,
    sig_first_dbeat,
    sig_last_dbeat_reg,
    sig_last_dbeat__1,
    sig_good_mmap_dbeat12_out__0,
    sig_next_cmd_cmplt_reg_reg,
    sig_dqual_reg_full,
    sig_next_calc_error_reg,
    sig_dbeat_cntr_eq_1,
    sig_mstr2data_cmd_valid,
    sig_ld_new_cmd_reg,
    Q,
    \sig_dbeat_cntr_reg[5] ,
    \sig_dbeat_cntr_reg[4] ,
    sig_wsc2stat_status_valid,
    sig_stat2wsc_status_ready,
    sig_wdc_status_going_full,
    sig_dqual_reg_empty,
    sig_dqual_reg_empty_reg,
    sig_last_dbeat_reg_0,
    sig_next_calc_error_reg_reg);
  output sig_init_done;
  output sig_first_dbeat_reg;
  output sig_push_dqual_reg;
  output [0:0]SR;
  output [0:0]E;
  output sel;
  output sig_ld_new_cmd_reg_reg;
  output [7:0]D;
  output [10:0]out;
  output sig_mmap_rst_reg_n_reg;
  input [0:0]\addr_i_reg[2] ;
  input m_axi_s2mm_aclk;
  input sig_init_done_reg_0;
  input sig_first_dbeat;
  input sig_last_dbeat_reg;
  input sig_last_dbeat__1;
  input sig_good_mmap_dbeat12_out__0;
  input sig_next_cmd_cmplt_reg_reg;
  input sig_dqual_reg_full;
  input sig_next_calc_error_reg;
  input sig_dbeat_cntr_eq_1;
  input sig_mstr2data_cmd_valid;
  input sig_ld_new_cmd_reg;
  input [7:0]Q;
  input \sig_dbeat_cntr_reg[5] ;
  input \sig_dbeat_cntr_reg[4] ;
  input sig_wsc2stat_status_valid;
  input sig_stat2wsc_status_ready;
  input sig_wdc_status_going_full;
  input sig_dqual_reg_empty;
  input [2:0]sig_dqual_reg_empty_reg;
  input sig_last_dbeat_reg_0;
  input [9:0]sig_next_calc_error_reg_reg;

  wire [7:0]D;
  wire [0:0]E;
  wire [7:0]Q;
  wire [0:0]SR;
  wire [0:0]\addr_i_reg[2] ;
  wire m_axi_s2mm_aclk;
  wire [10:0]out;
  wire sel;
  wire sig_dbeat_cntr_eq_1;
  wire \sig_dbeat_cntr_reg[4] ;
  wire \sig_dbeat_cntr_reg[5] ;
  wire sig_dqual_reg_empty;
  wire [2:0]sig_dqual_reg_empty_reg;
  wire sig_dqual_reg_full;
  wire sig_first_dbeat;
  wire sig_first_dbeat_reg;
  wire sig_good_mmap_dbeat12_out__0;
  wire sig_inhibit_rdy_n;
  wire sig_inhibit_rdy_n_i_1_n_0;
  wire sig_init_done;
  wire sig_init_done_reg_0;
  wire sig_last_dbeat__1;
  wire sig_last_dbeat_reg;
  wire sig_last_dbeat_reg_0;
  wire sig_ld_new_cmd_reg;
  wire sig_ld_new_cmd_reg_reg;
  wire sig_mmap_rst_reg_n_reg;
  wire sig_mstr2data_cmd_valid;
  wire sig_next_calc_error_reg;
  wire [9:0]sig_next_calc_error_reg_reg;
  wire sig_next_cmd_cmplt_reg_reg;
  wire sig_push_dqual_reg;
  wire sig_stat2wsc_status_ready;
  wire sig_wdc_status_going_full;
  wire sig_wsc2stat_status_valid;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo__parameterized3 \USE_SRL_FIFO.I_SYNC_FIFO 
       (.D(D),
        .E(E),
        .FIFO_Full_reg_0(sel),
        .\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg (sig_push_dqual_reg),
        .Q(Q),
        .SR(SR),
        .\addr_i_reg[2]_0 (\addr_i_reg[2] ),
        .m_axi_s2mm_aclk(m_axi_s2mm_aclk),
        .out(out),
        .sig_dbeat_cntr_eq_1(sig_dbeat_cntr_eq_1),
        .\sig_dbeat_cntr_reg[4] (\sig_dbeat_cntr_reg[4] ),
        .\sig_dbeat_cntr_reg[5] (\sig_dbeat_cntr_reg[5] ),
        .sig_dqual_reg_empty(sig_dqual_reg_empty),
        .sig_dqual_reg_empty_reg(sig_dqual_reg_empty_reg),
        .sig_dqual_reg_full(sig_dqual_reg_full),
        .sig_first_dbeat(sig_first_dbeat),
        .sig_first_dbeat_reg(sig_first_dbeat_reg),
        .sig_good_mmap_dbeat12_out__0(sig_good_mmap_dbeat12_out__0),
        .sig_inhibit_rdy_n(sig_inhibit_rdy_n),
        .sig_last_dbeat__1(sig_last_dbeat__1),
        .sig_last_dbeat_reg(sig_last_dbeat_reg),
        .sig_last_dbeat_reg_0(sig_last_dbeat_reg_0),
        .sig_ld_new_cmd_reg(sig_ld_new_cmd_reg),
        .sig_ld_new_cmd_reg_reg(sig_ld_new_cmd_reg_reg),
        .sig_mmap_rst_reg_n_reg(sig_mmap_rst_reg_n_reg),
        .sig_mstr2data_cmd_valid(sig_mstr2data_cmd_valid),
        .sig_next_calc_error_reg(sig_next_calc_error_reg),
        .sig_next_calc_error_reg_reg(sig_next_calc_error_reg_reg),
        .sig_next_cmd_cmplt_reg_reg(sig_next_cmd_cmplt_reg_reg),
        .sig_stat2wsc_status_ready(sig_stat2wsc_status_ready),
        .sig_wdc_status_going_full(sig_wdc_status_going_full),
        .sig_wsc2stat_status_valid(sig_wsc2stat_status_valid));
  LUT2 #(
    .INIT(4'hE)) 
    sig_inhibit_rdy_n_i_1
       (.I0(sig_init_done),
        .I1(sig_inhibit_rdy_n),
        .O(sig_inhibit_rdy_n_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_inhibit_rdy_n_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_inhibit_rdy_n_i_1_n_0),
        .Q(sig_inhibit_rdy_n),
        .R(\addr_i_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    sig_init_done_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_init_done_reg_0),
        .Q(sig_init_done),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_mm2s_basic_wrap
   (m_axis_mm2s_tvalid,
    sig_rst2all_stop_request,
    m_axi_mm2s_arsize,
    m_axi_mm2s_arburst,
    m_axi_mm2s_arvalid,
    m_axis_mm2s_tlast,
    s_axis_mm2s_cmd_tready,
    \USE_SINGLE_REG.sig_regfifo_full_reg_reg ,
    mm2s_decerr_i,
    mm2s_interr_i,
    mm2s_slverr_i,
    m_axi_mm2s_rready,
    mm2s_halt_cmplt,
    m_axi_mm2s_araddr,
    m_axi_mm2s_arlen,
    m_axis_mm2s_tdata,
    m_axis_mm2s_tkeep,
    out,
    m_axi_mm2s_aclk,
    sig_s_h_halt_reg_reg,
    mm2s_sts_received,
    s_axis_mm2s_cmd_tvalid_split,
    m_axis_mm2s_sts_tready,
    m_axi_mm2s_rlast,
    m_axis_mm2s_tready,
    m_axi_mm2s_rvalid,
    m_axi_mm2s_rresp,
    m_axi_mm2s_arready,
    m_axi_mm2s_rdata,
    E,
    D);
  output m_axis_mm2s_tvalid;
  output sig_rst2all_stop_request;
  output [0:0]m_axi_mm2s_arsize;
  output [0:0]m_axi_mm2s_arburst;
  output m_axi_mm2s_arvalid;
  output m_axis_mm2s_tlast;
  output s_axis_mm2s_cmd_tready;
  output \USE_SINGLE_REG.sig_regfifo_full_reg_reg ;
  output mm2s_decerr_i;
  output mm2s_interr_i;
  output mm2s_slverr_i;
  output m_axi_mm2s_rready;
  output mm2s_halt_cmplt;
  output [63:0]m_axi_mm2s_araddr;
  output [4:0]m_axi_mm2s_arlen;
  output [31:0]m_axis_mm2s_tdata;
  output [3:0]m_axis_mm2s_tkeep;
  input out;
  input m_axi_mm2s_aclk;
  input sig_s_h_halt_reg_reg;
  input mm2s_sts_received;
  input s_axis_mm2s_cmd_tvalid_split;
  input m_axis_mm2s_sts_tready;
  input m_axi_mm2s_rlast;
  input m_axis_mm2s_tready;
  input m_axi_mm2s_rvalid;
  input [1:0]m_axi_mm2s_rresp;
  input m_axi_mm2s_arready;
  input [31:0]m_axi_mm2s_rdata;
  input [0:0]E;
  input [72:0]D;

  wire [72:0]D;
  wire [0:0]E;
  wire \GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.sig_wr_fifo ;
  wire \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.sig_wr_fifo ;
  wire \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_done ;
  wire \GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/USE_SINGLE_REG.sig_push_regfifo ;
  wire I_ADDR_CNTL_n_7;
  wire I_CMD_STATUS_n_10;
  wire I_CMD_STATUS_n_11;
  wire I_CMD_STATUS_n_12;
  wire I_CMD_STATUS_n_13;
  wire I_CMD_STATUS_n_14;
  wire I_CMD_STATUS_n_15;
  wire I_CMD_STATUS_n_16;
  wire I_CMD_STATUS_n_17;
  wire I_CMD_STATUS_n_18;
  wire I_CMD_STATUS_n_19;
  wire I_CMD_STATUS_n_20;
  wire I_CMD_STATUS_n_21;
  wire I_CMD_STATUS_n_22;
  wire I_CMD_STATUS_n_23;
  wire I_CMD_STATUS_n_24;
  wire I_CMD_STATUS_n_25;
  wire I_CMD_STATUS_n_26;
  wire I_CMD_STATUS_n_27;
  wire I_CMD_STATUS_n_28;
  wire I_CMD_STATUS_n_29;
  wire I_CMD_STATUS_n_30;
  wire I_CMD_STATUS_n_31;
  wire I_CMD_STATUS_n_32;
  wire I_CMD_STATUS_n_33;
  wire I_CMD_STATUS_n_34;
  wire I_CMD_STATUS_n_35;
  wire I_CMD_STATUS_n_36;
  wire I_CMD_STATUS_n_37;
  wire I_CMD_STATUS_n_38;
  wire I_CMD_STATUS_n_39;
  wire I_CMD_STATUS_n_40;
  wire I_CMD_STATUS_n_41;
  wire I_CMD_STATUS_n_42;
  wire I_CMD_STATUS_n_43;
  wire I_CMD_STATUS_n_44;
  wire I_CMD_STATUS_n_45;
  wire I_CMD_STATUS_n_46;
  wire I_CMD_STATUS_n_47;
  wire I_CMD_STATUS_n_48;
  wire I_CMD_STATUS_n_49;
  wire I_CMD_STATUS_n_50;
  wire I_CMD_STATUS_n_51;
  wire I_CMD_STATUS_n_52;
  wire I_CMD_STATUS_n_53;
  wire I_CMD_STATUS_n_54;
  wire I_CMD_STATUS_n_55;
  wire I_CMD_STATUS_n_56;
  wire I_CMD_STATUS_n_57;
  wire I_CMD_STATUS_n_58;
  wire I_CMD_STATUS_n_59;
  wire I_CMD_STATUS_n_60;
  wire I_CMD_STATUS_n_61;
  wire I_CMD_STATUS_n_62;
  wire I_CMD_STATUS_n_63;
  wire I_CMD_STATUS_n_64;
  wire I_CMD_STATUS_n_65;
  wire I_CMD_STATUS_n_66;
  wire I_CMD_STATUS_n_67;
  wire I_CMD_STATUS_n_68;
  wire I_CMD_STATUS_n_69;
  wire I_CMD_STATUS_n_70;
  wire I_CMD_STATUS_n_71;
  wire I_CMD_STATUS_n_72;
  wire I_CMD_STATUS_n_74;
  wire I_CMD_STATUS_n_75;
  wire I_CMD_STATUS_n_76;
  wire I_CMD_STATUS_n_77;
  wire I_CMD_STATUS_n_78;
  wire I_CMD_STATUS_n_79;
  wire I_CMD_STATUS_n_8;
  wire I_CMD_STATUS_n_80;
  wire I_CMD_STATUS_n_9;
  wire I_RD_DATA_CNTL_n_14;
  wire I_RD_DATA_CNTL_n_25;
  wire I_RD_DATA_CNTL_n_9;
  wire \USE_SINGLE_REG.sig_regfifo_full_reg_reg ;
  wire m_axi_mm2s_aclk;
  wire [63:0]m_axi_mm2s_araddr;
  wire [0:0]m_axi_mm2s_arburst;
  wire [4:0]m_axi_mm2s_arlen;
  wire m_axi_mm2s_arready;
  wire [0:0]m_axi_mm2s_arsize;
  wire m_axi_mm2s_arvalid;
  wire [31:0]m_axi_mm2s_rdata;
  wire m_axi_mm2s_rlast;
  wire m_axi_mm2s_rready;
  wire [1:0]m_axi_mm2s_rresp;
  wire m_axi_mm2s_rvalid;
  wire m_axis_mm2s_sts_tready;
  wire [31:0]m_axis_mm2s_tdata;
  wire [3:0]m_axis_mm2s_tkeep;
  wire m_axis_mm2s_tlast;
  wire m_axis_mm2s_tready;
  wire m_axis_mm2s_tvalid;
  wire mm2s_decerr_i;
  wire mm2s_err;
  wire mm2s_halt_cmplt;
  wire mm2s_interr_i;
  wire mm2s_slverr_i;
  wire mm2s_strm_wvalid0__1;
  wire mm2s_sts_received;
  wire out;
  wire p_0_in5_in;
  wire s_axis_mm2s_cmd_tready;
  wire s_axis_mm2s_cmd_tvalid_split;
  wire sig_addr2data_addr_posted;
  wire sig_addr2rsc_calc_error;
  wire sig_addr_reg_empty;
  wire sig_cmd2mstr_cmd_valid;
  wire sig_cmd_reg_empty;
  wire sig_cmd_stat_rst_int;
  wire sig_cmd_stat_rst_int_reg_n;
  wire sig_data2addr_stop_req;
  wire sig_data2rsc_calc_err;
  wire sig_data2rsc_slverr;
  wire sig_data2skid_halt;
  wire sig_data2skid_wready;
  wire sig_data2skid_wvalid;
  wire sig_halt_reg_dly2;
  wire sig_halt_reg_dly3;
  wire sig_input_eof_reg;
  wire sig_mmap_rst;
  wire sig_mmap_rst_reg_n;
  wire [63:2]sig_mstr2addr_addr;
  wire [0:0]sig_mstr2addr_burst;
  wire sig_mstr2addr_cmd_valid;
  wire sig_mstr2data_cmd_valid;
  wire [3:1]sig_mstr2data_last_strb;
  wire [4:0]sig_mstr2data_len;
  wire [1:0]sig_mstr2data_saddr_lsb;
  wire sig_next_burst;
  wire sig_next_eof_reg;
  wire sig_push_rd_sts_reg;
  wire sig_rd_sts_decerr_reg0;
  wire sig_rd_sts_tag_reg0;
  wire sig_rsc2data_ready;
  wire [6:4]sig_rsc2stat_status;
  wire sig_rsc2stat_status_valid;
  wire sig_rst2all_stop_request;
  wire sig_s_h_halt_reg_reg;
  wire sig_slast_with_stop;
  wire [3:3]sig_sstrb_stop_mask;
  wire [3:0]sig_sstrb_with_stop;
  wire sig_stat2rsc_status_ready;
  wire [3:0]sig_strb_skid_mux_out;
  wire [3:0]sig_strb_skid_reg;
  wire sig_stream_rst;
  wire sig_stream_rst_reg_n;
  wire sm_scc_sm_ready;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_skid_buf_2 \ENABLE_AXIS_SKID.I_MM2S_SKID_BUF 
       (.D(sig_sstrb_with_stop),
        .Q(sig_strb_skid_reg),
        .SR(sig_stream_rst),
        .m_axi_mm2s_aclk(m_axi_mm2s_aclk),
        .m_axi_mm2s_rdata(m_axi_mm2s_rdata),
        .m_axi_mm2s_rlast(m_axi_mm2s_rlast),
        .m_axis_mm2s_tdata(m_axis_mm2s_tdata),
        .m_axis_mm2s_tkeep(m_axis_mm2s_tkeep),
        .m_axis_mm2s_tlast(m_axis_mm2s_tlast),
        .m_axis_mm2s_tready(m_axis_mm2s_tready),
        .m_axis_mm2s_tvalid(m_axis_mm2s_tvalid),
        .mm2s_strm_wvalid0__1(mm2s_strm_wvalid0__1),
        .out(p_0_in5_in),
        .sig_data2skid_halt(sig_data2skid_halt),
        .sig_data2skid_wvalid(sig_data2skid_wvalid),
        .sig_halt_reg_dly2(sig_halt_reg_dly2),
        .sig_halt_reg_dly3(sig_halt_reg_dly3),
        .sig_next_eof_reg(sig_next_eof_reg),
        .sig_s_ready_out_reg_0(sig_data2skid_wready),
        .sig_s_ready_out_reg_1(I_RD_DATA_CNTL_n_14),
        .sig_slast_with_stop(sig_slast_with_stop),
        .sig_sstrb_stop_mask(sig_sstrb_stop_mask),
        .\sig_sstrb_stop_mask_reg[3]_0 (I_RD_DATA_CNTL_n_25),
        .\sig_strb_reg_out_reg[3]_0 (sig_strb_skid_mux_out),
        .sig_stream_rst_reg_n(sig_stream_rst_reg_n));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_addr_cntl I_ADDR_CNTL
       (.\USE_SRL_FIFO.sig_wr_fifo (\GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.sig_wr_fifo ),
        .in({mm2s_err,sig_mstr2addr_burst,sig_mstr2data_len,sig_mstr2addr_addr,sig_mstr2data_saddr_lsb}),
        .m_axi_mm2s_aclk(m_axi_mm2s_aclk),
        .m_axi_mm2s_araddr(m_axi_mm2s_araddr),
        .m_axi_mm2s_arburst(m_axi_mm2s_arburst),
        .m_axi_mm2s_arlen(m_axi_mm2s_arlen),
        .m_axi_mm2s_arready(m_axi_mm2s_arready),
        .m_axi_mm2s_arsize(m_axi_mm2s_arsize),
        .m_axi_mm2s_arvalid(m_axi_mm2s_arvalid),
        .out(sig_addr2data_addr_posted),
        .sig_addr2rsc_calc_error(sig_addr2rsc_calc_error),
        .sig_addr_reg_empty(sig_addr_reg_empty),
        .sig_data2addr_stop_req(sig_data2addr_stop_req),
        .sig_init_done(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_done ),
        .sig_mmap_rst(sig_mmap_rst),
        .sig_mmap_rst_reg_n(sig_mmap_rst_reg_n),
        .sig_mmap_rst_reg_n_reg(I_ADDR_CNTL_n_7),
        .sig_mstr2addr_cmd_valid(sig_mstr2addr_cmd_valid));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_cmd_status_3 I_CMD_STATUS
       (.D(sig_rsc2stat_status),
        .E(\GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/USE_SINGLE_REG.sig_push_regfifo ),
        .Q({I_CMD_STATUS_n_8,I_CMD_STATUS_n_9,I_CMD_STATUS_n_10,I_CMD_STATUS_n_11,I_CMD_STATUS_n_12,I_CMD_STATUS_n_13,I_CMD_STATUS_n_14,I_CMD_STATUS_n_15,I_CMD_STATUS_n_16,I_CMD_STATUS_n_17,I_CMD_STATUS_n_18,I_CMD_STATUS_n_19,I_CMD_STATUS_n_20,I_CMD_STATUS_n_21,I_CMD_STATUS_n_22,I_CMD_STATUS_n_23,I_CMD_STATUS_n_24,I_CMD_STATUS_n_25,I_CMD_STATUS_n_26,I_CMD_STATUS_n_27,I_CMD_STATUS_n_28,I_CMD_STATUS_n_29,I_CMD_STATUS_n_30,I_CMD_STATUS_n_31,I_CMD_STATUS_n_32,I_CMD_STATUS_n_33,I_CMD_STATUS_n_34,I_CMD_STATUS_n_35,I_CMD_STATUS_n_36,I_CMD_STATUS_n_37,I_CMD_STATUS_n_38,I_CMD_STATUS_n_39,I_CMD_STATUS_n_40,I_CMD_STATUS_n_41,I_CMD_STATUS_n_42,I_CMD_STATUS_n_43,I_CMD_STATUS_n_44,I_CMD_STATUS_n_45,I_CMD_STATUS_n_46,I_CMD_STATUS_n_47,I_CMD_STATUS_n_48,I_CMD_STATUS_n_49,I_CMD_STATUS_n_50,I_CMD_STATUS_n_51,I_CMD_STATUS_n_52,I_CMD_STATUS_n_53,I_CMD_STATUS_n_54,I_CMD_STATUS_n_55,I_CMD_STATUS_n_56,I_CMD_STATUS_n_57,I_CMD_STATUS_n_58,I_CMD_STATUS_n_59,I_CMD_STATUS_n_60,I_CMD_STATUS_n_61,I_CMD_STATUS_n_62,I_CMD_STATUS_n_63,I_CMD_STATUS_n_64,I_CMD_STATUS_n_65,I_CMD_STATUS_n_66,I_CMD_STATUS_n_67,I_CMD_STATUS_n_68,I_CMD_STATUS_n_69,I_CMD_STATUS_n_70,I_CMD_STATUS_n_71,I_CMD_STATUS_n_72,sig_next_burst,I_CMD_STATUS_n_74,I_CMD_STATUS_n_75,I_CMD_STATUS_n_76,I_CMD_STATUS_n_77,I_CMD_STATUS_n_78,I_CMD_STATUS_n_79,I_CMD_STATUS_n_80}),
        .SR(sig_cmd_stat_rst_int),
        .\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0] (E),
        .\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95] (D),
        .\USE_SINGLE_REG.sig_regfifo_full_reg_reg (\USE_SINGLE_REG.sig_regfifo_full_reg_reg ),
        .m_axi_mm2s_aclk(m_axi_mm2s_aclk),
        .m_axis_mm2s_sts_tready(m_axis_mm2s_sts_tready),
        .mm2s_decerr_i(mm2s_decerr_i),
        .mm2s_interr_i(mm2s_interr_i),
        .mm2s_slverr_i(mm2s_slverr_i),
        .mm2s_sts_received(mm2s_sts_received),
        .s_axis_mm2s_cmd_tready(s_axis_mm2s_cmd_tready),
        .s_axis_mm2s_cmd_tvalid_split(s_axis_mm2s_cmd_tvalid_split),
        .sig_cmd2mstr_cmd_valid(sig_cmd2mstr_cmd_valid),
        .sig_cmd_reg_empty(sig_cmd_reg_empty),
        .sig_cmd_stat_rst_int_reg_n(sig_cmd_stat_rst_int_reg_n),
        .sig_mmap_rst_reg_n(sig_mmap_rst_reg_n),
        .sig_rd_sts_tag_reg0(sig_rd_sts_tag_reg0),
        .sig_rsc2stat_status_valid(sig_rsc2stat_status_valid),
        .sig_stat2rsc_status_ready(sig_stat2rsc_status_ready),
        .sm_scc_sm_ready(sm_scc_sm_ready));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_scc_4 I_MSTR_SCC
       (.Q({I_CMD_STATUS_n_8,I_CMD_STATUS_n_9,I_CMD_STATUS_n_10,I_CMD_STATUS_n_11,I_CMD_STATUS_n_12,I_CMD_STATUS_n_13,I_CMD_STATUS_n_14,I_CMD_STATUS_n_15,I_CMD_STATUS_n_16,I_CMD_STATUS_n_17,I_CMD_STATUS_n_18,I_CMD_STATUS_n_19,I_CMD_STATUS_n_20,I_CMD_STATUS_n_21,I_CMD_STATUS_n_22,I_CMD_STATUS_n_23,I_CMD_STATUS_n_24,I_CMD_STATUS_n_25,I_CMD_STATUS_n_26,I_CMD_STATUS_n_27,I_CMD_STATUS_n_28,I_CMD_STATUS_n_29,I_CMD_STATUS_n_30,I_CMD_STATUS_n_31,I_CMD_STATUS_n_32,I_CMD_STATUS_n_33,I_CMD_STATUS_n_34,I_CMD_STATUS_n_35,I_CMD_STATUS_n_36,I_CMD_STATUS_n_37,I_CMD_STATUS_n_38,I_CMD_STATUS_n_39,I_CMD_STATUS_n_40,I_CMD_STATUS_n_41,I_CMD_STATUS_n_42,I_CMD_STATUS_n_43,I_CMD_STATUS_n_44,I_CMD_STATUS_n_45,I_CMD_STATUS_n_46,I_CMD_STATUS_n_47,I_CMD_STATUS_n_48,I_CMD_STATUS_n_49,I_CMD_STATUS_n_50,I_CMD_STATUS_n_51,I_CMD_STATUS_n_52,I_CMD_STATUS_n_53,I_CMD_STATUS_n_54,I_CMD_STATUS_n_55,I_CMD_STATUS_n_56,I_CMD_STATUS_n_57,I_CMD_STATUS_n_58,I_CMD_STATUS_n_59,I_CMD_STATUS_n_60,I_CMD_STATUS_n_61,I_CMD_STATUS_n_62,I_CMD_STATUS_n_63,I_CMD_STATUS_n_64,I_CMD_STATUS_n_65,I_CMD_STATUS_n_66,I_CMD_STATUS_n_67,I_CMD_STATUS_n_68,I_CMD_STATUS_n_69,I_CMD_STATUS_n_70,I_CMD_STATUS_n_71,I_CMD_STATUS_n_72,sig_next_burst,I_CMD_STATUS_n_74,I_CMD_STATUS_n_75,I_CMD_STATUS_n_76,I_CMD_STATUS_n_77,I_CMD_STATUS_n_78,I_CMD_STATUS_n_79,I_CMD_STATUS_n_80}),
        .\USE_SRL_FIFO.sig_wr_fifo (\GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.sig_wr_fifo ),
        .\USE_SRL_FIFO.sig_wr_fifo_0 (\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.sig_wr_fifo ),
        .in({mm2s_err,sig_mstr2addr_burst,sig_mstr2data_len,sig_mstr2addr_addr,sig_mstr2data_saddr_lsb}),
        .m_axi_mm2s_aclk(m_axi_mm2s_aclk),
        .sig_cmd2mstr_cmd_valid(sig_cmd2mstr_cmd_valid),
        .sig_cmd_reg_empty(sig_cmd_reg_empty),
        .sig_input_eof_reg_reg_0({sig_input_eof_reg,sig_mstr2data_last_strb}),
        .sig_mmap_rst(sig_mmap_rst),
        .sig_mmap_rst_reg_n(sig_mmap_rst_reg_n),
        .sig_mstr2addr_cmd_valid(sig_mstr2addr_cmd_valid),
        .sig_mstr2data_cmd_valid(sig_mstr2data_cmd_valid),
        .sm_scc_sm_ready(sm_scc_sm_ready));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_rddata_cntl I_RD_DATA_CNTL
       (.D(sig_rsc2stat_status[5]),
        .Q(sig_strb_skid_reg),
        .\USE_SRL_FIFO.sig_wr_fifo (\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.sig_wr_fifo ),
        .in({mm2s_err,sig_input_eof_reg,sig_mstr2data_last_strb,sig_mstr2data_len}),
        .m_axi_mm2s_aclk(m_axi_mm2s_aclk),
        .m_axi_mm2s_rlast(m_axi_mm2s_rlast),
        .m_axi_mm2s_rready(m_axi_mm2s_rready),
        .m_axi_mm2s_rready_0(sig_data2skid_wready),
        .m_axi_mm2s_rresp(m_axi_mm2s_rresp),
        .m_axi_mm2s_rvalid(m_axi_mm2s_rvalid),
        .mm2s_strm_wvalid0__1(mm2s_strm_wvalid0__1),
        .out(sig_addr2data_addr_posted),
        .sig_data2addr_stop_req(sig_data2addr_stop_req),
        .sig_data2rsc_calc_err(sig_data2rsc_calc_err),
        .sig_data2rsc_slverr(sig_data2rsc_slverr),
        .sig_data2skid_halt(sig_data2skid_halt),
        .sig_data2skid_wvalid(sig_data2skid_wvalid),
        .sig_halt_reg_dly2(sig_halt_reg_dly2),
        .sig_halt_reg_dly3(sig_halt_reg_dly3),
        .sig_halt_reg_dly3_reg_0(I_RD_DATA_CNTL_n_25),
        .sig_halt_reg_reg_0(sig_sstrb_with_stop),
        .sig_init_done(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_done ),
        .sig_init_done_reg(I_ADDR_CNTL_n_7),
        .sig_mmap_rst(sig_mmap_rst),
        .sig_mmap_rst_reg_n(sig_mmap_rst_reg_n),
        .sig_mstr2data_cmd_valid(sig_mstr2data_cmd_valid),
        .sig_next_calc_error_reg_reg_0(I_RD_DATA_CNTL_n_9),
        .sig_next_eof_reg(sig_next_eof_reg),
        .\sig_next_last_strb_reg_reg[3]_0 (sig_strb_skid_mux_out),
        .sig_push_rd_sts_reg(sig_push_rd_sts_reg),
        .sig_rd_sts_decerr_reg0(sig_rd_sts_decerr_reg0),
        .sig_rsc2data_ready(sig_rsc2data_ready),
        .sig_rsc2stat_status_valid(sig_rsc2stat_status_valid),
        .sig_rst2all_stop_request(sig_rst2all_stop_request),
        .sig_slast_with_stop(sig_slast_with_stop),
        .sig_sstrb_stop_mask(sig_sstrb_stop_mask),
        .\sig_sstrb_stop_mask_reg[3] (I_RD_DATA_CNTL_n_14),
        .sig_stat2rsc_status_ready(sig_stat2rsc_status_ready),
        .\sig_strb_reg_out_reg[3] (p_0_in5_in),
        .sig_stream_rst_reg_n(sig_stream_rst_reg_n));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_rd_status_cntl I_RD_STATUS_CNTLR
       (.D(sig_rsc2stat_status),
        .E(\GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/USE_SINGLE_REG.sig_push_regfifo ),
        .m_axi_mm2s_aclk(m_axi_mm2s_aclk),
        .sig_data2rsc_calc_err(sig_data2rsc_calc_err),
        .sig_data2rsc_slverr(sig_data2rsc_slverr),
        .sig_push_rd_sts_reg(sig_push_rd_sts_reg),
        .sig_rd_sts_decerr_reg0(sig_rd_sts_decerr_reg0),
        .sig_rd_sts_tag_reg0(sig_rd_sts_tag_reg0),
        .sig_rsc2data_ready(sig_rsc2data_ready),
        .sig_rsc2stat_status_valid(sig_rsc2stat_status_valid),
        .sig_stat2rsc_status_ready(sig_stat2rsc_status_ready));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_reset_5 I_RESET
       (.SR(sig_cmd_stat_rst_int),
        .m_axi_mm2s_aclk(m_axi_mm2s_aclk),
        .mm2s_halt_cmplt(mm2s_halt_cmplt),
        .out(out),
        .sig_addr2rsc_calc_error(sig_addr2rsc_calc_error),
        .sig_addr_reg_empty(sig_addr_reg_empty),
        .sig_cmd_stat_rst_int_reg_n(sig_cmd_stat_rst_int_reg_n),
        .sig_data2addr_stop_req(sig_data2addr_stop_req),
        .sig_halt_cmplt_reg_0(I_RD_DATA_CNTL_n_9),
        .sig_mmap_rst(sig_mmap_rst),
        .sig_mmap_rst_reg_n(sig_mmap_rst_reg_n),
        .sig_rst2all_stop_request(sig_rst2all_stop_request),
        .sig_s_h_halt_reg_reg_0(sig_s_h_halt_reg_reg),
        .sig_stream_rst_reg_n(sig_stream_rst_reg_n),
        .sig_stream_rst_reg_n_reg_0(sig_stream_rst));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_rd_status_cntl
   (D,
    sig_rsc2stat_status_valid,
    sig_rsc2data_ready,
    E,
    sig_rd_sts_tag_reg0,
    sig_push_rd_sts_reg,
    m_axi_mm2s_aclk,
    sig_rd_sts_decerr_reg0,
    sig_stat2rsc_status_ready,
    sig_data2rsc_calc_err,
    sig_data2rsc_slverr);
  output [2:0]D;
  output sig_rsc2stat_status_valid;
  output sig_rsc2data_ready;
  output [0:0]E;
  input sig_rd_sts_tag_reg0;
  input sig_push_rd_sts_reg;
  input m_axi_mm2s_aclk;
  input sig_rd_sts_decerr_reg0;
  input sig_stat2rsc_status_ready;
  input sig_data2rsc_calc_err;
  input sig_data2rsc_slverr;

  wire [2:0]D;
  wire [0:0]E;
  wire m_axi_mm2s_aclk;
  wire sig_data2rsc_calc_err;
  wire sig_data2rsc_slverr;
  wire sig_push_rd_sts_reg;
  wire sig_rd_sts_decerr_reg0;
  wire sig_rd_sts_interr_reg0;
  wire sig_rd_sts_slverr_reg0;
  wire sig_rd_sts_tag_reg0;
  wire sig_rsc2data_ready;
  wire sig_rsc2stat_status_valid;
  wire sig_stat2rsc_status_ready;

  LUT2 #(
    .INIT(4'h8)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg[6]_i_1 
       (.I0(sig_rsc2stat_status_valid),
        .I1(sig_stat2rsc_status_ready),
        .O(E));
  FDRE #(
    .INIT(1'b0)) 
    sig_rd_sts_decerr_reg_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_rd_sts_reg),
        .D(sig_rd_sts_decerr_reg0),
        .Q(D[1]),
        .R(sig_rd_sts_tag_reg0));
  LUT2 #(
    .INIT(4'hE)) 
    sig_rd_sts_interr_reg_i_3
       (.I0(D[0]),
        .I1(sig_data2rsc_calc_err),
        .O(sig_rd_sts_interr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    sig_rd_sts_interr_reg_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_rd_sts_reg),
        .D(sig_rd_sts_interr_reg0),
        .Q(D[0]),
        .R(sig_rd_sts_tag_reg0));
  FDSE #(
    .INIT(1'b0)) 
    sig_rd_sts_reg_empty_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_rd_sts_reg),
        .D(1'b0),
        .Q(sig_rsc2data_ready),
        .S(sig_rd_sts_tag_reg0));
  FDRE #(
    .INIT(1'b0)) 
    sig_rd_sts_reg_full_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_rd_sts_reg),
        .D(1'b1),
        .Q(sig_rsc2stat_status_valid),
        .R(sig_rd_sts_tag_reg0));
  LUT2 #(
    .INIT(4'hE)) 
    sig_rd_sts_slverr_reg_i_1
       (.I0(D[2]),
        .I1(sig_data2rsc_slverr),
        .O(sig_rd_sts_slverr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    sig_rd_sts_slverr_reg_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_rd_sts_reg),
        .D(sig_rd_sts_slverr_reg0),
        .Q(D[2]),
        .R(sig_rd_sts_tag_reg0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_rddata_cntl
   (sig_data2addr_stop_req,
    sig_halt_reg_dly2,
    sig_halt_reg_dly3,
    sig_next_eof_reg,
    sig_data2rsc_calc_err,
    sig_data2rsc_slverr,
    sig_init_done,
    sig_rd_sts_decerr_reg0,
    \USE_SRL_FIFO.sig_wr_fifo ,
    sig_next_calc_error_reg_reg_0,
    sig_data2skid_wvalid,
    sig_slast_with_stop,
    mm2s_strm_wvalid0__1,
    m_axi_mm2s_rready,
    \sig_sstrb_stop_mask_reg[3] ,
    sig_data2skid_halt,
    sig_push_rd_sts_reg,
    \sig_next_last_strb_reg_reg[3]_0 ,
    sig_halt_reg_reg_0,
    sig_halt_reg_dly3_reg_0,
    sig_mmap_rst,
    m_axi_mm2s_aclk,
    sig_init_done_reg,
    sig_mmap_rst_reg_n,
    D,
    sig_mstr2data_cmd_valid,
    out,
    m_axi_mm2s_rlast,
    sig_rsc2stat_status_valid,
    sig_stat2rsc_status_ready,
    m_axi_mm2s_rvalid,
    sig_sstrb_stop_mask,
    m_axi_mm2s_rready_0,
    sig_stream_rst_reg_n,
    m_axi_mm2s_rresp,
    sig_rsc2data_ready,
    \sig_strb_reg_out_reg[3] ,
    Q,
    in,
    sig_rst2all_stop_request);
  output sig_data2addr_stop_req;
  output sig_halt_reg_dly2;
  output sig_halt_reg_dly3;
  output sig_next_eof_reg;
  output sig_data2rsc_calc_err;
  output sig_data2rsc_slverr;
  output sig_init_done;
  output sig_rd_sts_decerr_reg0;
  output \USE_SRL_FIFO.sig_wr_fifo ;
  output sig_next_calc_error_reg_reg_0;
  output sig_data2skid_wvalid;
  output sig_slast_with_stop;
  output mm2s_strm_wvalid0__1;
  output m_axi_mm2s_rready;
  output \sig_sstrb_stop_mask_reg[3] ;
  output sig_data2skid_halt;
  output sig_push_rd_sts_reg;
  output [3:0]\sig_next_last_strb_reg_reg[3]_0 ;
  output [3:0]sig_halt_reg_reg_0;
  output sig_halt_reg_dly3_reg_0;
  input sig_mmap_rst;
  input m_axi_mm2s_aclk;
  input sig_init_done_reg;
  input sig_mmap_rst_reg_n;
  input [0:0]D;
  input sig_mstr2data_cmd_valid;
  input out;
  input m_axi_mm2s_rlast;
  input sig_rsc2stat_status_valid;
  input sig_stat2rsc_status_ready;
  input m_axi_mm2s_rvalid;
  input [0:0]sig_sstrb_stop_mask;
  input m_axi_mm2s_rready_0;
  input sig_stream_rst_reg_n;
  input [1:0]m_axi_mm2s_rresp;
  input sig_rsc2data_ready;
  input \sig_strb_reg_out_reg[3] ;
  input [3:0]Q;
  input [9:0]in;
  input sig_rst2all_stop_request;

  wire [0:0]D;
  wire \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_1 ;
  wire \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_25 ;
  wire \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_26 ;
  wire \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_4 ;
  wire [3:0]Q;
  wire \USE_SRL_FIFO.sig_wr_fifo ;
  wire [9:0]in;
  wire m_axi_mm2s_aclk;
  wire m_axi_mm2s_rlast;
  wire m_axi_mm2s_rready;
  wire m_axi_mm2s_rready_0;
  wire [1:0]m_axi_mm2s_rresp;
  wire m_axi_mm2s_rvalid;
  wire mm2s_strm_wvalid0__1;
  wire out;
  wire [7:0]p_1_in;
  wire [2:0]sig_addr_posted_cntr;
  wire \sig_addr_posted_cntr[0]_i_1__0_n_0 ;
  wire \sig_addr_posted_cntr[1]_i_1_n_0 ;
  wire \sig_addr_posted_cntr[2]_i_1_n_0 ;
  wire \sig_addr_posted_cntr[2]_i_2_n_0 ;
  wire sig_addr_posted_cntr_eq_0__1;
  wire sig_advance_pipe13_out__1;
  wire sig_clr_dqual_reg;
  wire sig_cmd_cmplt_last_dbeat;
  wire [26:14]sig_cmd_fifo_data_out;
  wire sig_coelsc_decerr_reg0;
  wire sig_coelsc_interr_reg0;
  wire sig_coelsc_slverr_reg0;
  wire sig_coelsc_tag_reg0;
  wire sig_data2addr_stop_req;
  wire sig_data2rsc_calc_err;
  wire sig_data2rsc_decerr;
  wire sig_data2rsc_slverr;
  wire sig_data2rsc_valid;
  wire sig_data2skid_halt;
  wire sig_data2skid_wvalid;
  wire [7:0]sig_dbeat_cntr;
  wire \sig_dbeat_cntr[4]_i_2_n_0 ;
  wire \sig_dbeat_cntr[7]_i_3_n_0 ;
  wire \sig_dbeat_cntr[7]_i_4_n_0 ;
  wire \sig_dbeat_cntr[7]_i_5_n_0 ;
  wire sig_dbeat_cntr_eq_1;
  wire sig_dqual_reg_empty;
  wire sig_dqual_reg_full;
  wire sig_first_dbeat_reg_n_0;
  wire sig_good_mmap_dbeat10_out__0;
  wire sig_halt_reg_dly1;
  wire sig_halt_reg_dly2;
  wire sig_halt_reg_dly3;
  wire sig_halt_reg_dly3_reg_0;
  wire sig_halt_reg_i_1_n_0;
  wire [3:0]sig_halt_reg_reg_0;
  wire sig_init_done;
  wire sig_init_done_reg;
  wire sig_last_dbeat__1;
  wire sig_last_dbeat_reg_n_0;
  wire sig_last_mmap_dbeat;
  wire sig_last_mmap_dbeat_reg_reg_n_0;
  wire sig_ld_new_cmd_reg;
  wire sig_mmap_rst;
  wire sig_mmap_rst_reg_n;
  wire sig_mstr2data_cmd_valid;
  wire sig_next_calc_error_reg;
  wire sig_next_calc_error_reg_reg_0;
  wire sig_next_cmd_cmplt_reg;
  wire sig_next_eof_reg;
  wire [3:0]sig_next_last_strb_reg;
  wire [3:0]\sig_next_last_strb_reg_reg[3]_0 ;
  wire [3:0]sig_next_strt_strb_reg;
  wire sig_push_coelsc_reg;
  wire sig_push_dqual_reg;
  wire sig_push_rd_sts_reg;
  wire sig_rd_sts_decerr_reg0;
  wire sig_rsc2data_ready;
  wire sig_rsc2stat_status_valid;
  wire sig_rst2all_stop_request;
  wire sig_slast_with_stop;
  wire [0:0]sig_sstrb_stop_mask;
  wire \sig_sstrb_stop_mask_reg[3] ;
  wire sig_stat2rsc_status_ready;
  wire \sig_strb_reg_out[3]_i_2_n_0 ;
  wire \sig_strb_reg_out_reg[3] ;
  wire sig_stream_rst_reg_n;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized2 \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO 
       (.D(p_1_in),
        .E(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_4 ),
        .Q(sig_dbeat_cntr),
        .SR(sig_clr_dqual_reg),
        .in(in),
        .m_axi_mm2s_aclk(m_axi_mm2s_aclk),
        .m_axi_mm2s_rlast(m_axi_mm2s_rlast),
        .out({sig_cmd_fifo_data_out[26:25],sig_cmd_fifo_data_out[23],sig_cmd_fifo_data_out[21:14]}),
        .sel(\USE_SRL_FIFO.sig_wr_fifo ),
        .sig_dbeat_cntr_eq_1(sig_dbeat_cntr_eq_1),
        .\sig_dbeat_cntr_reg[0] (\sig_dbeat_cntr[7]_i_3_n_0 ),
        .\sig_dbeat_cntr_reg[4] (\sig_dbeat_cntr[4]_i_2_n_0 ),
        .\sig_dbeat_cntr_reg[5] (\sig_dbeat_cntr[7]_i_4_n_0 ),
        .sig_dqual_reg_empty(sig_dqual_reg_empty),
        .sig_dqual_reg_empty_reg(sig_addr_posted_cntr),
        .sig_dqual_reg_full(sig_dqual_reg_full),
        .sig_first_dbeat_reg(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_1 ),
        .sig_first_dbeat_reg_0(sig_first_dbeat_reg_n_0),
        .sig_good_mmap_dbeat10_out__0(sig_good_mmap_dbeat10_out__0),
        .sig_init_done(sig_init_done),
        .sig_init_done_reg_0(sig_init_done_reg),
        .sig_last_dbeat__1(sig_last_dbeat__1),
        .sig_last_dbeat_reg(sig_last_dbeat_reg_n_0),
        .sig_ld_new_cmd_reg(sig_ld_new_cmd_reg),
        .sig_mmap_rst(sig_mmap_rst),
        .sig_mmap_rst_reg_n(sig_mmap_rst_reg_n),
        .sig_mmap_rst_reg_n_reg(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_25 ),
        .sig_mmap_rst_reg_n_reg_0(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_26 ),
        .sig_mstr2data_cmd_valid(sig_mstr2data_cmd_valid),
        .sig_next_calc_error_reg(sig_next_calc_error_reg),
        .sig_push_dqual_reg(sig_push_dqual_reg),
        .sig_rsc2stat_status_valid(sig_rsc2stat_status_valid),
        .sig_stat2rsc_status_ready(sig_stat2rsc_status_ready));
  LUT6 #(
    .INIT(64'h0000000000000E00)) 
    m_axi_mm2s_rready_INST_0
       (.I0(sig_data2addr_stop_req),
        .I1(m_axi_mm2s_rready_0),
        .I2(sig_data2rsc_valid),
        .I3(sig_dqual_reg_full),
        .I4(sig_next_calc_error_reg),
        .I5(sig_addr_posted_cntr_eq_0__1),
        .O(m_axi_mm2s_rready));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h01)) 
    m_axi_mm2s_rready_INST_0_i_1
       (.I0(sig_addr_posted_cntr[0]),
        .I1(sig_addr_posted_cntr[1]),
        .I2(sig_addr_posted_cntr[2]),
        .O(sig_addr_posted_cntr_eq_0__1));
  LUT1 #(
    .INIT(2'h1)) 
    \sig_addr_posted_cntr[0]_i_1__0 
       (.I0(sig_addr_posted_cntr[0]),
        .O(\sig_addr_posted_cntr[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT5 #(
    .INIT(32'hF44BB44B)) 
    \sig_addr_posted_cntr[1]_i_1 
       (.I0(sig_last_mmap_dbeat_reg_reg_n_0),
        .I1(out),
        .I2(sig_addr_posted_cntr[0]),
        .I3(sig_addr_posted_cntr[1]),
        .I4(sig_addr_posted_cntr[2]),
        .O(\sig_addr_posted_cntr[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00FE7F00)) 
    \sig_addr_posted_cntr[2]_i_1 
       (.I0(sig_addr_posted_cntr[2]),
        .I1(sig_addr_posted_cntr[1]),
        .I2(sig_addr_posted_cntr[0]),
        .I3(out),
        .I4(sig_last_mmap_dbeat_reg_reg_n_0),
        .O(\sig_addr_posted_cntr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT5 #(
    .INIT(32'hBAAAAA65)) 
    \sig_addr_posted_cntr[2]_i_2 
       (.I0(sig_addr_posted_cntr[2]),
        .I1(sig_last_mmap_dbeat_reg_reg_n_0),
        .I2(out),
        .I3(sig_addr_posted_cntr[0]),
        .I4(sig_addr_posted_cntr[1]),
        .O(\sig_addr_posted_cntr[2]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sig_addr_posted_cntr_reg[0] 
       (.C(m_axi_mm2s_aclk),
        .CE(\sig_addr_posted_cntr[2]_i_1_n_0 ),
        .D(\sig_addr_posted_cntr[0]_i_1__0_n_0 ),
        .Q(sig_addr_posted_cntr[0]),
        .R(sig_mmap_rst));
  FDRE #(
    .INIT(1'b0)) 
    \sig_addr_posted_cntr_reg[1] 
       (.C(m_axi_mm2s_aclk),
        .CE(\sig_addr_posted_cntr[2]_i_1_n_0 ),
        .D(\sig_addr_posted_cntr[1]_i_1_n_0 ),
        .Q(sig_addr_posted_cntr[1]),
        .R(sig_mmap_rst));
  FDRE #(
    .INIT(1'b0)) 
    \sig_addr_posted_cntr_reg[2] 
       (.C(m_axi_mm2s_aclk),
        .CE(\sig_addr_posted_cntr[2]_i_1_n_0 ),
        .D(\sig_addr_posted_cntr[2]_i_2_n_0 ),
        .Q(sig_addr_posted_cntr[2]),
        .R(sig_mmap_rst));
  LUT5 #(
    .INIT(32'h2A00FFFF)) 
    sig_coelsc_cmd_cmplt_reg_i_1
       (.I0(sig_data2rsc_valid),
        .I1(sig_ld_new_cmd_reg),
        .I2(sig_next_calc_error_reg),
        .I3(sig_rsc2data_ready),
        .I4(sig_mmap_rst_reg_n),
        .O(sig_coelsc_tag_reg0));
  LUT4 #(
    .INIT(16'hF444)) 
    sig_coelsc_cmd_cmplt_reg_i_2
       (.I0(sig_data2rsc_valid),
        .I1(sig_good_mmap_dbeat10_out__0),
        .I2(sig_ld_new_cmd_reg),
        .I3(sig_next_calc_error_reg),
        .O(sig_push_coelsc_reg));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    sig_coelsc_cmd_cmplt_reg_i_3
       (.I0(sig_next_cmd_cmplt_reg),
        .I1(m_axi_mm2s_rlast),
        .I2(sig_next_calc_error_reg),
        .O(sig_cmd_cmplt_last_dbeat));
  FDRE #(
    .INIT(1'b0)) 
    sig_coelsc_cmd_cmplt_reg_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_coelsc_reg),
        .D(sig_cmd_cmplt_last_dbeat),
        .Q(sig_data2rsc_valid),
        .R(sig_coelsc_tag_reg0));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'hFF80)) 
    sig_coelsc_decerr_reg_i_1
       (.I0(m_axi_mm2s_rresp[0]),
        .I1(m_axi_mm2s_rresp[1]),
        .I2(m_axi_mm2s_rvalid),
        .I3(sig_data2rsc_decerr),
        .O(sig_coelsc_decerr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    sig_coelsc_decerr_reg_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_coelsc_reg),
        .D(sig_coelsc_decerr_reg0),
        .Q(sig_data2rsc_decerr),
        .R(sig_coelsc_tag_reg0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'hE)) 
    sig_coelsc_interr_reg_i_1
       (.I0(sig_next_calc_error_reg),
        .I1(sig_data2rsc_calc_err),
        .O(sig_coelsc_interr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    sig_coelsc_interr_reg_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_coelsc_reg),
        .D(sig_coelsc_interr_reg0),
        .Q(sig_data2rsc_calc_err),
        .R(sig_coelsc_tag_reg0));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'hFF40)) 
    sig_coelsc_slverr_reg_i_1
       (.I0(m_axi_mm2s_rresp[0]),
        .I1(m_axi_mm2s_rresp[1]),
        .I2(m_axi_mm2s_rvalid),
        .I3(sig_data2rsc_slverr),
        .O(sig_coelsc_slverr_reg0));
  FDRE #(
    .INIT(1'b0)) 
    sig_coelsc_slverr_reg_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_coelsc_reg),
        .D(sig_coelsc_slverr_reg0),
        .Q(sig_data2rsc_slverr),
        .R(sig_coelsc_tag_reg0));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \sig_dbeat_cntr[4]_i_2 
       (.I0(sig_dbeat_cntr[1]),
        .I1(sig_dbeat_cntr[0]),
        .O(\sig_dbeat_cntr[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \sig_dbeat_cntr[7]_i_3 
       (.I0(sig_good_mmap_dbeat10_out__0),
        .I1(\sig_dbeat_cntr[7]_i_5_n_0 ),
        .I2(sig_dbeat_cntr[3]),
        .I3(sig_dbeat_cntr[2]),
        .I4(sig_dbeat_cntr[0]),
        .I5(sig_dbeat_cntr[1]),
        .O(\sig_dbeat_cntr[7]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \sig_dbeat_cntr[7]_i_4 
       (.I0(sig_dbeat_cntr[3]),
        .I1(sig_dbeat_cntr[2]),
        .I2(sig_dbeat_cntr[0]),
        .I3(sig_dbeat_cntr[1]),
        .I4(sig_dbeat_cntr[4]),
        .O(\sig_dbeat_cntr[7]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \sig_dbeat_cntr[7]_i_5 
       (.I0(sig_dbeat_cntr[7]),
        .I1(sig_dbeat_cntr[6]),
        .I2(sig_dbeat_cntr[4]),
        .I3(sig_dbeat_cntr[5]),
        .O(\sig_dbeat_cntr[7]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sig_dbeat_cntr_reg[0] 
       (.C(m_axi_mm2s_aclk),
        .CE(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_4 ),
        .D(p_1_in[0]),
        .Q(sig_dbeat_cntr[0]),
        .R(sig_mmap_rst));
  FDRE #(
    .INIT(1'b0)) 
    \sig_dbeat_cntr_reg[1] 
       (.C(m_axi_mm2s_aclk),
        .CE(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_4 ),
        .D(p_1_in[1]),
        .Q(sig_dbeat_cntr[1]),
        .R(sig_mmap_rst));
  FDRE #(
    .INIT(1'b0)) 
    \sig_dbeat_cntr_reg[2] 
       (.C(m_axi_mm2s_aclk),
        .CE(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_4 ),
        .D(p_1_in[2]),
        .Q(sig_dbeat_cntr[2]),
        .R(sig_mmap_rst));
  FDRE #(
    .INIT(1'b0)) 
    \sig_dbeat_cntr_reg[3] 
       (.C(m_axi_mm2s_aclk),
        .CE(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_4 ),
        .D(p_1_in[3]),
        .Q(sig_dbeat_cntr[3]),
        .R(sig_mmap_rst));
  FDRE #(
    .INIT(1'b0)) 
    \sig_dbeat_cntr_reg[4] 
       (.C(m_axi_mm2s_aclk),
        .CE(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_4 ),
        .D(p_1_in[4]),
        .Q(sig_dbeat_cntr[4]),
        .R(sig_mmap_rst));
  FDRE #(
    .INIT(1'b0)) 
    \sig_dbeat_cntr_reg[5] 
       (.C(m_axi_mm2s_aclk),
        .CE(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_4 ),
        .D(p_1_in[5]),
        .Q(sig_dbeat_cntr[5]),
        .R(sig_mmap_rst));
  FDRE #(
    .INIT(1'b0)) 
    \sig_dbeat_cntr_reg[6] 
       (.C(m_axi_mm2s_aclk),
        .CE(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_4 ),
        .D(p_1_in[6]),
        .Q(sig_dbeat_cntr[6]),
        .R(sig_mmap_rst));
  FDRE #(
    .INIT(1'b0)) 
    \sig_dbeat_cntr_reg[7] 
       (.C(m_axi_mm2s_aclk),
        .CE(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_4 ),
        .D(p_1_in[7]),
        .Q(sig_dbeat_cntr[7]),
        .R(sig_mmap_rst));
  FDSE #(
    .INIT(1'b0)) 
    sig_dqual_reg_empty_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_dqual_reg),
        .D(1'b0),
        .Q(sig_dqual_reg_empty),
        .S(sig_clr_dqual_reg));
  FDRE #(
    .INIT(1'b0)) 
    sig_dqual_reg_full_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_dqual_reg),
        .D(1'b1),
        .Q(sig_dqual_reg_full),
        .R(sig_clr_dqual_reg));
  FDRE #(
    .INIT(1'b0)) 
    sig_first_dbeat_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_1 ),
        .Q(sig_first_dbeat_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'h5554FFFF)) 
    sig_halt_cmplt_i_3
       (.I0(sig_next_calc_error_reg),
        .I1(sig_addr_posted_cntr[0]),
        .I2(sig_addr_posted_cntr[1]),
        .I3(sig_addr_posted_cntr[2]),
        .I4(sig_halt_reg_dly3),
        .O(sig_next_calc_error_reg_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_halt_reg_dly1_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sig_data2addr_stop_req),
        .Q(sig_halt_reg_dly1),
        .R(sig_mmap_rst));
  FDRE #(
    .INIT(1'b0)) 
    sig_halt_reg_dly2_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sig_halt_reg_dly1),
        .Q(sig_halt_reg_dly2),
        .R(sig_mmap_rst));
  FDRE #(
    .INIT(1'b0)) 
    sig_halt_reg_dly3_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sig_halt_reg_dly2),
        .Q(sig_halt_reg_dly3),
        .R(sig_mmap_rst));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'hE)) 
    sig_halt_reg_i_1
       (.I0(sig_rst2all_stop_request),
        .I1(sig_data2addr_stop_req),
        .O(sig_halt_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_halt_reg_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sig_halt_reg_i_1_n_0),
        .Q(sig_data2addr_stop_req),
        .R(sig_mmap_rst));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    sig_last_dbeat_i_3
       (.I0(sig_good_mmap_dbeat10_out__0),
        .I1(sig_dbeat_cntr[2]),
        .I2(sig_dbeat_cntr[3]),
        .I3(sig_dbeat_cntr[0]),
        .I4(sig_dbeat_cntr[1]),
        .I5(\sig_dbeat_cntr[7]_i_5_n_0 ),
        .O(sig_last_dbeat__1));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    sig_last_dbeat_i_4
       (.I0(sig_dbeat_cntr[2]),
        .I1(sig_dbeat_cntr[3]),
        .I2(sig_dbeat_cntr[0]),
        .I3(sig_dbeat_cntr[1]),
        .I4(\sig_dbeat_cntr[7]_i_5_n_0 ),
        .O(sig_dbeat_cntr_eq_1));
  FDRE #(
    .INIT(1'b0)) 
    sig_last_dbeat_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_26 ),
        .Q(sig_last_dbeat_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h8)) 
    sig_last_mmap_dbeat_reg_i_1
       (.I0(m_axi_mm2s_rlast),
        .I1(sig_good_mmap_dbeat10_out__0),
        .O(sig_last_mmap_dbeat));
  FDRE #(
    .INIT(1'b0)) 
    sig_last_mmap_dbeat_reg_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sig_last_mmap_dbeat),
        .Q(sig_last_mmap_dbeat_reg_reg_n_0),
        .R(sig_mmap_rst));
  LUT6 #(
    .INIT(64'h0808080808080800)) 
    sig_last_reg_out_i_2
       (.I0(sig_data2addr_stop_req),
        .I1(sig_dqual_reg_full),
        .I2(sig_next_calc_error_reg),
        .I3(sig_addr_posted_cntr[2]),
        .I4(sig_addr_posted_cntr[1]),
        .I5(sig_addr_posted_cntr[0]),
        .O(mm2s_strm_wvalid0__1));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'hFEEE)) 
    sig_last_skid_reg_i_1
       (.I0(mm2s_strm_wvalid0__1),
        .I1(sig_sstrb_stop_mask),
        .I2(m_axi_mm2s_rlast),
        .I3(sig_next_eof_reg),
        .O(sig_slast_with_stop));
  FDRE #(
    .INIT(1'b0)) 
    sig_ld_new_cmd_reg_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_25 ),
        .Q(sig_ld_new_cmd_reg),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    sig_m_valid_dup_i_3
       (.I0(sig_halt_reg_dly2),
        .I1(sig_halt_reg_dly3),
        .O(sig_data2skid_halt));
  FDRE #(
    .INIT(1'b0)) 
    sig_next_calc_error_reg_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_dqual_reg),
        .D(sig_cmd_fifo_data_out[26]),
        .Q(sig_next_calc_error_reg),
        .R(sig_clr_dqual_reg));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h8880)) 
    sig_next_cmd_cmplt_reg_i_3
       (.I0(m_axi_mm2s_rvalid),
        .I1(sig_advance_pipe13_out__1),
        .I2(m_axi_mm2s_rready_0),
        .I3(sig_data2addr_stop_req),
        .O(sig_good_mmap_dbeat10_out__0));
  LUT6 #(
    .INIT(64'h0404040404040400)) 
    sig_next_cmd_cmplt_reg_i_5
       (.I0(sig_data2rsc_valid),
        .I1(sig_dqual_reg_full),
        .I2(sig_next_calc_error_reg),
        .I3(sig_addr_posted_cntr[2]),
        .I4(sig_addr_posted_cntr[1]),
        .I5(sig_addr_posted_cntr[0]),
        .O(sig_advance_pipe13_out__1));
  FDRE #(
    .INIT(1'b0)) 
    sig_next_cmd_cmplt_reg_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_dqual_reg),
        .D(sig_cmd_fifo_data_out[25]),
        .Q(sig_next_cmd_cmplt_reg),
        .R(sig_clr_dqual_reg));
  FDRE #(
    .INIT(1'b0)) 
    sig_next_eof_reg_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_dqual_reg),
        .D(sig_cmd_fifo_data_out[23]),
        .Q(sig_next_eof_reg),
        .R(sig_clr_dqual_reg));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_last_strb_reg_reg[0] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_dqual_reg),
        .D(sig_cmd_fifo_data_out[18]),
        .Q(sig_next_last_strb_reg[0]),
        .R(sig_clr_dqual_reg));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_last_strb_reg_reg[1] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_dqual_reg),
        .D(sig_cmd_fifo_data_out[19]),
        .Q(sig_next_last_strb_reg[1]),
        .R(sig_clr_dqual_reg));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_last_strb_reg_reg[2] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_dqual_reg),
        .D(sig_cmd_fifo_data_out[20]),
        .Q(sig_next_last_strb_reg[2]),
        .R(sig_clr_dqual_reg));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_last_strb_reg_reg[3] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_dqual_reg),
        .D(sig_cmd_fifo_data_out[21]),
        .Q(sig_next_last_strb_reg[3]),
        .R(sig_clr_dqual_reg));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_strt_strb_reg_reg[0] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_dqual_reg),
        .D(sig_cmd_fifo_data_out[14]),
        .Q(sig_next_strt_strb_reg[0]),
        .R(sig_clr_dqual_reg));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_strt_strb_reg_reg[1] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_dqual_reg),
        .D(sig_cmd_fifo_data_out[15]),
        .Q(sig_next_strt_strb_reg[1]),
        .R(sig_clr_dqual_reg));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_strt_strb_reg_reg[2] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_dqual_reg),
        .D(sig_cmd_fifo_data_out[16]),
        .Q(sig_next_strt_strb_reg[2]),
        .R(sig_clr_dqual_reg));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_strt_strb_reg_reg[3] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_push_dqual_reg),
        .D(sig_cmd_fifo_data_out[17]),
        .Q(sig_next_strt_strb_reg[3]),
        .R(sig_clr_dqual_reg));
  LUT2 #(
    .INIT(4'hE)) 
    sig_rd_sts_decerr_reg_i_1
       (.I0(sig_data2rsc_decerr),
        .I1(D),
        .O(sig_rd_sts_decerr_reg0));
  LUT2 #(
    .INIT(4'h8)) 
    sig_rd_sts_interr_reg_i_2
       (.I0(sig_data2rsc_valid),
        .I1(sig_rsc2data_ready),
        .O(sig_push_rd_sts_reg));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h4044)) 
    sig_s_ready_dup_i_2
       (.I0(sig_sstrb_stop_mask),
        .I1(sig_stream_rst_reg_n),
        .I2(sig_halt_reg_dly3),
        .I3(sig_halt_reg_dly2),
        .O(\sig_sstrb_stop_mask_reg[3] ));
  LUT6 #(
    .INIT(64'h000F000000020000)) 
    sig_s_ready_dup_i_3
       (.I0(m_axi_mm2s_rvalid),
        .I1(sig_data2rsc_valid),
        .I2(sig_addr_posted_cntr_eq_0__1),
        .I3(sig_next_calc_error_reg),
        .I4(sig_dqual_reg_full),
        .I5(sig_data2addr_stop_req),
        .O(sig_data2skid_wvalid));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    \sig_sstrb_stop_mask[3]_i_1 
       (.I0(sig_halt_reg_dly3),
        .I1(sig_halt_reg_dly2),
        .I2(sig_sstrb_stop_mask),
        .O(sig_halt_reg_dly3_reg_0));
  LUT6 #(
    .INIT(64'hFEAEFFFFFEAE0000)) 
    \sig_strb_reg_out[0]_i_1 
       (.I0(\sig_strb_reg_out[3]_i_2_n_0 ),
        .I1(sig_next_last_strb_reg[0]),
        .I2(sig_first_dbeat_reg_n_0),
        .I3(sig_next_strt_strb_reg[0]),
        .I4(\sig_strb_reg_out_reg[3] ),
        .I5(Q[0]),
        .O(\sig_next_last_strb_reg_reg[3]_0 [0]));
  LUT6 #(
    .INIT(64'hFEAEFFFFFEAE0000)) 
    \sig_strb_reg_out[1]_i_1 
       (.I0(\sig_strb_reg_out[3]_i_2_n_0 ),
        .I1(sig_next_last_strb_reg[1]),
        .I2(sig_first_dbeat_reg_n_0),
        .I3(sig_next_strt_strb_reg[1]),
        .I4(\sig_strb_reg_out_reg[3] ),
        .I5(Q[1]),
        .O(\sig_next_last_strb_reg_reg[3]_0 [1]));
  LUT6 #(
    .INIT(64'hFEAEFFFFFEAE0000)) 
    \sig_strb_reg_out[2]_i_1 
       (.I0(\sig_strb_reg_out[3]_i_2_n_0 ),
        .I1(sig_next_last_strb_reg[2]),
        .I2(sig_first_dbeat_reg_n_0),
        .I3(sig_next_strt_strb_reg[2]),
        .I4(\sig_strb_reg_out_reg[3] ),
        .I5(Q[2]),
        .O(\sig_next_last_strb_reg_reg[3]_0 [2]));
  LUT6 #(
    .INIT(64'hFEAEFFFFFEAE0000)) 
    \sig_strb_reg_out[3]_i_1__0 
       (.I0(\sig_strb_reg_out[3]_i_2_n_0 ),
        .I1(sig_next_last_strb_reg[3]),
        .I2(sig_first_dbeat_reg_n_0),
        .I3(sig_next_strt_strb_reg[3]),
        .I4(\sig_strb_reg_out_reg[3] ),
        .I5(Q[3]),
        .O(\sig_next_last_strb_reg_reg[3]_0 [3]));
  LUT4 #(
    .INIT(16'hEEEF)) 
    \sig_strb_reg_out[3]_i_2 
       (.I0(sig_data2addr_stop_req),
        .I1(sig_sstrb_stop_mask),
        .I2(sig_last_dbeat_reg_n_0),
        .I3(sig_first_dbeat_reg_n_0),
        .O(\sig_strb_reg_out[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFEFEEEEFFEF)) 
    \sig_strb_skid_reg[0]_i_1 
       (.I0(sig_data2addr_stop_req),
        .I1(sig_sstrb_stop_mask),
        .I2(sig_last_dbeat_reg_n_0),
        .I3(sig_next_last_strb_reg[0]),
        .I4(sig_first_dbeat_reg_n_0),
        .I5(sig_next_strt_strb_reg[0]),
        .O(sig_halt_reg_reg_0[0]));
  LUT6 #(
    .INIT(64'hFFFFFFEFEEEEFFEF)) 
    \sig_strb_skid_reg[1]_i_1 
       (.I0(sig_data2addr_stop_req),
        .I1(sig_sstrb_stop_mask),
        .I2(sig_last_dbeat_reg_n_0),
        .I3(sig_next_last_strb_reg[1]),
        .I4(sig_first_dbeat_reg_n_0),
        .I5(sig_next_strt_strb_reg[1]),
        .O(sig_halt_reg_reg_0[1]));
  LUT6 #(
    .INIT(64'hFFFFFFEFEEEEFFEF)) 
    \sig_strb_skid_reg[2]_i_1 
       (.I0(sig_data2addr_stop_req),
        .I1(sig_sstrb_stop_mask),
        .I2(sig_last_dbeat_reg_n_0),
        .I3(sig_next_last_strb_reg[2]),
        .I4(sig_first_dbeat_reg_n_0),
        .I5(sig_next_strt_strb_reg[2]),
        .O(sig_halt_reg_reg_0[2]));
  LUT6 #(
    .INIT(64'hFFFFFFEFEEEEFFEF)) 
    \sig_strb_skid_reg[3]_i_1 
       (.I0(sig_data2addr_stop_req),
        .I1(sig_sstrb_stop_mask),
        .I2(sig_last_dbeat_reg_n_0),
        .I3(sig_next_last_strb_reg[3]),
        .I4(sig_first_dbeat_reg_n_0),
        .I5(sig_next_strt_strb_reg[3]),
        .O(sig_halt_reg_reg_0[3]));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_reset
   (sig_cmd_stat_rst_int_reg_n_reg_0,
    sig_mmap_rst_reg_n_reg_0,
    sig_stream_rst_reg_n_reg_0,
    sig_s_h_halt_reg,
    SR,
    sig_mmap_rst_reg_n_reg_1,
    sig_stream_rst_reg_n_reg_1,
    s2mm_halt_cmplt,
    sig_cmd_stat_rst_int_reg_n_reg_1,
    m_axi_s2mm_aclk,
    sig_s_h_halt_reg_reg_0,
    sig_data2addr_stop_req,
    sig_addr2wsc_calc_error,
    sig_addr_reg_empty,
    sig_wsc2rst_stop_cmplt,
    sig_halt_cmplt_reg_0);
  output sig_cmd_stat_rst_int_reg_n_reg_0;
  output sig_mmap_rst_reg_n_reg_0;
  output sig_stream_rst_reg_n_reg_0;
  output sig_s_h_halt_reg;
  output [0:0]SR;
  output [0:0]sig_mmap_rst_reg_n_reg_1;
  output [0:0]sig_stream_rst_reg_n_reg_1;
  output s2mm_halt_cmplt;
  input sig_cmd_stat_rst_int_reg_n_reg_1;
  input m_axi_s2mm_aclk;
  input sig_s_h_halt_reg_reg_0;
  input sig_data2addr_stop_req;
  input sig_addr2wsc_calc_error;
  input sig_addr_reg_empty;
  input sig_wsc2rst_stop_cmplt;
  input sig_halt_cmplt_reg_0;

  wire [0:0]SR;
  wire m_axi_s2mm_aclk;
  wire s2mm_halt_cmplt;
  wire sig_addr2wsc_calc_error;
  wire sig_addr_reg_empty;
  wire sig_cmd_stat_rst_int_reg_n_reg_0;
  wire sig_cmd_stat_rst_int_reg_n_reg_1;
  (* RTL_KEEP = "true" *) wire sig_cmd_stat_rst_user_reg_n_cdc_from;
  wire sig_data2addr_stop_req;
  wire sig_halt_cmplt_i_2_n_0;
  wire sig_halt_cmplt_reg_0;
  wire sig_mmap_rst_reg_n_reg_0;
  wire [0:0]sig_mmap_rst_reg_n_reg_1;
  wire sig_s_h_halt_reg;
  wire sig_s_h_halt_reg_reg_0;
  wire sig_stream_rst_reg_n_reg_0;
  wire [0:0]sig_stream_rst_reg_n_reg_1;
  wire sig_wsc2rst_stop_cmplt;

  LUT1 #(
    .INIT(2'h1)) 
    \FSM_sequential_sm_scc_state[2]_i_1__0 
       (.I0(sig_mmap_rst_reg_n_reg_0),
        .O(sig_mmap_rst_reg_n_reg_1));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_cmd_stat_rst_int_reg_n_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_cmd_stat_rst_int_reg_n_reg_1),
        .Q(sig_cmd_stat_rst_int_reg_n_reg_0),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_cmd_stat_rst_user_reg_n_cdc_from_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_cmd_stat_rst_int_reg_n_reg_1),
        .Q(sig_cmd_stat_rst_user_reg_n_cdc_from),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    sig_halt_cmplt_i_1__0
       (.I0(sig_cmd_stat_rst_int_reg_n_reg_0),
        .O(SR));
  LUT6 #(
    .INIT(64'hFFFFFFFFA8000000)) 
    sig_halt_cmplt_i_2
       (.I0(sig_data2addr_stop_req),
        .I1(sig_addr2wsc_calc_error),
        .I2(sig_addr_reg_empty),
        .I3(sig_wsc2rst_stop_cmplt),
        .I4(sig_halt_cmplt_reg_0),
        .I5(s2mm_halt_cmplt),
        .O(sig_halt_cmplt_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_halt_cmplt_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_halt_cmplt_i_2_n_0),
        .Q(s2mm_halt_cmplt),
        .R(SR));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_mmap_rst_reg_n_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_cmd_stat_rst_int_reg_n_reg_1),
        .Q(sig_mmap_rst_reg_n_reg_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    sig_s_h_halt_reg_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_s_h_halt_reg_reg_0),
        .Q(sig_s_h_halt_reg),
        .R(SR));
  LUT1 #(
    .INIT(2'h1)) 
    \sig_strb_reg_out[3]_i_1 
       (.I0(sig_stream_rst_reg_n_reg_0),
        .O(sig_stream_rst_reg_n_reg_1));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_stream_rst_reg_n_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_cmd_stat_rst_int_reg_n_reg_1),
        .Q(sig_stream_rst_reg_n_reg_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_datamover_reset" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_reset_5
   (sig_cmd_stat_rst_int_reg_n,
    sig_rst2all_stop_request,
    SR,
    sig_mmap_rst_reg_n,
    sig_stream_rst_reg_n,
    sig_mmap_rst,
    sig_stream_rst_reg_n_reg_0,
    mm2s_halt_cmplt,
    out,
    m_axi_mm2s_aclk,
    sig_s_h_halt_reg_reg_0,
    sig_addr_reg_empty,
    sig_addr2rsc_calc_error,
    sig_data2addr_stop_req,
    sig_halt_cmplt_reg_0);
  output sig_cmd_stat_rst_int_reg_n;
  output sig_rst2all_stop_request;
  output [0:0]SR;
  output sig_mmap_rst_reg_n;
  output sig_stream_rst_reg_n;
  output sig_mmap_rst;
  output [0:0]sig_stream_rst_reg_n_reg_0;
  output mm2s_halt_cmplt;
  input out;
  input m_axi_mm2s_aclk;
  input sig_s_h_halt_reg_reg_0;
  input sig_addr_reg_empty;
  input sig_addr2rsc_calc_error;
  input sig_data2addr_stop_req;
  input sig_halt_cmplt_reg_0;

  wire [0:0]SR;
  wire m_axi_mm2s_aclk;
  wire mm2s_halt_cmplt;
  wire out;
  wire sig_addr2rsc_calc_error;
  wire sig_addr_reg_empty;
  wire sig_cmd_stat_rst_int_reg_n;
  (* RTL_KEEP = "true" *) wire sig_cmd_stat_rst_user_reg_n_cdc_from;
  wire sig_data2addr_stop_req;
  wire sig_halt_cmplt_i_2_n_0;
  wire sig_halt_cmplt_reg_0;
  wire sig_mmap_rst;
  wire sig_mmap_rst_reg_n;
  wire sig_rst2all_stop_request;
  wire sig_s_h_halt_reg_reg_0;
  wire sig_stream_rst_reg_n;
  wire [0:0]sig_stream_rst_reg_n_reg_0;

  LUT1 #(
    .INIT(2'h1)) 
    \FSM_sequential_sm_scc_state[2]_i_1 
       (.I0(sig_mmap_rst_reg_n),
        .O(sig_mmap_rst));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_cmd_stat_rst_int_reg_n_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(out),
        .Q(sig_cmd_stat_rst_int_reg_n),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_cmd_stat_rst_user_reg_n_cdc_from_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(out),
        .Q(sig_cmd_stat_rst_user_reg_n_cdc_from),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    sig_halt_cmplt_i_1
       (.I0(sig_cmd_stat_rst_int_reg_n),
        .O(SR));
  LUT5 #(
    .INIT(32'hFFFF00E0)) 
    sig_halt_cmplt_i_2
       (.I0(sig_addr_reg_empty),
        .I1(sig_addr2rsc_calc_error),
        .I2(sig_data2addr_stop_req),
        .I3(sig_halt_cmplt_reg_0),
        .I4(mm2s_halt_cmplt),
        .O(sig_halt_cmplt_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_halt_cmplt_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sig_halt_cmplt_i_2_n_0),
        .Q(mm2s_halt_cmplt),
        .R(SR));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_mmap_rst_reg_n_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(out),
        .Q(sig_mmap_rst_reg_n),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    sig_reset_reg_i_1
       (.I0(sig_stream_rst_reg_n),
        .O(sig_stream_rst_reg_n_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_s_h_halt_reg_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sig_s_h_halt_reg_reg_0),
        .Q(sig_rst2all_stop_request),
        .R(SR));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_stream_rst_reg_n_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(out),
        .Q(sig_stream_rst_reg_n),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_s2mm_basic_wrap
   (s_axis_s2mm_tready,
    m_axi_s2mm_wvalid,
    sig_s_h_halt_reg,
    m_axi_s2mm_awsize,
    m_axi_s2mm_awburst,
    m_axi_s2mm_awvalid,
    m_axi_s2mm_wlast,
    s_axis_s2mm_cmd_tready,
    \USE_SINGLE_REG.sig_regfifo_full_reg_reg ,
    s2mm_decerr_i,
    s2mm_interr_i,
    s2mm_slverr_i,
    m_axi_s2mm_bready,
    s2mm_halt_cmplt,
    m_axi_s2mm_awaddr,
    m_axi_s2mm_awlen,
    m_axi_s2mm_wdata,
    m_axi_s2mm_wstrb,
    sig_cmd_stat_rst_int_reg_n_reg,
    m_axi_s2mm_aclk,
    sig_s_h_halt_reg_reg,
    s2mm_sts_received,
    s_axis_s2mm_cmd_tvalid_split,
    m_axis_s2mm_sts_tready,
    m_axi_s2mm_bvalid,
    m_axi_s2mm_wready,
    s_axis_s2mm_tvalid,
    s_axis_s2mm_tlast,
    m_axi_s2mm_awready,
    s_axis_s2mm_tkeep,
    s_axis_s2mm_tdata,
    m_axi_s2mm_bresp,
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0] ,
    \USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95] );
  output s_axis_s2mm_tready;
  output m_axi_s2mm_wvalid;
  output sig_s_h_halt_reg;
  output [0:0]m_axi_s2mm_awsize;
  output [0:0]m_axi_s2mm_awburst;
  output m_axi_s2mm_awvalid;
  output m_axi_s2mm_wlast;
  output s_axis_s2mm_cmd_tready;
  output \USE_SINGLE_REG.sig_regfifo_full_reg_reg ;
  output s2mm_decerr_i;
  output s2mm_interr_i;
  output s2mm_slverr_i;
  output m_axi_s2mm_bready;
  output s2mm_halt_cmplt;
  output [63:0]m_axi_s2mm_awaddr;
  output [4:0]m_axi_s2mm_awlen;
  output [31:0]m_axi_s2mm_wdata;
  output [3:0]m_axi_s2mm_wstrb;
  input sig_cmd_stat_rst_int_reg_n_reg;
  input m_axi_s2mm_aclk;
  input sig_s_h_halt_reg_reg;
  input s2mm_sts_received;
  input s_axis_s2mm_cmd_tvalid_split;
  input m_axis_s2mm_sts_tready;
  input m_axi_s2mm_bvalid;
  input m_axi_s2mm_wready;
  input s_axis_s2mm_tvalid;
  input s_axis_s2mm_tlast;
  input m_axi_s2mm_awready;
  input [3:0]s_axis_s2mm_tkeep;
  input [31:0]s_axis_s2mm_tdata;
  input [1:0]m_axi_s2mm_bresp;
  input [0:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0] ;
  input [72:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95] ;

  wire \ENABLE_AXIS_SKID.I_S2MM_STRM_SKID_BUF_n_6 ;
  wire \GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.sig_wr_fifo ;
  wire \GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/sig_init_done ;
  wire \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.sig_wr_fifo ;
  wire \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_done ;
  wire \GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/USE_SINGLE_REG.sig_push_regfifo ;
  wire \GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO/USE_SRL_FIFO.sig_wr_fifo ;
  wire \GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO/sig_inhibit_rdy_n ;
  wire I_CMD_STATUS_n_10;
  wire I_CMD_STATUS_n_11;
  wire I_CMD_STATUS_n_12;
  wire I_CMD_STATUS_n_13;
  wire I_CMD_STATUS_n_14;
  wire I_CMD_STATUS_n_15;
  wire I_CMD_STATUS_n_16;
  wire I_CMD_STATUS_n_17;
  wire I_CMD_STATUS_n_18;
  wire I_CMD_STATUS_n_19;
  wire I_CMD_STATUS_n_20;
  wire I_CMD_STATUS_n_21;
  wire I_CMD_STATUS_n_22;
  wire I_CMD_STATUS_n_23;
  wire I_CMD_STATUS_n_24;
  wire I_CMD_STATUS_n_25;
  wire I_CMD_STATUS_n_26;
  wire I_CMD_STATUS_n_27;
  wire I_CMD_STATUS_n_28;
  wire I_CMD_STATUS_n_29;
  wire I_CMD_STATUS_n_30;
  wire I_CMD_STATUS_n_31;
  wire I_CMD_STATUS_n_32;
  wire I_CMD_STATUS_n_33;
  wire I_CMD_STATUS_n_34;
  wire I_CMD_STATUS_n_35;
  wire I_CMD_STATUS_n_36;
  wire I_CMD_STATUS_n_37;
  wire I_CMD_STATUS_n_38;
  wire I_CMD_STATUS_n_39;
  wire I_CMD_STATUS_n_40;
  wire I_CMD_STATUS_n_41;
  wire I_CMD_STATUS_n_42;
  wire I_CMD_STATUS_n_43;
  wire I_CMD_STATUS_n_44;
  wire I_CMD_STATUS_n_45;
  wire I_CMD_STATUS_n_46;
  wire I_CMD_STATUS_n_47;
  wire I_CMD_STATUS_n_48;
  wire I_CMD_STATUS_n_49;
  wire I_CMD_STATUS_n_50;
  wire I_CMD_STATUS_n_51;
  wire I_CMD_STATUS_n_52;
  wire I_CMD_STATUS_n_53;
  wire I_CMD_STATUS_n_54;
  wire I_CMD_STATUS_n_55;
  wire I_CMD_STATUS_n_56;
  wire I_CMD_STATUS_n_57;
  wire I_CMD_STATUS_n_58;
  wire I_CMD_STATUS_n_59;
  wire I_CMD_STATUS_n_60;
  wire I_CMD_STATUS_n_61;
  wire I_CMD_STATUS_n_62;
  wire I_CMD_STATUS_n_63;
  wire I_CMD_STATUS_n_64;
  wire I_CMD_STATUS_n_65;
  wire I_CMD_STATUS_n_66;
  wire I_CMD_STATUS_n_67;
  wire I_CMD_STATUS_n_68;
  wire I_CMD_STATUS_n_69;
  wire I_CMD_STATUS_n_70;
  wire I_CMD_STATUS_n_71;
  wire I_CMD_STATUS_n_72;
  wire I_CMD_STATUS_n_73;
  wire I_CMD_STATUS_n_74;
  wire I_CMD_STATUS_n_75;
  wire I_CMD_STATUS_n_76;
  wire I_CMD_STATUS_n_77;
  wire I_CMD_STATUS_n_78;
  wire I_CMD_STATUS_n_79;
  wire I_CMD_STATUS_n_8;
  wire I_CMD_STATUS_n_80;
  wire I_CMD_STATUS_n_9;
  wire I_RESET_n_0;
  wire I_RESET_n_1;
  wire I_RESET_n_2;
  wire I_WR_DATA_CNTL_n_12;
  wire I_WR_DATA_CNTL_n_20;
  wire I_WR_DATA_CNTL_n_21;
  wire I_WR_DATA_CNTL_n_22;
  wire I_WR_DATA_CNTL_n_23;
  wire I_WR_STATUS_CNTLR_n_11;
  wire I_WR_STATUS_CNTLR_n_12;
  wire I_WR_STATUS_CNTLR_n_16;
  wire I_WR_STATUS_CNTLR_n_18;
  wire I_WR_STATUS_CNTLR_n_19;
  wire I_WR_STATUS_CNTLR_n_3;
  wire [0:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0] ;
  wire [72:0]\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95] ;
  wire \USE_SINGLE_REG.sig_regfifo_full_reg_reg ;
  wire m_axi_s2mm_aclk;
  wire [63:0]m_axi_s2mm_awaddr;
  wire [0:0]m_axi_s2mm_awburst;
  wire [4:0]m_axi_s2mm_awlen;
  wire m_axi_s2mm_awready;
  wire [0:0]m_axi_s2mm_awsize;
  wire m_axi_s2mm_awvalid;
  wire m_axi_s2mm_bready;
  wire [1:0]m_axi_s2mm_bresp;
  wire m_axi_s2mm_bvalid;
  wire [31:0]m_axi_s2mm_wdata;
  wire m_axi_s2mm_wlast;
  wire m_axi_s2mm_wready;
  wire [3:0]m_axi_s2mm_wstrb;
  wire m_axi_s2mm_wvalid;
  wire m_axis_s2mm_sts_tready;
  wire p_0_in2_in;
  wire p_0_in3_in;
  wire p_0_in5_in;
  wire s2mm_decerr_i;
  wire s2mm_halt_cmplt;
  wire s2mm_interr_i;
  wire s2mm_slverr_i;
  wire s2mm_sts_received;
  wire s_axis_s2mm_cmd_tready;
  wire s_axis_s2mm_cmd_tvalid_split;
  wire [31:0]s_axis_s2mm_tdata;
  wire [3:0]s_axis_s2mm_tkeep;
  wire s_axis_s2mm_tlast;
  wire s_axis_s2mm_tready;
  wire s_axis_s2mm_tvalid;
  wire sig_addr2data_addr_posted;
  wire sig_addr2wsc_calc_error;
  wire sig_addr_reg_empty;
  wire sig_calc2dm_calc_err;
  wire sig_cmd2mstr_cmd_valid;
  wire sig_cmd_reg_empty;
  wire sig_cmd_stat_rst_int;
  wire sig_cmd_stat_rst_int_reg_n_reg;
  wire sig_coelsc_tag_reg0;
  wire sig_data2addr_stop_req;
  wire sig_data2all_tlast_error;
  wire sig_data2skid_halt;
  wire sig_data2skid_wlast;
  wire [3:0]sig_data2skid_wstrb;
  wire sig_data2skid_wvalid;
  wire sig_data2wsc_calc_err;
  wire sig_data2wsc_cmd_cmplt;
  wire sig_data2wsc_last_err;
  wire [31:0]sig_data_reg_out;
  wire sig_data_reg_out_en;
  wire sig_dbeat_cntr_eq_0;
  wire sig_halt_reg;
  wire sig_halt_reg_dly2;
  wire sig_halt_reg_dly3;
  wire sig_last_skid_mux_out;
  wire sig_last_skid_reg;
  wire sig_mmap_rst;
  wire [63:2]sig_mstr2addr_addr;
  wire [0:0]sig_mstr2addr_burst;
  wire sig_mstr2addr_cmd_valid;
  wire sig_mstr2data_cmd_valid;
  wire sig_mstr2data_eof;
  wire [3:1]sig_mstr2data_last_strb;
  wire [4:0]sig_mstr2data_len;
  wire [1:0]sig_mstr2data_saddr_lsb;
  wire sig_mvalid_stop;
  wire sig_next_eof_reg;
  wire sig_push_to_wsc;
  wire sig_s_h_halt_reg;
  wire sig_s_h_halt_reg_reg;
  wire sig_skid2data_wready;
  wire sig_stat2wsc_status_ready;
  wire sig_stop_request;
  wire [3:0]sig_strb_skid_mux_out;
  wire [3:0]sig_strb_skid_reg;
  wire sig_stream_rst;
  wire sig_tlast_err_stop;
  wire sig_wdc_status_going_full;
  wire sig_wsc2rst_stop_cmplt;
  wire [6:4]sig_wsc2stat_status;
  wire sig_wsc2stat_status_valid;
  wire skid2wdc_wvalid;
  wire sm_scc_sm_ready;
  wire wdc2skid_wready;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_skid_buf \ENABLE_AXIS_SKID.I_S2MM_STRM_SKID_BUF 
       (.E(sig_data_reg_out_en),
        .Q({I_WR_DATA_CNTL_n_20,I_WR_DATA_CNTL_n_21,I_WR_DATA_CNTL_n_22,I_WR_DATA_CNTL_n_23}),
        .SR(sig_mmap_rst),
        .m_axi_s2mm_aclk(m_axi_s2mm_aclk),
        .out(p_0_in5_in),
        .s_axis_s2mm_tdata(s_axis_s2mm_tdata),
        .s_axis_s2mm_tkeep(s_axis_s2mm_tkeep),
        .s_axis_s2mm_tlast(s_axis_s2mm_tlast),
        .s_axis_s2mm_tready(s_axis_s2mm_tready),
        .s_axis_s2mm_tvalid(s_axis_s2mm_tvalid),
        .sig_data2skid_halt(sig_data2skid_halt),
        .\sig_data_reg_out_reg[0]_0 (I_RESET_n_1),
        .\sig_data_reg_out_reg[31]_0 (sig_data_reg_out),
        .sig_dbeat_cntr_eq_0(sig_dbeat_cntr_eq_0),
        .sig_halt_reg_dly2(sig_halt_reg_dly2),
        .sig_halt_reg_dly3(sig_halt_reg_dly3),
        .sig_last_reg_out_reg_0(\ENABLE_AXIS_SKID.I_S2MM_STRM_SKID_BUF_n_6 ),
        .sig_m_valid_dup_reg_0(p_0_in2_in),
        .sig_m_valid_out_reg_0(skid2wdc_wvalid),
        .sig_m_valid_out_reg_1(I_WR_STATUS_CNTLR_n_18),
        .sig_mvalid_stop(sig_mvalid_stop),
        .sig_next_eof_reg(sig_next_eof_reg),
        .sig_s_ready_dup_reg_0(I_WR_STATUS_CNTLR_n_16),
        .sig_sready_stop_reg_reg_0(I_WR_STATUS_CNTLR_n_19),
        .sig_stop_request(sig_stop_request),
        .wdc2skid_wready(wdc2skid_wready));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_addr_cntl__parameterized0 I_ADDR_CNTL
       (.SR(sig_mmap_rst),
        .\USE_SRL_FIFO.sig_wr_fifo (\GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.sig_wr_fifo ),
        .in({sig_calc2dm_calc_err,sig_mstr2addr_burst,sig_mstr2data_len,sig_mstr2addr_addr,sig_mstr2data_saddr_lsb}),
        .m_axi_s2mm_aclk(m_axi_s2mm_aclk),
        .m_axi_s2mm_awaddr(m_axi_s2mm_awaddr),
        .m_axi_s2mm_awburst(m_axi_s2mm_awburst),
        .m_axi_s2mm_awlen(m_axi_s2mm_awlen),
        .m_axi_s2mm_awready(m_axi_s2mm_awready),
        .m_axi_s2mm_awsize(m_axi_s2mm_awsize),
        .m_axi_s2mm_awvalid(m_axi_s2mm_awvalid),
        .out(sig_addr2data_addr_posted),
        .sig_addr2wsc_calc_error(sig_addr2wsc_calc_error),
        .sig_addr_reg_empty(sig_addr_reg_empty),
        .sig_data2all_tlast_error(sig_data2all_tlast_error),
        .sig_halt_reg(sig_halt_reg),
        .sig_init_done(\GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/sig_init_done ),
        .sig_init_done_reg(I_WR_STATUS_CNTLR_n_12),
        .sig_mstr2addr_cmd_valid(sig_mstr2addr_cmd_valid),
        .sig_posted_to_axi_reg_0(I_RESET_n_1));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_cmd_status I_CMD_STATUS
       (.D(sig_wsc2stat_status),
        .E(\GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/USE_SINGLE_REG.sig_push_regfifo ),
        .\GEN_OMIT_INDET_BTT.sig_coelsc_interr_reg_reg (I_RESET_n_1),
        .Q({I_CMD_STATUS_n_8,I_CMD_STATUS_n_9,I_CMD_STATUS_n_10,I_CMD_STATUS_n_11,I_CMD_STATUS_n_12,I_CMD_STATUS_n_13,I_CMD_STATUS_n_14,I_CMD_STATUS_n_15,I_CMD_STATUS_n_16,I_CMD_STATUS_n_17,I_CMD_STATUS_n_18,I_CMD_STATUS_n_19,I_CMD_STATUS_n_20,I_CMD_STATUS_n_21,I_CMD_STATUS_n_22,I_CMD_STATUS_n_23,I_CMD_STATUS_n_24,I_CMD_STATUS_n_25,I_CMD_STATUS_n_26,I_CMD_STATUS_n_27,I_CMD_STATUS_n_28,I_CMD_STATUS_n_29,I_CMD_STATUS_n_30,I_CMD_STATUS_n_31,I_CMD_STATUS_n_32,I_CMD_STATUS_n_33,I_CMD_STATUS_n_34,I_CMD_STATUS_n_35,I_CMD_STATUS_n_36,I_CMD_STATUS_n_37,I_CMD_STATUS_n_38,I_CMD_STATUS_n_39,I_CMD_STATUS_n_40,I_CMD_STATUS_n_41,I_CMD_STATUS_n_42,I_CMD_STATUS_n_43,I_CMD_STATUS_n_44,I_CMD_STATUS_n_45,I_CMD_STATUS_n_46,I_CMD_STATUS_n_47,I_CMD_STATUS_n_48,I_CMD_STATUS_n_49,I_CMD_STATUS_n_50,I_CMD_STATUS_n_51,I_CMD_STATUS_n_52,I_CMD_STATUS_n_53,I_CMD_STATUS_n_54,I_CMD_STATUS_n_55,I_CMD_STATUS_n_56,I_CMD_STATUS_n_57,I_CMD_STATUS_n_58,I_CMD_STATUS_n_59,I_CMD_STATUS_n_60,I_CMD_STATUS_n_61,I_CMD_STATUS_n_62,I_CMD_STATUS_n_63,I_CMD_STATUS_n_64,I_CMD_STATUS_n_65,I_CMD_STATUS_n_66,I_CMD_STATUS_n_67,I_CMD_STATUS_n_68,I_CMD_STATUS_n_69,I_CMD_STATUS_n_70,I_CMD_STATUS_n_71,I_CMD_STATUS_n_72,I_CMD_STATUS_n_73,I_CMD_STATUS_n_74,I_CMD_STATUS_n_75,I_CMD_STATUS_n_76,I_CMD_STATUS_n_77,I_CMD_STATUS_n_78,I_CMD_STATUS_n_79,I_CMD_STATUS_n_80}),
        .SR(sig_cmd_stat_rst_int),
        .\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0] (\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0] ),
        .\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95] (\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95] ),
        .\USE_SINGLE_REG.sig_regfifo_full_reg_reg (\USE_SINGLE_REG.sig_regfifo_full_reg_reg ),
        .m_axi_s2mm_aclk(m_axi_s2mm_aclk),
        .m_axis_s2mm_sts_tready(m_axis_s2mm_sts_tready),
        .s2mm_decerr_i(s2mm_decerr_i),
        .s2mm_interr_i(s2mm_interr_i),
        .s2mm_slverr_i(s2mm_slverr_i),
        .s2mm_sts_received(s2mm_sts_received),
        .s_axis_s2mm_cmd_tready(s_axis_s2mm_cmd_tready),
        .s_axis_s2mm_cmd_tvalid_split(s_axis_s2mm_cmd_tvalid_split),
        .sig_cmd2mstr_cmd_valid(sig_cmd2mstr_cmd_valid),
        .sig_cmd_reg_empty(sig_cmd_reg_empty),
        .sig_coelsc_tag_reg0(sig_coelsc_tag_reg0),
        .sig_init_done_reg(I_RESET_n_0),
        .sig_stat2wsc_status_ready(sig_stat2wsc_status_ready),
        .sig_wsc2stat_status_valid(sig_wsc2stat_status_valid),
        .sm_scc_sm_ready(sm_scc_sm_ready));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_scc I_MSTR_SCC
       (.Q({I_CMD_STATUS_n_8,I_CMD_STATUS_n_9,I_CMD_STATUS_n_10,I_CMD_STATUS_n_11,I_CMD_STATUS_n_12,I_CMD_STATUS_n_13,I_CMD_STATUS_n_14,I_CMD_STATUS_n_15,I_CMD_STATUS_n_16,I_CMD_STATUS_n_17,I_CMD_STATUS_n_18,I_CMD_STATUS_n_19,I_CMD_STATUS_n_20,I_CMD_STATUS_n_21,I_CMD_STATUS_n_22,I_CMD_STATUS_n_23,I_CMD_STATUS_n_24,I_CMD_STATUS_n_25,I_CMD_STATUS_n_26,I_CMD_STATUS_n_27,I_CMD_STATUS_n_28,I_CMD_STATUS_n_29,I_CMD_STATUS_n_30,I_CMD_STATUS_n_31,I_CMD_STATUS_n_32,I_CMD_STATUS_n_33,I_CMD_STATUS_n_34,I_CMD_STATUS_n_35,I_CMD_STATUS_n_36,I_CMD_STATUS_n_37,I_CMD_STATUS_n_38,I_CMD_STATUS_n_39,I_CMD_STATUS_n_40,I_CMD_STATUS_n_41,I_CMD_STATUS_n_42,I_CMD_STATUS_n_43,I_CMD_STATUS_n_44,I_CMD_STATUS_n_45,I_CMD_STATUS_n_46,I_CMD_STATUS_n_47,I_CMD_STATUS_n_48,I_CMD_STATUS_n_49,I_CMD_STATUS_n_50,I_CMD_STATUS_n_51,I_CMD_STATUS_n_52,I_CMD_STATUS_n_53,I_CMD_STATUS_n_54,I_CMD_STATUS_n_55,I_CMD_STATUS_n_56,I_CMD_STATUS_n_57,I_CMD_STATUS_n_58,I_CMD_STATUS_n_59,I_CMD_STATUS_n_60,I_CMD_STATUS_n_61,I_CMD_STATUS_n_62,I_CMD_STATUS_n_63,I_CMD_STATUS_n_64,I_CMD_STATUS_n_65,I_CMD_STATUS_n_66,I_CMD_STATUS_n_67,I_CMD_STATUS_n_68,I_CMD_STATUS_n_69,I_CMD_STATUS_n_70,I_CMD_STATUS_n_71,I_CMD_STATUS_n_72,I_CMD_STATUS_n_73,I_CMD_STATUS_n_74,I_CMD_STATUS_n_75,I_CMD_STATUS_n_76,I_CMD_STATUS_n_77,I_CMD_STATUS_n_78,I_CMD_STATUS_n_79,I_CMD_STATUS_n_80}),
        .SR(sig_mmap_rst),
        .\USE_SRL_FIFO.sig_wr_fifo (\GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.sig_wr_fifo ),
        .\USE_SRL_FIFO.sig_wr_fifo_0 (\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.sig_wr_fifo ),
        .in({sig_calc2dm_calc_err,sig_mstr2addr_burst,sig_mstr2data_len,sig_mstr2addr_addr,sig_mstr2data_saddr_lsb}),
        .m_axi_s2mm_aclk(m_axi_s2mm_aclk),
        .sig_cmd2mstr_cmd_valid(sig_cmd2mstr_cmd_valid),
        .sig_cmd_reg_empty(sig_cmd_reg_empty),
        .sig_input_eof_reg_reg_0({sig_mstr2data_eof,sig_mstr2data_last_strb}),
        .sig_input_eof_reg_reg_1(I_RESET_n_1),
        .sig_mstr2addr_cmd_valid(sig_mstr2addr_cmd_valid),
        .sig_mstr2data_cmd_valid(sig_mstr2data_cmd_valid),
        .sm_scc_sm_ready(sm_scc_sm_ready));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_reset I_RESET
       (.SR(sig_cmd_stat_rst_int),
        .m_axi_s2mm_aclk(m_axi_s2mm_aclk),
        .s2mm_halt_cmplt(s2mm_halt_cmplt),
        .sig_addr2wsc_calc_error(sig_addr2wsc_calc_error),
        .sig_addr_reg_empty(sig_addr_reg_empty),
        .sig_cmd_stat_rst_int_reg_n_reg_0(I_RESET_n_0),
        .sig_cmd_stat_rst_int_reg_n_reg_1(sig_cmd_stat_rst_int_reg_n_reg),
        .sig_data2addr_stop_req(sig_data2addr_stop_req),
        .sig_halt_cmplt_reg_0(I_WR_DATA_CNTL_n_12),
        .sig_mmap_rst_reg_n_reg_0(I_RESET_n_1),
        .sig_mmap_rst_reg_n_reg_1(sig_mmap_rst),
        .sig_s_h_halt_reg(sig_s_h_halt_reg),
        .sig_s_h_halt_reg_reg_0(sig_s_h_halt_reg_reg),
        .sig_stream_rst_reg_n_reg_0(I_RESET_n_2),
        .sig_stream_rst_reg_n_reg_1(sig_stream_rst),
        .sig_wsc2rst_stop_cmplt(sig_wsc2rst_stop_cmplt));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_skid2mm_buf I_S2MM_MMAP_SKID_BUF
       (.D(sig_data_reg_out),
        .Q(sig_strb_skid_reg),
        .SR(sig_stream_rst),
        .m_axi_s2mm_aclk(m_axi_s2mm_aclk),
        .m_axi_s2mm_wdata(m_axi_s2mm_wdata),
        .m_axi_s2mm_wlast(m_axi_s2mm_wlast),
        .m_axi_s2mm_wready(m_axi_s2mm_wready),
        .m_axi_s2mm_wstrb(m_axi_s2mm_wstrb),
        .m_axi_s2mm_wvalid(m_axi_s2mm_wvalid),
        .out(p_0_in3_in),
        .sig_data2skid_wlast(sig_data2skid_wlast),
        .sig_data2skid_wvalid(sig_data2skid_wvalid),
        .sig_last_skid_mux_out(sig_last_skid_mux_out),
        .sig_last_skid_reg(sig_last_skid_reg),
        .sig_m_valid_out_reg_0(I_RESET_n_2),
        .sig_s_ready_out_reg_0(sig_skid2data_wready),
        .\sig_strb_reg_out_reg[3]_0 (sig_strb_skid_mux_out),
        .\sig_strb_skid_reg_reg[3]_0 (sig_data2skid_wstrb));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_wrdata_cntl I_WR_DATA_CNTL
       (.E(sig_data_reg_out_en),
        .\GEN_OMIT_INDET_BTT.sig_tlast_err_stop_reg_0 (I_WR_STATUS_CNTLR_n_3),
        .Q({I_WR_DATA_CNTL_n_20,I_WR_DATA_CNTL_n_21,I_WR_DATA_CNTL_n_22,I_WR_DATA_CNTL_n_23}),
        .\USE_SRL_FIFO.sig_wr_fifo (\GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO/USE_SRL_FIFO.sig_wr_fifo ),
        .\USE_SRL_FIFO.sig_wr_fifo_0 (\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.sig_wr_fifo ),
        .\addr_i_reg[2] (sig_mmap_rst),
        .in({sig_data2wsc_calc_err,sig_data2wsc_last_err,sig_data2wsc_cmd_cmplt}),
        .m_axi_s2mm_aclk(m_axi_s2mm_aclk),
        .out(sig_addr2data_addr_posted),
        .\sig_addr_posted_cntr_reg[0]_0 (I_WR_DATA_CNTL_n_12),
        .sig_data2all_tlast_error(sig_data2all_tlast_error),
        .sig_data2skid_wlast(sig_data2skid_wlast),
        .sig_data2skid_wvalid(sig_data2skid_wvalid),
        .sig_data2wsc_cmd_cmplt_reg_0(\ENABLE_AXIS_SKID.I_S2MM_STRM_SKID_BUF_n_6 ),
        .sig_dbeat_cntr_eq_0(sig_dbeat_cntr_eq_0),
        .sig_halt_reg(sig_halt_reg),
        .sig_halt_reg_dly3(sig_halt_reg_dly3),
        .sig_inhibit_rdy_n(\GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO/sig_inhibit_rdy_n ),
        .sig_init_done(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_done ),
        .sig_init_done_reg(I_WR_STATUS_CNTLR_n_11),
        .sig_last_dbeat_reg_0(sig_strb_skid_mux_out),
        .sig_last_dbeat_reg_1(sig_data2skid_wstrb),
        .sig_last_dbeat_reg_2(I_RESET_n_1),
        .sig_last_reg_out_reg(p_0_in2_in),
        .sig_last_reg_out_reg_0(sig_skid2data_wready),
        .sig_last_reg_out_reg_1(p_0_in3_in),
        .sig_last_skid_mux_out(sig_last_skid_mux_out),
        .sig_last_skid_reg(sig_last_skid_reg),
        .sig_mstr2data_cmd_valid(sig_mstr2data_cmd_valid),
        .sig_next_calc_error_reg_i_3_0(skid2wdc_wvalid),
        .sig_next_calc_error_reg_reg_0({sig_calc2dm_calc_err,sig_mstr2data_eof,sig_mstr2data_last_strb,sig_mstr2data_len}),
        .sig_next_eof_reg(sig_next_eof_reg),
        .sig_push_to_wsc(sig_push_to_wsc),
        .sig_stat2wsc_status_ready(sig_stat2wsc_status_ready),
        .\sig_strb_reg_out_reg[3] (sig_strb_skid_reg),
        .sig_tlast_err_stop(sig_tlast_err_stop),
        .sig_wdc_status_going_full(sig_wdc_status_going_full),
        .sig_wsc2stat_status_valid(sig_wsc2stat_status_valid),
        .wdc2skid_wready(wdc2skid_wready));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_wr_status_cntl I_WR_STATUS_CNTLR
       (.D(sig_wsc2stat_status),
        .E(\GEN_INCLUDE_STATUS_FIFO.I_STS_FIFO/USE_SINGLE_REG.sig_push_regfifo ),
        .FIFO_Full_reg(I_WR_STATUS_CNTLR_n_3),
        .\USE_SRL_FIFO.sig_wr_fifo (\GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO/USE_SRL_FIFO.sig_wr_fifo ),
        .\addr_i_reg[3] (sig_mmap_rst),
        .in({sig_data2wsc_calc_err,sig_data2wsc_last_err,sig_data2wsc_cmd_cmplt}),
        .m_axi_s2mm_aclk(m_axi_s2mm_aclk),
        .m_axi_s2mm_bready(m_axi_s2mm_bready),
        .m_axi_s2mm_bresp(m_axi_s2mm_bresp),
        .m_axi_s2mm_bvalid(m_axi_s2mm_bvalid),
        .out(sig_addr2data_addr_posted),
        .s_axis_s2mm_tvalid(s_axis_s2mm_tvalid),
        .sig_addr2wsc_calc_error(sig_addr2wsc_calc_error),
        .sig_coelsc_tag_reg0(sig_coelsc_tag_reg0),
        .sig_data2addr_stop_req(sig_data2addr_stop_req),
        .sig_data2all_tlast_error(sig_data2all_tlast_error),
        .sig_data2skid_halt(sig_data2skid_halt),
        .sig_halt_reg(sig_halt_reg),
        .sig_halt_reg_dly2(sig_halt_reg_dly2),
        .sig_halt_reg_dly3(sig_halt_reg_dly3),
        .sig_halt_reg_dly3_reg_0(I_WR_STATUS_CNTLR_n_19),
        .sig_inhibit_rdy_n(\GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO/sig_inhibit_rdy_n ),
        .sig_init_done(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/sig_init_done ),
        .sig_init_done_0(\GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/sig_init_done ),
        .sig_init_done_reg(I_RESET_n_1),
        .sig_init_reg_reg(I_WR_STATUS_CNTLR_n_16),
        .sig_init_reg_reg_0(I_WR_STATUS_CNTLR_n_18),
        .sig_mmap_rst_reg_n_reg(I_WR_STATUS_CNTLR_n_11),
        .sig_mmap_rst_reg_n_reg_0(I_WR_STATUS_CNTLR_n_12),
        .sig_mvalid_stop(sig_mvalid_stop),
        .sig_push_to_wsc(sig_push_to_wsc),
        .sig_s_h_halt_reg(sig_s_h_halt_reg),
        .sig_s_ready_dup_reg(p_0_in2_in),
        .sig_s_ready_dup_reg_0(p_0_in5_in),
        .sig_stat2wsc_status_ready(sig_stat2wsc_status_ready),
        .sig_stop_request(sig_stop_request),
        .sig_tlast_err_stop(sig_tlast_err_stop),
        .sig_wdc_status_going_full(sig_wdc_status_going_full),
        .sig_wsc2rst_stop_cmplt(sig_wsc2rst_stop_cmplt),
        .sig_wsc2stat_status_valid(sig_wsc2stat_status_valid),
        .wdc2skid_wready(wdc2skid_wready));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_scc
   (sm_scc_sm_ready,
    sig_cmd_reg_empty,
    in,
    sig_input_eof_reg_reg_0,
    sig_mstr2data_cmd_valid,
    sig_mstr2addr_cmd_valid,
    SR,
    m_axi_s2mm_aclk,
    Q,
    sig_cmd2mstr_cmd_valid,
    sig_input_eof_reg_reg_1,
    \USE_SRL_FIFO.sig_wr_fifo ,
    \USE_SRL_FIFO.sig_wr_fifo_0 );
  output sm_scc_sm_ready;
  output sig_cmd_reg_empty;
  output [70:0]in;
  output [3:0]sig_input_eof_reg_reg_0;
  output sig_mstr2data_cmd_valid;
  output sig_mstr2addr_cmd_valid;
  input [0:0]SR;
  input m_axi_s2mm_aclk;
  input [72:0]Q;
  input sig_cmd2mstr_cmd_valid;
  input sig_input_eof_reg_reg_1;
  input \USE_SRL_FIFO.sig_wr_fifo ;
  input \USE_SRL_FIFO.sig_wr_fifo_0 ;

  wire \FSM_sequential_sm_scc_state[0]_i_2__0_n_0 ;
  wire [72:0]Q;
  wire [0:0]SR;
  wire \USE_SRL_FIFO.sig_wr_fifo ;
  wire \USE_SRL_FIFO.sig_wr_fifo_0 ;
  wire \data_reg[3][19]_srl4_i_2__0_n_0 ;
  wire \data_reg[3][20]_srl4_i_2__0_n_0 ;
  wire [70:0]in;
  wire m_axi_s2mm_aclk;
  wire sig_btt_is_zero;
  wire sig_btt_is_zero_reg;
  wire sig_btt_is_zero_reg_i_4_n_0;
  wire sig_cmd2addr_valid_i_1__0_n_0;
  wire sig_cmd2data_valid_i_1__0_n_0;
  wire sig_cmd2mstr_cmd_valid;
  wire sig_cmd_btt_reg0;
  wire \sig_cmd_btt_reg_reg_n_0_[0] ;
  wire \sig_cmd_btt_reg_reg_n_0_[1] ;
  wire \sig_cmd_btt_reg_reg_n_0_[2] ;
  wire \sig_cmd_btt_reg_reg_n_0_[3] ;
  wire \sig_cmd_btt_reg_reg_n_0_[4] ;
  wire \sig_cmd_btt_reg_reg_n_0_[5] ;
  wire \sig_cmd_btt_reg_reg_n_0_[6] ;
  wire sig_cmd_reg_empty;
  wire sig_cmd_reg_full;
  wire [3:0]sig_input_eof_reg_reg_0;
  wire sig_input_eof_reg_reg_1;
  wire sig_load_input_cmd;
  wire sig_mstr2addr_cmd_valid;
  wire sig_mstr2data_cmd_valid;
  wire sm_pop_input_cmd;
  wire sm_pop_input_cmd_ns;
  wire sm_scc_sm_ready;
  wire sm_scc_sm_ready_ns;
  wire [2:0]sm_scc_state;
  wire [2:0]sm_scc_state_ns;
  wire sm_set_error_ns;

  LUT5 #(
    .INIT(32'hFFFFF010)) 
    \FSM_sequential_sm_scc_state[0]_i_1__0 
       (.I0(sig_mstr2addr_cmd_valid),
        .I1(sig_mstr2data_cmd_valid),
        .I2(sm_scc_state[2]),
        .I3(sm_scc_state[0]),
        .I4(\FSM_sequential_sm_scc_state[0]_i_2__0_n_0 ),
        .O(sm_scc_state_ns[0]));
  LUT6 #(
    .INIT(64'h00000000E3E0EFEC)) 
    \FSM_sequential_sm_scc_state[0]_i_2__0 
       (.I0(sig_btt_is_zero_reg),
        .I1(sm_scc_state[0]),
        .I2(sm_scc_state[1]),
        .I3(sig_cmd2mstr_cmd_valid),
        .I4(sig_cmd_reg_full),
        .I5(sm_scc_state[2]),
        .O(\FSM_sequential_sm_scc_state[0]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT5 #(
    .INIT(32'h0000FC88)) 
    \FSM_sequential_sm_scc_state[1]_i_1__0 
       (.I0(sig_cmd_reg_full),
        .I1(sm_scc_state[0]),
        .I2(sig_btt_is_zero_reg),
        .I3(sm_scc_state[1]),
        .I4(sm_scc_state[2]),
        .O(sm_scc_state_ns[1]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'h0F02)) 
    \FSM_sequential_sm_scc_state[2]_i_2__0 
       (.I0(sm_scc_state[1]),
        .I1(sig_btt_is_zero_reg),
        .I2(sm_scc_state[0]),
        .I3(sm_scc_state[2]),
        .O(sm_scc_state_ns[2]));
  (* FSM_ENCODED_STATES = "init:000,get_nxt_cmd:001,chk_and_calc:010,error_trap:011,pop_recover:101,push_to_axi:100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_sm_scc_state_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sm_scc_state_ns[0]),
        .Q(sm_scc_state[0]),
        .R(SR));
  (* FSM_ENCODED_STATES = "init:000,get_nxt_cmd:001,chk_and_calc:010,error_trap:011,pop_recover:101,push_to_axi:100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_sm_scc_state_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sm_scc_state_ns[1]),
        .Q(sm_scc_state[1]),
        .R(SR));
  (* FSM_ENCODED_STATES = "init:000,get_nxt_cmd:001,chk_and_calc:010,error_trap:011,pop_recover:101,push_to_axi:100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_sm_scc_state_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sm_scc_state_ns[2]),
        .Q(sm_scc_state[2]),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \data_reg[3][18]_srl4_i_1__0 
       (.I0(sig_btt_is_zero_reg),
        .I1(\sig_cmd_btt_reg_reg_n_0_[5] ),
        .I2(\data_reg[3][19]_srl4_i_2__0_n_0 ),
        .I3(\sig_cmd_btt_reg_reg_n_0_[0] ),
        .I4(\sig_cmd_btt_reg_reg_n_0_[1] ),
        .I5(\sig_cmd_btt_reg_reg_n_0_[6] ),
        .O(in[68]));
  LUT6 #(
    .INIT(64'hFFFFFFF4F0F0F0F1)) 
    \data_reg[3][19]_srl4_i_1__0 
       (.I0(sig_btt_is_zero_reg),
        .I1(\data_reg[3][19]_srl4_i_2__0_n_0 ),
        .I2(\sig_cmd_btt_reg_reg_n_0_[6] ),
        .I3(\sig_cmd_btt_reg_reg_n_0_[1] ),
        .I4(\sig_cmd_btt_reg_reg_n_0_[0] ),
        .I5(\sig_cmd_btt_reg_reg_n_0_[5] ),
        .O(in[67]));
  LUT3 #(
    .INIT(8'hFE)) 
    \data_reg[3][19]_srl4_i_2__0 
       (.I0(\sig_cmd_btt_reg_reg_n_0_[3] ),
        .I1(\sig_cmd_btt_reg_reg_n_0_[2] ),
        .I2(\sig_cmd_btt_reg_reg_n_0_[4] ),
        .O(\data_reg[3][19]_srl4_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF54FF00FF01)) 
    \data_reg[3][20]_srl4_i_1__1 
       (.I0(sig_btt_is_zero_reg),
        .I1(\sig_cmd_btt_reg_reg_n_0_[2] ),
        .I2(\sig_cmd_btt_reg_reg_n_0_[3] ),
        .I3(\sig_cmd_btt_reg_reg_n_0_[6] ),
        .I4(\data_reg[3][20]_srl4_i_2__0_n_0 ),
        .I5(\sig_cmd_btt_reg_reg_n_0_[4] ),
        .O(in[66]));
  LUT2 #(
    .INIT(4'hE)) 
    \data_reg[3][20]_srl4_i_2__0 
       (.I0(\sig_cmd_btt_reg_reg_n_0_[0] ),
        .I1(\sig_cmd_btt_reg_reg_n_0_[1] ),
        .O(\data_reg[3][20]_srl4_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFF4F0F0F0F1)) 
    \data_reg[3][21]_srl4_i_1__0 
       (.I0(sig_btt_is_zero_reg),
        .I1(\sig_cmd_btt_reg_reg_n_0_[2] ),
        .I2(\sig_cmd_btt_reg_reg_n_0_[6] ),
        .I3(\sig_cmd_btt_reg_reg_n_0_[1] ),
        .I4(\sig_cmd_btt_reg_reg_n_0_[0] ),
        .I5(\sig_cmd_btt_reg_reg_n_0_[3] ),
        .O(in[65]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT5 #(
    .INIT(32'hEEEAEEEB)) 
    \data_reg[3][22]_srl4_i_1__0 
       (.I0(\sig_cmd_btt_reg_reg_n_0_[6] ),
        .I1(\sig_cmd_btt_reg_reg_n_0_[2] ),
        .I2(\sig_cmd_btt_reg_reg_n_0_[1] ),
        .I3(\sig_cmd_btt_reg_reg_n_0_[0] ),
        .I4(sig_btt_is_zero_reg),
        .O(in[64]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hAB)) 
    \data_reg[3][5]_srl4_i_1 
       (.I0(\sig_cmd_btt_reg_reg_n_0_[6] ),
        .I1(\sig_cmd_btt_reg_reg_n_0_[1] ),
        .I2(\sig_cmd_btt_reg_reg_n_0_[0] ),
        .O(sig_input_eof_reg_reg_0[2]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hF9)) 
    \data_reg[3][6]_srl4_i_1 
       (.I0(\sig_cmd_btt_reg_reg_n_0_[1] ),
        .I1(\sig_cmd_btt_reg_reg_n_0_[0] ),
        .I2(\sig_cmd_btt_reg_reg_n_0_[6] ),
        .O(sig_input_eof_reg_reg_0[1]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \data_reg[3][7]_srl4_i_1 
       (.I0(\sig_cmd_btt_reg_reg_n_0_[6] ),
        .I1(\sig_cmd_btt_reg_reg_n_0_[1] ),
        .I2(\sig_cmd_btt_reg_reg_n_0_[0] ),
        .O(sig_input_eof_reg_reg_0[0]));
  LUT2 #(
    .INIT(4'hB)) 
    sig_btt_is_zero_reg_i_1__0
       (.I0(sm_pop_input_cmd),
        .I1(sig_input_eof_reg_reg_1),
        .O(sig_cmd_btt_reg0));
  LUT3 #(
    .INIT(8'h80)) 
    sig_btt_is_zero_reg_i_2__0
       (.I0(sig_cmd2mstr_cmd_valid),
        .I1(sm_scc_sm_ready),
        .I2(sig_cmd_reg_empty),
        .O(sig_load_input_cmd));
  LUT4 #(
    .INIT(16'h0001)) 
    sig_btt_is_zero_reg_i_3
       (.I0(Q[6]),
        .I1(Q[4]),
        .I2(Q[5]),
        .I3(sig_btt_is_zero_reg_i_4_n_0),
        .O(sig_btt_is_zero));
  LUT4 #(
    .INIT(16'hFFFE)) 
    sig_btt_is_zero_reg_i_4
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(sig_btt_is_zero_reg_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_btt_is_zero_reg_reg
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(sig_btt_is_zero),
        .Q(sig_btt_is_zero_reg),
        .R(sig_cmd_btt_reg0));
  LUT6 #(
    .INIT(64'h00000000AAAA0020)) 
    sig_cmd2addr_valid_i_1__0
       (.I0(sig_input_eof_reg_reg_1),
        .I1(sm_scc_state[0]),
        .I2(sm_scc_state[1]),
        .I3(sm_scc_state[2]),
        .I4(sig_mstr2addr_cmd_valid),
        .I5(\USE_SRL_FIFO.sig_wr_fifo ),
        .O(sig_cmd2addr_valid_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_cmd2addr_valid_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_cmd2addr_valid_i_1__0_n_0),
        .Q(sig_mstr2addr_cmd_valid),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000AAAA0020)) 
    sig_cmd2data_valid_i_1__0
       (.I0(sig_input_eof_reg_reg_1),
        .I1(sm_scc_state[0]),
        .I2(sm_scc_state[1]),
        .I3(sm_scc_state[2]),
        .I4(sig_mstr2data_cmd_valid),
        .I5(\USE_SRL_FIFO.sig_wr_fifo_0 ),
        .O(sig_cmd2data_valid_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_cmd2data_valid_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_cmd2data_valid_i_1__0_n_0),
        .Q(sig_mstr2data_cmd_valid),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[9]),
        .Q(in[0]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[10] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[19]),
        .Q(in[10]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[11] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[20]),
        .Q(in[11]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[12] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[21]),
        .Q(in[12]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[13] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[22]),
        .Q(in[13]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[14] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[23]),
        .Q(in[14]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[15] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[24]),
        .Q(in[15]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[16] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[25]),
        .Q(in[16]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[17] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[26]),
        .Q(in[17]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[18] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[27]),
        .Q(in[18]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[19] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[28]),
        .Q(in[19]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[10]),
        .Q(in[1]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[20] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[29]),
        .Q(in[20]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[21] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[30]),
        .Q(in[21]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[22] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[31]),
        .Q(in[22]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[23] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[32]),
        .Q(in[23]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[24] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[33]),
        .Q(in[24]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[25] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[34]),
        .Q(in[25]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[26] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[35]),
        .Q(in[26]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[27] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[36]),
        .Q(in[27]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[28] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[37]),
        .Q(in[28]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[29] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[38]),
        .Q(in[29]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[11]),
        .Q(in[2]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[30] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[39]),
        .Q(in[30]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[31] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[40]),
        .Q(in[31]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[32] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[41]),
        .Q(in[32]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[33] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[42]),
        .Q(in[33]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[34] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[43]),
        .Q(in[34]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[35] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[44]),
        .Q(in[35]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[36] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[45]),
        .Q(in[36]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[37] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[46]),
        .Q(in[37]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[38] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[47]),
        .Q(in[38]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[39] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[48]),
        .Q(in[39]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[3] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[12]),
        .Q(in[3]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[40] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[49]),
        .Q(in[40]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[41] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[50]),
        .Q(in[41]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[42] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[51]),
        .Q(in[42]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[43] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[52]),
        .Q(in[43]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[44] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[53]),
        .Q(in[44]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[45] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[54]),
        .Q(in[45]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[46] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[55]),
        .Q(in[46]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[47] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[56]),
        .Q(in[47]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[48] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[57]),
        .Q(in[48]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[49] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[58]),
        .Q(in[49]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[4] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[13]),
        .Q(in[4]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[50] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[59]),
        .Q(in[50]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[51] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[60]),
        .Q(in[51]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[52] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[61]),
        .Q(in[52]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[53] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[62]),
        .Q(in[53]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[54] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[63]),
        .Q(in[54]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[55] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[64]),
        .Q(in[55]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[56] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[65]),
        .Q(in[56]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[57] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[66]),
        .Q(in[57]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[58] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[67]),
        .Q(in[58]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[59] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[68]),
        .Q(in[59]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[5] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[14]),
        .Q(in[5]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[60] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[69]),
        .Q(in[60]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[61] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[70]),
        .Q(in[61]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[62] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[71]),
        .Q(in[62]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[63] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[72]),
        .Q(in[63]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[6] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[15]),
        .Q(in[6]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[7] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[16]),
        .Q(in[7]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[8] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[17]),
        .Q(in[8]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[9] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[18]),
        .Q(in[9]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_btt_reg_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[0]),
        .Q(\sig_cmd_btt_reg_reg_n_0_[0] ),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_btt_reg_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[1]),
        .Q(\sig_cmd_btt_reg_reg_n_0_[1] ),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_btt_reg_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[2]),
        .Q(\sig_cmd_btt_reg_reg_n_0_[2] ),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_btt_reg_reg[3] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[3]),
        .Q(\sig_cmd_btt_reg_reg_n_0_[3] ),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_btt_reg_reg[4] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[4]),
        .Q(\sig_cmd_btt_reg_reg_n_0_[4] ),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_btt_reg_reg[5] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[5]),
        .Q(\sig_cmd_btt_reg_reg_n_0_[5] ),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_btt_reg_reg[6] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[6]),
        .Q(\sig_cmd_btt_reg_reg_n_0_[6] ),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_burst_reg_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[7]),
        .Q(in[69]),
        .R(sig_cmd_btt_reg0));
  FDSE #(
    .INIT(1'b0)) 
    sig_cmd_reg_empty_reg
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(1'b0),
        .Q(sig_cmd_reg_empty),
        .S(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    sig_cmd_reg_full_reg
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(1'b1),
        .Q(sig_cmd_reg_full),
        .R(sig_cmd_btt_reg0));
  FDRE sig_input_eof_reg_reg
       (.C(m_axi_s2mm_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[8]),
        .Q(sig_input_eof_reg_reg_0[3]),
        .R(sig_cmd_btt_reg0));
  LUT5 #(
    .INIT(32'h00000002)) 
    sm_pop_input_cmd_i_1__0
       (.I0(sm_scc_state[2]),
        .I1(sig_mstr2data_cmd_valid),
        .I2(sig_mstr2addr_cmd_valid),
        .I3(sm_scc_state[0]),
        .I4(sm_scc_state[1]),
        .O(sm_pop_input_cmd_ns));
  FDRE #(
    .INIT(1'b0)) 
    sm_pop_input_cmd_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sm_pop_input_cmd_ns),
        .Q(sm_pop_input_cmd),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'h5F5E)) 
    sm_scc_sm_ready_i_1__0
       (.I0(sm_scc_state[1]),
        .I1(sig_cmd2mstr_cmd_valid),
        .I2(sm_scc_state[2]),
        .I3(sm_scc_state[0]),
        .O(sm_scc_sm_ready_ns));
  FDRE #(
    .INIT(1'b0)) 
    sm_scc_sm_ready_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sm_scc_sm_ready_ns),
        .Q(sm_scc_sm_ready),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'h4440)) 
    sm_set_error_i_1__0
       (.I0(sm_scc_state[2]),
        .I1(sm_scc_state[1]),
        .I2(sig_btt_is_zero_reg),
        .I3(sm_scc_state[0]),
        .O(sm_set_error_ns));
  FDRE #(
    .INIT(1'b0)) 
    sm_set_error_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sm_set_error_ns),
        .Q(in[70]),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "axi_datamover_scc" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_scc_4
   (sm_scc_sm_ready,
    sig_cmd_reg_empty,
    in,
    sig_input_eof_reg_reg_0,
    sig_mstr2data_cmd_valid,
    sig_mstr2addr_cmd_valid,
    sig_mmap_rst,
    m_axi_mm2s_aclk,
    Q,
    sig_cmd2mstr_cmd_valid,
    sig_mmap_rst_reg_n,
    \USE_SRL_FIFO.sig_wr_fifo ,
    \USE_SRL_FIFO.sig_wr_fifo_0 );
  output sm_scc_sm_ready;
  output sig_cmd_reg_empty;
  output [70:0]in;
  output [3:0]sig_input_eof_reg_reg_0;
  output sig_mstr2data_cmd_valid;
  output sig_mstr2addr_cmd_valid;
  input sig_mmap_rst;
  input m_axi_mm2s_aclk;
  input [72:0]Q;
  input sig_cmd2mstr_cmd_valid;
  input sig_mmap_rst_reg_n;
  input \USE_SRL_FIFO.sig_wr_fifo ;
  input \USE_SRL_FIFO.sig_wr_fifo_0 ;

  wire \FSM_sequential_sm_scc_state[0]_i_2_n_0 ;
  wire [72:0]Q;
  wire \USE_SRL_FIFO.sig_wr_fifo ;
  wire \USE_SRL_FIFO.sig_wr_fifo_0 ;
  wire [4:0]data1;
  wire \data_reg[3][19]_srl4_i_2_n_0 ;
  wire \data_reg[3][20]_srl4_i_2_n_0 ;
  wire [70:0]in;
  wire m_axi_mm2s_aclk;
  wire sig_btt_is_zero;
  wire sig_btt_is_zero_reg;
  wire sig_btt_is_zero_reg_i_4_n_0;
  wire sig_cmd2addr_valid_i_1_n_0;
  wire sig_cmd2data_valid_i_1_n_0;
  wire sig_cmd2mstr_cmd_valid;
  wire sig_cmd_btt_reg0;
  wire \sig_cmd_btt_reg_reg_n_0_[0] ;
  wire \sig_cmd_btt_reg_reg_n_0_[1] ;
  wire sig_cmd_reg_empty;
  wire sig_cmd_reg_full;
  wire [3:0]sig_input_eof_reg_reg_0;
  wire sig_load_input_cmd;
  wire sig_mmap_rst;
  wire sig_mmap_rst_reg_n;
  wire sig_mstr2addr_cmd_valid;
  wire sig_mstr2data_cmd_valid;
  wire sm_pop_input_cmd;
  wire sm_pop_input_cmd_ns;
  wire sm_scc_sm_ready;
  wire sm_scc_sm_ready_ns;
  wire [2:0]sm_scc_state;
  wire [2:0]sm_scc_state_ns;
  wire sm_set_error_ns;

  LUT5 #(
    .INIT(32'hFFFFF010)) 
    \FSM_sequential_sm_scc_state[0]_i_1 
       (.I0(sig_mstr2addr_cmd_valid),
        .I1(sig_mstr2data_cmd_valid),
        .I2(sm_scc_state[2]),
        .I3(sm_scc_state[0]),
        .I4(\FSM_sequential_sm_scc_state[0]_i_2_n_0 ),
        .O(sm_scc_state_ns[0]));
  LUT6 #(
    .INIT(64'h00000000E3E0EFEC)) 
    \FSM_sequential_sm_scc_state[0]_i_2 
       (.I0(sig_btt_is_zero_reg),
        .I1(sm_scc_state[0]),
        .I2(sm_scc_state[1]),
        .I3(sig_cmd2mstr_cmd_valid),
        .I4(sig_cmd_reg_full),
        .I5(sm_scc_state[2]),
        .O(\FSM_sequential_sm_scc_state[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h0000FC88)) 
    \FSM_sequential_sm_scc_state[1]_i_1 
       (.I0(sig_cmd_reg_full),
        .I1(sm_scc_state[0]),
        .I2(sig_btt_is_zero_reg),
        .I3(sm_scc_state[1]),
        .I4(sm_scc_state[2]),
        .O(sm_scc_state_ns[1]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h0F02)) 
    \FSM_sequential_sm_scc_state[2]_i_2 
       (.I0(sm_scc_state[1]),
        .I1(sig_btt_is_zero_reg),
        .I2(sm_scc_state[0]),
        .I3(sm_scc_state[2]),
        .O(sm_scc_state_ns[2]));
  (* FSM_ENCODED_STATES = "init:000,get_nxt_cmd:001,chk_and_calc:010,error_trap:011,pop_recover:101,push_to_axi:100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_sm_scc_state_reg[0] 
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sm_scc_state_ns[0]),
        .Q(sm_scc_state[0]),
        .R(sig_mmap_rst));
  (* FSM_ENCODED_STATES = "init:000,get_nxt_cmd:001,chk_and_calc:010,error_trap:011,pop_recover:101,push_to_axi:100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_sm_scc_state_reg[1] 
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sm_scc_state_ns[1]),
        .Q(sm_scc_state[1]),
        .R(sig_mmap_rst));
  (* FSM_ENCODED_STATES = "init:000,get_nxt_cmd:001,chk_and_calc:010,error_trap:011,pop_recover:101,push_to_axi:100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_sm_scc_state_reg[2] 
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sm_scc_state_ns[2]),
        .Q(sm_scc_state[2]),
        .R(sig_mmap_rst));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hF9)) 
    \data_reg[3][10]_srl4_i_1 
       (.I0(\sig_cmd_btt_reg_reg_n_0_[1] ),
        .I1(\sig_cmd_btt_reg_reg_n_0_[0] ),
        .I2(data1[4]),
        .O(sig_input_eof_reg_reg_0[1]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \data_reg[3][11]_srl4_i_1 
       (.I0(data1[4]),
        .I1(\sig_cmd_btt_reg_reg_n_0_[1] ),
        .I2(\sig_cmd_btt_reg_reg_n_0_[0] ),
        .O(sig_input_eof_reg_reg_0[0]));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \data_reg[3][18]_srl4_i_1 
       (.I0(sig_btt_is_zero_reg),
        .I1(data1[3]),
        .I2(\data_reg[3][19]_srl4_i_2_n_0 ),
        .I3(\sig_cmd_btt_reg_reg_n_0_[0] ),
        .I4(\sig_cmd_btt_reg_reg_n_0_[1] ),
        .I5(data1[4]),
        .O(in[68]));
  LUT6 #(
    .INIT(64'hFFFFFFF4F0F0F0F1)) 
    \data_reg[3][19]_srl4_i_1 
       (.I0(sig_btt_is_zero_reg),
        .I1(\data_reg[3][19]_srl4_i_2_n_0 ),
        .I2(data1[4]),
        .I3(\sig_cmd_btt_reg_reg_n_0_[1] ),
        .I4(\sig_cmd_btt_reg_reg_n_0_[0] ),
        .I5(data1[3]),
        .O(in[67]));
  LUT3 #(
    .INIT(8'hFE)) 
    \data_reg[3][19]_srl4_i_2 
       (.I0(data1[1]),
        .I1(data1[0]),
        .I2(data1[2]),
        .O(\data_reg[3][19]_srl4_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF54FF00FF01)) 
    \data_reg[3][20]_srl4_i_1__0 
       (.I0(sig_btt_is_zero_reg),
        .I1(data1[0]),
        .I2(data1[1]),
        .I3(data1[4]),
        .I4(\data_reg[3][20]_srl4_i_2_n_0 ),
        .I5(data1[2]),
        .O(in[66]));
  LUT2 #(
    .INIT(4'hE)) 
    \data_reg[3][20]_srl4_i_2 
       (.I0(\sig_cmd_btt_reg_reg_n_0_[0] ),
        .I1(\sig_cmd_btt_reg_reg_n_0_[1] ),
        .O(\data_reg[3][20]_srl4_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFF4F0F0F0F1)) 
    \data_reg[3][21]_srl4_i_1 
       (.I0(sig_btt_is_zero_reg),
        .I1(data1[0]),
        .I2(data1[4]),
        .I3(\sig_cmd_btt_reg_reg_n_0_[1] ),
        .I4(\sig_cmd_btt_reg_reg_n_0_[0] ),
        .I5(data1[1]),
        .O(in[65]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'hEEEAEEEB)) 
    \data_reg[3][22]_srl4_i_1 
       (.I0(data1[4]),
        .I1(data1[0]),
        .I2(\sig_cmd_btt_reg_reg_n_0_[1] ),
        .I3(\sig_cmd_btt_reg_reg_n_0_[0] ),
        .I4(sig_btt_is_zero_reg),
        .O(in[64]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hAB)) 
    \data_reg[3][9]_srl4_i_1 
       (.I0(data1[4]),
        .I1(\sig_cmd_btt_reg_reg_n_0_[1] ),
        .I2(\sig_cmd_btt_reg_reg_n_0_[0] ),
        .O(sig_input_eof_reg_reg_0[2]));
  LUT2 #(
    .INIT(4'hB)) 
    sig_btt_is_zero_reg_i_1
       (.I0(sm_pop_input_cmd),
        .I1(sig_mmap_rst_reg_n),
        .O(sig_cmd_btt_reg0));
  LUT3 #(
    .INIT(8'h80)) 
    sig_btt_is_zero_reg_i_2
       (.I0(sig_cmd2mstr_cmd_valid),
        .I1(sm_scc_sm_ready),
        .I2(sig_cmd_reg_empty),
        .O(sig_load_input_cmd));
  LUT4 #(
    .INIT(16'h0001)) 
    sig_btt_is_zero_reg_i_3
       (.I0(Q[6]),
        .I1(Q[4]),
        .I2(Q[5]),
        .I3(sig_btt_is_zero_reg_i_4_n_0),
        .O(sig_btt_is_zero));
  LUT4 #(
    .INIT(16'hFFFE)) 
    sig_btt_is_zero_reg_i_4
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(sig_btt_is_zero_reg_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_btt_is_zero_reg_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(sig_btt_is_zero),
        .Q(sig_btt_is_zero_reg),
        .R(sig_cmd_btt_reg0));
  LUT6 #(
    .INIT(64'h00000000AAAA0020)) 
    sig_cmd2addr_valid_i_1
       (.I0(sig_mmap_rst_reg_n),
        .I1(sm_scc_state[0]),
        .I2(sm_scc_state[1]),
        .I3(sm_scc_state[2]),
        .I4(sig_mstr2addr_cmd_valid),
        .I5(\USE_SRL_FIFO.sig_wr_fifo ),
        .O(sig_cmd2addr_valid_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_cmd2addr_valid_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sig_cmd2addr_valid_i_1_n_0),
        .Q(sig_mstr2addr_cmd_valid),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000AAAA0020)) 
    sig_cmd2data_valid_i_1
       (.I0(sig_mmap_rst_reg_n),
        .I1(sm_scc_state[0]),
        .I2(sm_scc_state[1]),
        .I3(sm_scc_state[2]),
        .I4(sig_mstr2data_cmd_valid),
        .I5(\USE_SRL_FIFO.sig_wr_fifo_0 ),
        .O(sig_cmd2data_valid_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_cmd2data_valid_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sig_cmd2data_valid_i_1_n_0),
        .Q(sig_mstr2data_cmd_valid),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[0] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[9]),
        .Q(in[0]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[10] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[19]),
        .Q(in[10]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[11] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[20]),
        .Q(in[11]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[12] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[21]),
        .Q(in[12]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[13] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[22]),
        .Q(in[13]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[14] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[23]),
        .Q(in[14]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[15] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[24]),
        .Q(in[15]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[16] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[25]),
        .Q(in[16]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[17] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[26]),
        .Q(in[17]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[18] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[27]),
        .Q(in[18]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[19] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[28]),
        .Q(in[19]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[1] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[10]),
        .Q(in[1]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[20] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[29]),
        .Q(in[20]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[21] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[30]),
        .Q(in[21]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[22] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[31]),
        .Q(in[22]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[23] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[32]),
        .Q(in[23]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[24] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[33]),
        .Q(in[24]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[25] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[34]),
        .Q(in[25]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[26] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[35]),
        .Q(in[26]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[27] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[36]),
        .Q(in[27]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[28] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[37]),
        .Q(in[28]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[29] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[38]),
        .Q(in[29]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[2] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[11]),
        .Q(in[2]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[30] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[39]),
        .Q(in[30]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[31] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[40]),
        .Q(in[31]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[32] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[41]),
        .Q(in[32]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[33] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[42]),
        .Q(in[33]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[34] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[43]),
        .Q(in[34]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[35] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[44]),
        .Q(in[35]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[36] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[45]),
        .Q(in[36]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[37] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[46]),
        .Q(in[37]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[38] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[47]),
        .Q(in[38]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[39] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[48]),
        .Q(in[39]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[3] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[12]),
        .Q(in[3]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[40] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[49]),
        .Q(in[40]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[41] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[50]),
        .Q(in[41]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[42] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[51]),
        .Q(in[42]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[43] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[52]),
        .Q(in[43]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[44] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[53]),
        .Q(in[44]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[45] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[54]),
        .Q(in[45]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[46] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[55]),
        .Q(in[46]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[47] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[56]),
        .Q(in[47]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[48] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[57]),
        .Q(in[48]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[49] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[58]),
        .Q(in[49]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[4] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[13]),
        .Q(in[4]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[50] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[59]),
        .Q(in[50]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[51] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[60]),
        .Q(in[51]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[52] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[61]),
        .Q(in[52]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[53] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[62]),
        .Q(in[53]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[54] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[63]),
        .Q(in[54]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[55] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[64]),
        .Q(in[55]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[56] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[65]),
        .Q(in[56]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[57] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[66]),
        .Q(in[57]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[58] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[67]),
        .Q(in[58]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[59] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[68]),
        .Q(in[59]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[5] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[14]),
        .Q(in[5]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[60] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[69]),
        .Q(in[60]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[61] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[70]),
        .Q(in[61]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[62] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[71]),
        .Q(in[62]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[63] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[72]),
        .Q(in[63]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[6] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[15]),
        .Q(in[6]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[7] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[16]),
        .Q(in[7]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[8] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[17]),
        .Q(in[8]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_addr_reg_reg[9] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[18]),
        .Q(in[9]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_btt_reg_reg[0] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[0]),
        .Q(\sig_cmd_btt_reg_reg_n_0_[0] ),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_btt_reg_reg[1] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[1]),
        .Q(\sig_cmd_btt_reg_reg_n_0_[1] ),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_btt_reg_reg[2] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[2]),
        .Q(data1[0]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_btt_reg_reg[3] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[3]),
        .Q(data1[1]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_btt_reg_reg[4] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[4]),
        .Q(data1[2]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_btt_reg_reg[5] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[5]),
        .Q(data1[3]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_btt_reg_reg[6] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[6]),
        .Q(data1[4]),
        .R(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_cmd_burst_reg_reg[0] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[7]),
        .Q(in[69]),
        .R(sig_cmd_btt_reg0));
  FDSE #(
    .INIT(1'b0)) 
    sig_cmd_reg_empty_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(1'b0),
        .Q(sig_cmd_reg_empty),
        .S(sig_cmd_btt_reg0));
  FDRE #(
    .INIT(1'b0)) 
    sig_cmd_reg_full_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(1'b1),
        .Q(sig_cmd_reg_full),
        .R(sig_cmd_btt_reg0));
  FDRE sig_input_eof_reg_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_load_input_cmd),
        .D(Q[8]),
        .Q(sig_input_eof_reg_reg_0[3]),
        .R(sig_cmd_btt_reg0));
  LUT5 #(
    .INIT(32'h00000002)) 
    sm_pop_input_cmd_i_1
       (.I0(sm_scc_state[2]),
        .I1(sig_mstr2data_cmd_valid),
        .I2(sig_mstr2addr_cmd_valid),
        .I3(sm_scc_state[0]),
        .I4(sm_scc_state[1]),
        .O(sm_pop_input_cmd_ns));
  FDRE #(
    .INIT(1'b0)) 
    sm_pop_input_cmd_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sm_pop_input_cmd_ns),
        .Q(sm_pop_input_cmd),
        .R(sig_mmap_rst));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h5F5E)) 
    sm_scc_sm_ready_i_1
       (.I0(sm_scc_state[1]),
        .I1(sig_cmd2mstr_cmd_valid),
        .I2(sm_scc_state[2]),
        .I3(sm_scc_state[0]),
        .O(sm_scc_sm_ready_ns));
  FDRE #(
    .INIT(1'b0)) 
    sm_scc_sm_ready_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sm_scc_sm_ready_ns),
        .Q(sm_scc_sm_ready),
        .R(sig_mmap_rst));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h4440)) 
    sm_set_error_i_1
       (.I0(sm_scc_state[2]),
        .I1(sm_scc_state[1]),
        .I2(sig_btt_is_zero_reg),
        .I3(sm_scc_state[0]),
        .O(sm_set_error_ns));
  FDRE #(
    .INIT(1'b0)) 
    sm_set_error_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sm_set_error_ns),
        .Q(in[70]),
        .R(sig_mmap_rst));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_skid2mm_buf
   (out,
    sig_s_ready_out_reg_0,
    m_axi_s2mm_wvalid,
    sig_last_skid_reg,
    m_axi_s2mm_wlast,
    m_axi_s2mm_wdata,
    Q,
    m_axi_s2mm_wstrb,
    SR,
    m_axi_s2mm_aclk,
    sig_data2skid_wlast,
    sig_last_skid_mux_out,
    sig_m_valid_out_reg_0,
    m_axi_s2mm_wready,
    sig_data2skid_wvalid,
    D,
    \sig_strb_skid_reg_reg[3]_0 ,
    \sig_strb_reg_out_reg[3]_0 );
  output out;
  output sig_s_ready_out_reg_0;
  output m_axi_s2mm_wvalid;
  output sig_last_skid_reg;
  output m_axi_s2mm_wlast;
  output [31:0]m_axi_s2mm_wdata;
  output [3:0]Q;
  output [3:0]m_axi_s2mm_wstrb;
  input [0:0]SR;
  input m_axi_s2mm_aclk;
  input sig_data2skid_wlast;
  input sig_last_skid_mux_out;
  input sig_m_valid_out_reg_0;
  input m_axi_s2mm_wready;
  input sig_data2skid_wvalid;
  input [31:0]D;
  input [3:0]\sig_strb_skid_reg_reg[3]_0 ;
  input [3:0]\sig_strb_reg_out_reg[3]_0 ;

  wire [31:0]D;
  wire [3:0]Q;
  wire [0:0]SR;
  wire m_axi_s2mm_aclk;
  wire [31:0]m_axi_s2mm_wdata;
  wire m_axi_s2mm_wlast;
  wire m_axi_s2mm_wready;
  wire [3:0]m_axi_s2mm_wstrb;
  wire sig_data2skid_wlast;
  wire sig_data2skid_wvalid;
  wire \sig_data_reg_out[0]_i_1__1_n_0 ;
  wire \sig_data_reg_out[10]_i_1__1_n_0 ;
  wire \sig_data_reg_out[11]_i_1__1_n_0 ;
  wire \sig_data_reg_out[12]_i_1__1_n_0 ;
  wire \sig_data_reg_out[13]_i_1__1_n_0 ;
  wire \sig_data_reg_out[14]_i_1__1_n_0 ;
  wire \sig_data_reg_out[15]_i_1__1_n_0 ;
  wire \sig_data_reg_out[16]_i_1__1_n_0 ;
  wire \sig_data_reg_out[17]_i_1__1_n_0 ;
  wire \sig_data_reg_out[18]_i_1__1_n_0 ;
  wire \sig_data_reg_out[19]_i_1__1_n_0 ;
  wire \sig_data_reg_out[1]_i_1__1_n_0 ;
  wire \sig_data_reg_out[20]_i_1__1_n_0 ;
  wire \sig_data_reg_out[21]_i_1__1_n_0 ;
  wire \sig_data_reg_out[22]_i_1__1_n_0 ;
  wire \sig_data_reg_out[23]_i_1__1_n_0 ;
  wire \sig_data_reg_out[24]_i_1__1_n_0 ;
  wire \sig_data_reg_out[25]_i_1__1_n_0 ;
  wire \sig_data_reg_out[26]_i_1__1_n_0 ;
  wire \sig_data_reg_out[27]_i_1__1_n_0 ;
  wire \sig_data_reg_out[28]_i_1__1_n_0 ;
  wire \sig_data_reg_out[29]_i_1__1_n_0 ;
  wire \sig_data_reg_out[2]_i_1__1_n_0 ;
  wire \sig_data_reg_out[30]_i_1__1_n_0 ;
  wire \sig_data_reg_out[31]_i_2__0_n_0 ;
  wire \sig_data_reg_out[3]_i_1__1_n_0 ;
  wire \sig_data_reg_out[4]_i_1__1_n_0 ;
  wire \sig_data_reg_out[5]_i_1__1_n_0 ;
  wire \sig_data_reg_out[6]_i_1__1_n_0 ;
  wire \sig_data_reg_out[7]_i_1__1_n_0 ;
  wire \sig_data_reg_out[8]_i_1__1_n_0 ;
  wire \sig_data_reg_out[9]_i_1__1_n_0 ;
  wire sig_data_reg_out_en;
  wire \sig_data_skid_reg_reg_n_0_[0] ;
  wire \sig_data_skid_reg_reg_n_0_[10] ;
  wire \sig_data_skid_reg_reg_n_0_[11] ;
  wire \sig_data_skid_reg_reg_n_0_[12] ;
  wire \sig_data_skid_reg_reg_n_0_[13] ;
  wire \sig_data_skid_reg_reg_n_0_[14] ;
  wire \sig_data_skid_reg_reg_n_0_[15] ;
  wire \sig_data_skid_reg_reg_n_0_[16] ;
  wire \sig_data_skid_reg_reg_n_0_[17] ;
  wire \sig_data_skid_reg_reg_n_0_[18] ;
  wire \sig_data_skid_reg_reg_n_0_[19] ;
  wire \sig_data_skid_reg_reg_n_0_[1] ;
  wire \sig_data_skid_reg_reg_n_0_[20] ;
  wire \sig_data_skid_reg_reg_n_0_[21] ;
  wire \sig_data_skid_reg_reg_n_0_[22] ;
  wire \sig_data_skid_reg_reg_n_0_[23] ;
  wire \sig_data_skid_reg_reg_n_0_[24] ;
  wire \sig_data_skid_reg_reg_n_0_[25] ;
  wire \sig_data_skid_reg_reg_n_0_[26] ;
  wire \sig_data_skid_reg_reg_n_0_[27] ;
  wire \sig_data_skid_reg_reg_n_0_[28] ;
  wire \sig_data_skid_reg_reg_n_0_[29] ;
  wire \sig_data_skid_reg_reg_n_0_[2] ;
  wire \sig_data_skid_reg_reg_n_0_[30] ;
  wire \sig_data_skid_reg_reg_n_0_[31] ;
  wire \sig_data_skid_reg_reg_n_0_[3] ;
  wire \sig_data_skid_reg_reg_n_0_[4] ;
  wire \sig_data_skid_reg_reg_n_0_[5] ;
  wire \sig_data_skid_reg_reg_n_0_[6] ;
  wire \sig_data_skid_reg_reg_n_0_[7] ;
  wire \sig_data_skid_reg_reg_n_0_[8] ;
  wire \sig_data_skid_reg_reg_n_0_[9] ;
  wire sig_last_skid_mux_out;
  wire sig_last_skid_reg;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire sig_m_valid_dup;
  wire sig_m_valid_dup_i_1__0_n_0;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire sig_m_valid_out;
  wire sig_m_valid_out_reg_0;
  wire sig_reset_reg;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire sig_s_ready_dup;
  wire sig_s_ready_dup_i_1__0_n_0;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire sig_s_ready_out;
  wire [3:0]\sig_strb_reg_out_reg[3]_0 ;
  wire [3:0]\sig_strb_skid_reg_reg[3]_0 ;

  assign m_axi_s2mm_wvalid = sig_m_valid_out;
  assign out = sig_s_ready_dup;
  assign sig_s_ready_out_reg_0 = sig_s_ready_out;
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[0]_i_1__1 
       (.I0(D[0]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[0] ),
        .O(\sig_data_reg_out[0]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[10]_i_1__1 
       (.I0(D[10]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[10] ),
        .O(\sig_data_reg_out[10]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[11]_i_1__1 
       (.I0(D[11]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[11] ),
        .O(\sig_data_reg_out[11]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[12]_i_1__1 
       (.I0(D[12]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[12] ),
        .O(\sig_data_reg_out[12]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[13]_i_1__1 
       (.I0(D[13]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[13] ),
        .O(\sig_data_reg_out[13]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[14]_i_1__1 
       (.I0(D[14]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[14] ),
        .O(\sig_data_reg_out[14]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[15]_i_1__1 
       (.I0(D[15]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[15] ),
        .O(\sig_data_reg_out[15]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[16]_i_1__1 
       (.I0(D[16]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[16] ),
        .O(\sig_data_reg_out[16]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[17]_i_1__1 
       (.I0(D[17]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[17] ),
        .O(\sig_data_reg_out[17]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[18]_i_1__1 
       (.I0(D[18]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[18] ),
        .O(\sig_data_reg_out[18]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[19]_i_1__1 
       (.I0(D[19]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[19] ),
        .O(\sig_data_reg_out[19]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[1]_i_1__1 
       (.I0(D[1]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[1] ),
        .O(\sig_data_reg_out[1]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[20]_i_1__1 
       (.I0(D[20]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[20] ),
        .O(\sig_data_reg_out[20]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[21]_i_1__1 
       (.I0(D[21]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[21] ),
        .O(\sig_data_reg_out[21]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[22]_i_1__1 
       (.I0(D[22]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[22] ),
        .O(\sig_data_reg_out[22]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[23]_i_1__1 
       (.I0(D[23]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[23] ),
        .O(\sig_data_reg_out[23]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[24]_i_1__1 
       (.I0(D[24]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[24] ),
        .O(\sig_data_reg_out[24]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[25]_i_1__1 
       (.I0(D[25]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[25] ),
        .O(\sig_data_reg_out[25]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[26]_i_1__1 
       (.I0(D[26]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[26] ),
        .O(\sig_data_reg_out[26]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[27]_i_1__1 
       (.I0(D[27]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[27] ),
        .O(\sig_data_reg_out[27]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[28]_i_1__1 
       (.I0(D[28]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[28] ),
        .O(\sig_data_reg_out[28]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[29]_i_1__1 
       (.I0(D[29]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[29] ),
        .O(\sig_data_reg_out[29]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[2]_i_1__1 
       (.I0(D[2]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[2] ),
        .O(\sig_data_reg_out[2]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[30]_i_1__1 
       (.I0(D[30]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[30] ),
        .O(\sig_data_reg_out[30]_i_1__1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \sig_data_reg_out[31]_i_1__0 
       (.I0(m_axi_s2mm_wready),
        .I1(sig_m_valid_dup),
        .O(sig_data_reg_out_en));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[31]_i_2__0 
       (.I0(D[31]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[31] ),
        .O(\sig_data_reg_out[31]_i_2__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[3]_i_1__1 
       (.I0(D[3]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[3] ),
        .O(\sig_data_reg_out[3]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[4]_i_1__1 
       (.I0(D[4]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[4] ),
        .O(\sig_data_reg_out[4]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[5]_i_1__1 
       (.I0(D[5]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[5] ),
        .O(\sig_data_reg_out[5]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[6]_i_1__1 
       (.I0(D[6]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[6] ),
        .O(\sig_data_reg_out[6]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[7]_i_1__1 
       (.I0(D[7]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[7] ),
        .O(\sig_data_reg_out[7]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[8]_i_1__1 
       (.I0(D[8]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[8] ),
        .O(\sig_data_reg_out[8]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[9]_i_1__1 
       (.I0(D[9]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[9] ),
        .O(\sig_data_reg_out[9]_i_1__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[0]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[10] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[10]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[11] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[11]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[12] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[12]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[13] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[13]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[14] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[14]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[15] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[15]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[16] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[16]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[17] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[17]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[18] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[18]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[19] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[19]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[1]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[20] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[20]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[21] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[21]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[22] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[22]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[23] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[23]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[24] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[24]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[25] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[25]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[26] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[26]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[27] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[27]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[28] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[28]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[29] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[29]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[2]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[30] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[30]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[31] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[31]_i_2__0_n_0 ),
        .Q(m_axi_s2mm_wdata[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[3] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[3]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[4] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[4]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[5] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[5]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[6] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[6]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[7] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[7]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[8] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[8]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[9] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_data_reg_out[9]_i_1__1_n_0 ),
        .Q(m_axi_s2mm_wdata[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[0]),
        .Q(\sig_data_skid_reg_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[10] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[10]),
        .Q(\sig_data_skid_reg_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[11] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[11]),
        .Q(\sig_data_skid_reg_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[12] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[12]),
        .Q(\sig_data_skid_reg_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[13] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[13]),
        .Q(\sig_data_skid_reg_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[14] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[14]),
        .Q(\sig_data_skid_reg_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[15] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[15]),
        .Q(\sig_data_skid_reg_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[16] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[16]),
        .Q(\sig_data_skid_reg_reg_n_0_[16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[17] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[17]),
        .Q(\sig_data_skid_reg_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[18] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[18]),
        .Q(\sig_data_skid_reg_reg_n_0_[18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[19] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[19]),
        .Q(\sig_data_skid_reg_reg_n_0_[19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[1]),
        .Q(\sig_data_skid_reg_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[20] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[20]),
        .Q(\sig_data_skid_reg_reg_n_0_[20] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[21] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[21]),
        .Q(\sig_data_skid_reg_reg_n_0_[21] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[22] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[22]),
        .Q(\sig_data_skid_reg_reg_n_0_[22] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[23] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[23]),
        .Q(\sig_data_skid_reg_reg_n_0_[23] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[24] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[24]),
        .Q(\sig_data_skid_reg_reg_n_0_[24] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[25] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[25]),
        .Q(\sig_data_skid_reg_reg_n_0_[25] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[26] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[26]),
        .Q(\sig_data_skid_reg_reg_n_0_[26] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[27] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[27]),
        .Q(\sig_data_skid_reg_reg_n_0_[27] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[28] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[28]),
        .Q(\sig_data_skid_reg_reg_n_0_[28] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[29] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[29]),
        .Q(\sig_data_skid_reg_reg_n_0_[29] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[2]),
        .Q(\sig_data_skid_reg_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[30] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[30]),
        .Q(\sig_data_skid_reg_reg_n_0_[30] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[31] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[31]),
        .Q(\sig_data_skid_reg_reg_n_0_[31] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[3] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[3]),
        .Q(\sig_data_skid_reg_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[4] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[4]),
        .Q(\sig_data_skid_reg_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[5] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[5]),
        .Q(\sig_data_skid_reg_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[6] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[6]),
        .Q(\sig_data_skid_reg_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[7] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[7]),
        .Q(\sig_data_skid_reg_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[8] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[8]),
        .Q(\sig_data_skid_reg_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[9] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(D[9]),
        .Q(\sig_data_skid_reg_reg_n_0_[9] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    sig_last_reg_out_reg
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_last_skid_mux_out),
        .Q(m_axi_s2mm_wlast),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    sig_last_skid_reg_reg
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(sig_data2skid_wlast),
        .Q(sig_last_skid_reg),
        .R(SR));
  LUT6 #(
    .INIT(64'h4444444404004400)) 
    sig_m_valid_dup_i_1__0
       (.I0(sig_reset_reg),
        .I1(sig_m_valid_out_reg_0),
        .I2(m_axi_s2mm_wready),
        .I3(sig_m_valid_dup),
        .I4(sig_s_ready_dup),
        .I5(sig_data2skid_wvalid),
        .O(sig_m_valid_dup_i_1__0_n_0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_m_valid_dup_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_m_valid_dup_i_1__0_n_0),
        .Q(sig_m_valid_dup),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_m_valid_out_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_m_valid_dup_i_1__0_n_0),
        .Q(sig_m_valid_out),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    sig_reset_reg_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(SR),
        .Q(sig_reset_reg),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFF2FFFA00000000)) 
    sig_s_ready_dup_i_1__0
       (.I0(sig_s_ready_dup),
        .I1(sig_data2skid_wvalid),
        .I2(m_axi_s2mm_wready),
        .I3(sig_reset_reg),
        .I4(sig_m_valid_dup),
        .I5(sig_m_valid_out_reg_0),
        .O(sig_s_ready_dup_i_1__0_n_0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_s_ready_dup_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_s_ready_dup_i_1__0_n_0),
        .Q(sig_s_ready_dup),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_s_ready_out_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_s_ready_dup_i_1__0_n_0),
        .Q(sig_s_ready_out),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_reg_out_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_strb_reg_out_reg[3]_0 [0]),
        .Q(m_axi_s2mm_wstrb[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_reg_out_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_strb_reg_out_reg[3]_0 [1]),
        .Q(m_axi_s2mm_wstrb[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_reg_out_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_strb_reg_out_reg[3]_0 [2]),
        .Q(m_axi_s2mm_wstrb[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_reg_out_reg[3] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_strb_reg_out_reg[3]_0 [3]),
        .Q(m_axi_s2mm_wstrb[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_skid_reg_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(\sig_strb_skid_reg_reg[3]_0 [0]),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_skid_reg_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(\sig_strb_skid_reg_reg[3]_0 [1]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_skid_reg_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(\sig_strb_skid_reg_reg[3]_0 [2]),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_skid_reg_reg[3] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(\sig_strb_skid_reg_reg[3]_0 [3]),
        .Q(Q[3]),
        .R(SR));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_skid_buf
   (out,
    sig_m_valid_dup_reg_0,
    s_axis_s2mm_tready,
    sig_m_valid_out_reg_0,
    sig_stop_request,
    sig_mvalid_stop,
    sig_last_reg_out_reg_0,
    \sig_data_reg_out_reg[31]_0 ,
    sig_s_ready_dup_reg_0,
    m_axi_s2mm_aclk,
    SR,
    E,
    sig_sready_stop_reg_reg_0,
    \sig_data_reg_out_reg[0]_0 ,
    sig_m_valid_out_reg_1,
    wdc2skid_wready,
    sig_data2skid_halt,
    s_axis_s2mm_tlast,
    sig_next_eof_reg,
    sig_dbeat_cntr_eq_0,
    Q,
    s_axis_s2mm_tvalid,
    s_axis_s2mm_tkeep,
    s_axis_s2mm_tdata,
    sig_halt_reg_dly2,
    sig_halt_reg_dly3);
  output out;
  output sig_m_valid_dup_reg_0;
  output s_axis_s2mm_tready;
  output sig_m_valid_out_reg_0;
  output sig_stop_request;
  output sig_mvalid_stop;
  output sig_last_reg_out_reg_0;
  output [31:0]\sig_data_reg_out_reg[31]_0 ;
  input sig_s_ready_dup_reg_0;
  input m_axi_s2mm_aclk;
  input [0:0]SR;
  input [0:0]E;
  input sig_sready_stop_reg_reg_0;
  input \sig_data_reg_out_reg[0]_0 ;
  input sig_m_valid_out_reg_1;
  input wdc2skid_wready;
  input sig_data2skid_halt;
  input s_axis_s2mm_tlast;
  input sig_next_eof_reg;
  input sig_dbeat_cntr_eq_0;
  input [3:0]Q;
  input s_axis_s2mm_tvalid;
  input [3:0]s_axis_s2mm_tkeep;
  input [31:0]s_axis_s2mm_tdata;
  input sig_halt_reg_dly2;
  input sig_halt_reg_dly3;

  wire [0:0]E;
  wire [3:0]Q;
  wire [0:0]SR;
  wire m_axi_s2mm_aclk;
  wire [31:0]s_axis_s2mm_tdata;
  wire [3:0]s_axis_s2mm_tkeep;
  wire s_axis_s2mm_tlast;
  wire s_axis_s2mm_tvalid;
  wire sig_data2skid_halt;
  wire sig_data2wsc_cmd_cmplt_i_3_n_0;
  wire sig_data2wsc_cmd_cmplt_i_4_n_0;
  wire sig_data_reg_out0;
  wire \sig_data_reg_out[0]_i_1__0_n_0 ;
  wire \sig_data_reg_out[10]_i_1__0_n_0 ;
  wire \sig_data_reg_out[11]_i_1__0_n_0 ;
  wire \sig_data_reg_out[12]_i_1__0_n_0 ;
  wire \sig_data_reg_out[13]_i_1__0_n_0 ;
  wire \sig_data_reg_out[14]_i_1__0_n_0 ;
  wire \sig_data_reg_out[15]_i_1__0_n_0 ;
  wire \sig_data_reg_out[16]_i_1__0_n_0 ;
  wire \sig_data_reg_out[17]_i_1__0_n_0 ;
  wire \sig_data_reg_out[18]_i_1__0_n_0 ;
  wire \sig_data_reg_out[19]_i_1__0_n_0 ;
  wire \sig_data_reg_out[1]_i_1__0_n_0 ;
  wire \sig_data_reg_out[20]_i_1__0_n_0 ;
  wire \sig_data_reg_out[21]_i_1__0_n_0 ;
  wire \sig_data_reg_out[22]_i_1__0_n_0 ;
  wire \sig_data_reg_out[23]_i_1__0_n_0 ;
  wire \sig_data_reg_out[24]_i_1__0_n_0 ;
  wire \sig_data_reg_out[25]_i_1__0_n_0 ;
  wire \sig_data_reg_out[26]_i_1__0_n_0 ;
  wire \sig_data_reg_out[27]_i_1__0_n_0 ;
  wire \sig_data_reg_out[28]_i_1__0_n_0 ;
  wire \sig_data_reg_out[29]_i_1__0_n_0 ;
  wire \sig_data_reg_out[2]_i_1__0_n_0 ;
  wire \sig_data_reg_out[30]_i_1__0_n_0 ;
  wire \sig_data_reg_out[31]_i_1__1_n_0 ;
  wire \sig_data_reg_out[3]_i_1__0_n_0 ;
  wire \sig_data_reg_out[4]_i_1__0_n_0 ;
  wire \sig_data_reg_out[5]_i_1__0_n_0 ;
  wire \sig_data_reg_out[6]_i_1__0_n_0 ;
  wire \sig_data_reg_out[7]_i_1__0_n_0 ;
  wire \sig_data_reg_out[8]_i_1__0_n_0 ;
  wire \sig_data_reg_out[9]_i_1__0_n_0 ;
  wire \sig_data_reg_out_reg[0]_0 ;
  wire [31:0]\sig_data_reg_out_reg[31]_0 ;
  wire \sig_data_skid_reg_reg_n_0_[0] ;
  wire \sig_data_skid_reg_reg_n_0_[10] ;
  wire \sig_data_skid_reg_reg_n_0_[11] ;
  wire \sig_data_skid_reg_reg_n_0_[12] ;
  wire \sig_data_skid_reg_reg_n_0_[13] ;
  wire \sig_data_skid_reg_reg_n_0_[14] ;
  wire \sig_data_skid_reg_reg_n_0_[15] ;
  wire \sig_data_skid_reg_reg_n_0_[16] ;
  wire \sig_data_skid_reg_reg_n_0_[17] ;
  wire \sig_data_skid_reg_reg_n_0_[18] ;
  wire \sig_data_skid_reg_reg_n_0_[19] ;
  wire \sig_data_skid_reg_reg_n_0_[1] ;
  wire \sig_data_skid_reg_reg_n_0_[20] ;
  wire \sig_data_skid_reg_reg_n_0_[21] ;
  wire \sig_data_skid_reg_reg_n_0_[22] ;
  wire \sig_data_skid_reg_reg_n_0_[23] ;
  wire \sig_data_skid_reg_reg_n_0_[24] ;
  wire \sig_data_skid_reg_reg_n_0_[25] ;
  wire \sig_data_skid_reg_reg_n_0_[26] ;
  wire \sig_data_skid_reg_reg_n_0_[27] ;
  wire \sig_data_skid_reg_reg_n_0_[28] ;
  wire \sig_data_skid_reg_reg_n_0_[29] ;
  wire \sig_data_skid_reg_reg_n_0_[2] ;
  wire \sig_data_skid_reg_reg_n_0_[30] ;
  wire \sig_data_skid_reg_reg_n_0_[31] ;
  wire \sig_data_skid_reg_reg_n_0_[3] ;
  wire \sig_data_skid_reg_reg_n_0_[4] ;
  wire \sig_data_skid_reg_reg_n_0_[5] ;
  wire \sig_data_skid_reg_reg_n_0_[6] ;
  wire \sig_data_skid_reg_reg_n_0_[7] ;
  wire \sig_data_skid_reg_reg_n_0_[8] ;
  wire \sig_data_skid_reg_reg_n_0_[9] ;
  wire sig_dbeat_cntr_eq_0;
  wire sig_halt_reg_dly2;
  wire sig_halt_reg_dly3;
  wire sig_last_reg_out_reg_0;
  wire sig_last_skid_mux_out;
  wire sig_last_skid_reg;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire sig_m_valid_dup;
  wire sig_m_valid_dup_i_1__1_n_0;
  wire sig_m_valid_dup_i_2__0_n_0;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire sig_m_valid_out;
  wire sig_m_valid_out_reg_1;
  wire sig_mvalid_stop;
  wire sig_mvalid_stop_reg_i_1_n_0;
  wire sig_next_eof_reg;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire sig_s_ready_dup;
  wire sig_s_ready_dup_reg_0;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire sig_s_ready_out;
  wire sig_slast_with_stop;
  wire sig_sready_stop_reg_reg_0;
  wire [3:0]sig_sstrb_with_stop;
  wire sig_stop_request;
  wire [3:0]sig_strb_reg_out;
  wire [3:0]sig_strb_skid_mux_out;
  wire [3:0]sig_strb_skid_reg;
  wire skid2wdc_wlast;
  wire wdc2skid_wready;

  assign out = sig_s_ready_dup;
  assign s_axis_s2mm_tready = sig_s_ready_out;
  assign sig_m_valid_dup_reg_0 = sig_m_valid_dup;
  assign sig_m_valid_out_reg_0 = sig_m_valid_out;
  LUT5 #(
    .INIT(32'hEAEAEA6A)) 
    sig_data2wsc_cmd_cmplt_i_2
       (.I0(skid2wdc_wlast),
        .I1(sig_next_eof_reg),
        .I2(sig_dbeat_cntr_eq_0),
        .I3(sig_data2wsc_cmd_cmplt_i_3_n_0),
        .I4(sig_data2wsc_cmd_cmplt_i_4_n_0),
        .O(sig_last_reg_out_reg_0));
  LUT4 #(
    .INIT(16'h6FF6)) 
    sig_data2wsc_cmd_cmplt_i_3
       (.I0(sig_strb_reg_out[1]),
        .I1(Q[1]),
        .I2(sig_strb_reg_out[2]),
        .I3(Q[2]),
        .O(sig_data2wsc_cmd_cmplt_i_3_n_0));
  LUT4 #(
    .INIT(16'h6FF6)) 
    sig_data2wsc_cmd_cmplt_i_4
       (.I0(sig_strb_reg_out[3]),
        .I1(Q[3]),
        .I2(sig_strb_reg_out[0]),
        .I3(Q[0]),
        .O(sig_data2wsc_cmd_cmplt_i_4_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[0]_i_1__0 
       (.I0(s_axis_s2mm_tdata[0]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[0] ),
        .O(\sig_data_reg_out[0]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[10]_i_1__0 
       (.I0(s_axis_s2mm_tdata[10]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[10] ),
        .O(\sig_data_reg_out[10]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[11]_i_1__0 
       (.I0(s_axis_s2mm_tdata[11]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[11] ),
        .O(\sig_data_reg_out[11]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[12]_i_1__0 
       (.I0(s_axis_s2mm_tdata[12]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[12] ),
        .O(\sig_data_reg_out[12]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[13]_i_1__0 
       (.I0(s_axis_s2mm_tdata[13]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[13] ),
        .O(\sig_data_reg_out[13]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[14]_i_1__0 
       (.I0(s_axis_s2mm_tdata[14]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[14] ),
        .O(\sig_data_reg_out[14]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[15]_i_1__0 
       (.I0(s_axis_s2mm_tdata[15]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[15] ),
        .O(\sig_data_reg_out[15]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[16]_i_1__0 
       (.I0(s_axis_s2mm_tdata[16]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[16] ),
        .O(\sig_data_reg_out[16]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[17]_i_1__0 
       (.I0(s_axis_s2mm_tdata[17]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[17] ),
        .O(\sig_data_reg_out[17]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[18]_i_1__0 
       (.I0(s_axis_s2mm_tdata[18]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[18] ),
        .O(\sig_data_reg_out[18]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[19]_i_1__0 
       (.I0(s_axis_s2mm_tdata[19]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[19] ),
        .O(\sig_data_reg_out[19]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[1]_i_1__0 
       (.I0(s_axis_s2mm_tdata[1]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[1] ),
        .O(\sig_data_reg_out[1]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[20]_i_1__0 
       (.I0(s_axis_s2mm_tdata[20]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[20] ),
        .O(\sig_data_reg_out[20]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[21]_i_1__0 
       (.I0(s_axis_s2mm_tdata[21]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[21] ),
        .O(\sig_data_reg_out[21]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[22]_i_1__0 
       (.I0(s_axis_s2mm_tdata[22]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[22] ),
        .O(\sig_data_reg_out[22]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[23]_i_1__0 
       (.I0(s_axis_s2mm_tdata[23]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[23] ),
        .O(\sig_data_reg_out[23]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[24]_i_1__0 
       (.I0(s_axis_s2mm_tdata[24]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[24] ),
        .O(\sig_data_reg_out[24]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[25]_i_1__0 
       (.I0(s_axis_s2mm_tdata[25]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[25] ),
        .O(\sig_data_reg_out[25]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[26]_i_1__0 
       (.I0(s_axis_s2mm_tdata[26]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[26] ),
        .O(\sig_data_reg_out[26]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[27]_i_1__0 
       (.I0(s_axis_s2mm_tdata[27]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[27] ),
        .O(\sig_data_reg_out[27]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[28]_i_1__0 
       (.I0(s_axis_s2mm_tdata[28]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[28] ),
        .O(\sig_data_reg_out[28]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[29]_i_1__0 
       (.I0(s_axis_s2mm_tdata[29]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[29] ),
        .O(\sig_data_reg_out[29]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[2]_i_1__0 
       (.I0(s_axis_s2mm_tdata[2]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[2] ),
        .O(\sig_data_reg_out[2]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[30]_i_1__0 
       (.I0(s_axis_s2mm_tdata[30]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[30] ),
        .O(\sig_data_reg_out[30]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[31]_i_1__1 
       (.I0(s_axis_s2mm_tdata[31]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[31] ),
        .O(\sig_data_reg_out[31]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[3]_i_1__0 
       (.I0(s_axis_s2mm_tdata[3]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[3] ),
        .O(\sig_data_reg_out[3]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[4]_i_1__0 
       (.I0(s_axis_s2mm_tdata[4]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[4] ),
        .O(\sig_data_reg_out[4]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[5]_i_1__0 
       (.I0(s_axis_s2mm_tdata[5]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[5] ),
        .O(\sig_data_reg_out[5]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[6]_i_1__0 
       (.I0(s_axis_s2mm_tdata[6]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[6] ),
        .O(\sig_data_reg_out[6]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[7]_i_1__0 
       (.I0(s_axis_s2mm_tdata[7]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[7] ),
        .O(\sig_data_reg_out[7]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[8]_i_1__0 
       (.I0(s_axis_s2mm_tdata[8]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[8] ),
        .O(\sig_data_reg_out[8]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[9]_i_1__0 
       (.I0(s_axis_s2mm_tdata[9]),
        .I1(sig_s_ready_dup),
        .I2(\sig_data_skid_reg_reg_n_0_[9] ),
        .O(\sig_data_reg_out[9]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[0]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [0]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[10] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[10]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [10]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[11] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[11]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [11]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[12] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[12]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [12]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[13] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[13]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [13]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[14] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[14]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [14]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[15] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[15]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [15]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[16] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[16]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [16]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[17] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[17]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [17]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[18] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[18]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [18]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[19] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[19]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [19]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[1]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [1]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[20] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[20]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [20]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[21] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[21]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [21]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[22] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[22]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [22]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[23] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[23]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [23]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[24] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[24]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [24]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[25] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[25]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [25]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[26] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[26]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [26]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[27] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[27]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [27]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[28] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[28]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [28]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[29] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[29]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [29]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[2]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [2]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[30] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[30]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [30]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[31] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[31]_i_1__1_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [31]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[3] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[3]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [3]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[4] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[4]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [4]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[5] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[5]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [5]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[6] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[6]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [6]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[7] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[7]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [7]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[8] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[8]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [8]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[9] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(\sig_data_reg_out[9]_i_1__0_n_0 ),
        .Q(\sig_data_reg_out_reg[31]_0 [9]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[0]),
        .Q(\sig_data_skid_reg_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[10] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[10]),
        .Q(\sig_data_skid_reg_reg_n_0_[10] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[11] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[11]),
        .Q(\sig_data_skid_reg_reg_n_0_[11] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[12] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[12]),
        .Q(\sig_data_skid_reg_reg_n_0_[12] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[13] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[13]),
        .Q(\sig_data_skid_reg_reg_n_0_[13] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[14] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[14]),
        .Q(\sig_data_skid_reg_reg_n_0_[14] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[15] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[15]),
        .Q(\sig_data_skid_reg_reg_n_0_[15] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[16] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[16]),
        .Q(\sig_data_skid_reg_reg_n_0_[16] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[17] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[17]),
        .Q(\sig_data_skid_reg_reg_n_0_[17] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[18] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[18]),
        .Q(\sig_data_skid_reg_reg_n_0_[18] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[19] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[19]),
        .Q(\sig_data_skid_reg_reg_n_0_[19] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[1]),
        .Q(\sig_data_skid_reg_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[20] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[20]),
        .Q(\sig_data_skid_reg_reg_n_0_[20] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[21] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[21]),
        .Q(\sig_data_skid_reg_reg_n_0_[21] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[22] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[22]),
        .Q(\sig_data_skid_reg_reg_n_0_[22] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[23] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[23]),
        .Q(\sig_data_skid_reg_reg_n_0_[23] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[24] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[24]),
        .Q(\sig_data_skid_reg_reg_n_0_[24] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[25] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[25]),
        .Q(\sig_data_skid_reg_reg_n_0_[25] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[26] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[26]),
        .Q(\sig_data_skid_reg_reg_n_0_[26] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[27] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[27]),
        .Q(\sig_data_skid_reg_reg_n_0_[27] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[28] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[28]),
        .Q(\sig_data_skid_reg_reg_n_0_[28] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[29] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[29]),
        .Q(\sig_data_skid_reg_reg_n_0_[29] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[2]),
        .Q(\sig_data_skid_reg_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[30] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[30]),
        .Q(\sig_data_skid_reg_reg_n_0_[30] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[31] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[31]),
        .Q(\sig_data_skid_reg_reg_n_0_[31] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[3] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[3]),
        .Q(\sig_data_skid_reg_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[4] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[4]),
        .Q(\sig_data_skid_reg_reg_n_0_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[5] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[5]),
        .Q(\sig_data_skid_reg_reg_n_0_[5] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[6] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[6]),
        .Q(\sig_data_skid_reg_reg_n_0_[6] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[7] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[7]),
        .Q(\sig_data_skid_reg_reg_n_0_[7] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[8] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[8]),
        .Q(\sig_data_skid_reg_reg_n_0_[8] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[9] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(s_axis_s2mm_tdata[9]),
        .Q(\sig_data_skid_reg_reg_n_0_[9] ),
        .R(SR));
  LUT2 #(
    .INIT(4'hB)) 
    sig_last_reg_out_i_1__0
       (.I0(sig_mvalid_stop),
        .I1(\sig_data_reg_out_reg[0]_0 ),
        .O(sig_data_reg_out0));
  LUT4 #(
    .INIT(16'hEFE0)) 
    sig_last_reg_out_i_3
       (.I0(s_axis_s2mm_tlast),
        .I1(sig_stop_request),
        .I2(sig_s_ready_dup),
        .I3(sig_last_skid_reg),
        .O(sig_last_skid_mux_out));
  FDRE #(
    .INIT(1'b0)) 
    sig_last_reg_out_reg
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(sig_last_skid_mux_out),
        .Q(skid2wdc_wlast),
        .R(sig_data_reg_out0));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'hE)) 
    sig_last_skid_reg_i_1__0
       (.I0(s_axis_s2mm_tlast),
        .I1(sig_stop_request),
        .O(sig_slast_with_stop));
  FDRE #(
    .INIT(1'b0)) 
    sig_last_skid_reg_reg
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(sig_slast_with_stop),
        .Q(sig_last_skid_reg),
        .R(SR));
  LUT6 #(
    .INIT(64'h00C008C800C088C8)) 
    sig_m_valid_dup_i_1__1
       (.I0(sig_m_valid_dup_i_2__0_n_0),
        .I1(sig_m_valid_out_reg_1),
        .I2(sig_m_valid_dup),
        .I3(wdc2skid_wready),
        .I4(sig_stop_request),
        .I5(sig_data2skid_halt),
        .O(sig_m_valid_dup_i_1__1_n_0));
  LUT3 #(
    .INIT(8'hF4)) 
    sig_m_valid_dup_i_2__0
       (.I0(sig_s_ready_dup),
        .I1(sig_m_valid_dup),
        .I2(s_axis_s2mm_tvalid),
        .O(sig_m_valid_dup_i_2__0_n_0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_m_valid_dup_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_m_valid_dup_i_1__1_n_0),
        .Q(sig_m_valid_dup),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_m_valid_out_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_m_valid_dup_i_1__1_n_0),
        .Q(sig_m_valid_out),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFD0D0D8D0)) 
    sig_mvalid_stop_reg_i_1
       (.I0(sig_m_valid_dup),
        .I1(wdc2skid_wready),
        .I2(sig_stop_request),
        .I3(sig_halt_reg_dly2),
        .I4(sig_halt_reg_dly3),
        .I5(sig_mvalid_stop),
        .O(sig_mvalid_stop_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_mvalid_stop_reg_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_mvalid_stop_reg_i_1_n_0),
        .Q(sig_mvalid_stop),
        .R(SR));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_s_ready_dup_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_s_ready_dup_reg_0),
        .Q(sig_s_ready_dup),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_s_ready_out_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_s_ready_dup_reg_0),
        .Q(sig_s_ready_out),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    sig_sready_stop_reg_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_sready_stop_reg_reg_0),
        .Q(sig_stop_request),
        .R(SR));
  LUT4 #(
    .INIT(16'hEFE0)) 
    \sig_strb_reg_out[0]_i_1__0 
       (.I0(s_axis_s2mm_tkeep[0]),
        .I1(sig_stop_request),
        .I2(sig_s_ready_dup),
        .I3(sig_strb_skid_reg[0]),
        .O(sig_strb_skid_mux_out[0]));
  LUT4 #(
    .INIT(16'hEFE0)) 
    \sig_strb_reg_out[1]_i_1__0 
       (.I0(s_axis_s2mm_tkeep[1]),
        .I1(sig_stop_request),
        .I2(sig_s_ready_dup),
        .I3(sig_strb_skid_reg[1]),
        .O(sig_strb_skid_mux_out[1]));
  LUT4 #(
    .INIT(16'hEFE0)) 
    \sig_strb_reg_out[2]_i_1__0 
       (.I0(s_axis_s2mm_tkeep[2]),
        .I1(sig_stop_request),
        .I2(sig_s_ready_dup),
        .I3(sig_strb_skid_reg[2]),
        .O(sig_strb_skid_mux_out[2]));
  LUT4 #(
    .INIT(16'hEFE0)) 
    \sig_strb_reg_out[3]_i_1__1 
       (.I0(s_axis_s2mm_tkeep[3]),
        .I1(sig_stop_request),
        .I2(sig_s_ready_dup),
        .I3(sig_strb_skid_reg[3]),
        .O(sig_strb_skid_mux_out[3]));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_reg_out_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(sig_strb_skid_mux_out[0]),
        .Q(sig_strb_reg_out[0]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_reg_out_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(sig_strb_skid_mux_out[1]),
        .Q(sig_strb_reg_out[1]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_reg_out_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(sig_strb_skid_mux_out[2]),
        .Q(sig_strb_reg_out[2]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_reg_out_reg[3] 
       (.C(m_axi_s2mm_aclk),
        .CE(E),
        .D(sig_strb_skid_mux_out[3]),
        .Q(sig_strb_reg_out[3]),
        .R(sig_data_reg_out0));
  LUT2 #(
    .INIT(4'hE)) 
    \sig_strb_skid_reg[0]_i_1__0 
       (.I0(s_axis_s2mm_tkeep[0]),
        .I1(sig_stop_request),
        .O(sig_sstrb_with_stop[0]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \sig_strb_skid_reg[1]_i_1__0 
       (.I0(s_axis_s2mm_tkeep[1]),
        .I1(sig_stop_request),
        .O(sig_sstrb_with_stop[1]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \sig_strb_skid_reg[2]_i_1__0 
       (.I0(s_axis_s2mm_tkeep[2]),
        .I1(sig_stop_request),
        .O(sig_sstrb_with_stop[2]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \sig_strb_skid_reg[3]_i_1__0 
       (.I0(s_axis_s2mm_tkeep[3]),
        .I1(sig_stop_request),
        .O(sig_sstrb_with_stop[3]));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_skid_reg_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(sig_sstrb_with_stop[0]),
        .Q(sig_strb_skid_reg[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_skid_reg_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(sig_sstrb_with_stop[1]),
        .Q(sig_strb_skid_reg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_skid_reg_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(sig_sstrb_with_stop[2]),
        .Q(sig_strb_skid_reg[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_skid_reg_reg[3] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_s_ready_dup),
        .D(sig_sstrb_with_stop[3]),
        .Q(sig_strb_skid_reg[3]),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "axi_datamover_skid_buf" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_skid_buf_2
   (out,
    sig_s_ready_out_reg_0,
    m_axis_mm2s_tvalid,
    m_axis_mm2s_tlast,
    sig_sstrb_stop_mask,
    m_axis_mm2s_tdata,
    Q,
    m_axis_mm2s_tkeep,
    SR,
    m_axi_mm2s_aclk,
    sig_slast_with_stop,
    \sig_sstrb_stop_mask_reg[3]_0 ,
    sig_s_ready_out_reg_1,
    sig_data2skid_wvalid,
    m_axis_mm2s_tready,
    mm2s_strm_wvalid0__1,
    m_axi_mm2s_rlast,
    sig_next_eof_reg,
    sig_data2skid_halt,
    sig_stream_rst_reg_n,
    m_axi_mm2s_rdata,
    sig_halt_reg_dly3,
    sig_halt_reg_dly2,
    D,
    \sig_strb_reg_out_reg[3]_0 );
  output out;
  output sig_s_ready_out_reg_0;
  output m_axis_mm2s_tvalid;
  output m_axis_mm2s_tlast;
  output [0:0]sig_sstrb_stop_mask;
  output [31:0]m_axis_mm2s_tdata;
  output [3:0]Q;
  output [3:0]m_axis_mm2s_tkeep;
  input [0:0]SR;
  input m_axi_mm2s_aclk;
  input sig_slast_with_stop;
  input \sig_sstrb_stop_mask_reg[3]_0 ;
  input sig_s_ready_out_reg_1;
  input sig_data2skid_wvalid;
  input m_axis_mm2s_tready;
  input mm2s_strm_wvalid0__1;
  input m_axi_mm2s_rlast;
  input sig_next_eof_reg;
  input sig_data2skid_halt;
  input sig_stream_rst_reg_n;
  input [31:0]m_axi_mm2s_rdata;
  input sig_halt_reg_dly3;
  input sig_halt_reg_dly2;
  input [3:0]D;
  input [3:0]\sig_strb_reg_out_reg[3]_0 ;

  wire [3:0]D;
  wire [3:0]Q;
  wire [0:0]SR;
  wire m_axi_mm2s_aclk;
  wire [31:0]m_axi_mm2s_rdata;
  wire m_axi_mm2s_rlast;
  wire [31:0]m_axis_mm2s_tdata;
  wire [3:0]m_axis_mm2s_tkeep;
  wire m_axis_mm2s_tlast;
  wire m_axis_mm2s_tready;
  wire mm2s_strm_wvalid0__1;
  wire sig_data2skid_halt;
  wire sig_data2skid_wvalid;
  wire sig_data_reg_out0;
  wire sig_data_reg_out_en;
  wire [31:0]sig_data_skid_mux_out;
  wire [31:0]sig_data_skid_reg;
  wire sig_halt_reg_dly2;
  wire sig_halt_reg_dly3;
  wire sig_last_skid_mux_out;
  wire sig_last_skid_reg;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire sig_m_valid_dup;
  wire sig_m_valid_dup_i_1_n_0;
  wire sig_m_valid_dup_i_2_n_0;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire sig_m_valid_out;
  wire sig_mvalid_stop;
  wire sig_mvalid_stop_reg_i_1_n_0;
  wire sig_next_eof_reg;
  wire sig_reset_reg;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire sig_s_ready_dup;
  wire sig_s_ready_dup_i_1_n_0;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire sig_s_ready_out;
  wire sig_s_ready_out_reg_1;
  wire sig_slast_with_stop;
  wire [0:0]sig_sstrb_stop_mask;
  wire \sig_sstrb_stop_mask_reg[3]_0 ;
  wire [3:0]\sig_strb_reg_out_reg[3]_0 ;
  wire sig_stream_rst_reg_n;

  assign m_axis_mm2s_tvalid = sig_m_valid_out;
  assign out = sig_s_ready_dup;
  assign sig_s_ready_out_reg_0 = sig_s_ready_out;
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[0]_i_1 
       (.I0(m_axi_mm2s_rdata[0]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[0]),
        .O(sig_data_skid_mux_out[0]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[10]_i_1 
       (.I0(m_axi_mm2s_rdata[10]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[10]),
        .O(sig_data_skid_mux_out[10]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[11]_i_1 
       (.I0(m_axi_mm2s_rdata[11]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[11]),
        .O(sig_data_skid_mux_out[11]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[12]_i_1 
       (.I0(m_axi_mm2s_rdata[12]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[12]),
        .O(sig_data_skid_mux_out[12]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[13]_i_1 
       (.I0(m_axi_mm2s_rdata[13]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[13]),
        .O(sig_data_skid_mux_out[13]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[14]_i_1 
       (.I0(m_axi_mm2s_rdata[14]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[14]),
        .O(sig_data_skid_mux_out[14]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[15]_i_1 
       (.I0(m_axi_mm2s_rdata[15]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[15]),
        .O(sig_data_skid_mux_out[15]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[16]_i_1 
       (.I0(m_axi_mm2s_rdata[16]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[16]),
        .O(sig_data_skid_mux_out[16]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[17]_i_1 
       (.I0(m_axi_mm2s_rdata[17]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[17]),
        .O(sig_data_skid_mux_out[17]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[18]_i_1 
       (.I0(m_axi_mm2s_rdata[18]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[18]),
        .O(sig_data_skid_mux_out[18]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[19]_i_1 
       (.I0(m_axi_mm2s_rdata[19]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[19]),
        .O(sig_data_skid_mux_out[19]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[1]_i_1 
       (.I0(m_axi_mm2s_rdata[1]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[1]),
        .O(sig_data_skid_mux_out[1]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[20]_i_1 
       (.I0(m_axi_mm2s_rdata[20]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[20]),
        .O(sig_data_skid_mux_out[20]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[21]_i_1 
       (.I0(m_axi_mm2s_rdata[21]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[21]),
        .O(sig_data_skid_mux_out[21]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[22]_i_1 
       (.I0(m_axi_mm2s_rdata[22]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[22]),
        .O(sig_data_skid_mux_out[22]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[23]_i_1 
       (.I0(m_axi_mm2s_rdata[23]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[23]),
        .O(sig_data_skid_mux_out[23]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[24]_i_1 
       (.I0(m_axi_mm2s_rdata[24]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[24]),
        .O(sig_data_skid_mux_out[24]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[25]_i_1 
       (.I0(m_axi_mm2s_rdata[25]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[25]),
        .O(sig_data_skid_mux_out[25]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[26]_i_1 
       (.I0(m_axi_mm2s_rdata[26]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[26]),
        .O(sig_data_skid_mux_out[26]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[27]_i_1 
       (.I0(m_axi_mm2s_rdata[27]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[27]),
        .O(sig_data_skid_mux_out[27]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[28]_i_1 
       (.I0(m_axi_mm2s_rdata[28]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[28]),
        .O(sig_data_skid_mux_out[28]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[29]_i_1 
       (.I0(m_axi_mm2s_rdata[29]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[29]),
        .O(sig_data_skid_mux_out[29]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[2]_i_1 
       (.I0(m_axi_mm2s_rdata[2]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[2]),
        .O(sig_data_skid_mux_out[2]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[30]_i_1 
       (.I0(m_axi_mm2s_rdata[30]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[30]),
        .O(sig_data_skid_mux_out[30]));
  LUT2 #(
    .INIT(4'hB)) 
    \sig_data_reg_out[31]_i_1 
       (.I0(sig_mvalid_stop),
        .I1(sig_stream_rst_reg_n),
        .O(sig_data_reg_out0));
  LUT2 #(
    .INIT(4'hB)) 
    \sig_data_reg_out[31]_i_2 
       (.I0(m_axis_mm2s_tready),
        .I1(sig_m_valid_dup),
        .O(sig_data_reg_out_en));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[31]_i_3 
       (.I0(m_axi_mm2s_rdata[31]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[31]),
        .O(sig_data_skid_mux_out[31]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[3]_i_1 
       (.I0(m_axi_mm2s_rdata[3]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[3]),
        .O(sig_data_skid_mux_out[3]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[4]_i_1 
       (.I0(m_axi_mm2s_rdata[4]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[4]),
        .O(sig_data_skid_mux_out[4]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[5]_i_1 
       (.I0(m_axi_mm2s_rdata[5]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[5]),
        .O(sig_data_skid_mux_out[5]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[6]_i_1 
       (.I0(m_axi_mm2s_rdata[6]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[6]),
        .O(sig_data_skid_mux_out[6]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[7]_i_1 
       (.I0(m_axi_mm2s_rdata[7]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[7]),
        .O(sig_data_skid_mux_out[7]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[8]_i_1 
       (.I0(m_axi_mm2s_rdata[8]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[8]),
        .O(sig_data_skid_mux_out[8]));
  LUT3 #(
    .INIT(8'hB8)) 
    \sig_data_reg_out[9]_i_1 
       (.I0(m_axi_mm2s_rdata[9]),
        .I1(sig_s_ready_dup),
        .I2(sig_data_skid_reg[9]),
        .O(sig_data_skid_mux_out[9]));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[0] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[0]),
        .Q(m_axis_mm2s_tdata[0]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[10] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[10]),
        .Q(m_axis_mm2s_tdata[10]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[11] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[11]),
        .Q(m_axis_mm2s_tdata[11]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[12] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[12]),
        .Q(m_axis_mm2s_tdata[12]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[13] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[13]),
        .Q(m_axis_mm2s_tdata[13]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[14] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[14]),
        .Q(m_axis_mm2s_tdata[14]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[15] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[15]),
        .Q(m_axis_mm2s_tdata[15]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[16] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[16]),
        .Q(m_axis_mm2s_tdata[16]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[17] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[17]),
        .Q(m_axis_mm2s_tdata[17]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[18] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[18]),
        .Q(m_axis_mm2s_tdata[18]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[19] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[19]),
        .Q(m_axis_mm2s_tdata[19]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[1] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[1]),
        .Q(m_axis_mm2s_tdata[1]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[20] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[20]),
        .Q(m_axis_mm2s_tdata[20]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[21] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[21]),
        .Q(m_axis_mm2s_tdata[21]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[22] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[22]),
        .Q(m_axis_mm2s_tdata[22]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[23] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[23]),
        .Q(m_axis_mm2s_tdata[23]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[24] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[24]),
        .Q(m_axis_mm2s_tdata[24]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[25] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[25]),
        .Q(m_axis_mm2s_tdata[25]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[26] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[26]),
        .Q(m_axis_mm2s_tdata[26]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[27] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[27]),
        .Q(m_axis_mm2s_tdata[27]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[28] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[28]),
        .Q(m_axis_mm2s_tdata[28]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[29] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[29]),
        .Q(m_axis_mm2s_tdata[29]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[2] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[2]),
        .Q(m_axis_mm2s_tdata[2]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[30] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[30]),
        .Q(m_axis_mm2s_tdata[30]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[31] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[31]),
        .Q(m_axis_mm2s_tdata[31]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[3] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[3]),
        .Q(m_axis_mm2s_tdata[3]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[4] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[4]),
        .Q(m_axis_mm2s_tdata[4]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[5] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[5]),
        .Q(m_axis_mm2s_tdata[5]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[6] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[6]),
        .Q(m_axis_mm2s_tdata[6]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[7] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[7]),
        .Q(m_axis_mm2s_tdata[7]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[8] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[8]),
        .Q(m_axis_mm2s_tdata[8]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_reg_out_reg[9] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_data_skid_mux_out[9]),
        .Q(m_axis_mm2s_tdata[9]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[0] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[0]),
        .Q(sig_data_skid_reg[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[10] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[10]),
        .Q(sig_data_skid_reg[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[11] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[11]),
        .Q(sig_data_skid_reg[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[12] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[12]),
        .Q(sig_data_skid_reg[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[13] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[13]),
        .Q(sig_data_skid_reg[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[14] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[14]),
        .Q(sig_data_skid_reg[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[15] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[15]),
        .Q(sig_data_skid_reg[15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[16] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[16]),
        .Q(sig_data_skid_reg[16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[17] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[17]),
        .Q(sig_data_skid_reg[17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[18] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[18]),
        .Q(sig_data_skid_reg[18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[19] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[19]),
        .Q(sig_data_skid_reg[19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[1] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[1]),
        .Q(sig_data_skid_reg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[20] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[20]),
        .Q(sig_data_skid_reg[20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[21] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[21]),
        .Q(sig_data_skid_reg[21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[22] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[22]),
        .Q(sig_data_skid_reg[22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[23] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[23]),
        .Q(sig_data_skid_reg[23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[24] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[24]),
        .Q(sig_data_skid_reg[24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[25] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[25]),
        .Q(sig_data_skid_reg[25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[26] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[26]),
        .Q(sig_data_skid_reg[26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[27] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[27]),
        .Q(sig_data_skid_reg[27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[28] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[28]),
        .Q(sig_data_skid_reg[28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[29] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[29]),
        .Q(sig_data_skid_reg[29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[2] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[2]),
        .Q(sig_data_skid_reg[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[30] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[30]),
        .Q(sig_data_skid_reg[30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[31] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[31]),
        .Q(sig_data_skid_reg[31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[3] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[3]),
        .Q(sig_data_skid_reg[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[4] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[4]),
        .Q(sig_data_skid_reg[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[5] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[5]),
        .Q(sig_data_skid_reg[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[6] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[6]),
        .Q(sig_data_skid_reg[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[7] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[7]),
        .Q(sig_data_skid_reg[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[8] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[8]),
        .Q(sig_data_skid_reg[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_data_skid_reg_reg[9] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(m_axi_mm2s_rdata[9]),
        .Q(sig_data_skid_reg[9]),
        .R(SR));
  LUT6 #(
    .INIT(64'hFEEEFFFFFEEE0000)) 
    sig_last_reg_out_i_1
       (.I0(mm2s_strm_wvalid0__1),
        .I1(sig_sstrb_stop_mask),
        .I2(m_axi_mm2s_rlast),
        .I3(sig_next_eof_reg),
        .I4(sig_s_ready_dup),
        .I5(sig_last_skid_reg),
        .O(sig_last_skid_mux_out));
  FDRE #(
    .INIT(1'b0)) 
    sig_last_reg_out_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(sig_last_skid_mux_out),
        .Q(m_axis_mm2s_tlast),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    sig_last_skid_reg_reg
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(sig_slast_with_stop),
        .Q(sig_last_skid_reg),
        .R(SR));
  LUT5 #(
    .INIT(32'hAA08AA88)) 
    sig_m_valid_dup_i_1
       (.I0(sig_m_valid_dup_i_2_n_0),
        .I1(sig_m_valid_dup),
        .I2(sig_s_ready_dup),
        .I3(sig_data2skid_wvalid),
        .I4(m_axis_mm2s_tready),
        .O(sig_m_valid_dup_i_1_n_0));
  LUT6 #(
    .INIT(64'h0010011100101111)) 
    sig_m_valid_dup_i_2
       (.I0(sig_reset_reg),
        .I1(sig_data_reg_out0),
        .I2(sig_m_valid_dup),
        .I3(m_axis_mm2s_tready),
        .I4(sig_sstrb_stop_mask),
        .I5(sig_data2skid_halt),
        .O(sig_m_valid_dup_i_2_n_0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_m_valid_dup_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sig_m_valid_dup_i_1_n_0),
        .Q(sig_m_valid_dup),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_m_valid_out_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sig_m_valid_dup_i_1_n_0),
        .Q(sig_m_valid_out),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFD0D8D0D0)) 
    sig_mvalid_stop_reg_i_1
       (.I0(sig_m_valid_dup),
        .I1(m_axis_mm2s_tready),
        .I2(sig_sstrb_stop_mask),
        .I3(sig_halt_reg_dly3),
        .I4(sig_halt_reg_dly2),
        .I5(sig_mvalid_stop),
        .O(sig_mvalid_stop_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_mvalid_stop_reg_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sig_mvalid_stop_reg_i_1_n_0),
        .Q(sig_mvalid_stop),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    sig_reset_reg_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(SR),
        .Q(sig_reset_reg),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAAAAAA08AAAAAA88)) 
    sig_s_ready_dup_i_1
       (.I0(sig_s_ready_out_reg_1),
        .I1(sig_s_ready_dup),
        .I2(sig_data2skid_wvalid),
        .I3(m_axis_mm2s_tready),
        .I4(sig_reset_reg),
        .I5(sig_m_valid_dup),
        .O(sig_s_ready_dup_i_1_n_0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_s_ready_dup_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sig_s_ready_dup_i_1_n_0),
        .Q(sig_s_ready_dup),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    sig_s_ready_out_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(sig_s_ready_dup_i_1_n_0),
        .Q(sig_s_ready_out),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_sstrb_stop_mask_reg[3] 
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(\sig_sstrb_stop_mask_reg[3]_0 ),
        .Q(sig_sstrb_stop_mask),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_reg_out_reg[0] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_strb_reg_out_reg[3]_0 [0]),
        .Q(m_axis_mm2s_tkeep[0]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_reg_out_reg[1] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_strb_reg_out_reg[3]_0 [1]),
        .Q(m_axis_mm2s_tkeep[1]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_reg_out_reg[2] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_strb_reg_out_reg[3]_0 [2]),
        .Q(m_axis_mm2s_tkeep[2]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_reg_out_reg[3] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_data_reg_out_en),
        .D(\sig_strb_reg_out_reg[3]_0 [3]),
        .Q(m_axis_mm2s_tkeep[3]),
        .R(sig_data_reg_out0));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_skid_reg_reg[0] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(D[0]),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_skid_reg_reg[1] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(D[1]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_skid_reg_reg[2] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(D[2]),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \sig_strb_skid_reg_reg[3] 
       (.C(m_axi_mm2s_aclk),
        .CE(sig_s_ready_dup),
        .D(D[3]),
        .Q(Q[3]),
        .R(SR));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo
   (FIFO_Full_reg_0,
    \addr_i_reg[2]_0 ,
    sig_halt_reg_reg,
    sm_set_error_reg,
    out,
    SR,
    m_axi_s2mm_aclk,
    sig_inhibit_rdy_n,
    sig_mstr2addr_cmd_valid,
    sig_halt_reg,
    sig_data2all_tlast_error,
    sig_addr_reg_empty,
    sig_posted_to_axi_reg,
    in);
  output FIFO_Full_reg_0;
  output \addr_i_reg[2]_0 ;
  output sig_halt_reg_reg;
  output sm_set_error_reg;
  output [71:0]out;
  input [0:0]SR;
  input m_axi_s2mm_aclk;
  input sig_inhibit_rdy_n;
  input sig_mstr2addr_cmd_valid;
  input sig_halt_reg;
  input sig_data2all_tlast_error;
  input sig_addr_reg_empty;
  input sig_posted_to_axi_reg;
  input [70:0]in;

  wire FIFO_Full_reg_0;
  wire FIFO_Full_reg_n_0;
  wire [0:0]SR;
  wire [1:0]addr_i;
  wire [2:0]addr_i_p1;
  wire \addr_i_reg[2]_0 ;
  wire \addr_i_reg_n_0_[2] ;
  wire fifo_full_p1;
  wire [70:0]in;
  wire m_axi_s2mm_aclk;
  wire [71:0]out;
  wire sig_addr_reg_empty;
  wire sig_data2all_tlast_error;
  wire sig_halt_reg;
  wire sig_halt_reg_reg;
  wire sig_inhibit_rdy_n;
  wire sig_mstr2addr_cmd_valid;
  wire sig_posted_to_axi_reg;
  wire sm_set_error_reg;

  LUT5 #(
    .INIT(32'h20040220)) 
    FIFO_Full_i_1__3
       (.I0(addr_i[1]),
        .I1(\addr_i_reg_n_0_[2] ),
        .I2(addr_i[0]),
        .I3(FIFO_Full_reg_0),
        .I4(\addr_i_reg[2]_0 ),
        .O(fifo_full_p1));
  FDRE FIFO_Full_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(fifo_full_p1),
        .Q(FIFO_Full_reg_n_0),
        .R(SR));
  LUT5 #(
    .INIT(32'h5595AA6A)) 
    \addr_i[0]_i_1__3 
       (.I0(\addr_i_reg[2]_0 ),
        .I1(sig_inhibit_rdy_n),
        .I2(sig_mstr2addr_cmd_valid),
        .I3(FIFO_Full_reg_n_0),
        .I4(addr_i[0]),
        .O(addr_i_p1[0]));
  LUT6 #(
    .INIT(64'hBAAADFFF45552000)) 
    \addr_i[1]_i_1__3 
       (.I0(addr_i[0]),
        .I1(FIFO_Full_reg_n_0),
        .I2(sig_mstr2addr_cmd_valid),
        .I3(sig_inhibit_rdy_n),
        .I4(\addr_i_reg[2]_0 ),
        .I5(addr_i[1]),
        .O(addr_i_p1[1]));
  LUT5 #(
    .INIT(32'hFE7F0180)) 
    \addr_i[2]_i_1__3 
       (.I0(addr_i[0]),
        .I1(addr_i[1]),
        .I2(FIFO_Full_reg_0),
        .I3(\addr_i_reg[2]_0 ),
        .I4(\addr_i_reg_n_0_[2] ),
        .O(addr_i_p1[2]));
  FDSE \addr_i_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(addr_i_p1[0]),
        .Q(addr_i[0]),
        .S(SR));
  FDSE \addr_i_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(addr_i_p1[1]),
        .Q(addr_i[1]),
        .S(SR));
  FDSE \addr_i_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(addr_i_p1[2]),
        .Q(\addr_i_reg_n_0_[2] ),
        .S(SR));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][11]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][11]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[69]),
        .Q(out[70]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][13]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][13]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(1'b1),
        .Q(out[69]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][18]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][18]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[68]),
        .Q(out[68]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][19]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][19]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[67]),
        .Q(out[67]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][20]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][20]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[66]),
        .Q(out[66]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][21]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][21]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[65]),
        .Q(out[65]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][22]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][22]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[64]),
        .Q(out[64]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][23]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][23]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[63]),
        .Q(out[63]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][24]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][24]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[62]),
        .Q(out[62]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][25]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][25]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[61]),
        .Q(out[61]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][26]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][26]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[60]),
        .Q(out[60]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][27]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][27]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[59]),
        .Q(out[59]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][28]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][28]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[58]),
        .Q(out[58]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][29]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][29]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[57]),
        .Q(out[57]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][30]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][30]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[56]),
        .Q(out[56]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][31]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][31]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[55]),
        .Q(out[55]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][32]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][32]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[54]),
        .Q(out[54]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][33]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][33]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[53]),
        .Q(out[53]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][34]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][34]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[52]),
        .Q(out[52]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][35]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][35]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[51]),
        .Q(out[51]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][36]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][36]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[50]),
        .Q(out[50]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][37]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][37]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[49]),
        .Q(out[49]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][38]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][38]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[48]),
        .Q(out[48]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][39]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][39]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[47]),
        .Q(out[47]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][40]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][40]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[46]),
        .Q(out[46]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][41]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][41]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[45]),
        .Q(out[45]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][42]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][42]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[44]),
        .Q(out[44]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][43]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][43]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[43]),
        .Q(out[43]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][44]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][44]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[42]),
        .Q(out[42]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][45]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][45]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[41]),
        .Q(out[41]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][46]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][46]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[40]),
        .Q(out[40]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][47]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][47]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[39]),
        .Q(out[39]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][48]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][48]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[38]),
        .Q(out[38]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][49]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][49]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[37]),
        .Q(out[37]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][50]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][50]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[36]),
        .Q(out[36]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][51]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][51]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[35]),
        .Q(out[35]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][52]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][52]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[34]),
        .Q(out[34]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][53]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][53]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[33]),
        .Q(out[33]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][54]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][54]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[32]),
        .Q(out[32]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][55]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][55]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[31]),
        .Q(out[31]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][56]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][56]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[30]),
        .Q(out[30]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][57]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][57]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[29]),
        .Q(out[29]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][58]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][58]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[28]),
        .Q(out[28]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][59]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][59]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[27]),
        .Q(out[27]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][60]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][60]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[26]),
        .Q(out[26]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][61]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][61]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[25]),
        .Q(out[25]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][62]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][62]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[24]),
        .Q(out[24]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][63]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][63]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[23]),
        .Q(out[23]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][64]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][64]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[22]),
        .Q(out[22]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][65]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][65]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[21]),
        .Q(out[21]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][66]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][66]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[20]),
        .Q(out[20]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][67]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][67]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[19]),
        .Q(out[19]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][68]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][68]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[18]),
        .Q(out[18]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][69]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][69]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[17]),
        .Q(out[17]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][70]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][70]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[16]),
        .Q(out[16]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][71]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][71]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[15]),
        .Q(out[15]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][72]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][72]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[14]),
        .Q(out[14]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][73]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][73]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[13]),
        .Q(out[13]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][74]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][74]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[12]),
        .Q(out[12]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][75]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][75]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[11]),
        .Q(out[11]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][76]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][76]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[10]),
        .Q(out[10]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][77]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][77]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[9]),
        .Q(out[9]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][78]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][78]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[8]),
        .Q(out[8]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][79]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][79]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[7]),
        .Q(out[7]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][80]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][80]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[6]),
        .Q(out[6]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][81]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][81]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[5]),
        .Q(out[5]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][82]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][82]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[4]),
        .Q(out[4]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][83]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][83]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[3]),
        .Q(out[3]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][84]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][84]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[2]),
        .Q(out[2]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][85]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][85]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[1]),
        .Q(out[1]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][86]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][86]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[0]),
        .Q(out[0]));
  LUT3 #(
    .INIT(8'h40)) 
    \data_reg[3][86]_srl4_i_1__0 
       (.I0(FIFO_Full_reg_n_0),
        .I1(sig_mstr2addr_cmd_valid),
        .I2(sig_inhibit_rdy_n),
        .O(FIFO_Full_reg_0));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][8]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][8]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(in[70]),
        .Q(out[71]));
  LUT1 #(
    .INIT(2'h1)) 
    sig_addr_valid_reg_i_1__0
       (.I0(out[71]),
        .O(sm_set_error_reg));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \sig_next_addr_reg[63]_i_2__0 
       (.I0(\addr_i_reg_n_0_[2] ),
        .I1(sig_addr_reg_empty),
        .I2(sig_data2all_tlast_error),
        .I3(sig_halt_reg),
        .O(\addr_i_reg[2]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT5 #(
    .INIT(32'h00100000)) 
    sig_posted_to_axi_2_i_1__0
       (.I0(sig_halt_reg),
        .I1(sig_data2all_tlast_error),
        .I2(sig_addr_reg_empty),
        .I3(\addr_i_reg_n_0_[2] ),
        .I4(sig_posted_to_axi_reg),
        .O(sig_halt_reg_reg));
endmodule

(* ORIG_REF_NAME = "axi_datamover_v5_1_37_srl_fifo" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo_9
   (FIFO_Full_reg_0,
    sig_push_addr_reg1_out,
    \addr_i_reg[2]_0 ,
    sm_set_error_reg,
    out,
    sig_mmap_rst,
    m_axi_mm2s_aclk,
    sig_data2addr_stop_req,
    FIFO_Full_reg_1,
    sig_inhibit_rdy_n,
    sig_mstr2addr_cmd_valid,
    sig_mmap_rst_reg_n,
    in);
  output FIFO_Full_reg_0;
  output sig_push_addr_reg1_out;
  output \addr_i_reg[2]_0 ;
  output sm_set_error_reg;
  output [71:0]out;
  input sig_mmap_rst;
  input m_axi_mm2s_aclk;
  input sig_data2addr_stop_req;
  input FIFO_Full_reg_1;
  input sig_inhibit_rdy_n;
  input sig_mstr2addr_cmd_valid;
  input sig_mmap_rst_reg_n;
  input [70:0]in;

  wire FIFO_Full_reg_0;
  wire FIFO_Full_reg_1;
  wire FIFO_Full_reg_n_0;
  wire [1:0]addr_i;
  wire [2:0]addr_i_p1;
  wire \addr_i_reg[2]_0 ;
  wire \addr_i_reg_n_0_[2] ;
  wire fifo_full_p1;
  wire [70:0]in;
  wire m_axi_mm2s_aclk;
  wire [71:0]out;
  wire sig_data2addr_stop_req;
  wire sig_inhibit_rdy_n;
  wire sig_mmap_rst;
  wire sig_mmap_rst_reg_n;
  wire sig_mstr2addr_cmd_valid;
  wire sig_push_addr_reg1_out;
  wire sm_set_error_reg;

  LUT6 #(
    .INIT(64'h0000000028802828)) 
    FIFO_Full_i_1
       (.I0(addr_i[1]),
        .I1(addr_i[0]),
        .I2(FIFO_Full_reg_0),
        .I3(sig_data2addr_stop_req),
        .I4(FIFO_Full_reg_1),
        .I5(\addr_i_reg_n_0_[2] ),
        .O(fifo_full_p1));
  FDRE FIFO_Full_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(fifo_full_p1),
        .Q(FIFO_Full_reg_n_0),
        .R(sig_mmap_rst));
  LUT5 #(
    .INIT(32'h5595AA6A)) 
    \addr_i[0]_i_1 
       (.I0(sig_push_addr_reg1_out),
        .I1(sig_inhibit_rdy_n),
        .I2(sig_mstr2addr_cmd_valid),
        .I3(FIFO_Full_reg_n_0),
        .I4(addr_i[0]),
        .O(addr_i_p1[0]));
  LUT6 #(
    .INIT(64'hBAAADFFF45552000)) 
    \addr_i[1]_i_1 
       (.I0(addr_i[0]),
        .I1(FIFO_Full_reg_n_0),
        .I2(sig_mstr2addr_cmd_valid),
        .I3(sig_inhibit_rdy_n),
        .I4(sig_push_addr_reg1_out),
        .I5(addr_i[1]),
        .O(addr_i_p1[1]));
  LUT6 #(
    .INIT(64'h7F7F7F7F80018080)) 
    \addr_i[2]_i_1 
       (.I0(addr_i[0]),
        .I1(addr_i[1]),
        .I2(FIFO_Full_reg_0),
        .I3(sig_data2addr_stop_req),
        .I4(FIFO_Full_reg_1),
        .I5(\addr_i_reg_n_0_[2] ),
        .O(addr_i_p1[2]));
  FDSE \addr_i_reg[0] 
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(addr_i_p1[0]),
        .Q(addr_i[0]),
        .S(sig_mmap_rst));
  FDSE \addr_i_reg[1] 
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(addr_i_p1[1]),
        .Q(addr_i[1]),
        .S(sig_mmap_rst));
  FDSE \addr_i_reg[2] 
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(addr_i_p1[2]),
        .Q(\addr_i_reg_n_0_[2] ),
        .S(sig_mmap_rst));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][11]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][11]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[69]),
        .Q(out[70]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][13]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][13]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(1'b1),
        .Q(out[69]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][18]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][18]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[68]),
        .Q(out[68]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][19]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][19]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[67]),
        .Q(out[67]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][20]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][20]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[66]),
        .Q(out[66]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][21]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][21]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[65]),
        .Q(out[65]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][22]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][22]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[64]),
        .Q(out[64]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][23]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][23]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[63]),
        .Q(out[63]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][24]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][24]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[62]),
        .Q(out[62]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][25]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][25]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[61]),
        .Q(out[61]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][26]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][26]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[60]),
        .Q(out[60]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][27]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][27]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[59]),
        .Q(out[59]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][28]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][28]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[58]),
        .Q(out[58]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][29]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][29]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[57]),
        .Q(out[57]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][30]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][30]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[56]),
        .Q(out[56]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][31]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][31]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[55]),
        .Q(out[55]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][32]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][32]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[54]),
        .Q(out[54]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][33]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][33]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[53]),
        .Q(out[53]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][34]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][34]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[52]),
        .Q(out[52]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][35]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][35]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[51]),
        .Q(out[51]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][36]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][36]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[50]),
        .Q(out[50]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][37]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][37]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[49]),
        .Q(out[49]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][38]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][38]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[48]),
        .Q(out[48]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][39]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][39]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[47]),
        .Q(out[47]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][40]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][40]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[46]),
        .Q(out[46]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][41]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][41]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[45]),
        .Q(out[45]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][42]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][42]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[44]),
        .Q(out[44]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][43]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][43]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[43]),
        .Q(out[43]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][44]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][44]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[42]),
        .Q(out[42]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][45]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][45]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[41]),
        .Q(out[41]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][46]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][46]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[40]),
        .Q(out[40]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][47]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][47]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[39]),
        .Q(out[39]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][48]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][48]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[38]),
        .Q(out[38]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][49]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][49]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[37]),
        .Q(out[37]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][50]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][50]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[36]),
        .Q(out[36]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][51]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][51]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[35]),
        .Q(out[35]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][52]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][52]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[34]),
        .Q(out[34]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][53]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][53]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[33]),
        .Q(out[33]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][54]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][54]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[32]),
        .Q(out[32]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][55]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][55]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[31]),
        .Q(out[31]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][56]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][56]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[30]),
        .Q(out[30]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][57]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][57]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[29]),
        .Q(out[29]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][58]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][58]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[28]),
        .Q(out[28]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][59]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][59]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[27]),
        .Q(out[27]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][60]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][60]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[26]),
        .Q(out[26]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][61]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][61]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[25]),
        .Q(out[25]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][62]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][62]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[24]),
        .Q(out[24]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][63]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][63]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[23]),
        .Q(out[23]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][64]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][64]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[22]),
        .Q(out[22]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][65]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][65]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[21]),
        .Q(out[21]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][66]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][66]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[20]),
        .Q(out[20]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][67]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][67]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[19]),
        .Q(out[19]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][68]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][68]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[18]),
        .Q(out[18]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][69]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][69]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[17]),
        .Q(out[17]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][70]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][70]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[16]),
        .Q(out[16]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][71]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][71]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[15]),
        .Q(out[15]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][72]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][72]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[14]),
        .Q(out[14]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][73]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][73]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[13]),
        .Q(out[13]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][74]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][74]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[12]),
        .Q(out[12]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][75]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][75]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[11]),
        .Q(out[11]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][76]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][76]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[10]),
        .Q(out[10]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][77]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][77]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[9]),
        .Q(out[9]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][78]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][78]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[8]),
        .Q(out[8]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][79]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][79]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[7]),
        .Q(out[7]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][80]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][80]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[6]),
        .Q(out[6]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][81]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][81]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[5]),
        .Q(out[5]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][82]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][82]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[4]),
        .Q(out[4]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][83]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][83]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[3]),
        .Q(out[3]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][84]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][84]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[2]),
        .Q(out[2]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][85]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][85]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[1]),
        .Q(out[1]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][86]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][86]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[0]),
        .Q(out[0]));
  LUT3 #(
    .INIT(8'h40)) 
    \data_reg[3][86]_srl4_i_1 
       (.I0(FIFO_Full_reg_n_0),
        .I1(sig_mstr2addr_cmd_valid),
        .I2(sig_inhibit_rdy_n),
        .O(FIFO_Full_reg_0));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_ADDR_CNTL/GEN_ADDR_FIFO.I_ADDR_QUAL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][8]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][8]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[70]),
        .Q(out[71]));
  LUT1 #(
    .INIT(2'h1)) 
    sig_addr_valid_reg_i_1
       (.I0(out[71]),
        .O(sm_set_error_reg));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \sig_next_addr_reg[63]_i_2 
       (.I0(sig_data2addr_stop_req),
        .I1(FIFO_Full_reg_1),
        .I2(\addr_i_reg_n_0_[2] ),
        .O(sig_push_addr_reg1_out));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    sig_posted_to_axi_2_i_1
       (.I0(\addr_i_reg_n_0_[2] ),
        .I1(FIFO_Full_reg_1),
        .I2(sig_data2addr_stop_req),
        .I3(sig_mmap_rst_reg_n),
        .O(\addr_i_reg[2]_0 ));
endmodule

(* ORIG_REF_NAME = "axi_datamover_v5_1_37_srl_fifo" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo__parameterized0
   (sig_first_dbeat_reg,
    sig_dqual_reg_empty_reg,
    FIFO_Full_reg_0,
    E,
    SR,
    D,
    sig_mmap_rst_reg_n_reg,
    sig_mmap_rst_reg_n_reg_0,
    out,
    sig_mmap_rst,
    m_axi_mm2s_aclk,
    sig_first_dbeat_reg_0,
    sig_mmap_rst_reg_n,
    sig_last_dbeat__1,
    sig_inhibit_rdy_n,
    sig_mstr2data_cmd_valid,
    \sig_dbeat_cntr_reg[0] ,
    sig_good_mmap_dbeat10_out__0,
    sig_dbeat_cntr_eq_1,
    m_axi_mm2s_rlast,
    sig_dqual_reg_full,
    sig_next_calc_error_reg,
    Q,
    \sig_dbeat_cntr_reg[5] ,
    \sig_dbeat_cntr_reg[4] ,
    sig_ld_new_cmd_reg,
    sig_dqual_reg_empty,
    sig_rsc2stat_status_valid,
    sig_stat2rsc_status_ready,
    sig_dqual_reg_empty_reg_0,
    sig_last_dbeat_reg,
    in);
  output sig_first_dbeat_reg;
  output sig_dqual_reg_empty_reg;
  output FIFO_Full_reg_0;
  output [0:0]E;
  output [0:0]SR;
  output [7:0]D;
  output sig_mmap_rst_reg_n_reg;
  output sig_mmap_rst_reg_n_reg_0;
  output [10:0]out;
  input sig_mmap_rst;
  input m_axi_mm2s_aclk;
  input sig_first_dbeat_reg_0;
  input sig_mmap_rst_reg_n;
  input sig_last_dbeat__1;
  input sig_inhibit_rdy_n;
  input sig_mstr2data_cmd_valid;
  input \sig_dbeat_cntr_reg[0] ;
  input sig_good_mmap_dbeat10_out__0;
  input sig_dbeat_cntr_eq_1;
  input m_axi_mm2s_rlast;
  input sig_dqual_reg_full;
  input sig_next_calc_error_reg;
  input [7:0]Q;
  input \sig_dbeat_cntr_reg[5] ;
  input \sig_dbeat_cntr_reg[4] ;
  input sig_ld_new_cmd_reg;
  input sig_dqual_reg_empty;
  input sig_rsc2stat_status_valid;
  input sig_stat2rsc_status_ready;
  input [2:0]sig_dqual_reg_empty_reg_0;
  input sig_last_dbeat_reg;
  input [9:0]in;

  wire [7:0]D;
  wire [0:0]E;
  wire FIFO_Full_reg_0;
  wire FIFO_Full_reg_n_0;
  wire [7:0]Q;
  wire [0:0]SR;
  wire [1:0]addr_i;
  wire [2:0]addr_i_p1;
  wire \addr_i_reg_n_0_[2] ;
  wire fifo_full_p1;
  wire [9:0]in;
  wire m_axi_mm2s_aclk;
  wire m_axi_mm2s_rlast;
  wire [10:0]out;
  wire sig_addr_posted_cntr_max__1;
  wire [10:6]sig_cmd_fifo_data_out;
  wire sig_dbeat_cntr_eq_1;
  wire \sig_dbeat_cntr_reg[0] ;
  wire \sig_dbeat_cntr_reg[4] ;
  wire \sig_dbeat_cntr_reg[5] ;
  wire sig_dqual_reg_empty;
  wire sig_dqual_reg_empty_reg;
  wire [2:0]sig_dqual_reg_empty_reg_0;
  wire sig_dqual_reg_full;
  wire sig_first_dbeat_reg;
  wire sig_first_dbeat_reg_0;
  wire sig_good_mmap_dbeat10_out__0;
  wire sig_inhibit_rdy_n;
  wire sig_last_dbeat3_out;
  wire sig_last_dbeat__1;
  wire sig_last_dbeat_reg;
  wire sig_ld_new_cmd_reg;
  wire sig_mmap_rst;
  wire sig_mmap_rst_reg_n;
  wire sig_mmap_rst_reg_n_reg;
  wire sig_mmap_rst_reg_n_reg_0;
  wire sig_mstr2data_cmd_valid;
  wire sig_new_len_eq_0;
  wire sig_next_calc_error_reg;
  wire sig_rsc2stat_status_valid;
  wire sig_stat2rsc_status_ready;

  LUT5 #(
    .INIT(32'h00008048)) 
    FIFO_Full_i_1__0
       (.I0(addr_i[0]),
        .I1(addr_i[1]),
        .I2(FIFO_Full_reg_0),
        .I3(sig_dqual_reg_empty_reg),
        .I4(\addr_i_reg_n_0_[2] ),
        .O(fifo_full_p1));
  FDRE FIFO_Full_reg
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(fifo_full_p1),
        .Q(FIFO_Full_reg_n_0),
        .R(sig_mmap_rst));
  LUT6 #(
    .INIT(64'hF708F7F708F70808)) 
    \addr_i[0]_i_1__0 
       (.I0(sig_inhibit_rdy_n),
        .I1(sig_mstr2data_cmd_valid),
        .I2(FIFO_Full_reg_n_0),
        .I3(\addr_i_reg_n_0_[2] ),
        .I4(sig_dqual_reg_empty_reg),
        .I5(addr_i[0]),
        .O(addr_i_p1[0]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'h4FB0FB04)) 
    \addr_i[1]_i_1__0 
       (.I0(\addr_i_reg_n_0_[2] ),
        .I1(sig_dqual_reg_empty_reg),
        .I2(FIFO_Full_reg_0),
        .I3(addr_i[1]),
        .I4(addr_i[0]),
        .O(addr_i_p1[1]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'h7F7F0180)) 
    \addr_i[2]_i_1__0 
       (.I0(addr_i[1]),
        .I1(addr_i[0]),
        .I2(FIFO_Full_reg_0),
        .I3(sig_dqual_reg_empty_reg),
        .I4(\addr_i_reg_n_0_[2] ),
        .O(addr_i_p1[2]));
  FDSE \addr_i_reg[0] 
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(addr_i_p1[0]),
        .Q(addr_i[0]),
        .S(sig_mmap_rst));
  FDSE \addr_i_reg[1] 
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(addr_i_p1[1]),
        .Q(addr_i[1]),
        .S(sig_mmap_rst));
  FDSE \addr_i_reg[2] 
       (.C(m_axi_mm2s_aclk),
        .CE(1'b1),
        .D(addr_i_p1[2]),
        .Q(\addr_i_reg_n_0_[2] ),
        .S(sig_mmap_rst));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][10]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][10]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[6]),
        .Q(out[6]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][11]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][11]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[5]),
        .Q(out[5]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][12]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][12]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(1'b1),
        .Q(out[4]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][13]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][13]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(1'b1),
        .Q(out[3]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][14]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][14]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(1'b1),
        .Q(out[2]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][15]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][15]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(1'b1),
        .Q(out[1]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][16]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][16]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(1'b1),
        .Q(out[0]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][20]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][20]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[4]),
        .Q(sig_cmd_fifo_data_out[10]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][21]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][21]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[3]),
        .Q(sig_cmd_fifo_data_out[9]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][22]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][22]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[2]),
        .Q(sig_cmd_fifo_data_out[8]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][23]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][23]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[1]),
        .Q(sig_cmd_fifo_data_out[7]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][24]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][24]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[0]),
        .Q(sig_cmd_fifo_data_out[6]));
  LUT3 #(
    .INIT(8'h40)) 
    \data_reg[3][24]_srl4_i_1 
       (.I0(FIFO_Full_reg_n_0),
        .I1(sig_mstr2data_cmd_valid),
        .I2(sig_inhibit_rdy_n),
        .O(FIFO_Full_reg_0));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][4]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][4]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[9]),
        .Q(out[10]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][5]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][5]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(1'b1),
        .Q(out[9]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][7]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][7]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[8]),
        .Q(out[8]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RD_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][9]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][9]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_mm2s_aclk),
        .D(in[7]),
        .Q(out[7]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h8B)) 
    \sig_dbeat_cntr[0]_i_1 
       (.I0(sig_cmd_fifo_data_out[6]),
        .I1(sig_dqual_reg_empty_reg),
        .I2(Q[0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'hF909)) 
    \sig_dbeat_cntr[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(sig_dqual_reg_empty_reg),
        .I3(sig_cmd_fifo_data_out[7]),
        .O(D[1]));
  LUT5 #(
    .INIT(32'hFFE100E1)) 
    \sig_dbeat_cntr[2]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(sig_dqual_reg_empty_reg),
        .I4(sig_cmd_fifo_data_out[8]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hFFFFAAA90000AAA9)) 
    \sig_dbeat_cntr[3]_i_1 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(sig_dqual_reg_empty_reg),
        .I5(sig_cmd_fifo_data_out[9]),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hFFFFAAA90000AAA9)) 
    \sig_dbeat_cntr[4]_i_1 
       (.I0(Q[4]),
        .I1(\sig_dbeat_cntr_reg[4] ),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(sig_dqual_reg_empty_reg),
        .I5(sig_cmd_fifo_data_out[10]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'h21)) 
    \sig_dbeat_cntr[5]_i_1 
       (.I0(\sig_dbeat_cntr_reg[5] ),
        .I1(sig_dqual_reg_empty_reg),
        .I2(Q[5]),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h0E01)) 
    \sig_dbeat_cntr[6]_i_1 
       (.I0(\sig_dbeat_cntr_reg[5] ),
        .I1(Q[5]),
        .I2(sig_dqual_reg_empty_reg),
        .I3(Q[6]),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \sig_dbeat_cntr[7]_i_1 
       (.I0(\sig_dbeat_cntr_reg[0] ),
        .I1(sig_dqual_reg_empty_reg),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h00FE0001)) 
    \sig_dbeat_cntr[7]_i_2 
       (.I0(Q[5]),
        .I1(\sig_dbeat_cntr_reg[5] ),
        .I2(Q[6]),
        .I3(sig_dqual_reg_empty_reg),
        .I4(Q[7]),
        .O(D[7]));
  LUT5 #(
    .INIT(32'h303000A0)) 
    sig_first_dbeat_i_1
       (.I0(sig_first_dbeat_reg_0),
        .I1(sig_new_len_eq_0),
        .I2(sig_mmap_rst_reg_n),
        .I3(sig_last_dbeat__1),
        .I4(sig_dqual_reg_empty_reg),
        .O(sig_first_dbeat_reg));
  LUT5 #(
    .INIT(32'h00000001)) 
    sig_first_dbeat_i_2
       (.I0(sig_cmd_fifo_data_out[6]),
        .I1(sig_cmd_fifo_data_out[7]),
        .I2(sig_cmd_fifo_data_out[8]),
        .I3(sig_cmd_fifo_data_out[10]),
        .I4(sig_cmd_fifo_data_out[9]),
        .O(sig_new_len_eq_0));
  LUT5 #(
    .INIT(32'hABAAA8AA)) 
    sig_last_dbeat_i_1
       (.I0(sig_last_dbeat3_out),
        .I1(sig_last_dbeat__1),
        .I2(sig_dqual_reg_empty_reg),
        .I3(sig_mmap_rst_reg_n),
        .I4(sig_last_dbeat_reg),
        .O(sig_mmap_rst_reg_n_reg_0));
  LUT5 #(
    .INIT(32'hA0A0C000)) 
    sig_last_dbeat_i_2
       (.I0(sig_new_len_eq_0),
        .I1(sig_good_mmap_dbeat10_out__0),
        .I2(sig_mmap_rst_reg_n),
        .I3(sig_dbeat_cntr_eq_1),
        .I4(sig_dqual_reg_empty_reg),
        .O(sig_last_dbeat3_out));
  LUT3 #(
    .INIT(8'h20)) 
    sig_ld_new_cmd_reg_i_1
       (.I0(sig_mmap_rst_reg_n),
        .I1(sig_ld_new_cmd_reg),
        .I2(sig_dqual_reg_empty_reg),
        .O(sig_mmap_rst_reg_n_reg));
  LUT6 #(
    .INIT(64'h00000080FFFFFFFF)) 
    sig_next_cmd_cmplt_reg_i_1
       (.I0(sig_good_mmap_dbeat10_out__0),
        .I1(m_axi_mm2s_rlast),
        .I2(sig_dqual_reg_full),
        .I3(sig_next_calc_error_reg),
        .I4(sig_dqual_reg_empty_reg),
        .I5(sig_mmap_rst_reg_n),
        .O(SR));
  LUT6 #(
    .INIT(64'h0002000200000002)) 
    sig_next_cmd_cmplt_reg_i_2
       (.I0(sig_dqual_reg_empty),
        .I1(\addr_i_reg_n_0_[2] ),
        .I2(sig_next_calc_error_reg),
        .I3(sig_addr_posted_cntr_max__1),
        .I4(sig_rsc2stat_status_valid),
        .I5(sig_stat2rsc_status_ready),
        .O(sig_dqual_reg_empty_reg));
  LUT3 #(
    .INIT(8'h80)) 
    sig_next_cmd_cmplt_reg_i_4
       (.I0(sig_dqual_reg_empty_reg_0[2]),
        .I1(sig_dqual_reg_empty_reg_0[1]),
        .I2(sig_dqual_reg_empty_reg_0[0]),
        .O(sig_addr_posted_cntr_max__1));
endmodule

(* ORIG_REF_NAME = "axi_datamover_v5_1_37_srl_fifo" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo__parameterized1
   (m_axi_s2mm_bready,
    E,
    D,
    \addr_i_reg[3]_0 ,
    sig_coelsc_decerr_reg0,
    sig_coelsc_slverr_reg0,
    \addr_i_reg[3]_1 ,
    m_axi_s2mm_aclk,
    sig_inhibit_rdy_n,
    m_axi_s2mm_bready_0,
    Q,
    out,
    m_axi_s2mm_bvalid,
    sig_push_coelsc_reg,
    \GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_reg ,
    \GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_reg_0 ,
    m_axi_s2mm_bresp);
  output m_axi_s2mm_bready;
  output [0:0]E;
  output [2:0]D;
  output [0:0]\addr_i_reg[3]_0 ;
  output sig_coelsc_decerr_reg0;
  output sig_coelsc_slverr_reg0;
  input [0:0]\addr_i_reg[3]_1 ;
  input m_axi_s2mm_aclk;
  input sig_inhibit_rdy_n;
  input m_axi_s2mm_bready_0;
  input [3:0]Q;
  input out;
  input m_axi_s2mm_bvalid;
  input sig_push_coelsc_reg;
  input [0:0]\GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_reg ;
  input [1:0]\GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_reg_0 ;
  input [1:0]m_axi_s2mm_bresp;

  wire [2:0]D;
  wire [0:0]E;
  wire FIFO_Full_reg_n_0;
  wire [0:0]\GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_reg ;
  wire [1:0]\GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_reg_0 ;
  wire [3:0]Q;
  wire \USE_SRL_FIFO.sig_wr_fifo ;
  wire [2:0]addr_i;
  wire [3:0]addr_i_p1;
  wire [0:0]\addr_i_reg[3]_0 ;
  wire [0:0]\addr_i_reg[3]_1 ;
  wire fifo_full_p1;
  wire m_axi_s2mm_aclk;
  wire m_axi_s2mm_bready;
  wire m_axi_s2mm_bready_0;
  wire [1:0]m_axi_s2mm_bresp;
  wire m_axi_s2mm_bvalid;
  wire out;
  wire sig_coelsc_decerr_reg0;
  wire sig_coelsc_slverr_reg0;
  wire sig_decr_addr_posted_cntr0_out;
  wire sig_inhibit_rdy_n;
  wire sig_push_coelsc_reg;
  wire [1:0]sig_wresp_sfifo_out;

  LUT6 #(
    .INIT(64'h0000000008200208)) 
    FIFO_Full_i_1__1
       (.I0(addr_i[2]),
        .I1(addr_i[0]),
        .I2(addr_i[1]),
        .I3(\USE_SRL_FIFO.sig_wr_fifo ),
        .I4(sig_push_coelsc_reg),
        .I5(\addr_i_reg[3]_0 ),
        .O(fifo_full_p1));
  FDRE FIFO_Full_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(fifo_full_p1),
        .Q(FIFO_Full_reg_n_0),
        .R(\addr_i_reg[3]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT4 #(
    .INIT(16'h0F08)) 
    \GEN_OMIT_INDET_BTT.sig_coelsc_decerr_reg_i_1 
       (.I0(sig_wresp_sfifo_out[0]),
        .I1(sig_wresp_sfifo_out[1]),
        .I2(\GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_reg ),
        .I3(\GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_reg_0 [0]),
        .O(sig_coelsc_decerr_reg0));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT4 #(
    .INIT(16'h0F02)) 
    \GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_i_1 
       (.I0(sig_wresp_sfifo_out[1]),
        .I1(sig_wresp_sfifo_out[0]),
        .I2(\GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_reg ),
        .I3(\GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_reg_0 [1]),
        .O(sig_coelsc_slverr_reg0));
  LUT6 #(
    .INIT(64'hDF20DFDF20DF2020)) 
    \addr_i[0]_i_1__1 
       (.I0(sig_inhibit_rdy_n),
        .I1(FIFO_Full_reg_n_0),
        .I2(m_axi_s2mm_bvalid),
        .I3(\addr_i_reg[3]_0 ),
        .I4(sig_push_coelsc_reg),
        .I5(addr_i[0]),
        .O(addr_i_p1[0]));
  LUT5 #(
    .INIT(32'h4FB0FB04)) 
    \addr_i[1]_i_1__1 
       (.I0(\addr_i_reg[3]_0 ),
        .I1(sig_push_coelsc_reg),
        .I2(\USE_SRL_FIFO.sig_wr_fifo ),
        .I3(addr_i[1]),
        .I4(addr_i[0]),
        .O(addr_i_p1[1]));
  LUT6 #(
    .INIT(64'h7F7FFE7F80800180)) 
    \addr_i[2]_i_1__1 
       (.I0(addr_i[1]),
        .I1(addr_i[0]),
        .I2(\USE_SRL_FIFO.sig_wr_fifo ),
        .I3(sig_push_coelsc_reg),
        .I4(\addr_i_reg[3]_0 ),
        .I5(addr_i[2]),
        .O(addr_i_p1[2]));
  LUT6 #(
    .INIT(64'h7FFF7FFF00018000)) 
    \addr_i[3]_i_1 
       (.I0(addr_i[0]),
        .I1(addr_i[1]),
        .I2(addr_i[2]),
        .I3(\USE_SRL_FIFO.sig_wr_fifo ),
        .I4(sig_push_coelsc_reg),
        .I5(\addr_i_reg[3]_0 ),
        .O(addr_i_p1[3]));
  FDSE \addr_i_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(addr_i_p1[0]),
        .Q(addr_i[0]),
        .S(\addr_i_reg[3]_1 ));
  FDSE \addr_i_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(addr_i_p1[1]),
        .Q(addr_i[1]),
        .S(\addr_i_reg[3]_1 ));
  FDSE \addr_i_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(addr_i_p1[2]),
        .Q(addr_i[2]),
        .S(\addr_i_reg[3]_1 ));
  FDSE \addr_i_reg[3] 
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(addr_i_p1[3]),
        .Q(\addr_i_reg[3]_0 ),
        .S(\addr_i_reg[3]_1 ));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_STATUS_CNTLR/I_WRESP_STATUS_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[5] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_STATUS_CNTLR/I_WRESP_STATUS_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[5][0]_srl6 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[5][0]_srl6 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(addr_i[2]),
        .A3(1'b0),
        .CE(\USE_SRL_FIFO.sig_wr_fifo ),
        .CLK(m_axi_s2mm_aclk),
        .D(m_axi_s2mm_bresp[1]),
        .Q(sig_wresp_sfifo_out[1]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_STATUS_CNTLR/I_WRESP_STATUS_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[5] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_STATUS_CNTLR/I_WRESP_STATUS_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[5][1]_srl6 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[5][1]_srl6 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(addr_i[2]),
        .A3(1'b0),
        .CE(\USE_SRL_FIFO.sig_wr_fifo ),
        .CLK(m_axi_s2mm_aclk),
        .D(m_axi_s2mm_bresp[0]),
        .Q(sig_wresp_sfifo_out[0]));
  LUT3 #(
    .INIT(8'h20)) 
    \data_reg[5][1]_srl6_i_1 
       (.I0(m_axi_s2mm_bvalid),
        .I1(FIFO_Full_reg_n_0),
        .I2(sig_inhibit_rdy_n),
        .O(\USE_SRL_FIFO.sig_wr_fifo ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    m_axi_s2mm_bready_INST_0
       (.I0(FIFO_Full_reg_n_0),
        .I1(sig_inhibit_rdy_n),
        .I2(m_axi_s2mm_bready_0),
        .O(m_axi_s2mm_bready));
  LUT6 #(
    .INIT(64'hAAAAD5AA5555AA55)) 
    \sig_addr_posted_cntr[1]_i_1__0 
       (.I0(Q[0]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(out),
        .I4(sig_decr_addr_posted_cntr0_out),
        .I5(Q[1]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hFFDF00A0AAFA5505)) 
    \sig_addr_posted_cntr[2]_i_1__0 
       (.I0(Q[0]),
        .I1(Q[3]),
        .I2(out),
        .I3(sig_decr_addr_posted_cntr0_out),
        .I4(Q[2]),
        .I5(Q[1]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h0000FFFE7FFF0000)) 
    \sig_addr_posted_cntr[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[3]),
        .I3(Q[2]),
        .I4(out),
        .I5(sig_decr_addr_posted_cntr0_out),
        .O(E));
  LUT6 #(
    .INIT(64'hFFFF0800FFAE0051)) 
    \sig_addr_posted_cntr[3]_i_2 
       (.I0(Q[0]),
        .I1(out),
        .I2(sig_decr_addr_posted_cntr0_out),
        .I3(Q[1]),
        .I4(Q[3]),
        .I5(Q[2]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \sig_addr_posted_cntr[3]_i_3 
       (.I0(FIFO_Full_reg_n_0),
        .I1(sig_inhibit_rdy_n),
        .I2(m_axi_s2mm_bvalid),
        .O(sig_decr_addr_posted_cntr0_out));
endmodule

(* ORIG_REF_NAME = "axi_datamover_v5_1_37_srl_fifo" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo__parameterized2
   (FIFO_Full_reg_0,
    sig_coelsc_interr_reg0,
    out,
    \addr_i_reg[3]_0 ,
    E,
    \sig_wdc_statcnt_reg[0] ,
    sig_data2wsc_cmd_cmplt_reg,
    \addr_i_reg[3]_1 ,
    m_axi_s2mm_aclk,
    D,
    \USE_SRL_FIFO.sig_wr_fifo ,
    sig_inhibit_rdy_n,
    sig_push_to_wsc,
    sig_tlast_err_stop,
    Q,
    \GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ,
    sig_coelsc_reg_empty,
    in);
  output FIFO_Full_reg_0;
  output sig_coelsc_interr_reg0;
  output [1:0]out;
  output \addr_i_reg[3]_0 ;
  output [0:0]E;
  output [2:0]\sig_wdc_statcnt_reg[0] ;
  output sig_data2wsc_cmd_cmplt_reg;
  input [0:0]\addr_i_reg[3]_1 ;
  input m_axi_s2mm_aclk;
  input [0:0]D;
  input \USE_SRL_FIFO.sig_wr_fifo ;
  input sig_inhibit_rdy_n;
  input sig_push_to_wsc;
  input sig_tlast_err_stop;
  input [3:0]Q;
  input [0:0]\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ;
  input sig_coelsc_reg_empty;
  input [2:0]in;

  wire [0:0]D;
  wire [0:0]E;
  wire FIFO_Full_reg_0;
  wire [0:0]\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ;
  wire [1:1]\GEN_OMIT_INDET_BTT.sig_dcntl_sfifo_out ;
  wire [3:0]Q;
  wire \USE_SRL_FIFO.sig_rd_fifo__0 ;
  wire \USE_SRL_FIFO.sig_wr_fifo ;
  wire [2:0]addr_i;
  wire [3:0]addr_i_p1;
  wire \addr_i_reg[3]_0 ;
  wire [0:0]\addr_i_reg[3]_1 ;
  wire \addr_i_reg_n_0_[3] ;
  wire fifo_full_p1;
  wire [2:0]in;
  wire m_axi_s2mm_aclk;
  wire [1:0]out;
  wire sig_coelsc_interr_reg0;
  wire sig_coelsc_reg_empty;
  wire sig_data2wsc_cmd_cmplt_reg;
  wire sig_inhibit_rdy_n;
  wire sig_push_to_wsc;
  wire sig_tlast_err_stop;
  wire [2:0]\sig_wdc_statcnt_reg[0] ;

  LUT6 #(
    .INIT(64'h0000000008200208)) 
    FIFO_Full_i_1__2
       (.I0(addr_i[2]),
        .I1(addr_i[0]),
        .I2(addr_i[1]),
        .I3(\USE_SRL_FIFO.sig_wr_fifo ),
        .I4(\addr_i_reg[3]_0 ),
        .I5(\addr_i_reg_n_0_[3] ),
        .O(fifo_full_p1));
  FDRE FIFO_Full_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(fifo_full_p1),
        .Q(FIFO_Full_reg_0),
        .R(\addr_i_reg[3]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT5 #(
    .INIT(32'h44444404)) 
    \GEN_OMIT_INDET_BTT.sig_coelsc_interr_reg_i_2 
       (.I0(\addr_i_reg_n_0_[3] ),
        .I1(sig_coelsc_reg_empty),
        .I2(\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ),
        .I3(out[1]),
        .I4(\GEN_OMIT_INDET_BTT.sig_dcntl_sfifo_out ),
        .O(\addr_i_reg[3]_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \GEN_OMIT_INDET_BTT.sig_coelsc_interr_reg_i_3 
       (.I0(\GEN_OMIT_INDET_BTT.sig_dcntl_sfifo_out ),
        .I1(out[1]),
        .I2(D),
        .O(sig_coelsc_interr_reg0));
  LUT1 #(
    .INIT(2'h1)) 
    \GEN_OMIT_INDET_BTT.sig_coelsc_reg_empty_i_1 
       (.I0(out[0]),
        .O(sig_data2wsc_cmd_cmplt_reg));
  LUT6 #(
    .INIT(64'h0020FFDFFFDF0020)) 
    \addr_i[0]_i_1__2 
       (.I0(sig_inhibit_rdy_n),
        .I1(FIFO_Full_reg_0),
        .I2(sig_push_to_wsc),
        .I3(sig_tlast_err_stop),
        .I4(\USE_SRL_FIFO.sig_rd_fifo__0 ),
        .I5(addr_i[0]),
        .O(addr_i_p1[0]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT5 #(
    .INIT(32'h0000EF00)) 
    \addr_i[0]_i_2 
       (.I0(\GEN_OMIT_INDET_BTT.sig_dcntl_sfifo_out ),
        .I1(out[1]),
        .I2(\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ),
        .I3(sig_coelsc_reg_empty),
        .I4(\addr_i_reg_n_0_[3] ),
        .O(\USE_SRL_FIFO.sig_rd_fifo__0 ));
  LUT5 #(
    .INIT(32'h4FB0FB04)) 
    \addr_i[1]_i_1__2 
       (.I0(\addr_i_reg_n_0_[3] ),
        .I1(\addr_i_reg[3]_0 ),
        .I2(\USE_SRL_FIFO.sig_wr_fifo ),
        .I3(addr_i[1]),
        .I4(addr_i[0]),
        .O(addr_i_p1[1]));
  LUT6 #(
    .INIT(64'h6A66AAAAAAAAA9AA)) 
    \addr_i[2]_i_1__2 
       (.I0(addr_i[2]),
        .I1(\USE_SRL_FIFO.sig_wr_fifo ),
        .I2(\addr_i_reg_n_0_[3] ),
        .I3(\addr_i_reg[3]_0 ),
        .I4(addr_i[1]),
        .I5(addr_i[0]),
        .O(addr_i_p1[2]));
  LUT6 #(
    .INIT(64'h7FFF7FFF00018000)) 
    \addr_i[3]_i_1__0 
       (.I0(addr_i[0]),
        .I1(addr_i[1]),
        .I2(addr_i[2]),
        .I3(\USE_SRL_FIFO.sig_wr_fifo ),
        .I4(\addr_i_reg[3]_0 ),
        .I5(\addr_i_reg_n_0_[3] ),
        .O(addr_i_p1[3]));
  FDSE \addr_i_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(addr_i_p1[0]),
        .Q(addr_i[0]),
        .S(\addr_i_reg[3]_1 ));
  FDSE \addr_i_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(addr_i_p1[1]),
        .Q(addr_i[1]),
        .S(\addr_i_reg[3]_1 ));
  FDSE \addr_i_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(addr_i_p1[2]),
        .Q(addr_i[2]),
        .S(\addr_i_reg[3]_1 ));
  FDSE \addr_i_reg[3] 
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(addr_i_p1[3]),
        .Q(\addr_i_reg_n_0_[3] ),
        .S(\addr_i_reg[3]_1 ));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_STATUS_CNTLR/GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[5] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_STATUS_CNTLR/GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[5][4]_srl6 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[5][4]_srl6 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(addr_i[2]),
        .A3(1'b0),
        .CE(\USE_SRL_FIFO.sig_wr_fifo ),
        .CLK(m_axi_s2mm_aclk),
        .D(in[2]),
        .Q(out[1]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_STATUS_CNTLR/GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[5] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_STATUS_CNTLR/GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[5][5]_srl6 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[5][5]_srl6 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(addr_i[2]),
        .A3(1'b0),
        .CE(\USE_SRL_FIFO.sig_wr_fifo ),
        .CLK(m_axi_s2mm_aclk),
        .D(in[1]),
        .Q(\GEN_OMIT_INDET_BTT.sig_dcntl_sfifo_out ));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_STATUS_CNTLR/GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[5] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_STATUS_CNTLR/GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[5][6]_srl6 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[5][6]_srl6 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(addr_i[2]),
        .A3(1'b0),
        .CE(\USE_SRL_FIFO.sig_wr_fifo ),
        .CLK(m_axi_s2mm_aclk),
        .D(in[0]),
        .Q(out[0]));
  LUT6 #(
    .INIT(64'hF00FF00F0FB0F00F)) 
    \sig_wdc_statcnt[1]_i_1 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\USE_SRL_FIFO.sig_wr_fifo ),
        .I5(\USE_SRL_FIFO.sig_rd_fifo__0 ),
        .O(\sig_wdc_statcnt_reg[0] [0]));
  LUT5 #(
    .INIT(32'hDF20BA45)) 
    \sig_wdc_statcnt[2]_i_1 
       (.I0(Q[0]),
        .I1(\USE_SRL_FIFO.sig_rd_fifo__0 ),
        .I2(\USE_SRL_FIFO.sig_wr_fifo ),
        .I3(Q[2]),
        .I4(Q[1]),
        .O(\sig_wdc_statcnt_reg[0] [1]));
  LUT6 #(
    .INIT(64'h6666666662666664)) 
    \sig_wdc_statcnt[3]_i_1 
       (.I0(\USE_SRL_FIFO.sig_rd_fifo__0 ),
        .I1(\USE_SRL_FIFO.sig_wr_fifo ),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[3]),
        .O(E));
  LUT6 #(
    .INIT(64'hDFFFFFBA20000045)) 
    \sig_wdc_statcnt[3]_i_2 
       (.I0(Q[0]),
        .I1(\USE_SRL_FIFO.sig_rd_fifo__0 ),
        .I2(\USE_SRL_FIFO.sig_wr_fifo ),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[3]),
        .O(\sig_wdc_statcnt_reg[0] [2]));
endmodule

(* ORIG_REF_NAME = "axi_datamover_v5_1_37_srl_fifo" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_v5_1_37_srl_fifo__parameterized3
   (sig_first_dbeat_reg,
    \GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ,
    SR,
    E,
    FIFO_Full_reg_0,
    sig_ld_new_cmd_reg_reg,
    D,
    sig_mmap_rst_reg_n_reg,
    out,
    \addr_i_reg[2]_0 ,
    m_axi_s2mm_aclk,
    sig_first_dbeat,
    sig_last_dbeat_reg,
    sig_last_dbeat__1,
    sig_good_mmap_dbeat12_out__0,
    sig_next_cmd_cmplt_reg_reg,
    sig_dqual_reg_full,
    sig_next_calc_error_reg,
    sig_dbeat_cntr_eq_1,
    sig_inhibit_rdy_n,
    sig_mstr2data_cmd_valid,
    sig_ld_new_cmd_reg,
    Q,
    \sig_dbeat_cntr_reg[5] ,
    \sig_dbeat_cntr_reg[4] ,
    sig_wsc2stat_status_valid,
    sig_stat2wsc_status_ready,
    sig_wdc_status_going_full,
    sig_dqual_reg_empty,
    sig_dqual_reg_empty_reg,
    sig_last_dbeat_reg_0,
    sig_next_calc_error_reg_reg);
  output sig_first_dbeat_reg;
  output \GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ;
  output [0:0]SR;
  output [0:0]E;
  output FIFO_Full_reg_0;
  output sig_ld_new_cmd_reg_reg;
  output [7:0]D;
  output sig_mmap_rst_reg_n_reg;
  output [10:0]out;
  input [0:0]\addr_i_reg[2]_0 ;
  input m_axi_s2mm_aclk;
  input sig_first_dbeat;
  input sig_last_dbeat_reg;
  input sig_last_dbeat__1;
  input sig_good_mmap_dbeat12_out__0;
  input sig_next_cmd_cmplt_reg_reg;
  input sig_dqual_reg_full;
  input sig_next_calc_error_reg;
  input sig_dbeat_cntr_eq_1;
  input sig_inhibit_rdy_n;
  input sig_mstr2data_cmd_valid;
  input sig_ld_new_cmd_reg;
  input [7:0]Q;
  input \sig_dbeat_cntr_reg[5] ;
  input \sig_dbeat_cntr_reg[4] ;
  input sig_wsc2stat_status_valid;
  input sig_stat2wsc_status_ready;
  input sig_wdc_status_going_full;
  input sig_dqual_reg_empty;
  input [2:0]sig_dqual_reg_empty_reg;
  input sig_last_dbeat_reg_0;
  input [9:0]sig_next_calc_error_reg_reg;

  wire [7:0]D;
  wire [0:0]E;
  wire FIFO_Full_reg_0;
  wire FIFO_Full_reg_n_0;
  wire \GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ;
  wire [7:0]Q;
  wire [0:0]SR;
  wire [1:0]addr_i;
  wire [2:0]addr_i_p1;
  wire [0:0]\addr_i_reg[2]_0 ;
  wire \addr_i_reg_n_0_[2] ;
  wire fifo_full_p1;
  wire m_axi_s2mm_aclk;
  wire [10:0]out;
  wire [10:6]sig_cmd_fifo_data_out;
  wire sig_dbeat_cntr_eq_1;
  wire \sig_dbeat_cntr_reg[4] ;
  wire \sig_dbeat_cntr_reg[5] ;
  wire sig_dqual_reg_empty;
  wire [2:0]sig_dqual_reg_empty_reg;
  wire sig_dqual_reg_full;
  wire sig_first_dbeat;
  wire sig_first_dbeat_reg;
  wire sig_good_mmap_dbeat12_out__0;
  wire sig_inhibit_rdy_n;
  wire sig_last_dbeat3_out;
  wire sig_last_dbeat__1;
  wire sig_last_dbeat_reg;
  wire sig_last_dbeat_reg_0;
  wire sig_ld_new_cmd_reg;
  wire sig_ld_new_cmd_reg_reg;
  wire sig_mmap_rst_reg_n_reg;
  wire sig_mstr2data_cmd_valid;
  wire sig_new_len_eq_0;
  wire sig_next_calc_error_reg;
  wire sig_next_calc_error_reg_i_4_n_0;
  wire [9:0]sig_next_calc_error_reg_reg;
  wire sig_next_cmd_cmplt_reg_reg;
  wire sig_stat2wsc_status_ready;
  wire sig_wdc_status_going_full;
  wire sig_wsc2stat_status_valid;

  LUT5 #(
    .INIT(32'h00008048)) 
    FIFO_Full_i_1__4
       (.I0(addr_i[0]),
        .I1(addr_i[1]),
        .I2(FIFO_Full_reg_0),
        .I3(\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ),
        .I4(\addr_i_reg_n_0_[2] ),
        .O(fifo_full_p1));
  FDRE FIFO_Full_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(fifo_full_p1),
        .Q(FIFO_Full_reg_n_0),
        .R(\addr_i_reg[2]_0 ));
  LUT6 #(
    .INIT(64'hF708F7F708F70808)) 
    \addr_i[0]_i_1__4 
       (.I0(sig_inhibit_rdy_n),
        .I1(sig_mstr2data_cmd_valid),
        .I2(FIFO_Full_reg_n_0),
        .I3(\addr_i_reg_n_0_[2] ),
        .I4(\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ),
        .I5(addr_i[0]),
        .O(addr_i_p1[0]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT5 #(
    .INIT(32'h4FB0FB04)) 
    \addr_i[1]_i_1__4 
       (.I0(\addr_i_reg_n_0_[2] ),
        .I1(\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ),
        .I2(FIFO_Full_reg_0),
        .I3(addr_i[1]),
        .I4(addr_i[0]),
        .O(addr_i_p1[1]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT5 #(
    .INIT(32'h7F7F0180)) 
    \addr_i[2]_i_1__4 
       (.I0(addr_i[1]),
        .I1(addr_i[0]),
        .I2(FIFO_Full_reg_0),
        .I3(\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ),
        .I4(\addr_i_reg_n_0_[2] ),
        .O(addr_i_p1[2]));
  FDSE \addr_i_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(addr_i_p1[0]),
        .Q(addr_i[0]),
        .S(\addr_i_reg[2]_0 ));
  FDSE \addr_i_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(addr_i_p1[1]),
        .Q(addr_i[1]),
        .S(\addr_i_reg[2]_0 ));
  FDSE \addr_i_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(addr_i_p1[2]),
        .Q(\addr_i_reg_n_0_[2] ),
        .S(\addr_i_reg[2]_0 ));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][0]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][0]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(sig_next_calc_error_reg_reg[9]),
        .Q(out[10]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][10]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][10]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(1'b1),
        .Q(out[2]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][11]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][11]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(1'b1),
        .Q(out[1]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][12]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][12]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(1'b1),
        .Q(out[0]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][16]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][16]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(sig_next_calc_error_reg_reg[4]),
        .Q(sig_cmd_fifo_data_out[10]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][17]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][17]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(sig_next_calc_error_reg_reg[3]),
        .Q(sig_cmd_fifo_data_out[9]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][18]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][18]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(sig_next_calc_error_reg_reg[2]),
        .Q(sig_cmd_fifo_data_out[8]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][19]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][19]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(sig_next_calc_error_reg_reg[1]),
        .Q(sig_cmd_fifo_data_out[7]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][1]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][1]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(1'b1),
        .Q(out[9]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][20]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][20]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(sig_next_calc_error_reg_reg[0]),
        .Q(sig_cmd_fifo_data_out[6]));
  LUT3 #(
    .INIT(8'h40)) 
    \data_reg[3][20]_srl4_i_1 
       (.I0(FIFO_Full_reg_n_0),
        .I1(sig_mstr2data_cmd_valid),
        .I2(sig_inhibit_rdy_n),
        .O(FIFO_Full_reg_0));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][3]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][3]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(sig_next_calc_error_reg_reg[8]),
        .Q(out[8]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][5]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][5]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(sig_next_calc_error_reg_reg[7]),
        .Q(out[7]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][6]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][6]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(sig_next_calc_error_reg_reg[6]),
        .Q(out[6]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][7]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][7]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(sig_next_calc_error_reg_reg[5]),
        .Q(out[5]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][8]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][8]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(1'b1),
        .Q(out[4]));
  (* srl_bus_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3] " *) 
  (* srl_name = "U0/\\I_PRMRY_DATAMOVER/GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_WR_DATA_CNTL/GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO/USE_SRL_FIFO.I_SYNC_FIFO/data_reg[3][9]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \data_reg[3][9]_srl4 
       (.A0(addr_i[0]),
        .A1(addr_i[1]),
        .A2(1'b0),
        .A3(1'b0),
        .CE(FIFO_Full_reg_0),
        .CLK(m_axi_s2mm_aclk),
        .D(1'b1),
        .Q(out[3]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'h8B)) 
    \sig_dbeat_cntr[0]_i_1__0 
       (.I0(sig_cmd_fifo_data_out[6]),
        .I1(\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ),
        .I2(Q[0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT4 #(
    .INIT(16'hF909)) 
    \sig_dbeat_cntr[1]_i_1__0 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ),
        .I3(sig_cmd_fifo_data_out[7]),
        .O(D[1]));
  LUT5 #(
    .INIT(32'hFFE100E1)) 
    \sig_dbeat_cntr[2]_i_1__0 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ),
        .I4(sig_cmd_fifo_data_out[8]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hFFFFAAA90000AAA9)) 
    \sig_dbeat_cntr[3]_i_1__0 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ),
        .I5(sig_cmd_fifo_data_out[9]),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hFFFFAAA90000AAA9)) 
    \sig_dbeat_cntr[4]_i_1__0 
       (.I0(Q[4]),
        .I1(\sig_dbeat_cntr_reg[4] ),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ),
        .I5(sig_cmd_fifo_data_out[10]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'h21)) 
    \sig_dbeat_cntr[5]_i_1__0 
       (.I0(\sig_dbeat_cntr_reg[5] ),
        .I1(\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ),
        .I2(Q[5]),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT4 #(
    .INIT(16'h0E01)) 
    \sig_dbeat_cntr[6]_i_1__0 
       (.I0(\sig_dbeat_cntr_reg[5] ),
        .I1(Q[5]),
        .I2(\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ),
        .I3(Q[6]),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    \sig_dbeat_cntr[7]_i_1__0 
       (.I0(sig_next_cmd_cmplt_reg_reg),
        .I1(sig_good_mmap_dbeat12_out__0),
        .I2(\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT5 #(
    .INIT(32'h00FE0001)) 
    \sig_dbeat_cntr[7]_i_2__0 
       (.I0(Q[5]),
        .I1(\sig_dbeat_cntr_reg[5] ),
        .I2(Q[6]),
        .I3(\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ),
        .I4(Q[7]),
        .O(D[7]));
  LUT5 #(
    .INIT(32'h303000A0)) 
    sig_first_dbeat_i_1__0
       (.I0(sig_first_dbeat),
        .I1(sig_new_len_eq_0),
        .I2(sig_last_dbeat_reg),
        .I3(sig_last_dbeat__1),
        .I4(\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ),
        .O(sig_first_dbeat_reg));
  LUT5 #(
    .INIT(32'h00000001)) 
    sig_first_dbeat_i_2__0
       (.I0(sig_cmd_fifo_data_out[6]),
        .I1(sig_cmd_fifo_data_out[7]),
        .I2(sig_cmd_fifo_data_out[8]),
        .I3(sig_cmd_fifo_data_out[10]),
        .I4(sig_cmd_fifo_data_out[9]),
        .O(sig_new_len_eq_0));
  LUT5 #(
    .INIT(32'hABAAA8AA)) 
    sig_last_dbeat_i_1__0
       (.I0(sig_last_dbeat3_out),
        .I1(sig_last_dbeat__1),
        .I2(\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ),
        .I3(sig_last_dbeat_reg),
        .I4(sig_last_dbeat_reg_0),
        .O(sig_mmap_rst_reg_n_reg));
  LUT5 #(
    .INIT(32'hA0A0C000)) 
    sig_last_dbeat_i_2__0
       (.I0(sig_new_len_eq_0),
        .I1(sig_good_mmap_dbeat12_out__0),
        .I2(sig_last_dbeat_reg),
        .I3(sig_dbeat_cntr_eq_1),
        .I4(\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ),
        .O(sig_last_dbeat3_out));
  LUT3 #(
    .INIT(8'h40)) 
    sig_ld_new_cmd_reg_i_1__0
       (.I0(sig_ld_new_cmd_reg),
        .I1(sig_last_dbeat_reg),
        .I2(\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ),
        .O(sig_ld_new_cmd_reg_reg));
  LUT6 #(
    .INIT(64'h00000080FFFFFFFF)) 
    sig_next_calc_error_reg_i_1
       (.I0(sig_good_mmap_dbeat12_out__0),
        .I1(sig_next_cmd_cmplt_reg_reg),
        .I2(sig_dqual_reg_full),
        .I3(sig_next_calc_error_reg),
        .I4(\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ),
        .I5(sig_last_dbeat_reg),
        .O(SR));
  LUT5 #(
    .INIT(32'h000000A2)) 
    sig_next_calc_error_reg_i_2
       (.I0(sig_next_calc_error_reg_i_4_n_0),
        .I1(sig_wsc2stat_status_valid),
        .I2(sig_stat2wsc_status_ready),
        .I3(sig_next_calc_error_reg),
        .I4(sig_wdc_status_going_full),
        .O(\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg ));
  LUT5 #(
    .INIT(32'h04444444)) 
    sig_next_calc_error_reg_i_4
       (.I0(\addr_i_reg_n_0_[2] ),
        .I1(sig_dqual_reg_empty),
        .I2(sig_dqual_reg_empty_reg[0]),
        .I3(sig_dqual_reg_empty_reg[1]),
        .I4(sig_dqual_reg_empty_reg[2]),
        .O(sig_next_calc_error_reg_i_4_n_0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_wr_status_cntl
   (D,
    FIFO_Full_reg,
    sig_halt_reg,
    sig_halt_reg_dly2,
    sig_halt_reg_dly3,
    sig_wsc2stat_status_valid,
    sig_wdc_status_going_full,
    E,
    m_axi_s2mm_bready,
    sig_mmap_rst_reg_n_reg,
    sig_mmap_rst_reg_n_reg_0,
    sig_inhibit_rdy_n,
    sig_wsc2rst_stop_cmplt,
    sig_data2addr_stop_req,
    sig_init_reg_reg,
    sig_data2skid_halt,
    sig_init_reg_reg_0,
    sig_halt_reg_dly3_reg_0,
    sig_coelsc_tag_reg0,
    m_axi_s2mm_aclk,
    \addr_i_reg[3] ,
    sig_stat2wsc_status_ready,
    out,
    m_axi_s2mm_bvalid,
    sig_init_done_reg,
    sig_init_done,
    sig_init_done_0,
    \USE_SRL_FIFO.sig_wr_fifo ,
    sig_push_to_wsc,
    sig_tlast_err_stop,
    sig_addr2wsc_calc_error,
    sig_data2all_tlast_error,
    wdc2skid_wready,
    sig_s_ready_dup_reg,
    s_axis_s2mm_tvalid,
    sig_s_ready_dup_reg_0,
    sig_stop_request,
    sig_mvalid_stop,
    m_axi_s2mm_bresp,
    in,
    sig_s_h_halt_reg);
  output [2:0]D;
  output FIFO_Full_reg;
  output sig_halt_reg;
  output sig_halt_reg_dly2;
  output sig_halt_reg_dly3;
  output sig_wsc2stat_status_valid;
  output sig_wdc_status_going_full;
  output [0:0]E;
  output m_axi_s2mm_bready;
  output sig_mmap_rst_reg_n_reg;
  output sig_mmap_rst_reg_n_reg_0;
  output sig_inhibit_rdy_n;
  output sig_wsc2rst_stop_cmplt;
  output sig_data2addr_stop_req;
  output sig_init_reg_reg;
  output sig_data2skid_halt;
  output sig_init_reg_reg_0;
  output sig_halt_reg_dly3_reg_0;
  input sig_coelsc_tag_reg0;
  input m_axi_s2mm_aclk;
  input [0:0]\addr_i_reg[3] ;
  input sig_stat2wsc_status_ready;
  input out;
  input m_axi_s2mm_bvalid;
  input sig_init_done_reg;
  input sig_init_done;
  input sig_init_done_0;
  input \USE_SRL_FIFO.sig_wr_fifo ;
  input sig_push_to_wsc;
  input sig_tlast_err_stop;
  input sig_addr2wsc_calc_error;
  input sig_data2all_tlast_error;
  input wdc2skid_wready;
  input sig_s_ready_dup_reg;
  input s_axis_s2mm_tvalid;
  input sig_s_ready_dup_reg_0;
  input sig_stop_request;
  input sig_mvalid_stop;
  input [1:0]m_axi_s2mm_bresp;
  input [2:0]in;
  input sig_s_h_halt_reg;

  wire [2:0]D;
  wire [0:0]E;
  wire FIFO_Full_reg;
  wire \GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO_n_10 ;
  wire \GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO_n_11 ;
  wire \GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO_n_7 ;
  wire \GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO_n_8 ;
  wire \GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO_n_9 ;
  wire [2:0]\GEN_OMIT_INDET_BTT.sig_dcntl_sfifo_out ;
  wire I_WRESP_STATUS_FIFO_n_1;
  wire I_WRESP_STATUS_FIFO_n_2;
  wire I_WRESP_STATUS_FIFO_n_3;
  wire I_WRESP_STATUS_FIFO_n_4;
  wire I_WRESP_STATUS_FIFO_n_5;
  wire I_WRESP_STATUS_FIFO_n_7;
  wire \USE_SRL_FIFO.sig_wr_fifo ;
  wire [0:0]\addr_i_reg[3] ;
  wire [2:0]in;
  wire m_axi_s2mm_aclk;
  wire m_axi_s2mm_bready;
  wire [1:0]m_axi_s2mm_bresp;
  wire m_axi_s2mm_bvalid;
  wire out;
  wire s_axis_s2mm_tvalid;
  wire sig_addr2wsc_calc_error;
  wire \sig_addr_posted_cntr[0]_i_1_n_0 ;
  wire [3:0]sig_addr_posted_cntr_reg;
  wire sig_coelsc_decerr_reg0;
  wire sig_coelsc_interr_reg0;
  wire sig_coelsc_reg_empty;
  wire sig_coelsc_slverr_reg0;
  wire sig_coelsc_tag_reg0;
  wire sig_data2addr_stop_req;
  wire sig_data2all_tlast_error;
  wire sig_data2skid_halt;
  wire sig_halt_reg;
  wire sig_halt_reg_dly1_reg_n_0;
  wire sig_halt_reg_dly2;
  wire sig_halt_reg_dly3;
  wire sig_halt_reg_dly3_reg_0;
  wire sig_halt_reg_i_1_n_0;
  wire sig_inhibit_rdy_n;
  wire sig_init_done;
  wire sig_init_done_0;
  wire sig_init_done_1;
  wire sig_init_done_reg;
  wire sig_init_reg_reg;
  wire sig_init_reg_reg_0;
  wire sig_mmap_rst_reg_n_reg;
  wire sig_mmap_rst_reg_n_reg_0;
  wire sig_mvalid_stop;
  wire sig_push_coelsc_reg;
  wire sig_push_to_wsc;
  wire sig_s_h_halt_reg;
  wire sig_s_ready_dup_i_2__0_n_0;
  wire sig_s_ready_dup_reg;
  wire sig_s_ready_dup_reg_0;
  wire sig_stat2wsc_status_ready;
  wire sig_statcnt_gt_eq_thres;
  wire sig_stop_request;
  wire sig_tlast_err_stop;
  wire \sig_wdc_statcnt[0]_i_1_n_0 ;
  wire [3:0]sig_wdc_statcnt_reg;
  wire sig_wdc_status_going_full;
  wire sig_wsc2rst_stop_cmplt;
  wire sig_wsc2stat_status_valid;
  wire wdc2skid_wready;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized4 \GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO 
       (.D(D[0]),
        .E(\GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO_n_7 ),
        .FIFO_Full_reg(FIFO_Full_reg),
        .\GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg (I_WRESP_STATUS_FIFO_n_5),
        .Q(sig_wdc_statcnt_reg),
        .\USE_SRL_FIFO.sig_wr_fifo (\USE_SRL_FIFO.sig_wr_fifo ),
        .\addr_i_reg[3] (\addr_i_reg[3] ),
        .in(in),
        .m_axi_s2mm_aclk(m_axi_s2mm_aclk),
        .out({\GEN_OMIT_INDET_BTT.sig_dcntl_sfifo_out [2],\GEN_OMIT_INDET_BTT.sig_dcntl_sfifo_out [0]}),
        .sig_coelsc_interr_reg0(sig_coelsc_interr_reg0),
        .sig_coelsc_reg_empty(sig_coelsc_reg_empty),
        .sig_data2wsc_cmd_cmplt_reg(\GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO_n_11 ),
        .sig_inhibit_rdy_n(sig_inhibit_rdy_n),
        .sig_init_done(sig_init_done_1),
        .sig_init_done_reg_0(I_WRESP_STATUS_FIFO_n_7),
        .sig_push_coelsc_reg(sig_push_coelsc_reg),
        .sig_push_to_wsc(sig_push_to_wsc),
        .sig_tlast_err_stop(sig_tlast_err_stop),
        .\sig_wdc_statcnt_reg[0] ({\GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO_n_8 ,\GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO_n_9 ,\GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO_n_10 }));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_OMIT_INDET_BTT.sig_coelsc_decerr_reg_reg 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_coelsc_reg),
        .D(sig_coelsc_decerr_reg0),
        .Q(D[1]),
        .R(sig_coelsc_tag_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_OMIT_INDET_BTT.sig_coelsc_interr_reg_reg 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_coelsc_reg),
        .D(sig_coelsc_interr_reg0),
        .Q(D[0]),
        .R(sig_coelsc_tag_reg0));
  FDSE #(
    .INIT(1'b0)) 
    \GEN_OMIT_INDET_BTT.sig_coelsc_reg_empty_reg 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_coelsc_reg),
        .D(\GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO_n_11 ),
        .Q(sig_coelsc_reg_empty),
        .S(sig_coelsc_tag_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_OMIT_INDET_BTT.sig_coelsc_reg_full_reg 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_coelsc_reg),
        .D(\GEN_OMIT_INDET_BTT.sig_dcntl_sfifo_out [0]),
        .Q(sig_wsc2stat_status_valid),
        .R(sig_coelsc_tag_reg0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_reg 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_coelsc_reg),
        .D(sig_coelsc_slverr_reg0),
        .Q(D[2]),
        .R(sig_coelsc_tag_reg0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized3 I_WRESP_STATUS_FIFO
       (.D({I_WRESP_STATUS_FIFO_n_2,I_WRESP_STATUS_FIFO_n_3,I_WRESP_STATUS_FIFO_n_4}),
        .E(I_WRESP_STATUS_FIFO_n_1),
        .\GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_reg (\GEN_OMIT_INDET_BTT.sig_dcntl_sfifo_out [2]),
        .\GEN_OMIT_INDET_BTT.sig_coelsc_slverr_reg_reg_0 (D[2:1]),
        .Q(sig_addr_posted_cntr_reg),
        .\addr_i_reg[3] (I_WRESP_STATUS_FIFO_n_5),
        .\addr_i_reg[3]_0 (\addr_i_reg[3] ),
        .m_axi_s2mm_aclk(m_axi_s2mm_aclk),
        .m_axi_s2mm_bready(m_axi_s2mm_bready),
        .m_axi_s2mm_bready_0(sig_halt_reg),
        .m_axi_s2mm_bresp(m_axi_s2mm_bresp),
        .m_axi_s2mm_bvalid(m_axi_s2mm_bvalid),
        .out(out),
        .s_axis_s2mm_tvalid(s_axis_s2mm_tvalid),
        .sig_coelsc_decerr_reg0(sig_coelsc_decerr_reg0),
        .sig_coelsc_slverr_reg0(sig_coelsc_slverr_reg0),
        .sig_init_done(sig_init_done),
        .sig_init_done_0(sig_init_done_0),
        .sig_init_done_1(sig_init_done_1),
        .sig_init_done_reg_0(sig_init_done_reg),
        .sig_init_reg_reg_0(sig_init_reg_reg),
        .sig_init_reg_reg_1(sig_init_reg_reg_0),
        .sig_mmap_rst_reg_n_reg(sig_mmap_rst_reg_n_reg),
        .sig_mmap_rst_reg_n_reg_0(I_WRESP_STATUS_FIFO_n_7),
        .sig_mmap_rst_reg_n_reg_1(sig_mmap_rst_reg_n_reg_0),
        .sig_mvalid_stop(sig_mvalid_stop),
        .sig_push_coelsc_reg(sig_push_coelsc_reg),
        .sig_s_ready_dup_reg(sig_s_ready_dup_i_2__0_n_0),
        .sig_s_ready_dup_reg_0(sig_s_ready_dup_reg),
        .sig_s_ready_dup_reg_1(sig_s_ready_dup_reg_0),
        .wdc2skid_wready(wdc2skid_wready));
  LUT2 #(
    .INIT(4'h8)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg[6]_i_1__0 
       (.I0(sig_wsc2stat_status_valid),
        .I1(sig_stat2wsc_status_ready),
        .O(E));
  LUT1 #(
    .INIT(2'h1)) 
    \sig_addr_posted_cntr[0]_i_1 
       (.I0(sig_addr_posted_cntr_reg[0]),
        .O(\sig_addr_posted_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sig_addr_posted_cntr_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(I_WRESP_STATUS_FIFO_n_1),
        .D(\sig_addr_posted_cntr[0]_i_1_n_0 ),
        .Q(sig_addr_posted_cntr_reg[0]),
        .R(\addr_i_reg[3] ));
  FDRE #(
    .INIT(1'b0)) 
    \sig_addr_posted_cntr_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(I_WRESP_STATUS_FIFO_n_1),
        .D(I_WRESP_STATUS_FIFO_n_4),
        .Q(sig_addr_posted_cntr_reg[1]),
        .R(\addr_i_reg[3] ));
  FDRE #(
    .INIT(1'b0)) 
    \sig_addr_posted_cntr_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(I_WRESP_STATUS_FIFO_n_1),
        .D(I_WRESP_STATUS_FIFO_n_3),
        .Q(sig_addr_posted_cntr_reg[2]),
        .R(\addr_i_reg[3] ));
  FDRE #(
    .INIT(1'b0)) 
    \sig_addr_posted_cntr_reg[3] 
       (.C(m_axi_s2mm_aclk),
        .CE(I_WRESP_STATUS_FIFO_n_1),
        .D(I_WRESP_STATUS_FIFO_n_2),
        .Q(sig_addr_posted_cntr_reg[3]),
        .R(\addr_i_reg[3] ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT2 #(
    .INIT(4'hE)) 
    sig_halt_cmplt_i_3__0
       (.I0(sig_halt_reg),
        .I1(sig_data2all_tlast_error),
        .O(sig_data2addr_stop_req));
  LUT6 #(
    .INIT(64'h0004000000010000)) 
    sig_halt_cmplt_i_4
       (.I0(sig_addr_posted_cntr_reg[1]),
        .I1(sig_addr_posted_cntr_reg[0]),
        .I2(sig_addr_posted_cntr_reg[3]),
        .I3(sig_addr_posted_cntr_reg[2]),
        .I4(sig_halt_reg_dly3),
        .I5(sig_addr2wsc_calc_error),
        .O(sig_wsc2rst_stop_cmplt));
  FDRE #(
    .INIT(1'b0)) 
    sig_halt_reg_dly1_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_halt_reg),
        .Q(sig_halt_reg_dly1_reg_n_0),
        .R(\addr_i_reg[3] ));
  FDRE #(
    .INIT(1'b0)) 
    sig_halt_reg_dly2_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_halt_reg_dly1_reg_n_0),
        .Q(sig_halt_reg_dly2),
        .R(\addr_i_reg[3] ));
  FDRE #(
    .INIT(1'b0)) 
    sig_halt_reg_dly3_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_halt_reg_dly2),
        .Q(sig_halt_reg_dly3),
        .R(\addr_i_reg[3] ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT2 #(
    .INIT(4'hE)) 
    sig_halt_reg_i_1
       (.I0(sig_s_h_halt_reg),
        .I1(sig_halt_reg),
        .O(sig_halt_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_halt_reg_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_halt_reg_i_1_n_0),
        .Q(sig_halt_reg),
        .R(\addr_i_reg[3] ));
  LUT2 #(
    .INIT(4'h2)) 
    sig_m_valid_dup_i_4
       (.I0(sig_halt_reg_dly2),
        .I1(sig_halt_reg_dly3),
        .O(sig_data2skid_halt));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT4 #(
    .INIT(16'h4044)) 
    sig_s_ready_dup_i_2__0
       (.I0(sig_stop_request),
        .I1(sig_init_done_reg),
        .I2(sig_halt_reg_dly3),
        .I3(sig_halt_reg_dly2),
        .O(sig_s_ready_dup_i_2__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    sig_sready_stop_reg_i_1
       (.I0(sig_halt_reg_dly3),
        .I1(sig_halt_reg_dly2),
        .I2(sig_stop_request),
        .O(sig_halt_reg_dly3_reg_0));
  LUT1 #(
    .INIT(2'h1)) 
    \sig_wdc_statcnt[0]_i_1 
       (.I0(sig_wdc_statcnt_reg[0]),
        .O(\sig_wdc_statcnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sig_wdc_statcnt_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(\GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO_n_7 ),
        .D(\sig_wdc_statcnt[0]_i_1_n_0 ),
        .Q(sig_wdc_statcnt_reg[0]),
        .R(\addr_i_reg[3] ));
  FDRE #(
    .INIT(1'b0)) 
    \sig_wdc_statcnt_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(\GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO_n_7 ),
        .D(\GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO_n_10 ),
        .Q(sig_wdc_statcnt_reg[1]),
        .R(\addr_i_reg[3] ));
  FDRE #(
    .INIT(1'b0)) 
    \sig_wdc_statcnt_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(\GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO_n_7 ),
        .D(\GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO_n_9 ),
        .Q(sig_wdc_statcnt_reg[2]),
        .R(\addr_i_reg[3] ));
  FDRE #(
    .INIT(1'b0)) 
    \sig_wdc_statcnt_reg[3] 
       (.C(m_axi_s2mm_aclk),
        .CE(\GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO_n_7 ),
        .D(\GEN_OMIT_INDET_BTT.I_DATA_CNTL_STATUS_FIFO_n_8 ),
        .Q(sig_wdc_statcnt_reg[3]),
        .R(\addr_i_reg[3] ));
  LUT2 #(
    .INIT(4'hE)) 
    sig_wdc_status_going_full_i_1
       (.I0(sig_wdc_statcnt_reg[2]),
        .I1(sig_wdc_statcnt_reg[3]),
        .O(sig_statcnt_gt_eq_thres));
  FDRE #(
    .INIT(1'b0)) 
    sig_wdc_status_going_full_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_statcnt_gt_eq_thres),
        .Q(sig_wdc_status_going_full),
        .R(\addr_i_reg[3] ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_wrdata_cntl
   (sig_next_eof_reg,
    sig_push_to_wsc,
    in,
    sig_init_done,
    sig_data2all_tlast_error,
    \USE_SRL_FIFO.sig_wr_fifo ,
    sig_tlast_err_stop,
    sig_dbeat_cntr_eq_0,
    E,
    wdc2skid_wready,
    \sig_addr_posted_cntr_reg[0]_0 ,
    \USE_SRL_FIFO.sig_wr_fifo_0 ,
    sig_last_skid_mux_out,
    sig_data2skid_wlast,
    sig_last_dbeat_reg_0,
    Q,
    sig_last_dbeat_reg_1,
    sig_data2skid_wvalid,
    \addr_i_reg[2] ,
    m_axi_s2mm_aclk,
    sig_init_done_reg,
    sig_last_dbeat_reg_2,
    \GEN_OMIT_INDET_BTT.sig_tlast_err_stop_reg_0 ,
    sig_inhibit_rdy_n,
    sig_data2wsc_cmd_cmplt_reg_0,
    sig_halt_reg,
    sig_next_calc_error_reg_i_3_0,
    out,
    sig_last_reg_out_reg,
    sig_last_reg_out_reg_0,
    sig_halt_reg_dly3,
    sig_mstr2data_cmd_valid,
    sig_wsc2stat_status_valid,
    sig_stat2wsc_status_ready,
    sig_wdc_status_going_full,
    sig_last_reg_out_reg_1,
    sig_last_skid_reg,
    \sig_strb_reg_out_reg[3] ,
    sig_next_calc_error_reg_reg_0);
  output sig_next_eof_reg;
  output sig_push_to_wsc;
  output [2:0]in;
  output sig_init_done;
  output sig_data2all_tlast_error;
  output \USE_SRL_FIFO.sig_wr_fifo ;
  output sig_tlast_err_stop;
  output sig_dbeat_cntr_eq_0;
  output [0:0]E;
  output wdc2skid_wready;
  output \sig_addr_posted_cntr_reg[0]_0 ;
  output \USE_SRL_FIFO.sig_wr_fifo_0 ;
  output sig_last_skid_mux_out;
  output sig_data2skid_wlast;
  output [3:0]sig_last_dbeat_reg_0;
  output [3:0]Q;
  output [3:0]sig_last_dbeat_reg_1;
  output sig_data2skid_wvalid;
  input [0:0]\addr_i_reg[2] ;
  input m_axi_s2mm_aclk;
  input sig_init_done_reg;
  input sig_last_dbeat_reg_2;
  input \GEN_OMIT_INDET_BTT.sig_tlast_err_stop_reg_0 ;
  input sig_inhibit_rdy_n;
  input sig_data2wsc_cmd_cmplt_reg_0;
  input sig_halt_reg;
  input sig_next_calc_error_reg_i_3_0;
  input out;
  input sig_last_reg_out_reg;
  input sig_last_reg_out_reg_0;
  input sig_halt_reg_dly3;
  input sig_mstr2data_cmd_valid;
  input sig_wsc2stat_status_valid;
  input sig_stat2wsc_status_ready;
  input sig_wdc_status_going_full;
  input sig_last_reg_out_reg_1;
  input sig_last_skid_reg;
  input [3:0]\sig_strb_reg_out_reg[3] ;
  input [9:0]sig_next_calc_error_reg_reg_0;

  wire [0:0]E;
  wire \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_1 ;
  wire \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_10 ;
  wire \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_11 ;
  wire \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_12 ;
  wire \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_13 ;
  wire \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_14 ;
  wire \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_26 ;
  wire \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_4 ;
  wire \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_6 ;
  wire \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_7 ;
  wire \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_8 ;
  wire \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_9 ;
  wire \GEN_OMIT_INDET_BTT.sig_tlast_err_stop_i_1_n_0 ;
  wire \GEN_OMIT_INDET_BTT.sig_tlast_err_stop_reg_0 ;
  wire [3:0]Q;
  wire \USE_SRL_FIFO.sig_wr_fifo ;
  wire \USE_SRL_FIFO.sig_wr_fifo_0 ;
  wire [0:0]\addr_i_reg[2] ;
  wire [2:0]in;
  wire m_axi_s2mm_aclk;
  wire out;
  wire [2:0]sig_addr_posted_cntr;
  wire \sig_addr_posted_cntr[0]_i_1__1_n_0 ;
  wire \sig_addr_posted_cntr[1]_i_1__1_n_0 ;
  wire \sig_addr_posted_cntr[2]_i_1__1_n_0 ;
  wire \sig_addr_posted_cntr[2]_i_2__0_n_0 ;
  wire \sig_addr_posted_cntr_reg[0]_0 ;
  wire sig_clr_dqual_reg;
  wire [26:14]sig_cmd_fifo_data_out;
  wire sig_data2all_tlast_error;
  wire sig_data2skid_wlast;
  wire sig_data2skid_wvalid;
  wire sig_data2wsc_cmd_cmplt0;
  wire sig_data2wsc_cmd_cmplt_reg_0;
  wire sig_data2wsc_last_err_i_1_n_0;
  wire \sig_dbeat_cntr[4]_i_2__0_n_0 ;
  wire \sig_dbeat_cntr[7]_i_3__0_n_0 ;
  wire sig_dbeat_cntr_eq_0;
  wire sig_dbeat_cntr_eq_1;
  wire \sig_dbeat_cntr_reg_n_0_[0] ;
  wire \sig_dbeat_cntr_reg_n_0_[1] ;
  wire \sig_dbeat_cntr_reg_n_0_[2] ;
  wire \sig_dbeat_cntr_reg_n_0_[3] ;
  wire \sig_dbeat_cntr_reg_n_0_[4] ;
  wire \sig_dbeat_cntr_reg_n_0_[5] ;
  wire \sig_dbeat_cntr_reg_n_0_[6] ;
  wire \sig_dbeat_cntr_reg_n_0_[7] ;
  wire sig_dqual_reg_empty;
  wire sig_dqual_reg_full;
  wire sig_first_dbeat;
  wire sig_good_mmap_dbeat12_out__0;
  wire sig_halt_reg;
  wire sig_halt_reg_dly3;
  wire sig_inhibit_rdy_n;
  wire sig_init_done;
  wire sig_init_done_reg;
  wire sig_last_dbeat__1;
  wire [3:0]sig_last_dbeat_reg_0;
  wire [3:0]sig_last_dbeat_reg_1;
  wire sig_last_dbeat_reg_2;
  wire sig_last_dbeat_reg_n_0;
  wire sig_last_mmap_dbeat;
  wire sig_last_mmap_dbeat_reg;
  wire sig_last_reg_out_i_3__0_n_0;
  wire sig_last_reg_out_reg;
  wire sig_last_reg_out_reg_0;
  wire sig_last_reg_out_reg_1;
  wire sig_last_skid_mux_out;
  wire sig_last_skid_reg;
  wire sig_ld_new_cmd_reg;
  wire sig_mstr2data_cmd_valid;
  wire sig_next_calc_error_reg;
  wire sig_next_calc_error_reg_i_3_0;
  wire sig_next_calc_error_reg_i_5_n_0;
  wire sig_next_calc_error_reg_i_6_n_0;
  wire sig_next_calc_error_reg_i_7_n_0;
  wire [9:0]sig_next_calc_error_reg_reg_0;
  wire sig_next_cmd_cmplt_reg;
  wire sig_next_eof_reg;
  wire \sig_next_strt_strb_reg_reg_n_0_[0] ;
  wire \sig_next_strt_strb_reg_reg_n_0_[1] ;
  wire \sig_next_strt_strb_reg_reg_n_0_[2] ;
  wire \sig_next_strt_strb_reg_reg_n_0_[3] ;
  wire sig_push_dqual_reg;
  wire sig_push_err2wsc;
  wire sig_push_err2wsc_i_1_n_0;
  wire sig_push_to_wsc;
  wire sig_push_to_wsc0;
  wire sig_push_to_wsc_i_2_n_0;
  wire sig_s_ready_dup_i_4_n_0;
  wire sig_s_ready_dup_i_5_n_0;
  wire sig_set_push2wsc__0;
  wire sig_stat2wsc_status_ready;
  wire [3:0]\sig_strb_reg_out_reg[3] ;
  wire sig_tlast_err_stop;
  wire sig_wdc_status_going_full;
  wire sig_wsc2stat_status_valid;
  wire wdc2skid_wready;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover_fifo__parameterized5 \GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO 
       (.D({\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_7 ,\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_8 ,\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_9 ,\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_10 ,\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_11 ,\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_12 ,\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_13 ,\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_14 }),
        .E(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_4 ),
        .Q({\sig_dbeat_cntr_reg_n_0_[7] ,\sig_dbeat_cntr_reg_n_0_[6] ,\sig_dbeat_cntr_reg_n_0_[5] ,\sig_dbeat_cntr_reg_n_0_[4] ,\sig_dbeat_cntr_reg_n_0_[3] ,\sig_dbeat_cntr_reg_n_0_[2] ,\sig_dbeat_cntr_reg_n_0_[1] ,\sig_dbeat_cntr_reg_n_0_[0] }),
        .SR(sig_clr_dqual_reg),
        .\addr_i_reg[2] (\addr_i_reg[2] ),
        .m_axi_s2mm_aclk(m_axi_s2mm_aclk),
        .out({sig_cmd_fifo_data_out[26:25],sig_cmd_fifo_data_out[23],sig_cmd_fifo_data_out[21:14]}),
        .sel(\USE_SRL_FIFO.sig_wr_fifo_0 ),
        .sig_dbeat_cntr_eq_1(sig_dbeat_cntr_eq_1),
        .\sig_dbeat_cntr_reg[4] (\sig_dbeat_cntr[4]_i_2__0_n_0 ),
        .\sig_dbeat_cntr_reg[5] (\sig_dbeat_cntr[7]_i_3__0_n_0 ),
        .sig_dqual_reg_empty(sig_dqual_reg_empty),
        .sig_dqual_reg_empty_reg(sig_addr_posted_cntr),
        .sig_dqual_reg_full(sig_dqual_reg_full),
        .sig_first_dbeat(sig_first_dbeat),
        .sig_first_dbeat_reg(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_1 ),
        .sig_good_mmap_dbeat12_out__0(sig_good_mmap_dbeat12_out__0),
        .sig_init_done(sig_init_done),
        .sig_init_done_reg_0(sig_init_done_reg),
        .sig_last_dbeat__1(sig_last_dbeat__1),
        .sig_last_dbeat_reg(sig_last_dbeat_reg_2),
        .sig_last_dbeat_reg_0(sig_last_dbeat_reg_n_0),
        .sig_ld_new_cmd_reg(sig_ld_new_cmd_reg),
        .sig_ld_new_cmd_reg_reg(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_6 ),
        .sig_mmap_rst_reg_n_reg(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_26 ),
        .sig_mstr2data_cmd_valid(sig_mstr2data_cmd_valid),
        .sig_next_calc_error_reg(sig_next_calc_error_reg),
        .sig_next_calc_error_reg_reg(sig_next_calc_error_reg_reg_0),
        .sig_next_cmd_cmplt_reg_reg(sig_dbeat_cntr_eq_0),
        .sig_push_dqual_reg(sig_push_dqual_reg),
        .sig_stat2wsc_status_ready(sig_stat2wsc_status_ready),
        .sig_wdc_status_going_full(sig_wdc_status_going_full),
        .sig_wsc2stat_status_valid(sig_wsc2stat_status_valid));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT5 #(
    .INIT(32'hFFFF4000)) 
    \GEN_OMIT_INDET_BTT.sig_tlast_err_stop_i_1 
       (.I0(\GEN_OMIT_INDET_BTT.sig_tlast_err_stop_reg_0 ),
        .I1(sig_inhibit_rdy_n),
        .I2(sig_push_to_wsc),
        .I3(sig_data2all_tlast_error),
        .I4(sig_tlast_err_stop),
        .O(\GEN_OMIT_INDET_BTT.sig_tlast_err_stop_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_OMIT_INDET_BTT.sig_tlast_err_stop_reg 
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(\GEN_OMIT_INDET_BTT.sig_tlast_err_stop_i_1_n_0 ),
        .Q(sig_tlast_err_stop),
        .R(\addr_i_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_OMIT_INDET_BTT.sig_tlast_error_reg_reg 
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_data2wsc_last_err_i_1_n_0),
        .Q(sig_data2all_tlast_error),
        .R(\addr_i_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \data_reg[5][6]_srl6_i_1 
       (.I0(sig_tlast_err_stop),
        .I1(sig_push_to_wsc),
        .I2(\GEN_OMIT_INDET_BTT.sig_tlast_err_stop_reg_0 ),
        .I3(sig_inhibit_rdy_n),
        .O(\USE_SRL_FIFO.sig_wr_fifo ));
  LUT1 #(
    .INIT(2'h1)) 
    \sig_addr_posted_cntr[0]_i_1__1 
       (.I0(sig_addr_posted_cntr[0]),
        .O(\sig_addr_posted_cntr[0]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT5 #(
    .INIT(32'hF44BB44B)) 
    \sig_addr_posted_cntr[1]_i_1__1 
       (.I0(sig_last_mmap_dbeat_reg),
        .I1(out),
        .I2(sig_addr_posted_cntr[0]),
        .I3(sig_addr_posted_cntr[1]),
        .I4(sig_addr_posted_cntr[2]),
        .O(\sig_addr_posted_cntr[1]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'h00FE7F00)) 
    \sig_addr_posted_cntr[2]_i_1__1 
       (.I0(sig_addr_posted_cntr[2]),
        .I1(sig_addr_posted_cntr[1]),
        .I2(sig_addr_posted_cntr[0]),
        .I3(out),
        .I4(sig_last_mmap_dbeat_reg),
        .O(\sig_addr_posted_cntr[2]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT5 #(
    .INIT(32'hBAAAAA65)) 
    \sig_addr_posted_cntr[2]_i_2__0 
       (.I0(sig_addr_posted_cntr[2]),
        .I1(sig_last_mmap_dbeat_reg),
        .I2(out),
        .I3(sig_addr_posted_cntr[0]),
        .I4(sig_addr_posted_cntr[1]),
        .O(\sig_addr_posted_cntr[2]_i_2__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sig_addr_posted_cntr_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(\sig_addr_posted_cntr[2]_i_1__1_n_0 ),
        .D(\sig_addr_posted_cntr[0]_i_1__1_n_0 ),
        .Q(sig_addr_posted_cntr[0]),
        .R(\addr_i_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \sig_addr_posted_cntr_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(\sig_addr_posted_cntr[2]_i_1__1_n_0 ),
        .D(\sig_addr_posted_cntr[1]_i_1__1_n_0 ),
        .Q(sig_addr_posted_cntr[1]),
        .R(\addr_i_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \sig_addr_posted_cntr_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(\sig_addr_posted_cntr[2]_i_1__1_n_0 ),
        .D(\sig_addr_posted_cntr[2]_i_2__0_n_0 ),
        .Q(sig_addr_posted_cntr[2]),
        .R(\addr_i_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    sig_data2wsc_calc_err_reg
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_to_wsc_i_2_n_0),
        .D(sig_next_calc_error_reg),
        .Q(in[2]),
        .R(sig_push_to_wsc0));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT5 #(
    .INIT(32'hEEEEFEEE)) 
    sig_data2wsc_cmd_cmplt_i_1
       (.I0(sig_data2all_tlast_error),
        .I1(sig_next_cmd_cmplt_reg),
        .I2(sig_data2wsc_cmd_cmplt_reg_0),
        .I3(sig_good_mmap_dbeat12_out__0),
        .I4(sig_halt_reg),
        .O(sig_data2wsc_cmd_cmplt0));
  FDRE #(
    .INIT(1'b0)) 
    sig_data2wsc_cmd_cmplt_reg
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_to_wsc_i_2_n_0),
        .D(sig_data2wsc_cmd_cmplt0),
        .Q(in[0]),
        .R(sig_push_to_wsc0));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT4 #(
    .INIT(16'hFF08)) 
    sig_data2wsc_last_err_i_1
       (.I0(sig_data2wsc_cmd_cmplt_reg_0),
        .I1(sig_good_mmap_dbeat12_out__0),
        .I2(sig_halt_reg),
        .I3(sig_data2all_tlast_error),
        .O(sig_data2wsc_last_err_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_data2wsc_last_err_reg
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_to_wsc_i_2_n_0),
        .D(sig_data2wsc_last_err_i_1_n_0),
        .Q(in[1]),
        .R(sig_push_to_wsc0));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \sig_dbeat_cntr[4]_i_2__0 
       (.I0(\sig_dbeat_cntr_reg_n_0_[1] ),
        .I1(\sig_dbeat_cntr_reg_n_0_[0] ),
        .O(\sig_dbeat_cntr[4]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \sig_dbeat_cntr[7]_i_3__0 
       (.I0(\sig_dbeat_cntr_reg_n_0_[3] ),
        .I1(\sig_dbeat_cntr_reg_n_0_[2] ),
        .I2(\sig_dbeat_cntr_reg_n_0_[0] ),
        .I3(\sig_dbeat_cntr_reg_n_0_[1] ),
        .I4(\sig_dbeat_cntr_reg_n_0_[4] ),
        .O(\sig_dbeat_cntr[7]_i_3__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sig_dbeat_cntr_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_4 ),
        .D(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_14 ),
        .Q(\sig_dbeat_cntr_reg_n_0_[0] ),
        .R(\addr_i_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \sig_dbeat_cntr_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_4 ),
        .D(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_13 ),
        .Q(\sig_dbeat_cntr_reg_n_0_[1] ),
        .R(\addr_i_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \sig_dbeat_cntr_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_4 ),
        .D(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_12 ),
        .Q(\sig_dbeat_cntr_reg_n_0_[2] ),
        .R(\addr_i_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \sig_dbeat_cntr_reg[3] 
       (.C(m_axi_s2mm_aclk),
        .CE(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_4 ),
        .D(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_11 ),
        .Q(\sig_dbeat_cntr_reg_n_0_[3] ),
        .R(\addr_i_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \sig_dbeat_cntr_reg[4] 
       (.C(m_axi_s2mm_aclk),
        .CE(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_4 ),
        .D(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_10 ),
        .Q(\sig_dbeat_cntr_reg_n_0_[4] ),
        .R(\addr_i_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \sig_dbeat_cntr_reg[5] 
       (.C(m_axi_s2mm_aclk),
        .CE(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_4 ),
        .D(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_9 ),
        .Q(\sig_dbeat_cntr_reg_n_0_[5] ),
        .R(\addr_i_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \sig_dbeat_cntr_reg[6] 
       (.C(m_axi_s2mm_aclk),
        .CE(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_4 ),
        .D(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_8 ),
        .Q(\sig_dbeat_cntr_reg_n_0_[6] ),
        .R(\addr_i_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    \sig_dbeat_cntr_reg[7] 
       (.C(m_axi_s2mm_aclk),
        .CE(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_4 ),
        .D(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_7 ),
        .Q(\sig_dbeat_cntr_reg_n_0_[7] ),
        .R(\addr_i_reg[2] ));
  FDSE #(
    .INIT(1'b0)) 
    sig_dqual_reg_empty_reg
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_dqual_reg),
        .D(1'b0),
        .Q(sig_dqual_reg_empty),
        .S(sig_clr_dqual_reg));
  FDRE #(
    .INIT(1'b0)) 
    sig_dqual_reg_full_reg
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_dqual_reg),
        .D(1'b1),
        .Q(sig_dqual_reg_full),
        .R(sig_clr_dqual_reg));
  FDRE #(
    .INIT(1'b0)) 
    sig_first_dbeat_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_1 ),
        .Q(sig_first_dbeat),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT5 #(
    .INIT(32'hFF010000)) 
    sig_halt_cmplt_i_5
       (.I0(sig_addr_posted_cntr[0]),
        .I1(sig_addr_posted_cntr[1]),
        .I2(sig_addr_posted_cntr[2]),
        .I3(sig_next_calc_error_reg),
        .I4(sig_halt_reg_dly3),
        .O(\sig_addr_posted_cntr_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    sig_last_dbeat_i_3__0
       (.I0(sig_good_mmap_dbeat12_out__0),
        .I1(\sig_dbeat_cntr_reg_n_0_[2] ),
        .I2(\sig_dbeat_cntr_reg_n_0_[3] ),
        .I3(\sig_dbeat_cntr_reg_n_0_[0] ),
        .I4(\sig_dbeat_cntr_reg_n_0_[1] ),
        .I5(sig_last_reg_out_i_3__0_n_0),
        .O(sig_last_dbeat__1));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    sig_last_dbeat_i_4__0
       (.I0(\sig_dbeat_cntr_reg_n_0_[2] ),
        .I1(\sig_dbeat_cntr_reg_n_0_[3] ),
        .I2(\sig_dbeat_cntr_reg_n_0_[0] ),
        .I3(\sig_dbeat_cntr_reg_n_0_[1] ),
        .I4(sig_last_reg_out_i_3__0_n_0),
        .O(sig_dbeat_cntr_eq_1));
  FDRE #(
    .INIT(1'b0)) 
    sig_last_dbeat_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_26 ),
        .Q(sig_last_dbeat_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'h80)) 
    sig_last_mmap_dbeat_reg_i_1__0
       (.I0(sig_good_mmap_dbeat12_out__0),
        .I1(sig_dqual_reg_full),
        .I2(sig_dbeat_cntr_eq_0),
        .O(sig_last_mmap_dbeat));
  FDRE #(
    .INIT(1'b0)) 
    sig_last_mmap_dbeat_reg_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_last_mmap_dbeat),
        .Q(sig_last_mmap_dbeat_reg),
        .R(\addr_i_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    sig_last_reg_out_i_1__1
       (.I0(sig_dbeat_cntr_eq_0),
        .I1(sig_dqual_reg_full),
        .I2(sig_last_reg_out_reg_1),
        .I3(sig_last_skid_reg),
        .O(sig_last_skid_mux_out));
  LUT2 #(
    .INIT(4'hB)) 
    sig_last_reg_out_i_2__0
       (.I0(wdc2skid_wready),
        .I1(sig_last_reg_out_reg),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    sig_last_reg_out_i_2__1
       (.I0(\sig_dbeat_cntr_reg_n_0_[1] ),
        .I1(\sig_dbeat_cntr_reg_n_0_[0] ),
        .I2(\sig_dbeat_cntr_reg_n_0_[2] ),
        .I3(\sig_dbeat_cntr_reg_n_0_[3] ),
        .I4(sig_last_reg_out_i_3__0_n_0),
        .O(sig_dbeat_cntr_eq_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    sig_last_reg_out_i_3__0
       (.I0(\sig_dbeat_cntr_reg_n_0_[7] ),
        .I1(\sig_dbeat_cntr_reg_n_0_[6] ),
        .I2(\sig_dbeat_cntr_reg_n_0_[4] ),
        .I3(\sig_dbeat_cntr_reg_n_0_[5] ),
        .O(sig_last_reg_out_i_3__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h8)) 
    sig_last_skid_reg_i_1__1
       (.I0(sig_dbeat_cntr_eq_0),
        .I1(sig_dqual_reg_full),
        .O(sig_data2skid_wlast));
  FDRE #(
    .INIT(1'b0)) 
    sig_ld_new_cmd_reg_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(\GEN_DATA_CNTL_FIFO.I_DATA_CNTL_FIFO_n_6 ),
        .Q(sig_ld_new_cmd_reg),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT5 #(
    .INIT(32'h00100000)) 
    sig_next_calc_error_reg_i_3
       (.I0(sig_next_calc_error_reg_i_5_n_0),
        .I1(sig_next_calc_error_reg_i_6_n_0),
        .I2(sig_dqual_reg_full),
        .I3(sig_next_calc_error_reg_i_7_n_0),
        .I4(sig_last_reg_out_reg_0),
        .O(sig_good_mmap_dbeat12_out__0));
  LUT4 #(
    .INIT(16'hA0A3)) 
    sig_next_calc_error_reg_i_5
       (.I0(sig_last_mmap_dbeat_reg),
        .I1(sig_next_calc_error_reg_i_3_0),
        .I2(sig_halt_reg),
        .I3(sig_data2all_tlast_error),
        .O(sig_next_calc_error_reg_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'hAAAB)) 
    sig_next_calc_error_reg_i_6
       (.I0(sig_next_calc_error_reg),
        .I1(sig_addr_posted_cntr[2]),
        .I2(sig_addr_posted_cntr[1]),
        .I3(sig_addr_posted_cntr[0]),
        .O(sig_next_calc_error_reg_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT5 #(
    .INIT(32'h00020000)) 
    sig_next_calc_error_reg_i_7
       (.I0(sig_addr_posted_cntr[0]),
        .I1(sig_addr_posted_cntr[1]),
        .I2(sig_addr_posted_cntr[2]),
        .I3(out),
        .I4(sig_last_mmap_dbeat_reg),
        .O(sig_next_calc_error_reg_i_7_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_next_calc_error_reg_reg
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_dqual_reg),
        .D(sig_cmd_fifo_data_out[26]),
        .Q(sig_next_calc_error_reg),
        .R(sig_clr_dqual_reg));
  FDRE #(
    .INIT(1'b0)) 
    sig_next_cmd_cmplt_reg_reg
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_dqual_reg),
        .D(sig_cmd_fifo_data_out[25]),
        .Q(sig_next_cmd_cmplt_reg),
        .R(sig_clr_dqual_reg));
  FDRE #(
    .INIT(1'b0)) 
    sig_next_eof_reg_reg
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_dqual_reg),
        .D(sig_cmd_fifo_data_out[23]),
        .Q(sig_next_eof_reg),
        .R(sig_clr_dqual_reg));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_last_strb_reg_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_dqual_reg),
        .D(sig_cmd_fifo_data_out[18]),
        .Q(Q[0]),
        .R(sig_clr_dqual_reg));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_last_strb_reg_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_dqual_reg),
        .D(sig_cmd_fifo_data_out[19]),
        .Q(Q[1]),
        .R(sig_clr_dqual_reg));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_last_strb_reg_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_dqual_reg),
        .D(sig_cmd_fifo_data_out[20]),
        .Q(Q[2]),
        .R(sig_clr_dqual_reg));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_last_strb_reg_reg[3] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_dqual_reg),
        .D(sig_cmd_fifo_data_out[21]),
        .Q(Q[3]),
        .R(sig_clr_dqual_reg));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_strt_strb_reg_reg[0] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_dqual_reg),
        .D(sig_cmd_fifo_data_out[14]),
        .Q(\sig_next_strt_strb_reg_reg_n_0_[0] ),
        .R(sig_clr_dqual_reg));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_strt_strb_reg_reg[1] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_dqual_reg),
        .D(sig_cmd_fifo_data_out[15]),
        .Q(\sig_next_strt_strb_reg_reg_n_0_[1] ),
        .R(sig_clr_dqual_reg));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_strt_strb_reg_reg[2] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_dqual_reg),
        .D(sig_cmd_fifo_data_out[16]),
        .Q(\sig_next_strt_strb_reg_reg_n_0_[2] ),
        .R(sig_clr_dqual_reg));
  FDRE #(
    .INIT(1'b0)) 
    \sig_next_strt_strb_reg_reg[3] 
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_dqual_reg),
        .D(sig_cmd_fifo_data_out[17]),
        .Q(\sig_next_strt_strb_reg_reg_n_0_[3] ),
        .R(sig_clr_dqual_reg));
  LUT4 #(
    .INIT(16'h2000)) 
    sig_push_err2wsc_i_1
       (.I0(sig_last_dbeat_reg_2),
        .I1(sig_push_err2wsc),
        .I2(sig_ld_new_cmd_reg),
        .I3(sig_next_calc_error_reg),
        .O(sig_push_err2wsc_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sig_push_err2wsc_reg
       (.C(m_axi_s2mm_aclk),
        .CE(1'b1),
        .D(sig_push_err2wsc_i_1_n_0),
        .Q(sig_push_err2wsc),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h1000FFFF)) 
    sig_push_to_wsc_i_1
       (.I0(sig_set_push2wsc__0),
        .I1(\GEN_OMIT_INDET_BTT.sig_tlast_err_stop_reg_0 ),
        .I2(sig_inhibit_rdy_n),
        .I3(sig_push_to_wsc),
        .I4(sig_last_dbeat_reg_2),
        .O(sig_push_to_wsc0));
  LUT4 #(
    .INIT(16'h00EA)) 
    sig_push_to_wsc_i_2
       (.I0(sig_push_err2wsc),
        .I1(sig_dbeat_cntr_eq_0),
        .I2(sig_good_mmap_dbeat12_out__0),
        .I3(sig_tlast_err_stop),
        .O(sig_push_to_wsc_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    sig_push_to_wsc_i_3
       (.I0(sig_good_mmap_dbeat12_out__0),
        .I1(sig_dbeat_cntr_eq_0),
        .I2(sig_push_err2wsc),
        .O(sig_set_push2wsc__0));
  FDRE #(
    .INIT(1'b0)) 
    sig_push_to_wsc_reg
       (.C(m_axi_s2mm_aclk),
        .CE(sig_push_to_wsc_i_2_n_0),
        .D(1'b1),
        .Q(sig_push_to_wsc),
        .R(sig_push_to_wsc0));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    sig_s_ready_dup_i_2__1
       (.I0(sig_next_calc_error_reg_i_7_n_0),
        .I1(sig_dqual_reg_full),
        .I2(sig_next_calc_error_reg_i_6_n_0),
        .I3(sig_next_calc_error_reg_i_5_n_0),
        .O(sig_data2skid_wvalid));
  LUT4 #(
    .INIT(16'hFF04)) 
    sig_s_ready_dup_i_3__0
       (.I0(sig_s_ready_dup_i_4_n_0),
        .I1(sig_last_reg_out_reg_0),
        .I2(sig_data2all_tlast_error),
        .I3(sig_halt_reg),
        .O(wdc2skid_wready));
  LUT6 #(
    .INIT(64'hDDDDDDFDDDDDDDFF)) 
    sig_s_ready_dup_i_4
       (.I0(sig_dqual_reg_full),
        .I1(sig_next_calc_error_reg),
        .I2(sig_s_ready_dup_i_5_n_0),
        .I3(sig_addr_posted_cntr[2]),
        .I4(sig_addr_posted_cntr[1]),
        .I5(sig_addr_posted_cntr[0]),
        .O(sig_s_ready_dup_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT2 #(
    .INIT(4'h2)) 
    sig_s_ready_dup_i_5
       (.I0(sig_last_mmap_dbeat_reg),
        .I1(out),
        .O(sig_s_ready_dup_i_5_n_0));
  LUT6 #(
    .INIT(64'hFD0DFFFFFD0D0000)) 
    \sig_strb_reg_out[0]_i_1__1 
       (.I0(sig_last_dbeat_reg_n_0),
        .I1(Q[0]),
        .I2(sig_first_dbeat),
        .I3(\sig_next_strt_strb_reg_reg_n_0_[0] ),
        .I4(sig_last_reg_out_reg_1),
        .I5(\sig_strb_reg_out_reg[3] [0]),
        .O(sig_last_dbeat_reg_0[0]));
  LUT6 #(
    .INIT(64'hFD0DFFFFFD0D0000)) 
    \sig_strb_reg_out[1]_i_1__1 
       (.I0(sig_last_dbeat_reg_n_0),
        .I1(Q[1]),
        .I2(sig_first_dbeat),
        .I3(\sig_next_strt_strb_reg_reg_n_0_[1] ),
        .I4(sig_last_reg_out_reg_1),
        .I5(\sig_strb_reg_out_reg[3] [1]),
        .O(sig_last_dbeat_reg_0[1]));
  LUT6 #(
    .INIT(64'hFD0DFFFFFD0D0000)) 
    \sig_strb_reg_out[2]_i_1__1 
       (.I0(sig_last_dbeat_reg_n_0),
        .I1(Q[2]),
        .I2(sig_first_dbeat),
        .I3(\sig_next_strt_strb_reg_reg_n_0_[2] ),
        .I4(sig_last_reg_out_reg_1),
        .I5(\sig_strb_reg_out_reg[3] [2]),
        .O(sig_last_dbeat_reg_0[2]));
  LUT6 #(
    .INIT(64'hFD0DFFFFFD0D0000)) 
    \sig_strb_reg_out[3]_i_2__0 
       (.I0(sig_last_dbeat_reg_n_0),
        .I1(Q[3]),
        .I2(sig_first_dbeat),
        .I3(\sig_next_strt_strb_reg_reg_n_0_[3] ),
        .I4(sig_last_reg_out_reg_1),
        .I5(\sig_strb_reg_out_reg[3] [3]),
        .O(sig_last_dbeat_reg_0[3]));
  LUT4 #(
    .INIT(16'hFD0D)) 
    \sig_strb_skid_reg[0]_i_1__1 
       (.I0(sig_last_dbeat_reg_n_0),
        .I1(Q[0]),
        .I2(sig_first_dbeat),
        .I3(\sig_next_strt_strb_reg_reg_n_0_[0] ),
        .O(sig_last_dbeat_reg_1[0]));
  LUT4 #(
    .INIT(16'hFD0D)) 
    \sig_strb_skid_reg[1]_i_1__1 
       (.I0(sig_last_dbeat_reg_n_0),
        .I1(Q[1]),
        .I2(sig_first_dbeat),
        .I3(\sig_next_strt_strb_reg_reg_n_0_[1] ),
        .O(sig_last_dbeat_reg_1[1]));
  LUT4 #(
    .INIT(16'hFD0D)) 
    \sig_strb_skid_reg[2]_i_1__1 
       (.I0(sig_last_dbeat_reg_n_0),
        .I1(Q[2]),
        .I2(sig_first_dbeat),
        .I3(\sig_next_strt_strb_reg_reg_n_0_[2] ),
        .O(sig_last_dbeat_reg_1[2]));
  LUT4 #(
    .INIT(16'hFD0D)) 
    \sig_strb_skid_reg[3]_i_1__1 
       (.I0(sig_last_dbeat_reg_n_0),
        .I1(Q[3]),
        .I2(sig_first_dbeat),
        .I3(\sig_next_strt_strb_reg_reg_n_0_[3] ),
        .O(sig_last_dbeat_reg_1[3]));
endmodule

(* C_DLYTMR_RESOLUTION = "125" *) (* C_ENABLE_MULTI_CHANNEL = "0" *) (* C_FAMILY = "zynquplus" *) 
(* C_INCLUDE_MM2S = "1" *) (* C_INCLUDE_MM2S_DRE = "0" *) (* C_INCLUDE_MM2S_SF = "1" *) 
(* C_INCLUDE_S2MM = "1" *) (* C_INCLUDE_S2MM_DRE = "0" *) (* C_INCLUDE_S2MM_SF = "1" *) 
(* C_INCLUDE_SG = "0" *) (* C_INCREASE_THROUGHPUT = "0" *) (* C_INSTANCE = "axi_dma" *) 
(* C_MICRO_DMA = "1" *) (* C_MM2S_BURST_SIZE = "16" *) (* C_M_AXIS_MM2S_CNTRL_TDATA_WIDTH = "32" *) 
(* C_M_AXIS_MM2S_TDATA_WIDTH = "32" *) (* C_M_AXI_MM2S_ADDR_WIDTH = "64" *) (* C_M_AXI_MM2S_DATA_WIDTH = "32" *) 
(* C_M_AXI_S2MM_ADDR_WIDTH = "64" *) (* C_M_AXI_S2MM_DATA_WIDTH = "32" *) (* C_M_AXI_SG_ADDR_WIDTH = "64" *) 
(* C_M_AXI_SG_DATA_WIDTH = "32" *) (* C_NUM_MM2S_CHANNELS = "1" *) (* C_NUM_S2MM_CHANNELS = "1" *) 
(* C_PRMRY_IS_ACLK_ASYNC = "0" *) (* C_S2MM_BURST_SIZE = "16" *) (* C_SG_INCLUDE_STSCNTRL_STRM = "0" *) 
(* C_SG_LENGTH_WIDTH = "23" *) (* C_SG_USE_STSAPP_LENGTH = "0" *) (* C_S_AXIS_S2MM_STS_TDATA_WIDTH = "32" *) 
(* C_S_AXIS_S2MM_TDATA_WIDTH = "32" *) (* C_S_AXI_LITE_ADDR_WIDTH = "10" *) (* C_S_AXI_LITE_DATA_WIDTH = "32" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma
   (s_axi_lite_aclk,
    m_axi_sg_aclk,
    m_axi_mm2s_aclk,
    m_axi_s2mm_aclk,
    axi_resetn,
    s_axi_lite_awvalid,
    s_axi_lite_awready,
    s_axi_lite_awaddr,
    s_axi_lite_wvalid,
    s_axi_lite_wready,
    s_axi_lite_wdata,
    s_axi_lite_bresp,
    s_axi_lite_bvalid,
    s_axi_lite_bready,
    s_axi_lite_arvalid,
    s_axi_lite_arready,
    s_axi_lite_araddr,
    s_axi_lite_rvalid,
    s_axi_lite_rready,
    s_axi_lite_rdata,
    s_axi_lite_rresp,
    m_axi_sg_awaddr,
    m_axi_sg_awlen,
    m_axi_sg_awsize,
    m_axi_sg_awburst,
    m_axi_sg_awprot,
    m_axi_sg_awcache,
    m_axi_sg_awuser,
    m_axi_sg_awvalid,
    m_axi_sg_awready,
    m_axi_sg_wdata,
    m_axi_sg_wstrb,
    m_axi_sg_wlast,
    m_axi_sg_wvalid,
    m_axi_sg_wready,
    m_axi_sg_bresp,
    m_axi_sg_bvalid,
    m_axi_sg_bready,
    m_axi_sg_araddr,
    m_axi_sg_arlen,
    m_axi_sg_arsize,
    m_axi_sg_arburst,
    m_axi_sg_arprot,
    m_axi_sg_arcache,
    m_axi_sg_aruser,
    m_axi_sg_arvalid,
    m_axi_sg_arready,
    m_axi_sg_rdata,
    m_axi_sg_rresp,
    m_axi_sg_rlast,
    m_axi_sg_rvalid,
    m_axi_sg_rready,
    m_axi_mm2s_araddr,
    m_axi_mm2s_arlen,
    m_axi_mm2s_arsize,
    m_axi_mm2s_arburst,
    m_axi_mm2s_arprot,
    m_axi_mm2s_arcache,
    m_axi_mm2s_aruser,
    m_axi_mm2s_arvalid,
    m_axi_mm2s_arready,
    m_axi_mm2s_rdata,
    m_axi_mm2s_rresp,
    m_axi_mm2s_rlast,
    m_axi_mm2s_rvalid,
    m_axi_mm2s_rready,
    mm2s_prmry_reset_out_n,
    m_axis_mm2s_tdata,
    m_axis_mm2s_tkeep,
    m_axis_mm2s_tvalid,
    m_axis_mm2s_tready,
    m_axis_mm2s_tlast,
    m_axis_mm2s_tuser,
    m_axis_mm2s_tid,
    m_axis_mm2s_tdest,
    mm2s_cntrl_reset_out_n,
    m_axis_mm2s_cntrl_tdata,
    m_axis_mm2s_cntrl_tkeep,
    m_axis_mm2s_cntrl_tvalid,
    m_axis_mm2s_cntrl_tready,
    m_axis_mm2s_cntrl_tlast,
    m_axi_s2mm_awaddr,
    m_axi_s2mm_awlen,
    m_axi_s2mm_awsize,
    m_axi_s2mm_awburst,
    m_axi_s2mm_awprot,
    m_axi_s2mm_awcache,
    m_axi_s2mm_awuser,
    m_axi_s2mm_awvalid,
    m_axi_s2mm_awready,
    m_axi_s2mm_wdata,
    m_axi_s2mm_wstrb,
    m_axi_s2mm_wlast,
    m_axi_s2mm_wvalid,
    m_axi_s2mm_wready,
    m_axi_s2mm_bresp,
    m_axi_s2mm_bvalid,
    m_axi_s2mm_bready,
    s2mm_prmry_reset_out_n,
    s_axis_s2mm_tdata,
    s_axis_s2mm_tkeep,
    s_axis_s2mm_tvalid,
    s_axis_s2mm_tready,
    s_axis_s2mm_tlast,
    s_axis_s2mm_tuser,
    s_axis_s2mm_tid,
    s_axis_s2mm_tdest,
    s2mm_sts_reset_out_n,
    s_axis_s2mm_sts_tdata,
    s_axis_s2mm_sts_tkeep,
    s_axis_s2mm_sts_tvalid,
    s_axis_s2mm_sts_tready,
    s_axis_s2mm_sts_tlast,
    mm2s_introut,
    s2mm_introut,
    axi_dma_tstvec);
  (* dont_touch = "true" *) input s_axi_lite_aclk;
  input m_axi_sg_aclk;
  input m_axi_mm2s_aclk;
  input m_axi_s2mm_aclk;
  input axi_resetn;
  input s_axi_lite_awvalid;
  output s_axi_lite_awready;
  input [9:0]s_axi_lite_awaddr;
  input s_axi_lite_wvalid;
  output s_axi_lite_wready;
  input [31:0]s_axi_lite_wdata;
  output [1:0]s_axi_lite_bresp;
  output s_axi_lite_bvalid;
  input s_axi_lite_bready;
  input s_axi_lite_arvalid;
  output s_axi_lite_arready;
  input [9:0]s_axi_lite_araddr;
  output s_axi_lite_rvalid;
  input s_axi_lite_rready;
  output [31:0]s_axi_lite_rdata;
  output [1:0]s_axi_lite_rresp;
  output [63:0]m_axi_sg_awaddr;
  output [7:0]m_axi_sg_awlen;
  output [2:0]m_axi_sg_awsize;
  output [1:0]m_axi_sg_awburst;
  output [2:0]m_axi_sg_awprot;
  output [3:0]m_axi_sg_awcache;
  output [3:0]m_axi_sg_awuser;
  output m_axi_sg_awvalid;
  input m_axi_sg_awready;
  output [31:0]m_axi_sg_wdata;
  output [3:0]m_axi_sg_wstrb;
  output m_axi_sg_wlast;
  output m_axi_sg_wvalid;
  input m_axi_sg_wready;
  input [1:0]m_axi_sg_bresp;
  input m_axi_sg_bvalid;
  output m_axi_sg_bready;
  output [63:0]m_axi_sg_araddr;
  output [7:0]m_axi_sg_arlen;
  output [2:0]m_axi_sg_arsize;
  output [1:0]m_axi_sg_arburst;
  output [2:0]m_axi_sg_arprot;
  output [3:0]m_axi_sg_arcache;
  output [3:0]m_axi_sg_aruser;
  output m_axi_sg_arvalid;
  input m_axi_sg_arready;
  input [31:0]m_axi_sg_rdata;
  input [1:0]m_axi_sg_rresp;
  input m_axi_sg_rlast;
  input m_axi_sg_rvalid;
  output m_axi_sg_rready;
  output [63:0]m_axi_mm2s_araddr;
  output [7:0]m_axi_mm2s_arlen;
  output [2:0]m_axi_mm2s_arsize;
  output [1:0]m_axi_mm2s_arburst;
  output [2:0]m_axi_mm2s_arprot;
  output [3:0]m_axi_mm2s_arcache;
  output [3:0]m_axi_mm2s_aruser;
  output m_axi_mm2s_arvalid;
  input m_axi_mm2s_arready;
  input [31:0]m_axi_mm2s_rdata;
  input [1:0]m_axi_mm2s_rresp;
  input m_axi_mm2s_rlast;
  input m_axi_mm2s_rvalid;
  output m_axi_mm2s_rready;
  output mm2s_prmry_reset_out_n;
  output [31:0]m_axis_mm2s_tdata;
  output [3:0]m_axis_mm2s_tkeep;
  output m_axis_mm2s_tvalid;
  input m_axis_mm2s_tready;
  output m_axis_mm2s_tlast;
  output [3:0]m_axis_mm2s_tuser;
  output [4:0]m_axis_mm2s_tid;
  output [4:0]m_axis_mm2s_tdest;
  output mm2s_cntrl_reset_out_n;
  output [31:0]m_axis_mm2s_cntrl_tdata;
  output [3:0]m_axis_mm2s_cntrl_tkeep;
  output m_axis_mm2s_cntrl_tvalid;
  input m_axis_mm2s_cntrl_tready;
  output m_axis_mm2s_cntrl_tlast;
  output [63:0]m_axi_s2mm_awaddr;
  output [7:0]m_axi_s2mm_awlen;
  output [2:0]m_axi_s2mm_awsize;
  output [1:0]m_axi_s2mm_awburst;
  output [2:0]m_axi_s2mm_awprot;
  output [3:0]m_axi_s2mm_awcache;
  output [3:0]m_axi_s2mm_awuser;
  output m_axi_s2mm_awvalid;
  input m_axi_s2mm_awready;
  output [31:0]m_axi_s2mm_wdata;
  output [3:0]m_axi_s2mm_wstrb;
  output m_axi_s2mm_wlast;
  output m_axi_s2mm_wvalid;
  input m_axi_s2mm_wready;
  input [1:0]m_axi_s2mm_bresp;
  input m_axi_s2mm_bvalid;
  output m_axi_s2mm_bready;
  output s2mm_prmry_reset_out_n;
  input [31:0]s_axis_s2mm_tdata;
  input [3:0]s_axis_s2mm_tkeep;
  input s_axis_s2mm_tvalid;
  output s_axis_s2mm_tready;
  input s_axis_s2mm_tlast;
  input [3:0]s_axis_s2mm_tuser;
  input [4:0]s_axis_s2mm_tid;
  input [4:0]s_axis_s2mm_tdest;
  output s2mm_sts_reset_out_n;
  input [31:0]s_axis_s2mm_sts_tdata;
  input [3:0]s_axis_s2mm_sts_tkeep;
  input s_axis_s2mm_sts_tvalid;
  output s_axis_s2mm_sts_tready;
  input s_axis_s2mm_sts_tlast;
  output mm2s_introut;
  output s2mm_introut;
  output [31:0]axi_dma_tstvec;

  wire \<const0> ;
  wire \GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_CMD_STATUS/I_CMD_FIFO/USE_SINGLE_REG.sig_push_regfifo ;
  wire \GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/sig_rst2all_stop_request ;
  wire \GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS/mm2s_decerr_i ;
  wire \GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS/mm2s_interr_i ;
  wire \GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS/mm2s_slverr_i ;
  wire \GEN_MM2S_DMA_CONTROL.I_MM2S_STS_MNGR/mm2s_halted_set0 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER/threshold_is_zero ;
  wire \GEN_RESET_FOR_MM2S.RESET_I/soft_reset_re0 ;
  wire \GEN_RESET_FOR_S2MM.RESET_I/soft_reset_d1 ;
  wire \GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_CMD_STATUS/I_CMD_FIFO/USE_SINGLE_REG.sig_push_regfifo ;
  wire \GEN_S2MM_DMA_CONTROL.I_S2MM_CMDSTS/s2mm_decerr_i ;
  wire \GEN_S2MM_DMA_CONTROL.I_S2MM_CMDSTS/s2mm_interr_i ;
  wire \GEN_S2MM_DMA_CONTROL.I_S2MM_CMDSTS/s2mm_slverr_i ;
  wire \GEN_S2MM_DMA_CONTROL.I_S2MM_STS_MNGR/s2mm_halted_set0 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER/halted1 ;
  wire \INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_7 ;
  wire \INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_83 ;
  wire \INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_84 ;
  wire \INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_85 ;
  wire \INCLUDE_S2MM_SOF_EOF_GENERATOR.I_S2MM_DMA_MNGR_n_7 ;
  wire \INCLUDE_S2MM_SOF_EOF_GENERATOR.I_S2MM_DMA_MNGR_n_83 ;
  wire \INCLUDE_S2MM_SOF_EOF_GENERATOR.I_S2MM_DMA_MNGR_n_84 ;
  wire \INCLUDE_S2MM_SOF_EOF_GENERATOR.I_S2MM_DMA_MNGR_n_85 ;
  wire I_AXI_DMA_REG_MODULE_n_16;
  wire I_AXI_DMA_REG_MODULE_n_171;
  wire I_AXI_DMA_REG_MODULE_n_172;
  wire I_AXI_DMA_REG_MODULE_n_19;
  wire I_AXI_DMA_REG_MODULE_n_2;
  wire I_AXI_DMA_REG_MODULE_n_3;
  wire I_AXI_DMA_REG_MODULE_n_4;
  wire I_AXI_DMA_REG_MODULE_n_5;
  wire I_AXI_DMA_REG_MODULE_n_6;
  wire I_AXI_DMA_REG_MODULE_n_7;
  wire I_RST_MODULE_n_12;
  wire I_RST_MODULE_n_14;
  wire I_RST_MODULE_n_15;
  wire I_RST_MODULE_n_18;
  wire I_RST_MODULE_n_19;
  wire I_RST_MODULE_n_20;
  wire I_RST_MODULE_n_21;
  wire I_RST_MODULE_n_22;
  wire [12:0]axi2ip_wrce;
  wire [5:0]\^axi_dma_tstvec ;
  wire axi_lite_reset_n;
  wire axi_resetn;
  wire dma_mm2s_error;
  wire dma_s2mm_error;
  wire m_axi_mm2s_aclk;
  wire [63:0]m_axi_mm2s_araddr;
  wire [0:0]\^m_axi_mm2s_arburst ;
  wire m_axi_mm2s_aresetn;
  wire [4:0]\^m_axi_mm2s_arlen ;
  wire m_axi_mm2s_arready;
  wire [1:1]\^m_axi_mm2s_arsize ;
  wire m_axi_mm2s_arvalid;
  wire [31:0]m_axi_mm2s_rdata;
  wire m_axi_mm2s_rlast;
  wire m_axi_mm2s_rready;
  wire [1:0]m_axi_mm2s_rresp;
  wire m_axi_mm2s_rvalid;
  wire m_axi_s2mm_aclk;
  wire m_axi_s2mm_aresetn;
  wire [63:0]m_axi_s2mm_awaddr;
  wire [0:0]\^m_axi_s2mm_awburst ;
  wire [4:0]\^m_axi_s2mm_awlen ;
  wire m_axi_s2mm_awready;
  wire [1:1]\^m_axi_s2mm_awsize ;
  wire m_axi_s2mm_awvalid;
  wire m_axi_s2mm_bready;
  wire [1:0]m_axi_s2mm_bresp;
  wire m_axi_s2mm_bvalid;
  wire [31:0]m_axi_s2mm_wdata;
  wire m_axi_s2mm_wlast;
  wire m_axi_s2mm_wready;
  wire [3:0]m_axi_s2mm_wstrb;
  wire m_axi_s2mm_wvalid;
  wire m_axi_sg_aresetn;
  wire m_axis_mm2s_sts_tready;
  wire m_axis_mm2s_sts_tvalid_int;
  wire [31:0]m_axis_mm2s_tdata;
  wire [3:0]m_axis_mm2s_tkeep;
  wire m_axis_mm2s_tlast;
  wire m_axis_mm2s_tready;
  wire m_axis_mm2s_tvalid;
  wire m_axis_s2mm_sts_tready;
  wire m_axis_s2mm_sts_tvalid_int;
  wire mm2s_all_idle;
  wire mm2s_cntrl_reset_out_n;
  wire [0:0]mm2s_dmacr;
  wire [0:0]mm2s_dmasr;
  wire mm2s_halt_cmplt;
  wire mm2s_halted_clr;
  wire mm2s_halted_set;
  wire mm2s_introut;
  wire [6:0]mm2s_length;
  wire mm2s_length_wren;
  wire mm2s_prmry_reset_out_n;
  wire mm2s_prmry_resetn;
  wire [63:0]mm2s_sa;
  wire mm2s_scndry_resetn;
  wire mm2s_stop;
  wire mm2s_stop_i;
  wire mm2s_sts_received;
  wire [7:7]p_0_in;
  wire s2mm_all_idle;
  wire [63:0]s2mm_da;
  wire [0:0]s2mm_dmacr;
  wire [0:0]s2mm_dmasr;
  wire s2mm_halt_cmplt;
  wire s2mm_halted_clr;
  wire s2mm_halted_set;
  wire s2mm_introut;
  wire [6:0]s2mm_length;
  wire s2mm_length_wren;
  wire s2mm_prmry_reset_out_n;
  wire s2mm_prmry_resetn;
  wire s2mm_scndry_resetn;
  wire s2mm_stop;
  wire s2mm_stop_i;
  wire s2mm_sts_received;
  wire s2mm_sts_reset_out_n;
  wire s_axi_lite_aclk;
  wire [9:0]s_axi_lite_araddr;
  wire s_axi_lite_arready;
  wire s_axi_lite_arvalid;
  wire [9:0]s_axi_lite_awaddr;
  wire s_axi_lite_awvalid;
  wire s_axi_lite_bready;
  wire s_axi_lite_bvalid;
  wire [31:0]s_axi_lite_rdata;
  wire s_axi_lite_rready;
  wire s_axi_lite_rvalid;
  wire [31:0]s_axi_lite_wdata;
  wire s_axi_lite_wready;
  wire s_axi_lite_wvalid;
  wire [95:0]s_axis_mm2s_cmd_tdata_split;
  wire s_axis_mm2s_cmd_tready;
  wire s_axis_mm2s_cmd_tvalid_split;
  wire [95:0]s_axis_s2mm_cmd_tdata_split;
  wire s_axis_s2mm_cmd_tready;
  wire s_axis_s2mm_cmd_tvalid_split;
  wire [31:0]s_axis_s2mm_tdata;
  wire [3:0]s_axis_s2mm_tkeep;
  wire s_axis_s2mm_tlast;
  wire s_axis_s2mm_tready;
  wire s_axis_s2mm_tvalid;
  wire sig_s_h_halt_reg;
  wire soft_reset;
  wire soft_reset_clr;

  assign axi_dma_tstvec[31] = \<const0> ;
  assign axi_dma_tstvec[30] = \<const0> ;
  assign axi_dma_tstvec[29] = \<const0> ;
  assign axi_dma_tstvec[28] = \<const0> ;
  assign axi_dma_tstvec[27] = \<const0> ;
  assign axi_dma_tstvec[26] = \<const0> ;
  assign axi_dma_tstvec[25] = \<const0> ;
  assign axi_dma_tstvec[24] = \<const0> ;
  assign axi_dma_tstvec[23] = \<const0> ;
  assign axi_dma_tstvec[22] = \<const0> ;
  assign axi_dma_tstvec[21] = \<const0> ;
  assign axi_dma_tstvec[20] = \<const0> ;
  assign axi_dma_tstvec[19] = \<const0> ;
  assign axi_dma_tstvec[18] = \<const0> ;
  assign axi_dma_tstvec[17] = \<const0> ;
  assign axi_dma_tstvec[16] = \<const0> ;
  assign axi_dma_tstvec[15] = \<const0> ;
  assign axi_dma_tstvec[14] = \<const0> ;
  assign axi_dma_tstvec[13] = \<const0> ;
  assign axi_dma_tstvec[12] = \<const0> ;
  assign axi_dma_tstvec[11] = \<const0> ;
  assign axi_dma_tstvec[10] = \<const0> ;
  assign axi_dma_tstvec[9] = \<const0> ;
  assign axi_dma_tstvec[8] = \<const0> ;
  assign axi_dma_tstvec[7] = \<const0> ;
  assign axi_dma_tstvec[6] = \<const0> ;
  assign axi_dma_tstvec[5:0] = \^axi_dma_tstvec [5:0];
  assign m_axi_mm2s_arburst[1] = \<const0> ;
  assign m_axi_mm2s_arburst[0] = \^m_axi_mm2s_arburst [0];
  assign m_axi_mm2s_arcache[3] = \<const0> ;
  assign m_axi_mm2s_arcache[2] = \<const0> ;
  assign m_axi_mm2s_arcache[1] = \<const0> ;
  assign m_axi_mm2s_arcache[0] = \<const0> ;
  assign m_axi_mm2s_arlen[7] = \<const0> ;
  assign m_axi_mm2s_arlen[6] = \<const0> ;
  assign m_axi_mm2s_arlen[5] = \<const0> ;
  assign m_axi_mm2s_arlen[4:0] = \^m_axi_mm2s_arlen [4:0];
  assign m_axi_mm2s_arprot[2] = \<const0> ;
  assign m_axi_mm2s_arprot[1] = \<const0> ;
  assign m_axi_mm2s_arprot[0] = \<const0> ;
  assign m_axi_mm2s_arsize[2] = \<const0> ;
  assign m_axi_mm2s_arsize[1] = \^m_axi_mm2s_arsize [1];
  assign m_axi_mm2s_arsize[0] = \<const0> ;
  assign m_axi_mm2s_aruser[3] = \<const0> ;
  assign m_axi_mm2s_aruser[2] = \<const0> ;
  assign m_axi_mm2s_aruser[1] = \<const0> ;
  assign m_axi_mm2s_aruser[0] = \<const0> ;
  assign m_axi_s2mm_awburst[1] = \<const0> ;
  assign m_axi_s2mm_awburst[0] = \^m_axi_s2mm_awburst [0];
  assign m_axi_s2mm_awcache[3] = \<const0> ;
  assign m_axi_s2mm_awcache[2] = \<const0> ;
  assign m_axi_s2mm_awcache[1] = \<const0> ;
  assign m_axi_s2mm_awcache[0] = \<const0> ;
  assign m_axi_s2mm_awlen[7] = \<const0> ;
  assign m_axi_s2mm_awlen[6] = \<const0> ;
  assign m_axi_s2mm_awlen[5] = \<const0> ;
  assign m_axi_s2mm_awlen[4:0] = \^m_axi_s2mm_awlen [4:0];
  assign m_axi_s2mm_awprot[2] = \<const0> ;
  assign m_axi_s2mm_awprot[1] = \<const0> ;
  assign m_axi_s2mm_awprot[0] = \<const0> ;
  assign m_axi_s2mm_awsize[2] = \<const0> ;
  assign m_axi_s2mm_awsize[1] = \^m_axi_s2mm_awsize [1];
  assign m_axi_s2mm_awsize[0] = \<const0> ;
  assign m_axi_s2mm_awuser[3] = \<const0> ;
  assign m_axi_s2mm_awuser[2] = \<const0> ;
  assign m_axi_s2mm_awuser[1] = \<const0> ;
  assign m_axi_s2mm_awuser[0] = \<const0> ;
  assign m_axi_sg_araddr[63] = \<const0> ;
  assign m_axi_sg_araddr[62] = \<const0> ;
  assign m_axi_sg_araddr[61] = \<const0> ;
  assign m_axi_sg_araddr[60] = \<const0> ;
  assign m_axi_sg_araddr[59] = \<const0> ;
  assign m_axi_sg_araddr[58] = \<const0> ;
  assign m_axi_sg_araddr[57] = \<const0> ;
  assign m_axi_sg_araddr[56] = \<const0> ;
  assign m_axi_sg_araddr[55] = \<const0> ;
  assign m_axi_sg_araddr[54] = \<const0> ;
  assign m_axi_sg_araddr[53] = \<const0> ;
  assign m_axi_sg_araddr[52] = \<const0> ;
  assign m_axi_sg_araddr[51] = \<const0> ;
  assign m_axi_sg_araddr[50] = \<const0> ;
  assign m_axi_sg_araddr[49] = \<const0> ;
  assign m_axi_sg_araddr[48] = \<const0> ;
  assign m_axi_sg_araddr[47] = \<const0> ;
  assign m_axi_sg_araddr[46] = \<const0> ;
  assign m_axi_sg_araddr[45] = \<const0> ;
  assign m_axi_sg_araddr[44] = \<const0> ;
  assign m_axi_sg_araddr[43] = \<const0> ;
  assign m_axi_sg_araddr[42] = \<const0> ;
  assign m_axi_sg_araddr[41] = \<const0> ;
  assign m_axi_sg_araddr[40] = \<const0> ;
  assign m_axi_sg_araddr[39] = \<const0> ;
  assign m_axi_sg_araddr[38] = \<const0> ;
  assign m_axi_sg_araddr[37] = \<const0> ;
  assign m_axi_sg_araddr[36] = \<const0> ;
  assign m_axi_sg_araddr[35] = \<const0> ;
  assign m_axi_sg_araddr[34] = \<const0> ;
  assign m_axi_sg_araddr[33] = \<const0> ;
  assign m_axi_sg_araddr[32] = \<const0> ;
  assign m_axi_sg_araddr[31] = \<const0> ;
  assign m_axi_sg_araddr[30] = \<const0> ;
  assign m_axi_sg_araddr[29] = \<const0> ;
  assign m_axi_sg_araddr[28] = \<const0> ;
  assign m_axi_sg_araddr[27] = \<const0> ;
  assign m_axi_sg_araddr[26] = \<const0> ;
  assign m_axi_sg_araddr[25] = \<const0> ;
  assign m_axi_sg_araddr[24] = \<const0> ;
  assign m_axi_sg_araddr[23] = \<const0> ;
  assign m_axi_sg_araddr[22] = \<const0> ;
  assign m_axi_sg_araddr[21] = \<const0> ;
  assign m_axi_sg_araddr[20] = \<const0> ;
  assign m_axi_sg_araddr[19] = \<const0> ;
  assign m_axi_sg_araddr[18] = \<const0> ;
  assign m_axi_sg_araddr[17] = \<const0> ;
  assign m_axi_sg_araddr[16] = \<const0> ;
  assign m_axi_sg_araddr[15] = \<const0> ;
  assign m_axi_sg_araddr[14] = \<const0> ;
  assign m_axi_sg_araddr[13] = \<const0> ;
  assign m_axi_sg_araddr[12] = \<const0> ;
  assign m_axi_sg_araddr[11] = \<const0> ;
  assign m_axi_sg_araddr[10] = \<const0> ;
  assign m_axi_sg_araddr[9] = \<const0> ;
  assign m_axi_sg_araddr[8] = \<const0> ;
  assign m_axi_sg_araddr[7] = \<const0> ;
  assign m_axi_sg_araddr[6] = \<const0> ;
  assign m_axi_sg_araddr[5] = \<const0> ;
  assign m_axi_sg_araddr[4] = \<const0> ;
  assign m_axi_sg_araddr[3] = \<const0> ;
  assign m_axi_sg_araddr[2] = \<const0> ;
  assign m_axi_sg_araddr[1] = \<const0> ;
  assign m_axi_sg_araddr[0] = \<const0> ;
  assign m_axi_sg_arburst[1] = \<const0> ;
  assign m_axi_sg_arburst[0] = \<const0> ;
  assign m_axi_sg_arcache[3] = \<const0> ;
  assign m_axi_sg_arcache[2] = \<const0> ;
  assign m_axi_sg_arcache[1] = \<const0> ;
  assign m_axi_sg_arcache[0] = \<const0> ;
  assign m_axi_sg_arlen[7] = \<const0> ;
  assign m_axi_sg_arlen[6] = \<const0> ;
  assign m_axi_sg_arlen[5] = \<const0> ;
  assign m_axi_sg_arlen[4] = \<const0> ;
  assign m_axi_sg_arlen[3] = \<const0> ;
  assign m_axi_sg_arlen[2] = \<const0> ;
  assign m_axi_sg_arlen[1] = \<const0> ;
  assign m_axi_sg_arlen[0] = \<const0> ;
  assign m_axi_sg_arprot[2] = \<const0> ;
  assign m_axi_sg_arprot[1] = \<const0> ;
  assign m_axi_sg_arprot[0] = \<const0> ;
  assign m_axi_sg_arsize[2] = \<const0> ;
  assign m_axi_sg_arsize[1] = \<const0> ;
  assign m_axi_sg_arsize[0] = \<const0> ;
  assign m_axi_sg_aruser[3] = \<const0> ;
  assign m_axi_sg_aruser[2] = \<const0> ;
  assign m_axi_sg_aruser[1] = \<const0> ;
  assign m_axi_sg_aruser[0] = \<const0> ;
  assign m_axi_sg_arvalid = \<const0> ;
  assign m_axi_sg_awaddr[63] = \<const0> ;
  assign m_axi_sg_awaddr[62] = \<const0> ;
  assign m_axi_sg_awaddr[61] = \<const0> ;
  assign m_axi_sg_awaddr[60] = \<const0> ;
  assign m_axi_sg_awaddr[59] = \<const0> ;
  assign m_axi_sg_awaddr[58] = \<const0> ;
  assign m_axi_sg_awaddr[57] = \<const0> ;
  assign m_axi_sg_awaddr[56] = \<const0> ;
  assign m_axi_sg_awaddr[55] = \<const0> ;
  assign m_axi_sg_awaddr[54] = \<const0> ;
  assign m_axi_sg_awaddr[53] = \<const0> ;
  assign m_axi_sg_awaddr[52] = \<const0> ;
  assign m_axi_sg_awaddr[51] = \<const0> ;
  assign m_axi_sg_awaddr[50] = \<const0> ;
  assign m_axi_sg_awaddr[49] = \<const0> ;
  assign m_axi_sg_awaddr[48] = \<const0> ;
  assign m_axi_sg_awaddr[47] = \<const0> ;
  assign m_axi_sg_awaddr[46] = \<const0> ;
  assign m_axi_sg_awaddr[45] = \<const0> ;
  assign m_axi_sg_awaddr[44] = \<const0> ;
  assign m_axi_sg_awaddr[43] = \<const0> ;
  assign m_axi_sg_awaddr[42] = \<const0> ;
  assign m_axi_sg_awaddr[41] = \<const0> ;
  assign m_axi_sg_awaddr[40] = \<const0> ;
  assign m_axi_sg_awaddr[39] = \<const0> ;
  assign m_axi_sg_awaddr[38] = \<const0> ;
  assign m_axi_sg_awaddr[37] = \<const0> ;
  assign m_axi_sg_awaddr[36] = \<const0> ;
  assign m_axi_sg_awaddr[35] = \<const0> ;
  assign m_axi_sg_awaddr[34] = \<const0> ;
  assign m_axi_sg_awaddr[33] = \<const0> ;
  assign m_axi_sg_awaddr[32] = \<const0> ;
  assign m_axi_sg_awaddr[31] = \<const0> ;
  assign m_axi_sg_awaddr[30] = \<const0> ;
  assign m_axi_sg_awaddr[29] = \<const0> ;
  assign m_axi_sg_awaddr[28] = \<const0> ;
  assign m_axi_sg_awaddr[27] = \<const0> ;
  assign m_axi_sg_awaddr[26] = \<const0> ;
  assign m_axi_sg_awaddr[25] = \<const0> ;
  assign m_axi_sg_awaddr[24] = \<const0> ;
  assign m_axi_sg_awaddr[23] = \<const0> ;
  assign m_axi_sg_awaddr[22] = \<const0> ;
  assign m_axi_sg_awaddr[21] = \<const0> ;
  assign m_axi_sg_awaddr[20] = \<const0> ;
  assign m_axi_sg_awaddr[19] = \<const0> ;
  assign m_axi_sg_awaddr[18] = \<const0> ;
  assign m_axi_sg_awaddr[17] = \<const0> ;
  assign m_axi_sg_awaddr[16] = \<const0> ;
  assign m_axi_sg_awaddr[15] = \<const0> ;
  assign m_axi_sg_awaddr[14] = \<const0> ;
  assign m_axi_sg_awaddr[13] = \<const0> ;
  assign m_axi_sg_awaddr[12] = \<const0> ;
  assign m_axi_sg_awaddr[11] = \<const0> ;
  assign m_axi_sg_awaddr[10] = \<const0> ;
  assign m_axi_sg_awaddr[9] = \<const0> ;
  assign m_axi_sg_awaddr[8] = \<const0> ;
  assign m_axi_sg_awaddr[7] = \<const0> ;
  assign m_axi_sg_awaddr[6] = \<const0> ;
  assign m_axi_sg_awaddr[5] = \<const0> ;
  assign m_axi_sg_awaddr[4] = \<const0> ;
  assign m_axi_sg_awaddr[3] = \<const0> ;
  assign m_axi_sg_awaddr[2] = \<const0> ;
  assign m_axi_sg_awaddr[1] = \<const0> ;
  assign m_axi_sg_awaddr[0] = \<const0> ;
  assign m_axi_sg_awburst[1] = \<const0> ;
  assign m_axi_sg_awburst[0] = \<const0> ;
  assign m_axi_sg_awcache[3] = \<const0> ;
  assign m_axi_sg_awcache[2] = \<const0> ;
  assign m_axi_sg_awcache[1] = \<const0> ;
  assign m_axi_sg_awcache[0] = \<const0> ;
  assign m_axi_sg_awlen[7] = \<const0> ;
  assign m_axi_sg_awlen[6] = \<const0> ;
  assign m_axi_sg_awlen[5] = \<const0> ;
  assign m_axi_sg_awlen[4] = \<const0> ;
  assign m_axi_sg_awlen[3] = \<const0> ;
  assign m_axi_sg_awlen[2] = \<const0> ;
  assign m_axi_sg_awlen[1] = \<const0> ;
  assign m_axi_sg_awlen[0] = \<const0> ;
  assign m_axi_sg_awprot[2] = \<const0> ;
  assign m_axi_sg_awprot[1] = \<const0> ;
  assign m_axi_sg_awprot[0] = \<const0> ;
  assign m_axi_sg_awsize[2] = \<const0> ;
  assign m_axi_sg_awsize[1] = \<const0> ;
  assign m_axi_sg_awsize[0] = \<const0> ;
  assign m_axi_sg_awuser[3] = \<const0> ;
  assign m_axi_sg_awuser[2] = \<const0> ;
  assign m_axi_sg_awuser[1] = \<const0> ;
  assign m_axi_sg_awuser[0] = \<const0> ;
  assign m_axi_sg_awvalid = \<const0> ;
  assign m_axi_sg_bready = \<const0> ;
  assign m_axi_sg_rready = \<const0> ;
  assign m_axi_sg_wdata[31] = \<const0> ;
  assign m_axi_sg_wdata[30] = \<const0> ;
  assign m_axi_sg_wdata[29] = \<const0> ;
  assign m_axi_sg_wdata[28] = \<const0> ;
  assign m_axi_sg_wdata[27] = \<const0> ;
  assign m_axi_sg_wdata[26] = \<const0> ;
  assign m_axi_sg_wdata[25] = \<const0> ;
  assign m_axi_sg_wdata[24] = \<const0> ;
  assign m_axi_sg_wdata[23] = \<const0> ;
  assign m_axi_sg_wdata[22] = \<const0> ;
  assign m_axi_sg_wdata[21] = \<const0> ;
  assign m_axi_sg_wdata[20] = \<const0> ;
  assign m_axi_sg_wdata[19] = \<const0> ;
  assign m_axi_sg_wdata[18] = \<const0> ;
  assign m_axi_sg_wdata[17] = \<const0> ;
  assign m_axi_sg_wdata[16] = \<const0> ;
  assign m_axi_sg_wdata[15] = \<const0> ;
  assign m_axi_sg_wdata[14] = \<const0> ;
  assign m_axi_sg_wdata[13] = \<const0> ;
  assign m_axi_sg_wdata[12] = \<const0> ;
  assign m_axi_sg_wdata[11] = \<const0> ;
  assign m_axi_sg_wdata[10] = \<const0> ;
  assign m_axi_sg_wdata[9] = \<const0> ;
  assign m_axi_sg_wdata[8] = \<const0> ;
  assign m_axi_sg_wdata[7] = \<const0> ;
  assign m_axi_sg_wdata[6] = \<const0> ;
  assign m_axi_sg_wdata[5] = \<const0> ;
  assign m_axi_sg_wdata[4] = \<const0> ;
  assign m_axi_sg_wdata[3] = \<const0> ;
  assign m_axi_sg_wdata[2] = \<const0> ;
  assign m_axi_sg_wdata[1] = \<const0> ;
  assign m_axi_sg_wdata[0] = \<const0> ;
  assign m_axi_sg_wlast = \<const0> ;
  assign m_axi_sg_wstrb[3] = \<const0> ;
  assign m_axi_sg_wstrb[2] = \<const0> ;
  assign m_axi_sg_wstrb[1] = \<const0> ;
  assign m_axi_sg_wstrb[0] = \<const0> ;
  assign m_axi_sg_wvalid = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[31] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[30] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[29] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[28] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[27] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[26] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[25] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[24] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[23] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[22] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[21] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[20] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[19] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[18] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[17] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[16] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[15] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[14] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[13] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[12] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[11] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[10] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[9] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[8] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[7] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[6] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[5] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[4] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[3] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[2] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[1] = \<const0> ;
  assign m_axis_mm2s_cntrl_tdata[0] = \<const0> ;
  assign m_axis_mm2s_cntrl_tkeep[3] = \<const0> ;
  assign m_axis_mm2s_cntrl_tkeep[2] = \<const0> ;
  assign m_axis_mm2s_cntrl_tkeep[1] = \<const0> ;
  assign m_axis_mm2s_cntrl_tkeep[0] = \<const0> ;
  assign m_axis_mm2s_cntrl_tlast = \<const0> ;
  assign m_axis_mm2s_cntrl_tvalid = \<const0> ;
  assign m_axis_mm2s_tdest[4] = \<const0> ;
  assign m_axis_mm2s_tdest[3] = \<const0> ;
  assign m_axis_mm2s_tdest[2] = \<const0> ;
  assign m_axis_mm2s_tdest[1] = \<const0> ;
  assign m_axis_mm2s_tdest[0] = \<const0> ;
  assign m_axis_mm2s_tid[4] = \<const0> ;
  assign m_axis_mm2s_tid[3] = \<const0> ;
  assign m_axis_mm2s_tid[2] = \<const0> ;
  assign m_axis_mm2s_tid[1] = \<const0> ;
  assign m_axis_mm2s_tid[0] = \<const0> ;
  assign m_axis_mm2s_tuser[3] = \<const0> ;
  assign m_axis_mm2s_tuser[2] = \<const0> ;
  assign m_axis_mm2s_tuser[1] = \<const0> ;
  assign m_axis_mm2s_tuser[0] = \<const0> ;
  assign s_axi_lite_awready = s_axi_lite_wready;
  assign s_axi_lite_bresp[1] = \<const0> ;
  assign s_axi_lite_bresp[0] = \<const0> ;
  assign s_axi_lite_rresp[1] = \<const0> ;
  assign s_axi_lite_rresp[0] = \<const0> ;
  assign s_axis_s2mm_sts_tready = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_mm2s_mngr \INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR 
       (.D({s_axis_mm2s_cmd_tdata_split[95:32],s_axis_mm2s_cmd_tdata_split[30],s_axis_mm2s_cmd_tdata_split[23],s_axis_mm2s_cmd_tdata_split[6:0]}),
        .E(\GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_CMD_STATUS/I_CMD_FIFO/USE_SINGLE_REG.sig_push_regfifo ),
        .\GEN_CMD_BTT_EQL_23.cmnd_data_reg[23] (I_AXI_DMA_REG_MODULE_n_171),
        .Q(mm2s_length),
        .axi_dma_tstvec(\^axi_dma_tstvec [4]),
        .dma_decerr_reg(I_AXI_DMA_REG_MODULE_n_4),
        .dma_interr_reg(I_AXI_DMA_REG_MODULE_n_2),
        .dma_mm2s_error(dma_mm2s_error),
        .dma_slverr_reg(I_AXI_DMA_REG_MODULE_n_3),
        .idle_reg(\INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_7 ),
        .idle_reg_0(I_AXI_DMA_REG_MODULE_n_16),
        .m_axi_sg_aresetn(m_axi_sg_aresetn),
        .m_axis_mm2s_sts_tready(m_axis_mm2s_sts_tready),
        .m_axis_mm2s_sts_tvalid_int(m_axis_mm2s_sts_tvalid_int),
        .mm2s_all_idle(mm2s_all_idle),
        .mm2s_decerr_i(\GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS/mm2s_decerr_i ),
        .mm2s_decerr_i_reg(\INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_85 ),
        .mm2s_dmacr(mm2s_dmacr),
        .mm2s_dmasr(mm2s_dmasr),
        .mm2s_halted_clr(mm2s_halted_clr),
        .mm2s_halted_set(mm2s_halted_set),
        .mm2s_halted_set0(\GEN_MM2S_DMA_CONTROL.I_MM2S_STS_MNGR/mm2s_halted_set0 ),
        .mm2s_halted_set_reg(I_RST_MODULE_n_18),
        .mm2s_interr_i(\GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS/mm2s_interr_i ),
        .mm2s_interr_i_reg(\INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_83 ),
        .mm2s_length_wren(mm2s_length_wren),
        .mm2s_sa(mm2s_sa),
        .mm2s_slverr_i(\GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS/mm2s_slverr_i ),
        .mm2s_slverr_i_reg(\INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_84 ),
        .mm2s_stop(mm2s_stop),
        .mm2s_stop_i(mm2s_stop_i),
        .mm2s_sts_received(mm2s_sts_received),
        .out(mm2s_scndry_resetn),
        .s_axi_lite_aclk(s_axi_lite_aclk),
        .s_axis_mm2s_cmd_tready(s_axis_mm2s_cmd_tready),
        .s_axis_mm2s_cmd_tvalid_split(s_axis_mm2s_cmd_tvalid_split));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_sofeof_gen \INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_SOFEOF_GEN 
       (.\GEN_FOR_SYNC.s_sof_d1_cdc_tig_reg_0 (I_RST_MODULE_n_18),
        .axi_dma_tstvec(\^axi_dma_tstvec [1:0]),
        .m_axis_mm2s_tlast(m_axis_mm2s_tlast),
        .m_axis_mm2s_tready(m_axis_mm2s_tready),
        .m_axis_mm2s_tvalid(m_axis_mm2s_tvalid),
        .out(mm2s_prmry_resetn),
        .s_axi_lite_aclk(s_axi_lite_aclk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_s2mm_mngr \INCLUDE_S2MM_SOF_EOF_GENERATOR.I_S2MM_DMA_MNGR 
       (.D({s_axis_s2mm_cmd_tdata_split[95:32],s_axis_s2mm_cmd_tdata_split[30],s_axis_s2mm_cmd_tdata_split[23],s_axis_s2mm_cmd_tdata_split[6:0]}),
        .\DETERMINATE_BTT_MODE.s2mm_decerr_i_reg (\INCLUDE_S2MM_SOF_EOF_GENERATOR.I_S2MM_DMA_MNGR_n_85 ),
        .\DETERMINATE_BTT_MODE.s2mm_interr_i_reg (\INCLUDE_S2MM_SOF_EOF_GENERATOR.I_S2MM_DMA_MNGR_n_83 ),
        .\DETERMINATE_BTT_MODE.s2mm_slverr_i_reg (\INCLUDE_S2MM_SOF_EOF_GENERATOR.I_S2MM_DMA_MNGR_n_84 ),
        .E(\GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_CMD_STATUS/I_CMD_FIFO/USE_SINGLE_REG.sig_push_regfifo ),
        .\GEN_CMD_BTT_EQL_23.cmnd_data_reg[23] (I_AXI_DMA_REG_MODULE_n_172),
        .Q(s2mm_length),
        .axi_dma_tstvec(\^axi_dma_tstvec [5]),
        .dma_decerr_reg(I_AXI_DMA_REG_MODULE_n_7),
        .dma_interr_reg(I_AXI_DMA_REG_MODULE_n_5),
        .dma_s2mm_error(dma_s2mm_error),
        .dma_slverr_reg(I_AXI_DMA_REG_MODULE_n_6),
        .idle_reg(\INCLUDE_S2MM_SOF_EOF_GENERATOR.I_S2MM_DMA_MNGR_n_7 ),
        .idle_reg_0(I_AXI_DMA_REG_MODULE_n_19),
        .m_axi_sg_aresetn(m_axi_sg_aresetn),
        .m_axis_s2mm_sts_tready(m_axis_s2mm_sts_tready),
        .m_axis_s2mm_sts_tvalid_int(m_axis_s2mm_sts_tvalid_int),
        .out(s2mm_scndry_resetn),
        .s2mm_all_idle(s2mm_all_idle),
        .s2mm_da(s2mm_da),
        .s2mm_decerr_i(\GEN_S2MM_DMA_CONTROL.I_S2MM_CMDSTS/s2mm_decerr_i ),
        .s2mm_dmacr(s2mm_dmacr),
        .s2mm_dmasr(s2mm_dmasr),
        .s2mm_halted_clr(s2mm_halted_clr),
        .s2mm_halted_set(s2mm_halted_set),
        .s2mm_halted_set0(\GEN_S2MM_DMA_CONTROL.I_S2MM_STS_MNGR/s2mm_halted_set0 ),
        .s2mm_halted_set_reg(I_RST_MODULE_n_19),
        .s2mm_interr_i(\GEN_S2MM_DMA_CONTROL.I_S2MM_CMDSTS/s2mm_interr_i ),
        .s2mm_length_wren(s2mm_length_wren),
        .s2mm_slverr_i(\GEN_S2MM_DMA_CONTROL.I_S2MM_CMDSTS/s2mm_slverr_i ),
        .s2mm_stop(s2mm_stop),
        .s2mm_stop_i(s2mm_stop_i),
        .s2mm_sts_received(s2mm_sts_received),
        .s_axi_lite_aclk(s_axi_lite_aclk),
        .s_axis_s2mm_cmd_tready(s_axis_s2mm_cmd_tready),
        .s_axis_s2mm_cmd_tvalid_split(s_axis_s2mm_cmd_tvalid_split));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_sofeof_gen_0 \INCLUDE_S2MM_SOF_EOF_GENERATOR.I_S2MM_SOFEOF_GEN 
       (.\GEN_FOR_SYNC.s_last_d1_reg_0 (I_RST_MODULE_n_19),
        .axi_dma_tstvec(\^axi_dma_tstvec [3:2]),
        .out(s2mm_prmry_resetn),
        .s_axi_lite_aclk(s_axi_lite_aclk),
        .s_axis_s2mm_tlast(s_axis_s2mm_tlast),
        .s_axis_s2mm_tready(s_axis_s2mm_tready),
        .s_axis_s2mm_tvalid(s_axis_s2mm_tvalid));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_reg_module I_AXI_DMA_REG_MODULE
       (.\GEN_REG_FOR_SMPL.buffer_length_i_reg[6] (s2mm_length),
        .\GEN_SYNC_READ.s_axi_lite_rvalid_i_reg (s_axi_lite_rvalid),
        .\GEN_SYNC_WRITE.axi2ip_wrce_reg[12] ({axi2ip_wrce[12],axi2ip_wrce[0]}),
        .Q(mm2s_length),
        .SR(I_RST_MODULE_n_20),
        .SS(p_0_in),
        .axi_dma_tstvec(\^axi_dma_tstvec [5:4]),
        .dma_decerr_reg(I_AXI_DMA_REG_MODULE_n_4),
        .dma_decerr_reg_0(I_AXI_DMA_REG_MODULE_n_7),
        .dma_decerr_reg_1(\INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_85 ),
        .dma_decerr_reg_2(\INCLUDE_S2MM_SOF_EOF_GENERATOR.I_S2MM_DMA_MNGR_n_85 ),
        .dma_interr_reg(I_AXI_DMA_REG_MODULE_n_2),
        .dma_interr_reg_0(I_AXI_DMA_REG_MODULE_n_5),
        .dma_interr_reg_1(\INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_83 ),
        .dma_interr_reg_2(\INCLUDE_S2MM_SOF_EOF_GENERATOR.I_S2MM_DMA_MNGR_n_83 ),
        .dma_mm2s_error(dma_mm2s_error),
        .dma_s2mm_error(dma_s2mm_error),
        .dma_slverr_reg(I_AXI_DMA_REG_MODULE_n_3),
        .dma_slverr_reg_0(I_AXI_DMA_REG_MODULE_n_6),
        .dma_slverr_reg_1(\INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_84 ),
        .dma_slverr_reg_2(\INCLUDE_S2MM_SOF_EOF_GENERATOR.I_S2MM_DMA_MNGR_n_84 ),
        .\dmacr_i_reg[0] (mm2s_dmacr),
        .\dmacr_i_reg[0]_0 (s2mm_dmacr),
        .\dmacr_i_reg[23] (I_RST_MODULE_n_12),
        .\dmacr_i_reg[3] (I_AXI_DMA_REG_MODULE_n_171),
        .\dmacr_i_reg[3]_0 (I_AXI_DMA_REG_MODULE_n_172),
        .\dmacr_i_reg[4] (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER/halted1 ),
        .halted_reg(I_RST_MODULE_n_15),
        .halted_reg_0(I_RST_MODULE_n_14),
        .idle_reg(I_AXI_DMA_REG_MODULE_n_16),
        .idle_reg_0(I_AXI_DMA_REG_MODULE_n_19),
        .idle_reg_1(\INCLUDE_MM2S_SOF_EOF_GENERATOR.I_MM2S_DMA_MNGR_n_7 ),
        .idle_reg_2(\INCLUDE_S2MM_SOF_EOF_GENERATOR.I_S2MM_DMA_MNGR_n_7 ),
        .m_axi_sg_aresetn(m_axi_sg_aresetn),
        .mm2s_all_idle(mm2s_all_idle),
        .mm2s_dmasr(mm2s_dmasr),
        .mm2s_halt_cmplt(mm2s_halt_cmplt),
        .mm2s_halted_set0(\GEN_MM2S_DMA_CONTROL.I_MM2S_STS_MNGR/mm2s_halted_set0 ),
        .mm2s_introut(mm2s_introut),
        .mm2s_length_wren(mm2s_length_wren),
        .mm2s_sa(mm2s_sa),
        .mm2s_stop(mm2s_stop),
        .mm2s_stop_i(mm2s_stop_i),
        .out(axi_lite_reset_n),
        .s2mm_all_idle(s2mm_all_idle),
        .s2mm_da(s2mm_da),
        .s2mm_dmasr(s2mm_dmasr),
        .s2mm_halt_cmplt(s2mm_halt_cmplt),
        .s2mm_halted_set0(\GEN_S2MM_DMA_CONTROL.I_S2MM_STS_MNGR/s2mm_halted_set0 ),
        .s2mm_introut(s2mm_introut),
        .s2mm_length_wren(s2mm_length_wren),
        .s2mm_stop(s2mm_stop),
        .s2mm_stop_i(s2mm_stop_i),
        .s_axi_lite_aclk(s_axi_lite_aclk),
        .s_axi_lite_araddr(s_axi_lite_araddr),
        .s_axi_lite_arready(s_axi_lite_arready),
        .s_axi_lite_arvalid(s_axi_lite_arvalid),
        .s_axi_lite_awaddr(s_axi_lite_awaddr[6:2]),
        .s_axi_lite_awvalid(s_axi_lite_awvalid),
        .s_axi_lite_bready(s_axi_lite_bready),
        .s_axi_lite_bvalid(s_axi_lite_bvalid),
        .s_axi_lite_rdata(s_axi_lite_rdata),
        .s_axi_lite_rready(s_axi_lite_rready),
        .s_axi_lite_wdata(s_axi_lite_wdata),
        .s_axi_lite_wready(s_axi_lite_wready),
        .s_axi_lite_wvalid(s_axi_lite_wvalid),
        .soft_reset(soft_reset),
        .soft_reset_clr(soft_reset_clr),
        .soft_reset_d1(\GEN_RESET_FOR_S2MM.RESET_I/soft_reset_d1 ),
        .soft_reset_re0(\GEN_RESET_FOR_MM2S.RESET_I/soft_reset_re0 ),
        .threshold_is_zero(\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER/threshold_is_zero ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_datamover I_PRMRY_DATAMOVER
       (.D({s_axis_mm2s_cmd_tdata_split[95:32],s_axis_mm2s_cmd_tdata_split[30],s_axis_mm2s_cmd_tdata_split[23],s_axis_mm2s_cmd_tdata_split[6:0]}),
        .E(\GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_CMD_STATUS/I_CMD_FIFO/USE_SINGLE_REG.sig_push_regfifo ),
        .\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[0] (\GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_CMD_STATUS/I_CMD_FIFO/USE_SINGLE_REG.sig_push_regfifo ),
        .\USE_SINGLE_REG.sig_regfifo_dout_reg_reg[95] ({s_axis_s2mm_cmd_tdata_split[95:32],s_axis_s2mm_cmd_tdata_split[30],s_axis_s2mm_cmd_tdata_split[23],s_axis_s2mm_cmd_tdata_split[6:0]}),
        .m_axi_mm2s_aclk(m_axi_mm2s_aclk),
        .m_axi_mm2s_araddr(m_axi_mm2s_araddr),
        .m_axi_mm2s_arburst(\^m_axi_mm2s_arburst ),
        .m_axi_mm2s_arlen(\^m_axi_mm2s_arlen ),
        .m_axi_mm2s_arready(m_axi_mm2s_arready),
        .m_axi_mm2s_arsize(\^m_axi_mm2s_arsize ),
        .m_axi_mm2s_arvalid(m_axi_mm2s_arvalid),
        .m_axi_mm2s_rdata(m_axi_mm2s_rdata),
        .m_axi_mm2s_rlast(m_axi_mm2s_rlast),
        .m_axi_mm2s_rready(m_axi_mm2s_rready),
        .m_axi_mm2s_rresp(m_axi_mm2s_rresp),
        .m_axi_mm2s_rvalid(m_axi_mm2s_rvalid),
        .m_axi_s2mm_aclk(m_axi_s2mm_aclk),
        .m_axi_s2mm_awaddr(m_axi_s2mm_awaddr),
        .m_axi_s2mm_awburst(\^m_axi_s2mm_awburst ),
        .m_axi_s2mm_awlen(\^m_axi_s2mm_awlen ),
        .m_axi_s2mm_awready(m_axi_s2mm_awready),
        .m_axi_s2mm_awsize(\^m_axi_s2mm_awsize ),
        .m_axi_s2mm_awvalid(m_axi_s2mm_awvalid),
        .m_axi_s2mm_bready(m_axi_s2mm_bready),
        .m_axi_s2mm_bresp(m_axi_s2mm_bresp),
        .m_axi_s2mm_bvalid(m_axi_s2mm_bvalid),
        .m_axi_s2mm_wdata(m_axi_s2mm_wdata),
        .m_axi_s2mm_wlast(m_axi_s2mm_wlast),
        .m_axi_s2mm_wready(m_axi_s2mm_wready),
        .m_axi_s2mm_wstrb(m_axi_s2mm_wstrb),
        .m_axi_s2mm_wvalid(m_axi_s2mm_wvalid),
        .m_axis_mm2s_sts_tready(m_axis_mm2s_sts_tready),
        .m_axis_mm2s_sts_tvalid_int(m_axis_mm2s_sts_tvalid_int),
        .m_axis_mm2s_tdata(m_axis_mm2s_tdata),
        .m_axis_mm2s_tkeep(m_axis_mm2s_tkeep),
        .m_axis_mm2s_tlast(m_axis_mm2s_tlast),
        .m_axis_mm2s_tready(m_axis_mm2s_tready),
        .m_axis_mm2s_tvalid(m_axis_mm2s_tvalid),
        .m_axis_s2mm_sts_tready(m_axis_s2mm_sts_tready),
        .m_axis_s2mm_sts_tvalid_int(m_axis_s2mm_sts_tvalid_int),
        .mm2s_decerr_i(\GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS/mm2s_decerr_i ),
        .mm2s_halt_cmplt(mm2s_halt_cmplt),
        .mm2s_interr_i(\GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS/mm2s_interr_i ),
        .mm2s_slverr_i(\GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS/mm2s_slverr_i ),
        .mm2s_sts_received(mm2s_sts_received),
        .out(m_axi_mm2s_aresetn),
        .s2mm_decerr_i(\GEN_S2MM_DMA_CONTROL.I_S2MM_CMDSTS/s2mm_decerr_i ),
        .s2mm_halt_cmplt(s2mm_halt_cmplt),
        .s2mm_interr_i(\GEN_S2MM_DMA_CONTROL.I_S2MM_CMDSTS/s2mm_interr_i ),
        .s2mm_slverr_i(\GEN_S2MM_DMA_CONTROL.I_S2MM_CMDSTS/s2mm_slverr_i ),
        .s2mm_sts_received(s2mm_sts_received),
        .s_axi_lite_aclk(s_axi_lite_aclk),
        .s_axis_mm2s_cmd_tready(s_axis_mm2s_cmd_tready),
        .s_axis_mm2s_cmd_tvalid_split(s_axis_mm2s_cmd_tvalid_split),
        .s_axis_s2mm_cmd_tready(s_axis_s2mm_cmd_tready),
        .s_axis_s2mm_cmd_tvalid_split(s_axis_s2mm_cmd_tvalid_split),
        .s_axis_s2mm_tdata(s_axis_s2mm_tdata),
        .s_axis_s2mm_tkeep(s_axis_s2mm_tkeep),
        .s_axis_s2mm_tlast(s_axis_s2mm_tlast),
        .s_axis_s2mm_tready(s_axis_s2mm_tready),
        .s_axis_s2mm_tvalid(s_axis_s2mm_tvalid),
        .sig_cmd_stat_rst_int_reg_n_reg(m_axi_s2mm_aresetn),
        .sig_rst2all_stop_request(\GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/sig_rst2all_stop_request ),
        .sig_s_h_halt_reg(sig_s_h_halt_reg),
        .sig_s_h_halt_reg_reg(I_RST_MODULE_n_21),
        .sig_s_h_halt_reg_reg_0(I_RST_MODULE_n_22));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_rst_module I_RST_MODULE
       (.\GEN_SYNC_WRITE.axi2ip_wrce_reg[12] (I_RST_MODULE_n_12),
        .\GNE_SYNC_RESET.halt_i_reg (I_RST_MODULE_n_21),
        .\GNE_SYNC_RESET.halt_i_reg_0 (I_RST_MODULE_n_22),
        .\GNE_SYNC_RESET.prmry_resetn_reg (mm2s_prmry_resetn),
        .\GNE_SYNC_RESET.prmry_resetn_reg_0 (s2mm_prmry_resetn),
        .\GNE_SYNC_RESET.s_soft_reset_i_reg (m_axi_mm2s_aresetn),
        .\GNE_SYNC_RESET.s_soft_reset_i_reg_0 (m_axi_s2mm_aresetn),
        .\GNE_SYNC_RESET.scndry_resetn_reg (s2mm_scndry_resetn),
        .\GNE_SYNC_RESET.scndry_resetn_reg_0 (I_RST_MODULE_n_14),
        .\GNE_SYNC_RESET.scndry_resetn_reg_1 (I_RST_MODULE_n_15),
        .\GNE_SYNC_RESET.scndry_resetn_reg_2 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER/halted1 ),
        .\GNE_SYNC_RESET.scndry_resetn_reg_3 (I_RST_MODULE_n_18),
        .\GNE_SYNC_RESET.scndry_resetn_reg_4 (I_RST_MODULE_n_19),
        .SR(I_RST_MODULE_n_20),
        .SS(p_0_in),
        .axi_resetn(axi_resetn),
        .\dmacr_i_reg[23] ({axi2ip_wrce[12],axi2ip_wrce[0]}),
        .m_axi_sg_aresetn(m_axi_sg_aresetn),
        .mm2s_all_idle(mm2s_all_idle),
        .mm2s_cntrl_reset_out_n(mm2s_cntrl_reset_out_n),
        .mm2s_dmasr(mm2s_dmasr),
        .mm2s_halt_cmplt(mm2s_halt_cmplt),
        .mm2s_halted_clr(mm2s_halted_clr),
        .mm2s_halted_set(mm2s_halted_set),
        .mm2s_prmry_reset_out_n(mm2s_prmry_reset_out_n),
        .mm2s_stop(mm2s_stop),
        .out(mm2s_scndry_resetn),
        .s2mm_all_idle(s2mm_all_idle),
        .s2mm_dmasr(s2mm_dmasr),
        .s2mm_halt_cmplt(s2mm_halt_cmplt),
        .s2mm_halted_clr(s2mm_halted_clr),
        .s2mm_halted_set(s2mm_halted_set),
        .s2mm_prmry_reset_out_n(s2mm_prmry_reset_out_n),
        .s2mm_stop(s2mm_stop),
        .s2mm_sts_reset_out_n(s2mm_sts_reset_out_n),
        .s_axi_lite_aclk(s_axi_lite_aclk),
        .sig_rst2all_stop_request(\GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/sig_rst2all_stop_request ),
        .sig_s_h_halt_reg(sig_s_h_halt_reg),
        .soft_reset(soft_reset),
        .soft_reset_clr(soft_reset_clr),
        .soft_reset_d1(\GEN_RESET_FOR_S2MM.RESET_I/soft_reset_d1 ),
        .soft_reset_re0(\GEN_RESET_FOR_MM2S.RESET_I/soft_reset_re0 ),
        .\syncstages_ff_reg[3] (axi_lite_reset_n),
        .threshold_is_zero(\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER/threshold_is_zero ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_lite_if
   (s_axi_lite_wready,
    s_axi_lite_arready,
    s_axi_lite_bvalid,
    \GEN_SYNC_READ.s_axi_lite_rvalid_i_reg_0 ,
    axi2ip_wrce,
    E,
    \GEN_SYNC_WRITE.axi2ip_wrce_reg[18]_0 ,
    \GEN_SYNC_WRITE.axi2ip_wrce_reg[13]_0 ,
    \GEN_SYNC_WRITE.axi2ip_wrce_reg[12]_0 ,
    \GEN_SYNC_WRITE.axi2ip_wrce_reg[7]_0 ,
    \GEN_SYNC_WRITE.axi2ip_wrce_reg[6]_0 ,
    p_0_in1_in,
    \GEN_SYNC_WRITE.axi2ip_wrce_reg[0]_0 ,
    buffer_length_wren0,
    buffer_length_wren0_0,
    \GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 ,
    s_axi_lite_rdata,
    s_axi_lite_aclk,
    SR,
    s_axi_lite_awvalid,
    s_axi_lite_wvalid,
    s_axi_lite_arvalid,
    buffer_length_wren1,
    Q,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[7]_0 ,
    mm2s_sa,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[8]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[9]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[10]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[11]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[15]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_0 ,
    s2mm_da,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[1]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_1 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[3]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[5]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[6]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_1 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[13]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[23]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[16]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[17]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[18]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[19]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[20]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[21]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[22]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[23]_1 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[24]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[31]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[25]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[26]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[27]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[28]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[29]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[30]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[31]_1 ,
    mm2s_dmasr,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[0]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_1 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_2 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[5]_1 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[6]_1 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_0 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_2 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_3 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_2 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[3]_1 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[13]_1 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[16]_1 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[17]_1 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[18]_1 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[19]_1 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[20]_1 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[21]_1 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[22]_1 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[0]_1 ,
    s2mm_dmasr,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[1]_1 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_3 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_1 ,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_4 ,
    out,
    s_axi_lite_bready,
    s_axi_lite_rready,
    s_axi_lite_awaddr,
    s_axi_lite_araddr);
  output s_axi_lite_wready;
  output s_axi_lite_arready;
  output s_axi_lite_bvalid;
  output \GEN_SYNC_READ.s_axi_lite_rvalid_i_reg_0 ;
  output [1:0]axi2ip_wrce;
  output [0:0]E;
  output [0:0]\GEN_SYNC_WRITE.axi2ip_wrce_reg[18]_0 ;
  output \GEN_SYNC_WRITE.axi2ip_wrce_reg[13]_0 ;
  output [0:0]\GEN_SYNC_WRITE.axi2ip_wrce_reg[12]_0 ;
  output [0:0]\GEN_SYNC_WRITE.axi2ip_wrce_reg[7]_0 ;
  output [0:0]\GEN_SYNC_WRITE.axi2ip_wrce_reg[6]_0 ;
  output p_0_in1_in;
  output [0:0]\GEN_SYNC_WRITE.axi2ip_wrce_reg[0]_0 ;
  output buffer_length_wren0;
  output buffer_length_wren0_0;
  output [2:0]\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 ;
  output [31:0]s_axi_lite_rdata;
  input s_axi_lite_aclk;
  input [0:0]SR;
  input s_axi_lite_awvalid;
  input s_axi_lite_wvalid;
  input s_axi_lite_arvalid;
  input buffer_length_wren1;
  input [22:0]Q;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[7]_0 ;
  input [19:0]mm2s_sa;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[8]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[9]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[10]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[11]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[15]_0 ;
  input [6:0]\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_0 ;
  input [31:0]s2mm_da;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[1]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_1 ;
  input [1:0]\GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[3]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[5]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[6]_0 ;
  input [2:0]\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_1 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[13]_0 ;
  input [7:0]\GEN_SYNC_READ.s_axi_lite_rdata_reg[23]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[16]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[17]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[18]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[19]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[20]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[21]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[22]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[23]_1 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[24]_0 ;
  input [7:0]\GEN_SYNC_READ.s_axi_lite_rdata_reg[31]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[25]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[26]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[27]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[28]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[29]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[30]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[31]_1 ;
  input [0:0]mm2s_dmasr;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[0]_0 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_1 ;
  input [0:0]\GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_2 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[5]_1 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[6]_1 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_0 ;
  input [1:0]\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_2 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_3 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_2 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[3]_1 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[13]_1 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[16]_1 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[17]_1 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[18]_1 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[19]_1 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[20]_1 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[21]_1 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[22]_1 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[0]_1 ;
  input [0:0]s2mm_dmasr;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[1]_1 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_3 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_1 ;
  input \GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_4 ;
  input out;
  input s_axi_lite_bready;
  input s_axi_lite_rready;
  input [4:0]s_axi_lite_awaddr;
  input [9:0]s_axi_lite_araddr;

  wire [0:0]E;
  wire [2:0]\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[0]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[0]_i_3_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[0]_i_4_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[0]_i_5_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[10]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[11]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[12]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[12]_i_3_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[12]_i_4_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[12]_i_5_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[13]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[14]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[14]_i_3_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[14]_i_4_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[14]_i_5_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[15]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[15]_i_3_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[16]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[17]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[18]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[19]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_4_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[20]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[21]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[22]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[22]_i_3_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[22]_i_4_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[22]_i_6_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[23]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[24]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[25]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[26]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[27]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[28]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[29]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[2]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[30]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_3_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_4_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_6_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_7_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_8_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[3]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[4]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[4]_i_3_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[4]_i_4_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[4]_i_5_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[5]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[5]_i_3_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[6]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[6]_i_3_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[6]_i_4_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[7]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[8]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata[9]_i_2_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[0]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[0]_1 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[10]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[11]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_1 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[13]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[13]_1 ;
  wire [6:0]\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_0 ;
  wire [2:0]\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_1 ;
  wire [1:0]\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_2 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_3 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_4 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[15]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[16]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[16]_1 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[17]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[17]_1 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[18]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[18]_1 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[19]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[19]_1 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[1]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[1]_1 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[20]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[20]_1 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[21]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[21]_1 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[22]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[22]_1 ;
  wire [7:0]\GEN_SYNC_READ.s_axi_lite_rdata_reg[23]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[23]_1 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[24]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[25]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[26]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[27]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[28]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[29]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_1 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_2 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[30]_0 ;
  wire [7:0]\GEN_SYNC_READ.s_axi_lite_rdata_reg[31]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[31]_1 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[3]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[3]_1 ;
  wire [1:0]\GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_1 ;
  wire [0:0]\GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_2 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_3 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[5]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[5]_1 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[6]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[6]_1 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[7]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[8]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rdata_reg[9]_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rvalid_i_i_1_n_0 ;
  wire \GEN_SYNC_READ.s_axi_lite_rvalid_i_reg_0 ;
  wire \GEN_SYNC_WRITE.axi2ip_wrce[0]_i_1_n_0 ;
  wire \GEN_SYNC_WRITE.axi2ip_wrce[10]_i_1_n_0 ;
  wire \GEN_SYNC_WRITE.axi2ip_wrce[12]_i_1_n_0 ;
  wire \GEN_SYNC_WRITE.axi2ip_wrce[13]_i_1_n_0 ;
  wire \GEN_SYNC_WRITE.axi2ip_wrce[18]_i_1_n_0 ;
  wire \GEN_SYNC_WRITE.axi2ip_wrce[19]_i_1_n_0 ;
  wire \GEN_SYNC_WRITE.axi2ip_wrce[1]_i_1_n_0 ;
  wire \GEN_SYNC_WRITE.axi2ip_wrce[22]_i_1_n_0 ;
  wire \GEN_SYNC_WRITE.axi2ip_wrce[22]_i_2_n_0 ;
  wire \GEN_SYNC_WRITE.axi2ip_wrce[6]_i_1_n_0 ;
  wire \GEN_SYNC_WRITE.axi2ip_wrce[7]_i_1_n_0 ;
  wire [0:0]\GEN_SYNC_WRITE.axi2ip_wrce_reg[0]_0 ;
  wire [0:0]\GEN_SYNC_WRITE.axi2ip_wrce_reg[12]_0 ;
  wire \GEN_SYNC_WRITE.axi2ip_wrce_reg[13]_0 ;
  wire [0:0]\GEN_SYNC_WRITE.axi2ip_wrce_reg[18]_0 ;
  wire [0:0]\GEN_SYNC_WRITE.axi2ip_wrce_reg[6]_0 ;
  wire [0:0]\GEN_SYNC_WRITE.axi2ip_wrce_reg[7]_0 ;
  wire \GEN_SYNC_WRITE.bvalid_i_i_1_n_0 ;
  wire \GEN_SYNC_WRITE.rdy_i_2_n_0 ;
  wire \GEN_SYNC_WRITE.wr_addr_cap_i_1_n_0 ;
  wire \GEN_SYNC_WRITE.wr_data_cap_i_1_n_0 ;
  wire \GEN_SYNC_WRITE.wr_in_progress_i_1_n_0 ;
  wire [22:0]Q;
  wire [0:0]SR;
  wire [9:0]araddr;
  wire arvalid;
  wire arvalid_d1;
  wire arvalid_d1_i_1_n_0;
  wire arvalid_re;
  wire awvalid;
  wire awvalid_d1;
  wire awvalid_d10;
  wire [9:0]axi2ip_rdaddr;
  wire [9:0]axi2ip_rdaddr_i;
  wire [1:0]axi2ip_wrce;
  wire buffer_length_wren0;
  wire buffer_length_wren0_0;
  wire buffer_length_wren1;
  wire [31:0]ip2axi_rddata1_out;
  wire [0:0]mm2s_dmasr;
  wire [19:0]mm2s_sa;
  wire out;
  wire p_0_in1_in;
  wire rdy;
  wire rvalid;
  wire [31:0]s2mm_da;
  wire [0:0]s2mm_dmasr;
  wire s_axi_lite_aclk;
  wire [9:0]s_axi_lite_araddr;
  wire s_axi_lite_arready;
  wire s_axi_lite_arvalid;
  wire [4:0]s_axi_lite_awaddr;
  wire s_axi_lite_awvalid;
  wire s_axi_lite_bready;
  wire s_axi_lite_bvalid;
  wire [31:0]s_axi_lite_rdata;
  wire s_axi_lite_rready;
  wire s_axi_lite_wready;
  wire s_axi_lite_wvalid;
  wire wr_addr_cap;
  wire wr_data_cap;
  wire wr_data_cap0;
  wire wr_in_progress;
  wire wvalid;
  wire wvalid_d1;

  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \GEN_REG_FOR_SMPL.buffer_length_wren_i_1 
       (.I0(axi2ip_wrce[1]),
        .I1(buffer_length_wren1),
        .O(buffer_length_wren0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \GEN_REG_FOR_SMPL.buffer_length_wren_i_1__0 
       (.I0(axi2ip_wrce[0]),
        .I1(buffer_length_wren1),
        .O(buffer_length_wren0_0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_SYNC_READ.axi2ip_rdaddr_i_reg[0] 
       (.C(s_axi_lite_aclk),
        .CE(arvalid_re),
        .D(araddr[0]),
        .Q(axi2ip_rdaddr_i[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_SYNC_READ.axi2ip_rdaddr_i_reg[1] 
       (.C(s_axi_lite_aclk),
        .CE(arvalid_re),
        .D(araddr[1]),
        .Q(axi2ip_rdaddr_i[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_SYNC_READ.axi2ip_rdaddr_i_reg[2] 
       (.C(s_axi_lite_aclk),
        .CE(arvalid_re),
        .D(araddr[2]),
        .Q(axi2ip_rdaddr_i[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_SYNC_READ.axi2ip_rdaddr_i_reg[3] 
       (.C(s_axi_lite_aclk),
        .CE(arvalid_re),
        .D(araddr[3]),
        .Q(axi2ip_rdaddr_i[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_SYNC_READ.axi2ip_rdaddr_i_reg[4] 
       (.C(s_axi_lite_aclk),
        .CE(arvalid_re),
        .D(araddr[4]),
        .Q(axi2ip_rdaddr_i[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_SYNC_READ.axi2ip_rdaddr_i_reg[5] 
       (.C(s_axi_lite_aclk),
        .CE(arvalid_re),
        .D(araddr[5]),
        .Q(axi2ip_rdaddr_i[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_SYNC_READ.axi2ip_rdaddr_i_reg[6] 
       (.C(s_axi_lite_aclk),
        .CE(arvalid_re),
        .D(araddr[6]),
        .Q(axi2ip_rdaddr_i[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_SYNC_READ.axi2ip_rdaddr_i_reg[7] 
       (.C(s_axi_lite_aclk),
        .CE(arvalid_re),
        .D(araddr[7]),
        .Q(axi2ip_rdaddr_i[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_SYNC_READ.axi2ip_rdaddr_i_reg[8] 
       (.C(s_axi_lite_aclk),
        .CE(arvalid_re),
        .D(araddr[8]),
        .Q(axi2ip_rdaddr_i[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_SYNC_READ.axi2ip_rdaddr_i_reg[9] 
       (.C(s_axi_lite_aclk),
        .CE(arvalid_re),
        .D(araddr[9]),
        .Q(axi2ip_rdaddr_i[9]),
        .R(SR));
  FDRE \GEN_SYNC_READ.axi2ip_rdaddr_reg[0] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(axi2ip_rdaddr_i[0]),
        .Q(axi2ip_rdaddr[0]),
        .R(SR));
  FDRE \GEN_SYNC_READ.axi2ip_rdaddr_reg[1] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(axi2ip_rdaddr_i[1]),
        .Q(axi2ip_rdaddr[1]),
        .R(SR));
  FDRE \GEN_SYNC_READ.axi2ip_rdaddr_reg[2] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(axi2ip_rdaddr_i[2]),
        .Q(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .R(SR));
  FDRE \GEN_SYNC_READ.axi2ip_rdaddr_reg[3] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(axi2ip_rdaddr_i[3]),
        .Q(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .R(SR));
  FDRE \GEN_SYNC_READ.axi2ip_rdaddr_reg[4] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(axi2ip_rdaddr_i[4]),
        .Q(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .R(SR));
  FDRE \GEN_SYNC_READ.axi2ip_rdaddr_reg[5] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(axi2ip_rdaddr_i[5]),
        .Q(axi2ip_rdaddr[5]),
        .R(SR));
  FDRE \GEN_SYNC_READ.axi2ip_rdaddr_reg[6] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(axi2ip_rdaddr_i[6]),
        .Q(axi2ip_rdaddr[6]),
        .R(SR));
  FDRE \GEN_SYNC_READ.axi2ip_rdaddr_reg[7] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(axi2ip_rdaddr_i[7]),
        .Q(axi2ip_rdaddr[7]),
        .R(SR));
  FDRE \GEN_SYNC_READ.axi2ip_rdaddr_reg[8] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(axi2ip_rdaddr_i[8]),
        .Q(axi2ip_rdaddr[8]),
        .R(SR));
  FDRE \GEN_SYNC_READ.axi2ip_rdaddr_reg[9] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(axi2ip_rdaddr_i[9]),
        .Q(axi2ip_rdaddr[9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_SYNC_READ.rvalid_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s_axi_lite_arready),
        .Q(rvalid),
        .R(SR));
  LUT6 #(
    .INIT(64'hAAAAAAAA22022000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[0]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_3_n_0 ),
        .I1(axi2ip_rdaddr[6]),
        .I2(axi2ip_rdaddr[5]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[0]_i_2_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata[0]_i_3_n_0 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[0]_i_4_n_0 ),
        .O(ip2axi_rddata1_out[0]));
  LUT6 #(
    .INIT(64'h00F000AA0000CC00)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[0]_i_2 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata_reg[0]_1 ),
        .I1(Q[0]),
        .I2(s2mm_dmasr),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I4(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I5(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF05010400)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[0]_i_3 
       (.I0(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I1(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I3(mm2s_dmasr),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[0]_0 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[0]_i_5_n_0 ),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h2A0A280822022000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[0]_i_4 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_8_n_0 ),
        .I1(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_0 [0]),
        .I4(s2mm_da[0]),
        .I5(s2mm_da[16]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hCA000000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[0]_i_5 
       (.I0(mm2s_sa[0]),
        .I1(mm2s_sa[10]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I4(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEA00EA00EA00)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[10]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[10]_i_2_n_0 ),
        .I1(Q[10]),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata[15]_i_3_n_0 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_4_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[10]_0 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_6_n_0 ),
        .O(ip2axi_rddata1_out[10]));
  LUT6 #(
    .INIT(64'h0000CA0000000000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[10]_i_2 
       (.I0(mm2s_sa[5]),
        .I1(mm2s_sa[15]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I4(axi2ip_rdaddr[5]),
        .I5(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEA00EA00EA00)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[11]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[11]_i_2_n_0 ),
        .I1(Q[11]),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata[15]_i_3_n_0 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_4_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[11]_0 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_6_n_0 ),
        .O(ip2axi_rddata1_out[11]));
  LUT6 #(
    .INIT(64'h0000CA0000000000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[11]_i_2 
       (.I0(mm2s_sa[6]),
        .I1(mm2s_sa[16]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I4(axi2ip_rdaddr[5]),
        .I5(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAA22022000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[12]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_3_n_0 ),
        .I1(axi2ip_rdaddr[6]),
        .I2(axi2ip_rdaddr[5]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[12]_i_2_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata[12]_i_3_n_0 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[12]_i_4_n_0 ),
        .O(ip2axi_rddata1_out[12]));
  LUT6 #(
    .INIT(64'h00F000AA0000CC00)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[12]_i_2 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_1 [0]),
        .I1(Q[12]),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_1 ),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I4(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I5(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF05010400)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[12]_i_3 
       (.I0(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I1(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_2 [0]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[12]_i_5_n_0 ),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[12]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h2A0A280822022000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[12]_i_4 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_8_n_0 ),
        .I1(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_0 [5]),
        .I4(s2mm_da[5]),
        .I5(s2mm_da[21]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[12]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hCA000000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[12]_i_5 
       (.I0(mm2s_sa[7]),
        .I1(mm2s_sa[17]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I4(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[12]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEA00EA00EA00)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[13]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[13]_i_2_n_0 ),
        .I1(\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_1 [1]),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_3_n_0 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_4_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[13]_0 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_6_n_0 ),
        .O(ip2axi_rddata1_out[13]));
  LUT6 #(
    .INIT(64'h000C0000AAAAAAAA)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[13]_i_2 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata_reg[13]_1 ),
        .I1(Q[13]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I4(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I5(axi2ip_rdaddr[5]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAA22022000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[14]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_3_n_0 ),
        .I1(axi2ip_rdaddr[6]),
        .I2(axi2ip_rdaddr[5]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[14]_i_2_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata[14]_i_3_n_0 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[14]_i_4_n_0 ),
        .O(ip2axi_rddata1_out[14]));
  LUT6 #(
    .INIT(64'h00F000AA0000CC00)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[14]_i_2 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_1 [2]),
        .I1(Q[14]),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_4 ),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I4(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I5(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF05010400)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[14]_i_3 
       (.I0(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I1(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_3 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_2 [1]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[14]_i_5_n_0 ),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[14]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h2A0A280822022000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[14]_i_4 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_8_n_0 ),
        .I1(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_0 [6]),
        .I4(s2mm_da[6]),
        .I5(s2mm_da[22]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[14]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hCA000000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[14]_i_5 
       (.I0(mm2s_sa[8]),
        .I1(mm2s_sa[18]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I4(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[14]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEA00EA00EA00)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[15]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[15]_i_2_n_0 ),
        .I1(Q[15]),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata[15]_i_3_n_0 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_4_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[15]_0 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_6_n_0 ),
        .O(ip2axi_rddata1_out[15]));
  LUT6 #(
    .INIT(64'h0000CA0000000000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[15]_i_2 
       (.I0(mm2s_sa[9]),
        .I1(mm2s_sa[19]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I4(axi2ip_rdaddr[5]),
        .I5(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[15]_i_3 
       (.I0(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I1(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I3(axi2ip_rdaddr[5]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[15]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEA00EA00EA00)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[16]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[16]_i_2_n_0 ),
        .I1(\GEN_SYNC_READ.s_axi_lite_rdata_reg[23]_0 [0]),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_3_n_0 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_4_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[16]_0 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_6_n_0 ),
        .O(ip2axi_rddata1_out[16]));
  LUT6 #(
    .INIT(64'h000C0000AAAAAAAA)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[16]_i_2 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata_reg[16]_1 ),
        .I1(Q[16]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I4(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I5(axi2ip_rdaddr[5]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEA00EA00EA00)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[17]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[17]_i_2_n_0 ),
        .I1(\GEN_SYNC_READ.s_axi_lite_rdata_reg[23]_0 [1]),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_3_n_0 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_4_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[17]_0 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_6_n_0 ),
        .O(ip2axi_rddata1_out[17]));
  LUT6 #(
    .INIT(64'h000C0000AAAAAAAA)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[17]_i_2 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata_reg[17]_1 ),
        .I1(Q[17]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I4(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I5(axi2ip_rdaddr[5]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEA00EA00EA00)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[18]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[18]_i_2_n_0 ),
        .I1(\GEN_SYNC_READ.s_axi_lite_rdata_reg[23]_0 [2]),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_3_n_0 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_4_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[18]_0 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_6_n_0 ),
        .O(ip2axi_rddata1_out[18]));
  LUT6 #(
    .INIT(64'h000C0000AAAAAAAA)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[18]_i_2 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata_reg[18]_1 ),
        .I1(Q[18]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I4(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I5(axi2ip_rdaddr[5]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEA00EA00EA00)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[19]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[19]_i_2_n_0 ),
        .I1(\GEN_SYNC_READ.s_axi_lite_rdata_reg[23]_0 [3]),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_3_n_0 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_4_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[19]_0 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_6_n_0 ),
        .O(ip2axi_rddata1_out[19]));
  LUT6 #(
    .INIT(64'h000C0000AAAAAAAA)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[19]_i_2 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata_reg[19]_1 ),
        .I1(Q[19]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I4(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I5(axi2ip_rdaddr[5]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAA22022000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_3_n_0 ),
        .I1(axi2ip_rdaddr[6]),
        .I2(axi2ip_rdaddr[5]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[1]_i_2_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1]_0 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[1]_i_4_n_0 ),
        .O(ip2axi_rddata1_out[1]));
  LUT5 #(
    .INIT(32'h30380038)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_2 
       (.I0(Q[1]),
        .I1(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1]_1 ),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h2A0A280822022000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_4 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_8_n_0 ),
        .I1(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_0 [1]),
        .I4(s2mm_da[1]),
        .I5(s2mm_da[17]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEA00EA00EA00)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[20]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[20]_i_2_n_0 ),
        .I1(\GEN_SYNC_READ.s_axi_lite_rdata_reg[23]_0 [4]),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_3_n_0 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_4_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[20]_0 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_6_n_0 ),
        .O(ip2axi_rddata1_out[20]));
  LUT6 #(
    .INIT(64'h000C0000AAAAAAAA)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[20]_i_2 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata_reg[20]_1 ),
        .I1(Q[20]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I4(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I5(axi2ip_rdaddr[5]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEA00EA00EA00)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[21]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[21]_i_2_n_0 ),
        .I1(\GEN_SYNC_READ.s_axi_lite_rdata_reg[23]_0 [5]),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_3_n_0 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_4_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[21]_0 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_6_n_0 ),
        .O(ip2axi_rddata1_out[21]));
  LUT6 #(
    .INIT(64'h000C0000AAAAAAAA)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[21]_i_2 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata_reg[21]_1 ),
        .I1(Q[21]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I4(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I5(axi2ip_rdaddr[5]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEA00EA00EA00)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[22]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_2_n_0 ),
        .I1(\GEN_SYNC_READ.s_axi_lite_rdata_reg[23]_0 [6]),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_3_n_0 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_4_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[22]_0 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_6_n_0 ),
        .O(ip2axi_rddata1_out[22]));
  LUT6 #(
    .INIT(64'h000C0000AAAAAAAA)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[22]_i_2 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata_reg[22]_1 ),
        .I1(Q[22]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I4(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I5(axi2ip_rdaddr[5]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[22]_i_3 
       (.I0(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I1(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I3(axi2ip_rdaddr[5]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[22]_i_4 
       (.I0(axi2ip_rdaddr[8]),
        .I1(axi2ip_rdaddr[9]),
        .I2(axi2ip_rdaddr[7]),
        .I3(axi2ip_rdaddr[1]),
        .I4(axi2ip_rdaddr[0]),
        .I5(axi2ip_rdaddr[6]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[22]_i_6 
       (.I0(axi2ip_rdaddr[6]),
        .I1(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I2(axi2ip_rdaddr[5]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_3_n_0 ),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[23]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_3_n_0 ),
        .I1(\GEN_SYNC_READ.s_axi_lite_rdata[23]_i_2_n_0 ),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata_reg[23]_1 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_6_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[23]_0 [7]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_7_n_0 ),
        .O(ip2axi_rddata1_out[23]));
  LUT5 #(
    .INIT(32'h0C0A0000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[23]_i_2 
       (.I0(s2mm_da[7]),
        .I1(s2mm_da[23]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_8_n_0 ),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[23]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[24]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_3_n_0 ),
        .I1(\GEN_SYNC_READ.s_axi_lite_rdata[24]_i_2_n_0 ),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata_reg[24]_0 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_6_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[31]_0 [0]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_7_n_0 ),
        .O(ip2axi_rddata1_out[24]));
  LUT5 #(
    .INIT(32'h0C0A0000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[24]_i_2 
       (.I0(s2mm_da[8]),
        .I1(s2mm_da[24]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_8_n_0 ),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[24]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[25]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_3_n_0 ),
        .I1(\GEN_SYNC_READ.s_axi_lite_rdata[25]_i_2_n_0 ),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata_reg[25]_0 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_6_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[31]_0 [1]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_7_n_0 ),
        .O(ip2axi_rddata1_out[25]));
  LUT5 #(
    .INIT(32'h0C0A0000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[25]_i_2 
       (.I0(s2mm_da[9]),
        .I1(s2mm_da[25]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_8_n_0 ),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[25]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[26]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_3_n_0 ),
        .I1(\GEN_SYNC_READ.s_axi_lite_rdata[26]_i_2_n_0 ),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata_reg[26]_0 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_6_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[31]_0 [2]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_7_n_0 ),
        .O(ip2axi_rddata1_out[26]));
  LUT5 #(
    .INIT(32'h0C0A0000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[26]_i_2 
       (.I0(s2mm_da[10]),
        .I1(s2mm_da[26]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_8_n_0 ),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[26]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[27]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_3_n_0 ),
        .I1(\GEN_SYNC_READ.s_axi_lite_rdata[27]_i_2_n_0 ),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata_reg[27]_0 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_6_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[31]_0 [3]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_7_n_0 ),
        .O(ip2axi_rddata1_out[27]));
  LUT5 #(
    .INIT(32'h0C0A0000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[27]_i_2 
       (.I0(s2mm_da[11]),
        .I1(s2mm_da[27]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_8_n_0 ),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[27]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[28]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_3_n_0 ),
        .I1(\GEN_SYNC_READ.s_axi_lite_rdata[28]_i_2_n_0 ),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata_reg[28]_0 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_6_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[31]_0 [4]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_7_n_0 ),
        .O(ip2axi_rddata1_out[28]));
  LUT5 #(
    .INIT(32'h0C0A0000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[28]_i_2 
       (.I0(s2mm_da[12]),
        .I1(s2mm_da[28]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_8_n_0 ),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[28]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[29]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_3_n_0 ),
        .I1(\GEN_SYNC_READ.s_axi_lite_rdata[29]_i_2_n_0 ),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata_reg[29]_0 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_6_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[31]_0 [5]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_7_n_0 ),
        .O(ip2axi_rddata1_out[29]));
  LUT5 #(
    .INIT(32'h0C0A0000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[29]_i_2 
       (.I0(s2mm_da[13]),
        .I1(s2mm_da[29]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_8_n_0 ),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEA00EA00EA00)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[2]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[2]_i_2_n_0 ),
        .I1(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0 ),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_3_n_0 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_4_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_1 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_6_n_0 ),
        .O(ip2axi_rddata1_out[2]));
  LUT6 #(
    .INIT(64'h000C0000AAAAAAAA)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[2]_i_2 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_2 ),
        .I1(Q[2]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I4(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I5(axi2ip_rdaddr[5]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[30]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_3_n_0 ),
        .I1(\GEN_SYNC_READ.s_axi_lite_rdata[30]_i_2_n_0 ),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata_reg[30]_0 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_6_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[31]_0 [6]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_7_n_0 ),
        .O(ip2axi_rddata1_out[30]));
  LUT5 #(
    .INIT(32'h0C0A0000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[30]_i_2 
       (.I0(s2mm_da[14]),
        .I1(s2mm_da[30]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_8_n_0 ),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[30]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h8F)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rvalid_i_reg_0 ),
        .I1(s_axi_lite_rready),
        .I2(out),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA888A888A888)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_2 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_3_n_0 ),
        .I1(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_4_n_0 ),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata_reg[31]_1 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_6_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[31]_0 [7]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_7_n_0 ),
        .O(ip2axi_rddata1_out[31]));
  LUT5 #(
    .INIT(32'h00000001)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_3 
       (.I0(axi2ip_rdaddr[0]),
        .I1(axi2ip_rdaddr[1]),
        .I2(axi2ip_rdaddr[7]),
        .I3(axi2ip_rdaddr[9]),
        .I4(axi2ip_rdaddr[8]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0C0A0000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_4 
       (.I0(s2mm_da[15]),
        .I1(s2mm_da[31]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_8_n_0 ),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_6 
       (.I0(axi2ip_rdaddr[6]),
        .I1(axi2ip_rdaddr[5]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h00000200)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_7 
       (.I0(axi2ip_rdaddr[5]),
        .I1(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I4(axi2ip_rdaddr[6]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_8 
       (.I0(axi2ip_rdaddr[5]),
        .I1(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I2(axi2ip_rdaddr[6]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEA00EA00EA00)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[3]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[3]_i_2_n_0 ),
        .I1(\GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_0 [0]),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_3_n_0 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_4_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[3]_0 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_6_n_0 ),
        .O(ip2axi_rddata1_out[3]));
  LUT6 #(
    .INIT(64'h000C0000AAAAAAAA)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[3]_i_2 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata_reg[3]_1 ),
        .I1(Q[3]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I4(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I5(axi2ip_rdaddr[5]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAA22022000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[4]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_3_n_0 ),
        .I1(axi2ip_rdaddr[6]),
        .I2(axi2ip_rdaddr[5]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[4]_i_2_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata[4]_i_3_n_0 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[4]_i_4_n_0 ),
        .O(ip2axi_rddata1_out[4]));
  LUT6 #(
    .INIT(64'h00F000AA0000CC00)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[4]_i_2 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_0 [1]),
        .I1(Q[4]),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_3 ),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I4(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I5(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF05010400)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[4]_i_3 
       (.I0(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I1(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_1 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_2 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[4]_i_5_n_0 ),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h2A0A280822022000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[4]_i_4 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_8_n_0 ),
        .I1(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_0 [2]),
        .I4(s2mm_da[2]),
        .I5(s2mm_da[18]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[4]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hCA000000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[4]_i_5 
       (.I0(mm2s_sa[1]),
        .I1(mm2s_sa[11]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I4(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFEAAA0000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[5]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[5]_i_2_n_0 ),
        .I1(\GEN_SYNC_READ.s_axi_lite_rdata[6]_i_3_n_0 ),
        .I2(axi2ip_rdaddr[5]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[5]_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_4_n_0 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[5]_i_3_n_0 ),
        .O(ip2axi_rddata1_out[5]));
  LUT6 #(
    .INIT(64'h0200FFFF02000000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[5]_i_2 
       (.I0(Q[5]),
        .I1(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I4(axi2ip_rdaddr[5]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata_reg[5]_1 ),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h2A0A280822022000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[5]_i_3 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_6_n_0 ),
        .I1(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_0 [3]),
        .I4(s2mm_da[3]),
        .I5(s2mm_da[19]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFEAAA0000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[6]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[6]_i_2_n_0 ),
        .I1(\GEN_SYNC_READ.s_axi_lite_rdata[6]_i_3_n_0 ),
        .I2(axi2ip_rdaddr[5]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[6]_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_4_n_0 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[6]_i_4_n_0 ),
        .O(ip2axi_rddata1_out[6]));
  LUT6 #(
    .INIT(64'h0200FFFF02000000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[6]_i_2 
       (.I0(Q[6]),
        .I1(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I4(axi2ip_rdaddr[5]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata_reg[6]_1 ),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[6]_i_3 
       (.I0(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .I1(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h2A0A280822022000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[6]_i_4 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_6_n_0 ),
        .I1(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_0 [4]),
        .I4(s2mm_da[4]),
        .I5(s2mm_da[20]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEA00EA00EA00)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[7]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[7]_i_2_n_0 ),
        .I1(Q[7]),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata[15]_i_3_n_0 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_4_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[7]_0 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_6_n_0 ),
        .O(ip2axi_rddata1_out[7]));
  LUT6 #(
    .INIT(64'h0000CA0000000000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[7]_i_2 
       (.I0(mm2s_sa[2]),
        .I1(mm2s_sa[12]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I4(axi2ip_rdaddr[5]),
        .I5(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEA00EA00EA00)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[8]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[8]_i_2_n_0 ),
        .I1(Q[8]),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata[15]_i_3_n_0 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_4_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[8]_0 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_6_n_0 ),
        .O(ip2axi_rddata1_out[8]));
  LUT6 #(
    .INIT(64'h0000CA0000000000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[8]_i_2 
       (.I0(mm2s_sa[3]),
        .I1(mm2s_sa[13]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I4(axi2ip_rdaddr[5]),
        .I5(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEA00EA00EA00)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[9]_i_1 
       (.I0(\GEN_SYNC_READ.s_axi_lite_rdata[9]_i_2_n_0 ),
        .I1(Q[9]),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata[15]_i_3_n_0 ),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_4_n_0 ),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[9]_0 ),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata[22]_i_6_n_0 ),
        .O(ip2axi_rddata1_out[9]));
  LUT6 #(
    .INIT(64'h0000CA0000000000)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[9]_i_2 
       (.I0(mm2s_sa[4]),
        .I1(mm2s_sa[14]),
        .I2(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [0]),
        .I3(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [2]),
        .I4(axi2ip_rdaddr[5]),
        .I5(\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 [1]),
        .O(\GEN_SYNC_READ.s_axi_lite_rdata[9]_i_2_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[0] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[0]),
        .Q(s_axi_lite_rdata[0]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[10] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[10]),
        .Q(s_axi_lite_rdata[10]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[11] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[11]),
        .Q(s_axi_lite_rdata[11]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[12] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[12]),
        .Q(s_axi_lite_rdata[12]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[13] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[13]),
        .Q(s_axi_lite_rdata[13]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[14] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[14]),
        .Q(s_axi_lite_rdata[14]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[15] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[15]),
        .Q(s_axi_lite_rdata[15]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[16] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[16]),
        .Q(s_axi_lite_rdata[16]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[17] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[17]),
        .Q(s_axi_lite_rdata[17]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[18] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[18]),
        .Q(s_axi_lite_rdata[18]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[19] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[19]),
        .Q(s_axi_lite_rdata[19]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[1] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[1]),
        .Q(s_axi_lite_rdata[1]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[20] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[20]),
        .Q(s_axi_lite_rdata[20]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[21] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[21]),
        .Q(s_axi_lite_rdata[21]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[22] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[22]),
        .Q(s_axi_lite_rdata[22]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[23] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[23]),
        .Q(s_axi_lite_rdata[23]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[24] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[24]),
        .Q(s_axi_lite_rdata[24]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[25] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[25]),
        .Q(s_axi_lite_rdata[25]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[26] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[26]),
        .Q(s_axi_lite_rdata[26]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[27] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[27]),
        .Q(s_axi_lite_rdata[27]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[28] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[28]),
        .Q(s_axi_lite_rdata[28]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[29] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[29]),
        .Q(s_axi_lite_rdata[29]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[2] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[2]),
        .Q(s_axi_lite_rdata[2]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[30] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[30]),
        .Q(s_axi_lite_rdata[30]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[31] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[31]),
        .Q(s_axi_lite_rdata[31]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[3] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[3]),
        .Q(s_axi_lite_rdata[3]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[4] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[4]),
        .Q(s_axi_lite_rdata[4]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[5] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[5]),
        .Q(s_axi_lite_rdata[5]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[6] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[6]),
        .Q(s_axi_lite_rdata[6]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[7] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[7]),
        .Q(s_axi_lite_rdata[7]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[8] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[8]),
        .Q(s_axi_lite_rdata[8]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  FDRE \GEN_SYNC_READ.s_axi_lite_rdata_reg[9] 
       (.C(s_axi_lite_aclk),
        .CE(rvalid),
        .D(ip2axi_rddata1_out[9]),
        .Q(s_axi_lite_rdata[9]),
        .R(\GEN_SYNC_READ.s_axi_lite_rdata[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0C88)) 
    \GEN_SYNC_READ.s_axi_lite_rvalid_i_i_1 
       (.I0(rvalid),
        .I1(out),
        .I2(s_axi_lite_rready),
        .I3(\GEN_SYNC_READ.s_axi_lite_rvalid_i_reg_0 ),
        .O(\GEN_SYNC_READ.s_axi_lite_rvalid_i_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_SYNC_READ.s_axi_lite_rvalid_i_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_SYNC_READ.s_axi_lite_rvalid_i_i_1_n_0 ),
        .Q(\GEN_SYNC_READ.s_axi_lite_rvalid_i_reg_0 ),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hB)) 
    \GEN_SYNC_WRITE.awvalid_d1_i_1 
       (.I0(s_axi_lite_bvalid),
        .I1(out),
        .O(awvalid_d10));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_SYNC_WRITE.awvalid_d1_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(awvalid),
        .Q(awvalid_d1),
        .R(awvalid_d10));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \GEN_SYNC_WRITE.axi2ip_wrce[0]_i_1 
       (.I0(s_axi_lite_awaddr[0]),
        .I1(s_axi_lite_awaddr[4]),
        .I2(\GEN_SYNC_WRITE.axi2ip_wrce[22]_i_2_n_0 ),
        .I3(s_axi_lite_awaddr[2]),
        .I4(s_axi_lite_awaddr[3]),
        .I5(s_axi_lite_awaddr[1]),
        .O(\GEN_SYNC_WRITE.axi2ip_wrce[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000010000000000)) 
    \GEN_SYNC_WRITE.axi2ip_wrce[10]_i_1 
       (.I0(s_axi_lite_awaddr[0]),
        .I1(s_axi_lite_awaddr[4]),
        .I2(\GEN_SYNC_WRITE.axi2ip_wrce[22]_i_2_n_0 ),
        .I3(s_axi_lite_awaddr[3]),
        .I4(s_axi_lite_awaddr[2]),
        .I5(s_axi_lite_awaddr[1]),
        .O(\GEN_SYNC_WRITE.axi2ip_wrce[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000400)) 
    \GEN_SYNC_WRITE.axi2ip_wrce[12]_i_1 
       (.I0(s_axi_lite_awaddr[1]),
        .I1(s_axi_lite_awaddr[3]),
        .I2(\GEN_SYNC_WRITE.axi2ip_wrce[22]_i_2_n_0 ),
        .I3(s_axi_lite_awaddr[2]),
        .I4(s_axi_lite_awaddr[0]),
        .I5(s_axi_lite_awaddr[4]),
        .O(\GEN_SYNC_WRITE.axi2ip_wrce[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000004000000)) 
    \GEN_SYNC_WRITE.axi2ip_wrce[13]_i_1 
       (.I0(s_axi_lite_awaddr[1]),
        .I1(s_axi_lite_awaddr[3]),
        .I2(\GEN_SYNC_WRITE.axi2ip_wrce[22]_i_2_n_0 ),
        .I3(s_axi_lite_awaddr[0]),
        .I4(s_axi_lite_awaddr[2]),
        .I5(s_axi_lite_awaddr[4]),
        .O(\GEN_SYNC_WRITE.axi2ip_wrce[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000001000)) 
    \GEN_SYNC_WRITE.axi2ip_wrce[18]_i_1 
       (.I0(s_axi_lite_awaddr[2]),
        .I1(s_axi_lite_awaddr[3]),
        .I2(s_axi_lite_awaddr[1]),
        .I3(s_axi_lite_awaddr[4]),
        .I4(\GEN_SYNC_WRITE.axi2ip_wrce[22]_i_2_n_0 ),
        .I5(s_axi_lite_awaddr[0]),
        .O(\GEN_SYNC_WRITE.axi2ip_wrce[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000100000000000)) 
    \GEN_SYNC_WRITE.axi2ip_wrce[19]_i_1 
       (.I0(s_axi_lite_awaddr[2]),
        .I1(s_axi_lite_awaddr[3]),
        .I2(s_axi_lite_awaddr[1]),
        .I3(s_axi_lite_awaddr[4]),
        .I4(\GEN_SYNC_WRITE.axi2ip_wrce[22]_i_2_n_0 ),
        .I5(s_axi_lite_awaddr[0]),
        .O(\GEN_SYNC_WRITE.axi2ip_wrce[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    \GEN_SYNC_WRITE.axi2ip_wrce[1]_i_1 
       (.I0(\GEN_SYNC_WRITE.axi2ip_wrce[22]_i_2_n_0 ),
        .I1(s_axi_lite_awaddr[0]),
        .I2(s_axi_lite_awaddr[1]),
        .I3(s_axi_lite_awaddr[4]),
        .I4(s_axi_lite_awaddr[2]),
        .I5(s_axi_lite_awaddr[3]),
        .O(\GEN_SYNC_WRITE.axi2ip_wrce[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000040000000000)) 
    \GEN_SYNC_WRITE.axi2ip_wrce[22]_i_1 
       (.I0(\GEN_SYNC_WRITE.axi2ip_wrce[22]_i_2_n_0 ),
        .I1(s_axi_lite_awaddr[1]),
        .I2(s_axi_lite_awaddr[3]),
        .I3(s_axi_lite_awaddr[2]),
        .I4(s_axi_lite_awaddr[0]),
        .I5(s_axi_lite_awaddr[4]),
        .O(\GEN_SYNC_WRITE.axi2ip_wrce[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \GEN_SYNC_WRITE.axi2ip_wrce[22]_i_2 
       (.I0(rdy),
        .I1(out),
        .O(\GEN_SYNC_WRITE.axi2ip_wrce[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000400)) 
    \GEN_SYNC_WRITE.axi2ip_wrce[6]_i_1 
       (.I0(\GEN_SYNC_WRITE.axi2ip_wrce[22]_i_2_n_0 ),
        .I1(s_axi_lite_awaddr[1]),
        .I2(s_axi_lite_awaddr[3]),
        .I3(s_axi_lite_awaddr[2]),
        .I4(s_axi_lite_awaddr[0]),
        .I5(s_axi_lite_awaddr[4]),
        .O(\GEN_SYNC_WRITE.axi2ip_wrce[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000004000000)) 
    \GEN_SYNC_WRITE.axi2ip_wrce[7]_i_1 
       (.I0(\GEN_SYNC_WRITE.axi2ip_wrce[22]_i_2_n_0 ),
        .I1(s_axi_lite_awaddr[1]),
        .I2(s_axi_lite_awaddr[3]),
        .I3(s_axi_lite_awaddr[0]),
        .I4(s_axi_lite_awaddr[2]),
        .I5(s_axi_lite_awaddr[4]),
        .O(\GEN_SYNC_WRITE.axi2ip_wrce[7]_i_1_n_0 ));
  FDRE \GEN_SYNC_WRITE.axi2ip_wrce_reg[0] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_SYNC_WRITE.axi2ip_wrce[0]_i_1_n_0 ),
        .Q(\GEN_SYNC_WRITE.axi2ip_wrce_reg[0]_0 ),
        .R(1'b0));
  FDRE \GEN_SYNC_WRITE.axi2ip_wrce_reg[10] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_SYNC_WRITE.axi2ip_wrce[10]_i_1_n_0 ),
        .Q(axi2ip_wrce[0]),
        .R(1'b0));
  FDRE \GEN_SYNC_WRITE.axi2ip_wrce_reg[12] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_SYNC_WRITE.axi2ip_wrce[12]_i_1_n_0 ),
        .Q(\GEN_SYNC_WRITE.axi2ip_wrce_reg[12]_0 ),
        .R(1'b0));
  FDRE \GEN_SYNC_WRITE.axi2ip_wrce_reg[13] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_SYNC_WRITE.axi2ip_wrce[13]_i_1_n_0 ),
        .Q(\GEN_SYNC_WRITE.axi2ip_wrce_reg[13]_0 ),
        .R(1'b0));
  FDRE \GEN_SYNC_WRITE.axi2ip_wrce_reg[18] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_SYNC_WRITE.axi2ip_wrce[18]_i_1_n_0 ),
        .Q(\GEN_SYNC_WRITE.axi2ip_wrce_reg[18]_0 ),
        .R(1'b0));
  FDRE \GEN_SYNC_WRITE.axi2ip_wrce_reg[19] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_SYNC_WRITE.axi2ip_wrce[19]_i_1_n_0 ),
        .Q(E),
        .R(1'b0));
  FDRE \GEN_SYNC_WRITE.axi2ip_wrce_reg[1] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_SYNC_WRITE.axi2ip_wrce[1]_i_1_n_0 ),
        .Q(p_0_in1_in),
        .R(1'b0));
  FDRE \GEN_SYNC_WRITE.axi2ip_wrce_reg[22] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_SYNC_WRITE.axi2ip_wrce[22]_i_1_n_0 ),
        .Q(axi2ip_wrce[1]),
        .R(1'b0));
  FDRE \GEN_SYNC_WRITE.axi2ip_wrce_reg[6] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_SYNC_WRITE.axi2ip_wrce[6]_i_1_n_0 ),
        .Q(\GEN_SYNC_WRITE.axi2ip_wrce_reg[6]_0 ),
        .R(1'b0));
  FDRE \GEN_SYNC_WRITE.axi2ip_wrce_reg[7] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_SYNC_WRITE.axi2ip_wrce[7]_i_1_n_0 ),
        .Q(\GEN_SYNC_WRITE.axi2ip_wrce_reg[7]_0 ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h44C0)) 
    \GEN_SYNC_WRITE.bvalid_i_i_1 
       (.I0(s_axi_lite_bready),
        .I1(out),
        .I2(s_axi_lite_wready),
        .I3(s_axi_lite_bvalid),
        .O(\GEN_SYNC_WRITE.bvalid_i_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_SYNC_WRITE.bvalid_i_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_SYNC_WRITE.bvalid_i_i_1_n_0 ),
        .Q(s_axi_lite_bvalid),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hB)) 
    \GEN_SYNC_WRITE.rdy_i_1 
       (.I0(rdy),
        .I1(out),
        .O(wr_data_cap0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \GEN_SYNC_WRITE.rdy_i_2 
       (.I0(wr_addr_cap),
        .I1(wr_data_cap),
        .O(\GEN_SYNC_WRITE.rdy_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_SYNC_WRITE.rdy_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_SYNC_WRITE.rdy_i_2_n_0 ),
        .Q(rdy),
        .R(wr_data_cap0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hFF10)) 
    \GEN_SYNC_WRITE.wr_addr_cap_i_1 
       (.I0(wr_in_progress),
        .I1(awvalid_d1),
        .I2(awvalid),
        .I3(wr_addr_cap),
        .O(\GEN_SYNC_WRITE.wr_addr_cap_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_SYNC_WRITE.wr_addr_cap_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_SYNC_WRITE.wr_addr_cap_i_1_n_0 ),
        .Q(wr_addr_cap),
        .R(wr_data_cap0));
  LUT3 #(
    .INIT(8'hF4)) 
    \GEN_SYNC_WRITE.wr_data_cap_i_1 
       (.I0(wvalid_d1),
        .I1(wvalid),
        .I2(wr_data_cap),
        .O(\GEN_SYNC_WRITE.wr_data_cap_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_SYNC_WRITE.wr_data_cap_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_SYNC_WRITE.wr_data_cap_i_1_n_0 ),
        .Q(wr_data_cap),
        .R(wr_data_cap0));
  LUT3 #(
    .INIT(8'hF4)) 
    \GEN_SYNC_WRITE.wr_in_progress_i_1 
       (.I0(awvalid_d1),
        .I1(awvalid),
        .I2(wr_in_progress),
        .O(\GEN_SYNC_WRITE.wr_in_progress_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_SYNC_WRITE.wr_in_progress_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_SYNC_WRITE.wr_in_progress_i_1_n_0 ),
        .Q(wr_in_progress),
        .R(awvalid_d10));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_SYNC_WRITE.wready_i_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(rdy),
        .Q(s_axi_lite_wready),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_SYNC_WRITE.wvalid_d1_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(wvalid),
        .Q(wvalid_d1),
        .R(awvalid_d10));
  FDRE #(
    .INIT(1'b0)) 
    \araddr_reg[0] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s_axi_lite_araddr[0]),
        .Q(araddr[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \araddr_reg[1] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s_axi_lite_araddr[1]),
        .Q(araddr[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \araddr_reg[2] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s_axi_lite_araddr[2]),
        .Q(araddr[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \araddr_reg[3] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s_axi_lite_araddr[3]),
        .Q(araddr[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \araddr_reg[4] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s_axi_lite_araddr[4]),
        .Q(araddr[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \araddr_reg[5] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s_axi_lite_araddr[5]),
        .Q(araddr[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \araddr_reg[6] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s_axi_lite_araddr[6]),
        .Q(araddr[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \araddr_reg[7] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s_axi_lite_araddr[7]),
        .Q(araddr[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \araddr_reg[8] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s_axi_lite_araddr[8]),
        .Q(araddr[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \araddr_reg[9] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s_axi_lite_araddr[9]),
        .Q(araddr[9]),
        .R(SR));
  LUT3 #(
    .INIT(8'h04)) 
    arready_i_i_2
       (.I0(arvalid_d1),
        .I1(arvalid),
        .I2(\GEN_SYNC_READ.s_axi_lite_rvalid_i_reg_0 ),
        .O(arvalid_re));
  FDRE #(
    .INIT(1'b0)) 
    arready_i_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(arvalid_re),
        .Q(s_axi_lite_arready),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h08)) 
    arvalid_d1_i_1
       (.I0(out),
        .I1(arvalid),
        .I2(\GEN_SYNC_READ.s_axi_lite_rvalid_i_reg_0 ),
        .O(arvalid_d1_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    arvalid_d1_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(arvalid_d1_i_1_n_0),
        .Q(arvalid_d1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    arvalid_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s_axi_lite_arvalid),
        .Q(arvalid),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    awvalid_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s_axi_lite_awvalid),
        .Q(awvalid),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    wvalid_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s_axi_lite_wvalid),
        .Q(wvalid),
        .R(SR));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_mm2s_cmdsts_if
   (\GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_reg_0 ,
    sts_received_i_reg_0,
    m_axis_mm2s_sts_tready,
    D,
    E,
    mm2s_interr_i_reg_0,
    mm2s_slverr_i_reg_0,
    mm2s_decerr_i_reg_0,
    dma_mm2s_error,
    mm2s_error_reg_0,
    mm2s_decerr_i,
    s_axi_lite_aclk,
    mm2s_interr_i,
    mm2s_slverr_i,
    \GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_reg_1 ,
    sts_received_i_reg_1,
    mm2s_stop_i,
    Q,
    out,
    m_axis_mm2s_sts_tvalid_int,
    s_axis_mm2s_cmd_tready,
    dma_interr_reg,
    dma_slverr_reg,
    dma_decerr_reg);
  output \GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_reg_0 ;
  output sts_received_i_reg_0;
  output m_axis_mm2s_sts_tready;
  output [0:0]D;
  output [0:0]E;
  output mm2s_interr_i_reg_0;
  output mm2s_slverr_i_reg_0;
  output mm2s_decerr_i_reg_0;
  output dma_mm2s_error;
  input mm2s_error_reg_0;
  input mm2s_decerr_i;
  input s_axi_lite_aclk;
  input mm2s_interr_i;
  input mm2s_slverr_i;
  input \GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_reg_1 ;
  input sts_received_i_reg_1;
  input mm2s_stop_i;
  input [1:0]Q;
  input out;
  input m_axis_mm2s_sts_tvalid_int;
  input s_axis_mm2s_cmd_tready;
  input dma_interr_reg;
  input dma_slverr_reg;
  input dma_decerr_reg;

  wire [0:0]D;
  wire [0:0]E;
  wire \GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_reg_0 ;
  wire \GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_reg_1 ;
  wire [1:0]Q;
  wire dma_decerr_reg;
  wire dma_interr_reg;
  wire dma_mm2s_error;
  wire dma_slverr_reg;
  wire m_axis_mm2s_sts_tready;
  wire m_axis_mm2s_sts_tvalid_int;
  wire mm2s_decerr_i;
  wire mm2s_decerr_i_reg_0;
  wire mm2s_error_i_1_n_0;
  wire mm2s_error_reg_0;
  wire mm2s_interr_i;
  wire mm2s_interr_i_reg_0;
  wire mm2s_slverr_i;
  wire mm2s_slverr_i_reg_0;
  wire mm2s_smpl_decerr_set;
  wire mm2s_smpl_interr_set;
  wire mm2s_smpl_slverr_set;
  wire mm2s_stop_i;
  wire out;
  wire s_axi_lite_aclk;
  wire s_axis_mm2s_cmd_tready;
  wire sts_received_i_reg_0;
  wire sts_received_i_reg_1;
  wire sts_tready_i_1_n_0;

  LUT5 #(
    .INIT(32'h00100310)) 
    \FSM_sequential_smpl_cs[1]_i_3 
       (.I0(sts_received_i_reg_0),
        .I1(mm2s_stop_i),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_reg_0 ),
        .O(D));
  LUT2 #(
    .INIT(4'hE)) 
    \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER/dma_decerr_i_1 
       (.I0(mm2s_smpl_decerr_set),
        .I1(dma_decerr_reg),
        .O(mm2s_decerr_i_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER/dma_interr_i_1 
       (.I0(mm2s_smpl_interr_set),
        .I1(dma_interr_reg),
        .O(mm2s_interr_i_reg_0));
  LUT2 #(
    .INIT(4'hE)) 
    \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER/dma_slverr_i_1 
       (.I0(mm2s_smpl_slverr_set),
        .I1(dma_slverr_reg),
        .O(mm2s_slverr_i_reg_0));
  FDRE \GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_reg_1 ),
        .Q(\GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_reg_0 ),
        .R(mm2s_error_reg_0));
  LUT2 #(
    .INIT(4'h8)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg[95]_i_1 
       (.I0(\GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_reg_0 ),
        .I1(s_axis_mm2s_cmd_tready),
        .O(E));
  FDRE #(
    .INIT(1'b0)) 
    mm2s_decerr_i_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(mm2s_decerr_i),
        .Q(mm2s_smpl_decerr_set),
        .R(mm2s_error_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    mm2s_error_i_1
       (.I0(mm2s_smpl_interr_set),
        .I1(mm2s_smpl_decerr_set),
        .I2(mm2s_smpl_slverr_set),
        .I3(dma_mm2s_error),
        .O(mm2s_error_i_1_n_0));
  FDRE mm2s_error_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(mm2s_error_i_1_n_0),
        .Q(dma_mm2s_error),
        .R(mm2s_error_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    mm2s_interr_i_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(mm2s_interr_i),
        .Q(mm2s_smpl_interr_set),
        .R(mm2s_error_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    mm2s_slverr_i_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(mm2s_slverr_i),
        .Q(mm2s_smpl_slverr_set),
        .R(mm2s_error_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    sts_received_i_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(sts_received_i_reg_1),
        .Q(sts_received_i_reg_0),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h04C4)) 
    sts_tready_i_1
       (.I0(sts_received_i_reg_0),
        .I1(out),
        .I2(m_axis_mm2s_sts_tready),
        .I3(m_axis_mm2s_sts_tvalid_int),
        .O(sts_tready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sts_tready_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(sts_tready_i_1_n_0),
        .Q(m_axis_mm2s_sts_tready),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_mm2s_mngr
   (mm2s_halted_clr,
    mm2s_halted_set,
    mm2s_all_idle,
    mm2s_stop,
    s_axis_mm2s_cmd_tvalid_split,
    mm2s_sts_received,
    m_axis_mm2s_sts_tready,
    idle_reg,
    axi_dma_tstvec,
    E,
    D,
    mm2s_interr_i_reg,
    mm2s_slverr_i_reg,
    mm2s_decerr_i_reg,
    dma_mm2s_error,
    mm2s_halted_set_reg,
    s_axi_lite_aclk,
    mm2s_decerr_i,
    mm2s_interr_i,
    mm2s_slverr_i,
    mm2s_dmacr,
    mm2s_halted_set0,
    mm2s_stop_i,
    out,
    mm2s_length_wren,
    idle_reg_0,
    m_axi_sg_aresetn,
    mm2s_dmasr,
    m_axis_mm2s_sts_tvalid_int,
    s_axis_mm2s_cmd_tready,
    dma_interr_reg,
    dma_slverr_reg,
    dma_decerr_reg,
    mm2s_sa,
    \GEN_CMD_BTT_EQL_23.cmnd_data_reg[23] ,
    Q);
  output mm2s_halted_clr;
  output mm2s_halted_set;
  output mm2s_all_idle;
  output mm2s_stop;
  output s_axis_mm2s_cmd_tvalid_split;
  output mm2s_sts_received;
  output m_axis_mm2s_sts_tready;
  output idle_reg;
  output [0:0]axi_dma_tstvec;
  output [0:0]E;
  output [72:0]D;
  output mm2s_interr_i_reg;
  output mm2s_slverr_i_reg;
  output mm2s_decerr_i_reg;
  output dma_mm2s_error;
  input mm2s_halted_set_reg;
  input s_axi_lite_aclk;
  input mm2s_decerr_i;
  input mm2s_interr_i;
  input mm2s_slverr_i;
  input [0:0]mm2s_dmacr;
  input mm2s_halted_set0;
  input mm2s_stop_i;
  input out;
  input mm2s_length_wren;
  input idle_reg_0;
  input m_axi_sg_aresetn;
  input [0:0]mm2s_dmasr;
  input m_axis_mm2s_sts_tvalid_int;
  input s_axis_mm2s_cmd_tready;
  input dma_interr_reg;
  input dma_slverr_reg;
  input dma_decerr_reg;
  input [63:0]mm2s_sa;
  input \GEN_CMD_BTT_EQL_23.cmnd_data_reg[23] ;
  input [6:0]Q;

  wire [72:0]D;
  wire [0:0]E;
  wire \GEN_CMD_BTT_EQL_23.cmnd_data_reg[23] ;
  wire \GEN_MM2S_DMA_CONTROL.GEN_SIMPLE_DMA_MODE.I_MM2S_SMPL_SM_n_4 ;
  wire \GEN_MM2S_DMA_CONTROL.GEN_SIMPLE_DMA_MODE.I_MM2S_SMPL_SM_n_5 ;
  wire [6:0]Q;
  wire [0:0]axi_dma_tstvec;
  wire dma_decerr_reg;
  wire dma_interr_reg;
  wire dma_mm2s_error;
  wire dma_slverr_reg;
  wire idle_reg;
  wire idle_reg_0;
  wire m_axi_sg_aresetn;
  wire m_axis_mm2s_sts_tready;
  wire m_axis_mm2s_sts_tvalid_int;
  wire mm2s_all_idle;
  wire mm2s_decerr_i;
  wire mm2s_decerr_i_reg;
  wire [0:0]mm2s_dmacr;
  wire [0:0]mm2s_dmasr;
  wire mm2s_halted_clr;
  wire mm2s_halted_set;
  wire mm2s_halted_set0;
  wire mm2s_halted_set_reg;
  wire mm2s_interr_i;
  wire mm2s_interr_i_reg;
  wire mm2s_length_wren;
  wire [63:0]mm2s_sa;
  wire mm2s_slverr_i;
  wire mm2s_slverr_i_reg;
  wire mm2s_stop;
  wire mm2s_stop_i;
  wire mm2s_sts_received;
  wire mm2s_sts_received_clr;
  wire out;
  wire s_axi_lite_aclk;
  wire s_axis_mm2s_cmd_tready;
  wire s_axis_mm2s_cmd_tvalid_split;
  wire [1:0]smpl_cs;
  wire [1:1]smpl_ns;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_smple_sm_10 \GEN_MM2S_DMA_CONTROL.GEN_SIMPLE_DMA_MODE.I_MM2S_SMPL_SM 
       (.D(smpl_ns),
        .\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 (mm2s_halted_set_reg),
        .\GEN_CMD_BTT_EQL_23.cmnd_data_reg[23]_0 (\GEN_CMD_BTT_EQL_23.cmnd_data_reg[23] ),
        .\GEN_CMD_BTT_EQL_23.cmnd_data_reg[30]_0 (s_axis_mm2s_cmd_tvalid_split),
        .\GEN_CMD_BTT_EQL_23.cmnd_data_reg[6]_0 (Q),
        .\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 (D),
        .\GEN_CMD_BTT_EQL_23.cmnd_wr_i_reg_0 (\GEN_MM2S_DMA_CONTROL.GEN_SIMPLE_DMA_MODE.I_MM2S_SMPL_SM_n_5 ),
        .Q(smpl_cs),
        .m_axis_mm2s_sts_tvalid_int(m_axis_mm2s_sts_tvalid_int),
        .mm2s_all_idle(mm2s_all_idle),
        .mm2s_dmacr(mm2s_dmacr),
        .mm2s_length_wren(mm2s_length_wren),
        .mm2s_sa(mm2s_sa),
        .mm2s_stop_i(mm2s_stop_i),
        .mm2s_sts_received_clr(mm2s_sts_received_clr),
        .out(out),
        .s_axi_lite_aclk(s_axi_lite_aclk),
        .s_axis_mm2s_cmd_tready(s_axis_mm2s_cmd_tready),
        .sts_received_clr_reg_0(\GEN_MM2S_DMA_CONTROL.GEN_SIMPLE_DMA_MODE.I_MM2S_SMPL_SM_n_4 ),
        .sts_received_i_reg(mm2s_sts_received));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_mm2s_cmdsts_if \GEN_MM2S_DMA_CONTROL.I_MM2S_CMDSTS 
       (.D(smpl_ns),
        .E(E),
        .\GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_reg_0 (s_axis_mm2s_cmd_tvalid_split),
        .\GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_reg_1 (\GEN_MM2S_DMA_CONTROL.GEN_SIMPLE_DMA_MODE.I_MM2S_SMPL_SM_n_5 ),
        .Q(smpl_cs),
        .dma_decerr_reg(dma_decerr_reg),
        .dma_interr_reg(dma_interr_reg),
        .dma_mm2s_error(dma_mm2s_error),
        .dma_slverr_reg(dma_slverr_reg),
        .m_axis_mm2s_sts_tready(m_axis_mm2s_sts_tready),
        .m_axis_mm2s_sts_tvalid_int(m_axis_mm2s_sts_tvalid_int),
        .mm2s_decerr_i(mm2s_decerr_i),
        .mm2s_decerr_i_reg_0(mm2s_decerr_i_reg),
        .mm2s_error_reg_0(mm2s_halted_set_reg),
        .mm2s_interr_i(mm2s_interr_i),
        .mm2s_interr_i_reg_0(mm2s_interr_i_reg),
        .mm2s_slverr_i(mm2s_slverr_i),
        .mm2s_slverr_i_reg_0(mm2s_slverr_i_reg),
        .mm2s_stop_i(mm2s_stop_i),
        .out(out),
        .s_axi_lite_aclk(s_axi_lite_aclk),
        .s_axis_mm2s_cmd_tready(s_axis_mm2s_cmd_tready),
        .sts_received_i_reg_0(mm2s_sts_received),
        .sts_received_i_reg_1(\GEN_MM2S_DMA_CONTROL.GEN_SIMPLE_DMA_MODE.I_MM2S_SMPL_SM_n_4 ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_mm2s_sts_mngr \GEN_MM2S_DMA_CONTROL.I_MM2S_STS_MNGR 
       (.axi_dma_tstvec(axi_dma_tstvec),
        .idle_reg(idle_reg),
        .idle_reg_0(idle_reg_0),
        .m_axi_sg_aresetn(m_axi_sg_aresetn),
        .mm2s_all_idle(mm2s_all_idle),
        .mm2s_dmacr(mm2s_dmacr),
        .mm2s_dmasr(mm2s_dmasr),
        .mm2s_halted_clr(mm2s_halted_clr),
        .mm2s_halted_set(mm2s_halted_set),
        .mm2s_halted_set0(mm2s_halted_set0),
        .mm2s_halted_set_reg_0(mm2s_halted_set_reg),
        .mm2s_stop_i(mm2s_stop_i),
        .mm2s_sts_received_clr(mm2s_sts_received_clr),
        .s_axi_lite_aclk(s_axi_lite_aclk));
  FDRE \GEN_MM2S_DMA_CONTROL.mm2s_stop_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(mm2s_stop_i),
        .Q(mm2s_stop),
        .R(mm2s_halted_set_reg));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_mm2s_sts_mngr
   (mm2s_halted_clr,
    mm2s_halted_set,
    idle_reg,
    axi_dma_tstvec,
    mm2s_halted_set_reg_0,
    mm2s_dmacr,
    s_axi_lite_aclk,
    mm2s_halted_set0,
    mm2s_all_idle,
    idle_reg_0,
    m_axi_sg_aresetn,
    mm2s_dmasr,
    mm2s_stop_i,
    mm2s_sts_received_clr);
  output mm2s_halted_clr;
  output mm2s_halted_set;
  output idle_reg;
  output [0:0]axi_dma_tstvec;
  input mm2s_halted_set_reg_0;
  input [0:0]mm2s_dmacr;
  input s_axi_lite_aclk;
  input mm2s_halted_set0;
  input mm2s_all_idle;
  input idle_reg_0;
  input m_axi_sg_aresetn;
  input [0:0]mm2s_dmasr;
  input mm2s_stop_i;
  input mm2s_sts_received_clr;

  wire all_is_idle_d1;
  wire [0:0]axi_dma_tstvec;
  wire idle_reg;
  wire idle_reg_0;
  wire m_axi_sg_aresetn;
  wire mm2s_all_idle;
  wire [0:0]mm2s_dmacr;
  wire [0:0]mm2s_dmasr;
  wire mm2s_halted_clr;
  wire mm2s_halted_set;
  wire mm2s_halted_set0;
  wire mm2s_halted_set_reg_0;
  wire mm2s_stop_i;
  wire mm2s_sts_received_clr;
  wire s_axi_lite_aclk;

  FDRE #(
    .INIT(1'b0)) 
    all_is_idle_d1_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(mm2s_all_idle),
        .Q(all_is_idle_d1),
        .R(mm2s_halted_set_reg_0));
  LUT4 #(
    .INIT(16'h2F20)) 
    \axi_dma_tstvec[4]_INST_0 
       (.I0(mm2s_halted_set),
        .I1(mm2s_dmasr),
        .I2(mm2s_stop_i),
        .I3(mm2s_sts_received_clr),
        .O(axi_dma_tstvec));
  LUT6 #(
    .INIT(64'h0000AE0A00000000)) 
    idle_i_1
       (.I0(idle_reg_0),
        .I1(mm2s_dmacr),
        .I2(all_is_idle_d1),
        .I3(mm2s_all_idle),
        .I4(mm2s_halted_set),
        .I5(m_axi_sg_aresetn),
        .O(idle_reg));
  FDRE mm2s_halted_clr_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(mm2s_dmacr),
        .Q(mm2s_halted_clr),
        .R(mm2s_halted_set_reg_0));
  FDRE mm2s_halted_set_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(mm2s_halted_set0),
        .Q(mm2s_halted_set),
        .R(mm2s_halted_set_reg_0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_reg_module
   (s_axi_lite_wready,
    s_axi_lite_arready,
    dma_interr_reg,
    dma_slverr_reg,
    dma_decerr_reg,
    dma_interr_reg_0,
    dma_slverr_reg_0,
    dma_decerr_reg_0,
    mm2s_length_wren,
    s2mm_length_wren,
    s_axi_lite_bvalid,
    \GEN_SYNC_READ.s_axi_lite_rvalid_i_reg ,
    \GEN_SYNC_WRITE.axi2ip_wrce_reg[12] ,
    \dmacr_i_reg[0] ,
    mm2s_dmasr,
    idle_reg,
    \dmacr_i_reg[0]_0 ,
    s2mm_dmasr,
    idle_reg_0,
    mm2s_introut,
    s2mm_introut,
    soft_reset_re0,
    mm2s_halted_set0,
    mm2s_stop_i,
    s2mm_halted_set0,
    s2mm_stop_i,
    soft_reset,
    threshold_is_zero,
    Q,
    mm2s_sa,
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[6] ,
    s2mm_da,
    \dmacr_i_reg[3] ,
    \dmacr_i_reg[3]_0 ,
    s_axi_lite_rdata,
    s_axi_lite_aclk,
    SR,
    s_axi_lite_awvalid,
    s_axi_lite_wvalid,
    s_axi_lite_arvalid,
    \dmacr_i_reg[4] ,
    dma_interr_reg_1,
    dma_slverr_reg_1,
    dma_decerr_reg_1,
    dma_interr_reg_2,
    dma_slverr_reg_2,
    dma_decerr_reg_2,
    halted_reg,
    idle_reg_1,
    halted_reg_0,
    idle_reg_2,
    m_axi_sg_aresetn,
    s_axi_lite_wdata,
    mm2s_stop,
    s2mm_stop,
    soft_reset_d1,
    mm2s_halt_cmplt,
    mm2s_all_idle,
    dma_s2mm_error,
    dma_mm2s_error,
    s2mm_halt_cmplt,
    s2mm_all_idle,
    out,
    s_axi_lite_bready,
    s_axi_lite_rready,
    s_axi_lite_awaddr,
    s_axi_lite_araddr,
    soft_reset_clr,
    SS,
    axi_dma_tstvec,
    \dmacr_i_reg[23] );
  output s_axi_lite_wready;
  output s_axi_lite_arready;
  output dma_interr_reg;
  output dma_slverr_reg;
  output dma_decerr_reg;
  output dma_interr_reg_0;
  output dma_slverr_reg_0;
  output dma_decerr_reg_0;
  output mm2s_length_wren;
  output s2mm_length_wren;
  output s_axi_lite_bvalid;
  output \GEN_SYNC_READ.s_axi_lite_rvalid_i_reg ;
  output [1:0]\GEN_SYNC_WRITE.axi2ip_wrce_reg[12] ;
  output [0:0]\dmacr_i_reg[0] ;
  output [0:0]mm2s_dmasr;
  output idle_reg;
  output [0:0]\dmacr_i_reg[0]_0 ;
  output [0:0]s2mm_dmasr;
  output idle_reg_0;
  output mm2s_introut;
  output s2mm_introut;
  output soft_reset_re0;
  output mm2s_halted_set0;
  output mm2s_stop_i;
  output s2mm_halted_set0;
  output s2mm_stop_i;
  output soft_reset;
  output threshold_is_zero;
  output [6:0]Q;
  output [63:0]mm2s_sa;
  output [6:0]\GEN_REG_FOR_SMPL.buffer_length_i_reg[6] ;
  output [63:0]s2mm_da;
  output \dmacr_i_reg[3] ;
  output \dmacr_i_reg[3]_0 ;
  output [31:0]s_axi_lite_rdata;
  input s_axi_lite_aclk;
  input [0:0]SR;
  input s_axi_lite_awvalid;
  input s_axi_lite_wvalid;
  input s_axi_lite_arvalid;
  input [0:0]\dmacr_i_reg[4] ;
  input dma_interr_reg_1;
  input dma_slverr_reg_1;
  input dma_decerr_reg_1;
  input dma_interr_reg_2;
  input dma_slverr_reg_2;
  input dma_decerr_reg_2;
  input halted_reg;
  input idle_reg_1;
  input halted_reg_0;
  input idle_reg_2;
  input m_axi_sg_aresetn;
  input [31:0]s_axi_lite_wdata;
  input mm2s_stop;
  input s2mm_stop;
  input soft_reset_d1;
  input mm2s_halt_cmplt;
  input mm2s_all_idle;
  input dma_s2mm_error;
  input dma_mm2s_error;
  input s2mm_halt_cmplt;
  input s2mm_all_idle;
  input out;
  input s_axi_lite_bready;
  input s_axi_lite_rready;
  input [4:0]s_axi_lite_awaddr;
  input [9:0]s_axi_lite_araddr;
  input soft_reset_clr;
  input [0:0]SS;
  input [1:0]axi_dma_tstvec;
  input [0:0]\dmacr_i_reg[23] ;

  wire \GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_10 ;
  wire \GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_6 ;
  wire \GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_7 ;
  wire \GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_8 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_100 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_101 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_102 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_103 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_104 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_106 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_12 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_13 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_14 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_15 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_16 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_19 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_84 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_85 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_86 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_87 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_88 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_89 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_9 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_90 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_91 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_92 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_93 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_94 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_95 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_96 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_97 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_98 ;
  wire \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_99 ;
  wire [6:0]\GEN_REG_FOR_SMPL.buffer_length_i_reg[6] ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_100 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_101 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_102 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_103 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_104 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_105 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_106 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_107 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_109 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_111 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_112 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_113 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_114 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_115 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_116 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_117 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_118 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_119 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_120 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_121 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_122 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_123 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_124 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_125 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_126 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_14 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_15 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_16 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_17 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_18 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_19 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_8 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_9 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_93 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_94 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_95 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_96 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_97 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_98 ;
  wire \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_99 ;
  wire \GEN_SYNC_READ.s_axi_lite_rvalid_i_reg ;
  wire [1:0]\GEN_SYNC_WRITE.axi2ip_wrce_reg[12] ;
  wire [6:0]Q;
  wire [0:0]SR;
  wire [0:0]SS;
  wire [4:2]axi2ip_rdaddr;
  wire [22:10]axi2ip_wrce;
  wire [1:0]axi_dma_tstvec;
  wire buffer_length_wren0;
  wire buffer_length_wren0_0;
  wire buffer_length_wren1;
  wire dma_decerr_reg;
  wire dma_decerr_reg_0;
  wire dma_decerr_reg_1;
  wire dma_decerr_reg_2;
  wire dma_interr_reg;
  wire dma_interr_reg_0;
  wire dma_interr_reg_1;
  wire dma_interr_reg_2;
  wire dma_mm2s_error;
  wire dma_s2mm_error;
  wire dma_slverr_reg;
  wire dma_slverr_reg_0;
  wire dma_slverr_reg_1;
  wire dma_slverr_reg_2;
  wire [0:0]\dmacr_i_reg[0] ;
  wire [0:0]\dmacr_i_reg[0]_0 ;
  wire [0:0]\dmacr_i_reg[23] ;
  wire \dmacr_i_reg[3] ;
  wire \dmacr_i_reg[3]_0 ;
  wire [0:0]\dmacr_i_reg[4] ;
  wire halted_reg;
  wire halted_reg_0;
  wire idle_reg;
  wire idle_reg_0;
  wire idle_reg_1;
  wire idle_reg_2;
  wire m_axi_sg_aresetn;
  wire mm2s_all_idle;
  wire [0:0]mm2s_dmasr;
  wire mm2s_error_out;
  wire mm2s_halt_cmplt;
  wire mm2s_halted_set0;
  wire mm2s_introut;
  wire [22:7]mm2s_length;
  wire mm2s_length_wren;
  wire [63:0]mm2s_sa;
  wire mm2s_stop;
  wire mm2s_stop_i;
  wire out;
  wire p_0_in1_in;
  wire p_1_in;
  wire s2mm_all_idle;
  wire [63:0]s2mm_da;
  wire [3:3]s2mm_dmacr;
  wire [0:0]s2mm_dmasr;
  wire s2mm_halt_cmplt;
  wire s2mm_halted_set0;
  wire s2mm_introut;
  wire [14:12]s2mm_length;
  wire s2mm_length_wren;
  wire s2mm_stop;
  wire s2mm_stop_i;
  wire s_axi_lite_aclk;
  wire [9:0]s_axi_lite_araddr;
  wire s_axi_lite_arready;
  wire s_axi_lite_arvalid;
  wire [4:0]s_axi_lite_awaddr;
  wire s_axi_lite_awvalid;
  wire s_axi_lite_bready;
  wire s_axi_lite_bvalid;
  wire [31:0]s_axi_lite_rdata;
  wire s_axi_lite_rready;
  wire [31:0]s_axi_lite_wdata;
  wire s_axi_lite_wready;
  wire s_axi_lite_wvalid;
  wire soft_reset;
  wire soft_reset_clr;
  wire soft_reset_d1;
  wire soft_reset_re0;
  (* async_reg = "true" *) wire strm_valid_int2;
  (* async_reg = "true" *) wire strm_valid_int_cdc_to;
  wire threshold_is_zero;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_lite_if \GEN_AXI_LITE_IF.AXI_LITE_IF_I 
       (.E(\GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_6 ),
        .\GEN_SYNC_READ.axi2ip_rdaddr_reg[4]_0 (axi2ip_rdaddr),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[0]_0 (\dmacr_i_reg[0] ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[0]_1 (\dmacr_i_reg[0]_0 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[10]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_97 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[11]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_98 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_16 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[12]_1 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_14 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[13]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_99 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[13]_1 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_88 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_0 ({s2mm_length[14],s2mm_length[12],\GEN_REG_FOR_SMPL.buffer_length_i_reg[6] [6:4],\GEN_REG_FOR_SMPL.buffer_length_i_reg[6] [1:0]}),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_1 ({\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_15 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_16 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_17 }),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_2 ({\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_14 ,\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_15 }),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_3 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_13 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[14]_4 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_18 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[15]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_100 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[16]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_101 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[16]_1 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_89 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[17]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_102 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[17]_1 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_90 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[18]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_103 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[18]_1 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_91 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[19]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_104 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[19]_1 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_92 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[1]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_85 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[1]_1 (idle_reg_0),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[20]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_105 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[20]_1 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_93 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[21]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_106 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[21]_1 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_94 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[22]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_107 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[22]_1 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_95 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[23]_0 ({\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_111 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_112 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_113 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_114 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_115 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_116 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_117 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_118 }),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[23]_1 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_96 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[24]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_97 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[25]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_98 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[26]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_99 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[27]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_100 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[28]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_101 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[29]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_102 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_9 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_1 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_19 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[2]_2 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_86 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[30]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_103 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[31]_0 ({\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_119 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_120 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_121 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_122 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_123 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_124 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_125 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_126 }),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[31]_1 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_104 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[3]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_93 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[3]_1 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_87 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_0 ({\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_109 ,s2mm_dmacr}),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_1 (dma_interr_reg),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_2 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_106 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[4]_3 (dma_interr_reg_0),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[5]_0 (dma_slverr_reg_0),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[5]_1 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_19 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[6]_0 (dma_decerr_reg_0),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[6]_1 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_84 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[7]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_94 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[8]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_95 ),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[9]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_96 ),
        .\GEN_SYNC_READ.s_axi_lite_rvalid_i_reg_0 (\GEN_SYNC_READ.s_axi_lite_rvalid_i_reg ),
        .\GEN_SYNC_WRITE.axi2ip_wrce_reg[0]_0 (\GEN_SYNC_WRITE.axi2ip_wrce_reg[12] [0]),
        .\GEN_SYNC_WRITE.axi2ip_wrce_reg[12]_0 (\GEN_SYNC_WRITE.axi2ip_wrce_reg[12] [1]),
        .\GEN_SYNC_WRITE.axi2ip_wrce_reg[13]_0 (\GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_8 ),
        .\GEN_SYNC_WRITE.axi2ip_wrce_reg[18]_0 (\GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_7 ),
        .\GEN_SYNC_WRITE.axi2ip_wrce_reg[6]_0 (p_1_in),
        .\GEN_SYNC_WRITE.axi2ip_wrce_reg[7]_0 (\GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_10 ),
        .Q({mm2s_length,Q}),
        .SR(SR),
        .axi2ip_wrce({axi2ip_wrce[22],axi2ip_wrce[10]}),
        .buffer_length_wren0(buffer_length_wren0_0),
        .buffer_length_wren0_0(buffer_length_wren0),
        .buffer_length_wren1(buffer_length_wren1),
        .mm2s_dmasr(mm2s_dmasr),
        .mm2s_sa({mm2s_sa[47:46],mm2s_sa[44:39],mm2s_sa[36],mm2s_sa[32],mm2s_sa[15:14],mm2s_sa[12:7],mm2s_sa[4],mm2s_sa[0]}),
        .out(out),
        .p_0_in1_in(p_0_in1_in),
        .s2mm_da({s2mm_da[63:55],s2mm_da[46],s2mm_da[44],s2mm_da[38:36],s2mm_da[33:23],s2mm_da[14],s2mm_da[12],s2mm_da[6:4],s2mm_da[1:0]}),
        .s2mm_dmasr(s2mm_dmasr),
        .s_axi_lite_aclk(s_axi_lite_aclk),
        .s_axi_lite_araddr(s_axi_lite_araddr),
        .s_axi_lite_arready(s_axi_lite_arready),
        .s_axi_lite_arvalid(s_axi_lite_arvalid),
        .s_axi_lite_awaddr(s_axi_lite_awaddr),
        .s_axi_lite_awvalid(s_axi_lite_awvalid),
        .s_axi_lite_bready(s_axi_lite_bready),
        .s_axi_lite_bvalid(s_axi_lite_bvalid),
        .s_axi_lite_rdata(s_axi_lite_rdata),
        .s_axi_lite_rready(s_axi_lite_rready),
        .s_axi_lite_wready(s_axi_lite_wready),
        .s_axi_lite_wvalid(s_axi_lite_wvalid));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_register \GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER 
       (.E(\GEN_SYNC_WRITE.axi2ip_wrce_reg[12] [0]),
        .\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 (\GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_10 ),
        .\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[1]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_85 ),
        .\GEN_REG_FOR_SMPL.buffer_address_i_reg[13]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_88 ),
        .\GEN_REG_FOR_SMPL.buffer_address_i_reg[16]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_89 ),
        .\GEN_REG_FOR_SMPL.buffer_address_i_reg[17]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_90 ),
        .\GEN_REG_FOR_SMPL.buffer_address_i_reg[18]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_91 ),
        .\GEN_REG_FOR_SMPL.buffer_address_i_reg[19]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_92 ),
        .\GEN_REG_FOR_SMPL.buffer_address_i_reg[20]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_93 ),
        .\GEN_REG_FOR_SMPL.buffer_address_i_reg[21]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_94 ),
        .\GEN_REG_FOR_SMPL.buffer_address_i_reg[22]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_95 ),
        .\GEN_REG_FOR_SMPL.buffer_address_i_reg[23]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_96 ),
        .\GEN_REG_FOR_SMPL.buffer_address_i_reg[24]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_97 ),
        .\GEN_REG_FOR_SMPL.buffer_address_i_reg[25]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_98 ),
        .\GEN_REG_FOR_SMPL.buffer_address_i_reg[26]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_99 ),
        .\GEN_REG_FOR_SMPL.buffer_address_i_reg[27]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_100 ),
        .\GEN_REG_FOR_SMPL.buffer_address_i_reg[28]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_101 ),
        .\GEN_REG_FOR_SMPL.buffer_address_i_reg[29]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_102 ),
        .\GEN_REG_FOR_SMPL.buffer_address_i_reg[2]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_86 ),
        .\GEN_REG_FOR_SMPL.buffer_address_i_reg[30]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_103 ),
        .\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_104 ),
        .\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 (p_1_in),
        .\GEN_REG_FOR_SMPL.buffer_address_i_reg[3]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_87 ),
        .\GEN_REG_FOR_SMPL.buffer_address_i_reg[5]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_19 ),
        .\GEN_REG_FOR_SMPL.buffer_address_i_reg[6]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_84 ),
        .\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ({mm2s_length,Q}),
        .\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 (axi2ip_wrce[10]),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] (axi2ip_rdaddr),
        .Q({\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_14 ,\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_15 }),
        .SS(SS),
        .axi_dma_tstvec(axi_dma_tstvec[0]),
        .buffer_length_wren0(buffer_length_wren0),
        .buffer_length_wren1(buffer_length_wren1),
        .dma_decerr_reg_0(dma_decerr_reg),
        .dma_decerr_reg_1(dma_decerr_reg_1),
        .dma_interr_reg_0(dma_interr_reg),
        .dma_interr_reg_1(dma_interr_reg_1),
        .dma_slverr_reg_0(dma_slverr_reg),
        .dma_slverr_reg_1(dma_slverr_reg_1),
        .\dmacr_i_reg[0]_0 (\dmacr_i_reg[0] ),
        .\dmacr_i_reg[0]_1 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_8 ),
        .\dmacr_i_reg[2]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_12 ),
        .\dmacr_i_reg[2]_1 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_9 ),
        .\dmacr_i_reg[3]_0 (\dmacr_i_reg[3] ),
        .\dmacr_i_reg[4]_0 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_106 ),
        .\dmacr_i_reg[4]_1 (\dmacr_i_reg[4] ),
        .err_irq_reg_0(\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_13 ),
        .halted_reg_0(halted_reg),
        .idle_reg_0(idle_reg),
        .idle_reg_1(idle_reg_1),
        .ioc_irq_reg_0(\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_16 ),
        .m_axi_sg_aresetn(m_axi_sg_aresetn),
        .mm2s_all_idle(mm2s_all_idle),
        .mm2s_dmasr(mm2s_dmasr),
        .mm2s_error_out(mm2s_error_out),
        .mm2s_halt_cmplt(mm2s_halt_cmplt),
        .mm2s_halted_set0(mm2s_halted_set0),
        .mm2s_introut(mm2s_introut),
        .mm2s_length_wren(mm2s_length_wren),
        .mm2s_sa(mm2s_sa),
        .mm2s_stop(mm2s_stop),
        .mm2s_stop_i(mm2s_stop_i),
        .p_0_in1_in(p_0_in1_in),
        .s_axi_lite_aclk(s_axi_lite_aclk),
        .s_axi_lite_wdata(s_axi_lite_wdata),
        .s_axi_lite_wdata_0_sp_1(\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_9 ),
        .soft_reset(soft_reset),
        .soft_reset_clr(soft_reset_clr),
        .threshold_is_zero(threshold_is_zero));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_register_s2mm \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER 
       (.E(\GEN_SYNC_WRITE.axi2ip_wrce_reg[12] [1]),
        .\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 (\GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_6 ),
        .\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[10]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_97 ),
        .\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[11]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_98 ),
        .\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[13]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_99 ),
        .\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[15]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_100 ),
        .\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[16]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_101 ),
        .\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[17]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_102 ),
        .\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[18]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_103 ),
        .\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[19]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_104 ),
        .\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[20]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_105 ),
        .\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[21]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_106 ),
        .\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[22]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_107 ),
        .\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[2]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_19 ),
        .\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[3]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_93 ),
        .\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[7]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_94 ),
        .\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[8]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_95 ),
        .\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[9]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_96 ),
        .\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 (\GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_7 ),
        .\GEN_REG_FOR_SMPL.buffer_length_i_reg[14]_0 ({s2mm_length[14],s2mm_length[12],\GEN_REG_FOR_SMPL.buffer_length_i_reg[6] }),
        .\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 (axi2ip_wrce[22]),
        .\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] ({axi2ip_rdaddr[4],axi2ip_rdaddr[2]}),
        .Q({\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_15 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_16 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_17 }),
        .axi_dma_tstvec(axi_dma_tstvec[1]),
        .buffer_length_wren0(buffer_length_wren0_0),
        .dma_decerr_reg_0(dma_decerr_reg_0),
        .dma_decerr_reg_1(dma_decerr_reg_2),
        .dma_interr_reg_0(dma_interr_reg_0),
        .dma_interr_reg_1(dma_interr_reg_2),
        .dma_mm2s_error(dma_mm2s_error),
        .dma_s2mm_error(dma_s2mm_error),
        .dma_slverr_reg_0(dma_slverr_reg_0),
        .dma_slverr_reg_1(\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_8 ),
        .dma_slverr_reg_2(dma_slverr_reg_2),
        .\dmacr_i_reg[0]_0 (\dmacr_i_reg[0]_0 ),
        .\dmacr_i_reg[0]_1 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_9 ),
        .\dmacr_i_reg[23]_0 ({\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_111 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_112 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_113 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_114 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_115 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_116 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_117 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_118 }),
        .\dmacr_i_reg[23]_1 (\dmacr_i_reg[23] ),
        .\dmacr_i_reg[2]_0 (\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_9 ),
        .\dmacr_i_reg[2]_1 (\GEN_MM2S_REGISTERS.I_MM2S_DMA_REGISTER_n_12 ),
        .\dmacr_i_reg[31]_0 ({\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_119 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_120 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_121 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_122 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_123 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_124 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_125 ,\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_126 }),
        .\dmacr_i_reg[3]_0 (\dmacr_i_reg[3]_0 ),
        .\dmacr_i_reg[4]_0 ({\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_109 ,s2mm_dmacr}),
        .\dmacr_i_reg[4]_1 (\dmacr_i_reg[4] ),
        .err_irq_reg_0(\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_18 ),
        .halted_reg_0(halted_reg_0),
        .idle_reg_0(idle_reg_0),
        .idle_reg_1(idle_reg_2),
        .ioc_irq_reg_0(\GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER_n_14 ),
        .ioc_irq_reg_1(\GEN_AXI_LITE_IF.AXI_LITE_IF_I_n_8 ),
        .m_axi_sg_aresetn(m_axi_sg_aresetn),
        .mm2s_error_out(mm2s_error_out),
        .mm2s_stop_i(mm2s_stop_i),
        .s2mm_all_idle(s2mm_all_idle),
        .s2mm_da(s2mm_da),
        .s2mm_dmasr(s2mm_dmasr),
        .s2mm_halt_cmplt(s2mm_halt_cmplt),
        .s2mm_halted_set0(s2mm_halted_set0),
        .s2mm_introut(s2mm_introut),
        .s2mm_length_wren(s2mm_length_wren),
        .s2mm_stop(s2mm_stop),
        .s2mm_stop_i(s2mm_stop_i),
        .s_axi_lite_aclk(s_axi_lite_aclk),
        .s_axi_lite_wdata(s_axi_lite_wdata),
        .soft_reset_clr(soft_reset_clr),
        .soft_reset_d1(soft_reset_d1),
        .soft_reset_re0(soft_reset_re0));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b0),
        .O(strm_valid_int2));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b0),
        .O(strm_valid_int_cdc_to));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_register
   (dma_interr_reg_0,
    dma_slverr_reg_0,
    dma_decerr_reg_0,
    mm2s_error_out,
    mm2s_length_wren,
    \dmacr_i_reg[0]_0 ,
    mm2s_dmasr,
    idle_reg_0,
    mm2s_introut,
    s_axi_lite_wdata_0_sp_1,
    mm2s_halted_set0,
    soft_reset,
    \dmacr_i_reg[2]_0 ,
    err_irq_reg_0,
    Q,
    ioc_irq_reg_0,
    buffer_length_wren1,
    threshold_is_zero,
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[5]_0 ,
    mm2s_sa,
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[6]_0 ,
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[1]_0 ,
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[2]_0 ,
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[3]_0 ,
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[13]_0 ,
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[16]_0 ,
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[17]_0 ,
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[18]_0 ,
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[19]_0 ,
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[20]_0 ,
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[21]_0 ,
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[22]_0 ,
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[23]_0 ,
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[24]_0 ,
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[25]_0 ,
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[26]_0 ,
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[27]_0 ,
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[28]_0 ,
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[29]_0 ,
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[30]_0 ,
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_0 ,
    \dmacr_i_reg[3]_0 ,
    \dmacr_i_reg[4]_0 ,
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ,
    \dmacr_i_reg[4]_1 ,
    dma_interr_reg_1,
    s_axi_lite_aclk,
    dma_slverr_reg_1,
    dma_decerr_reg_1,
    buffer_length_wren0,
    \dmacr_i_reg[0]_1 ,
    halted_reg_0,
    idle_reg_1,
    s_axi_lite_wdata,
    E,
    mm2s_stop,
    \dmacr_i_reg[2]_1 ,
    mm2s_halt_cmplt,
    mm2s_stop_i,
    mm2s_all_idle,
    m_axi_sg_aresetn,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[1] ,
    soft_reset_clr,
    SS,
    p_0_in1_in,
    axi_dma_tstvec,
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ,
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ,
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 );
  output dma_interr_reg_0;
  output dma_slverr_reg_0;
  output dma_decerr_reg_0;
  output mm2s_error_out;
  output mm2s_length_wren;
  output \dmacr_i_reg[0]_0 ;
  output [0:0]mm2s_dmasr;
  output idle_reg_0;
  output mm2s_introut;
  output s_axi_lite_wdata_0_sp_1;
  output mm2s_halted_set0;
  output soft_reset;
  output \dmacr_i_reg[2]_0 ;
  output err_irq_reg_0;
  output [1:0]Q;
  output ioc_irq_reg_0;
  output buffer_length_wren1;
  output threshold_is_zero;
  output \GEN_REG_FOR_SMPL.buffer_address_i_reg[5]_0 ;
  output [63:0]mm2s_sa;
  output \GEN_REG_FOR_SMPL.buffer_address_i_reg[6]_0 ;
  output \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[1]_0 ;
  output \GEN_REG_FOR_SMPL.buffer_address_i_reg[2]_0 ;
  output \GEN_REG_FOR_SMPL.buffer_address_i_reg[3]_0 ;
  output \GEN_REG_FOR_SMPL.buffer_address_i_reg[13]_0 ;
  output \GEN_REG_FOR_SMPL.buffer_address_i_reg[16]_0 ;
  output \GEN_REG_FOR_SMPL.buffer_address_i_reg[17]_0 ;
  output \GEN_REG_FOR_SMPL.buffer_address_i_reg[18]_0 ;
  output \GEN_REG_FOR_SMPL.buffer_address_i_reg[19]_0 ;
  output \GEN_REG_FOR_SMPL.buffer_address_i_reg[20]_0 ;
  output \GEN_REG_FOR_SMPL.buffer_address_i_reg[21]_0 ;
  output \GEN_REG_FOR_SMPL.buffer_address_i_reg[22]_0 ;
  output \GEN_REG_FOR_SMPL.buffer_address_i_reg[23]_0 ;
  output \GEN_REG_FOR_SMPL.buffer_address_i_reg[24]_0 ;
  output \GEN_REG_FOR_SMPL.buffer_address_i_reg[25]_0 ;
  output \GEN_REG_FOR_SMPL.buffer_address_i_reg[26]_0 ;
  output \GEN_REG_FOR_SMPL.buffer_address_i_reg[27]_0 ;
  output \GEN_REG_FOR_SMPL.buffer_address_i_reg[28]_0 ;
  output \GEN_REG_FOR_SMPL.buffer_address_i_reg[29]_0 ;
  output \GEN_REG_FOR_SMPL.buffer_address_i_reg[30]_0 ;
  output \GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_0 ;
  output \dmacr_i_reg[3]_0 ;
  output [0:0]\dmacr_i_reg[4]_0 ;
  output [22:0]\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ;
  input [0:0]\dmacr_i_reg[4]_1 ;
  input dma_interr_reg_1;
  input s_axi_lite_aclk;
  input dma_slverr_reg_1;
  input dma_decerr_reg_1;
  input buffer_length_wren0;
  input \dmacr_i_reg[0]_1 ;
  input halted_reg_0;
  input idle_reg_1;
  input [31:0]s_axi_lite_wdata;
  input [0:0]E;
  input mm2s_stop;
  input \dmacr_i_reg[2]_1 ;
  input mm2s_halt_cmplt;
  input mm2s_stop_i;
  input mm2s_all_idle;
  input m_axi_sg_aresetn;
  input [2:0]\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] ;
  input soft_reset_clr;
  input [0:0]SS;
  input p_0_in1_in;
  input [0:0]axi_dma_tstvec;
  input [0:0]\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ;
  input [0:0]\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ;
  input [0:0]\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ;

  wire [0:0]E;
  wire [0:0]\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ;
  wire \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[1]_0 ;
  wire \GEN_REG_FOR_SMPL.buffer_address_i_reg[13]_0 ;
  wire \GEN_REG_FOR_SMPL.buffer_address_i_reg[16]_0 ;
  wire \GEN_REG_FOR_SMPL.buffer_address_i_reg[17]_0 ;
  wire \GEN_REG_FOR_SMPL.buffer_address_i_reg[18]_0 ;
  wire \GEN_REG_FOR_SMPL.buffer_address_i_reg[19]_0 ;
  wire \GEN_REG_FOR_SMPL.buffer_address_i_reg[20]_0 ;
  wire \GEN_REG_FOR_SMPL.buffer_address_i_reg[21]_0 ;
  wire \GEN_REG_FOR_SMPL.buffer_address_i_reg[22]_0 ;
  wire \GEN_REG_FOR_SMPL.buffer_address_i_reg[23]_0 ;
  wire \GEN_REG_FOR_SMPL.buffer_address_i_reg[24]_0 ;
  wire \GEN_REG_FOR_SMPL.buffer_address_i_reg[25]_0 ;
  wire \GEN_REG_FOR_SMPL.buffer_address_i_reg[26]_0 ;
  wire \GEN_REG_FOR_SMPL.buffer_address_i_reg[27]_0 ;
  wire \GEN_REG_FOR_SMPL.buffer_address_i_reg[28]_0 ;
  wire \GEN_REG_FOR_SMPL.buffer_address_i_reg[29]_0 ;
  wire \GEN_REG_FOR_SMPL.buffer_address_i_reg[2]_0 ;
  wire \GEN_REG_FOR_SMPL.buffer_address_i_reg[30]_0 ;
  wire \GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_0 ;
  wire [0:0]\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ;
  wire \GEN_REG_FOR_SMPL.buffer_address_i_reg[3]_0 ;
  wire \GEN_REG_FOR_SMPL.buffer_address_i_reg[5]_0 ;
  wire \GEN_REG_FOR_SMPL.buffer_address_i_reg[6]_0 ;
  wire [22:0]\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ;
  wire [0:0]\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ;
  wire \GEN_REG_FOR_SMPL.buffer_length_wren_i_3_n_0 ;
  wire \GEN_REG_FOR_SMPL.buffer_length_wren_i_4_n_0 ;
  wire \GEN_REG_FOR_SMPL.buffer_length_wren_i_5_n_0 ;
  wire \GEN_REG_FOR_SMPL.buffer_length_wren_i_6_n_0 ;
  wire [2:0]\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] ;
  wire [1:0]Q;
  wire [0:0]SS;
  wire [0:0]axi_dma_tstvec;
  wire buffer_length_wren0;
  wire buffer_length_wren1;
  wire dma_decerr_reg_0;
  wire dma_decerr_reg_1;
  wire dma_interr_reg_0;
  wire dma_interr_reg_1;
  wire dma_slverr_reg_0;
  wire dma_slverr_reg_1;
  wire \dmacr_i[23]_i_3_n_0 ;
  wire \dmacr_i[2]_i_1_n_0 ;
  wire \dmacr_i_reg[0]_0 ;
  wire \dmacr_i_reg[0]_1 ;
  wire \dmacr_i_reg[2]_0 ;
  wire \dmacr_i_reg[2]_1 ;
  wire \dmacr_i_reg[3]_0 ;
  wire [0:0]\dmacr_i_reg[4]_0 ;
  wire [0:0]\dmacr_i_reg[4]_1 ;
  wire \dmacr_i_reg_n_0_[13] ;
  wire \dmacr_i_reg_n_0_[16] ;
  wire \dmacr_i_reg_n_0_[17] ;
  wire \dmacr_i_reg_n_0_[18] ;
  wire \dmacr_i_reg_n_0_[19] ;
  wire \dmacr_i_reg_n_0_[20] ;
  wire \dmacr_i_reg_n_0_[21] ;
  wire \dmacr_i_reg_n_0_[22] ;
  wire \dmacr_i_reg_n_0_[23] ;
  wire \dmacr_i_reg_n_0_[24] ;
  wire \dmacr_i_reg_n_0_[25] ;
  wire \dmacr_i_reg_n_0_[26] ;
  wire \dmacr_i_reg_n_0_[27] ;
  wire \dmacr_i_reg_n_0_[28] ;
  wire \dmacr_i_reg_n_0_[29] ;
  wire \dmacr_i_reg_n_0_[30] ;
  wire \dmacr_i_reg_n_0_[31] ;
  wire err_irq_i_1_n_0;
  wire err_irq_reg_0;
  wire error_d1;
  wire halted_reg_0;
  wire idle_reg_0;
  wire idle_reg_1;
  wire introut_i_1__0_n_0;
  wire ioc_irq_i_1_n_0;
  wire ioc_irq_reg_0;
  wire m_axi_sg_aresetn;
  wire mm2s_all_idle;
  wire [3:3]mm2s_dmacr;
  wire [0:0]mm2s_dmasr;
  wire mm2s_error_out;
  wire mm2s_halt_cmplt;
  wire mm2s_halted_set0;
  wire mm2s_introut;
  wire mm2s_length_wren;
  wire [63:0]mm2s_sa;
  wire mm2s_stop;
  wire mm2s_stop_i;
  wire p_0_in1_in;
  wire s_axi_lite_aclk;
  wire [31:0]s_axi_lite_wdata;
  wire s_axi_lite_wdata_0_sn_1;
  wire soft_reset;
  wire soft_reset_clr;
  wire threshold_is_zero;

  assign s_axi_lite_wdata_0_sp_1 = s_axi_lite_wdata_0_sn_1;
  LUT1 #(
    .INIT(2'h1)) 
    \GEN_CMD_BTT_EQL_23.cmnd_data[23]_i_1 
       (.I0(mm2s_dmacr),
        .O(\dmacr_i_reg[3]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[0]),
        .Q(mm2s_sa[32]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[10] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[10]),
        .Q(mm2s_sa[42]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[11] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[11]),
        .Q(mm2s_sa[43]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[12] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[12]),
        .Q(mm2s_sa[44]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[13] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[13]),
        .Q(mm2s_sa[45]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[14] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[14]),
        .Q(mm2s_sa[46]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[15] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[15]),
        .Q(mm2s_sa[47]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[16] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[16]),
        .Q(mm2s_sa[48]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[17] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[17]),
        .Q(mm2s_sa[49]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[18] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[18]),
        .Q(mm2s_sa[50]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[19] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[19]),
        .Q(mm2s_sa[51]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[1] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[1]),
        .Q(mm2s_sa[33]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[20] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[20]),
        .Q(mm2s_sa[52]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[21] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[21]),
        .Q(mm2s_sa[53]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[22] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[22]),
        .Q(mm2s_sa[54]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[23] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[23]),
        .Q(mm2s_sa[55]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[24] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[24]),
        .Q(mm2s_sa[56]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[25] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[25]),
        .Q(mm2s_sa[57]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[26] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[26]),
        .Q(mm2s_sa[58]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[27] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[27]),
        .Q(mm2s_sa[59]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[28] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[28]),
        .Q(mm2s_sa[60]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[29] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[29]),
        .Q(mm2s_sa[61]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[2] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[2]),
        .Q(mm2s_sa[34]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[30] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[30]),
        .Q(mm2s_sa[62]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[31] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[31]),
        .Q(mm2s_sa[63]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[3] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[3]),
        .Q(mm2s_sa[35]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[4] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[4]),
        .Q(mm2s_sa[36]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[5] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[5]),
        .Q(mm2s_sa[37]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[6] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[6]),
        .Q(mm2s_sa[38]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[7] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[7]),
        .Q(mm2s_sa[39]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[8] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[8]),
        .Q(mm2s_sa[40]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[9] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[0]_0 ),
        .D(s_axi_lite_wdata[9]),
        .Q(mm2s_sa[41]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[0] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[0]),
        .Q(mm2s_sa[0]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[10] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[10]),
        .Q(mm2s_sa[10]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[11] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[11]),
        .Q(mm2s_sa[11]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[12] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[12]),
        .Q(mm2s_sa[12]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[13] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[13]),
        .Q(mm2s_sa[13]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[14] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[14]),
        .Q(mm2s_sa[14]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[15] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[15]),
        .Q(mm2s_sa[15]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[16] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[16]),
        .Q(mm2s_sa[16]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[17] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[17]),
        .Q(mm2s_sa[17]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[18] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[18]),
        .Q(mm2s_sa[18]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[19] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[19]),
        .Q(mm2s_sa[19]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[1] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[1]),
        .Q(mm2s_sa[1]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[20] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[20]),
        .Q(mm2s_sa[20]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[21] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[21]),
        .Q(mm2s_sa[21]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[22] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[22]),
        .Q(mm2s_sa[22]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[23] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[23]),
        .Q(mm2s_sa[23]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[24] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[24]),
        .Q(mm2s_sa[24]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[25] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[25]),
        .Q(mm2s_sa[25]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[26] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[26]),
        .Q(mm2s_sa[26]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[27] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[27]),
        .Q(mm2s_sa[27]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[28] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[28]),
        .Q(mm2s_sa[28]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[29] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[29]),
        .Q(mm2s_sa[29]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[2] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[2]),
        .Q(mm2s_sa[2]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[30] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[30]),
        .Q(mm2s_sa[30]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[31] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[31]),
        .Q(mm2s_sa[31]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[3] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[3]),
        .Q(mm2s_sa[3]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[4] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[4]),
        .Q(mm2s_sa[4]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[5] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[5]),
        .Q(mm2s_sa[5]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[6] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[6]),
        .Q(mm2s_sa[6]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[7] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[7]),
        .Q(mm2s_sa[7]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[8] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[8]),
        .Q(mm2s_sa[8]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[9] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_1 ),
        .D(s_axi_lite_wdata[9]),
        .Q(mm2s_sa[9]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[0] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ),
        .D(s_axi_lite_wdata[0]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 [0]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[10] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ),
        .D(s_axi_lite_wdata[10]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 [10]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[11] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ),
        .D(s_axi_lite_wdata[11]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 [11]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[12] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ),
        .D(s_axi_lite_wdata[12]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 [12]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[13] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ),
        .D(s_axi_lite_wdata[13]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 [13]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[14] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ),
        .D(s_axi_lite_wdata[14]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 [14]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[15] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ),
        .D(s_axi_lite_wdata[15]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 [15]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[16] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ),
        .D(s_axi_lite_wdata[16]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 [16]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[17] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ),
        .D(s_axi_lite_wdata[17]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 [17]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[18] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ),
        .D(s_axi_lite_wdata[18]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 [18]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[19] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ),
        .D(s_axi_lite_wdata[19]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 [19]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[1] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ),
        .D(s_axi_lite_wdata[1]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 [1]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[20] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ),
        .D(s_axi_lite_wdata[20]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 [20]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[21] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ),
        .D(s_axi_lite_wdata[21]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 [21]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[22] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ),
        .D(s_axi_lite_wdata[22]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 [22]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[2] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ),
        .D(s_axi_lite_wdata[2]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 [2]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[3] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ),
        .D(s_axi_lite_wdata[3]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 [3]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[4] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ),
        .D(s_axi_lite_wdata[4]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 [4]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[5] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ),
        .D(s_axi_lite_wdata[5]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 [5]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[6] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ),
        .D(s_axi_lite_wdata[6]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 [6]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[7] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ),
        .D(s_axi_lite_wdata[7]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 [7]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[8] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ),
        .D(s_axi_lite_wdata[8]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 [8]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[9] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_1 ),
        .D(s_axi_lite_wdata[9]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 [9]),
        .R(\dmacr_i_reg[4]_1 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \GEN_REG_FOR_SMPL.buffer_length_wren_i_2 
       (.I0(\GEN_REG_FOR_SMPL.buffer_length_wren_i_3_n_0 ),
        .I1(\GEN_REG_FOR_SMPL.buffer_length_wren_i_4_n_0 ),
        .I2(\GEN_REG_FOR_SMPL.buffer_length_wren_i_5_n_0 ),
        .I3(\GEN_REG_FOR_SMPL.buffer_length_wren_i_6_n_0 ),
        .I4(s_axi_lite_wdata[15]),
        .I5(s_axi_lite_wdata[14]),
        .O(buffer_length_wren1));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \GEN_REG_FOR_SMPL.buffer_length_wren_i_3 
       (.I0(s_axi_lite_wdata[8]),
        .I1(s_axi_lite_wdata[9]),
        .I2(s_axi_lite_wdata[17]),
        .I3(s_axi_lite_wdata[16]),
        .I4(s_axi_lite_wdata[19]),
        .I5(s_axi_lite_wdata[18]),
        .O(\GEN_REG_FOR_SMPL.buffer_length_wren_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \GEN_REG_FOR_SMPL.buffer_length_wren_i_4 
       (.I0(s_axi_lite_wdata[21]),
        .I1(s_axi_lite_wdata[7]),
        .I2(s_axi_lite_wdata[6]),
        .I3(s_axi_lite_wdata[20]),
        .I4(s_axi_lite_wdata[22]),
        .O(\GEN_REG_FOR_SMPL.buffer_length_wren_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \GEN_REG_FOR_SMPL.buffer_length_wren_i_5 
       (.I0(s_axi_lite_wdata[11]),
        .I1(s_axi_lite_wdata[10]),
        .I2(s_axi_lite_wdata[13]),
        .I3(s_axi_lite_wdata[12]),
        .I4(s_axi_lite_wdata[4]),
        .I5(s_axi_lite_wdata[5]),
        .O(\GEN_REG_FOR_SMPL.buffer_length_wren_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \GEN_REG_FOR_SMPL.buffer_length_wren_i_6 
       (.I0(s_axi_lite_wdata[2]),
        .I1(s_axi_lite_wdata[3]),
        .I2(s_axi_lite_wdata[0]),
        .I3(s_axi_lite_wdata[1]),
        .O(\GEN_REG_FOR_SMPL.buffer_length_wren_i_6_n_0 ));
  FDRE \GEN_REG_FOR_SMPL.buffer_length_wren_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(buffer_length_wren0),
        .Q(mm2s_length_wren),
        .R(\dmacr_i_reg[4]_1 ));
  LUT6 #(
    .INIT(64'hF0AA0000000000CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[13]_i_4 
       (.I0(mm2s_sa[13]),
        .I1(\dmacr_i_reg_n_0_[13] ),
        .I2(mm2s_sa[45]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [2]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [1]),
        .O(\GEN_REG_FOR_SMPL.buffer_address_i_reg[13]_0 ));
  LUT6 #(
    .INIT(64'hF0AA0000000000CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[16]_i_4 
       (.I0(mm2s_sa[16]),
        .I1(\dmacr_i_reg_n_0_[16] ),
        .I2(mm2s_sa[48]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [2]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [1]),
        .O(\GEN_REG_FOR_SMPL.buffer_address_i_reg[16]_0 ));
  LUT6 #(
    .INIT(64'hF0AA0000000000CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[17]_i_4 
       (.I0(mm2s_sa[17]),
        .I1(\dmacr_i_reg_n_0_[17] ),
        .I2(mm2s_sa[49]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [2]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [1]),
        .O(\GEN_REG_FOR_SMPL.buffer_address_i_reg[17]_0 ));
  LUT6 #(
    .INIT(64'hF0AA0000000000CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[18]_i_4 
       (.I0(mm2s_sa[18]),
        .I1(\dmacr_i_reg_n_0_[18] ),
        .I2(mm2s_sa[50]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [2]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [1]),
        .O(\GEN_REG_FOR_SMPL.buffer_address_i_reg[18]_0 ));
  LUT6 #(
    .INIT(64'hF0AA0000000000CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[19]_i_4 
       (.I0(mm2s_sa[19]),
        .I1(\dmacr_i_reg_n_0_[19] ),
        .I2(mm2s_sa[51]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [2]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [1]),
        .O(\GEN_REG_FOR_SMPL.buffer_address_i_reg[19]_0 ));
  LUT6 #(
    .INIT(64'hAC0000FFAC00000F)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[1]_i_3 
       (.I0(mm2s_sa[33]),
        .I1(mm2s_sa[1]),
        .I2(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [0]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [2]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [1]),
        .I5(idle_reg_0),
        .O(\GEN_REG_FOR_SMPL.GEN_BUFF_ADDR_EQL64.buffer_address_i_64_reg[1]_0 ));
  LUT6 #(
    .INIT(64'hF0AA0000000000CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[20]_i_4 
       (.I0(mm2s_sa[20]),
        .I1(\dmacr_i_reg_n_0_[20] ),
        .I2(mm2s_sa[52]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [2]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [1]),
        .O(\GEN_REG_FOR_SMPL.buffer_address_i_reg[20]_0 ));
  LUT6 #(
    .INIT(64'hF0AA0000000000CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[21]_i_4 
       (.I0(mm2s_sa[21]),
        .I1(\dmacr_i_reg_n_0_[21] ),
        .I2(mm2s_sa[53]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [2]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [1]),
        .O(\GEN_REG_FOR_SMPL.buffer_address_i_reg[21]_0 ));
  LUT6 #(
    .INIT(64'hF0AA0000000000CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[22]_i_7 
       (.I0(mm2s_sa[22]),
        .I1(\dmacr_i_reg_n_0_[22] ),
        .I2(mm2s_sa[54]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [2]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [1]),
        .O(\GEN_REG_FOR_SMPL.buffer_address_i_reg[22]_0 ));
  LUT6 #(
    .INIT(64'hF0AA0000000000CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[23]_i_3 
       (.I0(mm2s_sa[23]),
        .I1(\dmacr_i_reg_n_0_[23] ),
        .I2(mm2s_sa[55]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [2]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [1]),
        .O(\GEN_REG_FOR_SMPL.buffer_address_i_reg[23]_0 ));
  LUT6 #(
    .INIT(64'hF0AA0000000000CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[24]_i_3 
       (.I0(mm2s_sa[24]),
        .I1(\dmacr_i_reg_n_0_[24] ),
        .I2(mm2s_sa[56]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [2]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [1]),
        .O(\GEN_REG_FOR_SMPL.buffer_address_i_reg[24]_0 ));
  LUT6 #(
    .INIT(64'hF0AA0000000000CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[25]_i_3 
       (.I0(mm2s_sa[25]),
        .I1(\dmacr_i_reg_n_0_[25] ),
        .I2(mm2s_sa[57]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [2]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [1]),
        .O(\GEN_REG_FOR_SMPL.buffer_address_i_reg[25]_0 ));
  LUT6 #(
    .INIT(64'hF0AA0000000000CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[26]_i_3 
       (.I0(mm2s_sa[26]),
        .I1(\dmacr_i_reg_n_0_[26] ),
        .I2(mm2s_sa[58]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [2]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [1]),
        .O(\GEN_REG_FOR_SMPL.buffer_address_i_reg[26]_0 ));
  LUT6 #(
    .INIT(64'hF0AA0000000000CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[27]_i_3 
       (.I0(mm2s_sa[27]),
        .I1(\dmacr_i_reg_n_0_[27] ),
        .I2(mm2s_sa[59]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [2]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [1]),
        .O(\GEN_REG_FOR_SMPL.buffer_address_i_reg[27]_0 ));
  LUT6 #(
    .INIT(64'hF0AA0000000000CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[28]_i_3 
       (.I0(mm2s_sa[28]),
        .I1(\dmacr_i_reg_n_0_[28] ),
        .I2(mm2s_sa[60]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [2]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [1]),
        .O(\GEN_REG_FOR_SMPL.buffer_address_i_reg[28]_0 ));
  LUT6 #(
    .INIT(64'hF0AA0000000000CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[29]_i_3 
       (.I0(mm2s_sa[29]),
        .I1(\dmacr_i_reg_n_0_[29] ),
        .I2(mm2s_sa[61]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [2]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [1]),
        .O(\GEN_REG_FOR_SMPL.buffer_address_i_reg[29]_0 ));
  LUT6 #(
    .INIT(64'hF0AA0000000000CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[2]_i_4 
       (.I0(mm2s_sa[2]),
        .I1(\dmacr_i_reg[2]_0 ),
        .I2(mm2s_sa[34]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [2]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [1]),
        .O(\GEN_REG_FOR_SMPL.buffer_address_i_reg[2]_0 ));
  LUT6 #(
    .INIT(64'hF0AA0000000000CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[30]_i_3 
       (.I0(mm2s_sa[30]),
        .I1(\dmacr_i_reg_n_0_[30] ),
        .I2(mm2s_sa[62]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [2]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [1]),
        .O(\GEN_REG_FOR_SMPL.buffer_address_i_reg[30]_0 ));
  LUT6 #(
    .INIT(64'hF0AA0000000000CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[31]_i_5 
       (.I0(mm2s_sa[31]),
        .I1(\dmacr_i_reg_n_0_[31] ),
        .I2(mm2s_sa[63]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [2]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [1]),
        .O(\GEN_REG_FOR_SMPL.buffer_address_i_reg[31]_0 ));
  LUT6 #(
    .INIT(64'hF0AA0000000000CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[3]_i_4 
       (.I0(mm2s_sa[3]),
        .I1(mm2s_dmacr),
        .I2(mm2s_sa[35]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [2]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [1]),
        .O(\GEN_REG_FOR_SMPL.buffer_address_i_reg[3]_0 ));
  LUT6 #(
    .INIT(64'hF0AA00000000CC00)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[5]_i_4 
       (.I0(mm2s_sa[5]),
        .I1(dma_slverr_reg_0),
        .I2(mm2s_sa[37]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [2]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [1]),
        .O(\GEN_REG_FOR_SMPL.buffer_address_i_reg[5]_0 ));
  LUT6 #(
    .INIT(64'hF0AA00000000CC00)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[6]_i_5 
       (.I0(mm2s_sa[6]),
        .I1(dma_decerr_reg_0),
        .I2(mm2s_sa[38]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [0]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [2]),
        .I5(\GEN_SYNC_READ.s_axi_lite_rdata_reg[1] [1]),
        .O(\GEN_REG_FOR_SMPL.buffer_address_i_reg[6]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    dma_decerr_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(dma_decerr_reg_1),
        .Q(dma_decerr_reg_0),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    dma_interr_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(dma_interr_reg_1),
        .Q(dma_interr_reg_0),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    dma_slverr_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(dma_slverr_reg_1),
        .Q(dma_slverr_reg_0),
        .R(\dmacr_i_reg[4]_1 ));
  LUT6 #(
    .INIT(64'h00000000000000B8)) 
    \dmacr_i[0]_i_2 
       (.I0(s_axi_lite_wdata[0]),
        .I1(E),
        .I2(\dmacr_i_reg[0]_0 ),
        .I3(mm2s_stop),
        .I4(\dmacr_i_reg[2]_1 ),
        .I5(mm2s_error_out),
        .O(s_axi_lite_wdata_0_sn_1));
  LUT5 #(
    .INIT(32'h00000001)) 
    \dmacr_i[23]_i_2 
       (.I0(s_axi_lite_wdata[22]),
        .I1(s_axi_lite_wdata[23]),
        .I2(s_axi_lite_wdata[20]),
        .I3(s_axi_lite_wdata[21]),
        .I4(\dmacr_i[23]_i_3_n_0 ),
        .O(threshold_is_zero));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \dmacr_i[23]_i_3 
       (.I0(s_axi_lite_wdata[18]),
        .I1(s_axi_lite_wdata[19]),
        .I2(s_axi_lite_wdata[16]),
        .I3(s_axi_lite_wdata[17]),
        .O(\dmacr_i[23]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hFFEC)) 
    \dmacr_i[2]_i_1 
       (.I0(s_axi_lite_wdata[2]),
        .I1(\dmacr_i_reg[2]_0 ),
        .I2(E),
        .I3(\dmacr_i_reg[2]_1 ),
        .O(\dmacr_i[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[0] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\dmacr_i_reg[0]_1 ),
        .Q(\dmacr_i_reg[0]_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[12] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[12]),
        .Q(Q[0]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[13] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[13]),
        .Q(\dmacr_i_reg_n_0_[13] ),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[14] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[14]),
        .Q(Q[1]),
        .R(\dmacr_i_reg[4]_1 ));
  FDSE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[16] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[16]),
        .Q(\dmacr_i_reg_n_0_[16] ),
        .S(SS));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[17] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[17]),
        .Q(\dmacr_i_reg_n_0_[17] ),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[18] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[18]),
        .Q(\dmacr_i_reg_n_0_[18] ),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[19] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[19]),
        .Q(\dmacr_i_reg_n_0_[19] ),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[20] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[20]),
        .Q(\dmacr_i_reg_n_0_[20] ),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[21] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[21]),
        .Q(\dmacr_i_reg_n_0_[21] ),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[22] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[22]),
        .Q(\dmacr_i_reg_n_0_[22] ),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[23] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[23]),
        .Q(\dmacr_i_reg_n_0_[23] ),
        .R(SS));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[24] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[24]),
        .Q(\dmacr_i_reg_n_0_[24] ),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[25] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[25]),
        .Q(\dmacr_i_reg_n_0_[25] ),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[26] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[26]),
        .Q(\dmacr_i_reg_n_0_[26] ),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[27] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[27]),
        .Q(\dmacr_i_reg_n_0_[27] ),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[28] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[28]),
        .Q(\dmacr_i_reg_n_0_[28] ),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[29] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[29]),
        .Q(\dmacr_i_reg_n_0_[29] ),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[2] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\dmacr_i[2]_i_1_n_0 ),
        .Q(\dmacr_i_reg[2]_0 ),
        .R(soft_reset_clr));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[30] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[30]),
        .Q(\dmacr_i_reg_n_0_[30] ),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[31] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[31]),
        .Q(\dmacr_i_reg_n_0_[31] ),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[3] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[3]),
        .Q(mm2s_dmacr),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[4] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[4]),
        .Q(\dmacr_i_reg[4]_0 ),
        .R(\dmacr_i_reg[4]_1 ));
  LUT5 #(
    .INIT(32'h5DFF0C0C)) 
    err_irq_i_1
       (.I0(s_axi_lite_wdata[14]),
        .I1(mm2s_error_out),
        .I2(error_d1),
        .I3(p_0_in1_in),
        .I4(err_irq_reg_0),
        .O(err_irq_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    err_irq_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(err_irq_i_1_n_0),
        .Q(err_irq_reg_0),
        .R(\dmacr_i_reg[4]_1 ));
  LUT3 #(
    .INIT(8'hFE)) 
    error_d1_i_1
       (.I0(dma_slverr_reg_0),
        .I1(dma_interr_reg_0),
        .I2(dma_decerr_reg_0),
        .O(mm2s_error_out));
  FDRE #(
    .INIT(1'b0)) 
    error_d1_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(mm2s_error_out),
        .Q(error_d1),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    halted_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(halted_reg_0),
        .Q(mm2s_dmasr),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    idle_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(idle_reg_1),
        .Q(idle_reg_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00F0008000800080)) 
    introut_i_1__0
       (.I0(err_irq_reg_0),
        .I1(Q[1]),
        .I2(m_axi_sg_aresetn),
        .I3(\dmacr_i_reg[2]_0 ),
        .I4(ioc_irq_reg_0),
        .I5(Q[0]),
        .O(introut_i_1__0_n_0));
  FDRE introut_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(introut_i_1__0_n_0),
        .Q(mm2s_introut),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hF7F0)) 
    ioc_irq_i_1
       (.I0(s_axi_lite_wdata[12]),
        .I1(p_0_in1_in),
        .I2(axi_dma_tstvec),
        .I3(ioc_irq_reg_0),
        .O(ioc_irq_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ioc_irq_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(ioc_irq_i_1_n_0),
        .Q(ioc_irq_reg_0),
        .R(\dmacr_i_reg[4]_1 ));
  LUT4 #(
    .INIT(16'h4500)) 
    mm2s_halted_set_i_1
       (.I0(\dmacr_i_reg[0]_0 ),
        .I1(mm2s_halt_cmplt),
        .I2(mm2s_stop_i),
        .I3(mm2s_all_idle),
        .O(mm2s_halted_set0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'hE)) 
    soft_reset_d1_i_1
       (.I0(\dmacr_i_reg[2]_0 ),
        .I1(\dmacr_i_reg[2]_1 ),
        .O(soft_reset));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_register_s2mm
   (dma_interr_reg_0,
    dma_slverr_reg_0,
    dma_decerr_reg_0,
    s2mm_length_wren,
    \dmacr_i_reg[0]_0 ,
    s2mm_dmasr,
    idle_reg_0,
    s2mm_introut,
    dma_slverr_reg_1,
    \dmacr_i_reg[2]_0 ,
    soft_reset_re0,
    mm2s_stop_i,
    s2mm_halted_set0,
    s2mm_stop_i,
    ioc_irq_reg_0,
    Q,
    err_irq_reg_0,
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[2]_0 ,
    s2mm_da,
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[14]_0 ,
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[3]_0 ,
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[7]_0 ,
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[8]_0 ,
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[9]_0 ,
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[10]_0 ,
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[11]_0 ,
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[13]_0 ,
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[15]_0 ,
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[16]_0 ,
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[17]_0 ,
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[18]_0 ,
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[19]_0 ,
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[20]_0 ,
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[21]_0 ,
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[22]_0 ,
    \dmacr_i_reg[3]_0 ,
    \dmacr_i_reg[4]_0 ,
    \dmacr_i_reg[23]_0 ,
    \dmacr_i_reg[31]_0 ,
    \dmacr_i_reg[4]_1 ,
    dma_interr_reg_1,
    s_axi_lite_aclk,
    dma_slverr_reg_2,
    dma_decerr_reg_1,
    buffer_length_wren0,
    halted_reg_0,
    idle_reg_1,
    m_axi_sg_aresetn,
    \dmacr_i_reg[2]_1 ,
    \dmacr_i_reg[0]_1 ,
    s_axi_lite_wdata,
    E,
    s2mm_stop,
    mm2s_error_out,
    soft_reset_d1,
    dma_s2mm_error,
    dma_mm2s_error,
    s2mm_halt_cmplt,
    s2mm_all_idle,
    \GEN_SYNC_READ.s_axi_lite_rdata_reg[2] ,
    soft_reset_clr,
    \dmacr_i_reg[23]_1 ,
    ioc_irq_reg_1,
    axi_dma_tstvec,
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ,
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ,
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 );
  output dma_interr_reg_0;
  output dma_slverr_reg_0;
  output dma_decerr_reg_0;
  output s2mm_length_wren;
  output \dmacr_i_reg[0]_0 ;
  output [0:0]s2mm_dmasr;
  output idle_reg_0;
  output s2mm_introut;
  output dma_slverr_reg_1;
  output \dmacr_i_reg[2]_0 ;
  output soft_reset_re0;
  output mm2s_stop_i;
  output s2mm_halted_set0;
  output s2mm_stop_i;
  output ioc_irq_reg_0;
  output [2:0]Q;
  output err_irq_reg_0;
  output \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[2]_0 ;
  output [63:0]s2mm_da;
  output [8:0]\GEN_REG_FOR_SMPL.buffer_length_i_reg[14]_0 ;
  output \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[3]_0 ;
  output \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[7]_0 ;
  output \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[8]_0 ;
  output \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[9]_0 ;
  output \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[10]_0 ;
  output \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[11]_0 ;
  output \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[13]_0 ;
  output \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[15]_0 ;
  output \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[16]_0 ;
  output \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[17]_0 ;
  output \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[18]_0 ;
  output \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[19]_0 ;
  output \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[20]_0 ;
  output \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[21]_0 ;
  output \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[22]_0 ;
  output \dmacr_i_reg[3]_0 ;
  output [1:0]\dmacr_i_reg[4]_0 ;
  output [7:0]\dmacr_i_reg[23]_0 ;
  output [7:0]\dmacr_i_reg[31]_0 ;
  input [0:0]\dmacr_i_reg[4]_1 ;
  input dma_interr_reg_1;
  input s_axi_lite_aclk;
  input dma_slverr_reg_2;
  input dma_decerr_reg_1;
  input buffer_length_wren0;
  input halted_reg_0;
  input idle_reg_1;
  input m_axi_sg_aresetn;
  input \dmacr_i_reg[2]_1 ;
  input \dmacr_i_reg[0]_1 ;
  input [31:0]s_axi_lite_wdata;
  input [0:0]E;
  input s2mm_stop;
  input mm2s_error_out;
  input soft_reset_d1;
  input dma_s2mm_error;
  input dma_mm2s_error;
  input s2mm_halt_cmplt;
  input s2mm_all_idle;
  input [1:0]\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] ;
  input soft_reset_clr;
  input [0:0]\dmacr_i_reg[23]_1 ;
  input ioc_irq_reg_1;
  input [0:0]axi_dma_tstvec;
  input [0:0]\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ;
  input [0:0]\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ;
  input [0:0]\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ;

  wire [0:0]E;
  wire [0:0]\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ;
  wire \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[10]_0 ;
  wire \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[11]_0 ;
  wire \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[13]_0 ;
  wire \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[15]_0 ;
  wire \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[16]_0 ;
  wire \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[17]_0 ;
  wire \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[18]_0 ;
  wire \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[19]_0 ;
  wire \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[20]_0 ;
  wire \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[21]_0 ;
  wire \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[22]_0 ;
  wire \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[2]_0 ;
  wire \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[3]_0 ;
  wire \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[7]_0 ;
  wire \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[8]_0 ;
  wire \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[9]_0 ;
  wire [0:0]\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ;
  wire [8:0]\GEN_REG_FOR_SMPL.buffer_length_i_reg[14]_0 ;
  wire [0:0]\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ;
  wire [1:0]\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] ;
  wire [2:0]Q;
  wire [0:0]axi_dma_tstvec;
  wire buffer_length_wren0;
  wire dma_decerr_reg_0;
  wire dma_decerr_reg_1;
  wire dma_interr_reg_0;
  wire dma_interr_reg_1;
  wire dma_mm2s_error;
  wire dma_s2mm_error;
  wire dma_slverr_reg_0;
  wire dma_slverr_reg_1;
  wire dma_slverr_reg_2;
  wire \dmacr_i[0]_i_1__0_n_0 ;
  wire \dmacr_i[0]_i_2__0_n_0 ;
  wire \dmacr_i[2]_i_2_n_0 ;
  wire \dmacr_i_reg[0]_0 ;
  wire \dmacr_i_reg[0]_1 ;
  wire [7:0]\dmacr_i_reg[23]_0 ;
  wire [0:0]\dmacr_i_reg[23]_1 ;
  wire \dmacr_i_reg[2]_0 ;
  wire \dmacr_i_reg[2]_1 ;
  wire [7:0]\dmacr_i_reg[31]_0 ;
  wire \dmacr_i_reg[3]_0 ;
  wire [1:0]\dmacr_i_reg[4]_0 ;
  wire [0:0]\dmacr_i_reg[4]_1 ;
  wire err_irq_i_1_n_0;
  wire err_irq_reg_0;
  wire error_d1;
  wire halted_reg_0;
  wire idle_reg_0;
  wire idle_reg_1;
  wire introut_i_1_n_0;
  wire ioc_irq_i_1_n_0;
  wire ioc_irq_reg_0;
  wire ioc_irq_reg_1;
  wire m_axi_sg_aresetn;
  wire mm2s_error_out;
  wire mm2s_stop_i;
  wire s2mm_all_idle;
  wire [63:0]s2mm_da;
  wire [0:0]s2mm_dmasr;
  wire s2mm_error_out;
  wire s2mm_halt_cmplt;
  wire s2mm_halted_set0;
  wire s2mm_introut;
  wire [22:7]s2mm_length;
  wire s2mm_length_wren;
  wire s2mm_stop;
  wire s2mm_stop_i;
  wire s_axi_lite_aclk;
  wire [31:0]s_axi_lite_wdata;
  wire soft_reset_clr;
  wire soft_reset_d1;
  wire soft_reset_re0;

  LUT1 #(
    .INIT(2'h1)) 
    \GEN_CMD_BTT_EQL_23.cmnd_data[23]_i_1__0 
       (.I0(\dmacr_i_reg[4]_0 [0]),
        .O(\dmacr_i_reg[3]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[0]),
        .Q(s2mm_da[32]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[10] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[10]),
        .Q(s2mm_da[42]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[11] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[11]),
        .Q(s2mm_da[43]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[12] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[12]),
        .Q(s2mm_da[44]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[13] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[13]),
        .Q(s2mm_da[45]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[14] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[14]),
        .Q(s2mm_da[46]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[15] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[15]),
        .Q(s2mm_da[47]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[16] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[16]),
        .Q(s2mm_da[48]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[17] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[17]),
        .Q(s2mm_da[49]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[18] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[18]),
        .Q(s2mm_da[50]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[19] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[19]),
        .Q(s2mm_da[51]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[1] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[1]),
        .Q(s2mm_da[33]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[20] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[20]),
        .Q(s2mm_da[52]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[21] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[21]),
        .Q(s2mm_da[53]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[22] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[22]),
        .Q(s2mm_da[54]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[23] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[23]),
        .Q(s2mm_da[55]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[24] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[24]),
        .Q(s2mm_da[56]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[25] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[25]),
        .Q(s2mm_da[57]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[26] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[26]),
        .Q(s2mm_da[58]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[27] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[27]),
        .Q(s2mm_da[59]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[28] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[28]),
        .Q(s2mm_da[60]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[29] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[29]),
        .Q(s2mm_da[61]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[2] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[2]),
        .Q(s2mm_da[34]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[30] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[30]),
        .Q(s2mm_da[62]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[31] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[31]),
        .Q(s2mm_da[63]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[3] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[3]),
        .Q(s2mm_da[35]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[4] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[4]),
        .Q(s2mm_da[36]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[5] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[5]),
        .Q(s2mm_da[37]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[6] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[6]),
        .Q(s2mm_da[38]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[7] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[7]),
        .Q(s2mm_da[39]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[8] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[8]),
        .Q(s2mm_da[40]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[9] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[9]),
        .Q(s2mm_da[41]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[0] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[0]),
        .Q(s2mm_da[0]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[10] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[10]),
        .Q(s2mm_da[10]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[11] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[11]),
        .Q(s2mm_da[11]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[12] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[12]),
        .Q(s2mm_da[12]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[13] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[13]),
        .Q(s2mm_da[13]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[14] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[14]),
        .Q(s2mm_da[14]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[15] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[15]),
        .Q(s2mm_da[15]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[16] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[16]),
        .Q(s2mm_da[16]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[17] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[17]),
        .Q(s2mm_da[17]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[18] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[18]),
        .Q(s2mm_da[18]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[19] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[19]),
        .Q(s2mm_da[19]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[1] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[1]),
        .Q(s2mm_da[1]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[20] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[20]),
        .Q(s2mm_da[20]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[21] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[21]),
        .Q(s2mm_da[21]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[22] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[22]),
        .Q(s2mm_da[22]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[23] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[23]),
        .Q(s2mm_da[23]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[24] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[24]),
        .Q(s2mm_da[24]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[25] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[25]),
        .Q(s2mm_da[25]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[26] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[26]),
        .Q(s2mm_da[26]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[27] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[27]),
        .Q(s2mm_da[27]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[28] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[28]),
        .Q(s2mm_da[28]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[29] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[29]),
        .Q(s2mm_da[29]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[2] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[2]),
        .Q(s2mm_da[2]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[30] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[30]),
        .Q(s2mm_da[30]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[31] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[31]),
        .Q(s2mm_da[31]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[3] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[3]),
        .Q(s2mm_da[3]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[4] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[4]),
        .Q(s2mm_da[4]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[5] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[5]),
        .Q(s2mm_da[5]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[6] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[6]),
        .Q(s2mm_da[6]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[7] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[7]),
        .Q(s2mm_da[7]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[8] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[8]),
        .Q(s2mm_da[8]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_address_i_reg[9] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_address_i_reg[0]_0 ),
        .D(s_axi_lite_wdata[9]),
        .Q(s2mm_da[9]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[0] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ),
        .D(s_axi_lite_wdata[0]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[14]_0 [0]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[10] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ),
        .D(s_axi_lite_wdata[10]),
        .Q(s2mm_length[10]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[11] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ),
        .D(s_axi_lite_wdata[11]),
        .Q(s2mm_length[11]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[12] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ),
        .D(s_axi_lite_wdata[12]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[14]_0 [7]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[13] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ),
        .D(s_axi_lite_wdata[13]),
        .Q(s2mm_length[13]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[14] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ),
        .D(s_axi_lite_wdata[14]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[14]_0 [8]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[15] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ),
        .D(s_axi_lite_wdata[15]),
        .Q(s2mm_length[15]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[16] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ),
        .D(s_axi_lite_wdata[16]),
        .Q(s2mm_length[16]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[17] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ),
        .D(s_axi_lite_wdata[17]),
        .Q(s2mm_length[17]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[18] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ),
        .D(s_axi_lite_wdata[18]),
        .Q(s2mm_length[18]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[19] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ),
        .D(s_axi_lite_wdata[19]),
        .Q(s2mm_length[19]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[1] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ),
        .D(s_axi_lite_wdata[1]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[14]_0 [1]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[20] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ),
        .D(s_axi_lite_wdata[20]),
        .Q(s2mm_length[20]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[21] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ),
        .D(s_axi_lite_wdata[21]),
        .Q(s2mm_length[21]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[22] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ),
        .D(s_axi_lite_wdata[22]),
        .Q(s2mm_length[22]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[2] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ),
        .D(s_axi_lite_wdata[2]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[14]_0 [2]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[3] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ),
        .D(s_axi_lite_wdata[3]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[14]_0 [3]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[4] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ),
        .D(s_axi_lite_wdata[4]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[14]_0 [4]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[5] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ),
        .D(s_axi_lite_wdata[5]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[14]_0 [5]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[6] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ),
        .D(s_axi_lite_wdata[6]),
        .Q(\GEN_REG_FOR_SMPL.buffer_length_i_reg[14]_0 [6]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[7] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ),
        .D(s_axi_lite_wdata[7]),
        .Q(s2mm_length[7]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[8] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ),
        .D(s_axi_lite_wdata[8]),
        .Q(s2mm_length[8]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_REG_FOR_SMPL.buffer_length_i_reg[9] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_REG_FOR_SMPL.buffer_length_i_reg[22]_0 ),
        .D(s_axi_lite_wdata[9]),
        .Q(s2mm_length[9]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE \GEN_REG_FOR_SMPL.buffer_length_wren_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(buffer_length_wren0),
        .Q(s2mm_length_wren),
        .R(\dmacr_i_reg[4]_1 ));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[10]_i_3 
       (.I0(s2mm_da[42]),
        .I1(s2mm_da[10]),
        .I2(s2mm_length[10]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [1]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [0]),
        .O(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[10]_0 ));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[11]_i_3 
       (.I0(s2mm_da[43]),
        .I1(s2mm_da[11]),
        .I2(s2mm_length[11]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [1]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [0]),
        .O(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[11]_0 ));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[13]_i_3 
       (.I0(s2mm_da[45]),
        .I1(s2mm_da[13]),
        .I2(s2mm_length[13]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [1]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [0]),
        .O(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[13]_0 ));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[15]_i_4 
       (.I0(s2mm_da[47]),
        .I1(s2mm_da[15]),
        .I2(s2mm_length[15]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [1]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [0]),
        .O(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[15]_0 ));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[16]_i_3 
       (.I0(s2mm_da[48]),
        .I1(s2mm_da[16]),
        .I2(s2mm_length[16]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [1]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [0]),
        .O(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[16]_0 ));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[17]_i_3 
       (.I0(s2mm_da[49]),
        .I1(s2mm_da[17]),
        .I2(s2mm_length[17]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [1]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [0]),
        .O(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[17]_0 ));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[18]_i_3 
       (.I0(s2mm_da[50]),
        .I1(s2mm_da[18]),
        .I2(s2mm_length[18]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [1]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [0]),
        .O(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[18]_0 ));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[19]_i_3 
       (.I0(s2mm_da[51]),
        .I1(s2mm_da[19]),
        .I2(s2mm_length[19]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [1]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [0]),
        .O(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[19]_0 ));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[20]_i_3 
       (.I0(s2mm_da[52]),
        .I1(s2mm_da[20]),
        .I2(s2mm_length[20]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [1]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [0]),
        .O(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[20]_0 ));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[21]_i_3 
       (.I0(s2mm_da[53]),
        .I1(s2mm_da[21]),
        .I2(s2mm_length[21]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [1]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [0]),
        .O(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[21]_0 ));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[22]_i_5 
       (.I0(s2mm_da[54]),
        .I1(s2mm_da[22]),
        .I2(s2mm_length[22]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [1]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [0]),
        .O(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[22]_0 ));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[2]_i_3 
       (.I0(s2mm_da[34]),
        .I1(s2mm_da[2]),
        .I2(\GEN_REG_FOR_SMPL.buffer_length_i_reg[14]_0 [2]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [1]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [0]),
        .O(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[2]_0 ));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[3]_i_3 
       (.I0(s2mm_da[35]),
        .I1(s2mm_da[3]),
        .I2(\GEN_REG_FOR_SMPL.buffer_length_i_reg[14]_0 [3]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [1]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [0]),
        .O(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[3]_0 ));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[7]_i_3 
       (.I0(s2mm_da[39]),
        .I1(s2mm_da[7]),
        .I2(s2mm_length[7]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [1]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [0]),
        .O(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[7]_0 ));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[8]_i_3 
       (.I0(s2mm_da[40]),
        .I1(s2mm_da[8]),
        .I2(s2mm_length[8]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [1]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [0]),
        .O(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[8]_0 ));
  LUT5 #(
    .INIT(32'h00AAF0CC)) 
    \GEN_SYNC_READ.s_axi_lite_rdata[9]_i_3 
       (.I0(s2mm_da[41]),
        .I1(s2mm_da[9]),
        .I2(s2mm_length[9]),
        .I3(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [1]),
        .I4(\GEN_SYNC_READ.s_axi_lite_rdata_reg[2] [0]),
        .O(\GEN_REG_FOR_SMPL.GEN_BUF_ADDR_EQL64.buffer_address_64_i_reg[9]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \axi_dma_tstvec[4]_INST_0_i_1 
       (.I0(dma_s2mm_error),
        .I1(dma_mm2s_error),
        .I2(\dmacr_i_reg[2]_0 ),
        .I3(\dmacr_i_reg[2]_1 ),
        .O(mm2s_stop_i));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \axi_dma_tstvec[5]_INST_0_i_1 
       (.I0(dma_mm2s_error),
        .I1(dma_s2mm_error),
        .I2(\dmacr_i_reg[2]_0 ),
        .I3(\dmacr_i_reg[2]_1 ),
        .O(s2mm_stop_i));
  FDRE #(
    .INIT(1'b0)) 
    dma_decerr_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(dma_decerr_reg_1),
        .Q(dma_decerr_reg_0),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    dma_interr_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(dma_interr_reg_1),
        .Q(dma_interr_reg_0),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    dma_slverr_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(dma_slverr_reg_2),
        .Q(dma_slverr_reg_0),
        .R(\dmacr_i_reg[4]_1 ));
  LUT6 #(
    .INIT(64'h0000010000000000)) 
    \dmacr_i[0]_i_1 
       (.I0(dma_slverr_reg_0),
        .I1(dma_interr_reg_0),
        .I2(dma_decerr_reg_0),
        .I3(m_axi_sg_aresetn),
        .I4(\dmacr_i_reg[2]_1 ),
        .I5(\dmacr_i_reg[0]_1 ),
        .O(dma_slverr_reg_1));
  LUT6 #(
    .INIT(64'h0000010000000000)) 
    \dmacr_i[0]_i_1__0 
       (.I0(dma_slverr_reg_0),
        .I1(dma_interr_reg_0),
        .I2(dma_decerr_reg_0),
        .I3(m_axi_sg_aresetn),
        .I4(\dmacr_i_reg[2]_1 ),
        .I5(\dmacr_i[0]_i_2__0_n_0 ),
        .O(\dmacr_i[0]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h00000000000000B8)) 
    \dmacr_i[0]_i_2__0 
       (.I0(s_axi_lite_wdata[0]),
        .I1(E),
        .I2(\dmacr_i_reg[0]_0 ),
        .I3(s2mm_stop),
        .I4(\dmacr_i_reg[2]_0 ),
        .I5(mm2s_error_out),
        .O(\dmacr_i[0]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hFFEC)) 
    \dmacr_i[2]_i_2 
       (.I0(s_axi_lite_wdata[2]),
        .I1(\dmacr_i_reg[2]_0 ),
        .I2(E),
        .I3(\dmacr_i_reg[2]_1 ),
        .O(\dmacr_i[2]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[0] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\dmacr_i[0]_i_1__0_n_0 ),
        .Q(\dmacr_i_reg[0]_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[12] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[12]),
        .Q(Q[0]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[13] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[13]),
        .Q(Q[1]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[14] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[14]),
        .Q(Q[2]),
        .R(\dmacr_i_reg[4]_1 ));
  FDSE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[16] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[16]),
        .Q(\dmacr_i_reg[23]_0 [0]),
        .S(\dmacr_i_reg[23]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[17] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[17]),
        .Q(\dmacr_i_reg[23]_0 [1]),
        .R(\dmacr_i_reg[23]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[18] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[18]),
        .Q(\dmacr_i_reg[23]_0 [2]),
        .R(\dmacr_i_reg[23]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[19] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[19]),
        .Q(\dmacr_i_reg[23]_0 [3]),
        .R(\dmacr_i_reg[23]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[20] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[20]),
        .Q(\dmacr_i_reg[23]_0 [4]),
        .R(\dmacr_i_reg[23]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[21] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[21]),
        .Q(\dmacr_i_reg[23]_0 [5]),
        .R(\dmacr_i_reg[23]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[22] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[22]),
        .Q(\dmacr_i_reg[23]_0 [6]),
        .R(\dmacr_i_reg[23]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[23] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[23]),
        .Q(\dmacr_i_reg[23]_0 [7]),
        .R(\dmacr_i_reg[23]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[24] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[24]),
        .Q(\dmacr_i_reg[31]_0 [0]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[25] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[25]),
        .Q(\dmacr_i_reg[31]_0 [1]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[26] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[26]),
        .Q(\dmacr_i_reg[31]_0 [2]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[27] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[27]),
        .Q(\dmacr_i_reg[31]_0 [3]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[28] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[28]),
        .Q(\dmacr_i_reg[31]_0 [4]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[29] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[29]),
        .Q(\dmacr_i_reg[31]_0 [5]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[2] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\dmacr_i[2]_i_2_n_0 ),
        .Q(\dmacr_i_reg[2]_0 ),
        .R(soft_reset_clr));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[30] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[30]),
        .Q(\dmacr_i_reg[31]_0 [6]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[31] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[31]),
        .Q(\dmacr_i_reg[31]_0 [7]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[3] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[3]),
        .Q(\dmacr_i_reg[4]_0 [0]),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \dmacr_i_reg[4] 
       (.C(s_axi_lite_aclk),
        .CE(E),
        .D(s_axi_lite_wdata[4]),
        .Q(\dmacr_i_reg[4]_0 [1]),
        .R(\dmacr_i_reg[4]_1 ));
  LUT5 #(
    .INIT(32'h5DFF0C0C)) 
    err_irq_i_1
       (.I0(s_axi_lite_wdata[14]),
        .I1(s2mm_error_out),
        .I2(error_d1),
        .I3(ioc_irq_reg_1),
        .I4(err_irq_reg_0),
        .O(err_irq_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    err_irq_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(err_irq_i_1_n_0),
        .Q(err_irq_reg_0),
        .R(\dmacr_i_reg[4]_1 ));
  LUT3 #(
    .INIT(8'hFE)) 
    error_d1_i_1__0
       (.I0(dma_slverr_reg_0),
        .I1(dma_interr_reg_0),
        .I2(dma_decerr_reg_0),
        .O(s2mm_error_out));
  FDRE #(
    .INIT(1'b0)) 
    error_d1_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s2mm_error_out),
        .Q(error_d1),
        .R(\dmacr_i_reg[4]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    halted_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(halted_reg_0),
        .Q(s2mm_dmasr),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    idle_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(idle_reg_1),
        .Q(idle_reg_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h4444400040004000)) 
    introut_i_1
       (.I0(\dmacr_i_reg[2]_0 ),
        .I1(m_axi_sg_aresetn),
        .I2(ioc_irq_reg_0),
        .I3(Q[0]),
        .I4(err_irq_reg_0),
        .I5(Q[2]),
        .O(introut_i_1_n_0));
  FDRE introut_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(introut_i_1_n_0),
        .Q(s2mm_introut),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hF7F0)) 
    ioc_irq_i_1
       (.I0(s_axi_lite_wdata[12]),
        .I1(ioc_irq_reg_1),
        .I2(axi_dma_tstvec),
        .I3(ioc_irq_reg_0),
        .O(ioc_irq_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ioc_irq_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(ioc_irq_i_1_n_0),
        .Q(ioc_irq_reg_0),
        .R(\dmacr_i_reg[4]_1 ));
  LUT4 #(
    .INIT(16'h4500)) 
    s2mm_halted_set_i_1
       (.I0(\dmacr_i_reg[0]_0 ),
        .I1(s2mm_halt_cmplt),
        .I2(s2mm_stop_i),
        .I3(s2mm_all_idle),
        .O(s2mm_halted_set0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h0E)) 
    soft_reset_re_i_1
       (.I0(\dmacr_i_reg[2]_0 ),
        .I1(\dmacr_i_reg[2]_1 ),
        .I2(soft_reset_d1),
        .O(soft_reset_re0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_reset
   (out,
    \GNE_SYNC_RESET.prmry_resetn_reg_0 ,
    \GNE_SYNC_RESET.s_soft_reset_i_reg_0 ,
    mm2s_prmry_reset_out_n,
    mm2s_cntrl_reset_out_n,
    soft_reset_d1,
    soft_reset_re,
    \GNE_SYNC_RESET.scndry_resetn_reg_0 ,
    \GNE_SYNC_RESET.scndry_resetn_reg_1 ,
    m_axi_sg_aresetn,
    \GNE_SYNC_RESET.scndry_resetn_reg_2 ,
    assert_sftrst_d1_reg_0,
    \GNE_SYNC_RESET.halt_i_reg_0 ,
    s_axi_lite_aclk,
    mm2s_all_idle,
    soft_reset,
    soft_reset_re0,
    dest_rst,
    mm2s_halt_cmplt,
    s2mm_soft_reset_done,
    mm2s_soft_reset_done,
    halted_reg,
    s2mm_halted_set,
    s2mm_halted_clr,
    s2mm_dmasr,
    mm2s_halted_set,
    mm2s_halted_clr,
    mm2s_dmasr,
    mm2s_stop,
    sig_rst2all_stop_request);
  output out;
  output \GNE_SYNC_RESET.prmry_resetn_reg_0 ;
  output \GNE_SYNC_RESET.s_soft_reset_i_reg_0 ;
  output mm2s_prmry_reset_out_n;
  output mm2s_cntrl_reset_out_n;
  output soft_reset_d1;
  output soft_reset_re;
  output \GNE_SYNC_RESET.scndry_resetn_reg_0 ;
  output \GNE_SYNC_RESET.scndry_resetn_reg_1 ;
  output m_axi_sg_aresetn;
  output \GNE_SYNC_RESET.scndry_resetn_reg_2 ;
  output assert_sftrst_d1_reg_0;
  output \GNE_SYNC_RESET.halt_i_reg_0 ;
  input s_axi_lite_aclk;
  input mm2s_all_idle;
  input soft_reset;
  input soft_reset_re0;
  input dest_rst;
  input mm2s_halt_cmplt;
  input s2mm_soft_reset_done;
  input mm2s_soft_reset_done;
  input halted_reg;
  input s2mm_halted_set;
  input s2mm_halted_clr;
  input [0:0]s2mm_dmasr;
  input mm2s_halted_set;
  input mm2s_halted_clr;
  input [0:0]mm2s_dmasr;
  input mm2s_stop;
  input sig_rst2all_stop_request;

  wire \GNE_SYNC_RESET.halt_i_i_1_n_0 ;
  wire \GNE_SYNC_RESET.halt_i_reg_0 ;
  wire \GNE_SYNC_RESET.min_assert_sftrst_i_1_n_0 ;
  wire \GNE_SYNC_RESET.prmry_reset_out_n_reg0 ;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire \GNE_SYNC_RESET.prmry_resetn_reg_0 ;
  wire \GNE_SYNC_RESET.s_soft_reset_i_i_1_n_0 ;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire \GNE_SYNC_RESET.s_soft_reset_i_reg_0 ;
  wire \GNE_SYNC_RESET.scndry_resetn_reg_0 ;
  wire \GNE_SYNC_RESET.scndry_resetn_reg_1 ;
  wire \GNE_SYNC_RESET.scndry_resetn_reg_2 ;
  wire assert_sftrst_d1;
  wire assert_sftrst_d1_reg_0;
  wire dest_rst;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire dm_mm2s_scndry_resetn;
  wire halted_reg;
  wire m_axi_sg_aresetn;
  wire min_assert_sftrst;
  wire mm2s_all_idle;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire mm2s_cntrl_reset_out_n;
  wire [0:0]mm2s_dmasr;
  wire mm2s_halt;
  wire mm2s_halt_cmplt;
  wire mm2s_halted_clr;
  wire mm2s_halted_set;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire mm2s_prmry_reset_out_n;
  wire mm2s_soft_reset_done;
  wire mm2s_stop;
  wire n_0_642;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire out;
  wire [0:0]s2mm_dmasr;
  wire s2mm_halted_clr;
  wire s2mm_halted_set;
  wire s2mm_soft_reset_done;
  wire s_axi_lite_aclk;
  wire s_soft_reset_i;
  wire s_soft_reset_i_d1;
  wire s_soft_reset_i_re;
  wire sft_rst_dly1;
  wire sft_rst_dly2;
  wire sft_rst_dly3;
  wire sft_rst_dly4;
  wire sft_rst_dly5;
  wire sft_rst_dly6;
  wire sft_rst_dly7;
  wire sig_rst2all_stop_request;
  wire soft_reset;
  wire soft_reset_d1;
  wire soft_reset_re;
  wire soft_reset_re0;

  LUT1 #(
    .INIT(2'h1)) 
    \FSM_sequential_smpl_cs[1]_i_1 
       (.I0(out),
        .O(\GNE_SYNC_RESET.scndry_resetn_reg_2 ));
  LUT2 #(
    .INIT(4'hE)) 
    \GEN_MM2S_BASIC.I_MM2S_BASIC_WRAPPER/I_RESET/sig_s_h_halt_reg_i_1 
       (.I0(mm2s_halt),
        .I1(sig_rst2all_stop_request),
        .O(\GNE_SYNC_RESET.halt_i_reg_0 ));
  LUT3 #(
    .INIT(8'hF2)) 
    \GEN_RESET_FOR_MM2S.mm2s_soft_reset_done_i_2 
       (.I0(assert_sftrst_d1),
        .I1(min_assert_sftrst),
        .I2(mm2s_soft_reset_done),
        .O(assert_sftrst_d1_reg_0));
  LUT6 #(
    .INIT(64'h0404040404040400)) 
    \GNE_SYNC_RESET.halt_i_i_1 
       (.I0(min_assert_sftrst),
        .I1(dest_rst),
        .I2(s_soft_reset_i),
        .I3(mm2s_halt),
        .I4(soft_reset_re),
        .I5(mm2s_stop),
        .O(\GNE_SYNC_RESET.halt_i_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GNE_SYNC_RESET.halt_i_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GNE_SYNC_RESET.halt_i_i_1_n_0 ),
        .Q(mm2s_halt),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT4 #(
    .INIT(16'h4F44)) 
    \GNE_SYNC_RESET.min_assert_sftrst_i_1 
       (.I0(sft_rst_dly7),
        .I1(min_assert_sftrst),
        .I2(s_soft_reset_i_d1),
        .I3(s_soft_reset_i),
        .O(\GNE_SYNC_RESET.min_assert_sftrst_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GNE_SYNC_RESET.min_assert_sftrst_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GNE_SYNC_RESET.min_assert_sftrst_i_1_n_0 ),
        .Q(min_assert_sftrst),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \GNE_SYNC_RESET.prmry_reset_out_n_i_1 
       (.I0(min_assert_sftrst),
        .I1(dest_rst),
        .I2(s_soft_reset_i),
        .O(\GNE_SYNC_RESET.prmry_reset_out_n_reg0 ));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    \GNE_SYNC_RESET.prmry_reset_out_n_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GNE_SYNC_RESET.prmry_reset_out_n_reg0 ),
        .Q(mm2s_prmry_reset_out_n),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GNE_SYNC_RESET.prmry_resetn_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(dm_mm2s_scndry_resetn),
        .Q(\GNE_SYNC_RESET.prmry_resetn_reg_0 ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h80FFFFFF80808080)) 
    \GNE_SYNC_RESET.s_soft_reset_i_i_1 
       (.I0(mm2s_all_idle),
        .I1(soft_reset),
        .I2(mm2s_halt_cmplt),
        .I3(s2mm_soft_reset_done),
        .I4(mm2s_soft_reset_done),
        .I5(s_soft_reset_i),
        .O(\GNE_SYNC_RESET.s_soft_reset_i_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GNE_SYNC_RESET.s_soft_reset_i_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GNE_SYNC_RESET.s_soft_reset_i_i_1_n_0 ),
        .Q(s_soft_reset_i),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    \GNE_SYNC_RESET.scndry_resetn_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(dm_mm2s_scndry_resetn),
        .Q(out),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \GNE_SYNC_RESET.sft_rst_dly1_i_1 
       (.I0(s_soft_reset_i),
        .I1(s_soft_reset_i_d1),
        .O(s_soft_reset_i_re));
  FDSE #(
    .INIT(1'b0)) 
    \GNE_SYNC_RESET.sft_rst_dly1_reg 
       (.C(s_axi_lite_aclk),
        .CE(mm2s_all_idle),
        .D(1'b0),
        .Q(sft_rst_dly1),
        .S(s_soft_reset_i_re));
  FDRE #(
    .INIT(1'b0)) 
    \GNE_SYNC_RESET.sft_rst_dly2_reg 
       (.C(s_axi_lite_aclk),
        .CE(mm2s_all_idle),
        .D(sft_rst_dly1),
        .Q(sft_rst_dly2),
        .R(s_soft_reset_i_re));
  FDRE #(
    .INIT(1'b0)) 
    \GNE_SYNC_RESET.sft_rst_dly3_reg 
       (.C(s_axi_lite_aclk),
        .CE(mm2s_all_idle),
        .D(sft_rst_dly2),
        .Q(sft_rst_dly3),
        .R(s_soft_reset_i_re));
  FDRE #(
    .INIT(1'b0)) 
    \GNE_SYNC_RESET.sft_rst_dly4_reg 
       (.C(s_axi_lite_aclk),
        .CE(mm2s_all_idle),
        .D(sft_rst_dly3),
        .Q(sft_rst_dly4),
        .R(s_soft_reset_i_re));
  FDRE #(
    .INIT(1'b0)) 
    \GNE_SYNC_RESET.sft_rst_dly5_reg 
       (.C(s_axi_lite_aclk),
        .CE(mm2s_all_idle),
        .D(sft_rst_dly4),
        .Q(sft_rst_dly5),
        .R(s_soft_reset_i_re));
  FDRE #(
    .INIT(1'b0)) 
    \GNE_SYNC_RESET.sft_rst_dly6_reg 
       (.C(s_axi_lite_aclk),
        .CE(mm2s_all_idle),
        .D(sft_rst_dly5),
        .Q(sft_rst_dly6),
        .R(s_soft_reset_i_re));
  FDRE #(
    .INIT(1'b0)) 
    \GNE_SYNC_RESET.sft_rst_dly7_reg 
       (.C(s_axi_lite_aclk),
        .CE(mm2s_all_idle),
        .D(sft_rst_dly6),
        .Q(sft_rst_dly7),
        .R(s_soft_reset_i_re));
  FDRE #(
    .INIT(1'b0)) 
    assert_sftrst_d1_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(min_assert_sftrst),
        .Q(assert_sftrst_d1),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h2)) 
    dm_prmry_resetn_inst
       (.I0(dm_mm2s_scndry_resetn),
        .O(\GNE_SYNC_RESET.s_soft_reset_i_reg_0 ));
  LUT5 #(
    .INIT(32'hF1FFF1F1)) 
    halted_i_1
       (.I0(out),
        .I1(halted_reg),
        .I2(s2mm_halted_set),
        .I3(s2mm_halted_clr),
        .I4(s2mm_dmasr),
        .O(\GNE_SYNC_RESET.scndry_resetn_reg_0 ));
  LUT5 #(
    .INIT(32'hF1FFF1F1)) 
    halted_i_1__0
       (.I0(out),
        .I1(halted_reg),
        .I2(mm2s_halted_set),
        .I3(mm2s_halted_clr),
        .I4(mm2s_dmasr),
        .O(\GNE_SYNC_RESET.scndry_resetn_reg_1 ));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b1),
        .O(mm2s_cntrl_reset_out_n));
  LUT1 #(
    .INIT(2'h1)) 
    i_642
       (.I0(out),
        .O(n_0_642));
  LUT2 #(
    .INIT(4'hE)) 
    introut_i_2
       (.I0(out),
        .I1(halted_reg),
        .O(m_axi_sg_aresetn));
  LUT3 #(
    .INIT(8'h04)) 
    resetn_i
       (.I0(s_soft_reset_i),
        .I1(dest_rst),
        .I2(min_assert_sftrst),
        .O(dm_mm2s_scndry_resetn));
  FDRE #(
    .INIT(1'b0)) 
    s_soft_reset_i_d1_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s_soft_reset_i),
        .Q(s_soft_reset_i_d1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    soft_reset_d1_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(soft_reset),
        .Q(soft_reset_d1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    soft_reset_re_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(soft_reset_re0),
        .Q(soft_reset_re),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_dma_reset" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_reset_1
   (out,
    \GNE_SYNC_RESET.prmry_resetn_reg_0 ,
    \GNE_SYNC_RESET.s_soft_reset_i_reg_0 ,
    s2mm_prmry_reset_out_n,
    s2mm_sts_reset_out_n,
    \GEN_SYNC_WRITE.axi2ip_wrce_reg[12] ,
    SS,
    \GNE_SYNC_RESET.scndry_resetn_reg_0 ,
    \GNE_SYNC_RESET.scndry_resetn_reg_1 ,
    assert_sftrst_d1_reg_0,
    \GNE_SYNC_RESET.halt_i_reg_0 ,
    s_axi_lite_aclk,
    s2mm_all_idle,
    dest_rst,
    soft_reset,
    s2mm_halt_cmplt,
    s2mm_soft_reset_done,
    mm2s_soft_reset_done,
    threshold_is_zero,
    \dmacr_i_reg[23] ,
    \dmacr_i_reg[4] ,
    soft_reset_re,
    s2mm_stop,
    sig_s_h_halt_reg);
  output out;
  output \GNE_SYNC_RESET.prmry_resetn_reg_0 ;
  output \GNE_SYNC_RESET.s_soft_reset_i_reg_0 ;
  output s2mm_prmry_reset_out_n;
  output s2mm_sts_reset_out_n;
  output [0:0]\GEN_SYNC_WRITE.axi2ip_wrce_reg[12] ;
  output [0:0]SS;
  output [0:0]\GNE_SYNC_RESET.scndry_resetn_reg_0 ;
  output \GNE_SYNC_RESET.scndry_resetn_reg_1 ;
  output assert_sftrst_d1_reg_0;
  output \GNE_SYNC_RESET.halt_i_reg_0 ;
  input s_axi_lite_aclk;
  input s2mm_all_idle;
  input dest_rst;
  input soft_reset;
  input s2mm_halt_cmplt;
  input s2mm_soft_reset_done;
  input mm2s_soft_reset_done;
  input threshold_is_zero;
  input [1:0]\dmacr_i_reg[23] ;
  input \dmacr_i_reg[4] ;
  input soft_reset_re;
  input s2mm_stop;
  input sig_s_h_halt_reg;

  wire [0:0]\GEN_SYNC_WRITE.axi2ip_wrce_reg[12] ;
  wire \GNE_SYNC_RESET.halt_i_i_1__0_n_0 ;
  wire \GNE_SYNC_RESET.halt_i_reg_0 ;
  wire \GNE_SYNC_RESET.min_assert_sftrst_i_1_n_0 ;
  wire \GNE_SYNC_RESET.prmry_reset_out_n_reg0 ;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire \GNE_SYNC_RESET.prmry_resetn_reg_0 ;
  wire \GNE_SYNC_RESET.s_soft_reset_i_i_1__0_n_0 ;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire \GNE_SYNC_RESET.s_soft_reset_i_reg_0 ;
  wire [0:0]\GNE_SYNC_RESET.scndry_resetn_reg_0 ;
  wire \GNE_SYNC_RESET.scndry_resetn_reg_1 ;
  wire \GNE_SYNC_RESET.sft_rst_dly1_reg_n_0 ;
  wire \GNE_SYNC_RESET.sft_rst_dly2_reg_n_0 ;
  wire \GNE_SYNC_RESET.sft_rst_dly3_reg_n_0 ;
  wire \GNE_SYNC_RESET.sft_rst_dly4_reg_n_0 ;
  wire \GNE_SYNC_RESET.sft_rst_dly5_reg_n_0 ;
  wire \GNE_SYNC_RESET.sft_rst_dly6_reg_n_0 ;
  wire \GNE_SYNC_RESET.sft_rst_dly7_reg_n_0 ;
  wire [0:0]SS;
  wire assert_sftrst_d1;
  wire assert_sftrst_d1_reg_0;
  wire dest_rst;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire dm_s2mm_scndry_resetn;
  wire [1:0]\dmacr_i_reg[23] ;
  wire \dmacr_i_reg[4] ;
  wire min_assert_sftrst;
  wire mm2s_soft_reset_done;
  wire n_0_644;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire out;
  wire s2mm_all_idle;
  wire s2mm_halt;
  wire s2mm_halt_cmplt;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire s2mm_prmry_reset_out_n;
  wire s2mm_soft_reset_done;
  wire s2mm_stop;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire s2mm_sts_reset_out_n;
  wire s_axi_lite_aclk;
  wire s_soft_reset_i;
  wire s_soft_reset_i_d1;
  wire s_soft_reset_i_re;
  wire sig_s_h_halt_reg;
  wire soft_reset;
  wire soft_reset_re;
  wire threshold_is_zero;

  LUT1 #(
    .INIT(2'h1)) 
    \FSM_sequential_smpl_cs[1]_i_1__0 
       (.I0(out),
        .O(\GNE_SYNC_RESET.scndry_resetn_reg_1 ));
  LUT3 #(
    .INIT(8'hF2)) 
    \GEN_RESET_FOR_S2MM.s2mm_soft_reset_done_i_1 
       (.I0(assert_sftrst_d1),
        .I1(min_assert_sftrst),
        .I2(s2mm_soft_reset_done),
        .O(assert_sftrst_d1_reg_0));
  LUT2 #(
    .INIT(4'hE)) 
    \GEN_S2MM_BASIC.I_S2MM_BASIC_WRAPPER/I_RESET/sig_s_h_halt_reg_i_1 
       (.I0(s2mm_halt),
        .I1(sig_s_h_halt_reg),
        .O(\GNE_SYNC_RESET.halt_i_reg_0 ));
  LUT6 #(
    .INIT(64'h0404040404040400)) 
    \GNE_SYNC_RESET.halt_i_i_1__0 
       (.I0(min_assert_sftrst),
        .I1(dest_rst),
        .I2(s_soft_reset_i),
        .I3(s2mm_halt),
        .I4(soft_reset_re),
        .I5(s2mm_stop),
        .O(\GNE_SYNC_RESET.halt_i_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GNE_SYNC_RESET.halt_i_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GNE_SYNC_RESET.halt_i_i_1__0_n_0 ),
        .Q(s2mm_halt),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT4 #(
    .INIT(16'h4F44)) 
    \GNE_SYNC_RESET.min_assert_sftrst_i_1 
       (.I0(\GNE_SYNC_RESET.sft_rst_dly7_reg_n_0 ),
        .I1(min_assert_sftrst),
        .I2(s_soft_reset_i_d1),
        .I3(s_soft_reset_i),
        .O(\GNE_SYNC_RESET.min_assert_sftrst_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GNE_SYNC_RESET.min_assert_sftrst_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GNE_SYNC_RESET.min_assert_sftrst_i_1_n_0 ),
        .Q(min_assert_sftrst),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \GNE_SYNC_RESET.prmry_reset_out_n_i_1__0 
       (.I0(min_assert_sftrst),
        .I1(dest_rst),
        .I2(s_soft_reset_i),
        .O(\GNE_SYNC_RESET.prmry_reset_out_n_reg0 ));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    \GNE_SYNC_RESET.prmry_reset_out_n_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GNE_SYNC_RESET.prmry_reset_out_n_reg0 ),
        .Q(s2mm_prmry_reset_out_n),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GNE_SYNC_RESET.prmry_resetn_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(dm_s2mm_scndry_resetn),
        .Q(\GNE_SYNC_RESET.prmry_resetn_reg_0 ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h80FFFFFF80808080)) 
    \GNE_SYNC_RESET.s_soft_reset_i_i_1__0 
       (.I0(s2mm_all_idle),
        .I1(soft_reset),
        .I2(s2mm_halt_cmplt),
        .I3(s2mm_soft_reset_done),
        .I4(mm2s_soft_reset_done),
        .I5(s_soft_reset_i),
        .O(\GNE_SYNC_RESET.s_soft_reset_i_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GNE_SYNC_RESET.s_soft_reset_i_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GNE_SYNC_RESET.s_soft_reset_i_i_1__0_n_0 ),
        .Q(s_soft_reset_i),
        .R(1'b0));
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    \GNE_SYNC_RESET.scndry_resetn_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(dm_s2mm_scndry_resetn),
        .Q(out),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \GNE_SYNC_RESET.sft_rst_dly1_i_1__0 
       (.I0(s_soft_reset_i),
        .I1(s_soft_reset_i_d1),
        .O(s_soft_reset_i_re));
  FDSE #(
    .INIT(1'b0)) 
    \GNE_SYNC_RESET.sft_rst_dly1_reg 
       (.C(s_axi_lite_aclk),
        .CE(s2mm_all_idle),
        .D(1'b0),
        .Q(\GNE_SYNC_RESET.sft_rst_dly1_reg_n_0 ),
        .S(s_soft_reset_i_re));
  FDRE #(
    .INIT(1'b0)) 
    \GNE_SYNC_RESET.sft_rst_dly2_reg 
       (.C(s_axi_lite_aclk),
        .CE(s2mm_all_idle),
        .D(\GNE_SYNC_RESET.sft_rst_dly1_reg_n_0 ),
        .Q(\GNE_SYNC_RESET.sft_rst_dly2_reg_n_0 ),
        .R(s_soft_reset_i_re));
  FDRE #(
    .INIT(1'b0)) 
    \GNE_SYNC_RESET.sft_rst_dly3_reg 
       (.C(s_axi_lite_aclk),
        .CE(s2mm_all_idle),
        .D(\GNE_SYNC_RESET.sft_rst_dly2_reg_n_0 ),
        .Q(\GNE_SYNC_RESET.sft_rst_dly3_reg_n_0 ),
        .R(s_soft_reset_i_re));
  FDRE #(
    .INIT(1'b0)) 
    \GNE_SYNC_RESET.sft_rst_dly4_reg 
       (.C(s_axi_lite_aclk),
        .CE(s2mm_all_idle),
        .D(\GNE_SYNC_RESET.sft_rst_dly3_reg_n_0 ),
        .Q(\GNE_SYNC_RESET.sft_rst_dly4_reg_n_0 ),
        .R(s_soft_reset_i_re));
  FDRE #(
    .INIT(1'b0)) 
    \GNE_SYNC_RESET.sft_rst_dly5_reg 
       (.C(s_axi_lite_aclk),
        .CE(s2mm_all_idle),
        .D(\GNE_SYNC_RESET.sft_rst_dly4_reg_n_0 ),
        .Q(\GNE_SYNC_RESET.sft_rst_dly5_reg_n_0 ),
        .R(s_soft_reset_i_re));
  FDRE #(
    .INIT(1'b0)) 
    \GNE_SYNC_RESET.sft_rst_dly6_reg 
       (.C(s_axi_lite_aclk),
        .CE(s2mm_all_idle),
        .D(\GNE_SYNC_RESET.sft_rst_dly5_reg_n_0 ),
        .Q(\GNE_SYNC_RESET.sft_rst_dly6_reg_n_0 ),
        .R(s_soft_reset_i_re));
  FDRE #(
    .INIT(1'b0)) 
    \GNE_SYNC_RESET.sft_rst_dly7_reg 
       (.C(s_axi_lite_aclk),
        .CE(s2mm_all_idle),
        .D(\GNE_SYNC_RESET.sft_rst_dly6_reg_n_0 ),
        .Q(\GNE_SYNC_RESET.sft_rst_dly7_reg_n_0 ),
        .R(s_soft_reset_i_re));
  FDRE #(
    .INIT(1'b0)) 
    assert_sftrst_d1_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(min_assert_sftrst),
        .Q(assert_sftrst_d1),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h2)) 
    dm_prmry_resetn_inst
       (.I0(dm_s2mm_scndry_resetn),
        .O(\GNE_SYNC_RESET.s_soft_reset_i_reg_0 ));
  LUT4 #(
    .INIT(16'h888F)) 
    \dmacr_i[23]_i_1 
       (.I0(threshold_is_zero),
        .I1(\dmacr_i_reg[23] [1]),
        .I2(out),
        .I3(\dmacr_i_reg[4] ),
        .O(\GEN_SYNC_WRITE.axi2ip_wrce_reg[12] ));
  LUT4 #(
    .INIT(16'h888F)) 
    \dmacr_i[23]_i_1__0 
       (.I0(threshold_is_zero),
        .I1(\dmacr_i_reg[23] [0]),
        .I2(out),
        .I3(\dmacr_i_reg[4] ),
        .O(SS));
  LUT2 #(
    .INIT(4'h1)) 
    \dmacr_i[4]_i_1 
       (.I0(out),
        .I1(\dmacr_i_reg[4] ),
        .O(\GNE_SYNC_RESET.scndry_resetn_reg_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b1),
        .O(s2mm_sts_reset_out_n));
  LUT1 #(
    .INIT(2'h1)) 
    i_644
       (.I0(out),
        .O(n_0_644));
  LUT3 #(
    .INIT(8'h04)) 
    resetn_i
       (.I0(s_soft_reset_i),
        .I1(dest_rst),
        .I2(min_assert_sftrst),
        .O(dm_s2mm_scndry_resetn));
  FDRE #(
    .INIT(1'b0)) 
    s_soft_reset_i_d1_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s_soft_reset_i),
        .Q(s_soft_reset_i_d1),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_rst_module
   (out,
    \GNE_SYNC_RESET.prmry_resetn_reg ,
    \GNE_SYNC_RESET.s_soft_reset_i_reg ,
    mm2s_prmry_reset_out_n,
    mm2s_cntrl_reset_out_n,
    \GNE_SYNC_RESET.scndry_resetn_reg ,
    \GNE_SYNC_RESET.prmry_resetn_reg_0 ,
    \GNE_SYNC_RESET.s_soft_reset_i_reg_0 ,
    s2mm_prmry_reset_out_n,
    s2mm_sts_reset_out_n,
    \syncstages_ff_reg[3] ,
    soft_reset_d1,
    \GEN_SYNC_WRITE.axi2ip_wrce_reg[12] ,
    SS,
    \GNE_SYNC_RESET.scndry_resetn_reg_0 ,
    \GNE_SYNC_RESET.scndry_resetn_reg_1 ,
    \GNE_SYNC_RESET.scndry_resetn_reg_2 ,
    m_axi_sg_aresetn,
    \GNE_SYNC_RESET.scndry_resetn_reg_3 ,
    \GNE_SYNC_RESET.scndry_resetn_reg_4 ,
    SR,
    \GNE_SYNC_RESET.halt_i_reg ,
    \GNE_SYNC_RESET.halt_i_reg_0 ,
    soft_reset_clr,
    axi_resetn,
    s_axi_lite_aclk,
    mm2s_all_idle,
    soft_reset,
    soft_reset_re0,
    s2mm_all_idle,
    mm2s_halt_cmplt,
    s2mm_halt_cmplt,
    threshold_is_zero,
    \dmacr_i_reg[23] ,
    s2mm_halted_set,
    s2mm_halted_clr,
    s2mm_dmasr,
    mm2s_halted_set,
    mm2s_halted_clr,
    mm2s_dmasr,
    mm2s_stop,
    s2mm_stop,
    sig_rst2all_stop_request,
    sig_s_h_halt_reg);
  output out;
  output \GNE_SYNC_RESET.prmry_resetn_reg ;
  output \GNE_SYNC_RESET.s_soft_reset_i_reg ;
  output mm2s_prmry_reset_out_n;
  output mm2s_cntrl_reset_out_n;
  output \GNE_SYNC_RESET.scndry_resetn_reg ;
  output \GNE_SYNC_RESET.prmry_resetn_reg_0 ;
  output \GNE_SYNC_RESET.s_soft_reset_i_reg_0 ;
  output s2mm_prmry_reset_out_n;
  output s2mm_sts_reset_out_n;
  output \syncstages_ff_reg[3] ;
  output soft_reset_d1;
  output [0:0]\GEN_SYNC_WRITE.axi2ip_wrce_reg[12] ;
  output [0:0]SS;
  output \GNE_SYNC_RESET.scndry_resetn_reg_0 ;
  output \GNE_SYNC_RESET.scndry_resetn_reg_1 ;
  output [0:0]\GNE_SYNC_RESET.scndry_resetn_reg_2 ;
  output m_axi_sg_aresetn;
  output \GNE_SYNC_RESET.scndry_resetn_reg_3 ;
  output \GNE_SYNC_RESET.scndry_resetn_reg_4 ;
  output [0:0]SR;
  output \GNE_SYNC_RESET.halt_i_reg ;
  output \GNE_SYNC_RESET.halt_i_reg_0 ;
  output soft_reset_clr;
  input axi_resetn;
  input s_axi_lite_aclk;
  input mm2s_all_idle;
  input soft_reset;
  input soft_reset_re0;
  input s2mm_all_idle;
  input mm2s_halt_cmplt;
  input s2mm_halt_cmplt;
  input threshold_is_zero;
  input [1:0]\dmacr_i_reg[23] ;
  input s2mm_halted_set;
  input s2mm_halted_clr;
  input [0:0]s2mm_dmasr;
  input mm2s_halted_set;
  input mm2s_halted_clr;
  input [0:0]mm2s_dmasr;
  input mm2s_stop;
  input s2mm_stop;
  input sig_rst2all_stop_request;
  input sig_s_h_halt_reg;

  wire \GEN_RESET_FOR_MM2S.RESET_I_n_11 ;
  wire \GEN_RESET_FOR_S2MM.RESET_I_n_9 ;
  wire [0:0]\GEN_SYNC_WRITE.axi2ip_wrce_reg[12] ;
  wire \GNE_SYNC_RESET.halt_i_reg ;
  wire \GNE_SYNC_RESET.halt_i_reg_0 ;
  wire \GNE_SYNC_RESET.prmry_resetn_reg ;
  wire \GNE_SYNC_RESET.prmry_resetn_reg_0 ;
  wire \GNE_SYNC_RESET.s_soft_reset_i_reg ;
  wire \GNE_SYNC_RESET.s_soft_reset_i_reg_0 ;
  wire \GNE_SYNC_RESET.scndry_resetn_reg ;
  wire \GNE_SYNC_RESET.scndry_resetn_reg_0 ;
  wire \GNE_SYNC_RESET.scndry_resetn_reg_1 ;
  wire [0:0]\GNE_SYNC_RESET.scndry_resetn_reg_2 ;
  wire \GNE_SYNC_RESET.scndry_resetn_reg_3 ;
  wire \GNE_SYNC_RESET.scndry_resetn_reg_4 ;
  wire [0:0]SR;
  wire [0:0]SS;
  wire axi_resetn;
  wire [1:0]\dmacr_i_reg[23] ;
  wire m_axi_sg_aresetn;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire m_axi_sg_hrdresetn;
  wire mm2s_all_idle;
  wire mm2s_cntrl_reset_out_n;
  wire [0:0]mm2s_dmasr;
  wire mm2s_halt_cmplt;
  wire mm2s_halted_clr;
  wire mm2s_halted_set;
  wire mm2s_prmry_reset_out_n;
  wire mm2s_soft_reset_done;
  wire mm2s_soft_reset_done0;
  wire mm2s_stop;
  wire out;
  wire s2mm_all_idle;
  wire [0:0]s2mm_dmasr;
  wire s2mm_halt_cmplt;
  wire s2mm_halted_clr;
  wire s2mm_halted_set;
  wire s2mm_prmry_reset_out_n;
  wire s2mm_soft_reset_done;
  wire s2mm_stop;
  wire s2mm_sts_reset_out_n;
  wire s_axi_lite_aclk;
  wire sig_rst2all_stop_request;
  wire sig_s_h_halt_reg;
  wire soft_reset;
  wire soft_reset_clr;
  wire soft_reset_d1;
  wire soft_reset_re;
  wire soft_reset_re0;
  (* RTL_KEEP = "true" *) (* equivalent_register_removal = "no" *) wire \syncstages_ff_reg[3] ;
  wire threshold_is_zero;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_reset \GEN_RESET_FOR_MM2S.RESET_I 
       (.\GNE_SYNC_RESET.halt_i_reg_0 (\GNE_SYNC_RESET.halt_i_reg ),
        .\GNE_SYNC_RESET.prmry_resetn_reg_0 (\GNE_SYNC_RESET.prmry_resetn_reg ),
        .\GNE_SYNC_RESET.s_soft_reset_i_reg_0 (\GNE_SYNC_RESET.s_soft_reset_i_reg ),
        .\GNE_SYNC_RESET.scndry_resetn_reg_0 (\GNE_SYNC_RESET.scndry_resetn_reg_0 ),
        .\GNE_SYNC_RESET.scndry_resetn_reg_1 (\GNE_SYNC_RESET.scndry_resetn_reg_1 ),
        .\GNE_SYNC_RESET.scndry_resetn_reg_2 (\GNE_SYNC_RESET.scndry_resetn_reg_3 ),
        .assert_sftrst_d1_reg_0(\GEN_RESET_FOR_MM2S.RESET_I_n_11 ),
        .dest_rst(m_axi_sg_hrdresetn),
        .halted_reg(\GNE_SYNC_RESET.scndry_resetn_reg ),
        .m_axi_sg_aresetn(m_axi_sg_aresetn),
        .mm2s_all_idle(mm2s_all_idle),
        .mm2s_cntrl_reset_out_n(mm2s_cntrl_reset_out_n),
        .mm2s_dmasr(mm2s_dmasr),
        .mm2s_halt_cmplt(mm2s_halt_cmplt),
        .mm2s_halted_clr(mm2s_halted_clr),
        .mm2s_halted_set(mm2s_halted_set),
        .mm2s_prmry_reset_out_n(mm2s_prmry_reset_out_n),
        .mm2s_soft_reset_done(mm2s_soft_reset_done),
        .mm2s_stop(mm2s_stop),
        .out(out),
        .s2mm_dmasr(s2mm_dmasr),
        .s2mm_halted_clr(s2mm_halted_clr),
        .s2mm_halted_set(s2mm_halted_set),
        .s2mm_soft_reset_done(s2mm_soft_reset_done),
        .s_axi_lite_aclk(s_axi_lite_aclk),
        .sig_rst2all_stop_request(sig_rst2all_stop_request),
        .soft_reset(soft_reset),
        .soft_reset_d1(soft_reset_d1),
        .soft_reset_re(soft_reset_re),
        .soft_reset_re0(soft_reset_re0));
  LUT3 #(
    .INIT(8'h8F)) 
    \GEN_RESET_FOR_MM2S.mm2s_soft_reset_done_i_1 
       (.I0(mm2s_soft_reset_done),
        .I1(s2mm_soft_reset_done),
        .I2(m_axi_sg_hrdresetn),
        .O(mm2s_soft_reset_done0));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RESET_FOR_MM2S.mm2s_soft_reset_done_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_RESET_FOR_MM2S.RESET_I_n_11 ),
        .Q(mm2s_soft_reset_done),
        .R(mm2s_soft_reset_done0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_reset_1 \GEN_RESET_FOR_S2MM.RESET_I 
       (.\GEN_SYNC_WRITE.axi2ip_wrce_reg[12] (\GEN_SYNC_WRITE.axi2ip_wrce_reg[12] ),
        .\GNE_SYNC_RESET.halt_i_reg_0 (\GNE_SYNC_RESET.halt_i_reg_0 ),
        .\GNE_SYNC_RESET.prmry_resetn_reg_0 (\GNE_SYNC_RESET.prmry_resetn_reg_0 ),
        .\GNE_SYNC_RESET.s_soft_reset_i_reg_0 (\GNE_SYNC_RESET.s_soft_reset_i_reg_0 ),
        .\GNE_SYNC_RESET.scndry_resetn_reg_0 (\GNE_SYNC_RESET.scndry_resetn_reg_2 ),
        .\GNE_SYNC_RESET.scndry_resetn_reg_1 (\GNE_SYNC_RESET.scndry_resetn_reg_4 ),
        .SS(SS),
        .assert_sftrst_d1_reg_0(\GEN_RESET_FOR_S2MM.RESET_I_n_9 ),
        .dest_rst(m_axi_sg_hrdresetn),
        .\dmacr_i_reg[23] (\dmacr_i_reg[23] ),
        .\dmacr_i_reg[4] (out),
        .mm2s_soft_reset_done(mm2s_soft_reset_done),
        .out(\GNE_SYNC_RESET.scndry_resetn_reg ),
        .s2mm_all_idle(s2mm_all_idle),
        .s2mm_halt_cmplt(s2mm_halt_cmplt),
        .s2mm_prmry_reset_out_n(s2mm_prmry_reset_out_n),
        .s2mm_soft_reset_done(s2mm_soft_reset_done),
        .s2mm_stop(s2mm_stop),
        .s2mm_sts_reset_out_n(s2mm_sts_reset_out_n),
        .s_axi_lite_aclk(s_axi_lite_aclk),
        .sig_s_h_halt_reg(sig_s_h_halt_reg),
        .soft_reset(soft_reset),
        .soft_reset_re(soft_reset_re),
        .threshold_is_zero(threshold_is_zero));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_RESET_FOR_S2MM.s2mm_soft_reset_done_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_RESET_FOR_S2MM.RESET_I_n_9 ),
        .Q(s2mm_soft_reset_done),
        .R(mm2s_soft_reset_done0));
  (* DEF_VAL = "1'b0" *) 
  (* DEST_SYNC_FF = "4" *) 
  (* INIT = "0" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  (* XPM_MODULE = "TRUE" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__1 REG_HRD_RST
       (.dest_clk(s_axi_lite_aclk),
        .dest_rst(m_axi_sg_hrdresetn),
        .src_rst(axi_resetn));
  (* DEF_VAL = "1'b0" *) 
  (* DEST_SYNC_FF = "4" *) 
  (* INIT = "0" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  (* XPM_MODULE = "TRUE" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst REG_HRD_RST_OUT
       (.dest_clk(s_axi_lite_aclk),
        .dest_rst(\syncstages_ff_reg[3] ),
        .src_rst(axi_resetn));
  LUT1 #(
    .INIT(2'h1)) 
    arready_i_i_1
       (.I0(\syncstages_ff_reg[3] ),
        .O(SR));
  LUT2 #(
    .INIT(4'h8)) 
    \dmacr_i[2]_i_1 
       (.I0(s2mm_soft_reset_done),
        .I1(mm2s_soft_reset_done),
        .O(soft_reset_clr));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_s2mm_cmdsts_if
   (\GEN_HOLD_NO_DATA.s_axis_s2mm_cmd_tvalid_reg_0 ,
    sts_received_i_reg_0,
    m_axis_s2mm_sts_tready,
    D,
    E,
    \DETERMINATE_BTT_MODE.s2mm_interr_i_reg_0 ,
    \DETERMINATE_BTT_MODE.s2mm_slverr_i_reg_0 ,
    \DETERMINATE_BTT_MODE.s2mm_decerr_i_reg_0 ,
    dma_s2mm_error,
    s2mm_error_reg_0,
    s2mm_decerr_i,
    s_axi_lite_aclk,
    s2mm_interr_i,
    s2mm_slverr_i,
    \GEN_HOLD_NO_DATA.s_axis_s2mm_cmd_tvalid_reg_1 ,
    sts_received_i_reg_1,
    s2mm_stop_i,
    Q,
    out,
    m_axis_s2mm_sts_tvalid_int,
    s_axis_s2mm_cmd_tready,
    dma_interr_reg,
    dma_slverr_reg,
    dma_decerr_reg);
  output \GEN_HOLD_NO_DATA.s_axis_s2mm_cmd_tvalid_reg_0 ;
  output sts_received_i_reg_0;
  output m_axis_s2mm_sts_tready;
  output [0:0]D;
  output [0:0]E;
  output \DETERMINATE_BTT_MODE.s2mm_interr_i_reg_0 ;
  output \DETERMINATE_BTT_MODE.s2mm_slverr_i_reg_0 ;
  output \DETERMINATE_BTT_MODE.s2mm_decerr_i_reg_0 ;
  output dma_s2mm_error;
  input s2mm_error_reg_0;
  input s2mm_decerr_i;
  input s_axi_lite_aclk;
  input s2mm_interr_i;
  input s2mm_slverr_i;
  input \GEN_HOLD_NO_DATA.s_axis_s2mm_cmd_tvalid_reg_1 ;
  input sts_received_i_reg_1;
  input s2mm_stop_i;
  input [1:0]Q;
  input out;
  input m_axis_s2mm_sts_tvalid_int;
  input s_axis_s2mm_cmd_tready;
  input dma_interr_reg;
  input dma_slverr_reg;
  input dma_decerr_reg;

  wire [0:0]D;
  wire \DETERMINATE_BTT_MODE.s2mm_decerr_i_reg_0 ;
  wire \DETERMINATE_BTT_MODE.s2mm_interr_i_reg_0 ;
  wire \DETERMINATE_BTT_MODE.s2mm_slverr_i_reg_0 ;
  wire [0:0]E;
  wire \GEN_HOLD_NO_DATA.s_axis_s2mm_cmd_tvalid_reg_0 ;
  wire \GEN_HOLD_NO_DATA.s_axis_s2mm_cmd_tvalid_reg_1 ;
  wire [1:0]Q;
  wire dma_decerr_reg;
  wire dma_interr_reg;
  wire dma_s2mm_error;
  wire dma_slverr_reg;
  wire m_axis_s2mm_sts_tready;
  wire m_axis_s2mm_sts_tvalid_int;
  wire out;
  wire s2mm_decerr_i;
  wire s2mm_error_i_1_n_0;
  wire s2mm_error_reg_0;
  wire s2mm_interr_i;
  wire s2mm_slverr_i;
  wire s2mm_smpl_decerr_set;
  wire s2mm_smpl_interr_set;
  wire s2mm_smpl_slverr_set;
  wire s2mm_stop_i;
  wire s_axi_lite_aclk;
  wire s_axis_s2mm_cmd_tready;
  wire sts_received_i_reg_0;
  wire sts_received_i_reg_1;
  wire sts_tready_i_1__0_n_0;

  FDRE #(
    .INIT(1'b0)) 
    \DETERMINATE_BTT_MODE.s2mm_decerr_i_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s2mm_decerr_i),
        .Q(s2mm_smpl_decerr_set),
        .R(s2mm_error_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \DETERMINATE_BTT_MODE.s2mm_interr_i_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s2mm_interr_i),
        .Q(s2mm_smpl_interr_set),
        .R(s2mm_error_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \DETERMINATE_BTT_MODE.s2mm_slverr_i_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s2mm_slverr_i),
        .Q(s2mm_smpl_slverr_set),
        .R(s2mm_error_reg_0));
  LUT5 #(
    .INIT(32'h00100310)) 
    \FSM_sequential_smpl_cs[1]_i_3__0 
       (.I0(sts_received_i_reg_0),
        .I1(s2mm_stop_i),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\GEN_HOLD_NO_DATA.s_axis_s2mm_cmd_tvalid_reg_0 ),
        .O(D));
  FDRE \GEN_HOLD_NO_DATA.s_axis_s2mm_cmd_tvalid_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_HOLD_NO_DATA.s_axis_s2mm_cmd_tvalid_reg_1 ),
        .Q(\GEN_HOLD_NO_DATA.s_axis_s2mm_cmd_tvalid_reg_0 ),
        .R(s2mm_error_reg_0));
  LUT2 #(
    .INIT(4'hE)) 
    \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER/dma_decerr_i_1 
       (.I0(s2mm_smpl_decerr_set),
        .I1(dma_decerr_reg),
        .O(\DETERMINATE_BTT_MODE.s2mm_decerr_i_reg_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER/dma_interr_i_1 
       (.I0(s2mm_smpl_interr_set),
        .I1(dma_interr_reg),
        .O(\DETERMINATE_BTT_MODE.s2mm_interr_i_reg_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \GEN_S2MM_REGISTERS.I_S2MM_DMA_REGISTER/dma_slverr_i_1 
       (.I0(s2mm_smpl_slverr_set),
        .I1(dma_slverr_reg),
        .O(\DETERMINATE_BTT_MODE.s2mm_slverr_i_reg_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \USE_SINGLE_REG.sig_regfifo_dout_reg[95]_i_1__0 
       (.I0(\GEN_HOLD_NO_DATA.s_axis_s2mm_cmd_tvalid_reg_0 ),
        .I1(s_axis_s2mm_cmd_tready),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    s2mm_error_i_1
       (.I0(s2mm_smpl_interr_set),
        .I1(s2mm_smpl_decerr_set),
        .I2(s2mm_smpl_slverr_set),
        .I3(dma_s2mm_error),
        .O(s2mm_error_i_1_n_0));
  FDRE s2mm_error_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s2mm_error_i_1_n_0),
        .Q(dma_s2mm_error),
        .R(s2mm_error_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    sts_received_i_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(sts_received_i_reg_1),
        .Q(sts_received_i_reg_0),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h04C4)) 
    sts_tready_i_1__0
       (.I0(sts_received_i_reg_0),
        .I1(out),
        .I2(m_axis_s2mm_sts_tready),
        .I3(m_axis_s2mm_sts_tvalid_int),
        .O(sts_tready_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sts_tready_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(sts_tready_i_1__0_n_0),
        .Q(m_axis_s2mm_sts_tready),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_s2mm_mngr
   (s2mm_halted_clr,
    s2mm_halted_set,
    s2mm_all_idle,
    s2mm_stop,
    s_axis_s2mm_cmd_tvalid_split,
    s2mm_sts_received,
    m_axis_s2mm_sts_tready,
    idle_reg,
    axi_dma_tstvec,
    E,
    D,
    \DETERMINATE_BTT_MODE.s2mm_interr_i_reg ,
    \DETERMINATE_BTT_MODE.s2mm_slverr_i_reg ,
    \DETERMINATE_BTT_MODE.s2mm_decerr_i_reg ,
    dma_s2mm_error,
    s2mm_halted_set_reg,
    s_axi_lite_aclk,
    s2mm_decerr_i,
    s2mm_interr_i,
    s2mm_slverr_i,
    s2mm_dmacr,
    s2mm_halted_set0,
    s2mm_stop_i,
    out,
    s2mm_length_wren,
    idle_reg_0,
    m_axi_sg_aresetn,
    s2mm_dmasr,
    m_axis_s2mm_sts_tvalid_int,
    s_axis_s2mm_cmd_tready,
    dma_interr_reg,
    dma_slverr_reg,
    dma_decerr_reg,
    s2mm_da,
    \GEN_CMD_BTT_EQL_23.cmnd_data_reg[23] ,
    Q);
  output s2mm_halted_clr;
  output s2mm_halted_set;
  output s2mm_all_idle;
  output s2mm_stop;
  output s_axis_s2mm_cmd_tvalid_split;
  output s2mm_sts_received;
  output m_axis_s2mm_sts_tready;
  output idle_reg;
  output [0:0]axi_dma_tstvec;
  output [0:0]E;
  output [72:0]D;
  output \DETERMINATE_BTT_MODE.s2mm_interr_i_reg ;
  output \DETERMINATE_BTT_MODE.s2mm_slverr_i_reg ;
  output \DETERMINATE_BTT_MODE.s2mm_decerr_i_reg ;
  output dma_s2mm_error;
  input s2mm_halted_set_reg;
  input s_axi_lite_aclk;
  input s2mm_decerr_i;
  input s2mm_interr_i;
  input s2mm_slverr_i;
  input [0:0]s2mm_dmacr;
  input s2mm_halted_set0;
  input s2mm_stop_i;
  input out;
  input s2mm_length_wren;
  input idle_reg_0;
  input m_axi_sg_aresetn;
  input [0:0]s2mm_dmasr;
  input m_axis_s2mm_sts_tvalid_int;
  input s_axis_s2mm_cmd_tready;
  input dma_interr_reg;
  input dma_slverr_reg;
  input dma_decerr_reg;
  input [63:0]s2mm_da;
  input \GEN_CMD_BTT_EQL_23.cmnd_data_reg[23] ;
  input [6:0]Q;

  wire [72:0]D;
  wire \DETERMINATE_BTT_MODE.s2mm_decerr_i_reg ;
  wire \DETERMINATE_BTT_MODE.s2mm_interr_i_reg ;
  wire \DETERMINATE_BTT_MODE.s2mm_slverr_i_reg ;
  wire [0:0]E;
  wire \GEN_CMD_BTT_EQL_23.cmnd_data_reg[23] ;
  wire \GEN_S2MM_DMA_CONTROL.GEN_SIMPLE_DMA_MODE.I_S2MM_SMPL_SM_n_4 ;
  wire \GEN_S2MM_DMA_CONTROL.GEN_SIMPLE_DMA_MODE.I_S2MM_SMPL_SM_n_5 ;
  wire [6:0]Q;
  wire [0:0]axi_dma_tstvec;
  wire dma_decerr_reg;
  wire dma_interr_reg;
  wire dma_s2mm_error;
  wire dma_slverr_reg;
  wire idle_reg;
  wire idle_reg_0;
  wire m_axi_sg_aresetn;
  wire m_axis_s2mm_sts_tready;
  wire m_axis_s2mm_sts_tvalid_int;
  wire out;
  wire s2mm_all_idle;
  wire [63:0]s2mm_da;
  wire s2mm_decerr_i;
  wire [0:0]s2mm_dmacr;
  wire [0:0]s2mm_dmasr;
  wire s2mm_halted_clr;
  wire s2mm_halted_set;
  wire s2mm_halted_set0;
  wire s2mm_halted_set_reg;
  wire s2mm_interr_i;
  wire s2mm_length_wren;
  wire s2mm_slverr_i;
  wire s2mm_stop;
  wire s2mm_stop_i;
  wire s2mm_sts_received;
  wire s2mm_sts_received_clr;
  wire s_axi_lite_aclk;
  wire s_axis_s2mm_cmd_tready;
  wire s_axis_s2mm_cmd_tvalid_split;
  wire [1:0]smpl_cs;
  wire [1:1]smpl_ns;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_smple_sm \GEN_S2MM_DMA_CONTROL.GEN_SIMPLE_DMA_MODE.I_S2MM_SMPL_SM 
       (.D(smpl_ns),
        .\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 (s2mm_halted_set_reg),
        .\GEN_CMD_BTT_EQL_23.cmnd_data_reg[23]_0 (\GEN_CMD_BTT_EQL_23.cmnd_data_reg[23] ),
        .\GEN_CMD_BTT_EQL_23.cmnd_data_reg[30]_0 (s_axis_s2mm_cmd_tvalid_split),
        .\GEN_CMD_BTT_EQL_23.cmnd_data_reg[6]_0 (Q),
        .\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 (D),
        .\GEN_CMD_BTT_EQL_23.cmnd_wr_i_reg_0 (\GEN_S2MM_DMA_CONTROL.GEN_SIMPLE_DMA_MODE.I_S2MM_SMPL_SM_n_5 ),
        .Q(smpl_cs),
        .m_axis_s2mm_sts_tvalid_int(m_axis_s2mm_sts_tvalid_int),
        .out(out),
        .s2mm_all_idle(s2mm_all_idle),
        .s2mm_da(s2mm_da),
        .s2mm_dmacr(s2mm_dmacr),
        .s2mm_length_wren(s2mm_length_wren),
        .s2mm_stop_i(s2mm_stop_i),
        .s2mm_sts_received_clr(s2mm_sts_received_clr),
        .s_axi_lite_aclk(s_axi_lite_aclk),
        .s_axis_s2mm_cmd_tready(s_axis_s2mm_cmd_tready),
        .sts_received_clr_reg_0(\GEN_S2MM_DMA_CONTROL.GEN_SIMPLE_DMA_MODE.I_S2MM_SMPL_SM_n_4 ),
        .sts_received_i_reg(s2mm_sts_received));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_s2mm_cmdsts_if \GEN_S2MM_DMA_CONTROL.I_S2MM_CMDSTS 
       (.D(smpl_ns),
        .\DETERMINATE_BTT_MODE.s2mm_decerr_i_reg_0 (\DETERMINATE_BTT_MODE.s2mm_decerr_i_reg ),
        .\DETERMINATE_BTT_MODE.s2mm_interr_i_reg_0 (\DETERMINATE_BTT_MODE.s2mm_interr_i_reg ),
        .\DETERMINATE_BTT_MODE.s2mm_slverr_i_reg_0 (\DETERMINATE_BTT_MODE.s2mm_slverr_i_reg ),
        .E(E),
        .\GEN_HOLD_NO_DATA.s_axis_s2mm_cmd_tvalid_reg_0 (s_axis_s2mm_cmd_tvalid_split),
        .\GEN_HOLD_NO_DATA.s_axis_s2mm_cmd_tvalid_reg_1 (\GEN_S2MM_DMA_CONTROL.GEN_SIMPLE_DMA_MODE.I_S2MM_SMPL_SM_n_5 ),
        .Q(smpl_cs),
        .dma_decerr_reg(dma_decerr_reg),
        .dma_interr_reg(dma_interr_reg),
        .dma_s2mm_error(dma_s2mm_error),
        .dma_slverr_reg(dma_slverr_reg),
        .m_axis_s2mm_sts_tready(m_axis_s2mm_sts_tready),
        .m_axis_s2mm_sts_tvalid_int(m_axis_s2mm_sts_tvalid_int),
        .out(out),
        .s2mm_decerr_i(s2mm_decerr_i),
        .s2mm_error_reg_0(s2mm_halted_set_reg),
        .s2mm_interr_i(s2mm_interr_i),
        .s2mm_slverr_i(s2mm_slverr_i),
        .s2mm_stop_i(s2mm_stop_i),
        .s_axi_lite_aclk(s_axi_lite_aclk),
        .s_axis_s2mm_cmd_tready(s_axis_s2mm_cmd_tready),
        .sts_received_i_reg_0(s2mm_sts_received),
        .sts_received_i_reg_1(\GEN_S2MM_DMA_CONTROL.GEN_SIMPLE_DMA_MODE.I_S2MM_SMPL_SM_n_4 ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_s2mm_sts_mngr \GEN_S2MM_DMA_CONTROL.I_S2MM_STS_MNGR 
       (.axi_dma_tstvec(axi_dma_tstvec),
        .idle_reg(idle_reg),
        .idle_reg_0(idle_reg_0),
        .m_axi_sg_aresetn(m_axi_sg_aresetn),
        .s2mm_all_idle(s2mm_all_idle),
        .s2mm_dmacr(s2mm_dmacr),
        .s2mm_dmasr(s2mm_dmasr),
        .s2mm_halted_clr(s2mm_halted_clr),
        .s2mm_halted_set(s2mm_halted_set),
        .s2mm_halted_set0(s2mm_halted_set0),
        .s2mm_halted_set_reg_0(s2mm_halted_set_reg),
        .s2mm_stop_i(s2mm_stop_i),
        .s2mm_sts_received_clr(s2mm_sts_received_clr),
        .s_axi_lite_aclk(s_axi_lite_aclk));
  FDRE \GEN_S2MM_DMA_CONTROL.s2mm_stop_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s2mm_stop_i),
        .Q(s2mm_stop),
        .R(s2mm_halted_set_reg));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_s2mm_sts_mngr
   (s2mm_halted_clr,
    s2mm_halted_set,
    idle_reg,
    axi_dma_tstvec,
    s2mm_halted_set_reg_0,
    s2mm_dmacr,
    s_axi_lite_aclk,
    s2mm_halted_set0,
    s2mm_all_idle,
    idle_reg_0,
    m_axi_sg_aresetn,
    s2mm_dmasr,
    s2mm_stop_i,
    s2mm_sts_received_clr);
  output s2mm_halted_clr;
  output s2mm_halted_set;
  output idle_reg;
  output [0:0]axi_dma_tstvec;
  input s2mm_halted_set_reg_0;
  input [0:0]s2mm_dmacr;
  input s_axi_lite_aclk;
  input s2mm_halted_set0;
  input s2mm_all_idle;
  input idle_reg_0;
  input m_axi_sg_aresetn;
  input [0:0]s2mm_dmasr;
  input s2mm_stop_i;
  input s2mm_sts_received_clr;

  wire all_is_idle_d1;
  wire [0:0]axi_dma_tstvec;
  wire idle_reg;
  wire idle_reg_0;
  wire m_axi_sg_aresetn;
  wire s2mm_all_idle;
  wire [0:0]s2mm_dmacr;
  wire [0:0]s2mm_dmasr;
  wire s2mm_halted_clr;
  wire s2mm_halted_set;
  wire s2mm_halted_set0;
  wire s2mm_halted_set_reg_0;
  wire s2mm_stop_i;
  wire s2mm_sts_received_clr;
  wire s_axi_lite_aclk;

  FDRE #(
    .INIT(1'b0)) 
    all_is_idle_d1_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s2mm_all_idle),
        .Q(all_is_idle_d1),
        .R(s2mm_halted_set_reg_0));
  LUT4 #(
    .INIT(16'h2F20)) 
    \axi_dma_tstvec[5]_INST_0 
       (.I0(s2mm_halted_set),
        .I1(s2mm_dmasr),
        .I2(s2mm_stop_i),
        .I3(s2mm_sts_received_clr),
        .O(axi_dma_tstvec));
  LUT6 #(
    .INIT(64'h0000AE0A00000000)) 
    idle_i_1__0
       (.I0(idle_reg_0),
        .I1(s2mm_dmacr),
        .I2(all_is_idle_d1),
        .I3(s2mm_all_idle),
        .I4(s2mm_halted_set),
        .I5(m_axi_sg_aresetn),
        .O(idle_reg));
  FDRE s2mm_halted_clr_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s2mm_dmacr),
        .Q(s2mm_halted_clr),
        .R(s2mm_halted_set_reg_0));
  FDRE s2mm_halted_set_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s2mm_halted_set0),
        .Q(s2mm_halted_set),
        .R(s2mm_halted_set_reg_0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_smple_sm
   (s2mm_sts_received_clr,
    Q,
    s2mm_all_idle,
    sts_received_clr_reg_0,
    \GEN_CMD_BTT_EQL_23.cmnd_wr_i_reg_0 ,
    \GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 ,
    \GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ,
    s_axi_lite_aclk,
    out,
    sts_received_i_reg,
    s2mm_stop_i,
    s2mm_dmacr,
    s2mm_length_wren,
    \GEN_CMD_BTT_EQL_23.cmnd_data_reg[30]_0 ,
    D,
    m_axis_s2mm_sts_tvalid_int,
    s_axis_s2mm_cmd_tready,
    s2mm_da,
    \GEN_CMD_BTT_EQL_23.cmnd_data_reg[23]_0 ,
    \GEN_CMD_BTT_EQL_23.cmnd_data_reg[6]_0 );
  output s2mm_sts_received_clr;
  output [1:0]Q;
  output s2mm_all_idle;
  output sts_received_clr_reg_0;
  output \GEN_CMD_BTT_EQL_23.cmnd_wr_i_reg_0 ;
  output [72:0]\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 ;
  input \GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ;
  input s_axi_lite_aclk;
  input out;
  input sts_received_i_reg;
  input s2mm_stop_i;
  input [0:0]s2mm_dmacr;
  input s2mm_length_wren;
  input \GEN_CMD_BTT_EQL_23.cmnd_data_reg[30]_0 ;
  input [0:0]D;
  input m_axis_s2mm_sts_tvalid_int;
  input s_axis_s2mm_cmd_tready;
  input [63:0]s2mm_da;
  input \GEN_CMD_BTT_EQL_23.cmnd_data_reg[23]_0 ;
  input [6:0]\GEN_CMD_BTT_EQL_23.cmnd_data_reg[6]_0 ;

  wire [0:0]D;
  wire \FSM_sequential_smpl_cs[1]_i_2__0_n_0 ;
  wire \GEN_CMD_BTT_EQL_23.cmnd_data[30]_i_1__0_n_0 ;
  wire \GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ;
  wire \GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ;
  wire \GEN_CMD_BTT_EQL_23.cmnd_data_reg[23]_0 ;
  wire \GEN_CMD_BTT_EQL_23.cmnd_data_reg[30]_0 ;
  wire [6:0]\GEN_CMD_BTT_EQL_23.cmnd_data_reg[6]_0 ;
  wire [72:0]\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 ;
  wire \GEN_CMD_BTT_EQL_23.cmnd_wr_i_reg_0 ;
  wire [1:0]Q;
  wire cmnds_queued;
  wire cmnds_queued_i_1__0_n_0;
  wire m_axis_s2mm_sts_tvalid_int;
  wire out;
  wire s2mm_all_idle;
  wire s2mm_cmnd_wr;
  wire [63:0]s2mm_da;
  wire [0:0]s2mm_dmacr;
  wire s2mm_length_wren;
  wire s2mm_stop_i;
  wire s2mm_sts_received_clr;
  wire s_axi_lite_aclk;
  wire s_axis_s2mm_cmd_tready;
  wire [0:0]smpl_ns;
  wire sts_received_clr_cmb;
  wire sts_received_clr_reg_0;
  wire sts_received_i_reg;
  wire write_cmnd_cmb;

  LUT4 #(
    .INIT(16'h040F)) 
    \FSM_sequential_smpl_cs[0]_i_1__0 
       (.I0(s2mm_stop_i),
        .I1(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[30]_0 ),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(smpl_ns));
  LUT6 #(
    .INIT(64'h55555555AAAABAAA)) 
    \FSM_sequential_smpl_cs[1]_i_2__0 
       (.I0(Q[1]),
        .I1(s2mm_stop_i),
        .I2(s2mm_dmacr),
        .I3(s2mm_length_wren),
        .I4(cmnds_queued),
        .I5(Q[0]),
        .O(\FSM_sequential_smpl_cs[1]_i_2__0_n_0 ));
  (* FSM_ENCODED_STATES = "execute_xfer:01,wait_status:10,idle:00" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_smpl_cs_reg[0] 
       (.C(s_axi_lite_aclk),
        .CE(\FSM_sequential_smpl_cs[1]_i_2__0_n_0 ),
        .D(smpl_ns),
        .Q(Q[0]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  (* FSM_ENCODED_STATES = "execute_xfer:01,wait_status:10,idle:00" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_smpl_cs_reg[1] 
       (.C(s_axi_lite_aclk),
        .CE(\FSM_sequential_smpl_cs[1]_i_2__0_n_0 ),
        .D(D),
        .Q(Q[1]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hFFFF000000100000)) 
    \GEN_CMD_BTT_EQL_23.cmnd_data[30]_i_1__0 
       (.I0(s2mm_stop_i),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[30]_0 ),
        .I4(out),
        .I5(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [8]),
        .O(\GEN_CMD_BTT_EQL_23.cmnd_data[30]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h0010FFFF)) 
    \GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0 
       (.I0(s2mm_stop_i),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[30]_0 ),
        .I4(out),
        .O(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[0] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[6]_0 [0]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [0]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[1] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[6]_0 [1]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [1]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[23] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[23]_0 ),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [7]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[2] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[6]_0 [2]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [2]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[30] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_CMD_BTT_EQL_23.cmnd_data[30]_i_1__0_n_0 ),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [8]),
        .R(1'b0));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[32] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[0]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [9]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[33] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[1]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [10]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[34] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[2]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [11]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[35] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[3]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [12]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[36] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[4]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [13]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[37] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[5]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [14]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[38] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[6]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [15]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[39] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[7]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [16]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[3] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[6]_0 [3]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [3]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[40] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[8]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [17]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[41] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[9]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [18]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[42] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[10]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [19]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[43] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[11]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [20]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[44] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[12]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [21]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[45] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[13]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [22]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[46] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[14]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [23]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[47] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[15]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [24]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[48] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[16]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [25]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[49] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[17]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [26]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[4] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[6]_0 [4]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [4]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[50] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[18]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [27]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[51] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[19]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [28]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[52] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[20]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [29]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[53] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[21]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [30]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[54] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[22]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [31]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[55] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[23]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [32]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[56] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[24]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [33]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[57] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[25]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [34]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[58] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[26]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [35]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[59] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[27]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [36]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[5] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[6]_0 [5]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [5]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[60] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[28]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [37]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[61] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[29]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [38]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[62] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[30]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [39]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[63] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[31]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [40]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[64] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[32]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [41]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[65] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[33]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [42]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[66] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[34]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [43]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[67] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[35]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [44]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[68] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[36]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [45]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[69] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[37]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [46]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[6] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[6]_0 [6]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [6]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[70] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[38]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [47]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[71] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[39]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [48]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[72] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[40]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [49]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[73] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[41]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [50]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[74] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[42]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [51]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[75] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[43]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [52]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[76] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[44]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [53]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[77] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[45]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [54]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[78] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[46]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [55]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[79] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[47]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [56]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[80] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[48]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [57]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[81] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[49]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [58]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[82] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[50]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [59]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[83] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[51]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [60]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[84] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[52]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [61]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[85] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[53]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [62]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[86] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[54]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [63]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[87] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[55]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [64]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[88] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[56]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [65]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[89] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[57]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [66]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[90] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[58]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [67]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[91] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[59]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [68]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[92] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[60]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [69]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[93] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[61]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [70]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[94] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[62]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [71]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[95] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1__0_n_0 ),
        .D(s2mm_da[63]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [72]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \GEN_CMD_BTT_EQL_23.cmnd_wr_i_i_1__0 
       (.I0(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[30]_0 ),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(s2mm_stop_i),
        .O(write_cmnd_cmb));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_CMD_BTT_EQL_23.cmnd_wr_i_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(write_cmnd_cmb),
        .Q(s2mm_cmnd_wr),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  LUT3 #(
    .INIT(8'hBA)) 
    \GEN_HOLD_NO_DATA.s_axis_s2mm_cmd_tvalid_i_1 
       (.I0(s2mm_cmnd_wr),
        .I1(s_axis_s2mm_cmd_tready),
        .I2(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[30]_0 ),
        .O(\GEN_CMD_BTT_EQL_23.cmnd_wr_i_reg_0 ));
  LUT6 #(
    .INIT(64'h0101010100010101)) 
    \GNE_SYNC_RESET.sft_rst_dly1_i_2__0 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(cmnds_queued),
        .I3(s2mm_length_wren),
        .I4(s2mm_dmacr),
        .I5(s2mm_stop_i),
        .O(s2mm_all_idle));
  LUT5 #(
    .INIT(32'h00008A88)) 
    cmnds_queued_i_1__0
       (.I0(out),
        .I1(s2mm_cmnd_wr),
        .I2(sts_received_i_reg),
        .I3(cmnds_queued),
        .I4(s2mm_stop_i),
        .O(cmnds_queued_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    cmnds_queued_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(cmnds_queued_i_1__0_n_0),
        .Q(cmnds_queued),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h4440)) 
    sts_received_clr_i_1__0
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(sts_received_i_reg),
        .I3(s2mm_stop_i),
        .O(sts_received_clr_cmb));
  FDRE sts_received_clr_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(sts_received_clr_cmb),
        .Q(s2mm_sts_received_clr),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  LUT4 #(
    .INIT(16'h4440)) 
    sts_received_i_i_1__0
       (.I0(s2mm_sts_received_clr),
        .I1(out),
        .I2(sts_received_i_reg),
        .I3(m_axis_s2mm_sts_tvalid_int),
        .O(sts_received_clr_reg_0));
endmodule

(* ORIG_REF_NAME = "axi_dma_smple_sm" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_smple_sm_10
   (mm2s_sts_received_clr,
    Q,
    mm2s_all_idle,
    sts_received_clr_reg_0,
    \GEN_CMD_BTT_EQL_23.cmnd_wr_i_reg_0 ,
    \GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 ,
    \GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ,
    s_axi_lite_aclk,
    out,
    sts_received_i_reg,
    mm2s_stop_i,
    mm2s_dmacr,
    mm2s_length_wren,
    \GEN_CMD_BTT_EQL_23.cmnd_data_reg[30]_0 ,
    D,
    m_axis_mm2s_sts_tvalid_int,
    s_axis_mm2s_cmd_tready,
    mm2s_sa,
    \GEN_CMD_BTT_EQL_23.cmnd_data_reg[23]_0 ,
    \GEN_CMD_BTT_EQL_23.cmnd_data_reg[6]_0 );
  output mm2s_sts_received_clr;
  output [1:0]Q;
  output mm2s_all_idle;
  output sts_received_clr_reg_0;
  output \GEN_CMD_BTT_EQL_23.cmnd_wr_i_reg_0 ;
  output [72:0]\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 ;
  input \GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ;
  input s_axi_lite_aclk;
  input out;
  input sts_received_i_reg;
  input mm2s_stop_i;
  input [0:0]mm2s_dmacr;
  input mm2s_length_wren;
  input \GEN_CMD_BTT_EQL_23.cmnd_data_reg[30]_0 ;
  input [0:0]D;
  input m_axis_mm2s_sts_tvalid_int;
  input s_axis_mm2s_cmd_tready;
  input [63:0]mm2s_sa;
  input \GEN_CMD_BTT_EQL_23.cmnd_data_reg[23]_0 ;
  input [6:0]\GEN_CMD_BTT_EQL_23.cmnd_data_reg[6]_0 ;

  wire [0:0]D;
  wire \FSM_sequential_smpl_cs[1]_i_2_n_0 ;
  wire \GEN_CMD_BTT_EQL_23.cmnd_data[30]_i_1_n_0 ;
  wire \GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ;
  wire \GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ;
  wire \GEN_CMD_BTT_EQL_23.cmnd_data_reg[23]_0 ;
  wire \GEN_CMD_BTT_EQL_23.cmnd_data_reg[30]_0 ;
  wire [6:0]\GEN_CMD_BTT_EQL_23.cmnd_data_reg[6]_0 ;
  wire [72:0]\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 ;
  wire \GEN_CMD_BTT_EQL_23.cmnd_wr_i_reg_0 ;
  wire [1:0]Q;
  wire cmnds_queued;
  wire cmnds_queued_i_1_n_0;
  wire m_axis_mm2s_sts_tvalid_int;
  wire mm2s_all_idle;
  wire mm2s_cmnd_wr_1;
  wire [0:0]mm2s_dmacr;
  wire mm2s_length_wren;
  wire [63:0]mm2s_sa;
  wire mm2s_stop_i;
  wire mm2s_sts_received_clr;
  wire out;
  wire s_axi_lite_aclk;
  wire s_axis_mm2s_cmd_tready;
  wire [0:0]smpl_ns;
  wire sts_received_clr_cmb;
  wire sts_received_clr_reg_0;
  wire sts_received_i_reg;
  wire write_cmnd_cmb;

  LUT4 #(
    .INIT(16'h040F)) 
    \FSM_sequential_smpl_cs[0]_i_1 
       (.I0(mm2s_stop_i),
        .I1(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[30]_0 ),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(smpl_ns));
  LUT6 #(
    .INIT(64'h55555555AAAABAAA)) 
    \FSM_sequential_smpl_cs[1]_i_2 
       (.I0(Q[1]),
        .I1(mm2s_stop_i),
        .I2(mm2s_dmacr),
        .I3(mm2s_length_wren),
        .I4(cmnds_queued),
        .I5(Q[0]),
        .O(\FSM_sequential_smpl_cs[1]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "execute_xfer:01,wait_status:10,idle:00" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_smpl_cs_reg[0] 
       (.C(s_axi_lite_aclk),
        .CE(\FSM_sequential_smpl_cs[1]_i_2_n_0 ),
        .D(smpl_ns),
        .Q(Q[0]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  (* FSM_ENCODED_STATES = "execute_xfer:01,wait_status:10,idle:00" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_smpl_cs_reg[1] 
       (.C(s_axi_lite_aclk),
        .CE(\FSM_sequential_smpl_cs[1]_i_2_n_0 ),
        .D(D),
        .Q(Q[1]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hFFFF000000100000)) 
    \GEN_CMD_BTT_EQL_23.cmnd_data[30]_i_1 
       (.I0(mm2s_stop_i),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[30]_0 ),
        .I4(out),
        .I5(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [8]),
        .O(\GEN_CMD_BTT_EQL_23.cmnd_data[30]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0010FFFF)) 
    \GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1 
       (.I0(mm2s_stop_i),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[30]_0 ),
        .I4(out),
        .O(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[0] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[6]_0 [0]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [0]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[1] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[6]_0 [1]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [1]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[23] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[23]_0 ),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [7]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[2] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[6]_0 [2]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [2]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[30] 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_CMD_BTT_EQL_23.cmnd_data[30]_i_1_n_0 ),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [8]),
        .R(1'b0));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[32] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[0]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [9]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[33] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[1]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [10]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[34] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[2]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [11]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[35] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[3]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [12]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[36] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[4]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [13]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[37] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[5]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [14]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[38] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[6]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [15]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[39] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[7]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [16]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[3] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[6]_0 [3]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [3]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[40] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[8]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [17]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[41] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[9]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [18]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[42] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[10]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [19]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[43] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[11]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [20]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[44] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[12]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [21]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[45] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[13]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [22]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[46] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[14]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [23]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[47] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[15]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [24]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[48] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[16]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [25]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[49] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[17]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [26]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[4] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[6]_0 [4]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [4]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[50] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[18]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [27]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[51] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[19]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [28]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[52] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[20]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [29]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[53] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[21]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [30]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[54] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[22]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [31]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[55] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[23]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [32]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[56] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[24]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [33]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[57] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[25]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [34]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[58] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[26]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [35]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[59] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[27]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [36]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[5] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[6]_0 [5]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [5]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[60] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[28]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [37]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[61] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[29]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [38]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[62] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[30]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [39]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[63] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[31]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [40]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[64] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[32]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [41]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[65] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[33]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [42]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[66] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[34]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [43]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[67] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[35]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [44]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[68] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[36]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [45]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[69] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[37]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [46]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[6] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[6]_0 [6]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [6]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[70] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[38]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [47]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[71] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[39]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [48]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[72] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[40]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [49]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[73] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[41]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [50]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[74] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[42]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [51]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[75] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[43]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [52]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[76] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[44]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [53]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[77] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[45]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [54]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[78] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[46]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [55]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[79] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[47]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [56]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[80] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[48]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [57]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[81] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[49]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [58]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[82] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[50]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [59]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[83] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[51]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [60]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[84] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[52]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [61]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[85] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[53]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [62]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[86] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[54]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [63]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[87] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[55]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [64]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[88] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[56]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [65]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[89] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[57]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [66]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[90] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[58]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [67]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[91] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[59]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [68]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[92] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[60]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [69]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[93] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[61]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [70]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[94] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[62]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [71]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  FDRE \GEN_CMD_BTT_EQL_23.cmnd_data_reg[95] 
       (.C(s_axi_lite_aclk),
        .CE(\GEN_CMD_BTT_EQL_23.cmnd_data[95]_i_1_n_0 ),
        .D(mm2s_sa[63]),
        .Q(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[95]_0 [72]),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \GEN_CMD_BTT_EQL_23.cmnd_wr_i_i_1 
       (.I0(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[30]_0 ),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(mm2s_stop_i),
        .O(write_cmnd_cmb));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_CMD_BTT_EQL_23.cmnd_wr_i_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(write_cmnd_cmb),
        .Q(mm2s_cmnd_wr_1),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  LUT3 #(
    .INIT(8'hBA)) 
    \GEN_NO_HOLD_DATA.s_axis_mm2s_cmd_tvalid_i_1 
       (.I0(mm2s_cmnd_wr_1),
        .I1(s_axis_mm2s_cmd_tready),
        .I2(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[30]_0 ),
        .O(\GEN_CMD_BTT_EQL_23.cmnd_wr_i_reg_0 ));
  LUT6 #(
    .INIT(64'h0101010100010101)) 
    \GNE_SYNC_RESET.sft_rst_dly1_i_2 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(cmnds_queued),
        .I3(mm2s_length_wren),
        .I4(mm2s_dmacr),
        .I5(mm2s_stop_i),
        .O(mm2s_all_idle));
  LUT5 #(
    .INIT(32'h00008A88)) 
    cmnds_queued_i_1
       (.I0(out),
        .I1(mm2s_cmnd_wr_1),
        .I2(sts_received_i_reg),
        .I3(cmnds_queued),
        .I4(mm2s_stop_i),
        .O(cmnds_queued_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    cmnds_queued_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(cmnds_queued_i_1_n_0),
        .Q(cmnds_queued),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h4440)) 
    sts_received_clr_i_1
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(sts_received_i_reg),
        .I3(mm2s_stop_i),
        .O(sts_received_clr_cmb));
  FDRE sts_received_clr_reg
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(sts_received_clr_cmb),
        .Q(mm2s_sts_received_clr),
        .R(\GEN_CMD_BTT_EQL_23.cmnd_data_reg[0]_0 ));
  LUT4 #(
    .INIT(16'h4440)) 
    sts_received_i_i_1
       (.I0(mm2s_sts_received_clr),
        .I1(out),
        .I2(sts_received_i_reg),
        .I3(m_axis_mm2s_sts_tvalid_int),
        .O(sts_received_clr_reg_0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_sofeof_gen
   (axi_dma_tstvec,
    \GEN_FOR_SYNC.s_sof_d1_cdc_tig_reg_0 ,
    s_axi_lite_aclk,
    m_axis_mm2s_tvalid,
    m_axis_mm2s_tready,
    m_axis_mm2s_tlast,
    out);
  output [1:0]axi_dma_tstvec;
  input \GEN_FOR_SYNC.s_sof_d1_cdc_tig_reg_0 ;
  input s_axi_lite_aclk;
  input m_axis_mm2s_tvalid;
  input m_axis_mm2s_tready;
  input m_axis_mm2s_tlast;
  input out;

  wire \GEN_FOR_SYNC.s_sof_d1_cdc_tig_reg_0 ;
  wire \GEN_FOR_SYNC.s_sof_generated_i_1_n_0 ;
  wire [1:0]axi_dma_tstvec;
  wire m_axis_mm2s_tlast;
  wire m_axis_mm2s_tready;
  wire m_axis_mm2s_tvalid;
  wire out;
  wire p_3_in;
  wire s_axi_lite_aclk;
  wire s_last;
  wire s_last_d1;
  wire s_last_d10;
  wire s_ready;
  wire s_sof_d1_cdc_tig;
  wire s_sof_generated;
  wire s_valid;
  wire s_valid_d1;

  LUT3 #(
    .INIT(8'h80)) 
    \GEN_FOR_SYNC.s_last_d1_i_1 
       (.I0(s_valid),
        .I1(s_ready),
        .I2(s_last),
        .O(s_last_d10));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_FOR_SYNC.s_last_d1_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s_last_d10),
        .Q(s_last_d1),
        .R(\GEN_FOR_SYNC.s_sof_d1_cdc_tig_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_FOR_SYNC.s_last_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(m_axis_mm2s_tlast),
        .Q(s_last),
        .R(\GEN_FOR_SYNC.s_sof_d1_cdc_tig_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_FOR_SYNC.s_ready_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(m_axis_mm2s_tready),
        .Q(s_ready),
        .R(\GEN_FOR_SYNC.s_sof_d1_cdc_tig_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_FOR_SYNC.s_sof_d1_cdc_tig_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s_sof_generated),
        .Q(s_sof_d1_cdc_tig),
        .R(\GEN_FOR_SYNC.s_sof_d1_cdc_tig_reg_0 ));
  LUT6 #(
    .INIT(64'h00000000FBAA0000)) 
    \GEN_FOR_SYNC.s_sof_generated_i_1 
       (.I0(s_sof_generated),
        .I1(s_valid_d1),
        .I2(s_sof_d1_cdc_tig),
        .I3(p_3_in),
        .I4(out),
        .I5(axi_dma_tstvec[1]),
        .O(\GEN_FOR_SYNC.s_sof_generated_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_FOR_SYNC.s_sof_generated_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_FOR_SYNC.s_sof_generated_i_1_n_0 ),
        .Q(s_sof_generated),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \GEN_FOR_SYNC.s_valid_d1_i_1 
       (.I0(s_ready),
        .I1(s_valid),
        .O(p_3_in));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_FOR_SYNC.s_valid_d1_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(p_3_in),
        .Q(s_valid_d1),
        .R(\GEN_FOR_SYNC.s_sof_d1_cdc_tig_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_FOR_SYNC.s_valid_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(m_axis_mm2s_tvalid),
        .Q(s_valid),
        .R(\GEN_FOR_SYNC.s_sof_d1_cdc_tig_reg_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h0D000000)) 
    \axi_dma_tstvec[0]_INST_0 
       (.I0(s_valid_d1),
        .I1(s_sof_d1_cdc_tig),
        .I2(s_sof_generated),
        .I3(s_ready),
        .I4(s_valid),
        .O(axi_dma_tstvec[0]));
  LUT6 #(
    .INIT(64'h40C0404000000000)) 
    \axi_dma_tstvec[1]_INST_0 
       (.I0(s_last_d1),
        .I1(s_valid),
        .I2(s_ready),
        .I3(s_sof_generated),
        .I4(s_sof_d1_cdc_tig),
        .I5(s_last),
        .O(axi_dma_tstvec[1]));
endmodule

(* ORIG_REF_NAME = "axi_dma_sofeof_gen" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma_sofeof_gen_0
   (axi_dma_tstvec,
    \GEN_FOR_SYNC.s_last_d1_reg_0 ,
    s_axi_lite_aclk,
    s_axis_s2mm_tvalid,
    s_axis_s2mm_tready,
    s_axis_s2mm_tlast,
    out);
  output [1:0]axi_dma_tstvec;
  input \GEN_FOR_SYNC.s_last_d1_reg_0 ;
  input s_axi_lite_aclk;
  input s_axis_s2mm_tvalid;
  input s_axis_s2mm_tready;
  input s_axis_s2mm_tlast;
  input out;

  wire \GEN_FOR_SYNC.s_last_d1_reg_0 ;
  wire \GEN_FOR_SYNC.s_sof_generated_i_1__0_n_0 ;
  wire [1:0]axi_dma_tstvec;
  wire out;
  wire p_3_in;
  wire s_axi_lite_aclk;
  wire s_axis_s2mm_tlast;
  wire s_axis_s2mm_tready;
  wire s_axis_s2mm_tvalid;
  wire s_last;
  wire s_last_d1;
  wire s_last_d10;
  wire s_ready;
  wire s_sof_d1_cdc_tig;
  wire s_sof_generated;
  wire s_valid;
  wire s_valid_d1;

  LUT3 #(
    .INIT(8'h80)) 
    \GEN_FOR_SYNC.s_last_d1_i_1__0 
       (.I0(s_valid),
        .I1(s_ready),
        .I2(s_last),
        .O(s_last_d10));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_FOR_SYNC.s_last_d1_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s_last_d10),
        .Q(s_last_d1),
        .R(\GEN_FOR_SYNC.s_last_d1_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_FOR_SYNC.s_last_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s_axis_s2mm_tlast),
        .Q(s_last),
        .R(\GEN_FOR_SYNC.s_last_d1_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_FOR_SYNC.s_ready_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s_axis_s2mm_tready),
        .Q(s_ready),
        .R(\GEN_FOR_SYNC.s_last_d1_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_FOR_SYNC.s_sof_d1_cdc_tig_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s_sof_generated),
        .Q(s_sof_d1_cdc_tig),
        .R(\GEN_FOR_SYNC.s_last_d1_reg_0 ));
  LUT6 #(
    .INIT(64'h00000000FBAA0000)) 
    \GEN_FOR_SYNC.s_sof_generated_i_1__0 
       (.I0(s_sof_generated),
        .I1(s_valid_d1),
        .I2(s_sof_d1_cdc_tig),
        .I3(p_3_in),
        .I4(out),
        .I5(axi_dma_tstvec[1]),
        .O(\GEN_FOR_SYNC.s_sof_generated_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_FOR_SYNC.s_sof_generated_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(\GEN_FOR_SYNC.s_sof_generated_i_1__0_n_0 ),
        .Q(s_sof_generated),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \GEN_FOR_SYNC.s_valid_d1_i_1__0 
       (.I0(s_ready),
        .I1(s_valid),
        .O(p_3_in));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_FOR_SYNC.s_valid_d1_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(p_3_in),
        .Q(s_valid_d1),
        .R(\GEN_FOR_SYNC.s_last_d1_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_FOR_SYNC.s_valid_reg 
       (.C(s_axi_lite_aclk),
        .CE(1'b1),
        .D(s_axis_s2mm_tvalid),
        .Q(s_valid),
        .R(\GEN_FOR_SYNC.s_last_d1_reg_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h0D000000)) 
    \axi_dma_tstvec[2]_INST_0 
       (.I0(s_valid_d1),
        .I1(s_sof_d1_cdc_tig),
        .I2(s_sof_generated),
        .I3(s_ready),
        .I4(s_valid),
        .O(axi_dma_tstvec[0]));
  LUT6 #(
    .INIT(64'h40C0404000000000)) 
    \axi_dma_tstvec[3]_INST_0 
       (.I0(s_last_d1),
        .I1(s_valid),
        .I2(s_ready),
        .I3(s_sof_generated),
        .I4(s_sof_d1_cdc_tig),
        .I5(s_last),
        .O(axi_dma_tstvec[1]));
endmodule

(* CHECK_LICENSE_TYPE = "design_DMA_2C_axi_dma_0_0,axi_dma,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "axi_dma,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (s_axi_lite_aclk,
    m_axi_mm2s_aclk,
    m_axi_s2mm_aclk,
    axi_resetn,
    s_axi_lite_awvalid,
    s_axi_lite_awready,
    s_axi_lite_awaddr,
    s_axi_lite_wvalid,
    s_axi_lite_wready,
    s_axi_lite_wdata,
    s_axi_lite_bresp,
    s_axi_lite_bvalid,
    s_axi_lite_bready,
    s_axi_lite_arvalid,
    s_axi_lite_arready,
    s_axi_lite_araddr,
    s_axi_lite_rvalid,
    s_axi_lite_rready,
    s_axi_lite_rdata,
    s_axi_lite_rresp,
    m_axi_mm2s_araddr,
    m_axi_mm2s_arlen,
    m_axi_mm2s_arsize,
    m_axi_mm2s_arburst,
    m_axi_mm2s_arprot,
    m_axi_mm2s_arcache,
    m_axi_mm2s_arvalid,
    m_axi_mm2s_arready,
    m_axi_mm2s_rdata,
    m_axi_mm2s_rresp,
    m_axi_mm2s_rlast,
    m_axi_mm2s_rvalid,
    m_axi_mm2s_rready,
    mm2s_prmry_reset_out_n,
    m_axis_mm2s_tdata,
    m_axis_mm2s_tkeep,
    m_axis_mm2s_tvalid,
    m_axis_mm2s_tready,
    m_axis_mm2s_tlast,
    m_axi_s2mm_awaddr,
    m_axi_s2mm_awlen,
    m_axi_s2mm_awsize,
    m_axi_s2mm_awburst,
    m_axi_s2mm_awprot,
    m_axi_s2mm_awcache,
    m_axi_s2mm_awvalid,
    m_axi_s2mm_awready,
    m_axi_s2mm_wdata,
    m_axi_s2mm_wstrb,
    m_axi_s2mm_wlast,
    m_axi_s2mm_wvalid,
    m_axi_s2mm_wready,
    m_axi_s2mm_bresp,
    m_axi_s2mm_bvalid,
    m_axi_s2mm_bready,
    s2mm_prmry_reset_out_n,
    s_axis_s2mm_tdata,
    s_axis_s2mm_tkeep,
    s_axis_s2mm_tvalid,
    s_axis_s2mm_tready,
    s_axis_s2mm_tlast,
    mm2s_introut,
    s2mm_introut,
    axi_dma_tstvec);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 S_AXI_LITE_ACLK CLK" *) (* x_interface_mode = "slave S_AXI_LITE_ACLK" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXI_LITE_ACLK, ASSOCIATED_BUSIF S_AXI_LITE:M_AXI, ASSOCIATED_RESET axi_resetn, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_DMA_2C_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *) input s_axi_lite_aclk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 M_AXI_MM2S_CLK CLK" *) (* x_interface_mode = "slave M_AXI_MM2S_CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXI_MM2S_CLK, ASSOCIATED_BUSIF M_AXI_MM2S:M_AXIS_MM2S:M_AXIS_CNTRL, ASSOCIATED_RESET mm2s_prmry_reset_out_n:mm2s_cntrl_reset_out_n, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_DMA_2C_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *) input m_axi_mm2s_aclk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 M_AXI_S2MM_CLK CLK" *) (* x_interface_mode = "slave M_AXI_S2MM_CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXI_S2MM_CLK, ASSOCIATED_BUSIF M_AXI_S2MM:S_AXIS_S2MM:S_AXIS_STS, ASSOCIATED_RESET s2mm_prmry_reset_out_n:s2mm_sts_reset_out_n, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_DMA_2C_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *) input m_axi_s2mm_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 AXI_RESETN RST" *) (* x_interface_mode = "slave AXI_RESETN" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI_RESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input axi_resetn;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWVALID" *) (* x_interface_mode = "slave S_AXI_LITE" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXI_LITE, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 99999001, ID_WIDTH 0, ADDR_WIDTH 10, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 0, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_DMA_2C_zynq_ultra_ps_e_0_0_pl_clk0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s_axi_lite_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWREADY" *) output s_axi_lite_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWADDR" *) input [9:0]s_axi_lite_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE WVALID" *) input s_axi_lite_wvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE WREADY" *) output s_axi_lite_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE WDATA" *) input [31:0]s_axi_lite_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE BRESP" *) output [1:0]s_axi_lite_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE BVALID" *) output s_axi_lite_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE BREADY" *) input s_axi_lite_bready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARVALID" *) input s_axi_lite_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARREADY" *) output s_axi_lite_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARADDR" *) input [9:0]s_axi_lite_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RVALID" *) output s_axi_lite_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RREADY" *) input s_axi_lite_rready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RDATA" *) output [31:0]s_axi_lite_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RRESP" *) output [1:0]s_axi_lite_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARADDR" *) (* x_interface_mode = "master M_AXI_MM2S" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXI_MM2S, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 16, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 99999001, ID_WIDTH 0, ADDR_WIDTH 64, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_ONLY, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 0, HAS_BRESP 0, HAS_RRESP 1, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 16, PHASE 0.0, CLK_DOMAIN design_DMA_2C_zynq_ultra_ps_e_0_0_pl_clk0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output [63:0]m_axi_mm2s_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARLEN" *) output [7:0]m_axi_mm2s_arlen;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARSIZE" *) output [2:0]m_axi_mm2s_arsize;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARBURST" *) output [1:0]m_axi_mm2s_arburst;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARPROT" *) output [2:0]m_axi_mm2s_arprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARCACHE" *) output [3:0]m_axi_mm2s_arcache;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARVALID" *) output m_axi_mm2s_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S ARREADY" *) input m_axi_mm2s_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S RDATA" *) input [31:0]m_axi_mm2s_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S RRESP" *) input [1:0]m_axi_mm2s_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S RLAST" *) input m_axi_mm2s_rlast;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S RVALID" *) input m_axi_mm2s_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S RREADY" *) output m_axi_mm2s_rready;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 MM2S_PRMRY_RESET_OUT_N RST" *) (* x_interface_mode = "master MM2S_PRMRY_RESET_OUT_N" *) (* x_interface_parameter = "XIL_INTERFACENAME MM2S_PRMRY_RESET_OUT_N, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) output mm2s_prmry_reset_out_n;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_MM2S TDATA" *) (* x_interface_mode = "master M_AXIS_MM2S" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXIS_MM2S, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN design_DMA_2C_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *) output [31:0]m_axis_mm2s_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_MM2S TKEEP" *) output [3:0]m_axis_mm2s_tkeep;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_MM2S TVALID" *) output m_axis_mm2s_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_MM2S TREADY" *) input m_axis_mm2s_tready;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_MM2S TLAST" *) output m_axis_mm2s_tlast;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM AWADDR" *) (* x_interface_mode = "master M_AXI_S2MM" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXI_S2MM, SUPPORTS_NARROW_BURST 0, NUM_WRITE_OUTSTANDING 16, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 99999001, ID_WIDTH 0, ADDR_WIDTH 64, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE WRITE_ONLY, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 0, NUM_READ_OUTSTANDING 2, MAX_BURST_LENGTH 16, PHASE 0.0, CLK_DOMAIN design_DMA_2C_zynq_ultra_ps_e_0_0_pl_clk0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output [63:0]m_axi_s2mm_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM AWLEN" *) output [7:0]m_axi_s2mm_awlen;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM AWSIZE" *) output [2:0]m_axi_s2mm_awsize;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM AWBURST" *) output [1:0]m_axi_s2mm_awburst;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM AWPROT" *) output [2:0]m_axi_s2mm_awprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM AWCACHE" *) output [3:0]m_axi_s2mm_awcache;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM AWVALID" *) output m_axi_s2mm_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM AWREADY" *) input m_axi_s2mm_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM WDATA" *) output [31:0]m_axi_s2mm_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM WSTRB" *) output [3:0]m_axi_s2mm_wstrb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM WLAST" *) output m_axi_s2mm_wlast;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM WVALID" *) output m_axi_s2mm_wvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM WREADY" *) input m_axi_s2mm_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM BRESP" *) input [1:0]m_axi_s2mm_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM BVALID" *) input m_axi_s2mm_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM BREADY" *) output m_axi_s2mm_bready;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 S2MM_PRMRY_RESET_OUT_N RST" *) (* x_interface_mode = "master S2MM_PRMRY_RESET_OUT_N" *) (* x_interface_parameter = "XIL_INTERFACENAME S2MM_PRMRY_RESET_OUT_N, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) output s2mm_prmry_reset_out_n;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_S2MM TDATA" *) (* x_interface_mode = "slave S_AXIS_S2MM" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXIS_S2MM, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 99999001, PHASE 0.0, CLK_DOMAIN design_DMA_2C_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *) input [31:0]s_axis_s2mm_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_S2MM TKEEP" *) input [3:0]s_axis_s2mm_tkeep;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_S2MM TVALID" *) input s_axis_s2mm_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_S2MM TREADY" *) output s_axis_s2mm_tready;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_S2MM TLAST" *) input s_axis_s2mm_tlast;
  (* x_interface_info = "xilinx.com:signal:interrupt:1.0 MM2S_INTROUT INTERRUPT" *) (* x_interface_mode = "master MM2S_INTROUT" *) (* x_interface_parameter = "XIL_INTERFACENAME MM2S_INTROUT, SENSITIVITY LEVEL_HIGH, PortWidth 1" *) output mm2s_introut;
  (* x_interface_info = "xilinx.com:signal:interrupt:1.0 S2MM_INTROUT INTERRUPT" *) (* x_interface_mode = "master S2MM_INTROUT" *) (* x_interface_parameter = "XIL_INTERFACENAME S2MM_INTROUT, SENSITIVITY LEVEL_HIGH, PortWidth 1" *) output s2mm_introut;
  output [31:0]axi_dma_tstvec;

  wire \<const0> ;
  wire \<const1> ;
  wire [5:0]\^axi_dma_tstvec ;
  wire axi_resetn;
  wire m_axi_mm2s_aclk;
  wire [63:0]m_axi_mm2s_araddr;
  wire [0:0]\^m_axi_mm2s_arburst ;
  wire [4:0]\^m_axi_mm2s_arlen ;
  wire m_axi_mm2s_arready;
  wire [1:1]\^m_axi_mm2s_arsize ;
  wire m_axi_mm2s_arvalid;
  wire [31:0]m_axi_mm2s_rdata;
  wire m_axi_mm2s_rlast;
  wire m_axi_mm2s_rready;
  wire [1:0]m_axi_mm2s_rresp;
  wire m_axi_mm2s_rvalid;
  wire m_axi_s2mm_aclk;
  wire [63:0]m_axi_s2mm_awaddr;
  wire [0:0]\^m_axi_s2mm_awburst ;
  wire [4:0]\^m_axi_s2mm_awlen ;
  wire m_axi_s2mm_awready;
  wire [1:1]\^m_axi_s2mm_awsize ;
  wire m_axi_s2mm_awvalid;
  wire m_axi_s2mm_bready;
  wire [1:0]m_axi_s2mm_bresp;
  wire m_axi_s2mm_bvalid;
  wire [31:0]m_axi_s2mm_wdata;
  wire m_axi_s2mm_wlast;
  wire m_axi_s2mm_wready;
  wire [3:0]m_axi_s2mm_wstrb;
  wire m_axi_s2mm_wvalid;
  wire [31:0]m_axis_mm2s_tdata;
  wire [3:0]m_axis_mm2s_tkeep;
  wire m_axis_mm2s_tlast;
  wire m_axis_mm2s_tready;
  wire m_axis_mm2s_tvalid;
  wire mm2s_introut;
  wire mm2s_prmry_reset_out_n;
  wire s2mm_introut;
  wire s2mm_prmry_reset_out_n;
  wire s_axi_lite_aclk;
  wire [9:0]s_axi_lite_araddr;
  wire s_axi_lite_arready;
  wire s_axi_lite_arvalid;
  wire [9:0]s_axi_lite_awaddr;
  wire s_axi_lite_awready;
  wire s_axi_lite_awvalid;
  wire s_axi_lite_bready;
  wire s_axi_lite_bvalid;
  wire [31:0]s_axi_lite_rdata;
  wire s_axi_lite_rready;
  wire s_axi_lite_rvalid;
  wire [31:0]s_axi_lite_wdata;
  wire s_axi_lite_wready;
  wire s_axi_lite_wvalid;
  wire [31:0]s_axis_s2mm_tdata;
  wire [3:0]s_axis_s2mm_tkeep;
  wire s_axis_s2mm_tlast;
  wire s_axis_s2mm_tready;
  wire s_axis_s2mm_tvalid;
  wire NLW_U0_m_axi_sg_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_sg_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_sg_bready_UNCONNECTED;
  wire NLW_U0_m_axi_sg_rready_UNCONNECTED;
  wire NLW_U0_m_axi_sg_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_sg_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_mm2s_cntrl_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_mm2s_cntrl_tvalid_UNCONNECTED;
  wire NLW_U0_mm2s_cntrl_reset_out_n_UNCONNECTED;
  wire NLW_U0_s2mm_sts_reset_out_n_UNCONNECTED;
  wire NLW_U0_s_axis_s2mm_sts_tready_UNCONNECTED;
  wire [31:6]NLW_U0_axi_dma_tstvec_UNCONNECTED;
  wire [1:1]NLW_U0_m_axi_mm2s_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_mm2s_arcache_UNCONNECTED;
  wire [7:5]NLW_U0_m_axi_mm2s_arlen_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_mm2s_arprot_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_mm2s_arsize_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_mm2s_aruser_UNCONNECTED;
  wire [1:1]NLW_U0_m_axi_s2mm_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_s2mm_awcache_UNCONNECTED;
  wire [7:5]NLW_U0_m_axi_s2mm_awlen_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_s2mm_awprot_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_s2mm_awsize_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_s2mm_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_sg_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_sg_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_sg_arcache_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_sg_arlen_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_sg_arprot_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_sg_arsize_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_sg_aruser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_sg_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_sg_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_sg_awcache_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_sg_awlen_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_sg_awprot_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_sg_awsize_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_sg_awuser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_sg_wdata_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_sg_wstrb_UNCONNECTED;
  wire [31:0]NLW_U0_m_axis_mm2s_cntrl_tdata_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_mm2s_cntrl_tkeep_UNCONNECTED;
  wire [4:0]NLW_U0_m_axis_mm2s_tdest_UNCONNECTED;
  wire [4:0]NLW_U0_m_axis_mm2s_tid_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_mm2s_tuser_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_lite_bresp_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_lite_rresp_UNCONNECTED;

  assign axi_dma_tstvec[31] = \<const0> ;
  assign axi_dma_tstvec[30] = \<const0> ;
  assign axi_dma_tstvec[29] = \<const0> ;
  assign axi_dma_tstvec[28] = \<const0> ;
  assign axi_dma_tstvec[27] = \<const0> ;
  assign axi_dma_tstvec[26] = \<const0> ;
  assign axi_dma_tstvec[25] = \<const0> ;
  assign axi_dma_tstvec[24] = \<const0> ;
  assign axi_dma_tstvec[23] = \<const0> ;
  assign axi_dma_tstvec[22] = \<const0> ;
  assign axi_dma_tstvec[21] = \<const0> ;
  assign axi_dma_tstvec[20] = \<const0> ;
  assign axi_dma_tstvec[19] = \<const0> ;
  assign axi_dma_tstvec[18] = \<const0> ;
  assign axi_dma_tstvec[17] = \<const0> ;
  assign axi_dma_tstvec[16] = \<const0> ;
  assign axi_dma_tstvec[15] = \<const0> ;
  assign axi_dma_tstvec[14] = \<const0> ;
  assign axi_dma_tstvec[13] = \<const0> ;
  assign axi_dma_tstvec[12] = \<const0> ;
  assign axi_dma_tstvec[11] = \<const0> ;
  assign axi_dma_tstvec[10] = \<const0> ;
  assign axi_dma_tstvec[9] = \<const0> ;
  assign axi_dma_tstvec[8] = \<const0> ;
  assign axi_dma_tstvec[7] = \<const0> ;
  assign axi_dma_tstvec[6] = \<const0> ;
  assign axi_dma_tstvec[5:0] = \^axi_dma_tstvec [5:0];
  assign m_axi_mm2s_arburst[1] = \<const0> ;
  assign m_axi_mm2s_arburst[0] = \^m_axi_mm2s_arburst [0];
  assign m_axi_mm2s_arcache[3] = \<const0> ;
  assign m_axi_mm2s_arcache[2] = \<const0> ;
  assign m_axi_mm2s_arcache[1] = \<const1> ;
  assign m_axi_mm2s_arcache[0] = \<const1> ;
  assign m_axi_mm2s_arlen[7] = \<const0> ;
  assign m_axi_mm2s_arlen[6] = \<const0> ;
  assign m_axi_mm2s_arlen[5] = \<const0> ;
  assign m_axi_mm2s_arlen[4:0] = \^m_axi_mm2s_arlen [4:0];
  assign m_axi_mm2s_arprot[2] = \<const0> ;
  assign m_axi_mm2s_arprot[1] = \<const0> ;
  assign m_axi_mm2s_arprot[0] = \<const0> ;
  assign m_axi_mm2s_arsize[2] = \<const0> ;
  assign m_axi_mm2s_arsize[1] = \^m_axi_mm2s_arsize [1];
  assign m_axi_mm2s_arsize[0] = \<const0> ;
  assign m_axi_s2mm_awburst[1] = \<const0> ;
  assign m_axi_s2mm_awburst[0] = \^m_axi_s2mm_awburst [0];
  assign m_axi_s2mm_awcache[3] = \<const0> ;
  assign m_axi_s2mm_awcache[2] = \<const0> ;
  assign m_axi_s2mm_awcache[1] = \<const1> ;
  assign m_axi_s2mm_awcache[0] = \<const1> ;
  assign m_axi_s2mm_awlen[7] = \<const0> ;
  assign m_axi_s2mm_awlen[6] = \<const0> ;
  assign m_axi_s2mm_awlen[5] = \<const0> ;
  assign m_axi_s2mm_awlen[4:0] = \^m_axi_s2mm_awlen [4:0];
  assign m_axi_s2mm_awprot[2] = \<const0> ;
  assign m_axi_s2mm_awprot[1] = \<const0> ;
  assign m_axi_s2mm_awprot[0] = \<const0> ;
  assign m_axi_s2mm_awsize[2] = \<const0> ;
  assign m_axi_s2mm_awsize[1] = \^m_axi_s2mm_awsize [1];
  assign m_axi_s2mm_awsize[0] = \<const0> ;
  assign s_axi_lite_bresp[1] = \<const0> ;
  assign s_axi_lite_bresp[0] = \<const0> ;
  assign s_axi_lite_rresp[1] = \<const0> ;
  assign s_axi_lite_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_DLYTMR_RESOLUTION = "125" *) 
  (* C_ENABLE_MULTI_CHANNEL = "0" *) 
  (* C_FAMILY = "zynquplus" *) 
  (* C_INCLUDE_MM2S = "1" *) 
  (* C_INCLUDE_MM2S_DRE = "0" *) 
  (* C_INCLUDE_MM2S_SF = "1" *) 
  (* C_INCLUDE_S2MM = "1" *) 
  (* C_INCLUDE_S2MM_DRE = "0" *) 
  (* C_INCLUDE_S2MM_SF = "1" *) 
  (* C_INCLUDE_SG = "0" *) 
  (* C_INCREASE_THROUGHPUT = "0" *) 
  (* C_INSTANCE = "axi_dma" *) 
  (* C_MICRO_DMA = "1" *) 
  (* C_MM2S_BURST_SIZE = "16" *) 
  (* C_M_AXIS_MM2S_CNTRL_TDATA_WIDTH = "32" *) 
  (* C_M_AXIS_MM2S_TDATA_WIDTH = "32" *) 
  (* C_M_AXI_MM2S_ADDR_WIDTH = "64" *) 
  (* C_M_AXI_MM2S_DATA_WIDTH = "32" *) 
  (* C_M_AXI_S2MM_ADDR_WIDTH = "64" *) 
  (* C_M_AXI_S2MM_DATA_WIDTH = "32" *) 
  (* C_M_AXI_SG_ADDR_WIDTH = "64" *) 
  (* C_M_AXI_SG_DATA_WIDTH = "32" *) 
  (* C_NUM_MM2S_CHANNELS = "1" *) 
  (* C_NUM_S2MM_CHANNELS = "1" *) 
  (* C_PRMRY_IS_ACLK_ASYNC = "0" *) 
  (* C_S2MM_BURST_SIZE = "16" *) 
  (* C_SG_INCLUDE_STSCNTRL_STRM = "0" *) 
  (* C_SG_LENGTH_WIDTH = "23" *) 
  (* C_SG_USE_STSAPP_LENGTH = "0" *) 
  (* C_S_AXIS_S2MM_STS_TDATA_WIDTH = "32" *) 
  (* C_S_AXIS_S2MM_TDATA_WIDTH = "32" *) 
  (* C_S_AXI_LITE_ADDR_WIDTH = "10" *) 
  (* C_S_AXI_LITE_DATA_WIDTH = "32" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_dma U0
       (.axi_dma_tstvec({NLW_U0_axi_dma_tstvec_UNCONNECTED[31:6],\^axi_dma_tstvec }),
        .axi_resetn(axi_resetn),
        .m_axi_mm2s_aclk(m_axi_mm2s_aclk),
        .m_axi_mm2s_araddr(m_axi_mm2s_araddr),
        .m_axi_mm2s_arburst({NLW_U0_m_axi_mm2s_arburst_UNCONNECTED[1],\^m_axi_mm2s_arburst }),
        .m_axi_mm2s_arcache(NLW_U0_m_axi_mm2s_arcache_UNCONNECTED[3:0]),
        .m_axi_mm2s_arlen({NLW_U0_m_axi_mm2s_arlen_UNCONNECTED[7:5],\^m_axi_mm2s_arlen }),
        .m_axi_mm2s_arprot(NLW_U0_m_axi_mm2s_arprot_UNCONNECTED[2:0]),
        .m_axi_mm2s_arready(m_axi_mm2s_arready),
        .m_axi_mm2s_arsize({NLW_U0_m_axi_mm2s_arsize_UNCONNECTED[2],\^m_axi_mm2s_arsize ,NLW_U0_m_axi_mm2s_arsize_UNCONNECTED[0]}),
        .m_axi_mm2s_aruser(NLW_U0_m_axi_mm2s_aruser_UNCONNECTED[3:0]),
        .m_axi_mm2s_arvalid(m_axi_mm2s_arvalid),
        .m_axi_mm2s_rdata(m_axi_mm2s_rdata),
        .m_axi_mm2s_rlast(m_axi_mm2s_rlast),
        .m_axi_mm2s_rready(m_axi_mm2s_rready),
        .m_axi_mm2s_rresp(m_axi_mm2s_rresp),
        .m_axi_mm2s_rvalid(m_axi_mm2s_rvalid),
        .m_axi_s2mm_aclk(m_axi_s2mm_aclk),
        .m_axi_s2mm_awaddr(m_axi_s2mm_awaddr),
        .m_axi_s2mm_awburst({NLW_U0_m_axi_s2mm_awburst_UNCONNECTED[1],\^m_axi_s2mm_awburst }),
        .m_axi_s2mm_awcache(NLW_U0_m_axi_s2mm_awcache_UNCONNECTED[3:0]),
        .m_axi_s2mm_awlen({NLW_U0_m_axi_s2mm_awlen_UNCONNECTED[7:5],\^m_axi_s2mm_awlen }),
        .m_axi_s2mm_awprot(NLW_U0_m_axi_s2mm_awprot_UNCONNECTED[2:0]),
        .m_axi_s2mm_awready(m_axi_s2mm_awready),
        .m_axi_s2mm_awsize({NLW_U0_m_axi_s2mm_awsize_UNCONNECTED[2],\^m_axi_s2mm_awsize ,NLW_U0_m_axi_s2mm_awsize_UNCONNECTED[0]}),
        .m_axi_s2mm_awuser(NLW_U0_m_axi_s2mm_awuser_UNCONNECTED[3:0]),
        .m_axi_s2mm_awvalid(m_axi_s2mm_awvalid),
        .m_axi_s2mm_bready(m_axi_s2mm_bready),
        .m_axi_s2mm_bresp(m_axi_s2mm_bresp),
        .m_axi_s2mm_bvalid(m_axi_s2mm_bvalid),
        .m_axi_s2mm_wdata(m_axi_s2mm_wdata),
        .m_axi_s2mm_wlast(m_axi_s2mm_wlast),
        .m_axi_s2mm_wready(m_axi_s2mm_wready),
        .m_axi_s2mm_wstrb(m_axi_s2mm_wstrb),
        .m_axi_s2mm_wvalid(m_axi_s2mm_wvalid),
        .m_axi_sg_aclk(1'b0),
        .m_axi_sg_araddr(NLW_U0_m_axi_sg_araddr_UNCONNECTED[63:0]),
        .m_axi_sg_arburst(NLW_U0_m_axi_sg_arburst_UNCONNECTED[1:0]),
        .m_axi_sg_arcache(NLW_U0_m_axi_sg_arcache_UNCONNECTED[3:0]),
        .m_axi_sg_arlen(NLW_U0_m_axi_sg_arlen_UNCONNECTED[7:0]),
        .m_axi_sg_arprot(NLW_U0_m_axi_sg_arprot_UNCONNECTED[2:0]),
        .m_axi_sg_arready(1'b0),
        .m_axi_sg_arsize(NLW_U0_m_axi_sg_arsize_UNCONNECTED[2:0]),
        .m_axi_sg_aruser(NLW_U0_m_axi_sg_aruser_UNCONNECTED[3:0]),
        .m_axi_sg_arvalid(NLW_U0_m_axi_sg_arvalid_UNCONNECTED),
        .m_axi_sg_awaddr(NLW_U0_m_axi_sg_awaddr_UNCONNECTED[63:0]),
        .m_axi_sg_awburst(NLW_U0_m_axi_sg_awburst_UNCONNECTED[1:0]),
        .m_axi_sg_awcache(NLW_U0_m_axi_sg_awcache_UNCONNECTED[3:0]),
        .m_axi_sg_awlen(NLW_U0_m_axi_sg_awlen_UNCONNECTED[7:0]),
        .m_axi_sg_awprot(NLW_U0_m_axi_sg_awprot_UNCONNECTED[2:0]),
        .m_axi_sg_awready(1'b0),
        .m_axi_sg_awsize(NLW_U0_m_axi_sg_awsize_UNCONNECTED[2:0]),
        .m_axi_sg_awuser(NLW_U0_m_axi_sg_awuser_UNCONNECTED[3:0]),
        .m_axi_sg_awvalid(NLW_U0_m_axi_sg_awvalid_UNCONNECTED),
        .m_axi_sg_bready(NLW_U0_m_axi_sg_bready_UNCONNECTED),
        .m_axi_sg_bresp({1'b0,1'b0}),
        .m_axi_sg_bvalid(1'b0),
        .m_axi_sg_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_sg_rlast(1'b0),
        .m_axi_sg_rready(NLW_U0_m_axi_sg_rready_UNCONNECTED),
        .m_axi_sg_rresp({1'b0,1'b0}),
        .m_axi_sg_rvalid(1'b0),
        .m_axi_sg_wdata(NLW_U0_m_axi_sg_wdata_UNCONNECTED[31:0]),
        .m_axi_sg_wlast(NLW_U0_m_axi_sg_wlast_UNCONNECTED),
        .m_axi_sg_wready(1'b0),
        .m_axi_sg_wstrb(NLW_U0_m_axi_sg_wstrb_UNCONNECTED[3:0]),
        .m_axi_sg_wvalid(NLW_U0_m_axi_sg_wvalid_UNCONNECTED),
        .m_axis_mm2s_cntrl_tdata(NLW_U0_m_axis_mm2s_cntrl_tdata_UNCONNECTED[31:0]),
        .m_axis_mm2s_cntrl_tkeep(NLW_U0_m_axis_mm2s_cntrl_tkeep_UNCONNECTED[3:0]),
        .m_axis_mm2s_cntrl_tlast(NLW_U0_m_axis_mm2s_cntrl_tlast_UNCONNECTED),
        .m_axis_mm2s_cntrl_tready(1'b0),
        .m_axis_mm2s_cntrl_tvalid(NLW_U0_m_axis_mm2s_cntrl_tvalid_UNCONNECTED),
        .m_axis_mm2s_tdata(m_axis_mm2s_tdata),
        .m_axis_mm2s_tdest(NLW_U0_m_axis_mm2s_tdest_UNCONNECTED[4:0]),
        .m_axis_mm2s_tid(NLW_U0_m_axis_mm2s_tid_UNCONNECTED[4:0]),
        .m_axis_mm2s_tkeep(m_axis_mm2s_tkeep),
        .m_axis_mm2s_tlast(m_axis_mm2s_tlast),
        .m_axis_mm2s_tready(m_axis_mm2s_tready),
        .m_axis_mm2s_tuser(NLW_U0_m_axis_mm2s_tuser_UNCONNECTED[3:0]),
        .m_axis_mm2s_tvalid(m_axis_mm2s_tvalid),
        .mm2s_cntrl_reset_out_n(NLW_U0_mm2s_cntrl_reset_out_n_UNCONNECTED),
        .mm2s_introut(mm2s_introut),
        .mm2s_prmry_reset_out_n(mm2s_prmry_reset_out_n),
        .s2mm_introut(s2mm_introut),
        .s2mm_prmry_reset_out_n(s2mm_prmry_reset_out_n),
        .s2mm_sts_reset_out_n(NLW_U0_s2mm_sts_reset_out_n_UNCONNECTED),
        .s_axi_lite_aclk(s_axi_lite_aclk),
        .s_axi_lite_araddr(s_axi_lite_araddr),
        .s_axi_lite_arready(s_axi_lite_arready),
        .s_axi_lite_arvalid(s_axi_lite_arvalid),
        .s_axi_lite_awaddr({1'b0,1'b0,1'b0,s_axi_lite_awaddr[6:2],1'b0,1'b0}),
        .s_axi_lite_awready(s_axi_lite_awready),
        .s_axi_lite_awvalid(s_axi_lite_awvalid),
        .s_axi_lite_bready(s_axi_lite_bready),
        .s_axi_lite_bresp(NLW_U0_s_axi_lite_bresp_UNCONNECTED[1:0]),
        .s_axi_lite_bvalid(s_axi_lite_bvalid),
        .s_axi_lite_rdata(s_axi_lite_rdata),
        .s_axi_lite_rready(s_axi_lite_rready),
        .s_axi_lite_rresp(NLW_U0_s_axi_lite_rresp_UNCONNECTED[1:0]),
        .s_axi_lite_rvalid(s_axi_lite_rvalid),
        .s_axi_lite_wdata(s_axi_lite_wdata),
        .s_axi_lite_wready(s_axi_lite_wready),
        .s_axi_lite_wvalid(s_axi_lite_wvalid),
        .s_axis_s2mm_sts_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_s2mm_sts_tkeep({1'b1,1'b1,1'b1,1'b1}),
        .s_axis_s2mm_sts_tlast(1'b0),
        .s_axis_s2mm_sts_tready(NLW_U0_s_axis_s2mm_sts_tready_UNCONNECTED),
        .s_axis_s2mm_sts_tvalid(1'b0),
        .s_axis_s2mm_tdata(s_axis_s2mm_tdata),
        .s_axis_s2mm_tdest({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_s2mm_tid({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_s2mm_tkeep(s_axis_s2mm_tkeep),
        .s_axis_s2mm_tlast(s_axis_s2mm_tlast),
        .s_axis_s2mm_tready(s_axis_s2mm_tready),
        .s_axis_s2mm_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_s2mm_tvalid(s_axis_s2mm_tvalid));
  VCC VCC
       (.P(\<const1> ));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "4" *) (* INIT = "0" *) 
(* INIT_SYNC_FF = "0" *) (* SIM_ASSERT_CHK = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* keep_hierarchy = "soft" *) (* xpm_cdc = "SYNC_RST" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [3:0]syncstages_ff;

  assign dest_rst = syncstages_ff[3];
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
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "4" *) (* INIT = "0" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* keep_hierarchy = "soft" *) 
(* xpm_cdc = "SYNC_RST" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__1
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [3:0]syncstages_ff;

  assign dest_rst = syncstages_ff[3];
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
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
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
