# =============================================================================
#  Nahrání testovacího řetězce na KV260 přes JTAG a spuštění měřicí aplikace (xsdb, Vitis 2025.2).
#  Použití:  xsdb run_board.tcl [O0|O2|O3]        (z adresáře DP/sw/harness_app, deska připojená USB)
#  Výstup aplikace: UART (USB-UART desky, druhé rozhraní FTDI), 115200 Bd, 8N1 - řádky "CSV,..." a "== HOTOVO ==".
#
#  Poznámka: KV260 startuje z QSPI (bootovací firmware). Před nahráním se přes JTAG přepne boot mode
#  na JTAG (CRL_APB.BOOT_MODE_USER = 0x0100) a resetuje se celý systém - jinak by firmware z QSPI
#  držel PS a PL. Postup odpovídá tomu, co generuje "Run" ve Vitis IDE.
# =============================================================================
set level [expr {[llength $argv] > 0 ? [lindex $argv 0] : "O2"}]
set here  [file dirname [file normalize [info script]]]
set ws    [file normalize [file join $here .. build workspace]]

# hledá rekurzivně (umístění bitstreamu a psu_init.tcl v exportu platformy se mezi verzemi Vitis liší)
proc find_one {dir pattern what} {
    set found [glob -nocomplain -directory $dir $pattern]
    foreach sub [glob -nocomplain -directory $dir -types d *] {
        if {[llength $found] == 0} {
            catch {set found [list [find_one $sub $pattern $what]]}
        }
    }
    if {[llength $found] == 0} {
        error "Nenalezeno: $what ($pattern v $dir)"
    }
    return [lindex $found 0]
}
set elf      [find_one [file join $ws harness_app_$level build] *.elf "ELF aplikace $level"]
set bit      [find_one [file join $ws harness_platform export] *.bit "bitstream"]
set psu_init [find_one [file join $ws harness_platform export] psu_init.tcl "psu_init.tcl"]
puts "ELF: $elf\nBIT: $bit\nPSU: $psu_init"

connect
targets -set -nocase -filter {name =~ "*PSU*"}
mwr 0xff5e0200 0x0100
rst -system
after 3000
targets -set -nocase -filter {name =~ "*PSU*"}
fpga -file $bit
source $psu_init
psu_init
after 1000
psu_ps_pl_isolation_removal
after 1000
psu_ps_pl_reset_config
catch {psu_protection}
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow $elf
con
puts "Aplikace bezi - vysledky na UART (115200 Bd)."
