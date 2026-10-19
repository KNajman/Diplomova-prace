# =============================================================================
#  Testovací řetězec na KV260: všechna HLS i VHDL jádra v jednom bitstreamu (Vivado 2025.2, batch).
#  Použití:  vivado -mode batch -nojournal -nolog -source build_harness.tcl -tclargs [frekvence_MHz] [bd_only]
#  Výstup:   DP/hw/build/harness/  (projekt, reporty), DP/hw/build/harness/harness.xsa (s bitstreamem)
#
#  Topologie (plán DP, "jeden bitstream"):
#    VDMA MM2S (RGB 24 b) -> rgb_switch_in 1->N -> [bypass | RGB jádra | šedá větev] -> rgb_switch_out N->1 -> VDMA S2MM
#    šedá větev: csc RGB->šedá (VHDL) -> gray_switch_in 1->M -> [bypass | šedá jádra] -> gray_switch_out M->1 -> csc šedá->RGB
#  Přepínače AXIS Switch řízené registrem (ROUTING_MODE 1), přepínat jen mezi snímky (VDMA zastavená).
#  Port 0 obou přepínačů = bypass (měření režie řetězce / převodníků).
#  Jedny hodiny pro video i AXI4-Lite i HP port (clk_wiz z pl_clk0, výchozí 200 MHz jako OOC cíl).
#  Jádra se berou ze seznamu níže; IP, která v katalogu není (např. HLS prahování ještě neexistuje),
#  se přeskočí s varováním - bitstream jde sestavit průběžně.
# =============================================================================
set freq_mhz [expr {[llength $argv] > 0 ? [lindex $argv 0] : 200}]
set bd_only  [expr {[llength $argv] > 1 && [lindex $argv 1] eq "bd_only"}]
set dp_root  [file normalize [file join [file dirname [info script]] .. ..]]
set out      [file join $dp_root hw build harness]
file mkdir $out

create_project -force harness $out -part xck26-sfvc784-2LV-c
set board [lindex [lsort [get_board_parts -quiet *kv260_som*]] end]
if {$board ne ""} {
    set_property board_part $board [current_project]
    puts "Deska: $board"
}

# katalog IP: HLS (vitis-run --package -> build/<jádro>/hls/impl/ip) a VHDL (package_ip.tcl -> vhdl/build/ip)
set repos [glob -nocomplain -types d [file join $dp_root hls build * hls impl ip]]
lappend repos [file join $dp_root vhdl build ip]
set_property ip_repo_paths $repos [current_project]
update_ip_catalog -rebuild

# -----------------------------------------------------------------------------
# Seznam jader: {instance VLNV-jméno větev přerušení}
#   větev rgb = 24 b, gray = 8 b; přerušení 1 = připojit (okénková jádra a histogram hlásí konec snímku)
# -----------------------------------------------------------------------------
set rgb_cores {
    {hls_csc_rgb          xilinx.com:hls:hls_csc_rgb:1.0                 0}
    {vhdl_csc_rgb         tul.cz:dp:vhdl_csc_axil_CH_IN3_CH_OUT3:1.0      0}
    {hls_rgb2hsv          xilinx.com:hls:hls_rgb2hsv:1.0                 0}
    {vhdl_rgb2hsv         tul.cz:dp:vhdl_hsv_axil_RGB_TO_HSVtrue:1.0      0}
    {hls_hsv2rgb          xilinx.com:hls:hls_hsv2rgb:1.0                 0}
    {vhdl_hsv2rgb         tul.cz:dp:vhdl_hsv_axil_RGB_TO_HSVfalse:1.0     0}
}
set gray_cores {
    {hls_threshold        xilinx.com:hls:hls_threshold:1.0               0}
    {vhdl_threshold       tul.cz:dp:vhdl_threshold_axil:1.0               0}
    {hls_median           xilinx.com:hls:hls_median:1.0                  1}
    {vhdl_median          tul.cz:dp:vhdl_median_axil:1.0                  1}
    {hls_filter3x3        xilinx.com:hls:hls_filter2d_3x3:1.0            1}
    {vhdl_filter3x3       tul.cz:dp:vhdl_filter2d_axil_K3_USE_DSPtrue:1.0 1}
    {hls_histogram        xilinx.com:hls:hls_histogram:1.0               1}
    {vhdl_histogram       tul.cz:dp:vhdl_histogram_axil_USE_BRAMtrue:1.0  1}
}
set gray_in_converter  {gray_in  tul.cz:dp:vhdl_csc_axil_CH_IN3_CH_OUT1:1.0 0}
set gray_out_converter {gray_out tul.cz:dp:vhdl_csc_axil_CH_IN1_CH_OUT3:1.0 0}

