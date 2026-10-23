--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    axis_skid_buffer.vhd
-- Popis:     Dvoumístný skid buffer AXI4-Stream s registrovaným TREADY
--
-- Poznámky k návrhu:
--  * Plná propustnost (1 přenos za takt) a s_tready je přímo výstup registru, takže
--    kombinační cesta m_tready -> s_tready se přeruší. V řetězci ~12 jader by jinak
--    TREADY prošel všemi jádry v jednom taktu a omezil frekvenci.
--  * Princip: výstupní registr + jedno záložní místo (skid). Když výstup stojí a vstup
--    ještě v tomtéž taktu pošle data (ready bylo registrované = 1), uloží se do skid.
--    s_tready = 0 právě tehdy, když je skid obsazený.
--  * Poznámka k volbě: resetují se jen řídicí registry (out_valid, skid_valid). Datové registry
--    out_data a skid_data se neresetují - jejich platnost určují příznaky valid, takže po resetu
--    nemá hodnota dat význam a bez resetu je menší fanout resetu i lepší časování (Sigasi to
--    hlásí jako kód 238, záměr).
--  * Data jsou obecný vektor (G_DATA_W), jádra do něj balí TDATA + TUSER + TLAST.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity axis_skid_buffer is
    generic(
        G_DATA_W : positive := 26
    );
    port(
        aclk    : in  std_logic;
        aresetn : in  std_logic;        -- synchronní, aktivní v 0
        s_data  : in  std_logic_vector(G_DATA_W - 1 downto 0);
        s_valid : in  std_logic;
        s_ready : out std_logic;
        m_data  : out std_logic_vector(G_DATA_W - 1 downto 0);
        m_valid : out std_logic;
        m_ready : in  std_logic
    );
end entity;

architecture rtl of axis_skid_buffer is
    signal out_data   : std_logic_vector(G_DATA_W - 1 downto 0) := (others => '0');
    signal out_valid  : std_logic                               := '0';
    signal skid_data  : std_logic_vector(G_DATA_W - 1 downto 0) := (others => '0');
    signal skid_valid : std_logic                               := '0';
begin

    s_ready <= not skid_valid;
    m_data  <= out_data;
    m_valid <= out_valid;

    process(aclk)
    begin
        if rising_edge(aclk) then
            if aresetn = '0' then
                out_valid  <= '0';
                skid_valid <= '0';
            elsif (out_valid = '0') or (m_ready = '1') then
                -- Výstupní registr se uvolní: přednost má záloha, jinak vstup
                if skid_valid = '1' then
                    out_data   <= skid_data;
                    out_valid  <= '1';
                    skid_valid <= '0';
                else
                    out_data  <= s_data;
                    out_valid <= s_valid;
                end if;
            elsif (s_valid = '1') and (skid_valid = '0') then
                -- Výstup stojí, vstup ještě poslal (ready bylo 1) -> do zálohy
                skid_data  <= s_data;
                skid_valid <= '1';
            end if;
        end if;
    end process;

end architecture;
