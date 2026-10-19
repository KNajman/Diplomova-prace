--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    histogram_core.vhd
-- Popis:     Histogram jasu (256 košů) s průchozím videem (bypass), varianta s čítači
--
-- Výsledek bitově shodný s imgproc_histogram() golden modelu a s HLS jádrem hls_histogram.
--
-- Poznámky k návrhu:
--  * Architektura záměrně JINÁ než HLS (BRAM + forwarding): 256 samostatných čítačů. Každý pixel
--    zvýší jen svůj čítač, read-modify-write přes paměť ani forwarding nejsou potřeba, II = 1
--    je triviální. Cena: 256 x 23 FF + inkrementátory - srovnání "logika vs. BRAM" s HLS (plán DP).
--  * Šířka čítače vzorcem: clog2(G_MAX_WIDTH * G_MAX_HEIGHT + 1) = 23 b pro 4K.
--  * Jedno "volání" = jeden snímek: registr height, šířku ohraničuje TLAST. Po posledním řádku se
--    čítače zapojí jako posuvný registr a za 256 taktů se vysypou do výsledkové paměti
--    (result_write_*), současně se vynulují (zasouvá se nula). Odpadá multiplexor 256:1 i stínové
--    registry. Během výsypu vstup stojí (TREADY = 0): 256 taktů na snímek (HLS: nulování + kopie
--    2 x 256 taktů).
--  * Video prochází beze změny přes vstupní a výstupní skid buffer (registrovaný TREADY).
--  * Resynchronizace jako HLS: před TUSER se pixely propouštějí a nepočítají (status bit0
--    SKIPPED), TUSER uprostřed snímku jen označí snímek (bit1 EARLY_SOF) a počítání pokračuje do
--    výšky snímku. Nový snímek začne jen při run = 1.
--  * frame_done = 1takt pulz po zapsání posledního koše (ap_done pro registrovou banku).
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;

entity histogram_core is
    generic (
        G_MAX_WIDTH  : positive := C_MAX_WIDTH;
        G_MAX_HEIGHT : positive := C_MAX_HEIGHT
    );
    port (
        aclk              : in  std_logic;
        aresetn           : in  std_logic;
        run               : in  std_logic;
        height            : in  unsigned(C_DIM_W - 1 downto 0);
        status            : out std_logic_vector(1 downto 0);
        frame_done        : out std_logic;
        -- výsledková paměť (256 x 32 b, zápis při výsypu)
        result_write_enable : out std_logic;
        result_write_addr   : out unsigned(C_PIX_W - 1 downto 0);
        result_write_data   : out std_logic_vector(31 downto 0);
        -- AXI4-Stream Video vstup (8 b)
        s_axis_tdata      : in  std_logic_vector(C_PIX_W - 1 downto 0);
        s_axis_tuser      : in  std_logic;
        s_axis_tlast      : in  std_logic;
        s_axis_tvalid     : in  std_logic;
        s_axis_tready     : out std_logic;
        -- AXI4-Stream Video výstup (kopie vstupu)
        m_axis_tdata      : out std_logic_vector(C_PIX_W - 1 downto 0);
        m_axis_tuser      : out std_logic;
        m_axis_tlast      : out std_logic;
        m_axis_tvalid     : out std_logic;
        m_axis_tready     : in  std_logic
    );
end entity;

architecture rtl of histogram_core is
    constant C_BINS      : natural := C_HIST_BINS;
    constant C_COUNT_W   : natural := clog2(G_MAX_WIDTH * G_MAX_HEIGHT + 1);

    type t_state is (STATE_WAIT_SOF, STATE_COUNT, STATE_DRAIN, STATE_READOUT);
    type t_counter_array is array (0 to C_BINS - 1) of unsigned(C_COUNT_W - 1 downto 0);

    signal state          : t_state := STATE_WAIT_SOF;
    signal counters       : t_counter_array := (others => (others => '0'));
    signal last_row       : unsigned(C_DIM_W - 1 downto 0) := (others => '0'); -- height - 1 (0 pro height = 0, jako HLS)
    signal row            : unsigned(C_DIM_W - 1 downto 0) := (others => '0');
    signal readout_index  : unsigned(C_PIX_W - 1 downto 0) := (others => '0');

    -- dekódovaný koš přijatého pixelu (one-hot, registr) = povolení hodin čítače v dalším taktu;
    -- dekodér 8 -> 256 a 23b inkrement tak nejsou v jednom taktu
    signal count_select   : std_logic_vector(C_BINS - 1 downto 0) := (others => '0');

    signal skipped_pending, early_sof_flag : std_logic := '0';
    signal status_reg     : std_logic_vector(1 downto 0) := (others => '0');
    signal frame_done_reg : std_logic := '0';

    -- skid buffery a průchod videa
    signal pipe_enable    : std_logic;
    signal in_skid_s_data, in_skid_m_data : std_logic_vector(C_PIX_W + 1 downto 0);
    signal in_valid, in_ready : std_logic;
    signal in_pixel       : t_pix;
    signal in_user, in_last : std_logic;
    signal input_allowed  : std_logic;
    signal accept         : std_logic;
    signal out_skid_m_data : std_logic_vector(C_PIX_W + 1 downto 0);
