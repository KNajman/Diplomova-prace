--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    axis_file_sink.vhd   (jen simulace)
-- Popis:     Příjemce AXI4-Stream Video: porovnání s očekávaným HEX souborem (golden model)
--
--  * Náhodný backpressure: TREADY = 1 s pravděpodobností G_READY_PCT % v každém taktu.
--  * Kontroluje data, TUSER (jen první pixel snímku) a TLAST (jen konec řádku).
--  * errors = počet chyb (vypíše prvních 10), done = přijaty všechny snímky.
--  * cycles = počet taktů od prvního do posledního přijatého pixelu (propustnost).
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use std.textio.all;

entity axis_file_sink is
    generic (
        G_FILE      : string;
        G_WIDTH     : positive;
        G_HEIGHT    : positive;
        G_FRAMES    : positive := 1;
        G_DATA_W    : positive := 24;
        G_READY_PCT : natural  := 100;
        G_SEED      : positive := 2;
        G_NAME      : string   := "sink"
    );
    port (
        aclk     : in  std_logic;
        aresetn  : in  std_logic;
        s_tdata  : in  std_logic_vector(G_DATA_W - 1 downto 0);
        s_tuser  : in  std_logic;
        s_tlast  : in  std_logic;
        s_tvalid : in  std_logic;
        s_tready : out std_logic;
        errors   : out natural;
        cycles   : out natural;
        done     : out std_logic
    );
end entity;

architecture sim of axis_file_sink is
    signal ready : std_logic := '0';
begin
    s_tready <= ready;

    process (aclk)
        file f_exp         : text;
        variable is_open   : boolean := false;
        variable ln        : line;
        variable exp       : std_logic_vector(G_DATA_W - 1 downto 0);
        variable x, y, f   : natural := 0;
        variable err       : natural := 0;
        variable cyc       : natural := 0;
        variable started   : boolean := false;
        variable finished  : boolean := false;
        variable s1        : positive := G_SEED;
        variable s2        : positive := G_SEED + 104729;
        variable rnd       : real;
        variable exp_user  : std_logic;
        variable exp_last  : std_logic;
    begin
        if rising_edge(aclk) then
            if aresetn = '0' then
                ready <= '0';
            else
                if started and not finished then
                    cyc := cyc + 1;
                end if;
                if (s_tvalid = '1') and (ready = '1') and not finished then
                    started := true;
                    if not is_open then
                        file_open(f_exp, G_FILE, read_mode);
                        is_open := true;
                    end if;
                    readline(f_exp, ln);
                    hread(ln, exp);
                    exp_user := '1' when (x = 0 and y = 0) else '0';
                    exp_last := '1' when (x = G_WIDTH - 1) else '0';
                    if (s_tdata /= exp) or (s_tuser /= exp_user) or (s_tlast /= exp_last) then
                        if err < 10 then
                            report G_NAME & ": snimek " & integer'image(f) & " [" & integer'image(x) & ", "
                                & integer'image(y) & "] data " & to_hstring(s_tdata) & " (golden "
                                & to_hstring(exp) & "), TUSER " & std_logic'image(s_tuser) & ", TLAST "
                                & std_logic'image(s_tlast) severity error;
                        end if;
                        err := err + 1;
                    end if;
                    if x = G_WIDTH - 1 then
                        x := 0;
                        if y = G_HEIGHT - 1 then
                            y := 0;
                            file_close(f_exp);
                            is_open := false;
                            f := f + 1;
                            finished := (f = G_FRAMES);
                        else
                            y := y + 1;
                        end if;
                    else
                        x := x + 1;
                    end if;
                elsif (s_tvalid = '1') and (ready = '1') and finished then
                    report G_NAME & ": jadro vydalo vic pixelu, nez je ve snimcich" severity error;
                    err := err + 1;
                end if;
                uniform(s1, s2, rnd);
                ready <= '1' when rnd * 100.0 < real(G_READY_PCT) else '0';
            end if;
            errors <= err;
            cycles <= cyc;
            done   <= '1' when finished else '0';
        end if;
    end process;
end architecture;
