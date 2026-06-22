set moduleName hls_color_space_convert_top
set isTopModule 1
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
set C_modelName {hls_color_space_convert_top}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ s_axis_video int 32 regular {axi_s 0 volatile  { s_axis_video Data } }  }
	{ m_axis_video int 32 regular {axi_s 1 volatile  { m_axis_video Data } }  }
	{ coeffs_0_0 int 16 regular {axi_slave 0}  }
	{ coeffs_0_1 int 16 regular {axi_slave 0}  }
	{ coeffs_0_2 int 16 regular {axi_slave 0}  }
	{ coeffs_1_0 int 16 regular {axi_slave 0}  }
	{ coeffs_1_1 int 16 regular {axi_slave 0}  }
	{ coeffs_1_2 int 16 regular {axi_slave 0}  }
	{ coeffs_2_0 int 16 regular {axi_slave 0}  }
	{ coeffs_2_1 int 16 regular {axi_slave 0}  }
	{ coeffs_2_2 int 16 regular {axi_slave 0}  }
	{ offsets_0 int 16 regular {axi_slave 0}  }
	{ offsets_1 int 16 regular {axi_slave 0}  }
	{ offsets_2 int 16 regular {axi_slave 0}  }
	{ width int 32 regular {axi_slave 0}  }
	{ height int 32 regular {axi_slave 0}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_video", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_video", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "coeffs_0_0", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "coeffs_0_1", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":24}, "offset_end" : {"in":31}} , 
 	{ "Name" : "coeffs_0_2", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":32}, "offset_end" : {"in":39}} , 
 	{ "Name" : "coeffs_1_0", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":47}} , 
 	{ "Name" : "coeffs_1_1", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":48}, "offset_end" : {"in":55}} , 
 	{ "Name" : "coeffs_1_2", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":56}, "offset_end" : {"in":63}} , 
 	{ "Name" : "coeffs_2_0", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":64}, "offset_end" : {"in":71}} , 
 	{ "Name" : "coeffs_2_1", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":72}, "offset_end" : {"in":79}} , 
 	{ "Name" : "coeffs_2_2", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":80}, "offset_end" : {"in":87}} , 
 	{ "Name" : "offsets_0", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":88}, "offset_end" : {"in":95}} , 
 	{ "Name" : "offsets_1", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":96}, "offset_end" : {"in":103}} , 
 	{ "Name" : "offsets_2", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":104}, "offset_end" : {"in":111}} , 
 	{ "Name" : "width", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":112}, "offset_end" : {"in":119}} , 
 	{ "Name" : "height", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":120}, "offset_end" : {"in":127}} ]}
# RTL Port declarations: 
set portNum 26
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ s_axis_video_TDATA sc_in sc_lv 32 signal 0 } 
	{ s_axis_video_TVALID sc_in sc_logic 1 invld 0 } 
	{ s_axis_video_TREADY sc_out sc_logic 1 inacc 0 } 
	{ m_axis_video_TDATA sc_out sc_lv 32 signal 1 } 
	{ m_axis_video_TVALID sc_out sc_logic 1 outvld 1 } 
	{ m_axis_video_TREADY sc_in sc_logic 1 outacc 1 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"hls_color_space_convert_top","role":"start","value":"0","valid_bit":"0"},{"name":"hls_color_space_convert_top","role":"continue","value":"0","valid_bit":"4"},{"name":"hls_color_space_convert_top","role":"auto_start","value":"0","valid_bit":"7"},{"name":"coeffs_0_0","role":"data","value":"16"},{"name":"coeffs_0_1","role":"data","value":"24"},{"name":"coeffs_0_2","role":"data","value":"32"},{"name":"coeffs_1_0","role":"data","value":"40"},{"name":"coeffs_1_1","role":"data","value":"48"},{"name":"coeffs_1_2","role":"data","value":"56"},{"name":"coeffs_2_0","role":"data","value":"64"},{"name":"coeffs_2_1","role":"data","value":"72"},{"name":"coeffs_2_2","role":"data","value":"80"},{"name":"offsets_0","role":"data","value":"88"},{"name":"offsets_1","role":"data","value":"96"},{"name":"offsets_2","role":"data","value":"104"},{"name":"width","role":"data","value":"112"},{"name":"height","role":"data","value":"120"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"hls_color_space_convert_top","role":"start","value":"0","valid_bit":"0"},{"name":"hls_color_space_convert_top","role":"done","value":"0","valid_bit":"1"},{"name":"hls_color_space_convert_top","role":"idle","value":"0","valid_bit":"2"},{"name":"hls_color_space_convert_top","role":"ready","value":"0","valid_bit":"3"},{"name":"hls_color_space_convert_top","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "s_axis_video_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "s_axis_video", "role": "TDATA" }} , 
 	{ "name": "s_axis_video_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_video", "role": "TVALID" }} , 
 	{ "name": "s_axis_video_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_video", "role": "TREADY" }} , 
 	{ "name": "m_axis_video_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "m_axis_video", "role": "TDATA" }} , 
 	{ "name": "m_axis_video_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_video", "role": "TVALID" }} , 
 	{ "name": "m_axis_video_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_video", "role": "TREADY" }}  ]}

set ArgLastReadFirstWriteLatency {
	hls_color_space_convert_top {
		s_axis_video {Type I LastRead 2 FirstWrite -1}
		m_axis_video {Type O LastRead -1 FirstWrite 6}
		coeffs_0_0 {Type I LastRead 1 FirstWrite -1}
		coeffs_0_1 {Type I LastRead 1 FirstWrite -1}
		coeffs_0_2 {Type I LastRead 1 FirstWrite -1}
		coeffs_1_0 {Type I LastRead 1 FirstWrite -1}
		coeffs_1_1 {Type I LastRead 1 FirstWrite -1}
		coeffs_1_2 {Type I LastRead 1 FirstWrite -1}
		coeffs_2_0 {Type I LastRead 1 FirstWrite -1}
		coeffs_2_1 {Type I LastRead 1 FirstWrite -1}
		coeffs_2_2 {Type I LastRead 1 FirstWrite -1}
		offsets_0 {Type I LastRead 1 FirstWrite -1}
		offsets_1 {Type I LastRead 1 FirstWrite -1}
		offsets_2 {Type I LastRead 1 FirstWrite -1}
		width {Type I LastRead 1 FirstWrite -1}
		height {Type I LastRead 1 FirstWrite -1}}
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
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s_axis_video { axis {  { s_axis_video_TDATA in_data 0 32 }  { s_axis_video_TVALID in_vld 0 1 }  { s_axis_video_TREADY in_acc 1 1 } } }
	m_axis_video { axis {  { m_axis_video_TDATA out_data 1 32 }  { m_axis_video_TVALID out_vld 1 1 }  { m_axis_video_TREADY out_acc 0 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