proc ip_available {vlnv} {
    return [expr {[get_ipdefs -quiet $vlnv] ne ""}]
}
proc keep_available {cores} {
    set kept {}
    foreach core $cores {
        lassign $core inst vlnv
        if {[ip_available $vlnv]} {
            lappend kept $core
        } else {
            puts "VAROVANI: IP $vlnv neni v katalogu, $inst se vynecha"
        }
    }
    return $kept
}
set rgb_cores  [keep_available $rgb_cores]
set gray_cores [keep_available $gray_cores]
foreach conv [list $gray_in_converter $gray_out_converter] {
    if {![ip_available [lindex $conv 1]]} {
        error "Chybi prevodnik sede vetve [lindex $conv 1] (spust frontu hw_ip)"
    }
}

create_bd_design harness

# -----------------------------------------------------------------------------
# PS, hodiny, resety
# -----------------------------------------------------------------------------
set ps [create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e zynq_ultra_ps_e_0]
if {$board ne ""} {
    apply_bd_automation -rule xilinx.com:bd_rule:zynq_ultra_ps_e -config {apply_board_preset "1"} $ps
}
set_property -dict [list \
    CONFIG.PSU__USE__M_AXI_GP0 1 CONFIG.PSU__USE__M_AXI_GP1 0 CONFIG.PSU__USE__M_AXI_GP2 0 \
    CONFIG.PSU__USE__S_AXI_GP2 1 CONFIG.PSU__SAXIGP2__DATA_WIDTH 128 \
    CONFIG.PSU__USE__IRQ0 1 CONFIG.PSU__USE__IRQ1 1 \
    CONFIG.PSU__FPGA_PL0_ENABLE 1 CONFIG.PSU__CRL_APB__PL0_REF_CTRL__FREQMHZ 100] $ps

set clk [create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz clk_video]
# vstupní frekvence se nezadává - propaguje se z pl_clk0 (skutečná je 99,999 MHz, ne 100)
connect_bd_net [get_bd_pins $ps/pl_clk0] [get_bd_pins $clk/clk_in1]
set_property -dict [list CONFIG.PRIM_SOURCE No_buffer \
    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ $freq_mhz CONFIG.USE_LOCKED true CONFIG.USE_RESET true \
    CONFIG.RESET_TYPE ACTIVE_LOW] $clk
connect_bd_net [get_bd_pins $ps/pl_resetn0] [get_bd_pins $clk/resetn]

set rst [create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset rst_video]
connect_bd_net [get_bd_pins $clk/clk_out1] [get_bd_pins $rst/slowest_sync_clk]
connect_bd_net [get_bd_pins $ps/pl_resetn0] [get_bd_pins $rst/ext_reset_in]
connect_bd_net [get_bd_pins $clk/locked] [get_bd_pins $rst/dcm_locked]
set aclk    [get_bd_pins $clk/clk_out1]
set aresetn [get_bd_pins $rst/peripheral_aresetn]
connect_bd_net $aclk [get_bd_pins $ps/maxihpm0_fpd_aclk] [get_bd_pins $ps/saxihp0_fpd_aclk]

