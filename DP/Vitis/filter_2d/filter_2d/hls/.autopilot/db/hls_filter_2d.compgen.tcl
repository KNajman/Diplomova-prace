# This script segment is generated automatically by AutoPilot

set name hls_filter_2d_mul_13ns_13ns_26_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

set axilite_register_dict [dict create]
set port_control {
width { 
	dir I
	width 13
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
height { 
	dir I
	width 13
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
kernel_0_0 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
kernel_0_1 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
kernel_0_2 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 48
	offset_end 55
}
kernel_0_3 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 56
	offset_end 63
}
kernel_0_4 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 64
	offset_end 71
}
kernel_1_0 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 72
	offset_end 79
}
kernel_1_1 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 80
	offset_end 87
}
kernel_1_2 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 88
	offset_end 95
}
kernel_1_3 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 96
	offset_end 103
}
kernel_1_4 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 104
	offset_end 111
}
kernel_2_0 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 112
	offset_end 119
}
kernel_2_1 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 120
	offset_end 127
}
kernel_2_2 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 128
	offset_end 135
}
kernel_2_3 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 136
	offset_end 143
}
kernel_2_4 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 144
	offset_end 151
}
kernel_3_0 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 152
	offset_end 159
}
kernel_3_1 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 160
	offset_end 167
}
kernel_3_2 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 168
	offset_end 175
}
kernel_3_3 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 176
	offset_end 183
}
kernel_3_4 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 184
	offset_end 191
}
kernel_4_0 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 192
	offset_end 199
}
kernel_4_1 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 200
	offset_end 207
}
kernel_4_2 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 208
	offset_end 215
}
kernel_4_3 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 216
	offset_end 223
}
kernel_4_4 { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 224
	offset_end 231
}
inv_divisor { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 232
	offset_end 239
}
fraction_bits { 
	dir I
	width 5
	depth 1
	mode ap_none
	offset 240
	offset_end 247
}
delta { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 248
	offset_end 255
}
borderType { 
	dir I
	width 1
	depth 1
	mode ap_none
	offset 256
	offset_end 263
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


# Native S_AXILite:
if {${::AESL::PGuard_simmodel_gen}} {
	if {[info proc ::AESL_LIB_XILADAPTER::s_axilite_gen] == "::AESL_LIB_XILADAPTER::s_axilite_gen"} {
		eval "::AESL_LIB_XILADAPTER::s_axilite_gen { \
			id 77 \
			corename hls_filter_2d_control_axilite \
			name hls_filter_2d_control_s_axi \
			ports {$port_control} \
			op interface \
			interrupt_clear_mode TOW \
			interrupt_trigger_type default \
			is_flushable 0 \
			is_datawidth64 0 \
			is_addrwidth64 1 \
			enable_mem_auto_widen 1 \
		} "
	} else {
		puts "@W \[IMPL-110\] Cannot find AXI Lite interface model in the library. Ignored generation of AXI Lite  interface for 'control'"
	}
}

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler hls_filter_2d_control_s_axi BINDTYPE interface TYPE interface_s_axilite
}

# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 78 \
    name s_axis_video \
    reset_level 0 \
    sync_rst true \
    corename {} \
    metadata {  } \
    op interface \
    ports { s_axis_video_TDATA { I 24 vector } s_axis_video_TVALID { I 1 bit } s_axis_video_TREADY { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 's_axis_video'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 79 \
    name m_axis_video \
    reset_level 0 \
    sync_rst true \
    corename {} \
    metadata {  } \
    op interface \
    ports { m_axis_video_TDATA { O 24 vector } m_axis_video_TVALID { O 1 bit } m_axis_video_TREADY { I 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'm_axis_video'"
}
}



# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -1 \
    name ${PortName} \
    reset_level 0 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst_n
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -2 \
    name ${PortName} \
    reset_level 0 \
    sync_rst true \
    corename apif_ap_rst_n \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler hls_filter_2d_regslice_both BINDTYPE {interface} TYPE {adapter} IMPL {reg_slice}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler hls_filter_2d_regslice_both BINDTYPE {interface} TYPE {adapter} IMPL {reg_slice}
}


