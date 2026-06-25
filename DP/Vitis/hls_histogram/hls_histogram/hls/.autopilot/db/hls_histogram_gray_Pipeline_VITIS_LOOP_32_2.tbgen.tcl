set moduleName hls_histogram_gray_Pipeline_VITIS_LOOP_32_2
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set isPipelined_legacy 1
set pipeline_type loop_auto_rewind
set FunctionProtocol ap_ctrl_hs
set restart_counter_num 0
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 6
set C_modelName {hls_histogram_gray_Pipeline_VITIS_LOOP_32_2}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict local_hist { MEM_WIDTH 32 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ total_pixels int 32 regular  }
	{ stream_in int 24 regular {axi_s 0 volatile  { stream_in Data } }  }
	{ local_hist int 32 regular {array 256 { 0 1 } 1 1 }  }
	{ old_count_out int 32 regular {pointer 1}  }
	{ old_pixel_out int 8 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "total_pixels", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "stream_in", "interface" : "axis", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "local_hist", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "old_count_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "old_pixel_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 21
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ stream_in_TVALID sc_in sc_logic 1 invld 1 } 
	{ total_pixels sc_in sc_lv 32 signal 0 } 
	{ stream_in_TDATA sc_in sc_lv 24 signal 1 } 
	{ stream_in_TREADY sc_out sc_logic 1 inacc 1 } 
	{ local_hist_address0 sc_out sc_lv 8 signal 2 } 
	{ local_hist_ce0 sc_out sc_logic 1 signal 2 } 
	{ local_hist_we0 sc_out sc_logic 1 signal 2 } 
	{ local_hist_d0 sc_out sc_lv 32 signal 2 } 
	{ local_hist_address1 sc_out sc_lv 8 signal 2 } 
	{ local_hist_ce1 sc_out sc_logic 1 signal 2 } 
	{ local_hist_q1 sc_in sc_lv 32 signal 2 } 
	{ old_count_out sc_out sc_lv 32 signal 3 } 
	{ old_count_out_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ old_pixel_out sc_out sc_lv 8 signal 4 } 
	{ old_pixel_out_ap_vld sc_out sc_logic 1 outvld 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "stream_in_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "stream_in", "role": "TVALID" }} , 
 	{ "name": "total_pixels", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "total_pixels", "role": "default" }} , 
 	{ "name": "stream_in_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "stream_in", "role": "TDATA" }} , 
 	{ "name": "stream_in_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "stream_in", "role": "TREADY" }} , 
 	{ "name": "local_hist_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "local_hist", "role": "address0" }} , 
 	{ "name": "local_hist_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "local_hist", "role": "ce0" }} , 
 	{ "name": "local_hist_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "local_hist", "role": "we0" }} , 
 	{ "name": "local_hist_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "local_hist", "role": "d0" }} , 
 	{ "name": "local_hist_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "local_hist", "role": "address1" }} , 
 	{ "name": "local_hist_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "local_hist", "role": "ce1" }} , 
 	{ "name": "local_hist_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "local_hist", "role": "q1" }} , 
 	{ "name": "old_count_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "old_count_out", "role": "default" }} , 
 	{ "name": "old_count_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "old_count_out", "role": "ap_vld" }} , 
 	{ "name": "old_pixel_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "old_pixel_out", "role": "default" }} , 
 	{ "name": "old_pixel_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "old_pixel_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	hls_histogram_gray_Pipeline_VITIS_LOOP_32_2 {
		total_pixels {Type I LastRead 0 FirstWrite -1}
		stream_in {Type I LastRead 1 FirstWrite -1}
		local_hist {Type IO LastRead 1 FirstWrite 1}
		old_count_out {Type O LastRead -1 FirstWrite 1}
		old_pixel_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	total_pixels { ap_none {  { total_pixels in_data 0 32 } } }
	stream_in { axis {  { stream_in_TVALID in_vld 0 1 }  { stream_in_TDATA in_data 0 24 }  { stream_in_TREADY in_acc 1 1 } } }
	local_hist { ap_memory {  { local_hist_address0 mem_address 1 8 }  { local_hist_ce0 mem_ce 1 1 }  { local_hist_we0 mem_we 1 1 }  { local_hist_d0 mem_din 1 32 }  { local_hist_address1 MemPortADDR2 1 8 }  { local_hist_ce1 MemPortCE2 1 1 }  { local_hist_q1 MemPortDOUT2 0 32 } } }
	old_count_out { ap_vld {  { old_count_out out_data 1 32 }  { old_count_out_ap_vld out_vld 1 1 } } }
	old_pixel_out { ap_vld {  { old_pixel_out out_data 1 8 }  { old_pixel_out_ap_vld out_vld 1 1 } } }
}
