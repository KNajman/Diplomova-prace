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
        G_IMAGE_WIDTH   : positive := 1920;
        G_IMAGE_HEIGHT  : positive := 1080;
        G_KERNEL_SIZE   : positive := 3;
        
        -- Formát vstupního/výstupního pixelu (např. 8-bit Unsigned)
        G_PIX_HIGH      : integer := 7;
        G_PIX_LOW       : integer := 0;
        
        -- Formát konvolučního jádra (např. Q4.4 -> 8-bit Signed se zlomkem)
        G_KER_HIGH      : integer := 3;
        G_KER_LOW       : integer := -4;
        
        -- Nastavení okrajů (MODE_SAME zachová velikost obrazu)
        G_PADDING_MODE  : T_MODE := SAME; 
        G_PADDING_VALUE : natural := 0
    );
    port(
        clk             : in  std_logic;
        rst             : in  std_logic; -- Active High reset pro tento blok
        
        -- =====================================================================
        -- KERNEL CONFIG PORT (Přichází z paměti nebo AXI-Lite registrů)
        -- =====================================================================
        -- Šířka = Počet prvků (K*K) * Šířka jednoho prvku (HIGH - LOW + 1)
        kernel_in       : in  std_logic_vector(
                                (G_KERNEL_SIZE * G_KERNEL_SIZE * (G_KER_HIGH - G_KER_LOW + 1)) - 1 
                                downto 0
                              );
        
        -- =====================================================================
        -- AXI4-STREAM SLAVE INTERFACE (Vstup obrazu)
        -- =====================================================================
        s_axis_tdata    : in  std_logic_vector(G_PIX_HIGH - G_PIX_LOW downto 0);
        s_axis_tvalid   : in  std_logic;
        s_axis_tready   : out std_logic;
        
        -- =====================================================================
        -- AXI4-STREAM MASTER INTERFACE (Výstup konvoluce)
        -- =====================================================================
        m_axis_tdata    : out std_logic_vector(G_PIX_HIGH - G_PIX_LOW downto 0);
        m_axis_tvalid   : out std_logic;
        m_axis_tready   : in  std_logic
    );
end entity filter_2d;

architecture RTL of filter_2d is

    constant C_KER_WIDTH  : integer  := G_KER_HIGH - G_KER_LOW + 1;
    constant C_NUM_COEFFS : positive := G_KERNEL_SIZE * G_KERNEL_SIZE;

    -- =========================================================================
    -- VNITŘNÍ PROPOJOVACÍ SIGNÁLY (S využitím moderních VHDL-2008 typů)
    -- =========================================================================
    -- Rozbalený Fixed-Point Kernel
    signal kernel_sfixed  : t_sfixed_array(0 to C_NUM_COEFFS - 1)(G_KER_HIGH downto G_KER_LOW);
    
    -- Propojení mezi Window a MAC
    signal window_1d      : t_ufixed_array(0 to C_NUM_COEFFS - 1)(G_PIX_HIGH downto G_PIX_LOW);
    signal window_valid   : std_logic;
    
    -- Řízení průtoku (Backpressure)
    signal pipeline_en    : std_logic;

begin

    -- =========================================================================
    -- AXI HANDSHAKING A PIPELINE CONTROL
    -- =========================================================================
    -- Pipeline se může posouvat, pokud je výstup připraven přijímat data (m_ready).
    -- Pokud výstup nestíhá, celá datapath (Window i MAC) se zmrazí.
    pipeline_en   <= m_axis_tready;
    
    -- Jsme připraveni přijímat nová data, pokud celá pipeline běží
    s_axis_tready <= pipeline_en;

    -- =========================================================================
    -- KERNEL UNPACKER (Převod surových bitů na DSP sfixed_1d)
    -- =========================================================================
    -- Tato logika je čistě kombinační a nestojí žádné registry navíc.
    -- Vivado jen "přesměruje" vodiče do správných portů DSP bloku.
    process(kernel_in)
        variable v_slice : std_logic_vector(C_KER_WIDTH - 1 downto 0);
    begin
        for i in 0 to C_NUM_COEFFS - 1 loop
            -- Vyříznutí příslušných bitů pro i-tý koeficient (od LSB do MSB bloků)
            v_slice := kernel_in(((i + 1) * C_KER_WIDTH) - 1 downto i * C_KER_WIDTH);
            
            -- Magie VHDL-2008: Mapování SLV do SFIXED na základě zadaných indexů
            kernel_sfixed(i) <= to_sfixed(v_slice, G_KER_HIGH, G_KER_LOW);
        end loop;
    end process;

    -- =========================================================================
    -- INSTANCE 1: SLIDING WINDOW (Generování a mapování 2D do 1D)
    -- =========================================================================
    Inst_Sliding_Window: entity work.sliding_window
        generic map(
            IMAGE_WIDTH   => G_IMAGE_WIDTH,
            IMAGE_HEIGHT  => G_IMAGE_HEIGHT,
            KERNEL_SIZE   => G_KERNEL_SIZE,
            G_PIX_HIGH    => G_PIX_HIGH,
            G_PIX_LOW     => G_PIX_LOW,
            PADDING_MODE  => G_PADDING_MODE,
            PADDING_VALUE => G_PADDING_VALUE
        )
        port map(
            clk              => clk,
            rst              => rst,
            pipeline_en      => pipeline_en,
            
            pixel_in         => s_axis_tdata,
            pixel_valid_in   => s_axis_tvalid,
            
            -- Výstup už je nativně 1D Fixed-Point formát
            window_out       => window_1d,
            window_valid_out => window_valid
        );

    -- =========================================================================
    -- INSTANCE 2: MAC PIPELINE (Matematika v DSP blocích)
    -- =========================================================================
    Inst_MAC_Pipeline: entity work.mac_pipeline
        generic map(
            G_KERNEL_SIZE => G_KERNEL_SIZE,
            G_PIX_HIGH    => G_PIX_HIGH,
            G_PIX_LOW     => G_PIX_LOW,
            G_KER_HIGH    => G_KER_HIGH,
            G_KER_LOW     => G_KER_LOW
        )
        port map(
            clk             => clk,
            rst             => rst,
            pipeline_en     => pipeline_en,
            
            window_in       => window_1d,
            kernel_in       => kernel_sfixed,
            window_valid_in => window_valid,
            
            pixel_out       => m_axis_tdata,
            mac_valid_out   => m_axis_tvalid
        );

end architecture RTL;