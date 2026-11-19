# =============================================================================
#  Export rozložení blokového návrhu testovacího řetězce (bez grafického prostředí).
#  Použití:  vivado -mode batch -nojournal -nolog -source export_bd.tcl -tclargs <výstupní adresář>
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
