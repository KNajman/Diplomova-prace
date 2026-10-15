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
        file f_in     : text;
        variable ln   : line;
        variable v    : std_logic_vector(G_DATA_W - 1 downto 0);
        variable s1   : positive := G_SEED;
        variable s2   : positive := G_SEED + 7919;
        variable rnd  : real;
        variable user : std_logic;
        variable last : std_logic;

        -- Jeden přenos s náhodnou mezerou před ním
        procedure send(data : std_logic_vector; p_user, p_last : std_logic) is
        begin
            loop
                uniform(s1, s2, rnd);
                exit when rnd * 100.0 < real(G_VALID_PCT);
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

        for f in 1 to G_FRAMES loop
            file_open(f_in, G_FILE, read_mode);
            for y in 0 to G_HEIGHT - 1 loop
                for x in 0 to G_WIDTH - 1 loop
                    assert not endfile(f_in) report "axis_file_source: soubor je kratsi nez snimek" severity failure;
                    readline(f_in, ln);
                    hread(ln, v);
                    user := '1' when (x = 0 and y = 0) else '0';
                    last := '1' when (x = G_WIDTH - 1) else '0';
                    send(v, user, last);
                end loop;
            end loop;
            file_close(f_in);
        end loop;

        m_tvalid <= '0';
        done     <= '1';
        wait;
    end process;
end architecture;
