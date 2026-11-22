--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    passthrough_core.vhd
-- Popis:     Propust AXI4-Stream Video (data beze změny) s resynchronizací a kontrolou TUSER/TLAST
--
-- Účel: ověření průchodu dat a řízení toku (TREADY/TVALID) bez vlivu algoritmu - mezery ve vstupu,
-- zpětný tlak, pixely před začátkem snímku, chybné TLAST, maximální rozměr, zastavení a znovuspuštění.
-- Sémantika snímku je shodná s window_gen a HLS hls_passthrough:
--  * Před snímkem se čeká na TUSER, pixely před ním se zahodí (status SKIPPED).
--  * Snímek má vždy W x H pixelů podle registrů (převzaty v taktu TUSER). TUSER uprostřed snímku
--    a TLAST mimo konec řádku se jen hlásí (status), výstupní TUSER/TLAST jsou z čítačů.
--  * Nový snímek začne jen při run = 1 (ap_start / auto_restart z registrové banky).
--  * status se zapíše na konci snímku (bity C_ST_* z video_pkg), frame_done = 1takt pulz při předání
--    posledního pixelu snímku do výstupního skid bufferu.
--
-- Poznámky k návrhu:
--  * Vstupní i výstupní skid buffer: TREADY na obou stranách je registrovaný.
--  * Pipeline: takt 1 příjem pixelu, porovnání čítače x s W - 1 a y s H - 1, výstupní registr.
--    Konstanty W - 1 a H - 1 se předpočítají v STATE_WAIT_SOF (mimo cestu příjmu pixelu).
--  * Šířka dat je generikum (výchozí 24 b RGB jako výstup kamery), logika snímku na ní nezávisí.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;

entity passthrough_core is
    generic(
        G_DATA_W : positive := C_RGB_W
    );
    port(
        aclk          : in  std_logic;
        aresetn       : in  std_logic;
        run           : in  std_logic;
        width         : in  unsigned(C_DIM_W - 1 downto 0);
        height        : in  unsigned(C_DIM_W - 1 downto 0);
        status        : out std_logic_vector(3 downto 0);
        frame_done    : out std_logic;
        -- AXI4-Stream Video vstup
        s_axis_tdata  : in  std_logic_vector(G_DATA_W - 1 downto 0);
        s_axis_tuser  : in  std_logic;
        s_axis_tlast  : in  std_logic;
        s_axis_tvalid : in  std_logic;
        s_axis_tready : out std_logic;
        -- AXI4-Stream Video výstup
        m_axis_tdata  : out std_logic_vector(G_DATA_W - 1 downto 0);
        m_axis_tuser  : out std_logic;
        m_axis_tlast  : out std_logic;
        m_axis_tvalid : out std_logic;
        m_axis_tready : in  std_logic
    );
end entity;

architecture rtl of passthrough_core is
    type t_state is (STATE_WAIT_SOF, STATE_FRAME);

    signal state       : t_state := STATE_WAIT_SOF;
    signal pipe_enable : std_logic;

    -- vstupní skid buffer
    signal in_skid_s_data, in_skid_m_data : std_logic_vector(G_DATA_W + 1 downto 0);
    signal in_valid, in_ready             : std_logic;
    signal in_data                        : std_logic_vector(G_DATA_W - 1 downto 0);
    signal in_user, in_last               : std_logic;
    signal accept                         : std_logic;

    -- geometrie snímku (převzata v taktu TUSER)
    signal width_m1  : unsigned(C_DIM_W - 1 downto 0) := (others => '0');
    signal height_m1 : unsigned(C_DIM_W - 1 downto 0) := (others => '0');
    signal pos_x     : unsigned(C_DIM_W - 1 downto 0) := (others => '0');
    signal pos_y     : unsigned(C_DIM_W - 1 downto 0) := (others => '0');

    -- příznaky poruch rozpracovaného snímku
    signal skipped, early_sof, early_eol, late_eol : std_logic := '0';
    signal status_reg                              : std_logic_vector(3 downto 0) := (others => '0');

    -- výstupní registr
    signal out_data                                  : std_logic_vector(G_DATA_W - 1 downto 0) := (others => '0');
    signal out_user, out_last, out_valid, out_frame_end : std_logic := '0';
    signal frame_done_reg                            : std_logic := '0';

    signal out_skid_s_data, out_skid_m_data : std_logic_vector(G_DATA_W + 1 downto 0);
