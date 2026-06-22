set moduleName hls_color_space_convert_template_3_8_3_8_s
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isPipelined_legacy 0
set pipeline_type none
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
set cdfgNum 5
set C_modelName {hls_color_space_convert_template<3, 8, 3, 8>}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ s_axis_video int 32 regular {axi_s 0 volatile  { s_axis_video Data } }  }
	{ m_axis_video int 32 regular {axi_s 1 volatile  { m_axis_video Data } }  }
	{ coeffs_0_0_0_0_0_0_val int 16 regular  }
	{ coeffs_0_1_0_0_0_0_val int 16 regular  }
	{ coeffs_0_2_0_0_0_0_val int 16 regular  }
	{ coeffs_1_0_0_0_0_0_val int 16 regular  }
	{ coeffs_1_1_0_0_0_0_val int 16 regular  }
	{ coeffs_1_2_0_0_0_0_val int 16 regular  }
	{ coeffs_2_0_0_0_0_0_val int 16 regular  }
	{ coeffs_2_1_0_0_0_0_val int 16 regular  }
	{ coeffs_2_2_0_0_0_0_val int 16 regular  }
	{ offsets_0_val int 16 regular  }
	{ offsets_1_val int 16 regular  }
	{ offsets_2_val int 16 regular  }
	{ width int 32 regular  }
	{ height int 32 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_video", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_video", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "coeffs_0_0_0_0_0_0_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_0_1_0_0_0_0_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_0_2_0_0_0_0_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_1_0_0_0_0_0_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_1_1_0_0_0_0_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_1_2_0_0_0_0_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_2_0_0_0_0_0_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_2_1_0_0_0_0_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_2_2_0_0_0_0_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "offsets_0_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "offsets_1_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "offsets_2_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "width", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "height", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 26
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ s_axis_video_TDATA sc_in sc_lv 32 signal 0 } 
	{ s_axis_video_TVALID sc_in sc_logic 1 invld 0 } 
	{ s_axis_video_TREADY sc_out sc_logic 1 inacc 0 } 
	{ m_axis_video_TDATA sc_out sc_lv 32 signal 1 } 
	{ m_axis_video_TVALID sc_out sc_logic 1 outvld 1 } 
	{ m_axis_video_TREADY sc_in sc_logic 1 outacc 1 } 
	{ coeffs_0_0_0_0_0_0_val sc_in sc_lv 16 signal 2 } 
	{ coeffs_0_1_0_0_0_0_val sc_in sc_lv 16 signal 3 } 
	{ coeffs_0_2_0_0_0_0_val sc_in sc_lv 16 signal 4 } 
	{ coeffs_1_0_0_0_0_0_val sc_in sc_lv 16 signal 5 } 
	{ coeffs_1_1_0_0_0_0_val sc_in sc_lv 16 signal 6 } 
	{ coeffs_1_2_0_0_0_0_val sc_in sc_lv 16 signal 7 } 
	{ coeffs_2_0_0_0_0_0_val sc_in sc_lv 16 signal 8 } 
	{ coeffs_2_1_0_0_0_0_val sc_in sc_lv 16 signal 9 } 
	{ coeffs_2_2_0_0_0_0_val sc_in sc_lv 16 signal 10 } 
	{ offsets_0_val sc_in sc_lv 16 signal 11 } 
	{ offsets_1_val sc_in sc_lv 16 signal 12 } 
	{ offsets_2_val sc_in sc_lv 16 signal 13 } 
	{ width sc_in sc_lv 32 signal 14 } 
	{ height sc_in sc_lv 32 signal 15 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s_axis_video_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "s_axis_video", "role": "TDATA" }} , 
 	{ "name": "s_axis_video_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_video", "role": "TVALID" }} , 
 	{ "name": "s_axis_video_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_video", "role": "TREADY" }} , 
 	{ "name": "m_axis_video_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "m_axis_video", "role": "TDATA" }} , 
 	{ "name": "m_axis_video_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_video", "role": "TVALID" }} , 
 	{ "name": "m_axis_video_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_video", "role": "TREADY" }} , 
 	{ "name": "coeffs_0_0_0_0_0_0_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_0_0_0_0_0_0_val", "role": "default" }} , 
 	{ "name": "coeffs_0_1_0_0_0_0_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_0_1_0_0_0_0_val", "role": "default" }} , 
 	{ "name": "coeffs_0_2_0_0_0_0_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_0_2_0_0_0_0_val", "role": "default" }} , 
 	{ "name": "coeffs_1_0_0_0_0_0_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_1_0_0_0_0_0_val", "role": "default" }} , 
 	{ "name": "coeffs_1_1_0_0_0_0_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_1_1_0_0_0_0_val", "role": "default" }} , 
 	{ "name": "coeffs_1_2_0_0_0_0_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_1_2_0_0_0_0_val", "role": "default" }} , 
 	{ "name": "coeffs_2_0_0_0_0_0_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_2_0_0_0_0_0_val", "role": "default" }} , 
 	{ "name": "coeffs_2_1_0_0_0_0_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_2_1_0_0_0_0_val", "role": "default" }} , 
 	{ "name": "coeffs_2_2_0_0_0_0_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_2_2_0_0_0_0_val", "role": "default" }} , 
 	{ "name": "offsets_0_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "offsets_0_val", "role": "default" }} , 
 	{ "name": "offsets_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "offsets_1_val", "role": "default" }} , 
 	{ "name": "offsets_2_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "offsets_2_val", "role": "default" }} , 
 	{ "name": "width", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "width", "role": "default" }} , 
 	{ "name": "height", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "height", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	hls_color_space_convert_template_3_8_3_8_s {
		s_axis_video {Type I LastRead 2 FirstWrite -1}
		m_axis_video {Type O LastRead -1 FirstWrite 6}
		coeffs_0_0_0_0_0_0_val {Type I LastRead 1 FirstWrite -1}
		coeffs_0_1_0_0_0_0_val {Type I LastRead 1 FirstWrite -1}
		coeffs_0_2_0_0_0_0_val {Type I LastRead 1 FirstWrite -1}
		coeffs_1_0_0_0_0_0_val {Type I LastRead 1 FirstWrite -1}
		coeffs_1_1_0_0_0_0_val {Type I LastRead 1 FirstWrite -1}
		coeffs_1_2_0_0_0_0_val {Type I LastRead 1 FirstWrite -1}
		coeffs_2_0_0_0_0_0_val {Type I LastRead 1 FirstWrite -1}
		coeffs_2_1_0_0_0_0_val {Type I LastRead 1 FirstWrite -1}
		coeffs_2_2_0_0_0_0_val {Type I LastRead 1 FirstWrite -1}
		offsets_0_val {Type I LastRead 1 FirstWrite -1}
		offsets_1_val {Type I LastRead 1 FirstWrite -1}
		offsets_2_val {Type I LastRead 1 FirstWrite -1}
		width {Type I LastRead 0 FirstWrite -1}
		height {Type I LastRead 0 FirstWrite -1}}
	hls_color_space_convert_template_3_8_3_8_Pipeline_VITIS_LOOP_19_1 {
		total_pixels {Type I LastRead 0 FirstWrite -1}
		s_axis_video {Type I LastRead 2 FirstWrite -1}
		sext_ln29 {Type I LastRead 0 FirstWrite -1}
		sext_ln29_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln29_2 {Type I LastRead 0 FirstWrite -1}
		sext_ln29_9 {Type I LastRead 0 FirstWrite -1}
		sext_ln29_3 {Type I LastRead 0 FirstWrite -1}
		sext_ln29_4 {Type I LastRead 0 FirstWrite -1}
		sext_ln29_5 {Type I LastRead 0 FirstWrite -1}
		sext_ln29_10 {Type I LastRead 0 FirstWrite -1}
		sext_ln29_6 {Type I LastRead 0 FirstWrite -1}
		sext_ln29_7 {Type I LastRead 0 FirstWrite -1}
		sext_ln29_8 {Type I LastRead 0 FirstWrite -1}
		sext_ln19 {Type I LastRead 0 FirstWrite -1}
		add_ln43 {Type I LastRead 0 FirstWrite -1}
		m_axis_video {Type O LastRead -1 FirstWrite 6}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s_axis_video { axis {  { s_axis_video_TDATA in_data 0 32 }  { s_axis_video_TVALID in_vld 0 1 }  { s_axis_video_TREADY in_acc 1 1 } } }
	m_axis_video { axis {  { m_axis_video_TDATA out_data 1 32 }  { m_axis_video_TVALID out_vld 1 1 }  { m_axis_video_TREADY out_acc 0 1 } } }
	coeffs_0_0_0_0_0_0_val { ap_none {  { coeffs_0_0_0_0_0_0_val in_data 0 16 } } }
	coeffs_0_1_0_0_0_0_val { ap_none {  { coeffs_0_1_0_0_0_0_val in_data 0 16 } } }
	coeffs_0_2_0_0_0_0_val { ap_none {  { coeffs_0_2_0_0_0_0_val in_data 0 16 } } }
	coeffs_1_0_0_0_0_0_val { ap_none {  { coeffs_1_0_0_0_0_0_val in_data 0 16 } } }
	coeffs_1_1_0_0_0_0_val { ap_none {  { coeffs_1_1_0_0_0_0_val in_data 0 16 } } }
	coeffs_1_2_0_0_0_0_val { ap_none {  { coeffs_1_2_0_0_0_0_val in_data 0 16 } } }
	coeffs_2_0_0_0_0_0_val { ap_none {  { coeffs_2_0_0_0_0_0_val in_data 0 16 } } }
	coeffs_2_1_0_0_0_0_val { ap_none {  { coeffs_2_1_0_0_0_0_val in_data 0 16 } } }
	coeffs_2_2_0_0_0_0_val { ap_none {  { coeffs_2_2_0_0_0_0_val in_data 0 16 } } }
	offsets_0_val { ap_none {  { offsets_0_val in_data 0 16 } } }
	offsets_1_val { ap_none {  { offsets_1_val in_data 0 16 } } }
	offsets_2_val { ap_none {  { offsets_2_val in_data 0 16 } } }
	width { ap_none {  { width in_data 0 32 } } }
	height { ap_none {  { height in_data 0 32 } } }
}
