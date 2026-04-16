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
-- Description: 2D Sliding Window with Auto-Flushing and Zero-Overhead Padding
-- Architecture:RTL
-- Math: IEEE.fixed_pkg used for fractional arithmetic with automatic saturation 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Zapnutí VHDL-2008 fixed-point magie
use ieee.fixed_float_types.all;
use ieee.fixed_pkg.all;

use work.video_processing_pkg.all;

entity sliding_window is
    generic(
        IMAGE_WIDTH     : positive;
        IMAGE_HEIGHT    : positive;
        KERNEL_SIZE     : positive;
        -- Formát pixelu z mac_pipeline (typicky 8-bit unsigned -> 7 downto 0)
        G_PIXEL_HIGH    : integer;
        G_PIXEL_LOW     : integer;
        G_PADDING_MODE  : T_MODE;
        G_PADDING_VALUE : natural
    );
    port(
        aclk             : in  std_logic;
        aresetn          : in  std_logic;
        pipeline_en      : in  std_logic;
        -- Vstupní AXI-Stream-like rozhraní
        pixel_in         : in  std_logic_vector(G_PIXEL_HIGH - G_PIXEL_LOW downto 0);
        pixel_valid_in   : in  std_logic;
        -- Výstup připravený přímo pro MAC Pipeline (1D flattened array)
        -- window_out       : out t_ufixed_array(0 to (KERNEL_SIZE * KERNEL_SIZE) - 1)(G_PIXEL_HIGH downto G_PIXEL_LOW);
        window_out       : out std_logic_vector((KERNEL_SIZE * KERNEL_SIZE * (G_PIXEL_HIGH - G_PIXEL_LOW + 1)) - 1 downto 0);
        window_valid_out : out std_logic
    );
end entity sliding_window;

architecture RTL of sliding_window is
    -- Konstanty pro řízení cyklů (nyní využívají opravenou funkci get_max_dim z KROKU 1)
    constant MAX_C : natural := get_max_dim(IMAGE_WIDTH, KERNEL_SIZE, G_PADDING_MODE);
    constant MAX_R : natural := get_max_dim(IMAGE_HEIGHT, KERNEL_SIZE, G_PADDING_MODE);

    -- =========================================================================
    -- Paměťové struktury
    -- =========================================================================
    -- Řádkové buffery (Line Buffers) ukládající celé řádky obrazu
    signal line_buffers : t_ufixed_matrix(0 to KERNEL_SIZE - 2, 0 to MAX_C - 1)(G_PIXEL_HIGH downto G_PIXEL_LOW) := (others => (others => (others => '0')));

    -- Samotné 2D okno
    signal window : t_ufixed_matrix(0 to KERNEL_SIZE - 1, 0 to KERNEL_SIZE - 1)(G_PIXEL_HIGH downto G_PIXEL_LOW) := (others => (others => (others => '0')));

    -- Čítače souřadnic
    signal r_cnt : natural range 0 to MAX_R := 0;
    signal c_cnt : natural range 0 to MAX_C := 0;

begin

    process(aclk)
        -- Vnitřní proměnná pro aktuálně zpracovávaný pixel
        variable cur_pix : ufixed(G_PIXEL_HIGH downto G_PIXEL_LOW);
    begin
        if rising_edge(aclk) then
            if aresetn = '0' then
                r_cnt            <= 0;
                c_cnt            <= 0;
                window_valid_out <= '0';
                window           <= (others => (others => (others => '0')));
            -- Line buffery se typicky neresetují kvůli úspoře zdrojů, 
            -- ale v simulaci je vhodné to zvážit. Pro FPGA je necháme neresetované.

            elsif pipeline_en = '1' then

                -- =====================================================================
                -- 1. Výběr aktuálního pixelu (Reálný vstup vs. Okrajový Padding)
                -- =====================================================================
                if pixel_valid_in = '1' then
                    -- Přímá konverze příchozího std_logic_vector na unsigned a následně na ufixed
                    cur_pix := to_ufixed(unsigned(pixel_in), G_PIXEL_HIGH, G_PIXEL_LOW);
                else
                    -- Bezpečná konverze integer paddingu na ufixed
                    cur_pix := to_ufixed(G_PADDING_VALUE, G_PIXEL_HIGH, G_PIXEL_LOW);
                end if;

                -- =====================================================================
                -- 2. Aktualizace souřadnic pixelů
                -- =====================================================================
                if c_cnt = MAX_C - 1 then
                    c_cnt <= 0;
                    if r_cnt = MAX_R - 1 then
                        r_cnt <= 0;
                    else
                        r_cnt <= r_cnt + 1;
                    end if;
                else
                    c_cnt <= c_cnt + 1;
                end if;

                -- =====================================================================
                -- 3. Posun 2D okna (Sliding Window posun v ose X)
                -- =====================================================================
                for r in 0 to KERNEL_SIZE - 1 loop
                    for c in 0 to KERNEL_SIZE - 2 loop
                        window(r, c) <= window(r, c + 1);
                    end loop;
                end loop;

                -- Napojení nejnovějších dat na pravý okraj okna
                window(0, KERNEL_SIZE - 1) <= cur_pix;
                for r in 1 to KERNEL_SIZE - 1 loop
                    window(r, KERNEL_SIZE - 1) <= line_buffers(r - 1, c_cnt);
                end loop;

                -- =====================================================================
                -- 4. Zápis a posun do řádkových bufferů (Line Buffers v ose Y)
                -- =====================================================================
                line_buffers(0, c_cnt) <= cur_pix;
                for r in 1 to KERNEL_SIZE - 2 loop
                    line_buffers(r, c_cnt) <= line_buffers(r - 1, c_cnt);
                end loop;

                -- =====================================================================
                -- 5. Nastavení validity (Plné okno)
                -- =====================================================================
                -- Okno dává smysl až po naplnění prvních (KERNEL_SIZE - 1) řádků a sloupců
                if (r_cnt >= KERNEL_SIZE - 1) and (c_cnt >= KERNEL_SIZE - 1) then
                    window_valid_out <= '1';
                else
                    window_valid_out <= '0';
                end if;

            end if;
        end if;
    end process;

    window_out <= pack_ufixed_matrix(window);

end architecture RTL;
