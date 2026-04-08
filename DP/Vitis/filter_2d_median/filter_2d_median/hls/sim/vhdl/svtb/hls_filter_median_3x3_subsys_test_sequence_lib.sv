//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef HLS_FILTER_MEDIAN_3X3_SUBSYS_TEST_SEQUENCE_LIB__SV                                              
    `define HLS_FILTER_MEDIAN_3X3_SUBSYS_TEST_SEQUENCE_LIB__SV                                          
                                                                                                    
    `define AUTOTB_TVIN_s_axis_video_s_axis_video_TDATA  "../tv/cdatafile/c.hls_filter_median_3x3.autotvin_s_axis_video.dat" 
                                                                                                    
    `include "uvm_macros.svh"                                                                     
                                                                                                    
    class hls_filter_median_3x3_subsys_test_sequence_lib extends uvm_sequence;                                
                                                                                                    
        function new (string name = "hls_filter_median_3x3_subsys_test_sequence_lib");                      
            super.new(name);                                                                        
            `uvm_info(this.get_full_name(), "new is called", UVM_LOW)                             
        endfunction                                                                                 
                                                                                                    
        `uvm_object_utils(hls_filter_median_3x3_subsys_test_sequence_lib)                                     
        `uvm_declare_p_sequencer(hls_filter_median_3x3_virtual_sequencer)                                     
                                                                                                    
        virtual task body();                                                                        
            uvm_phase starting_phase;                                                               
            virtual interface misc_interface misc_if;                                               
            hls_filter_median_3x3_reference_model refm;                                                       
                                                                                                    
            string file_queue_s_axis_video [$];                                                         
            integer bitwidth_queue_s_axis_video [$];                                                    
                                                                                                               
            svr_pkg::svr_master_sequence#(24) svr_port_s_axis_video_seq;            
            svr_pkg::svr_random_sequence#(24) svr_port_random_port_s_axis_video_seq;

            svr_pkg::svr_slave_sequence #(24) svr_port_m_axis_video_seq;            

            axi_pkg::axi_busdatas_master_sequence#(5, 32) axi_master_wr_control_seq;
            axi_pkg::axi_busdatas_master_sequence#(5, 32) axi_master_poll_control_seq;

            if (!uvm_config_db#(hls_filter_median_3x3_reference_model)::get(p_sequencer,"", "refm", refm))
                `uvm_fatal(this.get_full_name(), "No reference model")
            `uvm_info(this.get_full_name(), "get reference model by uvm_config_db", UVM_LOW)

            `uvm_info(this.get_full_name(), "body is called", UVM_LOW)
            starting_phase = this.get_starting_phase();
            if (starting_phase != null) begin
                `uvm_info(this.get_full_name(), "starting_phase not null", UVM_LOW)
                starting_phase.raise_objection(this);
            end
            else
                `uvm_info(this.get_full_name(), "starting_phase null" , UVM_LOW)

            misc_if = refm.misc_if;


            //phase_done.set_drain_time(this, 0ns);
            wait(refm.misc_if.reset === 1);
            ->refm.misc_if.initialed_evt;

            fork
                begin
                    fork
                        begin
                            string keystr_delay;
                            file_queue_s_axis_video.push_back(`AUTOTB_TVIN_s_axis_video_s_axis_video_TDATA);
                            bitwidth_queue_s_axis_video.push_back(24);

                            `uvm_create_on(svr_port_s_axis_video_seq, p_sequencer.svr_port_s_axis_video_sqr);
                            svr_port_s_axis_video_seq.misc_if = refm.misc_if;
                            svr_port_s_axis_video_seq.ap_done  = refm.ap_done_for_nexttrans ;
                            svr_port_s_axis_video_seq.ap_ready = refm.ap_ready_for_nexttrans;
                            svr_port_s_axis_video_seq.finish   = refm.finish;
                            svr_port_s_axis_video_seq.file_rd.config_file(file_queue_s_axis_video, bitwidth_queue_s_axis_video);
                            if( refm.hls_filter_median_3x3_cfg.port_s_axis_video_cfg.prt_type == AP_VLD ) wait(refm.misc_if.tb2dut_ap_start === 1'b1);
                            svr_port_s_axis_video_seq.isusr_delay = svr_pkg::NO_DELAY;
                            `uvm_send(svr_port_s_axis_video_seq);     
                        end                                               
                        begin
                            string keystr_delay;
                            `uvm_create_on(svr_port_m_axis_video_seq, p_sequencer.svr_port_m_axis_video_sqr);
                            svr_port_m_axis_video_seq.misc_if = refm.misc_if;
                            svr_port_m_axis_video_seq.ap_done  = refm.ap_done_for_nexttrans ;
                            svr_port_m_axis_video_seq.ap_ready = refm.ap_ready_for_nexttrans;
                            svr_port_m_axis_video_seq.finish   = refm.finish;
                            svr_port_m_axis_video_seq.isusr_delay = svr_pkg::NO_DELAY;
                            `uvm_send(svr_port_m_axis_video_seq);     
                        end                                               
                        begin
                            int control_page_idx_bak;
                            `uvm_create_on(axi_master_wr_control_seq, p_sequencer.control_sqr);
                            axi_master_wr_control_seq.misc_if = refm.misc_if;
                            axi_master_wr_control_seq.ap_done    = refm.ap_done_for_nexttrans   ;
                            axi_master_wr_control_seq.ap_ready   = refm.ap_ready_for_nexttrans  ;
                            axi_master_wr_control_seq.finish     = refm.finish ;
                            axi_master_wr_control_seq.isusr_delay = axi_pkg::NO_DELAY;
                            for(int i=0; i<4; i++) begin
                                logic[63:0] data64bit_width[$];
                                logic[32-1:0] databusbit_width[$];
                                logic[63:0] data64bit_height[$];
                                logic[32-1:0] databusbit_height[$];
                                data64bit_width.delete(); databusbit_width.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_width.tobusdata(data64bit_width, refm.mem_blk_pages_control_width.rd_page_idx, 32);
                                foreach(data64bit_width[s]) databusbit_width[s]=data64bit_width[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_width, 0, 16, 1);
                                data64bit_height.delete(); databusbit_height.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_height.tobusdata(data64bit_height, refm.mem_blk_pages_control_height.rd_page_idx, 32);
                                foreach(data64bit_height[s]) databusbit_height[s]=data64bit_height[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_height, 0, 24, 1);
                                `uvm_send(axi_master_wr_control_seq);
                                refm.write_data_finish_control = 1;
                                `uvm_info("control data writting thread", $sformatf("%0dth(total 4): waiting for all write data finish event",i), UVM_LOW)
                                wait(refm.allaxilite_write_data_finish.triggered);
                                refm.write_data_finish_control = 0;
                                fork
                                    begin // configure start to enable DUT
                                        axi_master_wr_control_seq.wr_addr_data.push_back( (1<<0)+(0<<32) );
                                        `uvm_info("control start dut by axilite", $sformatf("%0dth(total 4): begin to set start bit",i), UVM_LOW)
                                        `uvm_send(axi_master_wr_control_seq);
                                    end
                                    begin
                                        `uvm_info("control wait for ap_ready for next trans", $sformatf("%0dth(total 4): begin to wait",i), UVM_LOW)
                                        wait(refm.dut2tb_ap_ready.triggered);
                                        wait(refm.ap_done_for_nexttrans.triggered);
                                        #0.01; //make sure mem incr_rd_page_idx is called first
                                    end
                                join
                            end
                        end
                        begin
                            for(int j=0; j<4; j=j+refm.ap_done_cnt) begin
                                wait(misc_if.dut2tb_ap_done_kernel == 1);
                                `uvm_info("test finish control", $sformatf("ap_done of kernel is triggered"), UVM_LOW)
                                @(posedge misc_if.clock);
                                fork
                                    forever begin
                                        `uvm_create_on(axi_master_poll_control_seq, p_sequencer.control_sqr);
                                        axi_master_poll_control_seq.isusr_delay = axi_pkg::NO_DELAY;
                                        axi_master_poll_control_seq.misc_if = refm.misc_if;
                                        axi_master_poll_control_seq.rd_addr.push_back(0);
                                        `uvm_send(axi_master_poll_control_seq)
                                        repeat(2) @(posedge misc_if.clock);
                                    end
                                    begin
                                        `uvm_info("test finish control", $sformatf("%0dth(total 4) ap_done_for_nexttrans begin to wait",j), UVM_LOW)
                                        @refm.dut2tb_ap_done;
                                    end
                                join_any
                                disable fork;
                                wait(refm.ap_ready_for_nexttrans.triggered);
                            end
                        end
                        begin
                            wait(svr_port_s_axis_video_seq);
                            forever begin
                                wait(svr_port_s_axis_video_seq.one_sect_read);
                                svr_port_s_axis_video_seq.one_sect_read = 0;
                                -> refm.allsvr_input_done;
                            end
                        end
                    join
                end

                begin
                    for(int j=0; j<4; j=j+refm.ap_done_cnt) @refm.ap_done_for_nexttrans;
                    `uvm_info(this.get_full_name(), "autotb finished", UVM_LOW)
                    -> refm.finish;
                    refm.misc_if.finished = 1;
                    @(posedge refm.misc_if.clock);
                    refm.misc_if.finished = 0;
                    @(posedge refm.misc_if.clock);
                    -> refm.misc_if.finished_evt;
                end
            join_any
            repeat(5) @(posedge refm.misc_if.clock); //5 cycles delay for finish stuff. 5 is haphazard value

            p_sequencer.svr_port_s_axis_video_sqr.stop_sequences();
            p_sequencer.svr_port_m_axis_video_sqr.stop_sequences();
            p_sequencer.control_sqr.stop_sequences();
            disable fork;
                                                                                                    
            starting_phase.drop_objection(this);                                                    
                                                                                                    
        endtask                                                                                     
    endclass                                                                                        
                                                                                                    
`endif                                                                                              
