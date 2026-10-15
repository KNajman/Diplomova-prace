--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    hsv2rgb_core.vhd
-- Popis:     Převod HSV -> RGB (H 0..179, S, V 0..255), AXI4-Stream Video
--
-- Aritmetika (bitově shodná s golden modelem hsv.c; OpenCV počítá HSV -> RGB přes float,
-- bitová shoda s ním proto není možná, odchylka max. ±2):
--   H >= 180 -> 0, region = (H * 2185) >> 16 (= H / 30), remainder = H - 30 * region
--   f = 8 * remainder + remainder / 2   (= remainder * 255 / 30)
--   p = div255(V * (255 - S)),  q = div255(V * (255 - div255(S * f))),
--   t = div255(V * (255 - div255(S * (255 - f)))),  div255(x) = (x + 1 + (x >> 8)) >> 8
--   (R, G, B) podle sektoru 0..5: (V,t,p) (q,V,p) (p,V,t) (p,q,V) (t,p,V) (V,p,q); S = 0 -> (V,V,V)
--
-- Poznámky k návrhu:
--  * Žádné dělení: H / 30 násobením převrácenou hodnotou, x / 255 přibližným vzorcem div255
--    (sčítačka + posun), oboje shodně s golden modelem a HLS.
--  * Maximální pipeline (13 taktů), každá operace za registrem:
--      1 vstupy | 2 H >= 180 -> 0, 255 - S | 3 H * 2185, V * (255 - S) | 4 region, p = div255
--      5 remainder | 6 f | 7 255 - f | 8 S * f, S * (255 - f) | 9 div255 | 10 255 - ...
--      11 V * ... | 12 q, t = div255 | 13 výběr podle sektoru
--  * Šířky se odvozují vzorcem (součin = Wa + Wb, součet = max(W) + clog2(N)).
--  * Globální povolení pipe_enable + výstupní skid buffer jako u ostatních jader.
--  * G_USE_DSP: výchozí syntéza (use_dsp = auto) dá malá násobení 8x8 b do LUT (1 DSP, 564 LUT,
--    kritická cesta S * (255 - f) přes 3x CARRY8). Atribut use_dsp = "yes" je vynutí do DSP -
--    výměna LUT za DSP, volba podle srovnání s HLS.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;

entity hsv2rgb_core is
    generic (
        G_USE_DSP : boolean := false    -- true = násobení vždy v DSP (use_dsp = "yes"), false = rozhodne syntéza
    );
    port (
        aclk          : in  std_logic;
        aresetn       : in  std_logic;
        -- AXI4-Stream Video vstup HSV ([7:0] H, [15:8] S, [23:16] V)
        s_axis_tdata  : in  std_logic_vector(C_RGB_W - 1 downto 0);
        s_axis_tuser  : in  std_logic;
        s_axis_tlast  : in  std_logic;
        s_axis_tvalid : in  std_logic;
        s_axis_tready : out std_logic;
        -- AXI4-Stream Video výstup RGB (UG934: [7:0] G, [15:8] B, [23:16] R)
        m_axis_tdata  : out std_logic_vector(C_RGB_W - 1 downto 0);
        m_axis_tuser  : out std_logic;
        m_axis_tlast  : out std_logic;
        m_axis_tvalid : out std_logic;
        m_axis_tready : in  std_logic
    );
end entity;

