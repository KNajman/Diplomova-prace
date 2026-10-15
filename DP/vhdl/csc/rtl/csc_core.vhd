--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    csc_core.vhd
-- Popis:     Lineární převod barevných prostorů (matice 3x3, koeficienty Q2.15), AXI4-Stream Video
--
-- Aritmetika (bitově shodná s golden modelem csc.c a HLS jádrem hls_csc):
--   acc = sum_i(coeff[o][i] * in[i]) + (offset[o] << 15)
--   out = saturate_0_255((acc + 2^14) >> 15)
--
-- Poznámky k návrhu:
--  * Bodové jádro bez čítačů: TUSER/TLAST putují s daty, resynchronizace je automatická.
--  * Maximální pipeline, nic na nic nečeká: každá operace má vlastní registr. Pro každý
--    výstupní kanál je skalární součin zapojený jako systolická kaskáda 3 DSP48E2:
--      takt 1  in_pixel(0..2) do registrů                                    (A/B)
--      takt 2  product0 = coeff0 * in_pixel(0)                               (M)
--      takt 3  sum0   = product0 + bias  | product1 = coeff1 * pixel1 (z^-1)  (P | M)
--      takt 4  sum01  = sum0 + product1  | product2 = coeff2 * pixel2 (z^-2)  (P přes PCIN | M)
--      takt 5  sum012 = sum01 + product2                                     (P přes PCIN)
--      takt 6  out_pixel = saturace(sum012 >> 15)
--    bias = offset * 2^15 + 2^14 (zaokrouhlení half-up) se předpočítá z registru, je tedy
--    "zadarmo" na portu C prvního DSP. Vstupy pixel1 a pixel2 se zpožďují, aby každý součin
--    dorazil k mezisoučtu svého pixelu. Sčítačky jsou uvnitř DSP (PCIN -> P), ne v LUT.
--  * Proti v1 (3 součiny v jednom taktu + strom sčítaček): 9 místo 12 DSP a plně
--    pipelinovaný DSP (A/B, M, P registry) má vyšší Fmax.
--  * Šířky se odvozují vzorcem: součin = koeficient + pixel jako 9b se znaménkem,
--    součet = sum_w(max(součin, bias), 4 členy).
--  * Globální povolení pipe_enable = s_ready výstupního skid bufferu (registrované),
--    s_axis_tready = pipe_enable:
--    při backpressure celá pipeline jen zamrzne, skid přijme poslední přenos.
--  * Datové registry bez resetu (lépe se balí do DSP), reset nuluje jen platnost.
--  * G_CH_IN / G_CH_OUT = 1 nebo 3. Šedý vstup: in_pixel(1) = in_pixel(2) = 0 (násobení nulou syntéza odstraní),
--    šedý výstup: použije se jen kanál 0.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;

entity csc_core is
    generic (
        G_CH_IN  : positive := 3;
        G_CH_OUT : positive := 3
    );
    port (
        aclk          : in  std_logic;
        aresetn       : in  std_logic;
        -- Koeficienty [výstup][vstup] Q2.15 a offsety (celé číslo -512..511)
        coeff         : in  t_csc_coeff_array;
        offset        : in  t_csc_offset_array;
        -- AXI4-Stream Video vstup
        s_axis_tdata  : in  std_logic_vector(G_CH_IN * C_PIX_W - 1 downto 0);
        s_axis_tuser  : in  std_logic;
        s_axis_tlast  : in  std_logic;
        s_axis_tvalid : in  std_logic;
        s_axis_tready : out std_logic;
        -- AXI4-Stream Video výstup
        m_axis_tdata  : out std_logic_vector(G_CH_OUT * C_PIX_W - 1 downto 0);
        m_axis_tuser  : out std_logic;
        m_axis_tlast  : out std_logic;
        m_axis_tvalid : out std_logic;
        m_axis_tready : in  std_logic
    );
end entity;

