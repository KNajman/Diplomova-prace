--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    median_core.vhd
-- Popis:     Mediánový filtr 3x3 šedotónového videa, AXI4-Stream Video
--
-- Bitově shodné s imgproc_median3x3() golden modelu (s replikací okraje i s cv::medianBlur(src, dst, 3))
-- a s HLS jádrem hls_median.
--
-- Poznámky k návrhu:
--  * Okno 3x3 dodává window_gen (řádkové buffery, okraje, flush, resynchronizace), jádro přidává
--    jen síť mediánu. Konvoluce použije stejný window_gen s jinou operací.
--  * Síť 7x sort3 (21 compare-exchange) místo optimálních 19 (Paeth): pravidelná struktura
--    řádky -> sloupce -> diagonála, každá vrstva sort3 = jeden stupeň pipeline. Stejná síť je
--    v golden modelu i HLS, srovnání HLS x VHDL je tak férové.
--      takt E1  seřazení řádků (3x sort3)
--      takt E2  seřazení sloupců: minim, mediánů, maxim (3x sort3)
--      takt E3  medián z (max minim, medián mediánů, min maxim) (1x sort3)
--  * Vstupní i výstupní skid buffer: TREADY na obou stranách je registrovaný.
--  * frame_done = 1takt pulz při výstupu posledního pixelu snímku (ap_done pro registrovou banku).
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;

entity median_core is
    generic(
        G_MAX_WIDTH : positive := C_MAX_WIDTH
    );
    port(
        aclk             : in  std_logic;
        aresetn          : in  std_logic;
        run              : in  std_logic;
        width            : in  unsigned(C_DIM_W - 1 downto 0);
        height           : in  unsigned(C_DIM_W - 1 downto 0);
        border_replicate : in  std_logic;
        status           : out std_logic_vector(3 downto 0);
        frame_done       : out std_logic;
        -- AXI4-Stream Video vstup (8 b)
        s_axis_tdata     : in  std_logic_vector(C_PIX_W - 1 downto 0);
        s_axis_tuser     : in  std_logic;
        s_axis_tlast     : in  std_logic;
        s_axis_tvalid    : in  std_logic;
        s_axis_tready    : out std_logic;
        -- AXI4-Stream Video výstup (8 b)
        m_axis_tdata     : out std_logic_vector(C_PIX_W - 1 downto 0);
        m_axis_tuser     : out std_logic;
        m_axis_tlast     : out std_logic;
        m_axis_tvalid    : out std_logic;
        m_axis_tready    : in  std_logic
    );
end entity;

architecture rtl of median_core is
    constant C_WINDOW   : natural := 3;
    constant C_OP_DEPTH : natural := 3; -- takty E1..E3

    type t_sorted3 is record
        low    : t_pix;
        middle : t_pix;
        high   : t_pix;
    end record;
    type t_sorted3_array is array (0 to 2) of t_sorted3;

    -- Seřazení tří hodnot (shodné se sort3() v median.c)
    function sort3(a, b, c : t_pix) return t_sorted3 is
        variable low_ab, high_ab : t_pix;
        variable result          : t_sorted3;
    begin
        if a < b then
            low_ab  := a;
            high_ab := b;
        else
            low_ab  := b;
            high_ab := a;
        end if;
        if low_ab < c then
            result.low := low_ab;
        else
            result.low := c;
        end if;
        if high_ab > c then
            result.high := high_ab;
        else
            result.high := c;
        end if;
        if high_ab < c then
            result.middle := high_ab;
        elsif low_ab > c then
            result.middle := low_ab;
        else
            result.middle := c;
        end if;
        return result;
    end function;

    signal pipe_enable : std_logic;

    -- vstupní skid buffer
    signal in_skid_s_data, in_skid_m_data : std_logic_vector(C_PIX_W + 1 downto 0);
    signal in_valid, in_ready             : std_logic;

    -- okno
    signal window           : t_window(0 to C_WINDOW - 1, 0 to C_WINDOW - 1);
    signal window_valid     : std_logic;
    signal window_sof       : std_logic;
    signal window_eol       : std_logic;
    signal window_frame_end : std_logic;

    -- síť mediánu
    signal rows_sorted                                    : t_sorted3_array; -- E1
    signal lows_sorted, middles_sorted, highs_sorted      : t_sorted3; -- E2
    signal median_value                                   : t_pix                             := (others => '0'); -- E3
    signal valid_pipe, sof_pipe, eol_pipe, frame_end_pipe : std_logic_vector(1 to C_OP_DEPTH) := (others => '0');

    signal out_skid_s_data, out_skid_m_data : std_logic_vector(C_PIX_W + 1 downto 0);
    signal out_valid                        : std_logic;
