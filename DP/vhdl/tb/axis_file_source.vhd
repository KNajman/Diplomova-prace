--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    axis_file_source.vhd   (jen simulace)
-- Popis:     Zdroj AXI4-Stream Video ze souboru HEX (imgproc_cli: 1 pixel na řádek)
--
--  * Generuje TUSER na prvním pixelu snímku a TLAST na konci řádku (z G_WIDTH).
--  * Náhodné mezery: v každém taktu je TVALID = 1 s pravděpodobností G_VALID_PCT %.
--    Jednou nastavené TVALID se drží až do přijetí (pravidlo AXI4-Stream).
--  * Soubor se pro každý snímek čte znovu od začátku (G_FRAMES stejných snímků).
--  * Porucha pro test resynchronizace: G_GARBAGE pixelů bez TUSER před prvním snímkem.
--  * Porucha TLAST: v řádku G_BAD_EOL_ROW (jen první snímek) je TLAST na x = W - 4 místo W - 1.
--  * Porucha TUSER: v řádku G_EXTRA_SOF_ROW (jen první snímek) má první pixel TUSER = 1 (nový snímek uprostřed).
--  * Zastavení streamu: po pixelu G_PAUSE_AT (počítáno přes všechny snímky) je TVALID = 0 po G_PAUSE_CYCLES taktů.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use std.textio.all;

entity axis_file_source is
    generic (
        G_FILE      : string;
        G_WIDTH     : positive;
        G_HEIGHT    : positive;
        G_FRAMES    : positive := 1;
        G_DATA_W    : positive := 24;
        G_VALID_PCT : natural  := 100;  -- 0..100
        G_GARBAGE   : natural  := 0;
        G_BAD_EOL_ROW : integer := -1;  -- porucha: v tomto řádku TLAST o 3 pixely dřív (-1 = žádná)
        G_EXTRA_SOF_ROW : integer := -1;  -- porucha: TUSER i na prvním pixelu tohoto řádku (jen 1. snímek, -1 = žádná)
        G_PAUSE_AT     : integer  := -1;  -- po tolikátém pixelu snímků (od 0) zastavit stream (-1 = nikdy)
        G_PAUSE_CYCLES : natural  := 0;   -- délka zastavení v taktech (TVALID = 0)
        G_SEED      : positive := 1
    );
    port (
        aclk     : in  std_logic;
        aresetn  : in  std_logic;
        m_tdata  : out std_logic_vector(G_DATA_W - 1 downto 0);
        m_tuser  : out std_logic;
        m_tlast  : out std_logic;
        m_tvalid : out std_logic;
        m_tready : in  std_logic;
        done     : out std_logic
    );
end entity;

architecture sim of axis_file_source is
begin
    process
        file stimulus_file     : text;
        variable text_line    : line;
        variable pixel_data   : std_logic_vector(G_DATA_W - 1 downto 0);
        variable seed1        : positive := G_SEED;
        variable seed2        : positive := G_SEED + 7919;
        variable random_value : real;
        variable is_sof       : std_logic;
        variable is_eol       : std_logic;
        variable pixel_count  : natural := 0;

        -- Jeden přenos s náhodnou mezerou před ním
        procedure send(data : std_logic_vector; p_user, p_last : std_logic) is
        begin
            loop
                uniform(seed1, seed2, random_value);
                exit when random_value * 100.0 < real(G_VALID_PCT);
                m_tvalid <= '0';
                wait until rising_edge(aclk);
            end loop;
            m_tdata  <= data;
            m_tuser  <= p_user;
            m_tlast  <= p_last;
            m_tvalid <= '1';
            wait until rising_edge(aclk) and m_tready = '1';
        end procedure;
    begin
        m_tvalid <= '0';
        m_tuser  <= '0';
        m_tlast  <= '0';
        m_tdata  <= (others => '0');
        done     <= '0';
        wait until rising_edge(aclk) and aresetn = '1';

        for i in 1 to G_GARBAGE loop
            send(std_logic_vector(to_unsigned(16#A5#, G_DATA_W)), '0', '0');
        end loop;

        for frame in 1 to G_FRAMES loop
            file_open(stimulus_file, G_FILE, read_mode);
            for y in 0 to G_HEIGHT - 1 loop
                for x in 0 to G_WIDTH - 1 loop
                    assert not endfile(stimulus_file) report "axis_file_source: soubor je kratsi nez snimek" severity failure;
                    readline(stimulus_file, text_line);
                    hread(text_line, pixel_data);
                    is_sof := '1' when (x = 0 and (y = 0 or (frame = 1 and y = G_EXTRA_SOF_ROW))) else '0';
                    if (frame = 1) and (y = G_BAD_EOL_ROW) and (G_WIDTH >= 4) then
                        is_eol := '1' when (x = G_WIDTH - 4) else '0';
                    else
                        is_eol := '1' when (x = G_WIDTH - 1) else '0';
                    end if;
                    send(pixel_data, is_sof, is_eol);
                    if pixel_count = G_PAUSE_AT then
                        -- zastavení streamu (např. výpadek kamery), pak pokračování stejným snímkem
                        m_tvalid <= '0';
                        for k in 1 to G_PAUSE_CYCLES loop
                            wait until rising_edge(aclk);
                        end loop;
                    end if;
                    pixel_count := pixel_count + 1;
                end loop;
            end loop;
            file_close(stimulus_file);
        end loop;

        m_tvalid <= '0';
        done     <= '1';
        wait;
    end process;
end architecture;
