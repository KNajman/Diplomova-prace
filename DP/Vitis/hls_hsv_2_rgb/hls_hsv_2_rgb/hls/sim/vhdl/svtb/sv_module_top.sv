//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================

`ifndef SV_MODULE_TOP_SV
`define SV_MODULE_TOP_SV


`timescale 1ns/1ps


`include "uvm_macros.svh"
import uvm_pkg::*;
import file_agent_pkg::*;
import svr_pkg::*;
import hls_hsv_2_rgb_subsystem_pkg::*;
`include "hls_hsv_2_rgb_subsys_test_sequence_lib.sv"
`include "hls_hsv_2_rgb_test_lib.sv"


module sv_module_top;


    misc_interface              misc_if ( .clock(apatb_hls_hsv_2_rgb_top.AESL_clock), .reset(apatb_hls_hsv_2_rgb_top.AESL_reset) );
    initial begin
        uvm_config_db #(virtual misc_interface)::set(null, "uvm_test_top.top_env.*", "misc_if", misc_if);
    end


    svr_if #(32)  svr_in_stream_if    (.clk  (apatb_hls_hsv_2_rgb_top.AESL_clock), .rst(apatb_hls_hsv_2_rgb_top.AESL_reset));
    assign svr_in_stream_if.ready = apatb_hls_hsv_2_rgb_top.in_stream_TREADY;
    assign apatb_hls_hsv_2_rgb_top.in_stream_TVALID = svr_in_stream_if.valid;
    assign apatb_hls_hsv_2_rgb_top.in_stream_TDATA = svr_in_stream_if.data[31:0];
    initial begin
        uvm_config_db #( virtual svr_if#(32) )::set(null, "uvm_test_top.top_env.env_master_svr_in_stream.*", "vif", svr_in_stream_if);
    end


    svr_if #(32)  svr_out_stream_if    (.clk  (apatb_hls_hsv_2_rgb_top.AESL_clock), .rst(apatb_hls_hsv_2_rgb_top.AESL_reset));
    assign apatb_hls_hsv_2_rgb_top.out_stream_TREADY = svr_out_stream_if.ready;
    assign svr_out_stream_if.valid = apatb_hls_hsv_2_rgb_top.out_stream_TVALID;
    assign svr_out_stream_if.data[31:0] = apatb_hls_hsv_2_rgb_top.out_stream_TDATA;
    initial begin
        uvm_config_db #( virtual svr_if#(32) )::set(null, "uvm_test_top.top_env.env_slave_svr_out_stream.*", "vif", svr_out_stream_if);
    end


    axi_if #(4,4,4,3,1)  axi_control_if (.clk  (apatb_hls_hsv_2_rgb_top.AESL_clock), .rst(apatb_hls_hsv_2_rgb_top.AESL_reset));
    assign apatb_hls_hsv_2_rgb_top.control_AWADDR = axi_control_if.AWADDR;
    assign apatb_hls_hsv_2_rgb_top.control_AWVALID = axi_control_if.AWVALID;
    assign axi_control_if.AWREADY = apatb_hls_hsv_2_rgb_top.control_AWREADY;
    assign apatb_hls_hsv_2_rgb_top.control_WVALID = axi_control_if.WVALID;
    assign axi_control_if.WREADY = apatb_hls_hsv_2_rgb_top.control_WREADY;
    assign apatb_hls_hsv_2_rgb_top.control_WDATA = axi_control_if.WDATA;
    assign apatb_hls_hsv_2_rgb_top.control_WSTRB = axi_control_if.WSTRB;
    assign apatb_hls_hsv_2_rgb_top.control_ARADDR = axi_control_if.ARADDR;
    assign apatb_hls_hsv_2_rgb_top.control_ARVALID = axi_control_if.ARVALID;
    assign axi_control_if.ARREADY = apatb_hls_hsv_2_rgb_top.control_ARREADY;
    assign axi_control_if.RVALID = apatb_hls_hsv_2_rgb_top.control_RVALID;
    assign apatb_hls_hsv_2_rgb_top.control_RREADY = axi_control_if.RREADY;
    assign axi_control_if.RDATA = apatb_hls_hsv_2_rgb_top.control_RDATA;
    assign axi_control_if.RRESP = apatb_hls_hsv_2_rgb_top.control_RRESP;
    assign axi_control_if.BVALID = apatb_hls_hsv_2_rgb_top.control_BVALID;
    assign apatb_hls_hsv_2_rgb_top.control_BREADY = axi_control_if.BREADY;
    assign axi_control_if.BRESP = apatb_hls_hsv_2_rgb_top.control_BRESP;
    assign axi_control_if.BID = 0;
    assign axi_control_if.RID = 0;
    assign axi_control_if.RLAST = 1;
    initial begin
        uvm_config_db #( virtual axi_if#(4,4,4,3,1) )::set(null, "uvm_test_top.top_env.axi_lite_control.*", "vif", axi_control_if);
    end


    initial begin
        run_test();
    end
endmodule
`endif