begin

    -- vstupní skid buffer: registrovaný TREADY směrem k předchozímu jádru
    in_skid_s_data <= s_axis_tlast & s_axis_tuser & s_axis_tdata;
    input_skid : entity work.axis_skid_buffer
        generic map(G_DATA_W => G_DATA_W + 2)
        port map(aclk    => aclk, aresetn => aresetn, s_data => in_skid_s_data, s_valid => s_axis_tvalid,
                 s_ready => s_axis_tready, m_data => in_skid_m_data, m_valid => in_valid, m_ready => in_ready);

    in_data <= in_skid_m_data(G_DATA_W - 1 downto 0);
    in_user <= in_skid_m_data(G_DATA_W);
    in_last <= in_skid_m_data(G_DATA_W + 1);

    -- Příjem: ve snímku vždy (snímek se dokončí), před snímkem jen při run = 1
    in_ready <= pipe_enable and (run or to_sl(state = STATE_FRAME));
    accept   <= in_valid and in_ready;

    process(aclk)
        variable is_eol       : boolean;
        variable is_frame_end : boolean;
        variable starts_frame : boolean;
    begin
        if rising_edge(aclk) then
            frame_done_reg <= '0';

            if state = STATE_WAIT_SOF then
                -- rozměry se přebírají průběžně, v taktu TUSER se zmrazí (změna platí od dalšího snímku)
                width_m1  <= width - 1;
                height_m1 <= height - 1;
            end if;

            if pipe_enable = '1' then
                out_valid     <= '0';
                out_frame_end <= '0';

                if accept = '1' then
                    starts_frame := (state = STATE_WAIT_SOF) and (in_user = '1');
                    if (state = STATE_FRAME) or starts_frame then
                        if starts_frame then
                            -- první pixel snímku: rozměry z registrů (width_m1 ještě nemusí platit)
                            is_eol       := (width = 1);
                            is_frame_end := is_eol and (height = 1);
                        else
                            is_eol       := (pos_x = width_m1);
                            is_frame_end := is_eol and (pos_y = height_m1);
                            if in_user = '1' then
                                early_sof <= '1';
                            end if;
                        end if;
                        if (in_last = '1') and not is_eol then
                            early_eol <= '1';
                        end if;
                        if (in_last = '0') and is_eol then
                            late_eol <= '1';
                        end if;

                        out_data      <= in_data;
                        out_user      <= to_sl(starts_frame);
                        out_last      <= to_sl(is_eol);
                        out_valid     <= '1';
                        out_frame_end <= to_sl(is_frame_end);

                        if is_eol then
                            pos_x <= (others => '0');
                            pos_y <= pos_y + 1;
                        else
                            pos_x <= pos_x + 1;
                        end if;
                        if starts_frame then
                            width_m1  <= width - 1;
                            height_m1 <= height - 1;
                            if is_eol then
                                pos_y <= to_unsigned(1, C_DIM_W);   -- snímek šířky 1: první řádek hotový
                            else
                                pos_y <= (others => '0');
                            end if;
                        end if;

                        if is_frame_end then
                            state <= STATE_WAIT_SOF;
                        else
                            state <= STATE_FRAME;
                        end if;
                    else
                        -- pixel před TUSER: zahodit
                        skipped <= '1';
                    end if;
                end if;

                -- konec snímku: předání posledního pixelu do skid bufferu
                if (out_valid = '1') and (out_frame_end = '1') then
                    status_reg     <= late_eol & early_eol & early_sof & skipped;
                    frame_done_reg <= '1';
                    skipped        <= '0';
                    early_sof      <= '0';
                    early_eol      <= '0';
                    late_eol       <= '0';
                end if;
            end if;

            if aresetn = '0' then
                state          <= STATE_WAIT_SOF;
                pos_x          <= (others => '0');
                pos_y          <= (others => '0');
                out_valid      <= '0';
                out_frame_end  <= '0';
                frame_done_reg <= '0';
                skipped        <= '0';
                early_sof      <= '0';
                early_eol      <= '0';
                late_eol       <= '0';
                status_reg     <= (others => '0');
            end if;
        end if;
    end process;

    status     <= status_reg;
    frame_done <= frame_done_reg;

    -- výstupní skid buffer (registrovaný ready -> pipe_enable)
    out_skid_s_data <= out_last & out_user & out_data;
    output_skid : entity work.axis_skid_buffer
        generic map(G_DATA_W => G_DATA_W + 2)
        port map(aclk    => aclk, aresetn => aresetn, s_data => out_skid_s_data, s_valid => out_valid,
                 s_ready => pipe_enable, m_data => out_skid_m_data, m_valid => m_axis_tvalid, m_ready => m_axis_tready);

    m_axis_tdata <= out_skid_m_data(G_DATA_W - 1 downto 0);
    m_axis_tuser <= out_skid_m_data(G_DATA_W);
    m_axis_tlast <= out_skid_m_data(G_DATA_W + 1);

end architecture;
