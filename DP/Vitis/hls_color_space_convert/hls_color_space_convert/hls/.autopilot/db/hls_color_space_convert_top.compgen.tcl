# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

set axilite_register_dict [dict create]
set port_control {
coeffs_0_0 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
coeffs_0_1 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
coeffs_0_2 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
coeffs_1_0 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
coeffs_1_1 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 48
	offset_end 55
}
coeffs_1_2 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 56
	offset_end 63
}
coeffs_2_0 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 64
	offset_end 71
}
coeffs_2_1 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 72
	offset_end 79
}
coeffs_2_2 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 80
	offset_end 87
}
offsets_0 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 88
	offset_end 95
}
offsets_1 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 96
	offset_end 103
}
offsets_2 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 104
	offset_end 111
}
width { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 112
	offset_end 119
}
height { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 120
	offset_end 127
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
			id 47 \
			corename hls_color_space_convert_top_control_axilite \
			name hls_color_space_convert_top_control_s_axi \
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
	::AP::rtl_comp_handler hls_color_space_convert_top_control_s_axi BINDTYPE interface TYPE interface_s_axilite
}

# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 48 \
    name s_axis_video \
    reset_level 0 \
    sync_rst true \
    corename {} \
    metadata {  } \
    op interface \
    ports { s_axis_video_TDATA { I 32 vector } s_axis_video_TVALID { I 1 bit } s_axis_video_TREADY { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 's_axis_video'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 49 \
    name m_axis_video \
    reset_level 0 \
    sync_rst true \
    corename {} \
    metadata {  } \
    op interface \
    ports { m_axis_video_TDATA { O 32 vector } m_axis_video_TVALID { O 1 bit } m_axis_video_TREADY { I 1 bit } } \
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
	::AP::rtl_comp_handler hls_color_space_convert_top_regslice_both BINDTYPE {interface} TYPE {adapter} IMPL {reg_slice}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler hls_color_space_convert_top_regslice_both BINDTYPE {interface} TYPE {adapter} IMPL {reg_slice}
}


