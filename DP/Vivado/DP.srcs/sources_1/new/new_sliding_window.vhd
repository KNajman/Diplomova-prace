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
        IMAGE_WIDTH   : positive := 1920;
        IMAGE_HEIGHT  : positive := 1080;
        KERNEL_SIZE   : positive := 3;
        
        -- Formát pixelu z mac_pipeline (typicky 8-bit unsigned -> 7 downto 0)
        G_PIX_HIGH    : integer  := 7;
        G_PIX_LOW     : integer  := 0;
        
        PADDING_MODE  : T_MODE := SAME;
        PADDING_VALUE : natural  := 0
    );
    port(
        clk              : in  std_logic;
        rst              : in  std_logic;
        pipeline_en      : in  std_logic;

        -- Vstupní AXI-Stream-like rozhraní
        pixel_in         : in  std_logic_vector(G_PIX_HIGH - G_PIX_LOW downto 0);
        pixel_valid_in   : in  std_logic;

        -- Výstup připravený přímo pro MAC Pipeline (1D flattened array)
        window_out       : out t_ufixed_array(0 to (KERNEL_SIZE * KERNEL_SIZE) - 1)(G_PIX_HIGH downto G_PIX_LOW);
        window_valid_out : out std_logic
    );
end entity sliding_window;

architecture RTL of sliding_window is

    constant R : integer := KERNEL_SIZE / 2; -- Poloměr jádra (Radius)
    constant C_PIX_WIDTH : integer := G_PIX_HIGH - G_PIX_LOW + 1;

    -- =========================================================================
    -- PAMĚŤOVÉ STRUKTURY (Vyvodí se do BRAM a Shift Registrů)
    -- =========================================================================
    -- 1. Line Buffery (Udrží K-1 řádků obrazu)
    type t_line_buf is array (0 to IMAGE_WIDTH-1) of std_logic_vector(C_PIX_WIDTH - 1 downto 0);
    type t_lb_array is array (0 to KERNEL_SIZE-2) of t_line_buf;
    signal line_buffers : t_lb_array := (others => (others => (others => '0')));
    
    -- 2. Posuvné okno (Matice KxK)
    type t_window is array (0 to KERNEL_SIZE-1, 0 to KERNEL_SIZE-1) of std_logic_vector(C_PIX_WIDTH - 1 downto 0);
    signal window_reg : t_window := (others => (others => (others => '0')));

    -- =========================================================================
    -- ŘÍDÍCÍ LOGIKA A SOUŘADNICE
    -- =========================================================================
    type state_t is (IDLE, STREAMING, FLUSHING);
    signal state : state_t := IDLE;

    -- Souřadnice VSTUPNÍHO (nejnovějšího) pixelu
    signal in_x : integer range 0 to IMAGE_WIDTH := 0;
    signal in_y : integer range 0 to IMAGE_HEIGHT := 0;
    
    -- Virtuální souřadnice STŘEDU okna (může být v záporu kvůli okrajům!)
    signal cx   : integer range -R - 1 to IMAGE_WIDTH := -R - 1;
    signal cy   : integer range -R to IMAGE_HEIGHT := -R;
    
    -- Ukazatel do Line Bufferů (Kruhový buffer)
    signal wr_ptr : integer range 0 to IMAGE_WIDTH-1 := 0;

