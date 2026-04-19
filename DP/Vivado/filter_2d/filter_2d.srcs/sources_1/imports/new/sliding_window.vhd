----------------------------------------------------------------------------------
-- Company: Technical University of Liberec
-- Engineer: Bc. Karel Najman
-- Supervisor: Ing. Martin Rozkovec, Ph.D.
-- 
-- Create Year: 2026
-- Design Name: 2D Convolutional Filter
-- Module Name: sliding_window
-- Project Name: 
-- Description: 2D Sliding Window buffer for AXI-Stream video flows.
--              Converts a 1D pixel stream into a 2D NxN kernel matrix using 
--              internal line buffers (BRAMs/URAMs).
-- Architecture: RTL
-- Math: Fixed-point (VHDL-2008)
-- 
-- Dependencies: video_processing_pkg, delay_line
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

entity sliding_window is
    generic(
        IMAGE_WIDTH  : positive;
        IMAGE_HEIGHT : positive;
        KERNEL_SIZE  : positive;
        G_PIXEL_HIGH : integer;
        G_PIXEL_LOW  : integer
    );
    port(
        -- System
        aclk             : in  std_logic;
        aresetn          : in  std_logic;
        pipeline_en      : in  std_logic;
        -- Pixel Input (AXI-Stream)
        pixel_in         : in  std_logic_vector(G_PIXEL_HIGH - G_PIXEL_LOW downto 0);
        pixel_in_valid   : in  std_logic;
        pixel_in_tlast   : in  std_logic;
        pixel_in_tuser   : in  std_logic_vector(0 downto 0);
        -- Sliding Window Output (Packed 2D Matrix)
        window_out       : out std_logic_vector((KERNEL_SIZE * KERNEL_SIZE * (G_PIXEL_HIGH - G_PIXEL_LOW + 1)) - 1 downto 0);
        window_out_valid : out std_logic;
        window_out_tlast : out std_logic;
        window_out_tuser : out std_logic_vector(0 downto 0)
    );
end entity sliding_window;

architecture RTL of sliding_window is

    -- =========================================================================
    -- Internal Signal Declarations
    -- =========================================================================
    constant C_KERNEL_WINDOW_SIZE : positive := KERNEL_SIZE - 1;
    constant C_HALF_KERNEL_SIZE   : integer  := KERNEL_SIZE / 2;

    constant C_SLIDING_WINDOW_LATENCY : natural := (C_HALF_KERNEL_SIZE) * IMAGE_WIDTH + (C_HALF_KERNEL_SIZE);

    signal window       : t_ufixed_matrix(0 to C_KERNEL_WINDOW_SIZE, 0 to C_KERNEL_WINDOW_SIZE)(G_PIXEL_HIGH downto G_PIXEL_LOW) := (others => (others => (others => '0')));
    signal line_buffers : t_ufixed_matrix(0 to KERNEL_SIZE - 2, 0 to IMAGE_WIDTH - 1)(G_PIXEL_HIGH downto G_PIXEL_LOW)           := (others => (others => (others => '0')));

    signal sw_clken : std_logic;

begin

    sw_clken <= pipeline_en and pixel_in_valid;

    -- =========================================================================
    -- Control Signals Synchronization (Delay Lines)
    -- =========================================================================

    Inst_delay_line_tlast : entity work.delay_line
        generic map(G_DELAY => C_SLIDING_WINDOW_LATENCY, G_WIDTH => 1)
        port map(aclk => aclk, aresetn => aresetn, clken => sw_clken, d_in(0) => pixel_in_tlast, d_out(0) => window_out_tlast);

    Inst_delay_line_tuser : entity work.delay_line
        generic map(G_DELAY => C_SLIDING_WINDOW_LATENCY, G_WIDTH => 1)
        port map(aclk => aclk, aresetn => aresetn, clken => sw_clken, d_in => pixel_in_tuser, d_out => window_out_tuser);

    -- =========================================================================
    -- Core Process: Sliding Window and Line Buffers Management
    -- =========================================================================
    process(aclk)
        variable v_current_pixel : ufixed(G_PIXEL_HIGH downto G_PIXEL_LOW);
        variable v_r_cnt         : natural range 0 to IMAGE_HEIGHT - 1 := 0;
        variable v_c_cnt         : natural range 0 to IMAGE_WIDTH - 1  := 0;
        variable v_frame_done    : std_logic                           := '1';
    begin
        if rising_edge(aclk) then
            if aresetn = '0' then
                v_r_cnt      := 0;
                v_c_cnt      := 0;
                v_frame_done := '1';

                window           <= (others => (others => (others => '0')));
                window_out_valid <= '0';
            elsif (pipeline_en = '1') and (pixel_in_valid = '1') then

                if pixel_in_tuser(0) = '1' then
                    v_r_cnt      := 0;
                    v_c_cnt      := 0;
                    v_frame_done := '0';
                end if;

                v_current_pixel := to_ufixed(unsigned(pixel_in), G_PIXEL_HIGH, G_PIXEL_LOW);

                -- 1. Shift 2D Window matrix
                window(KERNEL_SIZE - 1, KERNEL_SIZE - 1) <= v_current_pixel;
                for r in 0 to KERNEL_SIZE - 2 loop
                    window(r, KERNEL_SIZE - 1) <= line_buffers((KERNEL_SIZE - 2) - r, v_c_cnt);
                end loop;
                for r in 0 to KERNEL_SIZE - 1 loop
                    for c in 1 to KERNEL_SIZE - 1 loop
                        window(r, c - 1) <= window(r, c);
                    end loop;
                end loop;

                -- 3. Validate Current Window
                line_buffers(0, v_c_cnt) <= v_current_pixel;
                for r in 1 to KERNEL_SIZE - 2 loop
                    line_buffers(r, v_c_cnt) <= line_buffers(r - 1, v_c_cnt);
                end loop;

                -- 3. Validita
                if (v_r_cnt >= KERNEL_SIZE - 1) and (v_c_cnt >= KERNEL_SIZE - 1) and (v_frame_done = '0') then
                    window_out_valid <= '1';
                else
                    window_out_valid <= '0';
                end if;

                -- 4. Coordinate Counters Tracking
                if v_frame_done = '0' then
                    if v_c_cnt = IMAGE_WIDTH - 1 then
                        v_c_cnt := 0;
                        if v_r_cnt < IMAGE_HEIGHT - 1 then
                            v_r_cnt := v_r_cnt + 1;
                        else
                            v_frame_done := '1';
                        end if;
                    else
                        v_c_cnt := v_c_cnt + 1;
                    end if;
                end if;

            end if;
        end if;
    end process;

    -- =========================================================================
    -- Output Packing
    -- =========================================================================
    window_out <= pack_ufixed_matrix(window);

end architecture RTL;
