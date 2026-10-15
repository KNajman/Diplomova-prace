--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    video_pkg.vhd
-- Popis:     Společné typy a konstanty VHDL jader (AXI4-Stream Video podle UG934)
-- Jazyk:     VHDL-2008 (jen konstrukty ověřené ve Vivado 2025.2 syntéze i xsim)
--
-- Poznámky k návrhu:
--  * Kontrakt rozhraní je shodný s HLS jádry: TUSER = SOF, TLAST = EOL, RGB 24 b
--    s TDATA[7:0] = G, [15:8] = B, [23:16] = R, šedá 8 b, plný backpressure,
--    aresetn synchronní aktivní v 0.
--  * Uvnitř jader se AXIS přenáší jako record s pevnou šířkou 24 b (šedá využívá
--    jen bity 7:0, nepoužité bity syntéza odstraní). Record bez neomezených prvků
--    je konstrukt, který Vivado spolehlivě podporuje. Porty top-level entit zůstávají
--    ploché (s_axis_tdata, ...), aby je IP Packager rozpoznal jako rozhraní AXIS.
--  * Stavové bity jsou shodné s HLS (hlsv::WIN_STATUS_*), jeden C driver pro obě verze.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package video_pkg is

    constant C_PIX_W     : natural := 8;               -- bity na složku
    constant C_RGB_W     : natural := 3 * C_PIX_W;     -- 24 b pixel (RGB/YCbCr/HSV)
    constant C_MAX_WIDTH : natural := 3840;            -- max. šířka snímku (4K UHD)
    constant C_DIM_W     : natural := 12;              -- šířka registrů width/height (max 4095)

    -- Indexy složek v TDATA podle UG934 (shodné s IMGPROC_RGB_IDX_* v golden modelu)
    constant C_IDX_G : natural := 0;
    constant C_IDX_B : natural := 1;
    constant C_IDX_R : natural := 2;

    -- Stavové bity (shodné s HLS hlsv::WIN_STATUS_*)
    constant C_ST_SKIPPED   : natural := 0;     -- před TUSER přišly pixely (resynchronizace)
    constant C_ST_EARLY_SOF : natural := 1;     -- TUSER uprostřed snímku
    constant C_ST_EARLY_EOL : natural := 2;     -- TLAST před koncem řádku
    constant C_ST_LATE_EOL  : natural := 3;     -- chybí TLAST na konci řádku

    subtype t_pix is unsigned(C_PIX_W - 1 downto 0);
    type t_pix_array is array (natural range <>) of t_pix;
    -- Okno K x K okénkových jader: (řádek, sloupec), střed = (K/2, K/2)
    type t_window is array (natural range <>, natural range <>) of t_pix;

    -- Jeden přenos AXI4-Stream Video (bez TREADY, ten jde opačným směrem)
    type t_axis is record
        tdata  : std_logic_vector(C_RGB_W - 1 downto 0);
        tuser  : std_logic;
        tlast  : std_logic;
        tvalid : std_logic;
    end record;

    constant C_AXIS_IDLE : t_axis := (tdata => (others => '0'), tuser => '0', tlast => '0', tvalid => '0');

    -- Převod barev: koeficienty Q2.15 (18 b = port B DSP48E2), offset celé číslo se znaménkem
    constant C_CSC_COEFF_W  : natural := 18;
    constant C_CSC_FRAC_W   : natural := 15;
    constant C_CSC_OFFSET_W : natural := 10;
    type t_csc_coeff_array  is array (0 to 2, 0 to 2) of signed(C_CSC_COEFF_W - 1 downto 0);
    type t_csc_offset_array is array (0 to 2) of signed(C_CSC_OFFSET_W - 1 downto 0);

    -- Šířky aritmetiky se VŽDY odvozují vzorcem (žádné ručně spočítané konstanty), aby jádro
    -- zůstalo správné při změně generik: součin = Wa + Wb, součet N členů = max(W) + clog2(N)
    function clog2(n : positive) return natural;
    function to_sl(condition : boolean) return std_logic;
    function sum_w(w : natural; n_terms : positive) return natural;

    -- Složka c (0 = TDATA[7:0]) jako číslo bez znaménka
    function get_ch(data : std_logic_vector; c : natural) return t_pix;
    -- Sloučí 3 složky do 24bitového TDATA
    function pack3(c0, c1, c2 : t_pix) return std_logic_vector;
    -- Saturace celého čísla se znaménkem na 0..255
    function sat_u8(v : signed) return t_pix;

end package;

package body video_pkg is

    function to_sl(condition : boolean) return std_logic is
    begin
        if condition then
            return '1';
        end if;
        return '0';
    end function;

    -- Nejmenší k, pro které 2^k >= n (clog2(1) = 0)
    function clog2(n : positive) return natural is
        variable k : natural := 0;
    begin
        while (2 ** k) < n loop
            k := k + 1;
        end loop;
        return k;
    end function;

    -- Šířka součtu n_terms čísel šířky w (se znaménkem): přenos max. clog2(n_terms) bitů
    function sum_w(w : natural; n_terms : positive) return natural is
    begin
        return w + clog2(n_terms);
    end function;

    function get_ch(data : std_logic_vector; c : natural) return t_pix is
    begin
        return unsigned(data(data'low + (c + 1) * C_PIX_W - 1 downto data'low + c * C_PIX_W));
    end function;

    function pack3(c0, c1, c2 : t_pix) return std_logic_vector is
    begin
        return std_logic_vector(c2) & std_logic_vector(c1) & std_logic_vector(c0);
    end function;

    function sat_u8(v : signed) return t_pix is
    begin
        if v < 0 then
            return (others => '0');
        elsif v > 255 then
            return (others => '1');
        else
            return resize(unsigned(v), C_PIX_W);
        end if;
    end function;

end package body;
