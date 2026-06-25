//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef HLS_HISTOGRAM_GRAY_ENV__SV                                                                                   
    `define HLS_HISTOGRAM_GRAY_ENV__SV                                                                               
                                                                                                                    
                                                                                                                    
    class hls_histogram_gray_env extends uvm_env;                                                                          
                                                                                                                    
        hls_histogram_gray_virtual_sequencer hls_histogram_gray_virtual_sqr;                                                      
        hls_histogram_gray_config hls_histogram_gray_cfg;                                                                         
                                                                                                                    
        svr_pkg::svr_env#(24) env_master_svr_stream_in;
        axi_pkg::axi_env#(11,4,4,3,1) axi_lite_control;
                                                                                                                    
        hls_histogram_gray_reference_model   refm;                                                                         
                                                                                                                    
        hls_histogram_gray_subsystem_monitor subsys_mon;                                                                   
                                                                                                                    
        `uvm_component_utils_begin(hls_histogram_gray_env)                                                                 
        `uvm_field_object (env_master_svr_stream_in,  UVM_DEFAULT | UVM_REFERENCE)
        `uvm_field_object (refm, UVM_DEFAULT | UVM_REFERENCE)                                                       
        `uvm_field_object (hls_histogram_gray_virtual_sqr, UVM_DEFAULT | UVM_REFERENCE)                                    
        `uvm_field_object (hls_histogram_gray_cfg        , UVM_DEFAULT)                                                    
        `uvm_component_utils_end                                                                                    
                                                                                                                    
        function new (string name = "hls_histogram_gray_env", uvm_component parent = null);                              
            super.new(name, parent);                                                                                
        endfunction                                                                                                 
                                                                                                                    
        extern virtual function void build_phase(uvm_phase phase);                                                  
        extern virtual function void connect_phase(uvm_phase phase);                                                
        extern virtual task          run_phase(uvm_phase phase);                                                    
                                                                                                                    
    endclass                                                                                                        
                                                                                                                    
    function void hls_histogram_gray_env::build_phase(uvm_phase phase);                                                    
        super.build_phase(phase);                                                                                   
        hls_histogram_gray_cfg = hls_histogram_gray_config::type_id::create("hls_histogram_gray_cfg", this);                           
                                                                                                                    
        hls_histogram_gray_cfg.port_stream_in_cfg.svr_type = svr_pkg::SVR_MASTER ;
        env_master_svr_stream_in  = svr_env#(24)::type_id::create("env_master_svr_stream_in", this);
        uvm_config_db#(svr_pkg::svr_config)::set(this, "env_master_svr_stream_in*", "cfg", hls_histogram_gray_cfg.port_stream_in_cfg);
        hls_histogram_gray_cfg.port_stream_in_cfg.prt_type = svr_pkg::AXIS;
        hls_histogram_gray_cfg.port_stream_in_cfg.is_active = svr_pkg::SVR_ACTIVE;
        hls_histogram_gray_cfg.port_stream_in_cfg.spec_cfg = svr_pkg::NORMAL;
        hls_histogram_gray_cfg.port_stream_in_cfg.reset_level = svr_pkg::RESET_LEVEL_LOW;
 

        hls_histogram_gray_cfg.control_cfg.set_default();
        hls_histogram_gray_cfg.control_cfg.drv_type = axi_pkg::MASTER;
        hls_histogram_gray_cfg.control_cfg.reset_level = axi_pkg::RESET_LEVEL_LOW;
        uvm_config_db#(axi_pkg::axi_cfg)::set(this, "axi_lite_control*", "cfg", hls_histogram_gray_cfg.control_cfg);
        axi_lite_control = axi_pkg::axi_env#(11,4,4,3,1)::type_id::create("axi_lite_control", this);



        refm = hls_histogram_gray_reference_model::type_id::create("refm", this);


        uvm_config_db#(hls_histogram_gray_reference_model)::set(this, "*", "refm", refm);


        `uvm_info(this.get_full_name(), "set reference model by uvm_config_db", UVM_LOW)


        subsys_mon = hls_histogram_gray_subsystem_monitor::type_id::create("subsys_mon", this);


        hls_histogram_gray_virtual_sqr = hls_histogram_gray_virtual_sequencer::type_id::create("hls_histogram_gray_virtual_sqr", this);
        `uvm_info(this.get_full_name(), "build_phase done", UVM_LOW)
    endfunction


    function void hls_histogram_gray_env::connect_phase(uvm_phase phase);
        super.connect_phase(phase);


        hls_histogram_gray_virtual_sqr.svr_port_stream_in_sqr = env_master_svr_stream_in.m_agt.sqr;
        env_master_svr_stream_in.m_agt.mon.item_collect_port.connect(subsys_mon.svr_master_stream_in_imp);
 
        if(hls_histogram_gray_cfg.control_cfg.drv_type==axi_pkg::MASTER ||hls_histogram_gray_cfg.control_cfg.drv_type==axi_pkg::SLAVE)
            hls_histogram_gray_virtual_sqr.control_sqr = axi_lite_control.vsqr;
        axi_lite_control.item_wtr_port.connect(subsys_mon.control_wtr_imp);
        axi_lite_control.item_rtr_port.connect(subsys_mon.control_rtr_imp);
        refm.hls_histogram_gray_cfg = hls_histogram_gray_cfg;
        `uvm_info(this.get_full_name(), "connect phase done", UVM_LOW)
    endfunction


    task hls_histogram_gray_env::run_phase(uvm_phase phase);
        `uvm_info(this.get_full_name(), "hls_histogram_gray_env is running", UVM_LOW)
    endtask


`endif
