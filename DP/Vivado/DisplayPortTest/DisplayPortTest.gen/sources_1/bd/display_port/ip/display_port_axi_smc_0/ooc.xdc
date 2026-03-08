# aclk {FREQ_HZ 99999000 CLK_DOMAIN display_port_clk_wiz_0_clk_a PHASE 0.0} aclk1 {FREQ_HZ 297497025 CLK_DOMAIN display_port_clk_wiz_0_clk_a PHASE 0.0}
# Clock Domain: display_port_clk_wiz_0_clk_a
create_clock -name aclk -period 10.000 [get_ports aclk]
# Generated clocks
create_generated_clock -name aclk1 -source [get_ports aclk] -multiply_by 119 -divide_by 40 [get_ports aclk1]
