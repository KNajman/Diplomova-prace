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
--      takt 1  x0, x1, x2 do registrů                      (registr A/B)
--      takt 2  m0 = c0 * x0                                (M)
--      takt 3  p0 = m0 + K       | m1 = c1 * x1(z^-1)      (P | M)
--      takt 4  p1 = p0 + m1      | m2 = c2 * x2(z^-2)      (P přes PCIN | M)
--      takt 5  p2 = p1 + m2                                (P přes PCIN)
--      takt 6  posun >> 15 (floor) a saturace 0..255
--    K = offset * 2^15 + 2^14 (zaokrouhlení half-up) se předpočítá z registru, je tedy
--    "zadarmo" na portu C prvního DSP. Vstupy x1, x2 se zpožďují, aby každý součin dorazil
--    k mezisoučtu svého pixelu. Sčítačky jsou uvnitř DSP (PCIN -> P), ne v LUT.
--  * Proti v1 (3 součiny v jednom taktu + strom sčítaček): 9 místo 12 DSP a plně
--    pipelinovaný DSP (A/B, M, P registry) má vyšší Fmax.
--  * Šířky se odvozují vzorcem: součin = koeficient + pixel jako 9b se znaménkem,
--    akumulátor = sum_w(max(součin, K), 4 členy).
--  * Globální povolení en = s_ready výstupního skid bufferu (registrované), s_axis_tready = en:
--    při backpressure celá pipeline jen zamrzne, skid přijme poslední přenos.
--  * Datové registry bez resetu (lépe se balí do DSP), reset nuluje jen platnost.
--  * G_CH_IN / G_CH_OUT = 1 nebo 3. Šedý vstup: x1 = x2 = 0 (násobení nulou syntéza odstraní),
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
    constant C_X_W     : natural := C_PIX_W + 1;                            -- pixel jako číslo se znaménkem
    constant C_PROD_W  : natural := C_CSC_COEFF_W + C_X_W;                  -- součin
    constant C_K_W     : natural := C_CSC_OFFSET_W + C_CSC_FRAC_W;          -- offset * 2^15 (+ 2^14 se vejde)
    constant C_ACC_W   : natural := sum_w(maximum(C_PROD_W, C_K_W), 4);     -- 3 součiny + K
    constant C_DEPTH   : natural := 6;
    constant C_ROUND   : signed(C_ACC_W - 1 downto 0) := shift_left(to_signed(1, C_ACC_W), C_CSC_FRAC_W - 1);

    type t_x_array    is array (0 to 2) of signed(C_X_W - 1 downto 0);
    type t_prod_array is array (0 to 2) of signed(C_PROD_W - 1 downto 0);
    type t_acc_array  is array (0 to 2) of signed(C_ACC_W - 1 downto 0);

    signal en      : std_logic;
    signal x_r     : t_x_array := (others => (others => '0'));          -- takt 1
    signal x1_d1   : signed(C_X_W - 1 downto 0) := (others => '0');     -- takt 2
    signal x2_d1   : signed(C_X_W - 1 downto 0) := (others => '0');     -- takt 2
    signal x2_d2   : signed(C_X_W - 1 downto 0) := (others => '0');     -- takt 3
    signal k_r     : t_acc_array := (others => (others => '0'));        -- konstanta K (z registru)
    signal m0, m1, m2 : t_prod_array := (others => (others => '0'));    -- takty 2, 3, 4
    signal p0, p1, p2 : t_acc_array := (others => (others => '0'));     -- takty 3, 4, 5
    signal out6    : t_pix_array(0 to 2) := (others => (others => '0'));

    -- Postranní signály zpožděné o hloubku pipeline (index 1..C_DEPTH = výstup taktu)
    signal valid_d : std_logic_vector(1 to C_DEPTH) := (others => '0');
    signal user_d  : std_logic_vector(1 to C_DEPTH) := (others => '0');
    signal last_d  : std_logic_vector(1 to C_DEPTH) := (others => '0');

    signal skid_in, skid_out : std_logic_vector(G_CH_OUT * C_PIX_W + 1 downto 0);
begin

    s_axis_tready <= en;

    process (aclk)
    begin
        if rising_edge(aclk) then
            -- K se mění jen zápisem registru, počítá se mimo pipeline
            for o in 0 to 2 loop
                k_r(o) <= shift_left(resize(offset(o), C_ACC_W), C_CSC_FRAC_W) + C_ROUND;
            end loop;

            if en = '1' then
                -- takt 1: vstupy (chybějící složky = 0)
                for i in 0 to 2 loop
                    if i < G_CH_IN then
                        x_r(i) <= signed('0' & get_ch(s_axis_tdata, i));
                    else
                        x_r(i) <= (others => '0');
                    end if;
                end loop;
                -- takt 2..4: zpoždění vstupů pro kaskádu
                x1_d1 <= x_r(1);
                x2_d1 <= x_r(2);
                x2_d2 <= x2_d1;
                for o in 0 to 2 loop
                    m0(o) <= coeff(o, 0) * x_r(0);                          -- takt 2
                    p0(o) <= resize(m0(o), C_ACC_W) + k_r(o);               -- takt 3
                    m1(o) <= coeff(o, 1) * x1_d1;                           -- takt 3
                    p1(o) <= p0(o) + resize(m1(o), C_ACC_W);                -- takt 4
                    m2(o) <= coeff(o, 2) * x2_d2;                           -- takt 4
                    p2(o) <= p1(o) + resize(m2(o), C_ACC_W);                -- takt 5
                    out6(o) <= sat_u8(shift_right(p2(o), C_CSC_FRAC_W));    -- takt 6
                end loop;
                user_d <= s_axis_tuser & user_d(1 to C_DEPTH - 1);
                last_d <= s_axis_tlast & last_d(1 to C_DEPTH - 1);
            end if;

            if aresetn = '0' then
                valid_d <= (others => '0');
            elsif en = '1' then
                valid_d <= s_axis_tvalid & valid_d(1 to C_DEPTH - 1);
            end if;
        end if;
    end process;

    -- Výstupní skid buffer (registrovaný ready -> en)
    gen_out : for o in 0 to G_CH_OUT - 1 generate
        skid_in((o + 1) * C_PIX_W - 1 downto o * C_PIX_W) <= std_logic_vector(out6(o));
    end generate;
    skid_in(G_CH_OUT * C_PIX_W)     <= user_d(C_DEPTH);
    skid_in(G_CH_OUT * C_PIX_W + 1) <= last_d(C_DEPTH);

    skid : entity work.axis_skid_buffer
        generic map (G_DATA_W => G_CH_OUT * C_PIX_W + 2)
        port map (aclk => aclk, aresetn => aresetn, s_data => skid_in, s_valid => valid_d(C_DEPTH), s_ready => en,
                  m_data => skid_out, m_valid => m_axis_tvalid, m_ready => m_axis_tready);

    m_axis_tdata <= skid_out(G_CH_OUT * C_PIX_W - 1 downto 0);
    m_axis_tuser <= skid_out(G_CH_OUT * C_PIX_W);
    m_axis_tlast <= skid_out(G_CH_OUT * C_PIX_W + 1);

end architecture;
