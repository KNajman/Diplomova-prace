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

    type t_sfixed_matrix is array (natural range <>, natural range <>) of sfixed;
    type t_ufixed_matrix is array (natural range <>, natural range <>) of ufixed;

    -- Funkce pro zploštění (Flatten) 2D matice na 1D pole
    -- =========================================================================
    -- PŘEVODNÍ FUNKCE (Zploštění a rozbalení pro porty modulů)
    -- =========================================================================

    -- Zabalí 2D matici pixelů (ze Sliding Window) do std_logic_vector
    function pack_ufixed_matrix(mat : t_ufixed_matrix) return std_logic_vector;

    -- Rozbalí std_logic_vector zpět na 1D pole pixelů (pro MAC Pipeline)
    function unpack_ufixed_array(
        slv       : std_logic_vector;
        num_elems : natural;
        high_idx  : integer;
        low_idx   : integer
    ) return t_ufixed_array;

    -- Rozbalí std_logic_vector na 1D pole kernelu (Signed zlomky)
    function unpack_sfixed_array(
        slv       : std_logic_vector;
        num_elems : natural;
        high_idx  : integer;
        low_idx   : integer
    ) return t_sfixed_array;

    -- =========================================================================
    -- POMOCNÉ FUNKCE PRO VÝPOČTY (DSP & ŠÍŘKA SBĚRNIC)
    -- =========================================================================
    function log2_ceil(n : positive) return natural;

    -- Funkce pro bezpečné přebalení (Flatten) pole kanálů do jednoho vektoru (pro AXI TDATA)
    function pack_pixel(p : t_pixel; bits : positive) return std_logic_vector;

    -- Funkce pro výpočet max a min (pro operace jako RGB to HSV)
    -- function max(a, b : unsigned) return unsigned;
    -- function min(a, b : unsigned) return unsigned;
    function max3(a, b, c : unsigned) return unsigned;
    function min3(a, b, c : unsigned) return unsigned;
    function median3(a, b, c : unsigned) return unsigned;

    -- Funkce pro aproximaci dělení maximální hodnotou (pro normalizaci v HSV) DIV255
    function div_maxval(x : unsigned; w : natural) return unsigned;
    -- Funkce pro výpočet maximální dimenze výstupu na základě režimu SAME/VALID
    function get_max_dim(IMAGE_WIDTH : positive; KERNEL_SIZE : positive; MODE : T_MODE) return natural;

end package video_processing_pkg;

package body video_processing_pkg is

    -- =========================================================================
    -- TĚLA PŘEVODNÍCH FUNKCÍ
    -- =========================================================================
    function pack_ufixed_matrix(mat : t_ufixed_matrix) return std_logic_vector is
        constant ELEM_WID : natural := mat(mat'low(1), mat'low(2))'length;
        constant ROWS     : natural := mat'length(1);
        constant COLS     : natural := mat'length(2);
        variable v_slv    : std_logic_vector((ROWS * COLS * ELEM_WID) - 1 downto 0);
        variable idx      : natural := 0;
    begin
        for r in mat'range(1) loop
            for c in mat'range(2) loop
                v_slv(((idx + 1) * ELEM_WID) - 1 downto idx * ELEM_WID) := to_slv(mat(r, c));
                idx                                                     := idx + 1;
            end loop;
        end loop;
        return v_slv;
    end function;

    function unpack_ufixed_array(
        slv       : std_logic_vector;
        num_elems : natural;
        high_idx  : integer;
        low_idx   : integer
    ) return t_ufixed_array is
        constant ELEM_WID : natural := high_idx - low_idx + 1;
        variable v_arr    : t_ufixed_array(0 to num_elems - 1)(high_idx downto low_idx);
        variable v_slice  : std_logic_vector(ELEM_WID - 1 downto 0);
    begin
        for i in 0 to num_elems - 1 loop
            v_slice  := slv(((i + 1) * ELEM_WID) - 1 downto i * ELEM_WID);
            v_arr(i) := to_ufixed(unsigned(v_slice), high_idx, low_idx);
        end loop;
        return v_arr;
    end function;

    function unpack_sfixed_array(
        slv       : std_logic_vector;
        num_elems : natural;
        high_idx  : integer;
        low_idx   : integer
    ) return t_sfixed_array is
        constant ELEM_WID : natural := high_idx - low_idx + 1;
        variable v_arr    : t_sfixed_array(0 to num_elems - 1)(high_idx downto low_idx);
        variable v_slice  : std_logic_vector(ELEM_WID - 1 downto 0);
    begin
        for i in 0 to num_elems - 1 loop
            v_slice  := slv(((i + 1) * ELEM_WID) - 1 downto i * ELEM_WID);
            v_arr(i) := to_sfixed(signed(v_slice), high_idx, low_idx);
        end loop;
        return v_arr;
    end function;

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

    function max3(a, b, c : unsigned) return unsigned is
    begin
        return maximum(maximum(a, b), c);
    end function;

    function min3(a, b, c : unsigned) return unsigned is
    begin
        return minimum(minimum(a, b), c);
    end function;

    function median3(a, b, c : unsigned) return unsigned is
    begin
        return minimum(maximum(a, b), c);
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
        case MODE is
            when SAME =>
                max_dim := IMAGE_WIDTH;
            when VALID =>
                max_dim := IMAGE_WIDTH - (KERNEL_SIZE - 1);
                -- when others =>
                --     max_dim := IMAGE_WIDTH; -- Default to SAME if invalid mode
        end case;

        return max_dim;
    end function;

end package body video_processing_pkg;
