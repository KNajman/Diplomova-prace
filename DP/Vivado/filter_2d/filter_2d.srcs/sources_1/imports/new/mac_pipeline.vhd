----------------------------------------------------------------------------------
-- Company: Technical University of Liberec
-- Engineer: Bc. Karel Najman @KNajman
-- Supervisor: Ing. Martin Rozkovec, Ph.D.
-- 
-- Create Year: 2026
-- Design Name: 2D Convolutional Filter
-- Module Name: mac_pipeline
-- Project Name: 
-- Description: Fully pipelined Multiply-Accumulate (MAC) architecture.
--              Designed for maximum Fmax using DSP48 slices. Safely handles
--              fixed-point types, internal bit-growth, and clipping.
-- Architecture: RTL
-- Math: Fixed-point (VHDL-2008)
-- 
-- Dependencies: video_processing_pkg, delay_line, pipelined_adder_tree
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_float_types.all;
use ieee.fixed_pkg.all;

use work.video_processing_pkg.all;

entity mac_pipeline is
    generic(
        G_PIXEL_HIGH  : integer;
        G_PIXEL_LOW   : integer;
        G_KERNEL_SIZE : positive;
        G_KERNEL_HIGH : integer;
        G_KERNEL_LOW  : integer
    );
    port(
        aclk            : in  std_logic;
        aresetn         : in  std_logic;
        pipeline_en     : in  std_logic;
        --
        kernel_in       : in  std_logic_vector((G_KERNEL_SIZE * G_KERNEL_SIZE * (G_KERNEL_HIGH - G_KERNEL_LOW + 1)) - 1 downto 0);
        --
        window_in       : in  std_logic_vector((G_KERNEL_SIZE * G_KERNEL_SIZE * (G_PIXEL_HIGH - G_PIXEL_LOW + 1)) - 1 downto 0);
        window_in_valid : in  std_logic;
        window_in_tlast : in  std_logic;
        window_in_tuser : in  std_logic_vector(0 downto 0);
        --
        pixel_out       : out std_logic_vector(G_PIXEL_HIGH - G_PIXEL_LOW downto 0);
        pixel_out_valid : out std_logic;
        pixel_out_tlast : out std_logic;
        pixel_out_tuser : out std_logic_vector(0 downto 0)
    );
end entity mac_pipeline;

architecture RTL of mac_pipeline is
    constant C_NUM_ELEMENTS : positive := G_KERNEL_SIZE * G_KERNEL_SIZE;
    constant C_BRANCHES     : natural  := log2_ceil(C_NUM_ELEMENTS);
    constant C_MAC_LATENCY  : natural  := 1 + C_BRANCHES + 1;
    constant ACC_HIGH       : integer  := G_PIXEL_HIGH + G_KERNEL_HIGH + 2 + C_BRANCHES;

    signal mult_results : t_sfixed_array(0 to C_NUM_ELEMENTS - 1)((G_PIXEL_HIGH + 1) + G_KERNEL_HIGH + 1 downto G_PIXEL_LOW + G_KERNEL_LOW);
    signal tree_sum     : sfixed(ACC_HIGH downto G_PIXEL_LOW + G_KERNEL_LOW);
    signal window_fixed : t_ufixed_array(0 to C_NUM_ELEMENTS - 1)(G_PIXEL_HIGH downto G_PIXEL_LOW);
    signal kernel_fixed : t_sfixed_array(0 to C_NUM_ELEMENTS - 1)(G_KERNEL_HIGH downto G_KERNEL_LOW);
    
    attribute use_dsp : string;
    attribute use_dsp of mult_results : signal is "yes";

