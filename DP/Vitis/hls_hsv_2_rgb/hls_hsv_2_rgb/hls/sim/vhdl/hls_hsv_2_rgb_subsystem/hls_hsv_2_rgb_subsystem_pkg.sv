//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`timescale 1ns/1ps 

`ifndef HLS_HSV_2_RGB_SUBSYSTEM_PKG__SV          
    `define HLS_HSV_2_RGB_SUBSYSTEM_PKG__SV      
                                                     
    package hls_hsv_2_rgb_subsystem_pkg;               
                                                     
        import uvm_pkg::*;                           
        import file_agent_pkg::*;                    
        import svr_pkg::*;
        import axi_pkg::*;
                                                     
        `include "uvm_macros.svh"                  
                                                     
        `include "hls_hsv_2_rgb_config.sv"           
        `include "hls_hsv_2_rgb_reference_model.sv"  
        `include "hls_hsv_2_rgb_scoreboard.sv"       
        `include "hls_hsv_2_rgb_subsystem_monitor.sv"
        `include "hls_hsv_2_rgb_virtual_sequencer.sv"
        `include "hls_hsv_2_rgb_pkg_sequence_lib.sv" 
        `include "hls_hsv_2_rgb_env.sv"              
                                                     
    endpackage                                       
                                                     
`endif                                               
