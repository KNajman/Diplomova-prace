--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    filter2d_core.vhd
-- Popis:     2D konvoluce K x K šedotónového videa (mean, zostření, Sobel, ...), AXI4-Stream Video
--
-- Aritmetika (bitově shodná s golden modelem filter.c, sémantika cv::filter2D = korelace):
--   acc = sum_{r,c}(coeff[r][c] * window[r][c])           přesně, bez zaokrouhlení
--   out = saturate_0_255(((acc * scale_q14 + 2^13) >> 14) + delta)
--
-- Poznámky k návrhu:
--  * Okno K x K dodává window_gen (stejný jako u mediánu): okraj nuly / replikace, SAME, flush,
--    resynchronizace, stavový registr.
--  * Maximální pipeline, každá operace za registrem:
--      takt P       K * K součinů koeficient * pixel (8 b se znaménkem x 9 b)
--      takty T1..TL sčítací strom po dvojicích, L = clog2(K * K) úrovní (3x3: 4, 7x7: 6)
--      takt S1      acc * scale (DSP)
--      takt S2      + 2^13 a aritmetický posun >> 14 (zaokrouhlení half-up)
--      takt S3      + delta, saturace 0..255
--  * Šířky vzorcem: součin = 8 + 9 b, součet K * K členů = sum_w(součin, K * K)
--    (3x3: 21 b, 7x7: 23 b), škálovaný součet = součet + 18 b.
--  * G_USE_DSP: součiny 8 x 9 b syntéza (auto) obvykle dá do LUT; "yes" je vynutí do DSP
--    (K * K DSP - u 7x7 49 DSP). Volba = výměna LUT za DSP.
--  * Koeficienty, scale a delta jsou porty (registry AXI4-Lite), mění se mezi snímky.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;

