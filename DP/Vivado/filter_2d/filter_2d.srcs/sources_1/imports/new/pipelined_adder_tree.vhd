-- ----------------------------------------------------------------------------------
-- -- Company: Technical University of Liberec
-- -- Engineer: Bc. Karel Najman
-- -- 
-- -- Create Year: 2026
-- -- Design Name: Pipelined Adder Tree
-- -- Module Name: 
-- -- Project Name: 
-- -- Target Devices: 
-- -- Tool Versions: 
-- -- Description: Generický sčítací strom s pipeline pro pevné desetinné číslo (fixed-point).
-- -- Architecture: RTL
-- -- Math: 
-- -- 
-- -- Dependencies: 
-- -- 
-- -- Revision:
-- -- Revision 0.01 - File Created
-- -- Additional Comments:
-- -- 

-- library ieee;
-- use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;
-- use ieee.fixed_pkg.all;

-- use work.video_processing_pkg.all;

-- entity pipelined_adder_tree is
--     generic(
--         NUM_INPUTS : positive;
--         -- Pro fixed_pkg nepotřebujeme šířku (WIDTH), ale polohu desetinné čárky
--         IN_HIGH    : integer;
--         IN_LOW     : integer;
--         OUT_HIGH   : integer;
--         OUT_LOW    : integer
--     );
--     port(
--         aclk     : in  std_logic;
--         aresetn     : in  std_logic;
--         en      : in  std_logic;
--         -- Čisté propojení VHDL-2008 neomezeného 1D pole pevných řádů
--         data_in : in  t_sfixed_array(0 to NUM_INPUTS - 1)(IN_HIGH downto IN_LOW);
--         sum_out : out sfixed(OUT_HIGH downto OUT_LOW)
--     );
-- end entity pipelined_adder_tree;

-- architecture RTL of pipelined_adder_tree is
--     -- Výpočet nejbližší vyšší mocniny 2 (např. z 9x9 kernelu (81) udělá 128)
--     constant PADDED_NUM : natural := 2 ** log2_ceil(NUM_INPUTS);
-- begin

--     -- VHDL-2008 umožňuje plynulé řetězení "generate" podmínek
--     gen_tree : if NUM_INPUTS < PADDED_NUM generate
--         -- =========================================================================
--         -- KROK A: Doplnění na mocninu 2 (Zero-Padding) pro vybalancování zpoždění
--         -- =========================================================================
--         signal padded_data : t_sfixed_array(0 to PADDED_NUM - 1)(IN_HIGH downto IN_LOW);
--     begin
--         process(data_in)
--         begin
--             -- Překopírování platných pixelů/mezisoučtů
--             for i in 0 to NUM_INPUTS - 1 loop
--                 padded_data(i) <= data_in(i);
--             end loop;
--             -- Zbytek větví stromu uzemníme bezpečně na nulu (zabrání 'X' stavům)
--             for i in NUM_INPUTS to PADDED_NUM - 1 loop
--                 padded_data(i) <= (others => '0');
--             end loop;
--         end process;

--         -- Rekurzivní volání stejné entity, ale s vybalancovaným počtem vstupů
--         inst_padded : entity work.pipelined_adder_tree
--             generic map(
--                 NUM_INPUTS => PADDED_NUM,
--                 IN_HIGH    => IN_HIGH, IN_LOW => IN_LOW,
--                 OUT_HIGH   => OUT_HIGH, OUT_LOW => OUT_LOW
--             )
--             port map(
--                 aclk     => aclk,
--                 aresetn     => aresetn,
--                 en      => en,
--                 data_in => padded_data,
--                 sum_out => sum_out
--             );

--     elsif NUM_INPUTS > 2 generate
--         -- =========================================================================
--         -- KROK B: Rekurzivní větvení zaručeně čisté mocniny 2
--         -- =========================================================================
--         constant HALF                : natural := NUM_INPUTS / 2;
--         signal   sum_left, sum_right : sfixed(OUT_HIGH downto OUT_LOW);
--     begin
--         left_branch : entity work.pipelined_adder_tree
--             generic map(
--                 NUM_INPUTS => HALF,
--                 IN_HIGH    => IN_HIGH, IN_LOW => IN_LOW,
--                 OUT_HIGH   => OUT_HIGH, OUT_LOW => OUT_LOW
--             )
--             port map(
--                 aclk     => aclk, aresetn => aresetn, en => en,
--                 data_in => data_in(0 to HALF - 1),
--                 sum_out => sum_left
--             );

