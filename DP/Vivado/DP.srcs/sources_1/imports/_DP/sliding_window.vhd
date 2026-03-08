library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.conv_pkg.all;

entity sliding_window is
    generic(
        IMAGE_WIDTH  : natural;
        IMAGE_HEIGHT : natural;
        KERNEL_SIZE  : natural;
        PIXEL_WIDTH  : natural;
        MODE         : string;
        BORDER_VALUE : natural
    );
    port(
        clk             : in  std_logic;
        rst             : in  std_logic;
        pipeline_en     : in  std_logic;
        
        pixel_in        : in  std_logic_vector(PIXEL_WIDTH - 1 downto 0);
        is_real_pixel   : in  std_logic;
        
        -- VHDL-2008: Port je přímo 2D matice se specifikovanými rozměry!
        window_out      : out signed_matrix_t(0 to KERNEL_SIZE - 1, 0 to KERNEL_SIZE - 1)(PIXEL_WIDTH downto 0);
        window_valid    : out std_logic
    );
end entity sliding_window;

architecture Behavioral of sliding_window is

    constant MAX_C : natural := get_max_dim(IMAGE_WIDTH, KERNEL_SIZE, MODE);
    constant MAX_R : natural := get_max_dim(IMAGE_HEIGHT, KERNEL_SIZE, MODE);

    -- VHDL-2008: Lokální signály vytvořené rovnou jako 2D matice
    signal line_buffers : signed_matrix_t(0 to KERNEL_SIZE - 2, 0 to MAX_C - 1)(PIXEL_WIDTH downto 0) := (others => (others => (others => '0')));
    signal window       : signed_matrix_t(0 to KERNEL_SIZE - 1, 0 to KERNEL_SIZE - 1)(PIXEL_WIDTH downto 0) := (others => (others => (others => '0')));

    -- Čítače
    signal r_cnt : natural range 0 to MAX_R := 0;
    signal c_cnt : natural range 0 to MAX_C := 0;

begin

    -- Přímé přiřazení interního okna na výstupní port
    window_out <= window;

    process(clk)
        variable cur_pix : signed(PIXEL_WIDTH downto 0);
    begin
        if rising_edge(clk) then
            if rst = '1' then
                r_cnt <= 0; 
                c_cnt <= 0;
                window_valid <= '0';
                window <= (others => (others => (others => '0')));
                
            elsif pipeline_en = '1' then
                
                -- Vstupní multiplexor (Reálný pixel vs Padding)
                if is_real_pixel = '1' then 
                    cur_pix := signed('0' & pixel_in);
                else 
                    cur_pix := to_signed(integer(BORDER_VALUE), PIXEL_WIDTH + 1);
                end if;

                -- Aktualizace souřadnic
                if c_cnt = MAX_C - 1 then
                    c_cnt <= 0;
                    if r_cnt = MAX_R - 1 then r_cnt <= 0; else r_cnt <= r_cnt + 1; end if;
                else
                    c_cnt <= c_cnt + 1;
                end if;

                -- Posun okna KxK
                for r in 0 to KERNEL_SIZE - 1 loop
                    for c in 0 to KERNEL_SIZE - 2 loop
                        window(r, c) <= window(r, c + 1);
                    end loop;
                end loop;
                
                -- Napojení Linebufferů do okna (všimněte si čitějšího indexování 2D pole)
                window(0, KERNEL_SIZE - 1) <= cur_pix;
                for r in 1 to KERNEL_SIZE - 1 loop
                    window(r, KERNEL_SIZE - 1) <= line_buffers(r - 1, c_cnt);
                end loop;

                -- Posun Linebufferů
                line_buffers(0, c_cnt) <= cur_pix;
                for r in 1 to KERNEL_SIZE - 2 loop
                    line_buffers(r, c_cnt) <= line_buffers(r - 1, c_cnt);
                end loop;

                -- Validita (když je okno plné)
                if (r_cnt >= KERNEL_SIZE - 1) and (c_cnt >= KERNEL_SIZE - 1) then
                    window_valid <= '1';
                else
                    window_valid <= '0';
                end if;
            end if;
        end if;
    end process;

end Behavioral;