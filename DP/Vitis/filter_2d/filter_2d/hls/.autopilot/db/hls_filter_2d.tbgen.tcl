set moduleName hls_filter_2d
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
set cdfgNum 4
set C_modelName {hls_filter_2d}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ s_axis_video int 24 regular {axi_s 0 volatile  { s_axis_video Data } }  }
	{ m_axis_video int 24 regular {axi_s 1 volatile  { m_axis_video Data } }  }
	{ width int 13 regular {axi_slave 0}  }
	{ height int 13 regular {axi_slave 0}  }
	{ kernel_0_0 int 8 regular {axi_slave 0}  }
	{ kernel_0_1 int 8 regular {axi_slave 0}  }
	{ kernel_0_2 int 8 regular {axi_slave 0}  }
	{ kernel_0_3 int 8 regular {axi_slave 0}  }
	{ kernel_0_4 int 8 regular {axi_slave 0}  }
	{ kernel_1_0 int 8 regular {axi_slave 0}  }
	{ kernel_1_1 int 8 regular {axi_slave 0}  }
	{ kernel_1_2 int 8 regular {axi_slave 0}  }
	{ kernel_1_3 int 8 regular {axi_slave 0}  }
	{ kernel_1_4 int 8 regular {axi_slave 0}  }
	{ kernel_2_0 int 8 regular {axi_slave 0}  }
	{ kernel_2_1 int 8 regular {axi_slave 0}  }
	{ kernel_2_2 int 8 regular {axi_slave 0}  }
	{ kernel_2_3 int 8 regular {axi_slave 0}  }
	{ kernel_2_4 int 8 regular {axi_slave 0}  }
	{ kernel_3_0 int 8 regular {axi_slave 0}  }
	{ kernel_3_1 int 8 regular {axi_slave 0}  }
	{ kernel_3_2 int 8 regular {axi_slave 0}  }
	{ kernel_3_3 int 8 regular {axi_slave 0}  }
	{ kernel_3_4 int 8 regular {axi_slave 0}  }
	{ kernel_4_0 int 8 regular {axi_slave 0}  }
	{ kernel_4_1 int 8 regular {axi_slave 0}  }
	{ kernel_4_2 int 8 regular {axi_slave 0}  }
	{ kernel_4_3 int 8 regular {axi_slave 0}  }
	{ kernel_4_4 int 8 regular {axi_slave 0}  }
	{ inv_divisor int 32 regular {axi_slave 0}  }
	{ fraction_bits int 5 regular {axi_slave 0}  }
	{ delta int 32 regular {axi_slave 0}  }
	{ borderType int 1 regular {axi_slave 0}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_video", "interface" : "axis", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_video", "interface" : "axis", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "width", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 13, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "height", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 13, "direction" : "READONLY", "offset" : {"in":24}, "offset_end" : {"in":31}} , 
 	{ "Name" : "kernel_0_0", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":32}, "offset_end" : {"in":39}} , 
 	{ "Name" : "kernel_0_1", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":47}} , 
 	{ "Name" : "kernel_0_2", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":48}, "offset_end" : {"in":55}} , 
 	{ "Name" : "kernel_0_3", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":56}, "offset_end" : {"in":63}} , 
 	{ "Name" : "kernel_0_4", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":64}, "offset_end" : {"in":71}} , 
 	{ "Name" : "kernel_1_0", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":72}, "offset_end" : {"in":79}} , 
 	{ "Name" : "kernel_1_1", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":80}, "offset_end" : {"in":87}} , 
 	{ "Name" : "kernel_1_2", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":88}, "offset_end" : {"in":95}} , 
 	{ "Name" : "kernel_1_3", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":96}, "offset_end" : {"in":103}} , 
 	{ "Name" : "kernel_1_4", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":104}, "offset_end" : {"in":111}} , 
 	{ "Name" : "kernel_2_0", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":112}, "offset_end" : {"in":119}} , 
 	{ "Name" : "kernel_2_1", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":120}, "offset_end" : {"in":127}} , 
 	{ "Name" : "kernel_2_2", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":128}, "offset_end" : {"in":135}} , 
 	{ "Name" : "kernel_2_3", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":136}, "offset_end" : {"in":143}} , 
 	{ "Name" : "kernel_2_4", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":144}, "offset_end" : {"in":151}} , 
 	{ "Name" : "kernel_3_0", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":152}, "offset_end" : {"in":159}} , 
 	{ "Name" : "kernel_3_1", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":160}, "offset_end" : {"in":167}} , 
 	{ "Name" : "kernel_3_2", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":168}, "offset_end" : {"in":175}} , 
 	{ "Name" : "kernel_3_3", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":176}, "offset_end" : {"in":183}} , 
 	{ "Name" : "kernel_3_4", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":184}, "offset_end" : {"in":191}} , 
 	{ "Name" : "kernel_4_0", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":192}, "offset_end" : {"in":199}} , 
 	{ "Name" : "kernel_4_1", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":200}, "offset_end" : {"in":207}} , 
 	{ "Name" : "kernel_4_2", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":208}, "offset_end" : {"in":215}} , 
 	{ "Name" : "kernel_4_3", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":216}, "offset_end" : {"in":223}} , 
 	{ "Name" : "kernel_4_4", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":224}, "offset_end" : {"in":231}} , 
 	{ "Name" : "inv_divisor", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":232}, "offset_end" : {"in":239}} , 
 	{ "Name" : "fraction_bits", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 5, "direction" : "READONLY", "offset" : {"in":240}, "offset_end" : {"in":247}} , 
 	{ "Name" : "delta", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":248}, "offset_end" : {"in":255}} , 
 	{ "Name" : "borderType", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 1, "direction" : "READONLY", "offset" : {"in":256}, "offset_end" : {"in":263}} ]}
# RTL Port declarations: 
set portNum 26
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ s_axis_video_TDATA sc_in sc_lv 24 signal 0 } 
	{ s_axis_video_TVALID sc_in sc_logic 1 invld 0 } 
	{ s_axis_video_TREADY sc_out sc_logic 1 inacc 0 } 
	{ m_axis_video_TDATA sc_out sc_lv 24 signal 1 } 
	{ m_axis_video_TVALID sc_out sc_logic 1 outvld 1 } 
	{ m_axis_video_TREADY sc_in sc_logic 1 outacc 1 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 9 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 9 signal -1 } 
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
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"hls_filter_2d","role":"start","value":"0","valid_bit":"0"},{"name":"hls_filter_2d","role":"continue","value":"0","valid_bit":"4"},{"name":"hls_filter_2d","role":"auto_start","value":"0","valid_bit":"7"},{"name":"width","role":"data","value":"16"},{"name":"height","role":"data","value":"24"},{"name":"kernel_0_0","role":"data","value":"32"},{"name":"kernel_0_1","role":"data","value":"40"},{"name":"kernel_0_2","role":"data","value":"48"},{"name":"kernel_0_3","role":"data","value":"56"},{"name":"kernel_0_4","role":"data","value":"64"},{"name":"kernel_1_0","role":"data","value":"72"},{"name":"kernel_1_1","role":"data","value":"80"},{"name":"kernel_1_2","role":"data","value":"88"},{"name":"kernel_1_3","role":"data","value":"96"},{"name":"kernel_1_4","role":"data","value":"104"},{"name":"kernel_2_0","role":"data","value":"112"},{"name":"kernel_2_1","role":"data","value":"120"},{"name":"kernel_2_2","role":"data","value":"128"},{"name":"kernel_2_3","role":"data","value":"136"},{"name":"kernel_2_4","role":"data","value":"144"},{"name":"kernel_3_0","role":"data","value":"152"},{"name":"kernel_3_1","role":"data","value":"160"},{"name":"kernel_3_2","role":"data","value":"168"},{"name":"kernel_3_3","role":"data","value":"176"},{"name":"kernel_3_4","role":"data","value":"184"},{"name":"kernel_4_0","role":"data","value":"192"},{"name":"kernel_4_1","role":"data","value":"200"},{"name":"kernel_4_2","role":"data","value":"208"},{"name":"kernel_4_3","role":"data","value":"216"},{"name":"kernel_4_4","role":"data","value":"224"},{"name":"inv_divisor","role":"data","value":"232"},{"name":"fraction_bits","role":"data","value":"240"},{"name":"delta","role":"data","value":"248"},{"name":"borderType","role":"data","value":"256"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"hls_filter_2d","role":"start","value":"0","valid_bit":"0"},{"name":"hls_filter_2d","role":"done","value":"0","valid_bit":"1"},{"name":"hls_filter_2d","role":"idle","value":"0","valid_bit":"2"},{"name":"hls_filter_2d","role":"ready","value":"0","valid_bit":"3"},{"name":"hls_filter_2d","role":"auto_start","value":"0","valid_bit":"7"}] },
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
 	{ "name": "s_axis_video_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "s_axis_video", "role": "TDATA" }} , 
 	{ "name": "s_axis_video_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_video", "role": "TVALID" }} , 
 	{ "name": "s_axis_video_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_video", "role": "TREADY" }} , 
 	{ "name": "m_axis_video_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "m_axis_video", "role": "TDATA" }} , 
 	{ "name": "m_axis_video_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_video", "role": "TVALID" }} , 
 	{ "name": "m_axis_video_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_video", "role": "TREADY" }}  ]}

set ArgLastReadFirstWriteLatency {
	hls_filter_2d {
		s_axis_video {Type I LastRead 1 FirstWrite -1}
		m_axis_video {Type O LastRead -1 FirstWrite 9}
		width {Type I LastRead 0 FirstWrite -1}
		height {Type I LastRead 0 FirstWrite -1}
		kernel_0_0 {Type I LastRead 0 FirstWrite -1}
		kernel_0_1 {Type I LastRead 0 FirstWrite -1}
		kernel_0_2 {Type I LastRead 0 FirstWrite -1}
		kernel_0_3 {Type I LastRead 0 FirstWrite -1}
		kernel_0_4 {Type I LastRead 0 FirstWrite -1}
		kernel_1_0 {Type I LastRead 0 FirstWrite -1}
		kernel_1_1 {Type I LastRead 0 FirstWrite -1}
		kernel_1_2 {Type I LastRead 0 FirstWrite -1}
		kernel_1_3 {Type I LastRead 0 FirstWrite -1}
		kernel_1_4 {Type I LastRead 0 FirstWrite -1}
		kernel_2_0 {Type I LastRead 0 FirstWrite -1}
		kernel_2_1 {Type I LastRead 0 FirstWrite -1}
		kernel_2_2 {Type I LastRead 0 FirstWrite -1}
		kernel_2_3 {Type I LastRead 0 FirstWrite -1}
		kernel_2_4 {Type I LastRead 0 FirstWrite -1}
		kernel_3_0 {Type I LastRead 0 FirstWrite -1}
		kernel_3_1 {Type I LastRead 0 FirstWrite -1}
		kernel_3_2 {Type I LastRead 0 FirstWrite -1}
		kernel_3_3 {Type I LastRead 0 FirstWrite -1}
		kernel_3_4 {Type I LastRead 0 FirstWrite -1}
		kernel_4_0 {Type I LastRead 0 FirstWrite -1}
		kernel_4_1 {Type I LastRead 0 FirstWrite -1}
		kernel_4_2 {Type I LastRead 0 FirstWrite -1}
		kernel_4_3 {Type I LastRead 0 FirstWrite -1}
		kernel_4_4 {Type I LastRead 0 FirstWrite -1}
		inv_divisor {Type I LastRead 0 FirstWrite -1}
		fraction_bits {Type I LastRead 0 FirstWrite -1}
		delta {Type I LastRead 0 FirstWrite -1}
		borderType {Type I LastRead 0 FirstWrite -1}}
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
	{"Name" : "Latency", "Min" : "15", "Max" : "67108878"}
	, {"Name" : "Interval", "Min" : "16", "Max" : "67108879"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s_axis_video { axis {  { s_axis_video_TDATA in_data 0 24 }  { s_axis_video_TVALID in_vld 0 1 }  { s_axis_video_TREADY in_acc 1 1 } } }
	m_axis_video { axis {  { m_axis_video_TDATA out_data 1 24 }  { m_axis_video_TVALID out_vld 1 1 }  { m_axis_video_TREADY out_acc 0 1 } } }
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