begin

    -- vstupní skid buffer: registrovaný TREADY směrem k předchozímu jádru
    in_skid_s_data <= s_axis_tlast & s_axis_tuser & s_axis_tdata;
    input_skid : entity work.axis_skid_buffer
        generic map(G_DATA_W => C_PIX_W + 2)
        port map(aclk    => aclk, aresetn => aresetn, s_data => in_skid_s_data, s_valid => s_axis_tvalid,
                 s_ready => s_axis_tready, m_data => in_skid_m_data, m_valid => in_valid, m_ready => in_ready);

    window_generator : entity work.window_gen
        generic map(G_K => C_WINDOW, G_MAX_WIDTH => G_MAX_WIDTH)
        port map(aclk             => aclk, aresetn => aresetn, pipe_enable => pipe_enable, run => run,
                 width            => width, height => height, border_replicate => border_replicate,
                 in_data          => unsigned(in_skid_m_data(C_PIX_W - 1 downto 0)), in_user => in_skid_m_data(C_PIX_W),
                 in_last          => in_skid_m_data(C_PIX_W + 1), in_valid => in_valid, in_ready => in_ready,
                 win              => window, win_valid => window_valid, win_sof => window_sof, win_eol => window_eol,
                 win_frame_end    => window_frame_end, status => status);

    process(aclk)
    begin
        if rising_edge(aclk) then
            if pipe_enable = '1' then
                -- E1: řádky
                for row in 0 to 2 loop
                    rows_sorted(row) <= sort3(window(row, 0), window(row, 1), window(row, 2));
                end loop;
                -- E2: sloupce seřazených řádků
                lows_sorted    <= sort3(rows_sorted(0).low, rows_sorted(1).low, rows_sorted(2).low);
                middles_sorted <= sort3(rows_sorted(0).middle, rows_sorted(1).middle, rows_sorted(2).middle);
                highs_sorted   <= sort3(rows_sorted(0).high, rows_sorted(1).high, rows_sorted(2).high);
                -- E3: medián
                median_value   <= sort3(lows_sorted.high, middles_sorted.middle, highs_sorted.low).middle;

                sof_pipe       <= window_sof & sof_pipe(1 to C_OP_DEPTH - 1);
                eol_pipe       <= window_eol & eol_pipe(1 to C_OP_DEPTH - 1);
                frame_end_pipe <= window_frame_end & frame_end_pipe(1 to C_OP_DEPTH - 1);
            end if;
            if aresetn = '0' then
                valid_pipe <= (others => '0');
            elsif pipe_enable = '1' then
                valid_pipe <= window_valid & valid_pipe(1 to C_OP_DEPTH - 1);
            end if;
        end if;
    end process;

    out_valid  <= valid_pipe(C_OP_DEPTH);
    frame_done <= pipe_enable and out_valid and frame_end_pipe(C_OP_DEPTH);

    out_skid_s_data <= eol_pipe(C_OP_DEPTH) & sof_pipe(C_OP_DEPTH) & std_logic_vector(median_value);
    output_skid : entity work.axis_skid_buffer
        generic map(G_DATA_W => C_PIX_W + 2)
        port map(aclk    => aclk, aresetn => aresetn, s_data => out_skid_s_data, s_valid => out_valid,
                 s_ready => pipe_enable, m_data => out_skid_m_data, m_valid => m_axis_tvalid,
                 m_ready => m_axis_tready);

    m_axis_tdata <= out_skid_m_data(C_PIX_W - 1 downto 0);
    m_axis_tuser <= out_skid_m_data(C_PIX_W);
    m_axis_tlast <= out_skid_m_data(C_PIX_W + 1);

end architecture;
