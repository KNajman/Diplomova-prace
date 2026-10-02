----------------------------------------------------------------------------------
-- Company: Technical University of Liberec
-- Engineer: Bc. Karel Najman
-- 
-- Create Year: 2026
-- Design Name: 
-- Module Name: 
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Generic Linear Color Space Converter (Matrix Transformation)
-- Architecture: Fully Pipelined (4 stages), AXI4-Stream compatible, DSP optimized
-- Math: IEEE.fixed_pkg used for fractional arithmetic with automatic saturation 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.FIXED_FLOAT_TYPES.ALL;         -- pro konstanty fixed_round a fixed_saturate
use IEEE.FIXED_PKG.ALL;                 -- VHDL-2008 Fixed-point aritmetika

-- Předpokládá se existence balíčku
use work.video_processing_pkg.all;

entity color_space_conversion is
    generic(
        -- Parametry obrazu a barevného prostoru
        --VSTUPNÍ KANÁLY: Např. 3 pro RGB, 1 pro Y
        G_CHANNELS_IN     : positive := 3; -- Počet vstupních kanálů (např. 3 pro RGB)
        G_BITS_CHANNEL_IN   : positive := 8; -- Bitová hloubka vstupního kanálu

        --VÝSTUPNÍ KANÁLY: Např. 3 pro YCbCr, 1 pro Y
        G_CHANNELS_OUT    : positive := 3; -- Počet výstupních kanálů (např. 3 pro YCbCr nebo 1 pro Y/Gray)
        G_BITS_CHANNEL_OUT  : positive := 8; -- Bitová hloubka výstupního kanálu (8:8:8 nebo 8:0 pro grayscale, nebudu řešit 4:2:2 atd.)
        
        

        -- Parametry Fixed-Point koeficientů (např. Q8.8 -> Int=7, Frac=-8) hodnoty od -128 do +127.99609375 s krokem 1/256
        --TODO: vetšina pixel typů je unsigned (0 až 255) to vede na uQ8.0
        -- Koeficinty jsou jak kladné tak záporné, 
    );
    port(
        clk              : in  std_logic;
        rst_n            : in  std_logic; -- Active LOW reset (Standard pro AXI)

        -- =====================================================================
        -- Konfigurační porty (Připraveno pro napojení na AXI4-Lite registry)
        -- =====================================================================
        -- Koeficienty a offsety předávám jako 1D pole (plochý vektor), 
        -- aby to bylo jednoduše mapovatelné na AXI-Lite registry.
        
        
        -- Velikost vstupu je G_CHANNELS_IN * G_CHANNELS_OUT * COEFF_W (kde COEFF_W je šířka jednoho koeficientu v bitech)
        cfg_coeffs_flat  : in  std_logic_vector((G_CHANNELS_IN * G_CHANNELS_OUT * (G_COEFF_INT_BITS - G_COEFF_FRAC_BITS + 1)) - 1 downto 0);
        cfg_offsets_flat : in  std_logic_vector((G_CHANNELS_OUT * G_BITS_PER_CHAN) - 1 downto 0);
        -- AXI4-Stream VSTUP (Slave)
        s_axis_tdata     : in  std_logic_vector((G_CHANNELS_IN * G_BITS_PER_CHAN) - 1 downto 0);
        s_axis_tuser     : in  std_logic; -- Start of Frame (SOF)
        s_axis_tlast     : in  std_logic; -- End of Line (EOL)
        s_axis_tvalid    : in  std_logic;
        s_axis_tready    : out std_logic;
        -- AXI4-Stream VÝSTUP (Master)
        m_axis_tdata     : out std_logic_vector((G_CHANNELS_OUT * G_BITS_PER_CHAN) - 1 downto 0);
        m_axis_tuser     : out std_logic;
        m_axis_tlast     : out std_logic;
        m_axis_tvalid    : out std_logic;
        m_axis_tready    : in  std_logic
    );
end entity color_space_conversion;

