

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "myip_test" "NUM_INSTANCES" "DEVICE_ID"  "C_S00_AXI_DRIVE_BASEADDR" "C_S00_AXI_DRIVE_HIGHADDR"
}
