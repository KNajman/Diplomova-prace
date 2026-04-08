//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef HLS_FILTER_MEDIAN_3X3_VIRTUAL_SEQUENCER__SV                        
    `define HLS_FILTER_MEDIAN_3X3_VIRTUAL_SEQUENCER__SV                    
                                                                       
    class hls_filter_median_3x3_virtual_sequencer extends uvm_sequencer;         
        svr_master_sequencer#(24) svr_port_s_axis_video_sqr;
        svr_slave_sequencer#(24) svr_port_m_axis_video_sqr;
        axi_pkg::axi_virtual_sequencer control_sqr; 
 
        function new (string name, uvm_component parent);              
            super.new(name, parent);                                   
            //`uvm_info(this.get_full_name(), "new is called", UVM_LOW)
        endfunction                                                    
                                                                       
        `uvm_component_utils_begin(hls_filter_median_3x3_virtual_sequencer)      
        `uvm_component_utils_end                                       
                                                                       
    endclass

`endif
