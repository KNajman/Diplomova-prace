# ==============================================================
# Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
# Tool Version Limit: 2025.11
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
# 
# ==============================================================
proc sc_sim_check {ret err logfile} {
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] start...";
	}
    set errfile "err.log"
    if {[file exists $errfile] && [file size $errfile] != 0} {
        set fl [open $errfile r]
        while {[gets $fl line] >= 0} {
            if {[string first "AESL_mErrNo = " $line] == 0} {
                set mismatch_num [string range $line [string length "AESL_mErrNo = "] end]
                if {$mismatch_num != 0} {
                    ::AP::printMsg ERR COSIM 403 COSIM_403_986 ${mismatch_num}
                    break
                }
            }
        }
    }
    if {$ret || $err != ""} {
        if { [lindex $::errorCode 0] eq "CHILDSTATUS"} {
            set status [lindex $::errorCode 2]
            if {$status != ""} {
                ::AP::printMsg ERR COSIM 404 COSIM_404_987 $status
            } else {
                ::AP::printMsg ERR COSIM 405 COSIM_405_988
            }
        } else {
            ::AP::printMsg ERR COSIM 405 COSIM_405_989
        }
    }
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] finish...";
	}
}

proc rtl_sim_check {} {
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] start...";
	}
    set errfile "err.log"
    if {[file exists $errfile] && [file size $errfile] != 0} {
        set fl [open $errfile r]
        set unmatch_num 0
        while {[gets $fl line] >= 0} {
            if {[string first "unmatched" $line] != -1} {
                set unmatch_num [expr $unmatch_num + 1]
            }
        }
        if {$unmatch_num != 0} {
            ::AP::printMsg ERR COSIM 406 COSIM_406_991 ${unmatch_num}
        }
    }
    if {[file exists ".aesl_error"]} {
        set errfl [open ".aesl_error" r]
        gets $errfl line
        if {$line != 0} {
            ::AP::printMsg ERR COSIM 407 COSIM_407_992 $line
        }
    }
    if {[file exists ".exit.err"]} {
        ::AP::printMsg ERR COSIM 405 COSIM_405_993
    }
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] finish...";
	}
}

proc check_tvin_file {} {
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] start...";
	}
    set rtlfilelist {
         "c.hls_filter_2d.autotvin_s_axis_video.dat"
         "c.hls_filter_2d.autotvin_width.dat"
         "c.hls_filter_2d.autotvin_height.dat"
         "c.hls_filter_2d.autotvin_kernel_0_0.dat"
         "c.hls_filter_2d.autotvin_kernel_0_1.dat"
         "c.hls_filter_2d.autotvin_kernel_0_2.dat"
         "c.hls_filter_2d.autotvin_kernel_0_3.dat"
         "c.hls_filter_2d.autotvin_kernel_0_4.dat"
         "c.hls_filter_2d.autotvin_kernel_1_0.dat"
         "c.hls_filter_2d.autotvin_kernel_1_1.dat"
         "c.hls_filter_2d.autotvin_kernel_1_2.dat"
         "c.hls_filter_2d.autotvin_kernel_1_3.dat"
         "c.hls_filter_2d.autotvin_kernel_1_4.dat"
         "c.hls_filter_2d.autotvin_kernel_2_0.dat"
         "c.hls_filter_2d.autotvin_kernel_2_1.dat"
         "c.hls_filter_2d.autotvin_kernel_2_2.dat"
         "c.hls_filter_2d.autotvin_kernel_2_3.dat"
         "c.hls_filter_2d.autotvin_kernel_2_4.dat"
         "c.hls_filter_2d.autotvin_kernel_3_0.dat"
         "c.hls_filter_2d.autotvin_kernel_3_1.dat"
         "c.hls_filter_2d.autotvin_kernel_3_2.dat"
         "c.hls_filter_2d.autotvin_kernel_3_3.dat"
         "c.hls_filter_2d.autotvin_kernel_3_4.dat"
         "c.hls_filter_2d.autotvin_kernel_4_0.dat"
         "c.hls_filter_2d.autotvin_kernel_4_1.dat"
         "c.hls_filter_2d.autotvin_kernel_4_2.dat"
         "c.hls_filter_2d.autotvin_kernel_4_3.dat"
         "c.hls_filter_2d.autotvin_kernel_4_4.dat"
         "c.hls_filter_2d.autotvin_inv_divisor.dat"
         "c.hls_filter_2d.autotvin_fraction_bits.dat"
         "c.hls_filter_2d.autotvin_delta.dat"
         "c.hls_filter_2d.autotvin_borderType.dat"
    }
    foreach rtlfile $rtlfilelist {
        if {[file isfile $rtlfile]} {
        } else {
            ::AP::printMsg ERR COSIM 320 COSIM_320_994
            return 1
        }
        set ret [catch {eval exec "grep /runtime $rtlfile"} err]
        if { $ret } {
            ::AP::printMsg ERR COSIM 320 COSIM_320_995
            return 1
        }
    }
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] finish...";
	}
    return 0
}

proc check_tvout_file {} {
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] start...";
	}
    set rtlfilelist {
         "rtl.hls_filter_2d.autotvout_m_axis_video.dat"
    }
    foreach rtlfile $rtlfilelist {
        if {[file isfile $rtlfile]} {
        } else {
            ::AP::printMsg ERR COSIM 303 COSIM_303_996
            return 1
        }
        set ret [catch {eval exec "grep /runtime $rtlfile"} err]
        if { $ret } {
            ::AP::printMsg ERR COSIM 303 COSIM_303_997
            return 1
        }
    }
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] finish...";
	}
    return 0
}