begin
    -- =========================================================================
    -- Control Signals Synchronization (Delay Lines)
    -- =========================================================================
    Inst_delay_line_tlast : entity work.delay_line
        generic map(G_DELAY => C_MAC_LATENCY, G_WIDTH => 1)
        port map(aclk => aclk, aresetn => aresetn, clken => pipeline_en, d_in(0) => window_in_tlast, d_out(0) => pixel_out_tlast);

    Inst_delay_line_tuser : entity work.delay_line
        generic map(G_DELAY => C_MAC_LATENCY, G_WIDTH => 1)
        port map(aclk => aclk, aresetn => aresetn, clken => pipeline_en, d_in => window_in_tuser, d_out => pixel_out_tuser);

    Inst_delay_line_valid : entity work.delay_line
        generic map(G_DELAY => C_MAC_LATENCY, G_WIDTH => 1)
        port map(aclk => aclk, aresetn => aresetn, clken => pipeline_en, d_in(0) => window_in_valid, d_out(0) => pixel_out_valid);

    -- Unpack raw bit vectors into strongly typed arrays using pkg functions
    window_fixed <= unpack_ufixed_array(window_in, C_NUM_ELEMENTS, G_PIXEL_HIGH, G_PIXEL_LOW);
    kernel_fixed <= unpack_sfixed_array(kernel_in, C_NUM_ELEMENTS, G_KERNEL_HIGH, G_KERNEL_LOW);

    -- =========================================================================
    -- Phase 1: Parallel Multiplication (DSP48 mapping)
    -- =========================================================================
    parallel_multiplication : process(aclk)
        variable v_pixel_signed : sfixed(G_PIXEL_HIGH + 1 downto G_PIXEL_LOW);
        variable v_kernel_signed : sfixed(G_KERNEL_HIGH downto G_KERNEL_LOW);
    begin
        if rising_edge(aclk) then
            if aresetn = '0' then
                mult_results <= (others => (others => '0'));
            elsif pipeline_en = '1' then
                for i in 0 to C_NUM_ELEMENTS - 1 loop
                    -- Resize automatically pads MSB with '0', securing a positive value
                    -- Safe cast to sfixed is then guaranteed
                    v_pixel_signed  := sfixed(resize(window_fixed(i), G_PIXEL_HIGH + 1, G_PIXEL_LOW));
                    v_kernel_signed := kernel_fixed(i);
                    
                    mult_results(i) <= v_pixel_signed * v_kernel_signed;
                end loop;
            end if;
        end if;
    end process;

    -- =========================================================================
    -- Phase 2: Pipelined Adder Tree
    -- =========================================================================
    -- Inst_Adder_Tree : entity work.pipelined_adder_tree
    --     generic map(
    --         NUM_INPUTS => C_NUM_ELEMENTS,
    --         IN_HIGH    => mult_results(0)'high,
    --         IN_LOW     => mult_results(0)'low,
    --         OUT_HIGH   => ACC_HIGH,
    --         OUT_LOW    => G_PIXEL_LOW + G_KERNEL_LOW
    --     )
    --     port map(
    --         aclk            => aclk,
    --         aresetn         => aresetn,
    --         pipeline_enable => pipeline_en,
    --         data_in         => pack_sfixed_array(mult_results, C_NUM_ELEMENTS, mult_results(0)'high, mult_results(0)'low),
    --         sum_out         => tree_sum
    --     );


        --==========================================================================
        -- Phase 2: Alternative Pipelined Adder Cascade (Uncomment to use instead of Tree)
        --==========================================================================
    Inst_Adder_Cascade : entity work.pipelined_adder_cascade
        generic map(
            NUM_INPUTS => C_NUM_ELEMENTS,
            IN_HIGH    => mult_results(0)'high,
            IN_LOW     => mult_results(0)'low,
            OUT_HIGH   => ACC_HIGH,
            OUT_LOW    => G_PIXEL_LOW + G_KERNEL_LOW
        )
        port map(
            aclk            => aclk,
            aresetn         => aresetn,
            pipeline_enable => pipeline_en,
            data_in         => pack_sfixed_array(mult_results, C_NUM_ELEMENTS, mult_results(0)'high, mult_results(0)'low),
            sum_out         => tree_sum
        );


   -- =========================================================================
    -- Phase 3: Saturation and Rounding
    -- =========================================================================
    process(aclk)
        variable rounded_signed : sfixed(G_PIXEL_HIGH + 1 downto G_PIXEL_LOW);
    begin
        if rising_edge(aclk) then
            if aresetn = '0' then 
                pixel_out <= (others => '0');
            elsif pipeline_en = '1' then
                -- VHDL-2008 fixed_pkg safely rounds and clips the upper bounds
                rounded_signed := resize(tree_sum, G_PIXEL_HIGH + 1, G_PIXEL_LOW, fixed_saturate, fixed_round);
                
                -- Hard clip (Zero-Floor) for negative numbers
                if rounded_signed < 0 then
                    pixel_out <= (others => '0');
                else
                    pixel_out <= to_slv(rounded_signed(G_PIXEL_HIGH downto G_PIXEL_LOW));
                end if;
            end if;
        end if;
    end process;

end architecture RTL;
