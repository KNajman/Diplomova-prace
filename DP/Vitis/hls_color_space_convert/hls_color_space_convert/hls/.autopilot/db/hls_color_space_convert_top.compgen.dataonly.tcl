# This script segment is generated automatically by AutoPilot

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


