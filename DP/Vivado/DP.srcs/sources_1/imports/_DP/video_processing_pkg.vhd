library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use IEEE.FIXED_PKG.ALL;

package vid_processing_pkg is

    -- =========================================================================
    -- PRŮMYSLOVÉ KONSTANTY PRO INDEXACI KANÁLŮ
    -- =========================================================================
    -- Pomáhá čitelnosti kódu: pixel(G_CH) je jasnější než pixel(1)
    constant R_CH : natural := 0;
    constant G_CH : natural := 1;
    constant B_CH : natural := 2;

    constant Y_CH  : natural := 0;
    constant CB_CH : natural := 1;
    constant CR_CH : natural := 2;

    -- =========================================================================
    -- TYPY PRO PIXELY A DATA (VHDL-2008 neomezená pole)
    -- =========================================================================

    -- Pixel jako pole kanálů (např. array(0 to 2) of std_logic_vector(7 downto 0))
    type pixel_t is array (natural range <>) of std_logic_vector;

    -- Typy pro Fixed-Point aritmetiku (pro koeficienty a vnitřní výpočty)
    type ufixed_pixel_t is array (natural range <>) of ufixed;
    type sfixed_pixel_t is array (natural range <>) of sfixed;

    -- Matice pro transformace (např. 3x3 koeficienty pro RGB to YCbCr)
    type sfixed_matrix_t is array (natural range <>, natural range <>) of sfixed;

    -- =========================================================================
    -- POMOCNÉ FUNKCE PRO VÝPOČTY (DSP & ŠÍŘKA SBĚRNIC)
    -- =========================================================================
    function log2_ceil(n : positive) return natural;

    -- Funkce pro bezpečné přebalení (Flatten) pole kanálů do jednoho vektoru (pro AXI TDATA)
    function pack_pixel(p : pixel_t; bits : positive) return std_logic_vector;

    -- Funkce pro výpočet max a min (pro operace jako RGB to HSV)
    function max(a, b : unsigned) return unsigned;
    function min(a, b : unsigned) return unsigned;
    function max3(a, b, c : unsigned) return unsigned;
    function min3(a, b, c : unsigned) return unsigned;

    -- Funkce pro aproximaci dělení maximální hodnotou (pro normalizaci v HSV) DIV255
    function div_maxval(x : unsigned; w : natural) return unsigned;

end package vid_processing_pkg;

package body vid_processing_pkg is

    function log2_ceil(n : positive) return natural is
    begin
        if n = 1 then
            return 0;
        else
            return integer(ceil(log2(real(n))));
        end if;
    end function;

    function pack_pixel(p : pixel_t; bits : positive) return std_logic_vector is
        variable res : std_logic_vector((p'length * bits) - 1 downto 0);
    begin
        for i in p'range loop
            res(((i - p'low + 1) * bits) - 1 downto (i - p'low) * bits) := p(i);
        end loop;
        return res;
    end function;

    function max(a, b : unsigned) return unsigned is
    begin
        if a > b then
            return a;
        else
            return b;
        end if;
    end function;

    function min(a, b : unsigned) return unsigned is
    begin
        if a < b then
            return a;
        else
            return b;
        end if;
    end function;

    function max3(a, b, c : unsigned) return unsigned is
    begin
        return max(max(a, b), c);
    end function;

    function min3(a, b, c : unsigned) return unsigned is
    begin
        return min(min(a, b), c);
    end function;

    function div_maxval(x : unsigned; w : natural) return unsigned is
        variable x_ext : unsigned((2 * w) downto 0);
        variable shift : unsigned((2 * w) downto 0);
    begin
        shift := resize(x((2 * w) - 1 downto w), (2 * w) + 1);
        x_ext := resize(x, (2 * w) + 1) + 1 + shift;
        return x_ext((2 * w) - 1 downto w);
    end function;

end package body vid_processing_pkg;
