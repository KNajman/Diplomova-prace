# =============================================================================
#  OOC implementace RTL vygenerovaného Vitis HLS stejným postupem jako VHDL (ooc_impl.tcl) - férové Fmax.
#  Použití:  vivado -mode batch -nojournal -nolog -source ooc_impl_hls.tcl -tclargs <build_dir_jadra> [label]
#            např. ../build/median  ->  RTL z ../build/median/hls/impl/ip/hdl/verilog
#  Výstup:   DP/hls/build/ooc/<label>/{utilization,timing,power}.rpt  (sběr: vhdl/scripts/collect_vhdl.py)
#
#  Proč: export_impl ve Vitis HLS počítá periodu jen z WNS. VHDL se hodnotí max(5 - WNS, 5 - WPWS),
#  protože u DSP a BRAM omezuje frekvenci minimální šířka pulzu hodin (např. 3,262 ns u DSP48E2).
#  Stejný skript, cíl 5 ns, bez IO a stejné reporty -> obě sady čísel jsou přímo srovnatelné.
# =============================================================================
set core_dir [file normalize [lindex $argv 0]]
set label    [expr {[llength $argv] > 1 ? [lindex $argv 1] : [file tail $core_dir]}]
set root     [file normalize [file join [file dirname [info script]] ..]]
set rtl_dir  [file join $core_dir hls impl ip hdl verilog]
set out      [file join $root build ooc $label]
file mkdir $out

set sources [glob -nocomplain [file join $rtl_dir *.v]]
if {[llength $sources] == 0} {
    error "Chybi RTL v $rtl_dir (spust HLS impl/package)"
}
# top = modul se stejným jménem jako IP (component.xml), např. hls_median
set component [read [open [file join $core_dir hls impl ip component.xml]]]
regexp {<spirit:name>([^<]+)</spirit:name>} $component -> top
# $readmemh v RTL od HLS používá relativní cesty k .dat -> překládat z adresáře RTL
cd $rtl_dir
read_verilog $sources

set xdc [file join $out ooc.xdc]
set f [open $xdc w]
puts $f "create_clock -period 5.000 -name ap_clk \[get_ports ap_clk\]"
close $f
read_xdc -mode out_of_context $xdc

synth_design -top $top -part xck26-sfvc784-2LV-c -mode out_of_context
report_utilization -file [file join $out utilization_synth.rpt]
opt_design
place_design
route_design
report_utilization -file [file join $out utilization.rpt]
report_utilization -hierarchical -hierarchical_depth 3 -file [file join $out utilization_hier.rpt]
report_timing_summary -max_paths 5 -file [file join $out timing.rpt]
report_power -file [file join $out power.rpt]
puts "OOC HOTOVO: $top -> $out"
