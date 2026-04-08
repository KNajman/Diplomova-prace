# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
thresh_val { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
thresh_type { 
	dir I
	width 2
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
width { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
height { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


