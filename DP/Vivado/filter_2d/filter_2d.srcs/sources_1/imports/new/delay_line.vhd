----------------------------------------------------------------------------------
-- Modul: Univerzální synchronizační zpožďovací linka (Shift Register)
-- Popis: Slouží pro zpoždění řídicích signálů (TLAST, TUSER, VALID) tak, 
--        aby cestovaly paralelně se zpožděním datové cesty.
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity delay_line is
    generic (
        G_DELAY : natural := 1;  -- Počet taktů zpoždění
        G_WIDTH : natural := 1   -- Šířka zpožďovaného vektoru (např. 2 pro TUSER+TLAST)
    );
    port (
        aclk    : in  std_logic;
        aresetn : in  std_logic;
        clken   : in  std_logic; -- Povolení posunu (typicky pipeline_en)
        d_in    : in  std_logic_vector(G_WIDTH - 1 downto 0);
        d_out   : out std_logic_vector(G_WIDTH - 1 downto 0)
    );
end entity delay_line;

architecture RTL of delay_line is
    -- Definice 2D pole pro posuvný registr
    type t_shift_reg is array (0 to G_DELAY - 1) of std_logic_vector(G_WIDTH - 1 downto 0);
    signal shift_reg : t_shift_reg := (others => (others => '0'));
begin

    -- Případ 1: Zpoždění je nulové (jen propojíme dráty)
    gen_zero_delay: if G_DELAY = 0 generate
        d_out <= d_in;
    end generate;

    -- Případ 2: Zpoždění je větší než nula (vytvoříme sérii D-klopných obvodů)
    gen_delay: if G_DELAY > 0 generate
        process(aclk)
        begin
            if rising_edge(aclk) then
                if aresetn = '0' then
                    shift_reg <= (others => (others => '0'));
                elsif clken = '1' then
                    -- První stupeň načte data ze vstupu
                    shift_reg(0) <= d_in;
                    -- Ostatní stupně se posunou
                    for i in 1 to G_DELAY - 1 loop
                        shift_reg(i) <= shift_reg(i - 1);
                    end loop;
                end if;
            end if;
        end process;
        
        -- Výstup je vždy poslední prvek posuvného registru
        d_out <= shift_reg(G_DELAY - 1);
    end generate;

end architecture RTL;