--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    rgb2hsv_core.vhd
-- Popis:     Převod RGB -> HSV (celočíselný algoritmus OpenCV, H 0..179), AXI4-Stream Video
--
-- Aritmetika (bitově shodná s golden modelem hsv.c a tedy s cv::cvtColor COLOR_RGB2HSV):
--   V = max(R, G, B), diff = V - min(R, G, B)
--   S = round_shift(diff * sdiv[V], 12),           sdiv[i]    = round((255 << 12) / i)
--   H = round_shift(hue_numerator * hdiv180[diff], 12), hdiv180[i] = round((180 << 12) / (6 * i))
--   hue_numerator = G - B (max v R) | B - R + 2 * diff (max v G) | R - G + 4 * diff (max v B)
--   H < 0 -> H + 180; round_shift(x, 12) = floor((x + 2^11) / 2^12) = aritmetický posun
--
-- Poznámky k návrhu:
--  * Dělení nahrazují dvě tabulky převrácených hodnot (256 položek, generované z golden modelu
--    do imgproc_coeffs_pkg) a dvě násobení v DSP. Proti původní verzi rgb_2_hsv.vhd (Q.8,
--    vlastní tabulka) je výsledek bitově shodný s OpenCV.
--  * Maximální pipeline (8 taktů), každá operace za registrem:
--      takt 1  in_red, in_green, in_blue
--      takt 2  porovnání R>=G, R>=B, G>=B a rozdíly G-B, B-R, R-G (paralelně)
--      takt 3  value_max, value_min, kanál s maximem, výběr rozdílu pro H
--      takt 4  diff = value_max - value_min
--      takt 5  hue_numerator = rozdíl + {0, 2, 4} * diff, čtení tabulek sdiv[V], hdiv180[diff]
--      takt 6  sat_product = diff * sdiv, hue_product = hue_numerator * hdiv180   (DSP, registr M)
--      takt 7  + 2^11 a posun >> 12 (zaokrouhlení half-up)                          (DSP, registr P)
--      takt 8  H < 0 -> + 180, saturace, výstup
--  * Kanál s maximem při rovnosti: přednost R, pak G (shodně s golden modelem / OpenCV).
--  * Šířky se odvozují vzorcem, šířky tabulek z jejich maxima (clog2(max + 1)).
--  * Globální povolení pipe_enable + výstupní skid buffer jako u ostatních jader.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;
use work.imgproc_coeffs_pkg.all;

entity rgb2hsv_core is
    port(
        aclk          : in  std_logic;
        aresetn       : in  std_logic;
        -- AXI4-Stream Video vstup RGB (UG934: [7:0] G, [15:8] B, [23:16] R)
        s_axis_tdata  : in  std_logic_vector(C_RGB_W - 1 downto 0);
        s_axis_tuser  : in  std_logic;
        s_axis_tlast  : in  std_logic;
        s_axis_tvalid : in  std_logic;
        s_axis_tready : out std_logic;
        -- AXI4-Stream Video výstup HSV ([7:0] H, [15:8] S, [23:16] V)
        m_axis_tdata  : out std_logic_vector(C_RGB_W - 1 downto 0);
        m_axis_tuser  : out std_logic;
        m_axis_tlast  : out std_logic;
        m_axis_tvalid : out std_logic;
        m_axis_tready : in  std_logic
    );
end entity;