architecture rtl of csc_core is
    -- Šířky odvozené vzorcem (součin = Wa + Wb, součet N členů = max(W) + clog2(N))
    constant C_PIXEL_SIGNED_W : natural := C_PIX_W + 1;                                  -- pixel jako číslo se znaménkem
    constant C_PRODUCT_W      : natural := C_CSC_COEFF_W + C_PIXEL_SIGNED_W;             -- koeficient * pixel
    constant C_BIAS_W         : natural := C_CSC_OFFSET_W + C_CSC_FRAC_W;                -- offset * 2^15
    constant C_SUM_W          : natural := sum_w(maximum(C_PRODUCT_W, C_BIAS_W), 4);     -- 3 součiny + bias
    constant C_PIPE_DEPTH     : natural := 6;                                            -- takty 1..6 (viz výše)
    constant C_ROUND_HALF     : signed(C_SUM_W - 1 downto 0) := shift_left(to_signed(1, C_SUM_W), C_CSC_FRAC_W - 1);

    type t_pixel_array   is array (0 to 2) of signed(C_PIXEL_SIGNED_W - 1 downto 0);
    type t_product_array is array (0 to 2) of signed(C_PRODUCT_W - 1 downto 0);       -- index = výstupní kanál
    type t_sum_array     is array (0 to 2) of signed(C_SUM_W - 1 downto 0);           -- index = výstupní kanál

    signal pipe_enable    : std_logic;
    signal in_pixel       : t_pixel_array := (others => (others => '0'));            -- takt 1
    signal in_pixel1_dly1 : signed(C_PIXEL_SIGNED_W - 1 downto 0) := (others => '0'); -- takt 2
    signal in_pixel2_dly1 : signed(C_PIXEL_SIGNED_W - 1 downto 0) := (others => '0'); -- takt 2
    signal in_pixel2_dly2 : signed(C_PIXEL_SIGNED_W - 1 downto 0) := (others => '0'); -- takt 3
    signal bias           : t_sum_array := (others => (others => '0'));              -- offset * 2^15 + 2^14
    signal product0       : t_product_array := (others => (others => '0'));          -- takt 2
    signal product1       : t_product_array := (others => (others => '0'));          -- takt 3
    signal product2       : t_product_array := (others => (others => '0'));          -- takt 4
    signal sum0           : t_sum_array := (others => (others => '0'));              -- takt 3
    signal sum01          : t_sum_array := (others => (others => '0'));              -- takt 4
    signal sum012         : t_sum_array := (others => (others => '0'));              -- takt 5
    signal out_pixel      : t_pix_array(0 to 2) := (others => (others => '0'));      -- takt 6

    -- Postranní signály zpožděné o hloubku pipeline (index 1..C_PIPE_DEPTH = výstup taktu)
    signal valid_pipe : std_logic_vector(1 to C_PIPE_DEPTH) := (others => '0');
    signal sof_pipe   : std_logic_vector(1 to C_PIPE_DEPTH) := (others => '0');
    signal eol_pipe   : std_logic_vector(1 to C_PIPE_DEPTH) := (others => '0');

    signal skid_in_data  : std_logic_vector(G_CH_OUT * C_PIX_W + 1 downto 0);
    signal skid_out_data : std_logic_vector(G_CH_OUT * C_PIX_W + 1 downto 0);
begin

    s_axis_tready <= pipe_enable;

    process (aclk)
    begin
        if rising_edge(aclk) then
            -- bias se mění jen zápisem registru, počítá se mimo pipeline
            for out_ch in 0 to 2 loop
                bias(out_ch) <= shift_left(resize(offset(out_ch), C_SUM_W), C_CSC_FRAC_W) + C_ROUND_HALF;
            end loop;

            if pipe_enable = '1' then
                -- takt 1: vstupy (chybějící složky = 0)
                for in_ch in 0 to 2 loop
                    if in_ch < G_CH_IN then
                        in_pixel(in_ch) <= signed('0' & get_ch(s_axis_tdata, in_ch));
                    else
                        in_pixel(in_ch) <= (others => '0');
                    end if;
                end loop;
                -- takt 2..4: zpoždění vstupů pro kaskádu
                in_pixel1_dly1 <= in_pixel(1);
                in_pixel2_dly1 <= in_pixel(2);
                in_pixel2_dly2 <= in_pixel2_dly1;
                for out_ch in 0 to 2 loop
                    product0(out_ch)  <= coeff(out_ch, 0) * in_pixel(0);                        -- takt 2
                    sum0(out_ch)      <= resize(product0(out_ch), C_SUM_W) + bias(out_ch);      -- takt 3
                    product1(out_ch)  <= coeff(out_ch, 1) * in_pixel1_dly1;                     -- takt 3
                    sum01(out_ch)     <= sum0(out_ch) + resize(product1(out_ch), C_SUM_W);      -- takt 4
                    product2(out_ch)  <= coeff(out_ch, 2) * in_pixel2_dly2;                     -- takt 4
                    sum012(out_ch)    <= sum01(out_ch) + resize(product2(out_ch), C_SUM_W);     -- takt 5
                    out_pixel(out_ch) <= sat_u8(shift_right(sum012(out_ch), C_CSC_FRAC_W));     -- takt 6
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

    -- Výstupní skid buffer (registrovaný ready -> pipe_enable)
    gen_out : for out_ch in 0 to G_CH_OUT - 1 generate
        skid_in_data((out_ch + 1) * C_PIX_W - 1 downto out_ch * C_PIX_W) <= std_logic_vector(out_pixel(out_ch));
    end generate;
    skid_in_data(G_CH_OUT * C_PIX_W)     <= sof_pipe(C_PIPE_DEPTH);
    skid_in_data(G_CH_OUT * C_PIX_W + 1) <= eol_pipe(C_PIPE_DEPTH);

    skid : entity work.axis_skid_buffer
        generic map (G_DATA_W => G_CH_OUT * C_PIX_W + 2)
        port map (aclk => aclk, aresetn => aresetn, s_data => skid_in_data, s_valid => valid_pipe(C_PIPE_DEPTH), s_ready => pipe_enable,
                  m_data => skid_out_data, m_valid => m_axis_tvalid, m_ready => m_axis_tready);

    m_axis_tdata <= skid_out_data(G_CH_OUT * C_PIX_W - 1 downto 0);
    m_axis_tuser <= skid_out_data(G_CH_OUT * C_PIX_W);
    m_axis_tlast <= skid_out_data(G_CH_OUT * C_PIX_W + 1);

end architecture;
