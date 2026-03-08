library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.conv_pkg.all;

entity mac_pipeline is
    generic(
        KERNEL_SIZE  : natural;
        PIXEL_WIDTH  : natural;
        KERNEL_WIDTH : natural
    );
    port(
        clk             : in  std_logic;
        rst             : in  std_logic;
        pipeline_en     : in  std_logic;
        
        -- VHDL-2008: Čisté 2D matice na vstupech
        window_in       : in  signed_matrix_t(0 to KERNEL_SIZE - 1, 0 to KERNEL_SIZE - 1)(PIXEL_WIDTH downto 0);
        kernel_in       : in  signed_matrix_t(0 to KERNEL_SIZE - 1, 0 to KERNEL_SIZE - 1)(KERNEL_WIDTH - 1 downto 0);
        window_valid_in : in  std_logic;
        
        pixel_out       : out std_logic_vector(PIXEL_WIDTH - 1 downto 0);
        mac_valid_out   : out std_logic
    );
end entity mac_pipeline;

architecture Behavioral of mac_pipeline is

    constant MULT_WIDTH : natural := PIXEL_WIDTH + KERNEL_WIDTH;
    constant ACC_WIDTH  : natural := get_acc_width(PIXEL_WIDTH, KERNEL_WIDTH, KERNEL_SIZE);

    -- VHDL-2008: Pipeline registry zapsané přes 1D pole signálů (typ definován v package)
    signal mult_regs : signed_array_1d_t(0 to KERNEL_SIZE * KERNEL_SIZE - 1)(MULT_WIDTH - 1 downto 0) := (others => (others => '0'));
    signal valid_stage_1 : std_logic := '0';
    
    signal out_pixel_reg : std_logic_vector(PIXEL_WIDTH - 1 downto 0) := (others => '0');
    signal out_valid_reg : std_logic := '0';

begin

    -- Matematická Pipeline
    process(clk)
        variable sum_var : signed(ACC_WIDTH - 1 downto 0);
    begin
        if rising_edge(clk) then
            if rst = '1' then
                valid_stage_1 <= '0';
                out_valid_reg <= '0';
                out_pixel_reg <= (others => '0');
            elsif pipeline_en = '1' then
                
                -- =============================================================
                -- STAGE 1: Násobení a vertikální flip jádra
                -- =============================================================
                for i in 0 to (KERNEL_SIZE * KERNEL_SIZE) - 1 loop
                    mult_regs(i) <= window_in(KERNEL_SIZE - 1 - (i / KERNEL_SIZE), i mod KERNEL_SIZE) 
                                  * kernel_in(i / KERNEL_SIZE, i mod KERNEL_SIZE);
                end loop;
                
                valid_stage_1 <= window_valid_in;

                -- =============================================================
                -- STAGE 2: Akumulace a Saturace
                -- =============================================================
                sum_var := (others => '0');
                for i in 0 to KERNEL_SIZE * KERNEL_SIZE - 1 loop
                    sum_var := sum_var + resize(mult_regs(i), ACC_WIDTH);
                end loop;

                if sum_var < 0 then
                    out_pixel_reg <= (others => '0');
                elsif sum_var > (2**PIXEL_WIDTH - 1) then
                    out_pixel_reg <= (others => '1');
                else
                    out_pixel_reg <= std_logic_vector(sum_var(PIXEL_WIDTH - 1 downto 0));
                end if;

                out_valid_reg <= valid_stage_1;
            end if;
        end if;
    end process;

    pixel_out <= out_pixel_reg;
    mac_valid_out <= out_valid_reg;

end Behavioral;