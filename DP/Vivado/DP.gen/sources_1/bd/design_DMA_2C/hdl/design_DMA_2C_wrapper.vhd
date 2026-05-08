--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
--Date        : Fri May  8 12:30:13 2026
--Host        : N166A running 64-bit major release  (build 9200)
--Command     : generate_target design_DMA_2C_wrapper.bd
--Design      : design_DMA_2C_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_DMA_2C_wrapper is
end design_DMA_2C_wrapper;

architecture STRUCTURE of design_DMA_2C_wrapper is
  component design_DMA_2C is
  end component design_DMA_2C;
begin
design_DMA_2C_i: component design_DMA_2C
 ;
end STRUCTURE;
