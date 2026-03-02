# aclk {FREQ_HZ 99999000 CLK_DOMAIN design_1_clk_wiz_0_1_clk_out1 PHASE 0.0} aclk1 {FREQ_HZ 299997000 CLK_DOMAIN design_1_clk_wiz_0_1_clk_out1 PHASE 0.0}
# Clock Domain: design_1_clk_wiz_0_1_clk_out1
create_clock -name aclk -period 10.000 [get_ports aclk]
# Generated clocks
create_generated_clock -name aclk1 -source [get_ports aclk] -multiply_by 3 -divide_by 1 [get_ports aclk1]
