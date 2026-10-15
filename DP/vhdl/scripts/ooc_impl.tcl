# =============================================================================
#  OOC syntéza + implementace jednoho VHDL jádra (Vivado 2025.2, cíl 5 ns).
#  Použití:  vivado -mode batch -nojournal -nolog -source ooc_impl.tcl -tclargs <top> [GENERIC=hodnota ...]
#  Výstup:   DP/vhdl/build/ooc/<top>/{utilization,timing,power}.rpt
#  Stejný cíl jako HLS (clock=5ns), bez IO bufferů -> férové srovnání HLS x VHDL.
# =============================================================================
set top  [lindex $argv 0]
set gens [lrange $argv 1 end]
set root [file normalize [file join [file dirname [info script]] ..]]
set out  [file join $root build ooc $top]
file mkdir $out

set src [list [file join $root .. model generated imgproc_coeffs_pkg.vhd]]
set src [concat $src [glob [file join $root common *.vhd]] [glob -nocomplain [file join $root * rtl *.vhd]]]
read_vhdl -vhdl2008 $src

set xdc [file join $out ooc.xdc]
set f [open $xdc w]
puts $f "create_clock -period 5.000 -name aclk \[get_ports aclk\]"
close $f
read_xdc -mode out_of_context $xdc

set gen_args {}
foreach g $gens { lappend gen_args -generic $g }
synth_design -top $top -part xck26-sfvc784-2LV-c -mode out_of_context {*}$gen_args
report_utilization -file [file join $out utilization_synth.rpt]
opt_design
place_design
route_design
report_utilization -file [file join $out utilization.rpt]
report_timing_summary -max_paths 5 -file [file join $out timing.rpt]
report_power -file [file join $out power.rpt]
puts "OOC HOTOVO: $top -> $out"