architecture rtl of rgb2hsv_core is
    -- Šířka čísla bez znaménka potřebná pro největší položku tabulky
    function table_width(table : t_int_table) return natural is
        variable max_value : natural := 0;
    begin
        for idx in table'range loop
            if table(idx) > max_value then
                max_value := table(idx);
            end if;
        end loop;
        return clog2(max_value + 1);
    end function;

    constant C_HUE_RANGE     : natural := 180;
    constant C_HUE_SECTOR_G  : natural := 2; -- offset sektoru (x diff), max v G
    constant C_HUE_SECTOR_B  : natural := 4; -- offset sektoru (x diff), max v B
    constant C_SDIV_W        : natural := table_width(C_HSV_SDIV); -- 20 b
    constant C_HDIV_W        : natural := table_width(C_HSV_HDIV180); -- 17 b
    constant C_DIFF_SIGNED_W : natural := C_PIX_W + 1; -- rozdíl dvou složek se znaménkem
    constant C_SECTOR_TERM_W : natural := C_PIX_W + clog2(C_HUE_SECTOR_B) + 1; -- 4 * diff se znaménkem
    constant C_HUE_NUMER_W   : natural := sum_w(maximum(C_DIFF_SIGNED_W, C_SECTOR_TERM_W), 2);
    constant C_SAT_PRODUCT_W : natural := C_PIX_W + C_SDIV_W; -- diff * sdiv (bez znaménka)
    constant C_HUE_PRODUCT_W : natural := C_HUE_NUMER_W + C_HDIV_W + 1; -- se znaménkem * bez znaménka
    constant C_PIPE_DEPTH    : natural := 8;

    type t_max_channel is (MAX_IS_RED, MAX_IS_GREEN, MAX_IS_BLUE);

    signal pipe_enable : std_logic;

    -- takt 1
    signal in_red, in_green, in_blue                         : t_pix                                  := (others => '0');
    -- takt 2
    signal red_ge_green, red_ge_blue, green_ge_blue          : boolean                                := false;
    signal green_minus_blue, blue_minus_red, red_minus_green : signed(C_DIFF_SIGNED_W - 1 downto 0)   := (others => '0');
    signal red_dly2, green_dly2, blue_dly2                   : t_pix                                  := (others => '0');
    -- takt 3
    signal value_max, value_min                              : t_pix                                  := (others => '0');
    signal max_channel                                       : t_max_channel                          := MAX_IS_RED;
    signal hue_diff_term                                     : signed(C_DIFF_SIGNED_W - 1 downto 0)   := (others => '0');
    -- takt 4
    signal diff                                              : t_pix                                  := (others => '0');
    signal value_max_dly4                                    : t_pix                                  := (others => '0');
    signal max_channel_dly4                                  : t_max_channel                          := MAX_IS_RED;
    signal hue_diff_term_dly4                                : signed(C_DIFF_SIGNED_W - 1 downto 0)   := (others => '0');
    -- takt 5
    signal hue_numerator                                     : signed(C_HUE_NUMER_W - 1 downto 0)     := (others => '0');
    signal sdiv_value                                        : unsigned(C_SDIV_W - 1 downto 0)        := (others => '0');
    signal hdiv_value                                        : unsigned(C_HDIV_W - 1 downto 0)        := (others => '0');
    signal diff_dly5                                         : t_pix                                  := (others => '0');
    signal value_max_dly5                                    : t_pix                                  := (others => '0');
    -- takt 6
    signal sat_product                                       : unsigned(C_SAT_PRODUCT_W - 1 downto 0) := (others => '0');
    signal hue_product                                       : signed(C_HUE_PRODUCT_W - 1 downto 0)   := (others => '0');
    signal value_max_dly6                                    : t_pix                                  := (others => '0');
    -- takt 7
    signal saturation_rounded                                : unsigned(C_SAT_PRODUCT_W - 1 downto 0) := (others => '0');
    signal hue_rounded                                       : signed(C_HUE_PRODUCT_W - 1 downto 0)   := (others => '0');
    signal value_max_dly7                                    : t_pix                                  := (others => '0');
    -- takt 8
    signal out_hue, out_saturation, out_value                : t_pix                                  := (others => '0');

    -- Postranní signály zpožděné o hloubku pipeline
    signal valid_pipe : std_logic_vector(1 to C_PIPE_DEPTH) := (others => '0');
    signal sof_pipe   : std_logic_vector(1 to C_PIPE_DEPTH) := (others => '0');
    signal eol_pipe   : std_logic_vector(1 to C_PIPE_DEPTH) := (others => '0');

    signal skid_in_data  : std_logic_vector(C_RGB_W + 1 downto 0);
    signal skid_out_data : std_logic_vector(C_RGB_W + 1 downto 0);

    constant C_ROUND_HALF : natural := 2 ** (C_HSV_SHIFT - 1);
