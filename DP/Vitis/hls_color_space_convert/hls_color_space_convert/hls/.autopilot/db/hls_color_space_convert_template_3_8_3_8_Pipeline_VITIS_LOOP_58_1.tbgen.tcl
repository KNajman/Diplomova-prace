set moduleName hls_color_space_convert_template_3_8_3_8_Pipeline_VITIS_LOOP_58_1
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
set cdfgNum 5
set C_modelName {hls_color_space_convert_template<3, 8, 3, 8>_Pipeline_VITIS_LOOP_58_1}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ total_pixels int 32 regular  }
	{ s_axis_video int 32 regular {axi_s 0 volatile  { s_axis_video Data } }  }
	{ sext_ln83 int 16 regular  }
	{ sext_ln83_1 int 16 regular  }
	{ sext_ln83_2 int 16 regular  }
	{ sext_ln83_9 int 16 regular  }
	{ sext_ln83_3 int 16 regular  }
	{ sext_ln83_4 int 16 regular  }
	{ sext_ln83_5 int 16 regular  }
	{ sext_ln83_10 int 16 regular  }
	{ sext_ln83_6 int 16 regular  }
	{ sext_ln83_7 int 16 regular  }
	{ sext_ln83_8 int 16 regular  }
	{ sext_ln58 int 16 regular  }
	{ add_ln104 int 32 regular  }
	{ m_axis_video int 32 regular {axi_s 1 volatile  { m_axis_video Data } }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "total_pixels", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln83", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln83_1", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln83_2", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln83_9", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln83_3", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln83_4", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln83_5", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln83_10", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln83_6", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln83_7", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln83_8", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln58", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "add_ln104", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_video", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 26
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ s_axis_video_TVALID sc_in sc_logic 1 invld 1 } 
	{ m_axis_video_TREADY sc_in sc_logic 1 outacc 15 } 
	{ total_pixels sc_in sc_lv 32 signal 0 } 
	{ s_axis_video_TDATA sc_in sc_lv 32 signal 1 } 
	{ s_axis_video_TREADY sc_out sc_logic 1 inacc 1 } 
	{ sext_ln83 sc_in sc_lv 16 signal 2 } 
	{ sext_ln83_1 sc_in sc_lv 16 signal 3 } 
	{ sext_ln83_2 sc_in sc_lv 16 signal 4 } 
	{ sext_ln83_9 sc_in sc_lv 16 signal 5 } 
	{ sext_ln83_3 sc_in sc_lv 16 signal 6 } 
	{ sext_ln83_4 sc_in sc_lv 16 signal 7 } 
	{ sext_ln83_5 sc_in sc_lv 16 signal 8 } 
	{ sext_ln83_10 sc_in sc_lv 16 signal 9 } 
	{ sext_ln83_6 sc_in sc_lv 16 signal 10 } 
	{ sext_ln83_7 sc_in sc_lv 16 signal 11 } 
	{ sext_ln83_8 sc_in sc_lv 16 signal 12 } 
	{ sext_ln58 sc_in sc_lv 16 signal 13 } 
	{ add_ln104 sc_in sc_lv 32 signal 14 } 
	{ m_axis_video_TDATA sc_out sc_lv 32 signal 15 } 
	{ m_axis_video_TVALID sc_out sc_logic 1 outvld 15 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s_axis_video_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_video", "role": "TVALID" }} , 
 	{ "name": "m_axis_video_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_video", "role": "TREADY" }} , 
 	{ "name": "total_pixels", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "total_pixels", "role": "default" }} , 
 	{ "name": "s_axis_video_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "s_axis_video", "role": "TDATA" }} , 
 	{ "name": "s_axis_video_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_video", "role": "TREADY" }} , 
 	{ "name": "sext_ln83", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln83", "role": "default" }} , 
 	{ "name": "sext_ln83_1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln83_1", "role": "default" }} , 
 	{ "name": "sext_ln83_2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln83_2", "role": "default" }} , 
 	{ "name": "sext_ln83_9", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln83_9", "role": "default" }} , 
 	{ "name": "sext_ln83_3", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln83_3", "role": "default" }} , 
 	{ "name": "sext_ln83_4", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln83_4", "role": "default" }} , 
 	{ "name": "sext_ln83_5", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln83_5", "role": "default" }} , 
 	{ "name": "sext_ln83_10", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln83_10", "role": "default" }} , 
 	{ "name": "sext_ln83_6", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln83_6", "role": "default" }} , 
 	{ "name": "sext_ln83_7", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln83_7", "role": "default" }} , 
 	{ "name": "sext_ln83_8", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln83_8", "role": "default" }} , 
 	{ "name": "sext_ln58", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln58", "role": "default" }} , 
 	{ "name": "add_ln104", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "add_ln104", "role": "default" }} , 
 	{ "name": "m_axis_video_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "m_axis_video", "role": "TDATA" }} , 
 	{ "name": "m_axis_video_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_video", "role": "TVALID" }}  ]}

set ArgLastReadFirstWriteLatency {
	hls_color_space_convert_template_3_8_3_8_Pipeline_VITIS_LOOP_58_1 {
		total_pixels {Type I LastRead 0 FirstWrite -1}
		s_axis_video {Type I LastRead 2 FirstWrite -1}
		sext_ln83 {Type I LastRead 0 FirstWrite -1}
		sext_ln83_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln83_2 {Type I LastRead 0 FirstWrite -1}
		sext_ln83_9 {Type I LastRead 0 FirstWrite -1}
		sext_ln83_3 {Type I LastRead 0 FirstWrite -1}
		sext_ln83_4 {Type I LastRead 0 FirstWrite -1}
		sext_ln83_5 {Type I LastRead 0 FirstWrite -1}
		sext_ln83_10 {Type I LastRead 0 FirstWrite -1}
		sext_ln83_6 {Type I LastRead 0 FirstWrite -1}
		sext_ln83_7 {Type I LastRead 0 FirstWrite -1}
		sext_ln83_8 {Type I LastRead 0 FirstWrite -1}
		sext_ln58 {Type I LastRead 0 FirstWrite -1}
		add_ln104 {Type I LastRead 0 FirstWrite -1}
		m_axis_video {Type O LastRead -1 FirstWrite 6}}}

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
	s_axis_video { axis {  { s_axis_video_TVALID in_vld 0 1 }  { s_axis_video_TDATA in_data 0 32 }  { s_axis_video_TREADY in_acc 1 1 } } }
	sext_ln83 { ap_none {  { sext_ln83 in_data 0 16 } } }
	sext_ln83_1 { ap_none {  { sext_ln83_1 in_data 0 16 } } }
	sext_ln83_2 { ap_none {  { sext_ln83_2 in_data 0 16 } } }
	sext_ln83_9 { ap_none {  { sext_ln83_9 in_data 0 16 } } }
	sext_ln83_3 { ap_none {  { sext_ln83_3 in_data 0 16 } } }
	sext_ln83_4 { ap_none {  { sext_ln83_4 in_data 0 16 } } }
	sext_ln83_5 { ap_none {  { sext_ln83_5 in_data 0 16 } } }
	sext_ln83_10 { ap_none {  { sext_ln83_10 in_data 0 16 } } }
	sext_ln83_6 { ap_none {  { sext_ln83_6 in_data 0 16 } } }
	sext_ln83_7 { ap_none {  { sext_ln83_7 in_data 0 16 } } }
	sext_ln83_8 { ap_none {  { sext_ln83_8 in_data 0 16 } } }
	sext_ln58 { ap_none {  { sext_ln58 in_data 0 16 } } }
	add_ln104 { ap_none {  { add_ln104 in_data 0 32 } } }
	m_axis_video { axis {  { m_axis_video_TREADY out_acc 0 1 }  { m_axis_video_TDATA out_data 1 32 }  { m_axis_video_TVALID out_vld 1 1 } } }
}
