# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\work\2024\HSC\fractal\vitis\fractal_system\_ide\scripts\debugger_fractal-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\work\2024\HSC\fractal\vitis\fractal_system\_ide\scripts\debugger_fractal-default.tcl
# 
connect -url tcp:127.0.0.1:3121
source D:/Xilinx/Vitis/2024.2/scripts/vitis/util/zynqmp_utils.tcl
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Xilinx HW-FTDI-TEST FT232H 85866" && level==0 && jtag_device_ctx=="jsn-HW-FTDI-TEST FT232H-85866-14730093-0"}
fpga -file C:/work/2024/HSC/fractal/vitis/fractal/_ide/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/work/2024/HSC/fractal/vitis/design_1_wrapper_6x1/export/design_1_wrapper_6x1/hw/design_1_wrapper_6x1.xsa -mem-ranges [list {0x80000000 0xbfffffff} {0x400000000 0x5ffffffff} {0x1000000000 0x7fffffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
set mode [expr [mrd -value 0xFF5E0200] & 0xf]
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow C:/work/2024/HSC/fractal/vitis/design_1_wrapper_6x1/export/design_1_wrapper_6x1/sw/design_1_wrapper_6x1/boot/fsbl.elf
set bp_59_13_fsbl_bp [bpadd -addr &XFsbl_Exit]
con -block -timeout 60
bpremove $bp_59_13_fsbl_bp
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow C:/work/2024/HSC/fractal/vitis/fractal/Release/fractal.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A53*#0"}
con
