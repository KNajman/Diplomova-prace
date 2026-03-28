# This script segment is generated automatically by AutoPilot

set name hls_color_space_convert_top_mul_32s_32s_32_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 31 \
    name s_axis_video \
    reset_level 1 \
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
    id 32 \
    name m_axis_video \
    reset_level 1 \
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


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 33 \
    name coeffs_0_0_0_0_0_0_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_0_0_0_0_0_0_val \
    op interface \
    ports { coeffs_0_0_0_0_0_0_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 34 \
    name coeffs_0_1_0_0_0_0_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_0_1_0_0_0_0_val \
    op interface \
    ports { coeffs_0_1_0_0_0_0_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 35 \
    name coeffs_0_2_0_0_0_0_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_0_2_0_0_0_0_val \
    op interface \
    ports { coeffs_0_2_0_0_0_0_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 36 \
    name coeffs_1_0_0_0_0_0_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_1_0_0_0_0_0_val \
    op interface \
    ports { coeffs_1_0_0_0_0_0_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 37 \
    name coeffs_1_1_0_0_0_0_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_1_1_0_0_0_0_val \
    op interface \
    ports { coeffs_1_1_0_0_0_0_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 38 \
    name coeffs_1_2_0_0_0_0_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_1_2_0_0_0_0_val \
    op interface \
    ports { coeffs_1_2_0_0_0_0_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 39 \
    name coeffs_2_0_0_0_0_0_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_2_0_0_0_0_0_val \
    op interface \
    ports { coeffs_2_0_0_0_0_0_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 40 \
    name coeffs_2_1_0_0_0_0_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_2_1_0_0_0_0_val \
    op interface \
    ports { coeffs_2_1_0_0_0_0_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 41 \
    name coeffs_2_2_0_0_0_0_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_2_2_0_0_0_0_val \
    op interface \
    ports { coeffs_2_2_0_0_0_0_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 42 \
    name offsets_0_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_offsets_0_val \
    op interface \
    ports { offsets_0_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 43 \
    name offsets_1_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_offsets_1_val \
    op interface \
    ports { offsets_1_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 44 \
    name offsets_2_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_offsets_2_val \
    op interface \
    ports { offsets_2_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 45 \
    name width \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_width \
    op interface \
    ports { width { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 46 \
    name height \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_height \
    op interface \
    ports { height { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
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
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
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


