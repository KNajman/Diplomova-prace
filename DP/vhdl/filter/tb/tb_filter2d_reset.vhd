--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    tb_filter2d_reset.vhd
-- Popis:     Reset uprostřed snímku (filter2d_core + window_gen), s run držený na 1
--
--  Poznámka k volbě: datové registry window_gen (frame_width, frame_height, x_end, position_flags...)
--  se neresetují, přebírají se průběžně ve stavu WAIT_SOF. Test ověřuje, že po resetu nezůstane
--  platný starý stav: uprostřed snímku 16x8 se aktivuje reset, během něj se změní rozměry na 9x5
--  a nový snímek začne v nejbližším možném taktu po uvolnění resetu. Očekává se přesně 9x5 výstupních
--  pixelů, jedno TUSER, TLAST na konci každého z 5 řádků a nulový status.
--  Kontrola struktury výstupu (počty, TUSER, TLAST), hodnoty pixelů ověřují ostatní testbenche.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;

entity tb_filter2d_reset is
    generic(
        G_K           : positive := 3;
        G_WIDTH_OLD   : positive := 16;
        G_HEIGHT_OLD  : positive := 8;
        G_WIDTH_NEW   : positive := 9;
        G_HEIGHT_NEW  : positive := 5;
        G_CUT_PIXELS  : positive := 70; -- kolik pixelů starého snímku se pošle před resetem
        G_IDLE_CYCLES : natural  := 0   -- mezera mezi uvolněním resetu a prvním pixelem nového snímku
    );
end entity;

architecture sim of tb_filter2d_reset is
    constant C_PERIOD : time := 5 ns;

    signal aclk    : std_logic                      := '0';
    signal aresetn : std_logic                      := '0';
    signal width   : unsigned(C_DIM_W - 1 downto 0) := to_unsigned(G_WIDTH_OLD, C_DIM_W);
    signal height  : unsigned(C_DIM_W - 1 downto 0) := to_unsigned(G_HEIGHT_OLD, C_DIM_W);

    signal s_data                           : std_logic_vector(C_PIX_W - 1 downto 0) := (others => '0');
    signal s_user, s_last, s_valid, s_ready : std_logic                              := '0';
    signal m_user, m_last, m_valid          : std_logic;
    signal status                           : std_logic_vector(3 downto 0);

    signal output_pixels  : natural := 0;
    signal output_users   : natural := 0;
    signal output_lasts   : natural := 0;
    signal row_pixels     : natural := 0;
    signal row_errors     : natural := 0;
    signal new_frame_sent : boolean := false;
