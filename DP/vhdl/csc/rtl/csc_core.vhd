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
--  * Pipeline 5 stupňů s globálním povolením en. en = s_ready výstupního skid bufferu
--    (registrovaný), takže s_axis_tready = en je výstup registru a celé jádro při
--    backpressure jen "zamrzne". Skid buffer přijme poslední přenos i v taktu, kdy
--    ready teprve padá - nic se neztratí.
--  * Stupně odpovídají registrům DSP48E2 (A/B -> M -> P), aby syntéza namapovala každý
--    součin na jeden DSP: 1) registr vstupů, 2) součiny 18 x 9 b, 3) p0 + p1 a
--    p2 + offset + zaokrouhlovací konstanta, 4) akumulátor, 5) posun, saturace.
--    Zaokrouhlovací konstanta 2^14 je přičtená v akumulátoru (half-up "zadarmo").
--  * Datové registry nemají reset (DSP registry s resetem by se hůř balily), reset
--    nuluje jen platnost (valid).
--  * G_CH_IN / G_CH_OUT = 1 nebo 3. Pro šedý vstup se použije jen sloupec 0 matice,
--    pro šedý výstup jen řádek 0. Koeficienty jsou porty (z registrové banky AXI4-Lite).
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
    constant C_ACC_W  : natural := 30;      -- 18b x 9b = 27 b, součet 3 členů + offset << 15 (25 b) -> 30 b
    constant C_PROD_W : natural := C_CSC_COEFF_W + C_PIX_W + 1;
    constant C_DEPTH  : natural := 5;
    constant C_ROUND  : signed(C_ACC_W - 1 downto 0) := to_signed(2 ** (C_CSC_FRAC_W - 1), C_ACC_W);

    type t_in_array   is array (0 to 2) of signed(C_PIX_W downto 0);       -- pixel jako 9b se znaménkem
    type t_prod_array is array (0 to 2, 0 to 2) of signed(C_PROD_W - 1 downto 0);
    type t_acc_array  is array (0 to 2) of signed(C_ACC_W - 1 downto 0);

    signal en      : std_logic;
    signal x1      : t_in_array := (others => (others => '0'));
    signal prod2   : t_prod_array := (others => (others => (others => '0')));
    signal sum3a   : t_acc_array := (others => (others => '0'));
    signal sum3b   : t_acc_array := (others => (others => '0'));
    signal acc4    : t_acc_array := (others => (others => '0'));
    signal out5    : t_pix_array(0 to 2) := (others => (others => '0'));

    -- Postranní signály zpožděné o hloubku pipeline (index 1..C_DEPTH = výstup stupně)
    signal valid_d : std_logic_vector(1 to C_DEPTH) := (others => '0');
    signal user_d  : std_logic_vector(1 to C_DEPTH) := (others => '0');
    signal last_d  : std_logic_vector(1 to C_DEPTH) := (others => '0');

    signal skid_in, skid_out : std_logic_vector(G_CH_OUT * C_PIX_W + 1 downto 0);
begin

    s_axis_tready <= en;

    process (aclk)
        variable s : signed(C_ACC_W - 1 downto 0);
    begin
        if rising_edge(aclk) then
            if en = '1' then
                -- 1) vstupy (chybějící složky = 0)
                for i in 0 to 2 loop
                    if i < G_CH_IN then
                        x1(i) <= signed('0' & get_ch(s_axis_tdata, i));
                    else
                        x1(i) <= (others => '0');
                    end if;
                end loop;
                -- 2) součiny
                for o in 0 to 2 loop
                    for i in 0 to 2 loop
                        prod2(o, i) <= coeff(o, i) * x1(i);
                    end loop;
                end loop;
                -- 3) dvojice součtů (offset << 15 + zaokrouhlení jako konstanta akumulátoru)
                for o in 0 to 2 loop
                    sum3a(o) <= resize(prod2(o, 0), C_ACC_W) + resize(prod2(o, 1), C_ACC_W);
                    sum3b(o) <= resize(prod2(o, 2), C_ACC_W) + shift_left(resize(offset(o), C_ACC_W), C_CSC_FRAC_W)
                                + C_ROUND;
                end loop;
                -- 4) akumulátor
                for o in 0 to 2 loop
                    acc4(o) <= sum3a(o) + sum3b(o);
                end loop;
                -- 5) posun (floor) a saturace
                for o in 0 to 2 loop
                    s := shift_right(acc4(o), C_CSC_FRAC_W);
                    out5(o) <= sat_u8(s);
                end loop;
                -- postranní signály
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
        skid_in((o + 1) * C_PIX_W - 1 downto o * C_PIX_W) <= std_logic_vector(out5(o));
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
