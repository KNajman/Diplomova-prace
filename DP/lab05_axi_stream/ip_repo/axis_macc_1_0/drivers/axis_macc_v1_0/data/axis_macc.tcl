

proc generate {drv_handle} {
	::hsi::utils::define_include_file $drv_handle "xparameters.h" "AXIS_MACC" "NUM_INSTANCES" "DEVICE_ID"  "C_S00_AXI_BASEADDR" "C_S00_AXI_HIGHADDR"
	::hsi::utils::define_config_file $drv_handle "axis_macc_g.c" "AXIS_MACC"  "DEVICE_ID" "C_S00_AXI_BASEADDR"
	::hsi::utils::define_canonical_xpars $drv_handle "xparameters.h" "MACC" "C_S00_AXI_BASEADDR" "C_S00_AXI_HIGHADDR" "DEVICE_ID"
}