# -----------------------------------------------------------------------------
# VDMA (RGB 24 b, 1080p), paměťová cesta do HP0
# -----------------------------------------------------------------------------
set vdma [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vdma axi_vdma_0]
# šířka S2MM streamu je u VDMA odvozená (read-only), kontroluje se výpisem níže
set_property -dict [list CONFIG.c_m_axis_mm2s_tdata_width 24 \
    CONFIG.c_m_axi_mm2s_data_width 128 CONFIG.c_m_axi_s2mm_data_width 128 \
    CONFIG.c_mm2s_linebuffer_depth 4096 CONFIG.c_s2mm_linebuffer_depth 4096 \
    CONFIG.c_mm2s_max_burst_length 64 CONFIG.c_s2mm_max_burst_length 64 \
    CONFIG.c_num_fstores 3 CONFIG.c_include_mm2s_dre 0 CONFIG.c_include_s2mm_dre 0] $vdma

set mem_ic [create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect mem_smc]
set_property -dict [list CONFIG.NUM_SI 2 CONFIG.NUM_MI 1] $mem_ic
connect_bd_intf_net [get_bd_intf_pins $vdma/M_AXI_MM2S] [get_bd_intf_pins $mem_ic/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins $vdma/M_AXI_S2MM] [get_bd_intf_pins $mem_ic/S01_AXI]
connect_bd_intf_net [get_bd_intf_pins $mem_ic/M00_AXI] [get_bd_intf_pins $ps/S_AXI_HP0_FPD]

# -----------------------------------------------------------------------------
# Přepínače a jádra
# -----------------------------------------------------------------------------
proc create_switch {name bytes num_si num_mi} {
    set sw [create_bd_cell -type ip -vlnv xilinx.com:ip:axis_switch $name]
    set_property -dict [list CONFIG.NUM_SI $num_si CONFIG.NUM_MI $num_mi CONFIG.ROUTING_MODE 1 \
        CONFIG.TDATA_NUM_BYTES $bytes CONFIG.HAS_TLAST 1 CONFIG.TUSER_WIDTH 1] $sw
    return $sw
}
proc port_name {prefix index} {
    return [format "%s%02d_AXIS" $prefix $index]
}

set lite_slaves [list [get_bd_intf_pins $vdma/S_AXI_LITE]]
set irq_sources [list [get_bd_pins $vdma/mm2s_introut] [get_bd_pins $vdma/s2mm_introut]]
set clocked_cells [list $vdma $mem_ic]

proc add_core {core} {
    upvar lite_slaves lite_slaves irq_sources irq_sources clocked_cells clocked_cells
    lassign $core inst vlnv irq
    set cell [create_bd_cell -type ip -vlnv $vlnv $inst]
    lappend lite_slaves [get_bd_intf_pins $cell/s_axi_control]
    lappend clocked_cells $cell
    if {$irq} {
        lappend irq_sources [get_bd_pins $cell/interrupt]
    }
    return $cell
}

# šedá větev: počet výstupů = bypass + jádra
set num_gray [expr {[llength $gray_cores] + 1}]
set gray_in_sw  [create_switch gray_switch_in  1 1 $num_gray]
set gray_out_sw [create_switch gray_switch_out 1 $num_gray 1]
lappend lite_slaves [get_bd_intf_pins $gray_in_sw/S_AXI_CTRL] [get_bd_intf_pins $gray_out_sw/S_AXI_CTRL]
lappend clocked_cells $gray_in_sw $gray_out_sw
set to_gray   [add_core $gray_in_converter]
set from_gray [add_core $gray_out_converter]
connect_bd_intf_net [get_bd_intf_pins $to_gray/m_axis_video] [get_bd_intf_pins $gray_in_sw/S00_AXIS]
connect_bd_intf_net [get_bd_intf_pins $gray_out_sw/M00_AXIS] [get_bd_intf_pins $from_gray/s_axis_video]
connect_bd_intf_net [get_bd_intf_pins $gray_in_sw/M00_AXIS] [get_bd_intf_pins $gray_out_sw/S00_AXIS]
set port_map {}
set port 1
foreach core $gray_cores {
    set cell [add_core $core]
    lappend port_map [list [lindex $core 0] $port]
    connect_bd_intf_net [get_bd_intf_pins $gray_in_sw/[port_name M $port]] [get_bd_intf_pins $cell/s_axis_video]
    connect_bd_intf_net [get_bd_intf_pins $cell/m_axis_video] [get_bd_intf_pins $gray_out_sw/[port_name S $port]]
    incr port
}

