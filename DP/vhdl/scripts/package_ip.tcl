# =============================================================================
#  Zabalení VHDL top-level obálky (*_axil) jako IP do katalogu Vivado pro testovací block design.
#  Použití:  vivado -mode batch -nojournal -nolog -source package_ip.tcl -tclargs <top> [GENERIC=hodnota ...]
#  Výstup:   DP/vhdl/build/ip/<label>/component.xml   (label = top + generika, např. filter2d_axil_K3_USE_DSPtrue)
#            VLNV tul.cz:dp:vhdl_<label>:1.0
#
#  Poznámky k návrhu:
#   * Jedna IP = jedna konfigurace. IP packager neumí šířky portů zadané konstantami a funkcemi z balíčku
#     (C_RGB_W, filter_axil_addr_w(G_K) -> "XPath expression failed"). Proto se top nejdřív elaboruje
#     s danými generiky, z elaborovaných portů se vygeneruje obálka vhdl_<label> bez generik s pevnými
#     šířkami a zabalí se ta. Různé varianty (HLS x VHDL, K) jsou různé IP.
#   * Rozhraní stejná jako u HLS IP: s_axi_control (AXI4-Lite), s_axis_video / m_axis_video (AXIS),
#     aclk, aresetn (aktivní v 0), interrupt (úroveň) -> v BD se zapojují stejně.
# =============================================================================
set top  [lindex $argv 0]
set gens [lrange $argv 1 end]
set root [file normalize [file join [file dirname [info script]] ..]]
set label $top
foreach g $gens { append label "_" [string map {G_ "" = ""} $g] }
set ip_name "vhdl_$label"
set proj_dir [file join $root build ip_proj $label]
set ip_dir   [file join $root build ip $label]
file delete -force $proj_dir $ip_dir
file mkdir $ip_dir

create_project -force $label $proj_dir -part xck26-sfvc784-2LV-c
set src [list [file join $root .. model generated imgproc_coeffs_pkg.vhd]]
set src [concat $src [glob [file join $root common *.vhd]] [glob -nocomplain [file join $root * rtl *.vhd]]]
add_files -norecurse $src
set_property file_type {VHDL 2008} [get_files *.vhd]
set_property top $top [current_fileset]
update_compile_order -fileset sources_1

# elaborace s generiky -> porty (název, směr, rozsah) -> obálka bez generik s pevnými šířkami
set gen_args {}
foreach g $gens { lappend gen_args -generic $g }
synth_design -rtl -top $top -part xck26-sfvc784-2LV-c -name rtl_ports {*}$gen_args
set port_decls {}
set port_maps  {}
set seen_buses {}
foreach port [lsort [get_ports]] {
    set bus [get_property BUS_NAME $port]
    set dir [expr {[get_property DIRECTION $port] eq "IN" ? "in " : "out"}]
    if {$bus eq ""} {
        set name [get_property NAME $port]
        lappend port_decls "        $name : $dir std_logic"
    } else {
        if {[lsearch -exact $seen_buses $bus] >= 0} { continue }
        lappend seen_buses $bus
        set name $bus
        lappend port_decls "        $name : $dir std_logic_vector([get_property BUS_START $port] downto [get_property BUS_STOP $port])"
    }
    lappend port_maps "$name => $name"
}
close_design
set generic_maps {}
foreach g $gens {
    lassign [split $g =] name value
    lappend generic_maps "$name => $value"
}
set wrapper_file [file join $proj_dir $ip_name.vhd]
set f [open $wrapper_file w]
puts $f "-- Vygenerováno package_ip.tcl: $top s generiky {$gens}, porty s pevnými šířkami pro IP packager"
puts $f "library ieee;\nuse ieee.std_logic_1164.all;\n"
puts $f "entity $ip_name is\n    port (\n[join $port_decls ";\n"]\n    );\nend entity;\n"
puts $f "architecture wrapper of $ip_name is\nbegin"
if {[llength $generic_maps] > 0} {
    puts $f "    core : entity work.$top\n        generic map ([join $generic_maps {, }])\n        port map ([join $port_maps {, }]);"
} else {
    puts $f "    core : entity work.$top\n        port map ([join $port_maps {, }]);"
}
puts $f "end architecture;"
close $f
add_files -norecurse $wrapper_file
set_property file_type {VHDL 2008} [get_files $wrapper_file]
set_property top $ip_name [current_fileset]
update_compile_order -fileset sources_1

ipx::package_project -root_dir $ip_dir -vendor tul.cz -library dp -taxonomy /DP_video -import_files -set_current true -force
set core [ipx::current_core]
set_property name $ip_name $core
set_property display_name "DP VHDL $label" $core
set_property description "Diplomova prace TUL: VHDL jadro $top ($gens), mapa registru jako HLS" $core
set_property version 1.0 $core

# hodiny, reset, přerušení
foreach busif {s_axi_control s_axis_video m_axis_video} {
    if {[ipx::get_bus_interfaces $busif -of_objects $core] ne ""} {
        ipx::associate_bus_interfaces -busif $busif -clock aclk $core
    }
}
if {[ipx::get_ports interrupt -of_objects $core] ne "" && [ipx::get_bus_interfaces interrupt -of_objects $core] eq ""} {
    ipx::infer_bus_interface interrupt xilinx.com:signal:interrupt_rtl:1.0 $core
}
if {[ipx::get_bus_interfaces interrupt -of_objects $core] ne ""} {
    set sens [ipx::add_bus_parameter SENSITIVITY [ipx::get_bus_interfaces interrupt -of_objects $core]]
    set_property value LEVEL_HIGH $sens
}

ipx::create_xgui_files $core
ipx::update_checksums $core
ipx::check_integrity $core
ipx::save_core $core
puts "IP HOTOVO: $ip_name -> $ip_dir"
close_project
