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
    signal ready_reg : std_logic := '0';
begin
    s_tready <= ready_reg;

    process (aclk)
        file golden_file         : text;
        variable file_is_open   : boolean := false;
        variable text_line      : line;
        variable golden_data    : std_logic_vector(G_DATA_W - 1 downto 0);
        variable x, y, frame    : natural := 0;
        variable error_count    : natural := 0;
        variable cycle_count    : natural := 0;
        variable first_received : boolean := false;
        variable all_received   : boolean := false;
        variable seed1          : positive := G_SEED;
        variable seed2          : positive := G_SEED + 104729;
        variable random_value   : real;
        variable golden_sof     : std_logic;
        variable golden_eol     : std_logic;
    begin
        if rising_edge(aclk) then
            if aresetn = '0' then
                ready_reg <= '0';
            else
                if first_received and not all_received then
                    cycle_count := cycle_count + 1;
                end if;
                if (s_tvalid = '1') and (ready_reg = '1') and not all_received then
                    first_received := true;
                    if not file_is_open then
                        file_open(golden_file, G_FILE, read_mode);
                        file_is_open := true;
                    end if;
                    readline(golden_file, text_line);
                    hread(text_line, golden_data);
                    golden_sof := '1' when (x = 0 and y = 0) else '0';
                    golden_eol := '1' when (x = G_WIDTH - 1) else '0';
                    if (s_tdata /= golden_data) or (s_tuser /= golden_sof) or (s_tlast /= golden_eol) then
                        if error_count < 10 then
                            report G_NAME & ": snimek " & integer'image(frame) & " [" & integer'image(x) & ", "
                                & integer'image(y) & "] data " & to_hstring(s_tdata) & " (golden "
                                & to_hstring(golden_data) & "), TUSER " & std_logic'image(s_tuser) & ", TLAST "
                                & std_logic'image(s_tlast) severity error;
                        end if;
                        error_count := error_count + 1;
                    end if;
                    if x = G_WIDTH - 1 then
                        x := 0;
                        if y = G_HEIGHT - 1 then
                            y := 0;
                            file_close(golden_file);
                            file_is_open := false;
                            frame := frame + 1;
                            all_received := (frame = G_FRAMES);
                        else
                            y := y + 1;
                        end if;
                    else
                        x := x + 1;
                    end if;
                elsif (s_tvalid = '1') and (ready_reg = '1') and all_received then
                    report G_NAME & ": jadro vydalo vic pixelu, nez je ve snimcich" severity error;
                    error_count := error_count + 1;
                end if;
                uniform(seed1, seed2, random_value);
                ready_reg <= '1' when random_value * 100.0 < real(G_READY_PCT) else '0';
            end if;
            errors <= error_count;
            cycles <= cycle_count;
            done   <= '1' when all_received else '0';
        end if;
    end process;
end architecture;
