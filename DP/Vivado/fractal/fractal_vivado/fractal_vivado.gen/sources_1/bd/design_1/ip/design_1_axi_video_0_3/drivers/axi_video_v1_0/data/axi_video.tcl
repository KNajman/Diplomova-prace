

proc generate {drv_handle} {
	::hsi::utils::define_include_file $drv_handle "xparameters.h" "AXI_VIDEO" "NUM_INSTANCES" "DEVICE_ID"  "C_S00_AXI_BASEADDR" "C_S00_AXI_HIGHADDR" "C_MAX_LINE_WIDTH" "C_M00_AXI_DATA_WIDTH"
	::hsi::utils::define_config_file $drv_handle "axi_video_g.c" "AXI_VIDEO"  "DEVICE_ID" "C_S00_AXI_BASEADDR" "C_MAX_LINE_WIDTH" "C_M00_AXI_DATA_WIDTH"
	::hsi::utils::define_canonical_xpars $drv_handle "xparameters.h" "AV" "C_S00_AXI_BASEADDR" "C_S00_AXI_HIGHADDR" "DEVICE_ID" "C_MAX_LINE_WIDTH" "C_M00_AXI_DATA_WIDTH"
}
