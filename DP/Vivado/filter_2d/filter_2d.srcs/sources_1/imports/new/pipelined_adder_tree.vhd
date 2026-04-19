----------------------------------------------------------------------------------
-- Company: Technical University of Liberec
-- Engineer: Bc. Karel Najman
-- Supervisor: Ing. Martin Rozkovec, Ph.D.
-- 
-- Create Year: 2026
-- Design Name: 2D Convolutional Filter
-- Module Name: pipelined_adder_tree
-- Project Name: 
-- Description: Generic pipelined binary adder tree for fixed-point arithmetic.
--              Designed in a single process to avoid VHDL 'Multiple Drivers' 
--              issues while maintaining deterministic pipeline latency.
-- Architecture: RTL
-- Math: Fixed-point (VHDL-2008)
-- 
-- Dependencies: video_processing_pkg
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;

use work.video_processing_pkg.all;

entity pipelined_adder_tree is
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
end entity pipelined_adder_tree;

architecture RTL of pipelined_adder_tree is

    -- =========================================================================
    -- Constant and Type Declarations
    -- =========================================================================
    constant STAGES     : natural := log2_ceil(NUM_INPUTS);
    constant PADDED_NUM : natural := 2 ** STAGES;

    -- Internal data arrays using package definitions
    signal tree_stage0   : t_sfixed_array(0 to PADDED_NUM - 1)(OUT_HIGH downto OUT_LOW)               := (others => (others => '0'));
    signal tree          : t_sfixed_matrix(1 to STAGES, 0 to PADDED_NUM - 1)(OUT_HIGH downto OUT_LOW) := (others => (others => (others => '0')));
    signal data_in_array : t_sfixed_array(0 to NUM_INPUTS - 1)(IN_HIGH downto IN_LOW);

begin

    data_in_array <= unpack_sfixed_array(data_in, NUM_INPUTS, IN_HIGH, IN_LOW);

    -- =========================================================================
    -- Phase 0: Combinatorial Padding
    -- Pads input data with zeros to the nearest power of 2 for the binary tree
    -- =========================================================================
    gen_stage0 : for i in 0 to NUM_INPUTS - 1 generate
        tree_stage0(i) <= resize(data_in_array(i), OUT_HIGH, OUT_LOW);
    end generate;

    gen_stage0_pad : for i in NUM_INPUTS to PADDED_NUM - 1 generate
        tree_stage0(i) <= (others => '0');
    end generate;

    -- =========================================================================
    -- Phase 1 to STAGES: Sequential Adder Tree
    -- Unified process to avoid VHDL 'Multiple Drivers' collision states
    -- =========================================================================
    sequential_adder_tree : process(aclk)
    begin
        if rising_edge(aclk) then
            if aresetn = '0' then
                tree <= (others => (others => (others => '0')));

            elsif pipeline_enable = '1' then

                for s in 1 to STAGES loop
                    for i in 0 to (PADDED_NUM / (2 ** s)) - 1 loop
                        if s = 1 then
                            -- Root branches read from combinatorial padding
                            tree(s, i) <= resize(tree_stage0(2 * i) + tree_stage0(2 * i + 1), OUT_HIGH, OUT_LOW);
                        else
                            -- Inner branches read from previous sequential registers
                            tree(s, i) <= resize(tree(s - 1, 2 * i) + tree(s - 1, 2 * i + 1), OUT_HIGH, OUT_LOW);
                        end if;
                    end loop;
                end loop;

            end if;
        end if;
    end process sequential_adder_tree;

    -- =========================================================================
    -- Output Assignment
    -- =========================================================================
    sum_out <= tree(STAGES, 0);

end architecture RTL;
