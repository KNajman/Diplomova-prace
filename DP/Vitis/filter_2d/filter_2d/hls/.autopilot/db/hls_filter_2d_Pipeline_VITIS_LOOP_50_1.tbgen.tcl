set moduleName hls_filter_2d_Pipeline_VITIS_LOOP_50_1
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
set cdfgNum 4
set C_modelName {hls_filter_2d_Pipeline_VITIS_LOOP_50_1}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ total_pixels int 26 regular  }
	{ flush_cycles int 15 regular  }
	{ total_cycles int 27 regular  }
	{ add_ln87 int 14 regular  }
	{ width int 13 regular  }
	{ s_axis_video int 24 regular {axi_s 0 volatile  { s_axis_video Data } }  }
	{ add_ln139 int 14 regular  }
	{ add_ln140 int 14 regular  }
	{ zext_ln121 int 13 regular  }
	{ zext_ln42 int 13 regular  }
	{ height int 13 regular  }
	{ sext_ln116_17 int 8 regular  }
	{ sext_ln116_16 int 8 regular  }
	{ sext_ln116_15 int 8 regular  }
	{ sext_ln116_14 int 8 regular  }
	{ sext_ln116_13 int 8 regular  }
	{ sext_ln116_12 int 8 regular  }
	{ sext_ln116_11 int 8 regular  }
	{ sext_ln116_10 int 8 regular  }
	{ sext_ln116_9 int 8 regular  }
	{ sext_ln116_8 int 8 regular  }
	{ sext_ln116_7 int 8 regular  }
	{ sext_ln116_6 int 8 regular  }
	{ sext_ln116_5 int 8 regular  }
	{ sext_ln116_4 int 8 regular  }
	{ sext_ln116_3 int 8 regular  }
	{ sext_ln116_2 int 8 regular  }
	{ sext_ln116 int 8 regular  }
	{ sext_ln116_1 int 8 regular  }
	{ sext_ln50 int 8 regular  }
	{ sext_ln116_23 int 8 regular  }
	{ sext_ln116_22 int 8 regular  }
	{ sext_ln116_21 int 8 regular  }
	{ sext_ln116_20 int 8 regular  }
	{ sext_ln116_19 int 8 regular  }
	{ sext_ln116_18 int 8 regular  }
	{ sext_ln121 int 32 regular  }
	{ zext_ln139 int 5 regular  }
	{ delta int 32 regular  }
	{ borderType int 1 regular  }
	{ add_ln154 int 14 regular  }
	{ m_axis_video int 24 regular {axi_s 1 volatile  { m_axis_video Data } }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "total_pixels", "interface" : "wire", "bitwidth" : 26, "direction" : "READONLY"} , 
 	{ "Name" : "flush_cycles", "interface" : "wire", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "total_cycles", "interface" : "wire", "bitwidth" : 27, "direction" : "READONLY"} , 
 	{ "Name" : "add_ln87", "interface" : "wire", "bitwidth" : 14, "direction" : "READONLY"} , 
 	{ "Name" : "width", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video", "interface" : "axis", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "add_ln139", "interface" : "wire", "bitwidth" : 14, "direction" : "READONLY"} , 
 	{ "Name" : "add_ln140", "interface" : "wire", "bitwidth" : 14, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln121", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln42", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "height", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116_17", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116_16", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116_15", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116_14", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116_13", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116_12", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116_11", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116_10", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116_9", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116_8", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116_7", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116_6", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116_5", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116_4", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116_3", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116_2", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116_1", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln50", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116_23", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116_22", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116_21", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116_20", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116_19", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln116_18", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln121", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln139", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "delta", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "borderType", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "add_ln154", "interface" : "wire", "bitwidth" : 14, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_video", "interface" : "axis", "bitwidth" : 24, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 52
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ s_axis_video_TVALID sc_in sc_logic 1 invld 5 } 
	{ m_axis_video_TREADY sc_in sc_logic 1 outacc 41 } 
	{ total_pixels sc_in sc_lv 26 signal 0 } 
	{ flush_cycles sc_in sc_lv 15 signal 1 } 
	{ total_cycles sc_in sc_lv 27 signal 2 } 
	{ add_ln87 sc_in sc_lv 14 signal 3 } 
	{ width sc_in sc_lv 13 signal 4 } 
	{ s_axis_video_TDATA sc_in sc_lv 24 signal 5 } 
	{ s_axis_video_TREADY sc_out sc_logic 1 inacc 5 } 
	{ add_ln139 sc_in sc_lv 14 signal 6 } 
	{ add_ln140 sc_in sc_lv 14 signal 7 } 
	{ zext_ln121 sc_in sc_lv 13 signal 8 } 
	{ zext_ln42 sc_in sc_lv 13 signal 9 } 
	{ height sc_in sc_lv 13 signal 10 } 
	{ sext_ln116_17 sc_in sc_lv 8 signal 11 } 
	{ sext_ln116_16 sc_in sc_lv 8 signal 12 } 
	{ sext_ln116_15 sc_in sc_lv 8 signal 13 } 
	{ sext_ln116_14 sc_in sc_lv 8 signal 14 } 
	{ sext_ln116_13 sc_in sc_lv 8 signal 15 } 
	{ sext_ln116_12 sc_in sc_lv 8 signal 16 } 
	{ sext_ln116_11 sc_in sc_lv 8 signal 17 } 
	{ sext_ln116_10 sc_in sc_lv 8 signal 18 } 
	{ sext_ln116_9 sc_in sc_lv 8 signal 19 } 
	{ sext_ln116_8 sc_in sc_lv 8 signal 20 } 
	{ sext_ln116_7 sc_in sc_lv 8 signal 21 } 
	{ sext_ln116_6 sc_in sc_lv 8 signal 22 } 
	{ sext_ln116_5 sc_in sc_lv 8 signal 23 } 
	{ sext_ln116_4 sc_in sc_lv 8 signal 24 } 
	{ sext_ln116_3 sc_in sc_lv 8 signal 25 } 
	{ sext_ln116_2 sc_in sc_lv 8 signal 26 } 
	{ sext_ln116 sc_in sc_lv 8 signal 27 } 
	{ sext_ln116_1 sc_in sc_lv 8 signal 28 } 
	{ sext_ln50 sc_in sc_lv 8 signal 29 } 
	{ sext_ln116_23 sc_in sc_lv 8 signal 30 } 
	{ sext_ln116_22 sc_in sc_lv 8 signal 31 } 
	{ sext_ln116_21 sc_in sc_lv 8 signal 32 } 
	{ sext_ln116_20 sc_in sc_lv 8 signal 33 } 
	{ sext_ln116_19 sc_in sc_lv 8 signal 34 } 
	{ sext_ln116_18 sc_in sc_lv 8 signal 35 } 
	{ sext_ln121 sc_in sc_lv 32 signal 36 } 
	{ zext_ln139 sc_in sc_lv 5 signal 37 } 
	{ delta sc_in sc_lv 32 signal 38 } 
	{ borderType sc_in sc_lv 1 signal 39 } 
	{ add_ln154 sc_in sc_lv 14 signal 40 } 
	{ m_axis_video_TDATA sc_out sc_lv 24 signal 41 } 
	{ m_axis_video_TVALID sc_out sc_logic 1 outvld 41 } 
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
 	{ "name": "total_pixels", "direction": "in", "datatype": "sc_lv", "bitwidth":26, "type": "signal", "bundle":{"name": "total_pixels", "role": "default" }} , 
 	{ "name": "flush_cycles", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "flush_cycles", "role": "default" }} , 
 	{ "name": "total_cycles", "direction": "in", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "total_cycles", "role": "default" }} , 
 	{ "name": "add_ln87", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "add_ln87", "role": "default" }} , 
 	{ "name": "width", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "width", "role": "default" }} , 
 	{ "name": "s_axis_video_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "s_axis_video", "role": "TDATA" }} , 
 	{ "name": "s_axis_video_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_video", "role": "TREADY" }} , 
 	{ "name": "add_ln139", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "add_ln139", "role": "default" }} , 
 	{ "name": "add_ln140", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "add_ln140", "role": "default" }} , 
 	{ "name": "zext_ln121", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "zext_ln121", "role": "default" }} , 
 	{ "name": "zext_ln42", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "zext_ln42", "role": "default" }} , 
 	{ "name": "height", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "height", "role": "default" }} , 
 	{ "name": "sext_ln116_17", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116_17", "role": "default" }} , 
 	{ "name": "sext_ln116_16", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116_16", "role": "default" }} , 
 	{ "name": "sext_ln116_15", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116_15", "role": "default" }} , 
 	{ "name": "sext_ln116_14", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116_14", "role": "default" }} , 
 	{ "name": "sext_ln116_13", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116_13", "role": "default" }} , 
 	{ "name": "sext_ln116_12", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116_12", "role": "default" }} , 
 	{ "name": "sext_ln116_11", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116_11", "role": "default" }} , 
 	{ "name": "sext_ln116_10", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116_10", "role": "default" }} , 
 	{ "name": "sext_ln116_9", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116_9", "role": "default" }} , 
 	{ "name": "sext_ln116_8", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116_8", "role": "default" }} , 
 	{ "name": "sext_ln116_7", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116_7", "role": "default" }} , 
 	{ "name": "sext_ln116_6", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116_6", "role": "default" }} , 
 	{ "name": "sext_ln116_5", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116_5", "role": "default" }} , 
 	{ "name": "sext_ln116_4", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116_4", "role": "default" }} , 
 	{ "name": "sext_ln116_3", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116_3", "role": "default" }} , 
 	{ "name": "sext_ln116_2", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116_2", "role": "default" }} , 
 	{ "name": "sext_ln116", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116", "role": "default" }} , 
 	{ "name": "sext_ln116_1", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116_1", "role": "default" }} , 
 	{ "name": "sext_ln50", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln50", "role": "default" }} , 
 	{ "name": "sext_ln116_23", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116_23", "role": "default" }} , 
 	{ "name": "sext_ln116_22", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116_22", "role": "default" }} , 
 	{ "name": "sext_ln116_21", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116_21", "role": "default" }} , 
 	{ "name": "sext_ln116_20", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116_20", "role": "default" }} , 
 	{ "name": "sext_ln116_19", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116_19", "role": "default" }} , 
 	{ "name": "sext_ln116_18", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln116_18", "role": "default" }} , 
 	{ "name": "sext_ln121", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sext_ln121", "role": "default" }} , 
 	{ "name": "zext_ln139", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "zext_ln139", "role": "default" }} , 
 	{ "name": "delta", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "delta", "role": "default" }} , 
 	{ "name": "borderType", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "borderType", "role": "default" }} , 
 	{ "name": "add_ln154", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "add_ln154", "role": "default" }} , 
 	{ "name": "m_axis_video_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "m_axis_video", "role": "TDATA" }} , 
 	{ "name": "m_axis_video_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_video", "role": "TVALID" }}  ]}

set ArgLastReadFirstWriteLatency {
	hls_filter_2d_Pipeline_VITIS_LOOP_50_1 {
		total_pixels {Type I LastRead 0 FirstWrite -1}
		flush_cycles {Type I LastRead 0 FirstWrite -1}
		total_cycles {Type I LastRead 0 FirstWrite -1}
		add_ln87 {Type I LastRead 0 FirstWrite -1}
		width {Type I LastRead 0 FirstWrite -1}
		s_axis_video {Type I LastRead 1 FirstWrite -1}
		add_ln139 {Type I LastRead 0 FirstWrite -1}
		add_ln140 {Type I LastRead 0 FirstWrite -1}
		zext_ln121 {Type I LastRead 0 FirstWrite -1}
		zext_ln42 {Type I LastRead 0 FirstWrite -1}
		height {Type I LastRead 0 FirstWrite -1}
		sext_ln116_17 {Type I LastRead 0 FirstWrite -1}
		sext_ln116_16 {Type I LastRead 0 FirstWrite -1}
		sext_ln116_15 {Type I LastRead 0 FirstWrite -1}
		sext_ln116_14 {Type I LastRead 0 FirstWrite -1}
		sext_ln116_13 {Type I LastRead 0 FirstWrite -1}
		sext_ln116_12 {Type I LastRead 0 FirstWrite -1}
		sext_ln116_11 {Type I LastRead 0 FirstWrite -1}
		sext_ln116_10 {Type I LastRead 0 FirstWrite -1}
		sext_ln116_9 {Type I LastRead 0 FirstWrite -1}
		sext_ln116_8 {Type I LastRead 0 FirstWrite -1}
		sext_ln116_7 {Type I LastRead 0 FirstWrite -1}
		sext_ln116_6 {Type I LastRead 0 FirstWrite -1}
		sext_ln116_5 {Type I LastRead 0 FirstWrite -1}
		sext_ln116_4 {Type I LastRead 0 FirstWrite -1}
		sext_ln116_3 {Type I LastRead 0 FirstWrite -1}
		sext_ln116_2 {Type I LastRead 0 FirstWrite -1}
		sext_ln116 {Type I LastRead 0 FirstWrite -1}
		sext_ln116_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln50 {Type I LastRead 0 FirstWrite -1}
		sext_ln116_23 {Type I LastRead 0 FirstWrite -1}
		sext_ln116_22 {Type I LastRead 0 FirstWrite -1}
		sext_ln116_21 {Type I LastRead 0 FirstWrite -1}
		sext_ln116_20 {Type I LastRead 0 FirstWrite -1}
		sext_ln116_19 {Type I LastRead 0 FirstWrite -1}
		sext_ln116_18 {Type I LastRead 0 FirstWrite -1}
		sext_ln121 {Type I LastRead 0 FirstWrite -1}
		zext_ln139 {Type I LastRead 0 FirstWrite -1}
		delta {Type I LastRead 0 FirstWrite -1}
		borderType {Type I LastRead 0 FirstWrite -1}
		add_ln154 {Type I LastRead 0 FirstWrite -1}
		m_axis_video {Type O LastRead -1 FirstWrite 9}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "12", "Max" : "67108875"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "67108865"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	total_pixels { ap_none {  { total_pixels in_data 0 26 } } }
	flush_cycles { ap_none {  { flush_cycles in_data 0 15 } } }
	total_cycles { ap_none {  { total_cycles in_data 0 27 } } }
	add_ln87 { ap_none {  { add_ln87 in_data 0 14 } } }
	width { ap_none {  { width in_data 0 13 } } }
	s_axis_video { axis {  { s_axis_video_TVALID in_vld 0 1 }  { s_axis_video_TDATA in_data 0 24 }  { s_axis_video_TREADY in_acc 1 1 } } }
	add_ln139 { ap_none {  { add_ln139 in_data 0 14 } } }
	add_ln140 { ap_none {  { add_ln140 in_data 0 14 } } }
	zext_ln121 { ap_none {  { zext_ln121 in_data 0 13 } } }
	zext_ln42 { ap_none {  { zext_ln42 in_data 0 13 } } }
	height { ap_none {  { height in_data 0 13 } } }
	sext_ln116_17 { ap_none {  { sext_ln116_17 in_data 0 8 } } }
	sext_ln116_16 { ap_none {  { sext_ln116_16 in_data 0 8 } } }
	sext_ln116_15 { ap_none {  { sext_ln116_15 in_data 0 8 } } }
	sext_ln116_14 { ap_none {  { sext_ln116_14 in_data 0 8 } } }
	sext_ln116_13 { ap_none {  { sext_ln116_13 in_data 0 8 } } }
	sext_ln116_12 { ap_none {  { sext_ln116_12 in_data 0 8 } } }
	sext_ln116_11 { ap_none {  { sext_ln116_11 in_data 0 8 } } }
	sext_ln116_10 { ap_none {  { sext_ln116_10 in_data 0 8 } } }
	sext_ln116_9 { ap_none {  { sext_ln116_9 in_data 0 8 } } }
	sext_ln116_8 { ap_none {  { sext_ln116_8 in_data 0 8 } } }
	sext_ln116_7 { ap_none {  { sext_ln116_7 in_data 0 8 } } }
	sext_ln116_6 { ap_none {  { sext_ln116_6 in_data 0 8 } } }
	sext_ln116_5 { ap_none {  { sext_ln116_5 in_data 0 8 } } }
	sext_ln116_4 { ap_none {  { sext_ln116_4 in_data 0 8 } } }
	sext_ln116_3 { ap_none {  { sext_ln116_3 in_data 0 8 } } }
	sext_ln116_2 { ap_none {  { sext_ln116_2 in_data 0 8 } } }
	sext_ln116 { ap_none {  { sext_ln116 in_data 0 8 } } }
	sext_ln116_1 { ap_none {  { sext_ln116_1 in_data 0 8 } } }
	sext_ln50 { ap_none {  { sext_ln50 in_data 0 8 } } }
	sext_ln116_23 { ap_none {  { sext_ln116_23 in_data 0 8 } } }
	sext_ln116_22 { ap_none {  { sext_ln116_22 in_data 0 8 } } }
	sext_ln116_21 { ap_none {  { sext_ln116_21 in_data 0 8 } } }
	sext_ln116_20 { ap_none {  { sext_ln116_20 in_data 0 8 } } }
	sext_ln116_19 { ap_none {  { sext_ln116_19 in_data 0 8 } } }
	sext_ln116_18 { ap_none {  { sext_ln116_18 in_data 0 8 } } }
	sext_ln121 { ap_none {  { sext_ln121 in_data 0 32 } } }
	zext_ln139 { ap_none {  { zext_ln139 in_data 0 5 } } }
	delta { ap_none {  { delta in_data 0 32 } } }
	borderType { ap_none {  { borderType in_data 0 1 } } }
	add_ln154 { ap_none {  { add_ln154 in_data 0 14 } } }
	m_axis_video { axis {  { m_axis_video_TREADY out_acc 0 1 }  { m_axis_video_TDATA out_data 1 24 }  { m_axis_video_TVALID out_vld 1 1 } } }
}