architecture rtl of hsv2rgb_core is
    constant C_HUE_RANGE         : natural := 180;
    constant C_PIXEL_MAX         : natural := 2 ** C_PIX_W - 1;                 -- 255
    constant C_SECTOR_WIDTH      : natural := 30;                               -- 60 stupňů / 2
    constant C_SECTOR_RECIP      : natural := 2185;                             -- round(2^16 / 30)
    constant C_SECTOR_RECIP_SHIFT : natural := 16;
    constant C_LAST_SECTOR       : natural := 5;

    constant C_REGION_PRODUCT_W  : natural := C_PIX_W + clog2(C_SECTOR_RECIP + 1);
    constant C_REGION_W          : natural := clog2(C_LAST_SECTOR + 1);
    constant C_REMAINDER_W       : natural := clog2(C_SECTOR_WIDTH);
    constant C_FRACTION_W        : natural := sum_w(C_REMAINDER_W + 3, 2);      -- 8 * rem + rem / 2
    constant C_PRODUCT_W         : natural := C_PIX_W + C_FRACTION_W;           -- 8b * f (největší součin)
    constant C_PIPE_DEPTH        : natural := 13;

    -- x / 255 přibližně: (x + 1 + (x >> 8)) >> 8 (výsledek 0..255 pro x <= 255 * 255)
    function div255(x : unsigned) return t_pix is
        constant C_SUM_W : natural := sum_w(x'length, 3);
        variable sum     : unsigned(C_SUM_W - 1 downto 0);
    begin
        sum := resize(x, C_SUM_W) + 1 + resize(shift_right(x, C_PIX_W), C_SUM_W);
        return resize(shift_right(sum, C_PIX_W), C_PIX_W);
    end function;

    signal pipe_enable : std_logic;

    -- Postranní signály a S, V zpožďované spolu s výpočtem (index = takt)
    type t_pix_pipe is array (1 to C_PIPE_DEPTH) of t_pix;
    signal saturation_pipe : t_pix_pipe := (others => (others => '0'));
    signal value_pipe      : t_pix_pipe := (others => (others => '0'));
    signal valid_pipe      : std_logic_vector(1 to C_PIPE_DEPTH) := (others => '0');
    signal sof_pipe        : std_logic_vector(1 to C_PIPE_DEPTH) := (others => '0');
    signal eol_pipe        : std_logic_vector(1 to C_PIPE_DEPTH) := (others => '0');

    -- takty 1..13
    signal in_hue              : t_pix := (others => '0');                                    -- 1
    signal hue_clamped         : t_pix := (others => '0');                                    -- 2
    signal inv_saturation      : t_pix := (others => '0');                                    -- 2
    signal region_product      : unsigned(C_REGION_PRODUCT_W - 1 downto 0) := (others => '0'); -- 3
    signal p_product           : unsigned(2 * C_PIX_W - 1 downto 0) := (others => '0');        -- 3
    signal hue_dly3            : t_pix := (others => '0');
    signal region              : unsigned(C_REGION_W - 1 downto 0) := (others => '0');         -- 4
    signal p_value             : t_pix := (others => '0');                                    -- 4
    signal hue_dly4            : t_pix := (others => '0');
    signal remainder           : unsigned(C_REMAINDER_W - 1 downto 0) := (others => '0');      -- 5
    signal fraction            : unsigned(C_FRACTION_W - 1 downto 0) := (others => '0');       -- 6
    signal inv_fraction        : unsigned(C_FRACTION_W - 1 downto 0) := (others => '0');       -- 7
    signal fraction_dly7       : unsigned(C_FRACTION_W - 1 downto 0) := (others => '0');
    signal sat_f_product       : unsigned(C_PRODUCT_W - 1 downto 0) := (others => '0');        -- 8
    signal sat_inv_f_product   : unsigned(C_PRODUCT_W - 1 downto 0) := (others => '0');        -- 8
    signal sat_f               : t_pix := (others => '0');                                    -- 9
    signal sat_inv_f           : t_pix := (others => '0');                                    -- 9
    signal q_factor            : t_pix := (others => '0');                                    -- 10
    signal t_factor            : t_pix := (others => '0');                                    -- 10
    signal q_product           : unsigned(2 * C_PIX_W - 1 downto 0) := (others => '0');        -- 11
    signal t_product           : unsigned(2 * C_PIX_W - 1 downto 0) := (others => '0');        -- 11
    signal q_value             : t_pix := (others => '0');                                    -- 12
    signal t_value             : t_pix := (others => '0');                                    -- 12
    signal out_red, out_green, out_blue : t_pix := (others => '0');                           -- 13

    -- region a p se počítají v taktu 4, používají v taktu 13
    type t_region_pipe is array (5 to C_PIPE_DEPTH - 1) of unsigned(C_REGION_W - 1 downto 0);
    type t_p_pipe      is array (5 to C_PIPE_DEPTH - 1) of t_pix;
    signal region_pipe : t_region_pipe := (others => (others => '0'));
    signal p_pipe      : t_p_pipe := (others => (others => '0'));

    signal skid_in_data  : std_logic_vector(C_RGB_W + 1 downto 0);
    signal skid_out_data : std_logic_vector(C_RGB_W + 1 downto 0);

    -- Umístění násobení: "yes" = DSP48E2, "auto" = rozhodne syntéza (malé součiny obvykle do LUT)
    function dsp_style(use_dsp : boolean) return string is
    begin
        if use_dsp then
            return "yes";
        end if;
        return "auto";
    end function;
    constant C_DSP_STYLE : string := dsp_style(G_USE_DSP);
    attribute use_dsp : string;
    attribute use_dsp of region_product    : signal is C_DSP_STYLE;
    attribute use_dsp of p_product         : signal is C_DSP_STYLE;
    attribute use_dsp of sat_f_product     : signal is C_DSP_STYLE;
    attribute use_dsp of sat_inv_f_product : signal is C_DSP_STYLE;
    attribute use_dsp of q_product         : signal is C_DSP_STYLE;
    attribute use_dsp of t_product         : signal is C_DSP_STYLE;
begin

    s_axis_tready <= pipe_enable;

    process (aclk)
        variable region_raw      : unsigned(C_REGION_PRODUCT_W - C_SECTOR_RECIP_SHIFT - 1 downto 0);
        variable sector          : natural range 0 to C_LAST_SECTOR;
        variable value_final     : t_pix;
        variable p_final         : t_pix;
    begin
        if rising_edge(aclk) then
            if pipe_enable = '1' then
                -- takt 1: vstupy
                in_hue             <= get_ch(s_axis_tdata, 0);
                saturation_pipe(1) <= get_ch(s_axis_tdata, 1);
                value_pipe(1)      <= get_ch(s_axis_tdata, 2);

                -- takt 2: H mimo rozsah -> 0, doplněk saturace
                if in_hue >= C_HUE_RANGE then
                    hue_clamped <= (others => '0');
                else
                    hue_clamped <= in_hue;
                end if;
                inv_saturation <= C_PIXEL_MAX - saturation_pipe(1);

                -- takt 3: H / 30 převrácenou hodnotou, V * (255 - S)
                region_product <= hue_clamped * to_unsigned(C_SECTOR_RECIP, C_REGION_PRODUCT_W - C_PIX_W);
                p_product      <= value_pipe(2) * inv_saturation;
                hue_dly3       <= hue_clamped;

                -- takt 4: číslo sektoru (omezené na 0..5), p
                region_raw := resize(shift_right(region_product, C_SECTOR_RECIP_SHIFT), region_raw'length);
                if region_raw > C_LAST_SECTOR then
                    region <= to_unsigned(C_LAST_SECTOR, C_REGION_W);
                else
                    region <= resize(region_raw, C_REGION_W);
                end if;
                p_value  <= div255(p_product);
                hue_dly4 <= hue_dly3;

                -- takt 5: zbytek v sektoru
                remainder <= resize(hue_dly4 - resize(region * to_unsigned(C_SECTOR_WIDTH, C_PIX_W - C_REGION_W),
                                                      C_PIX_W), C_REMAINDER_W);
                -- takt 6: f = 8 * zbytek + zbytek / 2
                fraction <= shift_left(resize(remainder, C_FRACTION_W), 3) + resize(shift_right(remainder, 1), C_FRACTION_W);
                -- takt 7: 255 - f
                inv_fraction  <= C_PIXEL_MAX - fraction;
                fraction_dly7 <= fraction;
                -- takt 8: S * f, S * (255 - f)
                sat_f_product     <= saturation_pipe(7) * fraction_dly7;
                sat_inv_f_product <= saturation_pipe(7) * inv_fraction;
                -- takt 9: div255
                sat_f     <= div255(sat_f_product);
                sat_inv_f <= div255(sat_inv_f_product);
                -- takt 10: doplňky do 255
                q_factor <= C_PIXEL_MAX - sat_f;
                t_factor <= C_PIXEL_MAX - sat_inv_f;
                -- takt 11: V * ...
                q_product <= value_pipe(10) * q_factor;
                t_product <= value_pipe(10) * t_factor;
                -- takt 12: div255
                q_value <= div255(q_product);
                t_value <= div255(t_product);

                -- takt 13: výběr podle sektoru
                sector      := to_integer(region_pipe(C_PIPE_DEPTH - 1));
                value_final := value_pipe(12);
                p_final     := p_pipe(C_PIPE_DEPTH - 1);
                if saturation_pipe(12) = 0 then
                    out_red <= value_final; out_green <= value_final; out_blue <= value_final;
                else
                    case sector is
                        when 0      => out_red <= value_final; out_green <= t_value;     out_blue <= p_final;
                        when 1      => out_red <= q_value;     out_green <= value_final; out_blue <= p_final;
                        when 2      => out_red <= p_final;     out_green <= value_final; out_blue <= t_value;
                        when 3      => out_red <= p_final;     out_green <= q_value;     out_blue <= value_final;
                        when 4      => out_red <= t_value;     out_green <= p_final;     out_blue <= value_final;
                        when others => out_red <= value_final; out_green <= p_final;     out_blue <= q_value;
                    end case;
                end if;

                -- zpožďovací linky
                region_pipe(5) <= region;
                p_pipe(5)      <= p_value;
                for stage in 6 to C_PIPE_DEPTH - 1 loop
                    region_pipe(stage) <= region_pipe(stage - 1);
                    p_pipe(stage)      <= p_pipe(stage - 1);
                end loop;
                for stage in 2 to C_PIPE_DEPTH loop
                    saturation_pipe(stage) <= saturation_pipe(stage - 1);
                    value_pipe(stage)      <= value_pipe(stage - 1);
                end loop;
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

    skid_in_data <= eol_pipe(C_PIPE_DEPTH) & sof_pipe(C_PIPE_DEPTH)
                    & pack3(out_green, out_blue, out_red);      -- UG934: [7:0] G, [15:8] B, [23:16] R

    skid : entity work.axis_skid_buffer
        generic map (G_DATA_W => C_RGB_W + 2)
        port map (aclk => aclk, aresetn => aresetn, s_data => skid_in_data, s_valid => valid_pipe(C_PIPE_DEPTH),
                  s_ready => pipe_enable, m_data => skid_out_data, m_valid => m_axis_tvalid, m_ready => m_axis_tready);

    m_axis_tdata <= skid_out_data(C_RGB_W - 1 downto 0);
    m_axis_tuser <= skid_out_data(C_RGB_W);
    m_axis_tlast <= skid_out_data(C_RGB_W + 1);

end architecture;
