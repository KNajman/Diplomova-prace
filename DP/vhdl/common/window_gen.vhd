--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    window_gen.vhd
-- Popis:     Generátor okna K x K pro okénková jádra (medián, konvoluce) - řádkové buffery, okraje,
--            flush a resynchronizace. Sémantika shodná s HLS šablonou hls_window.hpp.
--
-- Poznámky k návrhu:
--  * Snímek se prochází po POZICÍCH (x, y), x = 0 .. W-1+R, y = 0 .. H-1+R, R = K/2. Pozice uvnitř
--    snímku (x < W, y < H) spotřebuje jeden vstupní pixel, ostatní jsou flush (pravý a dolní
--    okraj, TREADY = 0). Pozice s x >= R a y >= R vydá výstupní pixel (x - R, y - R).
--    Výstup má stejný rozměr jako vstup (SAME), geometrie je z čítačů, TLAST se jen kontroluje.
--  * Rozměry width/height se převezmou na začátku snímku (změna registru platí od dalšího snímku).
--  * Pipeline s bublinami: všechny registry se posunou v každém taktu s pipe_enable = 1
--    (registrovaný ready výstupního skid bufferu). Když pozice potřebuje vstup a ten nepřišel,
--    pipeline posune bublinu (valid = 0) - nic nestojí a konec snímku vždy doteče na výstup.
--  * Řádkové buffery: K - 1 x line_buffer (BRAM). Čtení adresy x proběhne v taktu provedení
--    pozice (takt A), zápis posunutého sloupce o takt později (takt B) na stejnou adresu.
--    Stejná adresa se znovu čte až na dalším řádku -> žádný konflikt čtení/zápisu.
--      takt A  pozice + vstupní pixel, čtení řádkových bufferů, předpočet okrajů
--      takt B  surový sloupec (řádky y-K+1 .. y), zápis do řádkových bufferů
--      takt C  svislý okraj (řádky mimo obraz -> 0 nebo nejbližší platný řádek sloupce)
--      takt D  posun okna, vodorovný okraj (začátek řádku vyplní okraj, za koncem řádku
--              se opakuje poslední sloupec nebo 0) -> výstup okna
--  * Okraje: border_replicate = 0 nuly (cv::BORDER_CONSTANT), 1 replikace (cv::BORDER_REPLICATE).
--  * Resynchronizace: před snímkem se čeká na TUSER, pixely před ním se zahodí (status SKIPPED).
--    TUSER uprostřed snímku a TLAST mimo konec řádku se jen hlásí, snímek se vždy dokončí W x H.
--    Nový snímek začne jen při run = 1 (ap_start / auto_restart z registrové banky).
--  * status se zapíše na konci snímku (bity C_ST_* z video_pkg, stejně jako HLS).
--  * v2 (optimalizace kritické cesty): příznaky pozice (potřeba vstupu, okraje, konec řádku/snímku)
--    se počítají o takt DŘÍV pro následující pozici a drží v registru position_flags. V taktu
--    provedení se jen čtou - porovnání s rozměry už neleží v cestě fire -> čítač (v1: 7 úrovní,
--    frame_height -> need_input -> fire -> pos_y). Rozměry se v STATE_WAIT_SOF přebírají průběžně
--    (spolu s konci a příznaky pozice (0, 0), vše ve stejném taktu), v taktu TUSER se zmrazí.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;

entity window_gen is
    generic (
        G_K         : positive := 3;            -- velikost okna (liché, >= 3)
        G_MAX_WIDTH : positive := C_MAX_WIDTH
    );
    port (
        aclk             : in  std_logic;
        aresetn          : in  std_logic;
        pipe_enable      : in  std_logic;       -- posun celé pipeline (ready výstupu)
        run              : in  std_logic;       -- povolení začít nový snímek
        width            : in  unsigned(C_DIM_W - 1 downto 0);
        height           : in  unsigned(C_DIM_W - 1 downto 0);
        border_replicate : in  std_logic;
        -- vstup (z vstupního skid bufferu)
        in_data          : in  t_pix;
        in_user          : in  std_logic;
        in_last          : in  std_logic;
        in_valid         : in  std_logic;
        in_ready         : out std_logic;
        -- okno (takt D)
        win              : out t_window(0 to G_K - 1, 0 to G_K - 1);
        win_valid        : out std_logic;       -- okno patří výstupnímu pixelu
        win_sof          : out std_logic;       -- výstupní pixel (0, 0)
        win_eol          : out std_logic;       -- poslední pixel řádku
        win_frame_end    : out std_logic;       -- poslední pixel snímku
        status           : out std_logic_vector(3 downto 0)
    );