--         right_branch : entity work.pipelined_adder_tree
--             generic map(
--                 NUM_INPUTS => HALF,
--                 IN_HIGH    => IN_HIGH, IN_LOW => IN_LOW,
--                 OUT_HIGH   => OUT_HIGH, OUT_LOW => OUT_LOW
--             )
--             port map(
--                 aclk     => aclk, aresetn => aresetn, en => en,
--                 data_in => data_in(HALF to NUM_INPUTS - 1),
--                 sum_out => sum_right
--             );

--         process(aclk)
--         begin
--             if rising_edge(aclk) then
--                 if aresetn = '0' then
--                     sum_out <= (others => '0');
--                 elsif en = '1' then
--                     -- Funkce resize sama srovná desetinné čárky a ohlídá akumulátor
--                     sum_out <= resize(sum_left + sum_right, OUT_HIGH, OUT_LOW);
--                 end if;
--             end if;
--         end process;

--     elsif NUM_INPUTS = 2 generate
--         -- =========================================================================
--         -- KROK C: Základní sčítání (Báze rekurze)
--         -- =========================================================================
--     begin
--         process(aclk)
--         begin
--             if rising_edge(aclk) then
--                 if aresetn = '0' then
--                     sum_out <= (others => '0');
--                 elsif en = '1' then
--                     sum_out <= resize(data_in(0) + data_in(1), OUT_HIGH, OUT_LOW);
--                 end if;
--             end if;
--         end process;

--     else generate
--         -- =========================================================================
--         -- KROK D: Edge-case (Sčítání o jednom prvku)
--         -- =========================================================================
--     begin
--         process(aclk)
--         begin
--             if rising_edge(aclk) then
--                 if aresetn = '0' then
--                     sum_out <= (others => '0');
--                 elsif en = '1' then
--                     sum_out <= resize(data_in(0), OUT_HIGH, OUT_LOW);
--                 end if;
--             end if;
--         end process;
--     end generate gen_tree;

-- end architecture RTL;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;

use work.video_processing_pkg.all;

entity pipelined_adder_tree is
    generic(
        NUM_INPUTS : positive;
        IN_HIGH    : integer;
        IN_LOW     : integer;
        OUT_HIGH   : integer;
        OUT_LOW    : integer
    );
    port(
        aclk     : in  std_logic;
        aresetn   : in  std_logic; -- Předpokládám tvůj nový Active-Low reset!
        en      : in  std_logic;
        data_in : in  t_sfixed_array(0 to NUM_INPUTS - 1)(IN_HIGH downto IN_LOW);
        sum_out : out sfixed(OUT_HIGH downto OUT_LOW)
    );
end entity pipelined_adder_tree;

architecture RTL of pipelined_adder_tree is
    
    -- Výpočet zpoždění a velikosti stromu
    constant STAGES     : natural := log2_ceil(NUM_INPUTS);
    constant PADDED_NUM : natural := 2 ** STAGES;

    -- =========================================================================
    -- Nativní 2D matice pro celý sčítací strom (Bypass rekurze)
    -- Řádky = pipeline fáze (0 až STAGES)
    -- Sloupce = uzly v dané fázi
    -- =========================================================================
    type t_tree_matrix is array (0 to STAGES, 0 to PADDED_NUM - 1) of sfixed(OUT_HIGH downto OUT_LOW);
    signal tree : t_tree_matrix := (others => (others => (others => '0')));

begin

    -- FÁZE 0 (Kombinační): Načtení dat a doplnění nul na mocninu 2 (Padding)
    process(data_in)
    begin
        for i in 0 to NUM_INPUTS - 1 loop
            tree(0, i) <= resize(data_in(i), OUT_HIGH, OUT_LOW);
        end loop;
        for i in NUM_INPUTS to PADDED_NUM - 1 loop
            tree(0, i) <= (others => '0');
        end loop;
    end process;

    -- FÁZE 1 až STAGES (Sekvenční): Sčítání sousedních prvků (Binární strom)
    gen_stages: for s in 1 to STAGES generate
        -- Počet uzlů v aktuální úrovni (např. 16 -> 8 -> 4 -> 2 -> 1)
        constant NODES : natural := PADDED_NUM / (2**s);
    begin
        process(aclk)
        begin
            if rising_edge(aclk) then
                if aresetn = '0' then 
                    for i in 0 to NODES - 1 loop
                        tree(s, i) <= (others => '0');
                    end loop;
                elsif en = '1' then
                    for i in 0 to NODES - 1 loop
                        -- Sečteme dva potomky z předchozí úrovně
                        tree(s, i) <= resize(tree(s-1, 2*i) + tree(s-1, 2*i+1), OUT_HIGH, OUT_LOW);
                    end loop;
                end if;
            end if;
        end process;
    end generate gen_stages;

    -- Výsledek stromu je jediný uzel ve zcela poslední fázi
    sum_out <= tree(STAGES, 0);

end architecture RTL;
