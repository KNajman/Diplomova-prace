----------------------------------------------------------------------------------
-- University: Technical University of Liberec
-- Engineer: Bc. Karel Najman @KNajman
-- Supervisor: Ing. Martin Rozkovec, Ph.D.
-- 
-- Create Year: 2026
-- Design Name: 2D Convolutional Filter (Top-Level)
-- Module Name: filter_2d
-- Project Name: 
-- Description: 2D Konvoluční Filtr (Top-Level)
--              Architektura: AXI4-Stream kompatibilní, plně Fixed-Point (VHDL-2008)
--              Popis: Spojuje Sliding Window a MAC Pipeline. Umožňuje přímé 
--                     zpracování AXI-Stream video dat pomocí dynamicky 
--                     konfigurovatelného konvolučního jádra.
-- Architecture: RTL
-- Math: Fixed-point
-- 
-- Dependencies: video_processing_pkg, sliding_window, mac_pipeline
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Zapnutí VHDL-2008 fixed-point magie
use ieee.fixed_float_types.all;
use ieee.fixed_pkg.all;

use work.video_processing_pkg.all;

entity filter_2d is
    generic(
        G_IMAGE_WIDTH  : positive := 1920;
        G_IMAGE_HEIGHT : positive := 1080;
        G_KERNEL_SIZE  : positive := 3;
        G_PIXEL_HIGH   : integer  := 7;
        G_PIXEL_LOW    : integer  := 0;
        G_KERNEL_HIGH  : integer  := 3;
        G_KERNEL_LOW   : integer  := -4
    );
    port(
        --System clock and reset
        aclk          : in  std_logic;
        aresetn       : in  std_logic;  -- Active-Low Reset

        -- AXI4-Stream Slave Interface (Video In)
        s_axis_tdata  : in  std_logic_vector(G_PIXEL_HIGH - G_PIXEL_LOW downto 0);
        s_axis_tvalid : in  std_logic;
        s_axis_tready : out std_logic;
        s_axis_tlast  : in  std_logic;  -- (Volitelné) Indikace konce řádku/obrázku
        s_axis_tuser  : in  std_logic_vector(0 downto 0);
        -- AXI4-Stream Master Interface (Video Out)
        m_axis_tdata  : out std_logic_vector(G_PIXEL_HIGH - G_PIXEL_LOW downto 0);
        m_axis_tvalid : out std_logic;
        m_axis_tready : in  std_logic;
        m_axis_tlast  : out std_logic;  -- (Volitelné) Indikace konce řádku/obrázku
        m_axis_tuser  : out std_logic_vector(0 downto 0);
        -- Configuration Interface AXI4-Lite
        kernel_in     : in  std_logic_vector((G_KERNEL_SIZE * G_KERNEL_SIZE * (G_KERNEL_HIGH - G_KERNEL_LOW + 1)) - 1 downto 0)
    );
end entity filter_2d;

architecture RTL of filter_2d is

    -- =========================================================================
    -- Constant Declarations
    -- =========================================================================
    constant C_PIXEL_WIDTH   : natural  := G_PIXEL_HIGH - G_PIXEL_LOW + 1;
    constant C_NUMBER_COEFFS : positive := G_KERNEL_SIZE * G_KERNEL_SIZE;

    -- Propojení mezi Window a MAC
    signal window_in        : std_logic_vector((C_NUMBER_COEFFS * C_PIXEL_WIDTH) - 1 downto 0);
    signal window_out_valid : std_logic;
    signal window_out_tlast : std_logic;
    signal window_out_tuser : std_logic_vector(0 downto 0); -- std_logic_vector for consistency with AXI-Stream user signals

    -- Backpressure control signal for whole pipeline
    signal pipeline_en : std_logic;

begin
    -- Backpressure
    pipeline_en   <= m_axis_tready;
    s_axis_tready <= pipeline_en;

    -- =========================================================================
    -- Phase 1: 2D Sliding Window
    -- =========================================================================
    Inst_Sliding_Window : entity work.sliding_window
        generic map(
            IMAGE_WIDTH  => G_IMAGE_WIDTH,
            IMAGE_HEIGHT => G_IMAGE_HEIGHT,
            KERNEL_SIZE  => G_KERNEL_SIZE,
            G_PIXEL_HIGH => G_PIXEL_HIGH,
            G_PIXEL_LOW  => G_PIXEL_LOW
        )
        port map(
            aclk             => aclk,
            aresetn          => aresetn,
            pipeline_en      => pipeline_en,
            --
            pixel_in         => s_axis_tdata,
            pixel_in_valid   => s_axis_tvalid,
            pixel_in_tlast   => s_axis_tlast,
            pixel_in_tuser   => s_axis_tuser,
            --
            window_out       => window_in,
            window_out_valid => window_out_valid,
            window_out_tlast => window_out_tlast,
            window_out_tuser => window_out_tuser
        );

    -- =========================================================================
    -- Phase 2: Multiply-Accumulate Pipeline
    -- =========================================================================
    Inst_MAC_Pipeline : entity work.mac_pipeline
        generic map(
            G_KERNEL_SIZE => G_KERNEL_SIZE,
            G_PIXEL_HIGH  => G_PIXEL_HIGH,
            G_PIXEL_LOW   => G_PIXEL_LOW,
            G_KERNEL_HIGH => G_KERNEL_HIGH,
            G_KERNEL_LOW  => G_KERNEL_LOW
        )
        port map(
            aclk            => aclk,
            aresetn         => aresetn,
            pipeline_en     => pipeline_en,
            --
            window_in       => window_in,
            kernel_in       => kernel_in,
            window_in_valid => window_out_valid,
            window_in_tlast => window_out_tlast,
            window_in_tuser => window_out_tuser,
            --
            pixel_out       => m_axis_tdata,
            pixel_out_valid => m_axis_tvalid,
            pixel_out_tlast => m_axis_tlast,
            pixel_out_tuser => m_axis_tuser
        );

end architecture RTL;
