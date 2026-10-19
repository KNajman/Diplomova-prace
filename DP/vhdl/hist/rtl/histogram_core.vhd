--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    histogram_core.vhd
-- Popis:     Histogram jasu (256 košů) s průchozím videem (bypass), dvě architektury paměti košů
--
-- Výsledek bitově shodný s imgproc_histogram() golden modelu a s HLS jádrem hls_histogram.
--
-- Poznámky k návrhu:
--  * G_USE_BRAM = false: 256 samostatných čítačů (FF). Pixel zvýší jen svůj čítač (povolení z
--    registrovaného one-hot dekodéru), read-modify-write ani forwarding nejsou potřeba. Výsyp:
--    čítače se zapojí jako posuvný registr (bez multiplexoru 256:1) a zasouvá se nula.
--    Cena: 256 x 23 FF + inkrementátory (~6 tis. LUT/FF) - ukázka "logika místo paměti".
--  * G_USE_BRAM = true: koše v BRAM (simple dual port) jako v HLS. Read-modify-write v pipeline:
--      A: operace (koš) z řízení     -> adresa čtení BRAM
--      B: přečtená hodnota            + příznaky shody s operacemi v C a D (registrované už v A->B)
--      C: nová hodnota = základ + 1   (základ = C, D nebo BRAM podle příznaků) -> zápis do BRAM
--      D: poslední zapsaná hodnota    (BRAM ji při čtení ve stejném taktu ještě nevrací - read-first)
--    Forwarding ze 2 předchozích operací (C, D) - stejná úloha jako fwd_bin/fwd_cnt v HLS, jen
--    hloubka plyne přímo z pipeline. Pipeline běží každý takt (bubliny = operace bez zápisu).
--  * Šířka koše vzorcem: clog2(G_MAX_WIDTH * G_MAX_HEIGHT + 1) = 23 b pro 4K.
--  * Řízení snímku je společné: operace "count" (pixel), "readout" (koš do výsledkové paměti
--    a vynulování - kopie i nulování v jednom průchodu, 256 taktů na snímek; HLS 2 x 256) a
--    "clear" (vynulování po resetu - obsah BRAM resetem nezmizí). Výsyp začne hned po posledním
--    pixelu, operace jdou stejnou pipeline za pixely, takže doběh pipeline není potřeba čekat.
--  * Jedno "volání" = jeden snímek: registr height, šířku ohraničuje TLAST. Během výsypu vstup
--    stojí (TREADY = 0). Video prochází beze změny přes vstupní a výstupní skid buffer.
--  * Resynchronizace jako HLS: před TUSER se pixely propouštějí a nepočítají (status bit0
--    SKIPPED), TUSER uprostřed snímku jen označí snímek (bit1 EARLY_SOF) a počítání pokračuje do
--    výšky snímku. Nový snímek začne jen při run = 1.
--  * frame_done = 1taktový pulz, když je ve výsledkové paměti zapsaný poslední koš (ap_done).
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;

entity histogram_core is
    generic (
        G_MAX_WIDTH  : positive := C_MAX_WIDTH;
        G_MAX_HEIGHT : positive := C_MAX_HEIGHT;
        G_USE_BRAM   : boolean  := true
    );
    port (
        aclk                : in  std_logic;
        aresetn             : in  std_logic;
        run                 : in  std_logic;
        height              : in  unsigned(C_DIM_W - 1 downto 0);
        status              : out std_logic_vector(1 downto 0);
        frame_done          : out std_logic;
        -- výsledková paměť (256 x 32 b, zápis při výsypu)
        result_write_enable : out std_logic;
        result_write_addr   : out unsigned(C_PIX_W - 1 downto 0);
        result_write_data   : out std_logic_vector(31 downto 0);
        -- AXI4-Stream Video vstup (8 b)
        s_axis_tdata        : in  std_logic_vector(C_PIX_W - 1 downto 0);
        s_axis_tuser        : in  std_logic;
        s_axis_tlast        : in  std_logic;
        s_axis_tvalid       : in  std_logic;
        s_axis_tready       : out std_logic;
        -- AXI4-Stream Video výstup (kopie vstupu)
        m_axis_tdata        : out std_logic_vector(C_PIX_W - 1 downto 0);
        m_axis_tuser        : out std_logic;
        m_axis_tlast        : out std_logic;
        m_axis_tvalid       : out std_logic;
        m_axis_tready       : in  std_logic
    );
end entity;

