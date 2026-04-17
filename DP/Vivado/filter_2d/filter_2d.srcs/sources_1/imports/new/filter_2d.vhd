----------------------------------------------------------------------------------
-- Modul: 2D Konvoluční Filtr (Top-Level)
-- Architektura: AXI4-Stream kompatibilní, Plně Fixed-Point (VHDL-2008)
-- Popis: Spojuje Sliding Window a MAC Pipeline. Provádí rozbalení (unpacking) 
--        konfiguračního kernelu ze surových bitů přímo do DSP fixed-point formátu.
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
        G_IMAGE_WIDTH   : positive := 10;
        G_IMAGE_HEIGHT  : positive := G_IMAGE_WIDTH;
        G_KERNEL_SIZE   : positive := 3;
        -- Formát vstupního/výstupního pixelu (např. 8-bit Unsigned)
        G_PIXEL_HIGH    : integer  := 7;
        G_PIXEL_LOW     : integer  := 0;
        -- Formát konvolučního jádra (např. Q4.4 -> 8-bit Signed se zlomkem)
        G_KERNEL_HIGH   : integer  := 3;
        G_KERNEL_LOW    : integer  := -4;
        -- Nastavení okrajů (MODE_SAME zachová velikost obrazu)
        G_PADDING_MODE  : T_MODE   := SAME;
        G_PADDING_VALUE : natural  := 0
    );
    port(
        aclk          : in  std_logic;
        aresetn       : in  std_logic;  -- Active-Low Reset

        -- =====================================================================
        -- AXI4-STREAM SLAVE INTERFACE (Vstup obrazu)
        -- =====================================================================
        s_axis_tdata  : in  std_logic_vector(G_PIXEL_HIGH - G_PIXEL_LOW downto 0);
        s_axis_tvalid : in  std_logic;
        s_axis_tready : out std_logic;
        s_axis_tlast  : in  std_logic;  -- (Volitelné) Indikace konce řádku/obrázku
        s_axis_tuser  : in  std_logic_vector(0 downto 0);
        -- =====================================================================
        -- AXI4-STREAM MASTER INTERFACE (Výstup konvoluce)
        -- =====================================================================
        m_axis_tdata  : out std_logic_vector(G_PIXEL_HIGH - G_PIXEL_LOW downto 0);
        m_axis_tvalid : out std_logic;
        m_axis_tready : in  std_logic;
        m_axis_tlast  : out std_logic;  -- (Volitelné) Indikace konce řádku/obrázku
        m_axis_tuser  : out std_logic_vector(0 downto 0);
        -- =====================================================================
        -- (Volitelné) AXI4-Lite pro konfiguraci kernelu a režimu
        -- =====================================================================
        kernel_in     : in  std_logic_vector((G_KERNEL_SIZE * G_KERNEL_SIZE * (G_KERNEL_HIGH - G_KERNEL_LOW + 1)) - 1 downto 0)
    );
end entity filter_2d;

architecture RTL of filter_2d is

    constant C_NUM_COEFFS : positive := G_KERNEL_SIZE * G_KERNEL_SIZE;

    -- Propojení mezi Window a MAC
    signal window_in        : std_logic_vector((C_NUM_COEFFS * (G_PIXEL_HIGH - G_PIXEL_LOW + 1)) - 1 downto 0);
    signal window_valid     : std_logic;
    signal window_out_tlast : std_logic;
    signal window_out_tuser : std_logic_vector(0 downto 0);

    -- Řízení průtoku (Backpressure)
    signal pipeline_en : std_logic;

begin

    -- =========================================================================
    -- AXI HANDSHAKING A PIPELINE CONTROL
    -- =========================================================================
    -- Pipeline se může posouvat, pokud je výstup připraven přijímat data (m_ready).
    -- Pokud výstup nestíhá, celá datapath (Window i MAC) se zmrazí.
    pipeline_en <= m_axis_tready;

    -- Jsme připraveni přijímat nová data, pokud celá pipeline běží
    s_axis_tready <= pipeline_en;

    -- =========================================================================
    -- INSTANCE 1: SLIDING WINDOW (Generování a mapování 2D do 1D)
    -- =========================================================================
    Inst_Sliding_Window : entity work.sliding_window
        generic map(
            IMAGE_WIDTH     => G_IMAGE_WIDTH,
            IMAGE_HEIGHT    => G_IMAGE_HEIGHT,
            KERNEL_SIZE     => G_KERNEL_SIZE,
            G_PIXEL_HIGH    => G_PIXEL_HIGH,
            G_PIXEL_LOW     => G_PIXEL_LOW
        )
        port map(
            aclk             => aclk,
            aresetn          => aresetn,
            pipeline_en      => pipeline_en,
            pixel_in      => s_axis_tdata,
            pixel_in_valid     => s_axis_tvalid,
            pixel_in_tlast     => s_axis_tlast,
            pixel_in_tuser     => s_axis_tuser,
            -- Výstup už je nativně 1D Fixed-Point formát
            window_out       => window_in,
            window_out_valid => window_valid,
            -- (Volitelné) Výstupní signály pro synchronizaci s MAC Pipeline
            window_out_tlast => window_out_tlast,
            window_out_tuser => window_out_tuser
        );

    -- =========================================================================
    -- INSTANCE 2: MAC PIPELINE (Matematika v DSP blocích)
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
            aclk             => aclk,
            aresetn          => aresetn,
            pipeline_en      => pipeline_en,
            window_in        => window_in,
            kernel_in        => kernel_in,
            window_valid_in  => window_valid,
            window_in_tlast  => window_out_tlast,
            windows_in_tuser => window_out_tuser,
            pixel_out        => m_axis_tdata,
            pixel_out_valid  => m_axis_tvalid,
            pixel_out_tlast  => m_axis_tlast,
            pixel_out_tuser  => m_axis_tuser
        );

end architecture RTL;
