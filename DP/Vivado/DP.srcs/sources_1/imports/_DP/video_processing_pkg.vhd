library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use IEEE.FIXED_PKG.ALL;

package video_processing_pkg is

    -- =========================================================================
    -- PRŮMYSLOVÉ KONSTANTY PRO INDEXACI KANÁLŮ
    -- =========================================================================

    type T_MODE is (SAME, VALID);

    -- =========================================================================
    -- TYPY PRO PIXELY A DATA (VHDL-2008 neomezená pole)
    -- =========================================================================

    -- Pixel jako pole kanálů (např. array(0 to 2) of std_logic_vector(7 downto 0))
    type t_pixel is array (natural range <>) of std_logic_vector;

    -- Typy pro Fixed-Point aritmetiku (pro koeficienty a vnitřní výpočty)
    -- 
    type t_ufixed_array is array (natural range <>) of ufixed;
    type t_sfixed_array is array (natural range <>) of sfixed;

    type t_sfixed_matrix   is array (natural range <>, natural range <>) of sfixed;
    type t_ufixed_matrix   is array (natural range <>, natural range <>) of ufixed;
    type t_signed_matrix   is array (natural range <>, natural range <>) of signed;
    type t_unsigned_matrix is array (natural range <>, natural range <>) of unsigned;

    -- =========================================================================
    -- POMOCNÉ FUNKCE PRO VÝPOČTY (DSP & ŠÍŘKA SBĚRNIC)
    -- =========================================================================
    function log2_ceil(n : positive) return natural;

    -- Funkce pro bezpečné přebalení (Flatten) pole kanálů do jednoho vektoru (pro AXI TDATA)
    function pack_pixel(p : t_pixel; bits : positive) return std_logic_vector;

    -- Funkce pro výpočet max a min (pro operace jako RGB to HSV)
    function max(a, b : unsigned) return unsigned;
    function min(a, b : unsigned) return unsigned;
    function max3(a, b, c : unsigned) return unsigned;
    function min3(a, b, c : unsigned) return unsigned;

    -- Funkce pro aproximaci dělení maximální hodnotou (pro normalizaci v HSV) DIV255
    function div_maxval(x : unsigned; w : natural) return unsigned;
    -- Funkce pro výpočet maximální dimenze výstupu na základě režimu SAME/VALID
    function get_max_dim(IMAGE_WIDTH : positive; KERNEL_SIZE : positive; MODE : T_MODE) return natural;

end package video_processing_pkg;

package body video_processing_pkg is

    function log2_ceil(n : positive) return natural is
    begin
        if n = 1 then
            return 0;
        else
            return integer(ceil(log2(real(n))));
        end if;
    end function;

    function pack_pixel(p : t_pixel; bits : positive) return std_logic_vector is
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

    function get_max_dim(IMAGE_WIDTH : positive; KERNEL_SIZE : positive; MODE : T_MODE) return natural is
        variable max_dim : natural;
    begin
        with MODE select max_dim :=
            IMAGE_WIDTH + (KERNEL_SIZE - 1) when SAME,
            IMAGE_WIDTH - (KERNEL_SIZE - 1) when VALID;
        return max_dim;
    end function;

end package body video_processing_pkg;
