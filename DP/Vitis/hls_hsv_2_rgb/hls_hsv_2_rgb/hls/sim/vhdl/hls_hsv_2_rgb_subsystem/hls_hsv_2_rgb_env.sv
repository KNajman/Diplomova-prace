//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef HLS_HSV_2_RGB_ENV__SV                                                                                   
    `define HLS_HSV_2_RGB_ENV__SV                                                                               
                                                                                                                    
                                                                                                                    
    class hls_hsv_2_rgb_env extends uvm_env;                                                                          
                                                                                                                    
        hls_hsv_2_rgb_virtual_sequencer hls_hsv_2_rgb_virtual_sqr;                                                      
        hls_hsv_2_rgb_config hls_hsv_2_rgb_cfg;                                                                         
                                                                                                                    
        svr_pkg::svr_env#(32) env_master_svr_in_stream;
        svr_pkg::svr_env#(32) env_slave_svr_out_stream;
        axi_pkg::axi_env#(4,4,4,3,1) axi_lite_control;
                                                                                                                    
        hls_hsv_2_rgb_reference_model   refm;                                                                         
                                                                                                                    
        hls_hsv_2_rgb_subsystem_monitor subsys_mon;                                                                   
                                                                                                                    
        `uvm_component_utils_begin(hls_hsv_2_rgb_env)                                                                 
        `uvm_field_object (env_master_svr_in_stream,  UVM_DEFAULT | UVM_REFERENCE)
        `uvm_field_object (env_slave_svr_out_stream,  UVM_DEFAULT | UVM_REFERENCE)
        `uvm_field_object (refm, UVM_DEFAULT | UVM_REFERENCE)                                                       
        `uvm_field_object (hls_hsv_2_rgb_virtual_sqr, UVM_DEFAULT | UVM_REFERENCE)                                    
        `uvm_field_object (hls_hsv_2_rgb_cfg        , UVM_DEFAULT)                                                    
        `uvm_component_utils_end                                                                                    
                                                                                                                    
        function new (string name = "hls_hsv_2_rgb_env", uvm_component parent = null);                              
            super.new(name, parent);                                                                                
        endfunction                                                                                                 
                                                                                                                    
        extern virtual function void build_phase(uvm_phase phase);                                                  
        extern virtual function void connect_phase(uvm_phase phase);                                                
        extern virtual task          run_phase(uvm_phase phase);                                                    
                                                                                                                    
    endclass                                                                                                        
                                                                                                                    
    function void hls_hsv_2_rgb_env::build_phase(uvm_phase phase);                                                    
        super.build_phase(phase);                                                                                   
        hls_hsv_2_rgb_cfg = hls_hsv_2_rgb_config::type_id::create("hls_hsv_2_rgb_cfg", this);                           
                                                                                                                    
        hls_hsv_2_rgb_cfg.port_in_stream_cfg.svr_type = svr_pkg::SVR_MASTER ;
        env_master_svr_in_stream  = svr_env#(32)::type_id::create("env_master_svr_in_stream", this);
        uvm_config_db#(svr_pkg::svr_config)::set(this, "env_master_svr_in_stream*", "cfg", hls_hsv_2_rgb_cfg.port_in_stream_cfg);
        hls_hsv_2_rgb_cfg.port_in_stream_cfg.prt_type = svr_pkg::AXIS;
        hls_hsv_2_rgb_cfg.port_in_stream_cfg.is_active = svr_pkg::SVR_ACTIVE;
        hls_hsv_2_rgb_cfg.port_in_stream_cfg.spec_cfg = svr_pkg::NORMAL;
        hls_hsv_2_rgb_cfg.port_in_stream_cfg.reset_level = svr_pkg::RESET_LEVEL_LOW;
 
        hls_hsv_2_rgb_cfg.port_out_stream_cfg.svr_type = svr_pkg::SVR_SLAVE ;
        env_slave_svr_out_stream  = svr_env#(32)::type_id::create("env_slave_svr_out_stream", this);
        uvm_config_db#(svr_pkg::svr_config)::set(this, "env_slave_svr_out_stream*", "cfg", hls_hsv_2_rgb_cfg.port_out_stream_cfg);
        hls_hsv_2_rgb_cfg.port_out_stream_cfg.prt_type = svr_pkg::AXIS;
        hls_hsv_2_rgb_cfg.port_out_stream_cfg.is_active = svr_pkg::SVR_ACTIVE;
        hls_hsv_2_rgb_cfg.port_out_stream_cfg.spec_cfg = svr_pkg::NORMAL;
        hls_hsv_2_rgb_cfg.port_out_stream_cfg.reset_level = svr_pkg::RESET_LEVEL_LOW;
 

        hls_hsv_2_rgb_cfg.control_cfg.set_default();
        hls_hsv_2_rgb_cfg.control_cfg.drv_type = axi_pkg::MASTER;
        hls_hsv_2_rgb_cfg.control_cfg.reset_level = axi_pkg::RESET_LEVEL_LOW;
        uvm_config_db#(axi_pkg::axi_cfg)::set(this, "axi_lite_control*", "cfg", hls_hsv_2_rgb_cfg.control_cfg);
        axi_lite_control = axi_pkg::axi_env#(4,4,4,3,1)::type_id::create("axi_lite_control", this);



        refm = hls_hsv_2_rgb_reference_model::type_id::create("refm", this);


        uvm_config_db#(hls_hsv_2_rgb_reference_model)::set(this, "*", "refm", refm);


        `uvm_info(this.get_full_name(), "set reference model by uvm_config_db", UVM_LOW)


        subsys_mon = hls_hsv_2_rgb_subsystem_monitor::type_id::create("subsys_mon", this);


        hls_hsv_2_rgb_virtual_sqr = hls_hsv_2_rgb_virtual_sequencer::type_id::create("hls_hsv_2_rgb_virtual_sqr", this);
        `uvm_info(this.get_full_name(), "build_phase done", UVM_LOW)
    endfunction


    function void hls_hsv_2_rgb_env::connect_phase(uvm_phase phase);
        super.connect_phase(phase);


        hls_hsv_2_rgb_virtual_sqr.svr_port_in_stream_sqr = env_master_svr_in_stream.m_agt.sqr;
        env_master_svr_in_stream.m_agt.mon.item_collect_port.connect(subsys_mon.svr_master_in_stream_imp);
 
        hls_hsv_2_rgb_virtual_sqr.svr_port_out_stream_sqr = env_slave_svr_out_stream.s_agt.sqr;
        env_slave_svr_out_stream.s_agt.mon.item_collect_port.connect(subsys_mon.svr_slave_out_stream_imp);
 
        if(hls_hsv_2_rgb_cfg.control_cfg.drv_type==axi_pkg::MASTER ||hls_hsv_2_rgb_cfg.control_cfg.drv_type==axi_pkg::SLAVE)
            hls_hsv_2_rgb_virtual_sqr.control_sqr = axi_lite_control.vsqr;
        axi_lite_control.item_wtr_port.connect(subsys_mon.control_wtr_imp);
        axi_lite_control.item_rtr_port.connect(subsys_mon.control_rtr_imp);
        refm.hls_hsv_2_rgb_cfg = hls_hsv_2_rgb_cfg;
        `uvm_info(this.get_full_name(), "connect phase done", UVM_LOW)
    endfunction


    task hls_hsv_2_rgb_env::run_phase(uvm_phase phase);
        `uvm_info(this.get_full_name(), "hls_hsv_2_rgb_env is running", UVM_LOW)
    endtask


`endif
