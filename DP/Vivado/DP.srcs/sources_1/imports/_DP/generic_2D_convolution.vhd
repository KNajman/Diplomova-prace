library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.conv_pkg.all;

entity generic_2D_convolution is
    generic(
        DATA_WIDTH   : natural range 1 to 4096 := 640; -- Bitová šířka jedné barvy
        IMAGE_HEIGHT : natural range 1 to 4096 := 480;
        KERNEL_SIZE  : natural := 3;
        PIXEL_WIDTH  : natural := 8;
        KERNEL_WIDTH : natural := 8;
        MODE         : string  := "SAME"; 
        BORDER_VALUE : natural := 0
    );
    port(
        clk             : in  std_logic;
        rst             : in  std_logic;
        
        -- AXI-Stream Input
        pixel_in        : in  std_logic_vector(PIXEL_WIDTH - 1 downto 0);
        pixel_in_valid  : in  std_logic;
        pixel_in_ready  : out std_logic;
        
        -- Kernel Input (AXI rozhraní musí být vždy 1D vektor)
        kernel_in       : in  std_logic_vector((KERNEL_SIZE * KERNEL_SIZE * KERNEL_WIDTH) - 1 downto 0);
        
        -- AXI-Stream Output
        pixel_out       : out std_logic_vector(PIXEL_WIDTH - 1 downto 0);
        pixel_out_valid : out std_logic;
        pixel_out_ready : in  std_logic
    );
end entity generic_2D_convolution;

architecture Behavioral of generic_2D_convolution is

    -- Konstanty z balíčku
    constant MAX_C : natural := get_max_dim(IMAGE_WIDTH, KERNEL_SIZE, MODE);
    constant MAX_R : natural := get_max_dim(IMAGE_HEIGHT, KERNEL_SIZE, MODE);
    constant SHIFT : natural := KERNEL_SIZE / 2;

    -- VHDL-2008 Signály pro vnitřní datovody
    signal window_2d        : signed_matrix_t(0 to KERNEL_SIZE - 1, 0 to KERNEL_SIZE - 1)(PIXEL_WIDTH downto 0);
    signal kernel_2d        : signed_matrix_t(0 to KERNEL_SIZE - 1, 0 to KERNEL_SIZE - 1)(KERNEL_WIDTH - 1 downto 0);

    -- Signály pro řízení
    signal pipeline_en      : std_logic;
    signal is_real_pixel    : std_logic;
    signal window_valid     : std_logic;
    
    signal mac_out_valid    : std_logic;
    signal mac_out_pixel    : std_logic_vector(PIXEL_WIDTH - 1 downto 0);

    signal r_cnt : natural range 0 to MAX_R := 0;
    signal c_cnt : natural range 0 to MAX_C := 0;

begin

    -- Dekódování 1D vstupu pro jádro do 2D matice (provede se pouze v TOPu)
    process(kernel_in)
        variable idx : natural;
    begin
        for r in 0 to KERNEL_SIZE - 1 loop
            for c in 0 to KERNEL_SIZE - 1 loop
                idx := r * KERNEL_SIZE + c;
                kernel_2d(r, c) <= signed(kernel_in((idx + 1) * KERNEL_WIDTH - 1 downto idx * KERNEL_WIDTH));
            end loop;
        end loop;
    end process;

    -- Logika detekce reálných pixelů vs Padding
    process(r_cnt, c_cnt)
    begin
        if MODE = "SAME" then
            if (r_cnt >= SHIFT) and (r_cnt < IMAGE_HEIGHT + SHIFT) and 
               (c_cnt >= SHIFT) and (c_cnt < IMAGE_WIDTH + SHIFT) then
                is_real_pixel <= '1';
            else
                is_real_pixel <= '0';
            end if;
        else
            is_real_pixel <= '1';
        end if;
    end process;

    -- Počítání souřadnic
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                r_cnt <= 0;
                c_cnt <= 0;
            elsif pipeline_en = '1' then
                if c_cnt = MAX_C - 1 then
                    c_cnt <= 0;
                    if r_cnt = MAX_R - 1 then r_cnt <= 0; else r_cnt <= r_cnt + 1; end if;
                else
                    c_cnt <= c_cnt + 1;
                end if;
            end if;
        end if;
    end process;

    -- AXI-Stream Handshake
    pipeline_en <= '1' when (pixel_out_ready = '1' or mac_out_valid = '0') and 
                            (is_real_pixel = '0' or pixel_in_valid = '1') else '0';
                            
    pixel_in_ready <= '1' when pipeline_en = '1' and is_real_pixel = '1' else '0';

    -- INSTANCE 1: Paměťový blok a posuvné okno
    Inst_Sliding_Window: entity work.sliding_window
        generic map(
            IMAGE_WIDTH  => IMAGE_WIDTH,
            IMAGE_HEIGHT => IMAGE_HEIGHT,
            KERNEL_SIZE  => KERNEL_SIZE,
            PIXEL_WIDTH  => PIXEL_WIDTH,
            MODE         => MODE,
            BORDER_VALUE => BORDER_VALUE
        )
        port map(
            clk             => clk,
            rst             => rst,
            pipeline_en     => pipeline_en,
            pixel_in        => pixel_in,
            is_real_pixel   => is_real_pixel,
            window_out      => window_2d,   -- Čisté propojení 2D maticí!
            window_valid    => window_valid
        );

    -- INSTANCE 2: Matematický blok (MAC)
    Inst_MAC_Pipeline: entity work.mac_pipeline
        generic map(
            KERNEL_SIZE  => KERNEL_SIZE,
            PIXEL_WIDTH  => PIXEL_WIDTH,
            KERNEL_WIDTH => KERNEL_WIDTH
        )
        port map(
            clk             => clk,
            rst             => rst,
            pipeline_en     => pipeline_en,
            window_in       => window_2d,   -- Čisté propojení 2D maticí!
            kernel_in       => kernel_2d,
            window_valid_in => window_valid,
            pixel_out       => mac_out_pixel,
            mac_valid_out   => mac_out_valid
        );

    -- Výstup z TOP modulu
    pixel_out <= mac_out_pixel;
    
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                pixel_out_valid <= '0';
            else
                if pipeline_en = '1' then
                    pixel_out_valid <= mac_out_valid;
                elsif pixel_out_ready = '1' then
                    pixel_out_valid <= '0';
                end if;
            end if;
        end if;
    end process;

end Behavioral;