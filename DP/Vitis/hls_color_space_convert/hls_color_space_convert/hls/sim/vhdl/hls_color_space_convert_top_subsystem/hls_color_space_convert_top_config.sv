//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef HLS_COLOR_SPACE_CONVERT_TOP_CONFIG__SV                        
    `define HLS_COLOR_SPACE_CONVERT_TOP_CONFIG__SV                    
                                                            
    class hls_color_space_convert_top_config extends uvm_object;            
                                                            
        int check_ena;                                      
        int cover_ena;                                      
        svr_pkg::svr_config port_s_axis_video_cfg;
        svr_pkg::svr_config port_m_axis_video_cfg;
        axi_pkg::axi_cfg control_cfg;

        `uvm_object_utils_begin(hls_color_space_convert_top_config)         
        `uvm_field_object(port_s_axis_video_cfg, UVM_DEFAULT)
        `uvm_field_object(port_m_axis_video_cfg, UVM_DEFAULT)
        `uvm_field_object(control_cfg, UVM_DEFAULT);
        `uvm_field_int   (check_ena , UVM_DEFAULT)          
        `uvm_field_int   (cover_ena , UVM_DEFAULT)          
        `uvm_object_utils_end                               

        function new (string name = "hls_color_space_convert_top_config");
            super.new(name);                                
            port_s_axis_video_cfg = svr_pkg::svr_config::type_id::create("port_s_axis_video_cfg");
            port_m_axis_video_cfg = svr_pkg::svr_config::type_id::create("port_m_axis_video_cfg");
            control_cfg = axi_pkg::axi_cfg::type_id::create("control_cfg");
        endfunction                                         
                                                            
    endclass                                                
                                                            
`endif                                                      
