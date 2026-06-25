//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef HLS_FILTER_2D_SUBSYS_TEST_SEQUENCE_LIB__SV                                              
    `define HLS_FILTER_2D_SUBSYS_TEST_SEQUENCE_LIB__SV                                          
                                                                                                    
    `define AUTOTB_TVIN_s_axis_video_s_axis_video_TDATA  "../tv/cdatafile/c.hls_filter_2d.autotvin_s_axis_video.dat" 
                                                                                                    
    `include "uvm_macros.svh"                                                                     
                                                                                                    
    class hls_filter_2d_subsys_test_sequence_lib extends uvm_sequence;                                
                                                                                                    
        function new (string name = "hls_filter_2d_subsys_test_sequence_lib");                      
            super.new(name);                                                                        
            `uvm_info(this.get_full_name(), "new is called", UVM_LOW)                             
        endfunction                                                                                 
                                                                                                    
        `uvm_object_utils(hls_filter_2d_subsys_test_sequence_lib)                                     
        `uvm_declare_p_sequencer(hls_filter_2d_virtual_sequencer)                                     
                                                                                                    
        virtual task body();                                                                        
            uvm_phase starting_phase;                                                               
            virtual interface misc_interface misc_if;                                               
            hls_filter_2d_reference_model refm;                                                       
                                                                                                    
            string file_queue_s_axis_video [$];                                                         
            integer bitwidth_queue_s_axis_video [$];                                                    
                                                                                                               
            svr_pkg::svr_master_sequence#(24) svr_port_s_axis_video_seq;            
            svr_pkg::svr_random_sequence#(24) svr_port_random_port_s_axis_video_seq;

            svr_pkg::svr_slave_sequence #(24) svr_port_m_axis_video_seq;            

            axi_pkg::axi_busdatas_master_sequence#(9, 32) axi_master_wr_control_seq;
            axi_pkg::axi_busdatas_master_sequence#(9, 32) axi_master_poll_control_seq;

            if (!uvm_config_db#(hls_filter_2d_reference_model)::get(p_sequencer,"", "refm", refm))
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
                            if( refm.hls_filter_2d_cfg.port_s_axis_video_cfg.prt_type == AP_VLD ) wait(refm.misc_if.tb2dut_ap_start === 1'b1);
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
                            for(int i=0; i<2; i++) begin
                                logic[63:0] data64bit_width[$];
                                logic[32-1:0] databusbit_width[$];
                                logic[63:0] data64bit_height[$];
                                logic[32-1:0] databusbit_height[$];
                                logic[63:0] data64bit_kernel_0_0[$];
                                logic[32-1:0] databusbit_kernel_0_0[$];
                                logic[63:0] data64bit_kernel_0_1[$];
                                logic[32-1:0] databusbit_kernel_0_1[$];
                                logic[63:0] data64bit_kernel_0_2[$];
                                logic[32-1:0] databusbit_kernel_0_2[$];
                                logic[63:0] data64bit_kernel_0_3[$];
                                logic[32-1:0] databusbit_kernel_0_3[$];
                                logic[63:0] data64bit_kernel_0_4[$];
                                logic[32-1:0] databusbit_kernel_0_4[$];
                                logic[63:0] data64bit_kernel_1_0[$];
                                logic[32-1:0] databusbit_kernel_1_0[$];
                                logic[63:0] data64bit_kernel_1_1[$];
                                logic[32-1:0] databusbit_kernel_1_1[$];
                                logic[63:0] data64bit_kernel_1_2[$];
                                logic[32-1:0] databusbit_kernel_1_2[$];
                                logic[63:0] data64bit_kernel_1_3[$];
                                logic[32-1:0] databusbit_kernel_1_3[$];
                                logic[63:0] data64bit_kernel_1_4[$];
                                logic[32-1:0] databusbit_kernel_1_4[$];
                                logic[63:0] data64bit_kernel_2_0[$];
                                logic[32-1:0] databusbit_kernel_2_0[$];
                                logic[63:0] data64bit_kernel_2_1[$];
                                logic[32-1:0] databusbit_kernel_2_1[$];
                                logic[63:0] data64bit_kernel_2_2[$];
                                logic[32-1:0] databusbit_kernel_2_2[$];
                                logic[63:0] data64bit_kernel_2_3[$];
                                logic[32-1:0] databusbit_kernel_2_3[$];
                                logic[63:0] data64bit_kernel_2_4[$];
                                logic[32-1:0] databusbit_kernel_2_4[$];
                                logic[63:0] data64bit_kernel_3_0[$];
                                logic[32-1:0] databusbit_kernel_3_0[$];
                                logic[63:0] data64bit_kernel_3_1[$];
                                logic[32-1:0] databusbit_kernel_3_1[$];
                                logic[63:0] data64bit_kernel_3_2[$];
                                logic[32-1:0] databusbit_kernel_3_2[$];
                                logic[63:0] data64bit_kernel_3_3[$];
                                logic[32-1:0] databusbit_kernel_3_3[$];
                                logic[63:0] data64bit_kernel_3_4[$];
                                logic[32-1:0] databusbit_kernel_3_4[$];
                                logic[63:0] data64bit_kernel_4_0[$];
                                logic[32-1:0] databusbit_kernel_4_0[$];
                                logic[63:0] data64bit_kernel_4_1[$];
                                logic[32-1:0] databusbit_kernel_4_1[$];
                                logic[63:0] data64bit_kernel_4_2[$];
                                logic[32-1:0] databusbit_kernel_4_2[$];
                                logic[63:0] data64bit_kernel_4_3[$];
                                logic[32-1:0] databusbit_kernel_4_3[$];
                                logic[63:0] data64bit_kernel_4_4[$];
                                logic[32-1:0] databusbit_kernel_4_4[$];
                                logic[63:0] data64bit_inv_divisor[$];
                                logic[32-1:0] databusbit_inv_divisor[$];
                                logic[63:0] data64bit_fraction_bits[$];
                                logic[32-1:0] databusbit_fraction_bits[$];
                                logic[63:0] data64bit_delta[$];
                                logic[32-1:0] databusbit_delta[$];
                                logic[63:0] data64bit_borderType[$];
                                logic[32-1:0] databusbit_borderType[$];
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
                                data64bit_kernel_0_0.delete(); databusbit_kernel_0_0.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_0_0.tobusdata(data64bit_kernel_0_0, refm.mem_blk_pages_control_kernel_0_0.rd_page_idx, 32);
                                foreach(data64bit_kernel_0_0[s]) databusbit_kernel_0_0[s]=data64bit_kernel_0_0[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_0_0, 0, 32, 1);
                                data64bit_kernel_0_1.delete(); databusbit_kernel_0_1.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_0_1.tobusdata(data64bit_kernel_0_1, refm.mem_blk_pages_control_kernel_0_1.rd_page_idx, 32);
                                foreach(data64bit_kernel_0_1[s]) databusbit_kernel_0_1[s]=data64bit_kernel_0_1[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_0_1, 0, 40, 1);
                                data64bit_kernel_0_2.delete(); databusbit_kernel_0_2.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_0_2.tobusdata(data64bit_kernel_0_2, refm.mem_blk_pages_control_kernel_0_2.rd_page_idx, 32);
                                foreach(data64bit_kernel_0_2[s]) databusbit_kernel_0_2[s]=data64bit_kernel_0_2[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_0_2, 0, 48, 1);
                                data64bit_kernel_0_3.delete(); databusbit_kernel_0_3.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_0_3.tobusdata(data64bit_kernel_0_3, refm.mem_blk_pages_control_kernel_0_3.rd_page_idx, 32);
                                foreach(data64bit_kernel_0_3[s]) databusbit_kernel_0_3[s]=data64bit_kernel_0_3[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_0_3, 0, 56, 1);
                                data64bit_kernel_0_4.delete(); databusbit_kernel_0_4.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_0_4.tobusdata(data64bit_kernel_0_4, refm.mem_blk_pages_control_kernel_0_4.rd_page_idx, 32);
                                foreach(data64bit_kernel_0_4[s]) databusbit_kernel_0_4[s]=data64bit_kernel_0_4[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_0_4, 0, 64, 1);
                                data64bit_kernel_1_0.delete(); databusbit_kernel_1_0.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_1_0.tobusdata(data64bit_kernel_1_0, refm.mem_blk_pages_control_kernel_1_0.rd_page_idx, 32);
                                foreach(data64bit_kernel_1_0[s]) databusbit_kernel_1_0[s]=data64bit_kernel_1_0[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_1_0, 0, 72, 1);
                                data64bit_kernel_1_1.delete(); databusbit_kernel_1_1.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_1_1.tobusdata(data64bit_kernel_1_1, refm.mem_blk_pages_control_kernel_1_1.rd_page_idx, 32);
                                foreach(data64bit_kernel_1_1[s]) databusbit_kernel_1_1[s]=data64bit_kernel_1_1[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_1_1, 0, 80, 1);
                                data64bit_kernel_1_2.delete(); databusbit_kernel_1_2.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_1_2.tobusdata(data64bit_kernel_1_2, refm.mem_blk_pages_control_kernel_1_2.rd_page_idx, 32);
                                foreach(data64bit_kernel_1_2[s]) databusbit_kernel_1_2[s]=data64bit_kernel_1_2[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_1_2, 0, 88, 1);
                                data64bit_kernel_1_3.delete(); databusbit_kernel_1_3.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_1_3.tobusdata(data64bit_kernel_1_3, refm.mem_blk_pages_control_kernel_1_3.rd_page_idx, 32);
                                foreach(data64bit_kernel_1_3[s]) databusbit_kernel_1_3[s]=data64bit_kernel_1_3[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_1_3, 0, 96, 1);
                                data64bit_kernel_1_4.delete(); databusbit_kernel_1_4.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_1_4.tobusdata(data64bit_kernel_1_4, refm.mem_blk_pages_control_kernel_1_4.rd_page_idx, 32);
                                foreach(data64bit_kernel_1_4[s]) databusbit_kernel_1_4[s]=data64bit_kernel_1_4[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_1_4, 0, 104, 1);
                                data64bit_kernel_2_0.delete(); databusbit_kernel_2_0.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_2_0.tobusdata(data64bit_kernel_2_0, refm.mem_blk_pages_control_kernel_2_0.rd_page_idx, 32);
                                foreach(data64bit_kernel_2_0[s]) databusbit_kernel_2_0[s]=data64bit_kernel_2_0[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_2_0, 0, 112, 1);
                                data64bit_kernel_2_1.delete(); databusbit_kernel_2_1.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_2_1.tobusdata(data64bit_kernel_2_1, refm.mem_blk_pages_control_kernel_2_1.rd_page_idx, 32);
                                foreach(data64bit_kernel_2_1[s]) databusbit_kernel_2_1[s]=data64bit_kernel_2_1[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_2_1, 0, 120, 1);
                                data64bit_kernel_2_2.delete(); databusbit_kernel_2_2.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_2_2.tobusdata(data64bit_kernel_2_2, refm.mem_blk_pages_control_kernel_2_2.rd_page_idx, 32);
                                foreach(data64bit_kernel_2_2[s]) databusbit_kernel_2_2[s]=data64bit_kernel_2_2[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_2_2, 0, 128, 1);
                                data64bit_kernel_2_3.delete(); databusbit_kernel_2_3.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_2_3.tobusdata(data64bit_kernel_2_3, refm.mem_blk_pages_control_kernel_2_3.rd_page_idx, 32);
                                foreach(data64bit_kernel_2_3[s]) databusbit_kernel_2_3[s]=data64bit_kernel_2_3[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_2_3, 0, 136, 1);
                                data64bit_kernel_2_4.delete(); databusbit_kernel_2_4.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_2_4.tobusdata(data64bit_kernel_2_4, refm.mem_blk_pages_control_kernel_2_4.rd_page_idx, 32);
                                foreach(data64bit_kernel_2_4[s]) databusbit_kernel_2_4[s]=data64bit_kernel_2_4[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_2_4, 0, 144, 1);
                                data64bit_kernel_3_0.delete(); databusbit_kernel_3_0.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_3_0.tobusdata(data64bit_kernel_3_0, refm.mem_blk_pages_control_kernel_3_0.rd_page_idx, 32);
                                foreach(data64bit_kernel_3_0[s]) databusbit_kernel_3_0[s]=data64bit_kernel_3_0[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_3_0, 0, 152, 1);
                                data64bit_kernel_3_1.delete(); databusbit_kernel_3_1.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_3_1.tobusdata(data64bit_kernel_3_1, refm.mem_blk_pages_control_kernel_3_1.rd_page_idx, 32);
                                foreach(data64bit_kernel_3_1[s]) databusbit_kernel_3_1[s]=data64bit_kernel_3_1[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_3_1, 0, 160, 1);
                                data64bit_kernel_3_2.delete(); databusbit_kernel_3_2.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_3_2.tobusdata(data64bit_kernel_3_2, refm.mem_blk_pages_control_kernel_3_2.rd_page_idx, 32);
                                foreach(data64bit_kernel_3_2[s]) databusbit_kernel_3_2[s]=data64bit_kernel_3_2[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_3_2, 0, 168, 1);
                                data64bit_kernel_3_3.delete(); databusbit_kernel_3_3.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_3_3.tobusdata(data64bit_kernel_3_3, refm.mem_blk_pages_control_kernel_3_3.rd_page_idx, 32);
                                foreach(data64bit_kernel_3_3[s]) databusbit_kernel_3_3[s]=data64bit_kernel_3_3[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_3_3, 0, 176, 1);
                                data64bit_kernel_3_4.delete(); databusbit_kernel_3_4.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_3_4.tobusdata(data64bit_kernel_3_4, refm.mem_blk_pages_control_kernel_3_4.rd_page_idx, 32);
                                foreach(data64bit_kernel_3_4[s]) databusbit_kernel_3_4[s]=data64bit_kernel_3_4[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_3_4, 0, 184, 1);
                                data64bit_kernel_4_0.delete(); databusbit_kernel_4_0.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_4_0.tobusdata(data64bit_kernel_4_0, refm.mem_blk_pages_control_kernel_4_0.rd_page_idx, 32);
                                foreach(data64bit_kernel_4_0[s]) databusbit_kernel_4_0[s]=data64bit_kernel_4_0[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_4_0, 0, 192, 1);
                                data64bit_kernel_4_1.delete(); databusbit_kernel_4_1.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_4_1.tobusdata(data64bit_kernel_4_1, refm.mem_blk_pages_control_kernel_4_1.rd_page_idx, 32);
                                foreach(data64bit_kernel_4_1[s]) databusbit_kernel_4_1[s]=data64bit_kernel_4_1[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_4_1, 0, 200, 1);
                                data64bit_kernel_4_2.delete(); databusbit_kernel_4_2.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_4_2.tobusdata(data64bit_kernel_4_2, refm.mem_blk_pages_control_kernel_4_2.rd_page_idx, 32);
                                foreach(data64bit_kernel_4_2[s]) databusbit_kernel_4_2[s]=data64bit_kernel_4_2[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_4_2, 0, 208, 1);
                                data64bit_kernel_4_3.delete(); databusbit_kernel_4_3.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_4_3.tobusdata(data64bit_kernel_4_3, refm.mem_blk_pages_control_kernel_4_3.rd_page_idx, 32);
                                foreach(data64bit_kernel_4_3[s]) databusbit_kernel_4_3[s]=data64bit_kernel_4_3[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_4_3, 0, 216, 1);
                                data64bit_kernel_4_4.delete(); databusbit_kernel_4_4.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_kernel_4_4.tobusdata(data64bit_kernel_4_4, refm.mem_blk_pages_control_kernel_4_4.rd_page_idx, 32);
                                foreach(data64bit_kernel_4_4[s]) databusbit_kernel_4_4[s]=data64bit_kernel_4_4[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_kernel_4_4, 0, 224, 1);
                                data64bit_inv_divisor.delete(); databusbit_inv_divisor.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_inv_divisor.tobusdata(data64bit_inv_divisor, refm.mem_blk_pages_control_inv_divisor.rd_page_idx, 32);
                                foreach(data64bit_inv_divisor[s]) databusbit_inv_divisor[s]=data64bit_inv_divisor[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_inv_divisor, 0, 232, 1);
                                data64bit_fraction_bits.delete(); databusbit_fraction_bits.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_fraction_bits.tobusdata(data64bit_fraction_bits, refm.mem_blk_pages_control_fraction_bits.rd_page_idx, 32);
                                foreach(data64bit_fraction_bits[s]) databusbit_fraction_bits[s]=data64bit_fraction_bits[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_fraction_bits, 0, 240, 1);
                                data64bit_delta.delete(); databusbit_delta.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_delta.tobusdata(data64bit_delta, refm.mem_blk_pages_control_delta.rd_page_idx, 32);
                                foreach(data64bit_delta[s]) databusbit_delta[s]=data64bit_delta[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_delta, 0, 248, 1);
                                data64bit_borderType.delete(); databusbit_borderType.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_borderType.tobusdata(data64bit_borderType, refm.mem_blk_pages_control_borderType.rd_page_idx, 32);
                                foreach(data64bit_borderType[s]) databusbit_borderType[s]=data64bit_borderType[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_borderType, 0, 256, 1);
                                `uvm_send(axi_master_wr_control_seq);
                                refm.write_data_finish_control = 1;
                                `uvm_info("control data writting thread", $sformatf("%0dth(total 2): waiting for all write data finish event",i), UVM_LOW)
                                wait(refm.allaxilite_write_data_finish.triggered);
                                refm.write_data_finish_control = 0;
                                fork
                                    begin // configure start to enable DUT
                                        axi_master_wr_control_seq.wr_addr_data.push_back( (1<<0)+(0<<32) );
                                        `uvm_info("control start dut by axilite", $sformatf("%0dth(total 2): begin to set start bit",i), UVM_LOW)
                                        `uvm_send(axi_master_wr_control_seq);
                                    end
                                    begin
                                        `uvm_info("control wait for ap_ready for next trans", $sformatf("%0dth(total 2): begin to wait",i), UVM_LOW)
                                        wait(refm.dut2tb_ap_ready.triggered);
                                        wait(refm.ap_done_for_nexttrans.triggered);
                                        #0.01; //make sure mem incr_rd_page_idx is called first
                                    end
                                join
                            end
                        end
                        begin
                            for(int j=0; j<2; j=j+refm.ap_done_cnt) begin
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
                                        `uvm_info("test finish control", $sformatf("%0dth(total 2) ap_done_for_nexttrans begin to wait",j), UVM_LOW)
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
                    for(int j=0; j<2; j=j+refm.ap_done_cnt) @refm.ap_done_for_nexttrans;
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