begin

    in_skid_s_data <= s_axis_tlast & s_axis_tuser & s_axis_tdata;
    input_skid : entity work.axis_skid_buffer
        generic map (G_DATA_W => C_PIX_W + 2)
        port map (aclk => aclk, aresetn => aresetn, s_data => in_skid_s_data, s_valid => s_axis_tvalid,
                  s_ready => s_axis_tready, m_data => in_skid_m_data, m_valid => in_valid, m_ready => in_ready);

    in_pixel <= unsigned(in_skid_m_data(C_PIX_W - 1 downto 0));
    in_user  <= in_skid_m_data(C_PIX_W);
    in_last  <= in_skid_m_data(C_PIX_W + 1);

    -- vstup se přijímá při čekání na SOF (je-li run) a při počítání; při doběhu a výsypu stojí
    input_allowed <= (to_sl(state = STATE_WAIT_SOF) and run) or to_sl(state = STATE_COUNT);
    in_ready      <= pipe_enable and input_allowed;
    accept        <= in_valid and in_ready;

    process (aclk)
        variable counting : boolean;
    begin
        if rising_edge(aclk) then
            frame_done_reg <= '0';
            if aresetn = '0' then
                state           <= STATE_WAIT_SOF;
                count_select    <= (others => '0');
                skipped_pending <= '0';
                early_sof_flag  <= '0';
                status_reg      <= (others => '0');
                counters        <= (others => (others => '0'));
            else
                ---------------------------------------------------------- takt C1: řízení snímku
                counting    := false;
                case state is
                    when STATE_WAIT_SOF =>
                        if height = 0 then                  -- převezme se do začátku snímku
                            last_row <= (others => '0');
                        else
                            last_row <= height - 1;
                        end if;
                        if accept = '1' then
                            if in_user = '1' then
                                state          <= STATE_COUNT;
                                early_sof_flag <= '0';
                                row            <= (others => '0');
                                counting       := true;
                            else
                                skipped_pending <= '1';     -- pixel před TUSER: projde, nepočítá se
                            end if;
                        end if;
                    when STATE_COUNT =>
                        if accept = '1' then
                            counting := true;
                            if in_user = '1' then
                                early_sof_flag <= '1';
                            end if;
                        end if;
                    when STATE_DRAIN =>
                        state         <= STATE_READOUT;     -- v tomto taktu se započte poslední pixel
                        readout_index <= (others => '0');
                    when STATE_READOUT =>
                        readout_index <= readout_index + 1;
                        if readout_index = C_BINS - 1 then
                            state          <= STATE_WAIT_SOF;
                            frame_done_reg <= '1';
                            status_reg(C_ST_SKIPPED)   <= skipped_pending;
                            status_reg(C_ST_EARLY_SOF) <= early_sof_flag;
                            skipped_pending <= '0';
                        end if;
                end case;
                for bin in 0 to C_BINS - 1 loop
                    count_select(bin) <= to_sl(counting and in_pixel = bin);
                end loop;
                if counting then
                    if in_last = '1' then
                        if (state = STATE_WAIT_SOF and height <= 1) or
                           (state = STATE_COUNT and row = last_row) then
                            state <= STATE_DRAIN;
                        else
                            if state = STATE_WAIT_SOF then
                                row <= to_unsigned(1, C_DIM_W);
                            else
                                row <= row + 1;
                            end if;
                        end if;
                    end if;
                end if;

                ---------------------------------------------------------- takt C2: čítače / výsyp
                if state = STATE_READOUT then
                    for bin in 0 to C_BINS - 2 loop
                        counters(bin) <= counters(bin + 1);
                    end loop;
                    counters(C_BINS - 1) <= (others => '0');
                else
                    for bin in 0 to C_BINS - 1 loop
                        if count_select(bin) = '1' then
                            counters(bin) <= counters(bin) + 1;
                        end if;
                    end loop;
                end if;
            end if;
        end if;
    end process;

    result_write_enable <= to_sl(state = STATE_READOUT);
    result_write_addr   <= readout_index;
    result_write_data   <= std_logic_vector(resize(counters(0), 32));
    status              <= status_reg;
    frame_done          <= frame_done_reg;

    -- průchod videa: přijatý paket rovnou do výstupního skid bufferu (jeho ready = pipe_enable)
    output_skid : entity work.axis_skid_buffer
        generic map (G_DATA_W => C_PIX_W + 2)
        port map (aclk => aclk, aresetn => aresetn, s_data => in_skid_m_data, s_valid => accept,
                  s_ready => pipe_enable, m_data => out_skid_m_data, m_valid => m_axis_tvalid,
                  m_ready => m_axis_tready);

    m_axis_tdata <= out_skid_m_data(C_PIX_W - 1 downto 0);
    m_axis_tuser <= out_skid_m_data(C_PIX_W);
    m_axis_tlast <= out_skid_m_data(C_PIX_W + 1);

end architecture;