begin

    s_axis_tready <= pipe_enable;

    process(aclk)
        variable hue_wrapped : signed(C_HUE_PRODUCT_W - C_HSV_SHIFT downto 0);
    begin
        if rising_edge(aclk) then
            if pipe_enable = '1' then
                -- takt 1: vstupy
                in_green <= get_ch(s_axis_tdata, C_IDX_G);
                in_blue  <= get_ch(s_axis_tdata, C_IDX_B);
                in_red   <= get_ch(s_axis_tdata, C_IDX_R);

                -- takt 2: porovnání a rozdíly paralelně
                red_ge_green     <= in_red >= in_green;
                red_ge_blue      <= in_red >= in_blue;
                green_ge_blue    <= in_green >= in_blue;
                green_minus_blue <= signed('0' & in_green) - signed('0' & in_blue);
                blue_minus_red   <= signed('0' & in_blue) - signed('0' & in_red);
                red_minus_green  <= signed('0' & in_red) - signed('0' & in_green);
                red_dly2         <= in_red;
                green_dly2       <= in_green;
                blue_dly2        <= in_blue;

                -- takt 3: maximum, minimum a kanál s maximem (přednost R, pak G)
                if red_ge_green and red_ge_blue then
                    value_max     <= red_dly2;
                    max_channel   <= MAX_IS_RED;
                    hue_diff_term <= green_minus_blue;
                elsif green_ge_blue then
                    value_max     <= green_dly2;
                    max_channel   <= MAX_IS_GREEN;
                    hue_diff_term <= blue_minus_red;
                else
                    value_max     <= blue_dly2;
                    max_channel   <= MAX_IS_BLUE;
                    hue_diff_term <= red_minus_green;
                end if;
                -- minimum: R, když je menší než G i B; jinak menší z G a B
                if (not red_ge_green) and (not red_ge_blue) then
                    value_min <= red_dly2;
                elsif not green_ge_blue then
                    value_min <= green_dly2;
                else
                    value_min <= blue_dly2;
                end if;

                -- takt 4: rozdíl max - min
                diff               <= value_max - value_min;
                value_max_dly4     <= value_max;
                max_channel_dly4   <= max_channel;
                hue_diff_term_dly4 <= hue_diff_term;

                -- takt 5: čitatel H a tabulky převrácených hodnot
                case max_channel_dly4 is
                    when MAX_IS_RED =>
                        hue_numerator <= resize(hue_diff_term_dly4, C_HUE_NUMER_W);
                    when MAX_IS_GREEN =>
                        hue_numerator <= resize(hue_diff_term_dly4, C_HUE_NUMER_W) + signed(resize(diff, C_HUE_NUMER_W) sll clog2(C_HUE_SECTOR_G));
                    when MAX_IS_BLUE =>
                        hue_numerator <= resize(hue_diff_term_dly4, C_HUE_NUMER_W) + signed(resize(diff, C_HUE_NUMER_W) sll clog2(C_HUE_SECTOR_B));
                end case;
                sdiv_value     <= to_unsigned(C_HSV_SDIV(to_integer(value_max_dly4)), C_SDIV_W);
                hdiv_value     <= to_unsigned(C_HSV_HDIV180(to_integer(diff)), C_HDIV_W);
                diff_dly5      <= diff;
                value_max_dly5 <= value_max_dly4;

                -- takt 6: součiny (DSP)
                sat_product    <= diff_dly5 * sdiv_value;
                hue_product    <= hue_numerator * signed('0' & hdiv_value);
                value_max_dly6 <= value_max_dly5;

                -- takt 7: zaokrouhlení half-up a posun
                saturation_rounded <= shift_right(sat_product + C_ROUND_HALF, C_HSV_SHIFT);
                hue_rounded        <= shift_right(hue_product + C_ROUND_HALF, C_HSV_SHIFT);
                value_max_dly7     <= value_max_dly6;

                -- takt 8: H < 0 -> + 180, saturace, výstup
                hue_wrapped    := resize(hue_rounded, hue_wrapped'length);
                if hue_wrapped < 0 then
                    hue_wrapped := hue_wrapped + C_HUE_RANGE;
                end if;
                out_hue        <= sat_u8(hue_wrapped);
                out_saturation <= resize(saturation_rounded, C_PIX_W);
                out_value      <= value_max_dly7;

                sof_pipe <= s_axis_tuser & sof_pipe(1 to C_PIPE_DEPTH - 1);
                eol_pipe <= s_axis_tlast & eol_pipe(1 to C_PIPE_DEPTH - 1);
            end if;

            if aresetn = '0' then
                valid_pipe <= (others => '0');
            elsif pipe_enable = '1' then
                valid_pipe <= s_axis_tvalid & valid_pipe(1 to C_PIPE_DEPTH - 1);
            end if;
        end if;
    end process;

    skid_in_data <= eol_pipe(C_PIPE_DEPTH) & sof_pipe(C_PIPE_DEPTH) & pack3(out_hue, out_saturation, out_value);

    skid : entity work.axis_skid_buffer
        generic map(G_DATA_W => C_RGB_W + 2)
        port map(aclk    => aclk, aresetn => aresetn, s_data => skid_in_data, s_valid => valid_pipe(C_PIPE_DEPTH),
                 s_ready => pipe_enable, m_data => skid_out_data, m_valid => m_axis_tvalid, m_ready => m_axis_tready);

    m_axis_tdata <= skid_out_data(C_RGB_W - 1 downto 0);
    m_axis_tuser <= skid_out_data(C_RGB_W);
    m_axis_tlast <= skid_out_data(C_RGB_W + 1);

end architecture;