end entity;

architecture rtl of window_gen is
    constant C_RADIUS : natural := G_K / 2;
    constant C_ADDR_W : natural := clog2(G_MAX_WIDTH);

    type t_state is (STATE_WAIT_SOF, STATE_RUN);
    type t_row_index_array is array (0 to G_K - 1) of natural range 0 to G_K - 1;
    type t_buffer_data is array (0 to G_K - 2) of std_logic_vector(C_PIX_W - 1 downto 0);

    -- Metadata pozice, která putuje pipeline spolu se sloupcem
    type t_position is record
        valid        : std_logic;   -- pozice provedena (0 = bublina)
        has_input    : std_logic;   -- x < W a y < H: pozice spotřebuje vstupní pixel
        has_column   : std_logic;   -- x < W: sloupec existuje (vodorovně uvnitř obrazu); řádky mimo obraz řeší row_zero/row_source
        first_column : std_logic;   -- x = 0
        last_column  : std_logic;   -- x = W - 1: sloupec se uloží pro pravý okraj
        has_output   : std_logic;   -- x >= R a y >= R
        sof          : std_logic;
        eol          : std_logic;
        frame_end    : std_logic;
        row_source   : t_row_index_array;               -- svislý okraj: zdrojový řádek sloupce
        row_zero     : std_logic_vector(0 to G_K - 1);  -- svislý okraj: řádek mimo obraz -> 0
    end record;
    constant C_BUBBLE : t_position := (valid => '0', has_input => '0', has_column => '0', first_column => '0', last_column => '0',
                                       has_output => '0', sof => '0', eol => '0', frame_end => '0',
                                       row_source => (others => 0), row_zero => (others => '0'));

    signal state         : t_state := STATE_WAIT_SOF;
    signal pos_x, pos_y  : unsigned(C_DIM_W - 1 downto 0) := (others => '0');
    signal frame_width   : unsigned(C_DIM_W - 1 downto 0) := (others => '0');
    signal frame_height  : unsigned(C_DIM_W - 1 downto 0) := (others => '0');
    signal frame_replicate : std_logic := '0';
    signal x_end, y_end  : unsigned(C_DIM_W - 1 downto 0) := (others => '0');

    signal position_flags : t_position := C_BUBBLE;     -- příznaky pozice (pos_x, pos_y), o takt dopředu
    signal next_x, next_y : unsigned(C_DIM_W - 1 downto 0);
    signal need_input    : boolean;
    signal accept_input  : std_logic;
    signal start_frame   : boolean;
    signal fire          : boolean;

    -- stavové příznaky rozpracovaného snímku
    signal skipped_pending, early_sof_flag, early_eol_flag, late_eol_flag : std_logic := '0';
    signal status_reg    : std_logic_vector(3 downto 0) := (others => '0');

    -- takt A
    signal stage_a       : t_position := C_BUBBLE;
    signal pixel_a       : t_pix := (others => '0');
    signal addr_a        : unsigned(C_ADDR_W - 1 downto 0) := (others => '0');
    signal buffer_read   : t_buffer_data;
    -- takt B
    signal stage_b       : t_position := C_BUBBLE;
    signal raw_column    : t_pix_array(0 to G_K - 1) := (others => (others => '0'));
    -- takt C
    signal stage_c       : t_position := C_BUBBLE;
    signal column        : t_pix_array(0 to G_K - 1) := (others => (others => '0'));
    -- takt D
    signal stage_d       : t_position := C_BUBBLE;
    signal window_reg    : t_window(0 to G_K - 1, 0 to G_K - 1) := (others => (others => (others => '0')));
    signal saved_column  : t_pix_array(0 to G_K - 1) := (others => (others => '0'));

    signal buffer_write_enable : std_logic;

    -- Metadata pozice (x, y) pro rozměry snímku (width, height)
    function make_position(x, y, frame_w, frame_h, last_x, last_y : unsigned; replicate : std_logic)
        return t_position is
        variable result    : t_position;
        variable row_first : integer;               -- index řádku raw_column(0) = y - (K - 1)
        variable row       : integer;
    begin
        result.valid        := '1';
        result.has_input    := to_sl(x < frame_w and y < frame_h);
        -- jen x: i v řádcích flush (y >= H) se sloupec posouvá a řádkové buffery se zapisují (s nulou),
        -- jinak by u K >= 5 další řádek flush četl špatné řádky (stejně jako HLS šablona)
        result.has_column   := to_sl(x < frame_w);
        result.first_column := to_sl(x = 0);
        result.last_column  := to_sl(x = frame_w - 1);
        result.has_output   := to_sl(x >= C_RADIUS and y >= C_RADIUS);
        result.sof          := to_sl(x = C_RADIUS and y = C_RADIUS);
        result.eol          := to_sl(x = last_x);
        result.frame_end    := to_sl(x = last_x and y = last_y);
        row_first := to_integer(y) - (G_K - 1);
        for k in 0 to G_K - 1 loop
            row := row_first + k;
            if row < 0 then
                result.row_source(k) := -row_first;                                    -- řádek 0
                result.row_zero(k)   := not replicate;
            elsif row >= to_integer(frame_h) then
                result.row_source(k) := to_integer(frame_h) - 1 - row_first;           -- řádek H - 1
                result.row_zero(k)   := not replicate;
            else
                result.row_source(k) := k;
                result.row_zero(k)   := '0';
            end if;
        end loop;
        return result;
    end function;