begin
    aclk <= not aclk after C_PERIOD / 2;

    dut : entity work.filter2d_core
        generic map(G_K => G_K, G_USE_DSP => false)
        port map(aclk             => aclk, aresetn => aresetn, run => '1', width => width, height => height,
                 border_replicate => '1', coeff => (others => (others => '0')),
                 scale            => (others => '0'), delta => (others => '0'),
                 status           => status, frame_done => open,
                 s_axis_tdata     => s_data, s_axis_tuser => s_user, s_axis_tlast => s_last, s_axis_tvalid => s_valid,
                 s_axis_tready    => s_ready, m_axis_tdata => open, m_axis_tuser => m_user, m_axis_tlast => m_last,
                 m_axis_tvalid    => m_valid, m_axis_tready => '1');

    -- Příjemce: počítá jen to, co vyjde po resetu (počítadla se při resetu nulují)
    sink : process(aclk)
    begin
        if rising_edge(aclk) then
            if aresetn = '0' then
                output_pixels <= 0;
                output_users  <= 0;
                output_lasts  <= 0;
                row_pixels    <= 0;
                row_errors    <= 0;
            elsif m_valid = '1' then
                output_pixels <= output_pixels + 1;
                if m_user = '1' then
                    output_users <= output_users + 1;
                end if;
                if m_last = '1' then
                    output_lasts <= output_lasts + 1;
                    if row_pixels /= G_WIDTH_NEW - 1 then
                        row_errors <= row_errors + 1;
                    end if;
                    row_pixels   <= 0;
                else
                    row_pixels <= row_pixels + 1;
                end if;
            end if;
        end if;
    end process;

    stimulus : process
        -- Jeden pixel, drží se do přijetí (TREADY)
        procedure send(frame_width : positive; pixel_x, pixel_y : natural) is
        begin
            s_data  <= std_logic_vector(to_unsigned((pixel_x + 3 * pixel_y) mod 256, C_PIX_W));
            s_user  <= '1' when (pixel_x = 0 and pixel_y = 0) else '0';
            s_last  <= '1' when (pixel_x = frame_width - 1) else '0';
            s_valid <= '1';
            wait until rising_edge(aclk) and s_ready = '1';
        end procedure;
        variable sent : natural := 0;
    begin
        wait for 4 * C_PERIOD;
        wait until rising_edge(aclk);
        aresetn <= '1';

        -- starý snímek, přerušený po G_CUT_PIXELS pixelech
        old_frame : for pixel_y in 0 to G_HEIGHT_OLD - 1 loop
            for pixel_x in 0 to G_WIDTH_OLD - 1 loop
                exit old_frame when sent = G_CUT_PIXELS;
                send(G_WIDTH_OLD, pixel_x, pixel_y);
                sent := sent + 1;
            end loop;
        end loop;
        s_valid <= '0';

        -- reset za běhu, během něj se změní rozměry (run zůstává 1)
        aresetn <= '0';
        width   <= to_unsigned(G_WIDTH_NEW, C_DIM_W);
        height  <= to_unsigned(G_HEIGHT_NEW, C_DIM_W);
        for cycle in 1 to 3 loop
            wait until rising_edge(aclk);
        end loop;
        aresetn <= '1';
        for cycle in 1 to G_IDLE_CYCLES loop
            wait until rising_edge(aclk);
        end loop;

        -- nový snímek hned po uvolnění resetu
        for pixel_y in 0 to G_HEIGHT_NEW - 1 loop
            for pixel_x in 0 to G_WIDTH_NEW - 1 loop
                send(G_WIDTH_NEW, pixel_x, pixel_y);
            end loop;
        end loop;
        s_valid        <= '0';
        new_frame_sent <= true;
        wait;
    end process;

    check : process
        variable total_errors : natural := 0;
    begin
        wait until new_frame_sent;
        -- doběh pipeline + dost času na případné nadbytečné pixely
        for cycle in 1 to 200 loop
            wait until rising_edge(aclk);
        end loop;
        if output_pixels /= G_WIDTH_NEW * G_HEIGHT_NEW then
            report "pocet vystupnich pixelu " & integer'image(output_pixels) & ", ocekavano " & integer'image(G_WIDTH_NEW * G_HEIGHT_NEW) severity error;
            total_errors := total_errors + 1;
        end if;
        if output_users /= 1 then
            report "pocet TUSER " & integer'image(output_users) & ", ocekavano 1" severity error;
            total_errors := total_errors + 1;
        end if;
        if output_lasts /= G_HEIGHT_NEW then
            report "pocet TLAST " & integer'image(output_lasts) & ", ocekavano " & integer'image(G_HEIGHT_NEW)
            severity error;
            total_errors := total_errors + 1;
        end if;
        if row_errors /= 0 then
            report "TLAST mimo konec radku: " & integer'image(row_errors) severity error;
            total_errors := total_errors + 1;
        end if;
        if status /= "0000" then
            report "status " & to_string(status) severity error;
            total_errors := total_errors + 1;
        end if;
        if total_errors = 0 then
            report "VYSLEDEK filter2d reset za behu, mezera " & integer'image(G_IDLE_CYCLES) & ": PASS";
        else
            report "VYSLEDEK filter2d reset za behu, mezera " & integer'image(G_IDLE_CYCLES) & ": FAIL (" & integer'image(total_errors) & " chyb)";
        end if;
        assert total_errors = 0 severity failure;
        std.env.stop;
        wait;
    end process;

    timeout : process
    begin
        wait for 1 ms;
        report "TIMEOUT: nevysel ocekavany pocet pixelu" severity failure;
        wait;
    end process;
end architecture;
