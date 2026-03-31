//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================

`ifndef HLS_HSV_2_RGB_REFERENCE_MODEL_SV
`define HLS_HSV_2_RGB_REFERENCE_MODEL_SV

class hls_hsv_2_rgb_reference_model extends uvm_component;
    event allsvr_input_done;
    event allsvr_output_done;
    event write_start_finish;
    int trans_num_total = 1008;
    int trans_num_idx;
    int ap_done_cnt=1;
    event dut2tb_ap_ready;
    event dut2tb_ap_done;
    event ap_ready_for_nexttrans;
    event ap_done_for_nexttrans;
    event finish;
    hls_hsv_2_rgb_config hls_hsv_2_rgb_cfg;
    virtual interface misc_interface misc_if;

    int svr_in_stream_delay;
    covergroup svr_in_stream_cov;
        delay: coverpoint svr_in_stream_delay
        {
            bins norm[3] = { [0 : 2] };
        }
    endgroup
    int svr_out_stream_delay;
    covergroup svr_out_stream_cov;
        delay: coverpoint svr_out_stream_delay
        {
            bins norm[3] = { [0 : 2] };
        }
    endgroup
    
    `uvm_component_utils_begin(hls_hsv_2_rgb_reference_model)
        `uvm_field_int (trans_num_idx, UVM_DEFAULT)
    `uvm_component_utils_end

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual misc_interface)::get(this, "", "misc_if", misc_if))
            `uvm_fatal(this.get_full_name(), "No misc_if from high level")
    endfunction

    function new (string name = "", uvm_component parent = null);
        super.new (name, parent);
        svr_in_stream_cov = new;
        svr_out_stream_cov = new;
        trans_num_idx= 0;
    endfunction

    virtual task run_phase(uvm_phase phase);
        string fpath[$];
misc_if.dut2tb_ap_done = 0;
    misc_if.dut2tb_ap_ready = 0;
        fork
            forever begin
                @allsvr_input_done;
                fork
                    begin
                        @(negedge misc_if.clock);
                        -> misc_if.dut2tb_ap_ready_evt;
                    end
                join_none
                fork
                    begin
                        -> dut2tb_ap_ready;
                        misc_if.dut2tb_ap_ready = 1;
                        @(posedge misc_if.clock);
                        misc_if.dut2tb_ap_ready = 0;
                    end
                join_none
                -> ap_ready_for_nexttrans;
                `uvm_info(this.get_full_name(), "trigger event ap_ready_for_nexttrans", UVM_LOW)
                fork
                    begin
                        misc_if.ap_ready_for_nexttrans = 1;
                        @(posedge misc_if.clock);
                        misc_if.ap_ready_for_nexttrans = 0;
                    end
                join_none
            end
            forever begin
                @allsvr_output_done;
                ->dut2tb_ap_done;
                fork
                    begin
                        @(negedge misc_if.clock);
                        ->misc_if.dut2tb_ap_done_evt;
                    end
                join_none
                fork
                    begin
                        misc_if.dut2tb_ap_done = 1;
                        @(posedge misc_if.clock);
                        misc_if.dut2tb_ap_done = 0;
                    end
                join_none
                -> ap_done_for_nexttrans;
                `uvm_info(this.get_full_name(), "trigger event ap_done_for_nexttrans", UVM_LOW)
                fork
                    begin
                        misc_if.ap_done_for_nexttrans = 1;
                        @(posedge misc_if.clock);
                        misc_if.ap_done_for_nexttrans = 0;
                    end
                join_none
            end

        join
    endtask

    virtual function void write_svr_master_in_stream(svr_transfer#(32) tr);
    //  trans_size++;
        svr_in_stream_delay = tr.delay;
        svr_in_stream_cov.sample();
        `uvm_info(this.get_full_name(), "port a collected one pkt", UVM_DEBUG);
    endfunction

    virtual function void write_svr_slave_out_stream(svr_transfer#(32) tr);
    //  trans_size++;
        svr_out_stream_delay = tr.delay;
        svr_out_stream_cov.sample();
        `uvm_info(this.get_full_name(), "port a collected one pkt", UVM_DEBUG);
    endfunction

    virtual function void write_axi_wtr_control(axi_pkg::axi_transfer tr);
        if(tr.addr == 0 && tr.len == 0 && tr.data[0][0]==1) begin //addr 0 and bit 0 are parameter
            -> write_start_finish;
            misc_if.tb2dut_ap_start = 1;
        end
    endfunction
    virtual function void write_axi_rtr_control(axi_pkg::axi_transfer tr);
            `uvm_info("receive axi read data", tr.sprint(), UVM_HIGH)
        if(tr.addr == 0 && tr.len == 0) begin
            if(tr.data[0][1]==1) begin  //bit 1 is parameter
                `uvm_info("status polling", "ap_done is polled", UVM_LOW);
                fork
                    begin
                        misc_if.dut2tb_ap_done = 1;
                        @(posedge misc_if.clock);
                        #0;
                        misc_if.dut2tb_ap_done = 0;
                        misc_if.tb2dut_ap_continue = 0;
                        -> dut2tb_ap_done;
                    end
                join_none
            end
            begin
                misc_if.dut2tb_ap_idle = tr.data[0][2];
            end
        end else begin
        end
    endfunction
endclass
`endif
