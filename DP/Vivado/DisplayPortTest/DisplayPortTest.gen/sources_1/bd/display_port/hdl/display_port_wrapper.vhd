--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
--Date        : Fri Mar  6 18:11:57 2026
--Host        : N166A running 64-bit major release  (build 9200)
--Command     : generate_target display_port_wrapper.bd
--Design      : display_port_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity display_port_wrapper is
end display_port_wrapper;

architecture STRUCTURE of display_port_wrapper is
  component display_port is
  end component display_port;
begin
display_port_i: component display_port
 ;
end STRUCTURE;