begin

    process(clk)
        variable v_shift_en : std_logic;
        variable v_cx       : integer range -R - 1 to IMAGE_WIDTH;
        variable v_cy       : integer range -R to IMAGE_HEIGHT;
        variable v_new_in   : std_logic_vector(C_PIX_WIDTH - 1 downto 0);
        variable v_pixel    : std_logic_vector(C_PIX_WIDTH - 1 downto 0);
        variable v_cell_x   : integer range 0 to IMAGE_WIDTH - 1;
        variable v_cell_y   : integer range 0 to IMAGE_HEIGHT - 1;
        variable v_idx      : integer range 0 to (KERNEL_SIZE * KERNEL_SIZE) - 1;
    begin
        if rising_edge(clk) then
            if rst = '1' then
                state <= IDLE;
                in_x <= 0; in_y <= 0;
                cx <= -R - 1; cy <= -R;
                wr_ptr <= 0;
                window_valid_out <= '0';
                for i in 0 to KERNEL_SIZE*KERNEL_SIZE - 1 loop
                    window_out(i) <= (others => '0');
                end loop;
            elsif pipeline_en = '1' then
                v_shift_en := '0';
                
                -- Přenášíme výchozí hodnoty
                v_cx := cx;
                v_cy := cy;
                
                -- =====================================================================
                -- AUTO-FLUSHER STAVOVÝ AUTOMAT
                -- =====================================================================
                case state is
                    when IDLE =>
                        if pixel_valid_in = '1' then
                            state <= STREAMING;
                            v_shift_en := '1';
                        end if;
                        
                    when STREAMING =>
                        if pixel_valid_in = '1' then
                            v_shift_en := '1';
                            
                            -- Pokud jsme přijali úplně poslední pixel obrazu:
                            if in_x = IMAGE_WIDTH - 1 and in_y = IMAGE_HEIGHT - 1 then
                                state <= FLUSHING;
                                in_x <= 0; in_y <= 0;
                            else
                                if in_x = IMAGE_WIDTH - 1 then
                                    in_x <= 0; in_y <= in_y + 1;
                                else
                                    in_x <= in_x + 1;
                                end if;
                            end if;
                        end if;
                        
                    when FLUSHING =>
                        -- Přestaneme čekat na validní pixely a "dofoukneme" pipeline
                        v_shift_en := '1';
                        -- Ukončení po "odsunutí" posledního platného rohu z obrazu
                        if cx = IMAGE_WIDTH - 1 and cy = IMAGE_HEIGHT - 1 then
                            state <= IDLE;
                            cx <= -R - 1; cy <= -R;
                            v_shift_en := '0';
                        end if;
                end case;
                
                -- =====================================================================
                -- HLAVNÍ DATOVÁ PIPELINE
                -- =====================================================================
                if v_shift_en = '1' then
                    
                    -- 1. Posun virtuálních souřadnic středu
                    if cx = IMAGE_WIDTH - 1 then
                        v_cx := 0; v_cy := cy + 1;
                    else
                        v_cx := cx + 1; v_cy := cy;
                    end if;
                    
                    cx <= v_cx; cy <= v_cy;
                    
                    -- 2. Volba vstupních dat (Reálný vs Padded pixel pro Auto-Flushing)
                    if state = FLUSHING then
                        v_new_in := std_logic_vector(to_unsigned(PADDING_VALUE, C_PIX_WIDTH));
                    else
                        v_new_in := pixel_in;
                    end if;

                    -- =================================================================
                    -- DYNAMICKÉ MASKOVÁNÍ A MAPOVÁNÍ DO 1D VÝSTUPU (Zero-Overhead)
                    -- =================================================================
                    for r in 0 to KERNEL_SIZE - 1 loop
                        for c in 0 to KERNEL_SIZE - 1 loop
                            
                            -- Simulujeme posun: "Sáhneme" si pro pixel, který BUDE v buňce zapsán
                            if c = KERNEL_SIZE - 1 then
                                if r = 0 then
                                    v_pixel := v_new_in;
                                else
                                    v_pixel := line_buffers(r-1)(wr_ptr);
                                end if;
                            else
                                v_pixel := window_reg(r, c+1);
                            end if;
                            
                            -- Vypočítáme skutečnou X/Y souřadnici této konkrétní buňky vůči rámu
                            -- (r=0 je NEJNOVĚJŠÍ řádek (spodek okna), c=0 je NEJSTARŠÍ pixel (levý kraj))
                            v_cell_x := v_cx + (c - R);
                            v_cell_y := v_cy + (R - r);
                            
                            -- Zploštění (Flatten) 2D do 1D pro MAC Pipeline (Klasický Row-Major)
                            v_idx := (KERNEL_SIZE - 1 - r) * KERNEL_SIZE + c;
                            
                            -- PADDING MUX: V případě, že je souřadnice venku z obrazu,
                            -- okamžitě nahradíme hodnotu barvou z PADDING_VALUE
                            if v_cell_x >= 0 and v_cell_x < IMAGE_WIDTH and 
                               v_cell_y >= 0 and v_cell_y < IMAGE_HEIGHT then
                                -- Mapování Unsigned do Ufixed typu
                                window_out(v_idx) <= to_ufixed(unsigned(v_pixel), G_PIX_HIGH, G_PIX_LOW);
                            else
                                window_out(v_idx) <= to_ufixed(PADDING_VALUE, G_PIX_HIGH, G_PIX_LOW);
                            end if;
                            
                        end loop;
                    end loop;
                    
                    -- =================================================================
                    -- FYZICKÝ POSUN PAMĚTÍ
                    -- =================================================================
                    -- A) Posun 2D Matice okna
                    for r in 0 to KERNEL_SIZE - 1 loop
                        for c in 0 to KERNEL_SIZE - 2 loop
                            window_reg(r, c) <= window_reg(r, c+1);
                        end loop;
                        
                        if r = 0 then
                            window_reg(r, KERNEL_SIZE - 1) <= v_new_in;
                        else
                            window_reg(r, KERNEL_SIZE - 1) <= line_buffers(r-1)(wr_ptr);
                        end if;
                    end loop;
                    
                    -- B) Zápis do Line Bufferů a posun
                    line_buffers(0)(wr_ptr) <= v_new_in;
                    for r in 1 to KERNEL_SIZE - 2 loop
                        line_buffers(r)(wr_ptr) <= line_buffers(r-1)(wr_ptr);
                    end loop;
                    
                    if wr_ptr = IMAGE_WIDTH - 1 then
                        wr_ptr <= 0;
                    else
                        wr_ptr <= wr_ptr + 1;
                    end if;
                    
                    -- =================================================================
                    -- VÝSTUPNÍ VALIDITA (Podle zvoleného okrajového módu)
                    -- =================================================================
                    if PADDING_MODE = SAME then
                        if v_cy >= 0 and v_cy < IMAGE_HEIGHT then
                            window_valid_out <= '1';
                        else
                            window_valid_out <= '0';
                        end if;
                    else -- MODE_VALID
                        if v_cx >= R and v_cx < IMAGE_WIDTH - R and
                           v_cy >= R and v_cy < IMAGE_HEIGHT - R then
                            window_valid_out <= '1';
                        else
                            window_valid_out <= '0';
                        end if;
                    end if;
                    
                else
                    -- Pipeline stojí = nevalidní výstup
                    window_valid_out <= '0';
                end if;
                
            end if;
        end if;
    end process;

end architecture RTL;