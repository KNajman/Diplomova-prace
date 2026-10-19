# =============================================================================
#  Zabalení VHDL top-level obálky (*_axil) jako IP do katalogu Vivado pro testovací block design.
#  Použití:  vivado -mode batch -nojournal -nolog -source package_ip.tcl -tclargs <top> [GENERIC=hodnota ...]
#  Výstup:   DP/vhdl/build/ip/<label>/component.xml   (label = top + generika, např. filter2d_axil_K3_USE_DSPtrue)
#            VLNV tul.cz:dp:vhdl_<label>:1.0
#
#  Poznámky k návrhu:
#   * Jedna IP = jedna konfigurace (generika pevně nastavená a skrytá). Šířky portů (adresa AXI4-Lite)
#     se počítají funkcemi z generik, které IP packager neumí přepočítat při změně parametru v BD -
#     pevná konfigurace tím chybu vylučuje. Různé varianty (HLS x VHDL, K) jsou různé IP.
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
if {[llength $gens] > 0} {
    set_property generic $gens [current_fileset]
}
update_compile_order -fileset sources_1

ipx::package_project -root_dir $ip_dir -vendor tul.cz -library dp -taxonomy /DP_video -import_files -set_current true -force
set core [ipx::current_core]
set_property name $ip_name $core
set_property display_name "DP VHDL $label" $core
set_property description "Diplomova prace TUL: VHDL jadro $top ($gens), mapa registru jako HLS" $core
set_property version 1.0 $core

# generika: hodnota konfigurace, v GUI skrytá
foreach g $gens {
    lassign [split $g =] name value
    set param [ipx::get_user_parameters $name -of_objects $core]
    if {$param ne ""} {
        set_property value $value $param
        set_property enablement_value false $param
    }
    set hdl_param [ipx::get_hdl_parameters $name -of_objects $core]
    if {$hdl_param ne ""} {
        set_property value $value $hdl_param
    }
}

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
