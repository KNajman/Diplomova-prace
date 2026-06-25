//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef HLS_FILTER_2D_ENV__SV                                                                                   
    `define HLS_FILTER_2D_ENV__SV                                                                               
                                                                                                                    
                                                                                                                    
    class hls_filter_2d_env extends uvm_env;                                                                          
                                                                                                                    
        hls_filter_2d_virtual_sequencer hls_filter_2d_virtual_sqr;                                                      
        hls_filter_2d_config hls_filter_2d_cfg;                                                                         
                                                                                                                    
        svr_pkg::svr_env#(24) env_master_svr_s_axis_video;
        svr_pkg::svr_env#(24) env_slave_svr_m_axis_video;
        axi_pkg::axi_env#(9,4,4,3,1) axi_lite_control;
                                                                                                                    
        hls_filter_2d_reference_model   refm;                                                                         
                                                                                                                    
        hls_filter_2d_subsystem_monitor subsys_mon;                                                                   
                                                                                                                    
        `uvm_component_utils_begin(hls_filter_2d_env)                                                                 
        `uvm_field_object (env_master_svr_s_axis_video,  UVM_DEFAULT | UVM_REFERENCE)
        `uvm_field_object (env_slave_svr_m_axis_video,  UVM_DEFAULT | UVM_REFERENCE)
        `uvm_field_object (refm, UVM_DEFAULT | UVM_REFERENCE)                                                       
        `uvm_field_object (hls_filter_2d_virtual_sqr, UVM_DEFAULT | UVM_REFERENCE)                                    
        `uvm_field_object (hls_filter_2d_cfg        , UVM_DEFAULT)                                                    
        `uvm_component_utils_end                                                                                    
                                                                                                                    
        function new (string name = "hls_filter_2d_env", uvm_component parent = null);                              
            super.new(name, parent);                                                                                
        endfunction                                                                                                 
                                                                                                                    
        extern virtual function void build_phase(uvm_phase phase);                                                  
        extern virtual function void connect_phase(uvm_phase phase);                                                
        extern virtual task          run_phase(uvm_phase phase);                                                    
                                                                                                                    
    endclass                                                                                                        
                                                                                                                    
    function void hls_filter_2d_env::build_phase(uvm_phase phase);                                                    
        super.build_phase(phase);                                                                                   
        hls_filter_2d_cfg = hls_filter_2d_config::type_id::create("hls_filter_2d_cfg", this);                           
                                                                                                                    
        hls_filter_2d_cfg.port_s_axis_video_cfg.svr_type = svr_pkg::SVR_MASTER ;
        env_master_svr_s_axis_video  = svr_env#(24)::type_id::create("env_master_svr_s_axis_video", this);
        uvm_config_db#(svr_pkg::svr_config)::set(this, "env_master_svr_s_axis_video*", "cfg", hls_filter_2d_cfg.port_s_axis_video_cfg);
        hls_filter_2d_cfg.port_s_axis_video_cfg.prt_type = svr_pkg::AXIS;
        hls_filter_2d_cfg.port_s_axis_video_cfg.is_active = svr_pkg::SVR_ACTIVE;
        hls_filter_2d_cfg.port_s_axis_video_cfg.spec_cfg = svr_pkg::NORMAL;
        hls_filter_2d_cfg.port_s_axis_video_cfg.reset_level = svr_pkg::RESET_LEVEL_LOW;
 
        hls_filter_2d_cfg.port_m_axis_video_cfg.svr_type = svr_pkg::SVR_SLAVE ;
        env_slave_svr_m_axis_video  = svr_env#(24)::type_id::create("env_slave_svr_m_axis_video", this);
        uvm_config_db#(svr_pkg::svr_config)::set(this, "env_slave_svr_m_axis_video*", "cfg", hls_filter_2d_cfg.port_m_axis_video_cfg);
        hls_filter_2d_cfg.port_m_axis_video_cfg.prt_type = svr_pkg::AXIS;
        hls_filter_2d_cfg.port_m_axis_video_cfg.is_active = svr_pkg::SVR_ACTIVE;
        hls_filter_2d_cfg.port_m_axis_video_cfg.spec_cfg = svr_pkg::NORMAL;
        hls_filter_2d_cfg.port_m_axis_video_cfg.reset_level = svr_pkg::RESET_LEVEL_LOW;
 

        hls_filter_2d_cfg.control_cfg.set_default();
        hls_filter_2d_cfg.control_cfg.drv_type = axi_pkg::MASTER;
        hls_filter_2d_cfg.control_cfg.reset_level = axi_pkg::RESET_LEVEL_LOW;
        uvm_config_db#(axi_pkg::axi_cfg)::set(this, "axi_lite_control*", "cfg", hls_filter_2d_cfg.control_cfg);
        axi_lite_control = axi_pkg::axi_env#(9,4,4,3,1)::type_id::create("axi_lite_control", this);



        refm = hls_filter_2d_reference_model::type_id::create("refm", this);


        uvm_config_db#(hls_filter_2d_reference_model)::set(this, "*", "refm", refm);


        `uvm_info(this.get_full_name(), "set reference model by uvm_config_db", UVM_LOW)


        subsys_mon = hls_filter_2d_subsystem_monitor::type_id::create("subsys_mon", this);


        hls_filter_2d_virtual_sqr = hls_filter_2d_virtual_sequencer::type_id::create("hls_filter_2d_virtual_sqr", this);
        `uvm_info(this.get_full_name(), "build_phase done", UVM_LOW)
    endfunction


    function void hls_filter_2d_env::connect_phase(uvm_phase phase);
        super.connect_phase(phase);


        hls_filter_2d_virtual_sqr.svr_port_s_axis_video_sqr = env_master_svr_s_axis_video.m_agt.sqr;
        env_master_svr_s_axis_video.m_agt.mon.item_collect_port.connect(subsys_mon.svr_master_s_axis_video_imp);
 
        hls_filter_2d_virtual_sqr.svr_port_m_axis_video_sqr = env_slave_svr_m_axis_video.s_agt.sqr;
        env_slave_svr_m_axis_video.s_agt.mon.item_collect_port.connect(subsys_mon.svr_slave_m_axis_video_imp);
 
        if(hls_filter_2d_cfg.control_cfg.drv_type==axi_pkg::MASTER ||hls_filter_2d_cfg.control_cfg.drv_type==axi_pkg::SLAVE)
            hls_filter_2d_virtual_sqr.control_sqr = axi_lite_control.vsqr;
        axi_lite_control.item_wtr_port.connect(subsys_mon.control_wtr_imp);
        axi_lite_control.item_rtr_port.connect(subsys_mon.control_rtr_imp);
        refm.hls_filter_2d_cfg = hls_filter_2d_cfg;
        `uvm_info(this.get_full_name(), "connect phase done", UVM_LOW)
    endfunction


    task hls_filter_2d_env::run_phase(uvm_phase phase);
        `uvm_info(this.get_full_name(), "hls_filter_2d_env is running", UVM_LOW)
    endtask


`endif
