//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef HLS_HISTOGRAM_GRAY_CONFIG__SV                        
    `define HLS_HISTOGRAM_GRAY_CONFIG__SV                    
                                                            
    class hls_histogram_gray_config extends uvm_object;            
                                                            
        int check_ena;                                      
        int cover_ena;                                      
        svr_pkg::svr_config port_stream_in_cfg;
        axi_pkg::axi_cfg control_cfg;

        `uvm_object_utils_begin(hls_histogram_gray_config)         
        `uvm_field_object(port_stream_in_cfg, UVM_DEFAULT)
        `uvm_field_object(control_cfg, UVM_DEFAULT);
        `uvm_field_int   (check_ena , UVM_DEFAULT)          
        `uvm_field_int   (cover_ena , UVM_DEFAULT)          
        `uvm_object_utils_end                               

        function new (string name = "hls_histogram_gray_config");
            super.new(name);                                
            port_stream_in_cfg = svr_pkg::svr_config::type_id::create("port_stream_in_cfg");
            control_cfg = axi_pkg::axi_cfg::type_id::create("control_cfg");
        endfunction                                         
                                                            
    endclass                                                
                                                            
`endif                                                      