# RGB: bypass, RGB jádra, šedá větev (poslední port)
set num_rgb [expr {[llength $rgb_cores] + 2}]
set rgb_in_sw  [create_switch rgb_switch_in  3 1 $num_rgb]
set rgb_out_sw [create_switch rgb_switch_out 3 $num_rgb 1]
lappend lite_slaves [get_bd_intf_pins $rgb_in_sw/S_AXI_CTRL] [get_bd_intf_pins $rgb_out_sw/S_AXI_CTRL]
lappend clocked_cells $rgb_in_sw $rgb_out_sw
connect_bd_intf_net [get_bd_intf_pins $vdma/M_AXIS_MM2S] [get_bd_intf_pins $rgb_in_sw/S00_AXIS]
connect_bd_intf_net [get_bd_intf_pins $rgb_out_sw/M00_AXIS] [get_bd_intf_pins $vdma/S_AXIS_S2MM]
connect_bd_intf_net [get_bd_intf_pins $rgb_in_sw/M00_AXIS] [get_bd_intf_pins $rgb_out_sw/S00_AXIS]
set port 1
foreach core $rgb_cores {
    set cell [add_core $core]
    lappend port_map [list [lindex $core 0] $port]
    connect_bd_intf_net [get_bd_intf_pins $rgb_in_sw/[port_name M $port]] [get_bd_intf_pins $cell/s_axis_video]
    connect_bd_intf_net [get_bd_intf_pins $cell/m_axis_video] [get_bd_intf_pins $rgb_out_sw/[port_name S $port]]
    incr port
}
set gray_lane_port $port
connect_bd_intf_net [get_bd_intf_pins $rgb_in_sw/[port_name M $port]] [get_bd_intf_pins $to_gray/s_axis_video]
connect_bd_intf_net [get_bd_intf_pins $from_gray/m_axis_video] [get_bd_intf_pins $rgb_out_sw/[port_name S $port]]

# -----------------------------------------------------------------------------
# AXI4-Lite: PS HPM0 -> AXI Interconnect (až 64 výstupů) -> všechny řídicí porty
# -----------------------------------------------------------------------------
set num_lite [llength $lite_slaves]
set ctrl_ic [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect ctrl_interconnect]
set_property CONFIG.NUM_MI $num_lite $ctrl_ic
connect_bd_intf_net [get_bd_intf_pins $ps/M_AXI_HPM0_FPD] [get_bd_intf_pins $ctrl_ic/S00_AXI]
set index 0
foreach slave $lite_slaves {
    connect_bd_intf_net [get_bd_intf_pins $ctrl_ic/[format "M%02d_AXI" $index]] $slave
    connect_bd_net $aclk [get_bd_pins $ctrl_ic/[format "M%02d_ACLK" $index]]
    connect_bd_net $aresetn [get_bd_pins $ctrl_ic/[format "M%02d_ARESETN" $index]]
    incr index
}
connect_bd_net $aclk [get_bd_pins $ctrl_ic/ACLK] [get_bd_pins $ctrl_ic/S00_ACLK]
connect_bd_net [get_bd_pins $rst/interconnect_aresetn] [get_bd_pins $ctrl_ic/ARESETN]
connect_bd_net $aresetn [get_bd_pins $ctrl_ic/S00_ARESETN]

# hodiny a resety všech bloků (názvy pinů se u IP liší - připojí se, co existuje)
foreach cell $clocked_cells {
    foreach pin [get_bd_pins -quiet -of_objects $cell -filter {TYPE == clk && DIR == I}] {
        connect_bd_net $aclk $pin
    }
    foreach pin [get_bd_pins -quiet -of_objects $cell -filter {TYPE == rst && DIR == I}] {
        connect_bd_net $aresetn $pin
    }
}

