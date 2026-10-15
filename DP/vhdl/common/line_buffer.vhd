--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    line_buffer.vhd
-- Popis:     Řádkový buffer = simple dual-port RAM s registrovaným čtením (šablona UG901 -> BRAM)
--
-- Poznámky k návrhu:
--  * Jeden zápisový a jeden čtecí port, společné hodiny. Čtení má latenci 1 takt a vlastní
--    povolení read_enable (při zastavení pipeline výstup drží hodnotu).
--  * Pro 3840 x 8 b = 30 720 b syntéza použije 2x BRAM18 (2048 x 9 b). Atribut ram_style
--    "block" zabrání implementaci v LUT (distribuovaná RAM by u 4K stála ~480 LUT na řádek).
--  * Okénkové jádro nikdy nečte a nezapisuje stejnou adresu ve stejném taktu, chování
--    read-during-write proto nehraje roli.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity line_buffer is
    generic(
        G_DEPTH  : positive := 3840;
        G_DATA_W : positive := 8;
        G_ADDR_W : positive := 12
    );
    port(
        aclk         : in  std_logic;
        read_enable  : in  std_logic;
        read_addr    : in  unsigned(G_ADDR_W - 1 downto 0);
        read_data    : out std_logic_vector(G_DATA_W - 1 downto 0);
        write_enable : in  std_logic;
        write_addr   : in  unsigned(G_ADDR_W - 1 downto 0);
        write_data   : in  std_logic_vector(G_DATA_W - 1 downto 0)
    );
end entity;

architecture rtl of line_buffer is
    type   t_memory is array (0 to G_DEPTH - 1) of std_logic_vector(G_DATA_W - 1 downto 0);
    signal memory   : t_memory                                := (others => (others => '0'));
    signal data_reg : std_logic_vector(G_DATA_W - 1 downto 0) := (others => '0');

    attribute ram_style           : string;
    attribute ram_style of memory : signal is "block";
begin
    read_data <= data_reg;

    process(aclk)
    begin
        if rising_edge(aclk) then
            if write_enable = '1' then
                memory(to_integer(write_addr)) <= write_data;
            end if;
            if read_enable = '1' then
                data_reg <= memory(to_integer(read_addr));
            end if;
        end if;
    end process;
end architecture;
