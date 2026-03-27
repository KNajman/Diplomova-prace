library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dp_pkg.all;

entity pipelined_adder_array is
    generic(
        NUM_INPUTS : natural;
        DATA_WIDTH : natural;
        OUT_WIDTH  : natural
    );
    port(
        clk     : in  std_logic;
        rst     : in  std_logic;
        en      : in  std_logic;
        data_in : in  signed_vector_t(0 to NUM_INPUTS - 1)(DATA_WIDTH - 1 downto 0);
        sum_out : out signed(OUT_WIDTH - 1 downto 0)
    );
end entity pipelined_adder_array;

architecture RTL of pipelined_adder_array is
    constant HALF : natural := NUM_INPUTS / 2;

    signal sum_left, sum_right : signed(OUT_WIDTH - 1 downto 0);
begin

    gen_base : if NUM_INPUTS = 2 generate
        process(clk) is
        begin
            if rising_edge(clk) then
                if rst = '1' then
                    sum_out <= (others => '0');
                elsif en = '1' then
                    sum_out <= resize(data_in(0), OUT_WIDTH) + resize(data_in(1), OUT_WIDTH);
                end if;
            end if;
        end process;
    end generate;

    -- =========================================================================
    -- Rekurzivní případ: více než 2 vstupy (Větve stromu)
    -- =========================================================================
    gen_tree : if NUM_INPUTS > 2 generate

        -- Instance pro levou polovinu prvků
        inst_left : entity work.pipelined_adder_array
            generic map(NUM_INPUTS => HALF, DATA_WIDTH => DATA_WIDTH, OUT_WIDTH => OUT_WIDTH)
            port map(
                clk     => clk,
                rst     => rst,
                en      => en,
                data_in => data_in(0 to HALF - 1),
                sum_out => sum_left
            );

        -- Instance pro pravou polovinu prvků
        inst_right : entity work.pipelined_adder_array
            generic map(NUM_INPUTS => HALF, DATA_WIDTH => DATA_WIDTH, OUT_WIDTH => OUT_WIDTH)
            port map(
                clk     => clk,
                rst     => rst,
                en      => en,
                data_in => data_in(HALF to NUM_INPUTS - 1),
                sum_out => sum_right
            );

        -- Registrace součtu dvou větví
        process(clk)
        begin
            if rising_edge(clk) then
                if rst = '1' then
                    sum_out <= (others => '0');
                elsif en = '1' then
                    -- Oba sčítance už jsou z předchozí úrovně rozšířené na OUT_WIDTH
                    sum_out <= sum_left + sum_right;
                end if;
            end if;
        end process;
    end generate;

    -- =========================================================================
    -- Ochranný případ pro případ 1 vstupu
    -- =========================================================================
    gen_one : if NUM_INPUTS = 1 generate
        process(clk)
        begin
            if rising_edge(clk) then
                if rst = '1' then
                    sum_out <= (others => '0');
                elsif en = '1' then
                    sum_out <= resize(data_in(0), OUT_WIDTH);
                end if;
            end if;
        end process;
    end generate;

end architecture RTL;