entity filter2d_core is
    generic (
        G_K         : positive := 3;            -- velikost jádra (3, 5, 7)
        G_MAX_WIDTH : positive := C_MAX_WIDTH;
        G_USE_DSP   : boolean  := false
    );
    port (
        aclk             : in  std_logic;
        aresetn          : in  std_logic;
        run              : in  std_logic;
        width            : in  unsigned(C_DIM_W - 1 downto 0);
        height           : in  unsigned(C_DIM_W - 1 downto 0);
        border_replicate : in  std_logic;
        coeff            : in  t_filter_coeff_array(0 to G_K * G_K - 1);    -- [řádek * K + sloupec]
        scale            : in  signed(C_FILTER_SCALE_W - 1 downto 0);
        delta            : in  signed(C_FILTER_DELTA_W - 1 downto 0);
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

architecture rtl of filter2d_core is
    constant C_TAPS           : natural := G_K * G_K;
    constant C_TREE_LEVELS    : natural := clog2(C_TAPS);
    constant C_PIXEL_SIGNED_W : natural := C_PIX_W + 1;
    constant C_PRODUCT_W      : natural := C_FILTER_COEFF_W + C_PIXEL_SIGNED_W;
    constant C_SUM_W          : natural := sum_w(C_PRODUCT_W, C_TAPS);
    constant C_SCALED_W       : natural := C_SUM_W + C_FILTER_SCALE_W;
    constant C_ROUNDED_W      : natural := C_SCALED_W - C_FILTER_FRAC_W + 1;
    constant C_OFFSET_W       : natural := sum_w(maximum(C_ROUNDED_W, C_FILTER_DELTA_W), 2);
    constant C_OP_DEPTH       : natural := 1 + C_TREE_LEVELS + 3;       -- P, T1..TL, S1..S3
    constant C_ROUND_HALF     : signed(C_SCALED_W - 1 downto 0) := shift_left(to_signed(1, C_SCALED_W), C_FILTER_FRAC_W - 1);

    -- Počet členů v úrovni stromu (úroveň 0 = součiny): n(l) = ceil(n(l - 1) / 2)
    function tree_count(level : natural) return natural is
        variable count : natural := C_TAPS;
    begin
        for step in 1 to level loop
            count := (count + 1) / 2;
        end loop;
        return count;
    end function;

    function dsp_style(use_dsp : boolean) return string is
    begin
        if use_dsp then
            return "yes";
        end if;
        return "auto";
    end function;

    type t_product_array is array (0 to C_TAPS - 1) of signed(C_PRODUCT_W - 1 downto 0);
    type t_sum_array     is array (0 to C_TAPS - 1) of signed(C_SUM_W - 1 downto 0);
    type t_tree          is array (1 to C_TREE_LEVELS) of t_sum_array;

    signal pipe_enable : std_logic;

    signal in_skid_s_data, in_skid_m_data : std_logic_vector(C_PIX_W + 1 downto 0);
    signal in_valid, in_ready : std_logic;

    signal window           : t_window(0 to G_K - 1, 0 to G_K - 1);
    signal window_valid     : std_logic;
    signal window_sof       : std_logic;
    signal window_eol       : std_logic;
    signal window_frame_end : std_logic;

    signal products      : t_product_array := (others => (others => '0'));                     -- P
    signal adder_tree    : t_tree := (others => (others => (others => '0')));                   -- T1..TL
    signal scaled_sum    : signed(C_SCALED_W - 1 downto 0) := (others => '0');                   -- S1
    signal rounded_value : signed(C_ROUNDED_W - 1 downto 0) := (others => '0');                  -- S2
    signal out_pixel     : t_pix := (others => '0');                                            -- S3
    signal valid_pipe, sof_pipe, eol_pipe, frame_end_pipe : std_logic_vector(1 to C_OP_DEPTH) := (others => '0');

    constant C_DSP_STYLE : string := dsp_style(G_USE_DSP);
    attribute use_dsp : string;
    attribute use_dsp of products : signal is C_DSP_STYLE;

    signal out_skid_s_data, out_skid_m_data : std_logic_vector(C_PIX_W + 1 downto 0);
    signal out_valid : std_logic;
begin

    in_skid_s_data <= s_axis_tlast & s_axis_tuser & s_axis_tdata;
    input_skid : entity work.axis_skid_buffer
        generic map (G_DATA_W => C_PIX_W + 2)
        port map (aclk => aclk, aresetn => aresetn, s_data => in_skid_s_data, s_valid => s_axis_tvalid,
                  s_ready => s_axis_tready, m_data => in_skid_m_data, m_valid => in_valid, m_ready => in_ready);

    window_generator : entity work.window_gen
        generic map (G_K => G_K, G_MAX_WIDTH => G_MAX_WIDTH)
        port map (aclk => aclk, aresetn => aresetn, pipe_enable => pipe_enable, run => run,
                  width => width, height => height, border_replicate => border_replicate,
                  in_data => unsigned(in_skid_m_data(C_PIX_W - 1 downto 0)), in_user => in_skid_m_data(C_PIX_W),
                  in_last => in_skid_m_data(C_PIX_W + 1), in_valid => in_valid, in_ready => in_ready,
                  win => window, win_valid => window_valid, win_sof => window_sof, win_eol => window_eol,
                  win_frame_end => window_frame_end, status => status);

    process (aclk)
        variable offset_value : signed(C_OFFSET_W - 1 downto 0);
        variable lower_count  : natural;
    begin
        if rising_edge(aclk) then
            if pipe_enable = '1' then
                -- P: součiny
                for row in 0 to G_K - 1 loop
                    for col in 0 to G_K - 1 loop
                        products(row * G_K + col) <= coeff(row * G_K + col) * signed('0' & window(row, col));
                    end loop;
                end loop;
                -- T1..TL: sčítací strom po dvojicích
                for level in 1 to C_TREE_LEVELS loop
                    lower_count := tree_count(level - 1);
                    for idx in 0 to tree_count(level) - 1 loop
                        if level = 1 then
                            if 2 * idx + 1 < lower_count then
                                adder_tree(level)(idx) <= resize(products(2 * idx), C_SUM_W)
                                                          + resize(products(2 * idx + 1), C_SUM_W);
                            else
                                adder_tree(level)(idx) <= resize(products(2 * idx), C_SUM_W);
                            end if;
                        else
                            if 2 * idx + 1 < lower_count then
                                adder_tree(level)(idx) <= adder_tree(level - 1)(2 * idx) + adder_tree(level - 1)(2 * idx + 1);
                            else
                                adder_tree(level)(idx) <= adder_tree(level - 1)(2 * idx);
                            end if;
                        end if;
                    end loop;
                end loop;
                -- S1: normalizace
                scaled_sum <= adder_tree(C_TREE_LEVELS)(0) * scale;
                -- S2: zaokrouhlení half-up a posun
                rounded_value <= resize(shift_right(scaled_sum + C_ROUND_HALF, C_FILTER_FRAC_W), C_ROUNDED_W);
                -- S3: delta a saturace
                offset_value := resize(rounded_value, C_OFFSET_W) + resize(delta, C_OFFSET_W);
                out_pixel <= sat_u8(offset_value);

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

    out_skid_s_data <= eol_pipe(C_OP_DEPTH) & sof_pipe(C_OP_DEPTH) & std_logic_vector(out_pixel);
    output_skid : entity work.axis_skid_buffer
        generic map (G_DATA_W => C_PIX_W + 2)
        port map (aclk => aclk, aresetn => aresetn, s_data => out_skid_s_data, s_valid => out_valid,
                  s_ready => pipe_enable, m_data => out_skid_m_data, m_valid => m_axis_tvalid,
                  m_ready => m_axis_tready);

    m_axis_tdata <= out_skid_m_data(C_PIX_W - 1 downto 0);
    m_axis_tuser <= out_skid_m_data(C_PIX_W);
    m_axis_tlast <= out_skid_m_data(C_PIX_W + 1);

end architecture;