architecture rtl of histogram_core is
    constant C_BINS    : natural := C_HIST_BINS;
    constant C_COUNT_W : natural := clog2(G_MAX_WIDTH * G_MAX_HEIGHT + 1);

    -- počet hran od registrace operace (A) do zápisu výsledku (čítače: 1, BRAM: A->B->C = 2)
    function result_latency(use_bram : boolean) return natural is
    begin
        if use_bram then
            return 2;
        end if;
        return 1;
    end function;
    constant C_RESULT_LATENCY : natural := result_latency(G_USE_BRAM);

    subtype t_count is unsigned(C_COUNT_W - 1 downto 0);
    type t_state is (STATE_CLEAR, STATE_WAIT_SOF, STATE_COUNT, STATE_READOUT);

    signal state         : t_state := STATE_CLEAR;
    signal last_row      : unsigned(C_DIM_W - 1 downto 0) := (others => '0'); -- height - 1 (0 pro height = 0, jako HLS)
    signal row           : unsigned(C_DIM_W - 1 downto 0) := (others => '0');
    signal sweep_index   : unsigned(C_PIX_W - 1 downto 0) := (others => '0');  -- koš při výsypu / nulování

    -- operace pro paměť košů (takt A, registry)
    signal op_count      : std_logic := '0';
    signal op_readout    : std_logic := '0';
    signal op_clear      : std_logic := '0';
    signal op_bin        : t_pix := (others => '0');
    signal op_select     : std_logic_vector(C_BINS - 1 downto 0) := (others => '0'); -- one-hot op_count (čítače)

    signal done_pipe     : std_logic_vector(0 to C_RESULT_LATENCY) := (others => '0');
    signal skipped_pending, early_sof_flag : std_logic := '0';
    signal status_reg    : std_logic_vector(1 downto 0) := (others => '0');

    -- výsledek z paměti košů
    signal result_enable_reg : std_logic := '0';
    signal result_addr_reg   : t_pix := (others => '0');
    signal result_data_reg   : t_count := (others => '0');

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

    -- vstup se přijímá při čekání na SOF (je-li run) a při počítání; při výsypu a nulování stojí
    input_allowed <= (to_sl(state = STATE_WAIT_SOF) and run) or to_sl(state = STATE_COUNT);
    in_ready      <= pipe_enable and input_allowed;
    accept        <= in_valid and in_ready;

    ------------------------------------------------------------------------------ řízení snímku
    frame_control : process (aclk)
        variable counting  : boolean;
        variable frame_end : boolean;
    begin
        if rising_edge(aclk) then
            counting  := false;
            frame_end := false;
            case state is
                when STATE_CLEAR | STATE_READOUT =>
                    sweep_index <= sweep_index + 1;
                    if sweep_index = C_BINS - 1 then
                        if state = STATE_READOUT then
                            status_reg(C_ST_SKIPPED)   <= skipped_pending;
                            status_reg(C_ST_EARLY_SOF) <= early_sof_flag;
                            skipped_pending <= '0';
                        end if;
                        state <= STATE_WAIT_SOF;
                    end if;
                when STATE_WAIT_SOF =>
                    if height = 0 then                      -- převezme se do začátku snímku
                        last_row <= (others => '0');
                    else
                        last_row <= height - 1;
                    end if;
                    if accept = '1' then
                        if in_user = '1' then
                            state          <= STATE_COUNT;
                            early_sof_flag <= '0';
                            counting       := true;
                            frame_end      := (in_last = '1') and (height <= 1);
                            row            <= to_unsigned(1, C_DIM_W);  -- platí jen když řádek skončí (TLAST)
                        else
                            skipped_pending <= '1';         -- pixel před TUSER: projde, nepočítá se
                        end if;
                    end if;
                when STATE_COUNT =>
                    if accept = '1' then
                        counting := true;
                        if in_user = '1' then
                            early_sof_flag <= '1';
                        end if;
                        if in_last = '1' then
                            frame_end := (row = last_row);
                            row       <= row + 1;
                        end if;
                    end if;
            end case;
            if state = STATE_WAIT_SOF and not (counting and in_last = '1') then
                row <= (others => '0');
            end if;
            if frame_end then
                state       <= STATE_READOUT;
                sweep_index <= (others => '0');
            end if;

            -- operace pro paměť košů (takt A)
            op_count   <= to_sl(counting);
            op_readout <= to_sl(state = STATE_READOUT);
            op_clear   <= to_sl(state = STATE_CLEAR);
            if counting then
                op_bin <= in_pixel;
            else
                op_bin <= sweep_index;
            end if;
            for bin in 0 to C_BINS - 1 loop
                op_select(bin) <= to_sl(counting and in_pixel = bin);
            end loop;

            -- frame_done až po zápisu posledního koše do výsledkové paměti
            done_pipe <= to_sl(state = STATE_READOUT and sweep_index = C_BINS - 1) & done_pipe(0 to C_RESULT_LATENCY - 1);

            if aresetn = '0' then
                state           <= STATE_CLEAR;
                sweep_index     <= (others => '0');
                op_count        <= '0';
                op_readout      <= '0';
                op_clear        <= '0';
                op_select       <= (others => '0');
                done_pipe       <= (others => '0');
                skipped_pending <= '0';
                early_sof_flag  <= '0';
                status_reg      <= (others => '0');
            end if;
        end if;
    end process;

    ------------------------------------------------------------------------------ koše v čítačích
    gen_counters : if not G_USE_BRAM generate
        type t_counter_array is array (0 to C_BINS - 1) of t_count;
        signal counters : t_counter_array := (others => (others => '0'));
    begin
        process (aclk)
        begin
            if rising_edge(aclk) then
                result_enable_reg <= op_readout;
                result_addr_reg   <= op_bin;
                result_data_reg   <= counters(0);
                if op_readout = '1' or op_clear = '1' then
                    -- posuvný registr: koš 0 jde do výsledku, zasouvá se nula (operace jdou po koších 0..255)
                    for bin in 0 to C_BINS - 2 loop
                        counters(bin) <= counters(bin + 1);
                    end loop;
                    counters(C_BINS - 1) <= (others => '0');
                else
                    for bin in 0 to C_BINS - 1 loop
                        if op_select(bin) = '1' then
                            counters(bin) <= counters(bin) + 1;
                        end if;
                    end loop;
                end if;
            end if;
        end process;
    end generate;

    ------------------------------------------------------------------------------ koše v BRAM
    gen_bram : if G_USE_BRAM generate
        type t_bin_memory is array (0 to C_BINS - 1) of t_count;
        signal bin_memory : t_bin_memory := (others => (others => '0'));
        attribute ram_style : string;
        attribute ram_style of bin_memory : signal is "block";

        -- takt B
        signal b_read_count  : t_count := (others => '0');
        signal b_bin         : t_pix := (others => '0');
        signal b_count, b_readout, b_write : std_logic := '0';
        signal b_hit_c, b_hit_d : std_logic := '0';     -- koš shodný s operací, která je teď v C / D
        -- takt C (zápis do BRAM)
        signal c_count_value : t_count := (others => '0');
        signal c_bin         : t_pix := (others => '0');
        signal c_write       : std_logic := '0';
        -- takt D (zapsáno, BRAM to při současném čtení ještě nevrací)
        signal d_count_value : t_count := (others => '0');
        signal d_bin         : t_pix := (others => '0');
        signal d_write       : std_logic := '0';
    begin
        process (aclk)
            variable base_count : t_count;
        begin
            if rising_edge(aclk) then
                -- A -> B: čtení BRAM a příznaky shody (operace v B a C se v tomto taktu posunou do C a D)
                b_read_count <= bin_memory(to_integer(op_bin));
                b_bin        <= op_bin;
                b_count      <= op_count;
                b_readout    <= op_readout;
                b_write      <= op_count or op_readout or op_clear;
                b_hit_c      <= b_write and to_sl(op_bin = b_bin);
                b_hit_d      <= c_write and to_sl(op_bin = c_bin);

                -- B -> C: základ s forwardingem, nová hodnota (count +1, readout/clear 0), výsledek
                if b_hit_c = '1' then
                    base_count := c_count_value;
                elsif b_hit_d = '1' then
                    base_count := d_count_value;
                else
                    base_count := b_read_count;
                end if;
                if b_count = '1' then
                    c_count_value <= base_count + 1;
                else
                    c_count_value <= (others => '0');
                end if;
                c_bin   <= b_bin;
                c_write <= b_write;
                result_enable_reg <= b_readout;
                result_addr_reg   <= b_bin;
                result_data_reg   <= base_count;

                -- C -> D: zápis do BRAM
                if c_write = '1' then
                    bin_memory(to_integer(c_bin)) <= c_count_value;
                end if;
                d_count_value <= c_count_value;
                d_bin         <= c_bin;
                d_write       <= c_write;

                if aresetn = '0' then
                    b_write <= '0';
                    c_write <= '0';
                    d_write <= '0';
                    b_count <= '0';
                    b_readout <= '0';
                    result_enable_reg <= '0';
                end if;
            end if;
        end process;
    end generate;

    result_write_enable <= result_enable_reg;
    result_write_addr   <= result_addr_reg;
    result_write_data   <= std_logic_vector(resize(result_data_reg, 32));
    status              <= status_reg;
    frame_done          <= done_pipe(C_RESULT_LATENCY);

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