architecture RTL of color_space_conversion is

    -- Šířka koeficientu v bitech (pro rozbalení) + známenko
    constant COEFF_W : integer := G_COEFF_INT_BITS - G_COEFF_FRAC_BITS + 1;

    -- Meze po násobení: (Pixel rozšiřujeme o 1 znaménkový bit)
    constant MULT_HI : integer := G_BITS_PER_CHAN + G_COEFF_INT_BITS + 1;
    constant MULT_LO : integer := G_COEFF_FRAC_BITS;
    
    -- Meze po akumulaci: Matematicky odvozeno z počtu operandů
    -- Sčítáme G_CHANNELS_IN násobků + 1 offset -> celkem (G_CHANNELS_IN + 1) operandů
    constant EXTRA_ACC_BITS : natural := log2_ceil(G_CHANNELS_IN + 1);
    
    constant ACC_HI  : integer := MULT_HI + EXTRA_ACC_BITS;
    constant ACC_LO  : integer := MULT_LO;

    -- Signály pro rozbalenou konfiguraci
    signal coeff_matrix  : t_sfixed_matrix(0 to G_CHANNELS_OUT - 1, 0 to G_CHANNELS_IN - 1)(G_COEFF_INT_BITS downto G_COEFF_FRAC_BITS);
    signal offset_vector : t_ufixed_array(0 to G_CHANNELS_OUT - 1)(G_BITS_PER_CHAN - 1 downto 0);

    -- Pipeline signály s využitím typů z vid_processing_pkg
    -- STAGE 1: Input Latch (Rozbaleno na ufixed kanály)
    signal st1_pixel                     : t_ufixed_array(0 to G_CHANNELS_IN - 1)(G_BITS_PER_CHAN - 1 downto 0);
    signal st1_user, st1_last, st1_valid : std_logic;

    -- STAGE 2: Multipliers (sfixed výsledky po násobení)
    type   mult_res_t                    is array (0 to G_CHANNELS_OUT - 1, 0 to G_CHANNELS_IN - 1) of sfixed(MULT_HI downto MULT_LO);
    signal st2_mult                      : mult_res_t;
    signal st2_user, st2_last, st2_valid : std_logic;

    -- STAGE 3: Accumulators (Sčítací strom + Offset)
    -- Rozsah sfixed dostatečný pro součet (přidáváme bity pro carry)
    signal st3_sum                       : t_sfixed_array(0 to G_CHANNELS_OUT - 1)(ACC_HI downto ACC_LO);
    signal st3_user, st3_last, st3_valid : std_logic;

    -- Flow control
    signal pipe_en : std_logic;

