# =============================================================================
#  Export rozložení blokového návrhu testovacího řetězce (bez grafického prostředí).
#  Použití:  xvfb-run -a vivado -mode gui -nojournal -nolog -source export_bd.tcl -tclargs <výstupní adresář>
#  write_bd_layout funguje jen v grafickém režimu (v batch hlásí BD 5-349), proto virtuální X server xvfb.
#  Čte hotový projekt DP/hw/build/harness/harness.xpr (build_harness.tcl), nic v něm nemění.
#  Výstup:   <adresář>/harness_bd.pdf a harness_bd.svg (write_bd_layout)
# =============================================================================
set out [file normalize [lindex $argv 0]]
set root [file normalize [file join [file dirname [info script]] .. ..]]
file mkdir $out
open_project [file join $root hw build harness harness.xpr]
open_bd_design [lindex [get_files -filter {FILE_TYPE == "Block Designs"}] 0]
write_bd_layout -force -format pdf -orientation landscape [file join $out harness_bd.pdf]
write_bd_layout -force -format svg [file join $out harness_bd.svg]
close_project
puts "BD EXPORT HOTOVO: $out"
exit