# přerušení: max. 8 na linku pl_ps_irq0, zbytek pl_ps_irq1
set irq_lines [list [lrange $irq_sources 0 7] [lrange $irq_sources 8 15]]
set line 0
foreach sources $irq_lines {
    if {[llength $sources] == 0} { continue }
    set concat [create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat irq_concat_$line]
    set_property CONFIG.NUM_PORTS [llength $sources] $concat
    set input 0
    foreach source $sources {
        connect_bd_net $source [get_bd_pins $concat/In$input]
        incr input
    }
    connect_bd_net [get_bd_pins $concat/dout] [get_bd_pins $ps/pl_ps_irq$line]
    incr line
}

assign_bd_address
validate_bd_design
save_bd_design
# šířka S2MM se propaguje z přepínače až při validaci - musí být 24 b jako MM2S (3 B/px v paměti)
set s2mm_width [get_property CONFIG.c_s_axis_s2mm_tdata_width $vdma]
puts "VDMA: MM2S [get_property CONFIG.c_m_axis_mm2s_tdata_width $vdma] b, S2MM $s2mm_width b"
if {$s2mm_width != 24} {
    error "VDMA S2MM ma $s2mm_width b misto 24 b"
}
# mapa pro SW aplikaci: adresy řídicích portů a čísla portů přepínačů -> harness_map.h (DP/sw/harness_app)
set map_file [file join $out harness_map.h]
set f [open $map_file w]
puts $f "/* Vygenerováno build_harness.tcl ([clock format [clock seconds] -format {%Y-%m-%d %H:%M}]) - neupravovat ručně */"
puts $f "#ifndef HARNESS_MAP_H_\n#define HARNESS_MAP_H_\n"
puts $f "#define HARNESS_CLOCK_MHZ ($freq_mhz)"
puts $f "#define HARNESS_RGB_NUM_PORTS ($num_rgb)\n#define HARNESS_GRAY_NUM_PORTS ($num_gray)\n#define HARNESS_GRAY_LANE_PORT ($gray_lane_port)\n"
foreach seg [get_bd_addr_segs -of_objects [get_bd_addr_spaces $ps/Data]] {
    # název segmentu na straně PS: SEG_<instance>_<segment>
    set slave [get_bd_addr_segs -of_objects $seg]
    set inst  [lindex [split [string trimleft $slave /] /] 0]
    puts $f "#define HARNESS_[string toupper $inst]_BASEADDR ([format 0x%08X [get_property OFFSET $seg]]u)   /* [get_property RANGE $seg] B */"
}
puts $f ""
foreach entry $port_map {
    lassign $entry inst port
    puts $f "#define HARNESS_HAS_[string toupper $inst] (1)\n#define HARNESS_[string toupper $inst]_PORT ($port)"
}
puts $f "\n#endif /* HARNESS_MAP_H_ */"
close $f
puts "Mapa pro SW: $map_file"

puts "BD HOTOVO: [llength $rgb_cores] RGB jader, [llength $gray_cores] sedych jader, $num_lite AXI4-Lite portu"
if {$bd_only} {
    exit
}

# -----------------------------------------------------------------------------
# Syntéza, implementace, bitstream, XSA
# -----------------------------------------------------------------------------
set wrapper [make_wrapper -files [get_files harness.bd] -top]
add_files -norecurse $wrapper
set_property top harness_wrapper [current_fileset]
update_compile_order -fileset sources_1
launch_runs synth_1 -jobs 16
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 16
wait_on_run impl_1
open_run impl_1
report_utilization -file [file join $out utilization.rpt]
report_utilization -hierarchical -hierarchical_depth 2 -file [file join $out utilization_hier.rpt]
report_timing_summary -max_paths 10 -file [file join $out timing.rpt]
report_power -file [file join $out power.rpt]
write_hw_platform -fixed -include_bit -force [file join $out harness.xsa]
set wns [get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 -setup]]
puts "HARNESS HOTOVO: $freq_mhz MHz, WNS = $wns ns, XSA = [file join $out harness.xsa]"