begin

    -- =========================================================================
    -- MAPOVÁNÍ PLOCHÝCH VEKTORŮ NA MATICE (Kombinačně)
    -- =========================================================================
    -- Tento blok rozseká 1D vektory z konfiguračních portů do 2D matic sfixed
    -- pro přehlednější matematické operace.
    -- =========================================================================
    -- ŘÍZENÍ DATFLOW (AXI Handshake)
    -- =========================================================================
    -- Modul je připraven přijímat data, pokud výstupní master neblokuje tok,
    -- nebo pokud je pipeline prázdná (st3_valid = '0').

    -- HLAVNÍ PIPELINE PROCES (Synchronní)
    ----------------------------------------------------------------------------
    -- 1. UNPACK CONFIGURATION (Kombinačně)
    ----------------------------------------------------------------------------
    process(cfg_coeffs_flat, cfg_offsets_flat)
    begin
        for i in 0 to G_CHANNELS_OUT - 1 loop
            -- Rozbalení offsetů
            offset_vector(i) <= to_ufixed(cfg_offsets_flat((i + 1) * G_BITS_PER_CHAN - 1 downto i * G_BITS_PER_CHAN), G_BITS_PER_CHAN - 1, 0);
            -- Rozbalení matice koeficientů
            for j in 0 to G_CHANNELS_IN - 1 loop
                coeff_matrix(i, j) <= to_sfixed(cfg_coeffs_flat(((i * G_CHANNELS_IN + j + 1) * COEFF_W) - 1 downto (i * G_CHANNELS_IN + j) * COEFF_W), G_COEFF_INT_BITS, G_COEFF_FRAC_BITS);
            end loop;
        end loop;
    end process;

    ----------------------------------------------------------------------------
    -- 2. PIPELINE LOGIC (High Frequency Optimized)
    ----------------------------------------------------------------------------
    pipe_en       <= m_axis_tready or not st3_valid; -- Jednoduchý backpressure
    s_axis_tready <= pipe_en;

    process(clk)
        variable v_acc : sfixed(st3_sum(0)'range);
    begin
        if rising_edge(clk) then
            if rst_n = '0' then

                -- Reset všech pipeline registrů
                st1_user  <= '0';
                st1_last  <= '0';
                st1_valid <= '0';

                st2_user  <= '0';
                st2_last  <= '0';
                st2_valid <= '0';

                st3_user  <= '0';
                st3_last  <= '0';
                st3_valid <= '0';

                v_acc := (others => '0');

            elsif pipe_en = '1' then

                -- STAGE 1: Unpack AXI TDATA into ufixed channels
                st1_valid <= s_axis_tvalid;
                st1_user  <= s_axis_tuser;
                st1_last  <= s_axis_tlast;
                for i in 0 to G_CHANNELS_IN - 1 loop
                    st1_pixel(i) <= to_ufixed(s_axis_tdata((i + 1) * G_BITS_PER_CHAN - 1 downto i * G_BITS_PER_CHAN), G_BITS_PER_CHAN - 1, 0);
                end loop;

                -- STAGE 2: Parallel Multiplication (DSP48 candidates)
                st2_valid <= st1_valid;
                st2_user  <= st1_user;
                st2_last  <= st1_last;
                for i in 0 to G_CHANNELS_OUT - 1 loop
                    for j in 0 to G_CHANNELS_IN - 1 loop
                        st2_mult(i, j) <= to_sfixed('0' & std_logic_vector(st1_pixel(j)), G_BITS_PER_CHAN, 0) * coeff_matrix(i, j);
                    end loop;
                end loop;

                -- STAGE 3: Adder Tree & Offset & Saturation
                st3_valid <= st2_valid;
                st3_user  <= st2_user;
                st3_last  <= st2_last;
                for i in 0 to G_CHANNELS_OUT - 1 loop
                    -- Inicializace součtu hodnotou offsetu
                    v_acc      := resize(to_sfixed(offset_vector(i)), v_acc);
                    -- Akumulace
                    for j in 0 to G_CHANNELS_IN - 1 loop
                        v_acc := resize(v_acc + st2_mult(i, j), v_acc);
                    end loop;
                    st3_sum(i) <= v_acc;
                end loop;

            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- 3. PACK OUTPUT ( Výstupní přiřazení se saturací zpětným převod zpět na std_logic_vector)
    ----------------------------------------------------------------------------
    m_axis_tvalid <= st3_valid;
    m_axis_tuser  <= st3_user;
    m_axis_tlast  <= st3_last;

    process(st3_sum)
        variable v_pixel_out : t_pixel(0 to G_CHANNELS_OUT - 1)(G_BITS_PER_CHAN - 1 downto 0);
        -- Pomocná proměnná: 1 bit znaménko + 8 bitů hodnota (rozsah -256 až +255)
        variable v_val       : sfixed(G_BITS_PER_CHAN downto 0);
    begin
        for i in 0 to G_CHANNELS_OUT - 1 loop
            -- Oříznutí na horní mez (255) pomocí resize
            -- Parametr left_index je G_BITS_PER_CHAN (což je 8, tj. 9 bitů celkem)
            v_val := resize(
                arg            => st3_sum(i), 
                left_index     => G_BITS_PER_CHAN, 
                right_index    => 0, 
                overflow_style => fixed_saturate, 
                round_style    => fixed_round
            );
            
            --Oříznutí na dolní mez (0) pro záporné výsledky
            if v_val < 0 then
                v_pixel_out(i) := (others => '0');
            else
                -- Číslo je kladné a díky předchozímu resize maximálně 255.
                -- Bezpečně tedy vezmeme jen spodních 8 bitů (odřízneme znaménko)
                v_pixel_out(i) := to_slv(v_val(G_BITS_PER_CHAN-1 downto 0));
            end if;
            
        end loop;

        -- Použití funkce pack_pixel z vid_processing_pkg pro finální TDATA
        m_axis_tdata <= pack_pixel(v_pixel_out, G_BITS_PER_CHAN);
    end process;

end architecture RTL;