begin

    need_input   <= position_flags.has_input = '1';
    -- následující pozice (konec řádku a snímku z registrovaných příznaků, ne z porovnání)
    next_x <= (others => '0') when position_flags.eol = '1' else pos_x + 1;
    next_y <= (others => '0') when position_flags.frame_end = '1' else
              pos_y + 1 when position_flags.eol = '1' else pos_y;
    in_ready     <= accept_input;
    accept_input <= pipe_enable and ((to_sl(state = STATE_WAIT_SOF) and run) or to_sl(state = STATE_RUN and need_input));
    start_frame  <= (state = STATE_WAIT_SOF) and (accept_input = '1') and (in_valid = '1') and (in_user = '1');
    fire         <= start_frame or
                    ((state = STATE_RUN) and (pipe_enable = '1') and ((not need_input) or (in_valid = '1')));

    -- takt A: čtení řádkových bufferů (adresa = x prováděné pozice), zápis o takt později (takt B)
    buffer_write_enable <= pipe_enable and stage_a.valid and stage_a.has_column;
    gen_buffers : for k in 0 to G_K - 2 generate
        signal write_data : std_logic_vector(C_PIX_W - 1 downto 0);
    begin
        -- posun sloupce: buffer k dostane řádek, který byl v bufferu k + 1 (poslední dostane nový pixel)
        gen_shift : if k < G_K - 2 generate
            write_data <= buffer_read(k + 1);
        end generate;
        gen_newest : if k = G_K - 2 generate
            write_data <= std_logic_vector(pixel_a);
        end generate;

        line : entity work.line_buffer
            -- hloubka 2^ADDR_W: i adresa flush pozice x = W - 1 + R (u max. šířky) leží uvnitř paměti
            generic map (G_DEPTH => 2 ** C_ADDR_W, G_DATA_W => C_PIX_W, G_ADDR_W => C_ADDR_W)
            port map (aclk => aclk, read_enable => pipe_enable, read_addr => resize(pos_x, C_ADDR_W),
                      read_data => buffer_read(k), write_enable => buffer_write_enable, write_addr => addr_a,
                      write_data => write_data);
    end generate;

    process (aclk)
        variable new_column : t_pix_array(0 to G_K - 1);
    begin
        if rising_edge(aclk) then
            -- Poznámka k volbě: resetují se jen řídicí registry (stav, pozice, příznaky, status). Rozměry
            -- snímku, x_end/y_end, position_flags a datové registry se neresetují: ve stavu WAIT_SOF se
            -- přebírají v každém taktu, a první start_frame po resetu nastane až po prázdném vstupním
            -- skid bufferu (out_valid = 0 po resetu), takže se nikdy nepoužije stará hodnota.
            -- Ověřuje tb_filter2d_reset (reset uprostřed snímku, změněné rozměry, run = 1). Sigasi to
            -- hlásí jako kód 238, záměr.
            if aresetn = '0' then
                state           <= STATE_WAIT_SOF;
                pos_x           <= (others => '0');
                pos_y           <= (others => '0');
                stage_a         <= C_BUBBLE;
                stage_b         <= C_BUBBLE;
                stage_c         <= C_BUBBLE;
                stage_d         <= C_BUBBLE;
                skipped_pending <= '0';
                early_sof_flag  <= '0';
                early_eol_flag  <= '0';
                late_eol_flag   <= '0';
                status_reg      <= (others => '0');
            elsif pipe_enable = '1' then
                ---------------------------------------------------------- řízení pozic, takt A
                if state = STATE_WAIT_SOF then
                    if start_frame then
                        -- v taktu startu se převzaté hodnoty nemění (příznaky pozice (0, 0) k nim patří)
                        state          <= STATE_RUN;
                        early_sof_flag <= '0';
                        early_eol_flag <= '0';
                        late_eol_flag  <= '0';
                    else
                        -- rozměry, konce a příznaky pozice (0, 0) se přebírají průběžně, všechny ve stejném
                        -- taktu ze stejných vstupů -> vždy navzájem konzistentní
                        frame_width     <= width;
                        frame_height    <= height;
                        frame_replicate <= border_replicate;
                        x_end           <= width - 1 + C_RADIUS;
                        y_end           <= height - 1 + C_RADIUS;
                        pos_x           <= (others => '0');
                        pos_y           <= (others => '0');
                        position_flags  <= make_position(to_unsigned(0, C_DIM_W), to_unsigned(0, C_DIM_W), width, height,
                                                         width - 1 + C_RADIUS, height - 1 + C_RADIUS, border_replicate);
                        if (accept_input = '1') and (in_valid = '1') then
                            skipped_pending <= '1';         -- pixel před TUSER zahozen
                        end if;
                    end if;
                end if;

                if fire then
                    stage_a <= position_flags;
                    addr_a  <= resize(pos_x, C_ADDR_W);
                    if position_flags.has_input = '1' then
                        pixel_a <= in_data;
                        -- kontrola postranních signálů spotřebovaného pixelu
                        if (not start_frame) and (in_user = '1') then
                            early_sof_flag <= '1';
                        end if;
                        if (in_last = '1') and (position_flags.last_column = '0') then
                            early_eol_flag <= '1';
                        end if;
                        if (in_last = '0') and (position_flags.last_column = '1') then
                            late_eol_flag <= '1';
                        end if;
                    else
                        pixel_a <= (others => '0');
                    end if;
                    -- další pozice a její příznaky (počítané z registrů, ne v cestě fire)
                    pos_x          <= next_x;
                    pos_y          <= next_y;
                    position_flags <= make_position(next_x, next_y, frame_width, frame_height, x_end, y_end,
                                                    frame_replicate);
                    if position_flags.frame_end = '1' then
                        state <= STATE_WAIT_SOF;
                        status_reg(C_ST_SKIPPED)   <= skipped_pending;
                        status_reg(C_ST_EARLY_SOF) <= early_sof_flag;
                        status_reg(C_ST_EARLY_EOL) <= early_eol_flag;
                        status_reg(C_ST_LATE_EOL)  <= late_eol_flag;
                        skipped_pending <= '0';
                    end if;
                else
                    stage_a <= C_BUBBLE;
                end if;

                ---------------------------------------------------------- takt B: surový sloupec
                stage_b <= stage_a;
                for k in 0 to G_K - 2 loop
                    raw_column(k) <= unsigned(buffer_read(k));
                end loop;
                raw_column(G_K - 1) <= pixel_a;

                ---------------------------------------------------------- takt C: svislý okraj
                stage_c <= stage_b;
                for k in 0 to G_K - 1 loop
                    if stage_b.row_zero(k) = '1' then
                        column(k) <= (others => '0');
                    else
                        column(k) <= raw_column(stage_b.row_source(k));
                    end if;
                end loop;

                ---------------------------------------------------------- takt D: okno, vodorovný okraj
                stage_d <= stage_c;
                if stage_c.valid = '1' then
                    if stage_c.has_column = '1' then
                        new_column := column;
                        if stage_c.last_column = '1' then
                            saved_column <= column;
                        end if;
                    elsif frame_replicate = '1' then
                        new_column := saved_column;
                    else
                        new_column := (others => (others => '0'));
                    end if;
                    for row in 0 to G_K - 1 loop
                        for col in 0 to G_K - 2 loop
                            if stage_c.first_column = '1' then
                                if frame_replicate = '1' then
                                    window_reg(row, col) <= new_column(row);
                                else
                                    window_reg(row, col) <= (others => '0');
                                end if;
                            else
                                window_reg(row, col) <= window_reg(row, col + 1);
                            end if;
                        end loop;
                        window_reg(row, G_K - 1) <= new_column(row);
                    end loop;
                end if;
            end if;
        end if;
    end process;

    win           <= window_reg;
    win_valid     <= stage_d.valid and stage_d.has_output;
    win_sof       <= stage_d.sof;
    win_eol       <= stage_d.eol;
    win_frame_end <= stage_d.frame_end;
    status        <= status_reg;

end architecture;
