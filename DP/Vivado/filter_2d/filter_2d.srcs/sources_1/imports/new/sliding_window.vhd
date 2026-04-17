----------------------------------------------------------------------------------
-- Modul: 2D Sliding Window s podporou AXI-Stream TLAST/TUSER a Frame Done
-- Architektura: Nativní "VALID" mód (neřeší umělý padding, propouští čistá data)
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
        -- G_PADDING parametry jsme zcela odstranili, HW jede nativně!
    );
    port(
        aclk             : in  std_logic;
        aresetn          : in  std_logic;
        pipeline_en      : in  std_logic;
        pixel_in         : in  std_logic_vector(G_PIXEL_HIGH - G_PIXEL_LOW downto 0);
        pixel_in_valid   : in  std_logic;
        pixel_in_tlast   : in  std_logic;
        pixel_in_tuser   : in  std_logic_vector(0 downto 0);
        window_out       : out std_logic_vector((KERNEL_SIZE * KERNEL_SIZE * (G_PIXEL_HIGH - G_PIXEL_LOW + 1)) - 1 downto 0);
        window_out_valid : out std_logic;
        window_out_tlast : out std_logic;
        window_out_tuser : out std_logic_vector(0 downto 0)
    );
end entity sliding_window;

architecture RTL of sliding_window is

    -- Využíváme elegantní t_ufixed_matrix (tvůj super nápad!)
    signal window       : t_ufixed_matrix(0 to KERNEL_SIZE - 1, 0 to KERNEL_SIZE - 1)(G_PIXEL_HIGH downto G_PIXEL_LOW) := (others => (others => (others => '0')));
    signal line_buffers : t_ufixed_matrix(0 to KERNEL_SIZE - 2, 0 to IMAGE_WIDTH - 1)(G_PIXEL_HIGH downto G_PIXEL_LOW) := (others => (others => (others => '0')));

    signal frame_done : std_logic := '1';

    -- Zpoždění přesně do středu okna (aby TLAST/TUSER lícovaly s MAC výpočtem)
    constant C_SW_LATENCY : natural := (KERNEL_SIZE / 2) * IMAGE_WIDTH + (KERNEL_SIZE / 2);
    signal   sw_clken     : std_logic;

begin

    sw_clken <= pipeline_en and pixel_in_valid;

    Inst_delay_line_tlast : entity work.delay_line
        generic map(G_DELAY => C_SW_LATENCY, G_WIDTH => 1)
        port map(aclk => aclk, aresetn => aresetn, clken => sw_clken, d_in(0) => pixel_in_tlast, d_out(0) => window_out_tlast);

    Inst_delay_line_tuser : entity work.delay_line
        generic map(G_DELAY => C_SW_LATENCY, G_WIDTH => 1)
        port map(aclk => aclk, aresetn => aresetn, clken => sw_clken, d_in => pixel_in_tuser, d_out => window_out_tuser);

    process(aclk)
        variable cur_pix : ufixed(G_PIXEL_HIGH downto G_PIXEL_LOW);
        variable v_r_cnt : natural range 0 to IMAGE_HEIGHT - 1 := 0;
        variable v_c_cnt : natural range 0 to IMAGE_WIDTH - 1  := 0;
    begin
        if rising_edge(aclk) then
            if aresetn = '0' then
                v_r_cnt          := 0;
                v_c_cnt          := 0;
                frame_done       <= '1';
                window_out_valid <= '0';
                window           <= (others => (others => (others => '0')));
            -- Line buffers neresetujeme pro úsporu routingu ve FPGA (je to RAM)

            elsif (pipeline_en = '1') and (pixel_in_valid = '1') then

                cur_pix := to_ufixed(unsigned(pixel_in), G_PIXEL_HIGH, G_PIXEL_LOW);

                -- Synchronizace přes TUSER (Záchrana při výpadku AXI komunikace)
                if pixel_in_tuser = "1" then
                    v_r_cnt    := 0;
                    v_c_cnt    := 0;
                    frame_done <= '0';
                end if;

                -- 1. Posun a aktualizace 2D okna
                window(KERNEL_SIZE - 1, KERNEL_SIZE - 1) <= cur_pix;
                for r in 0 to KERNEL_SIZE - 2 loop
                    window(r, KERNEL_SIZE - 1) <= line_buffers(r, v_c_cnt);
                end loop;

                for r in 0 to KERNEL_SIZE - 1 loop
                    for c in 1 to KERNEL_SIZE - 1 loop
                        window(r, c - 1) <= window(r, c);
                    end loop;
                end loop;

                -- 2. Aktualizace řádkových bufferů (Line Buffers)
                line_buffers(0, v_c_cnt) <= cur_pix;
                for r in 1 to KERNEL_SIZE - 2 loop
                    line_buffers(r, v_c_cnt) <= line_buffers(r - 1, v_c_cnt);
                end loop;

                -- 3. Vyhodnocení validity okna (Až po naplnění prvních řádků/sloupců)
                if (v_r_cnt >= KERNEL_SIZE - 1) and (v_c_cnt >= KERNEL_SIZE - 1) and (frame_done = '0') then
                    window_out_valid <= '1';
                else
                    window_out_valid <= '0';
                end if;

                -- 4. Výpočet souřadnic pro PŘÍŠTÍ takt
                if frame_done = '0' then
                    if v_c_cnt = IMAGE_WIDTH - 1 then
                        v_c_cnt := 0;
                        if v_r_cnt < IMAGE_HEIGHT - 1 then
                            v_r_cnt := v_r_cnt + 1;
                        else
                            frame_done <= '1'; -- Obraz dokončen
                        end if;
                    else
                        v_c_cnt := v_c_cnt + 1;
                    end if;
                end if;

            end if;
        end if;
    end process;

    -- Použití čisté konverzní funkce z našeho balíčku
    window_out <= pack_ufixed_matrix(window);

end architecture RTL;
