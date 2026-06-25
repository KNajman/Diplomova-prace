//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`timescale 1ns/1ps 

`ifndef HLS_HISTOGRAM_GRAY_SUBSYSTEM_PKG__SV          
    `define HLS_HISTOGRAM_GRAY_SUBSYSTEM_PKG__SV      
                                                     
    package hls_histogram_gray_subsystem_pkg;               
                                                     
        import uvm_pkg::*;                           
        import file_agent_pkg::*;                    
        import svr_pkg::*;
        import axi_pkg::*;
                                                     
        `include "uvm_macros.svh"                  
                                                     
        `include "hls_histogram_gray_config.sv"           
        `include "hls_histogram_gray_reference_model.sv"  
        `include "hls_histogram_gray_scoreboard.sv"       
        `include "hls_histogram_gray_subsystem_monitor.sv"
        `include "hls_histogram_gray_virtual_sequencer.sv"
        `include "hls_histogram_gray_pkg_sequence_lib.sv" 
        `include "hls_histogram_gray_env.sv"              
                                                     
    endpackage                                       
                                                     
`endif                                               
