----------------------------------------------------------------------------------
-- Company: Technical University of Liberec
-- Engineer: Bc. Karel Najman
-- Supervisor: Ing. Martin Rozkovec, Ph.D.
-- 
-- Create Year: 2026
-- Design Name: 2D Convolutional Filter
-- Module Name: pipelined_adder_cascade
-- Project Name: 
-- Description: Linear Adder Cascade for fixed-point arithmetic.
--              Replaces the binary tree to perfectly map onto DSP48/DSP58 slices
--              using dedicated fast PCIN/PCOUT routing paths (Systolic Array).
-- Architecture: CASCADE
-- Math: Fixed-point (VHDL-2008)
-- Dependencies: video_processing_pkg
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- ----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;

use work.video_processing_pkg.all;

entity pipelined_adder_cascade is
    generic(
        NUM_INPUTS : positive;
        IN_HIGH    : integer;
        IN_LOW     : integer;
        OUT_HIGH   : integer;
        OUT_LOW    : integer
    );
    port(
        aclk            : in  std_logic;
        aresetn         : in  std_logic; 
        pipeline_enable : in  std_logic;
        
        data_in         : in  std_logic_vector((NUM_INPUTS * (IN_HIGH - IN_LOW + 1)) - 1 downto 0);
        sum_out         : out sfixed(OUT_HIGH downto OUT_LOW)
    );
end entity pipelined_adder_cascade;

architecture CASCADE of pipelined_adder_cascade is
    
    -- Pole registrů reprezentující řetězec sčítaček
    type t_cascade is array (0 to NUM_INPUTS - 1) of sfixed(OUT_HIGH downto OUT_LOW);
    signal cascade_reg : t_cascade := (others => (others => '0'));
    
    -- Přímý povel pro Vivado: Použij DSP bloky na tuto kaskádu sčítaček!
    attribute use_dsp : string;
    attribute use_dsp of cascade_reg : signal is "yes";
    
    signal data_in_array : t_sfixed_array(0 to NUM_INPUTS - 1)(IN_HIGH downto IN_LOW);

begin

    data_in_array <= unpack_sfixed_array(data_in, NUM_INPUTS, IN_HIGH, IN_LOW);

    process(aclk)
    begin
        if rising_edge(aclk) then
            if aresetn = '0' then 
                cascade_reg <= (others => (others => '0'));
                
            elsif pipeline_enable = '1' then
                
                -- První stupeň kaskády (jen načtení z rozšířením)
                cascade_reg(0) <= resize(data_in_array(0), OUT_HIGH, OUT_LOW);
                
                -- Systolické sčítání podél řetězce (A(i) + P(i-1))
                -- Latence je přesně NUM_INPUTS - 1 hodinových cyklů
                for i in 1 to NUM_INPUTS - 1 loop
                    cascade_reg(i) <= resize(cascade_reg(i-1) + data_in_array(i), OUT_HIGH, OUT_LOW);
                end loop;
                
            end if;
        end if;
    end process;

    -- Výstupem je poslední člen kaskády
    sum_out <= cascade_reg(NUM_INPUTS - 1);

end architecture CASCADE;