--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    tb_threshold.vhd
-- Popis:     Úplný test threshold_core proti golden modelu v jednom běhu simulace
--
--  * Rampa 256x4 (všech 256 hodnot ve 4 permutacích) pro každou kombinaci: 5 typů x prahy
--    {0, 1, 127, 254, 255} x maxval {255, 77} = 50 snímků, golden thresh_ramp_t<typ>_<práh>_<maxval>.hex,
--  * navíc neplatné typy 5..7: výstup musí být 0 (golden model je assertem nepřipouští),
--  * parametry se mění mezi snímky po vyprázdnění pipeline, náhodné mezery TVALID i backpressure,
--  * kontroluje se i TUSER (první pixel) a TLAST (konec řádku).
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use std.textio.all;
use work.video_pkg.all;

entity tb_threshold is
    generic (
        G_VALID_PCT : natural := 70;
        G_READY_PCT : natural := 70
    );
end entity;

architecture sim of tb_threshold is
    constant C_PERIOD : time := 5 ns;
    constant C_WIDTH  : positive := 256;
    constant C_HEIGHT : positive := 4;
    constant C_PIXELS : positive := C_WIDTH * C_HEIGHT;

    type t_natural_array is array (natural range <>) of natural;
    constant C_THRESHOLDS : t_natural_array := (0, 1, 127, 254, 255);
    constant C_MAXVALS    : t_natural_array := (255, 77);
    constant C_TYPES      : natural := 8;                -- 0..4 platné, 5..7 neplatné
    constant C_COMBOS     : natural := C_TYPES * C_THRESHOLDS'length * C_MAXVALS'length;

    type t_image is array (0 to C_PIXELS - 1) of std_logic_vector(C_PIX_W - 1 downto 0);
    impure function read_image(file_name : string) return t_image is
        file image_file : text;
        variable text_line : line;
        variable result    : t_image;
    begin
        file_open(image_file, file_name, read_mode);
        for i in 0 to C_PIXELS - 1 loop
            readline(image_file, text_line);
            hread(text_line, result(i));
        end loop;
        file_close(image_file);
        return result;
    end function;
    constant C_INPUT : t_image := read_image("data/in_ramp_256x4.hex");

    function combo_type(combo : natural) return natural is
    begin
        return combo / (C_THRESHOLDS'length * C_MAXVALS'length);
    end function;
    function combo_thresh(combo : natural) return natural is
    begin
        return C_THRESHOLDS((combo / C_MAXVALS'length) mod C_THRESHOLDS'length);
    end function;
    function combo_maxval(combo : natural) return natural is
    begin
        return C_MAXVALS(combo mod C_MAXVALS'length);
    end function;
    function combo_name(combo : natural) return string is
    begin
        return integer'image(combo_type(combo)) & "_" & integer'image(combo_thresh(combo)) & "_"
            & integer'image(combo_maxval(combo));
    end function;

    signal aclk    : std_logic := '0';
    signal aresetn : std_logic := '0';

    signal thresh, maxval : t_pix := (others => '0');
    signal thresh_type    : unsigned(C_THRESH_TYPE_W - 1 downto 0) := (others => '0');
    signal s_data, m_data : std_logic_vector(C_PIX_W - 1 downto 0) := (others => '0');
    signal s_user, s_last, s_valid : std_logic := '0';
    signal s_ready : std_logic;
    signal m_user, m_last, m_valid : std_logic;
    signal m_ready : std_logic := '0';

    signal combos_checked : natural := 0;            -- přijato a zkontrolováno snímků
    signal error_count    : natural := 0;
begin
    aclk    <= not aclk after C_PERIOD / 2;
    aresetn <= '1' after 4 * C_PERIOD;

    dut : entity work.threshold_core
        port map (aclk => aclk, aresetn => aresetn, thresh => thresh, maxval => maxval, thresh_type => thresh_type,
                  s_axis_tdata => s_data, s_axis_tuser => s_user, s_axis_tlast => s_last, s_axis_tvalid => s_valid,
                  s_axis_tready => s_ready, m_axis_tdata => m_data, m_axis_tuser => m_user, m_axis_tlast => m_last,
                  m_axis_tvalid => m_valid, m_axis_tready => m_ready);

    stimulus : process
        variable seed1, seed2 : positive := 17;
        variable random_value : real;
    begin
        wait until rising_edge(aclk) and aresetn = '1';
        for combo in 0 to C_COMBOS - 1 loop
            -- parametry až po vyprázdnění pipeline (všechny pixely předchozího snímku přijaty)
            if combos_checked /= combo then
                wait until combos_checked = combo;
            end if;
            wait until rising_edge(aclk);
            thresh      <= to_unsigned(combo_thresh(combo), C_PIX_W);
            maxval      <= to_unsigned(combo_maxval(combo), C_PIX_W);
            thresh_type <= to_unsigned(combo_type(combo), C_THRESH_TYPE_W);
            for k in 1 to 3 loop                       -- předpočet zdrojů z typu (1 takt) + rezerva
                wait until rising_edge(aclk);
            end loop;
            for i in 0 to C_PIXELS - 1 loop
                loop
                    uniform(seed1, seed2, random_value);
                    exit when random_value * 100.0 < real(G_VALID_PCT);
                    s_valid <= '0';
                    wait until rising_edge(aclk);
                end loop;
                s_data  <= C_INPUT(i);
                s_user  <= to_sl(i = 0);
                s_last  <= to_sl(i mod C_WIDTH = C_WIDTH - 1);
                s_valid <= '1';
                wait until rising_edge(aclk) and s_ready = '1';
            end loop;
            s_valid <= '0';
        end loop;
        wait;
    end process;

    checker : process
        file golden_file : text;
        variable text_line : line;
        variable golden    : std_logic_vector(C_PIX_W - 1 downto 0);
        variable seed1, seed2 : positive := 29;
        variable random_value : real;
        variable errors    : natural := 0;
    begin
        wait until rising_edge(aclk) and aresetn = '1';
        for combo in 0 to C_COMBOS - 1 loop
            if combo_type(combo) <= C_THRESH_TOZERO_INV then
                file_open(golden_file, "data/thresh_ramp_t" & combo_name(combo) & ".hex", read_mode);
            end if;
            for i in 0 to C_PIXELS - 1 loop
                loop
                    uniform(seed1, seed2, random_value);
                    m_ready <= to_sl(random_value * 100.0 < real(G_READY_PCT));
                    wait until rising_edge(aclk);
                    exit when m_valid = '1' and m_ready = '1';
                end loop;
                if combo_type(combo) <= C_THRESH_TOZERO_INV then
                    readline(golden_file, text_line);
                    hread(text_line, golden);
                else
                    golden := (others => '0');          -- neplatný typ -> 0
                end if;
                if m_data /= golden or m_user /= to_sl(i = 0) or m_last /= to_sl(i mod C_WIDTH = C_WIDTH - 1) then
                    if errors < 10 then
                        report "threshold t" & combo_name(combo) & " px " & integer'image(i) & ": "
                            & to_hstring(m_data) & " (golden " & to_hstring(golden) & "), TUSER "
                            & std_logic'image(m_user) & ", TLAST " & std_logic'image(m_last) severity error;
                    end if;
                    errors := errors + 1;
                end if;
            end loop;
            if combo_type(combo) <= C_THRESH_TOZERO_INV then
                file_close(golden_file);
            end if;
            m_ready <= '0';
            error_count    <= errors;
            combos_checked <= combo + 1;
        end loop;
        wait;
    end process;

    check : process
    begin
        wait until combos_checked = C_COMBOS for 50 ms;
        assert combos_checked = C_COMBOS report "TIMEOUT: zkontrolovano jen " & integer'image(combos_checked)
            & " snimku" severity failure;
        wait until rising_edge(aclk);
        if error_count = 0 then
            report "VYSLEDEK threshold " & integer'image(C_COMBOS) & " kombinaci: PASS";
        else
            report "VYSLEDEK threshold: FAIL (" & integer'image(error_count) & " chyb)";
        end if;
        assert error_count = 0 severity failure;
        std.env.stop;
        wait;
    end process;
end architecture;
