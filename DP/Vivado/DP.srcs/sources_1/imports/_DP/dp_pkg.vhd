library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package dp_pkg is

    -- =========================================================================
    -- VHDL-2008: Nepodmíněná pole nepodmíněných typů
    -- =========================================================================
    -- Můžeme definovat matici, u které určíme velikost a bitovou šířku až při použití!
    type vector_t is array (natural range <>) of std_logic_vector;
    type matrix_t is array (natural range <>, natural range <>) of std_logic_vector;

    type signed_vector_t is array (natural range <>) of signed;
    -- test : in signed_vector_t()
    type signed_matrix_t  is array (natural range <>, natural range <>) of signed;

    -- =========================================================================
    -- SDÍLENÉ FUNKCE
    -- =========================================================================
    function get_acc_width(pixel_w : natural; kernel_w : natural; k_size : natural) return natural;
    function get_max_dim(dim : natural; k_size : natural; mode : string) return natural;
    function next_power_of_2(n : positive) return positive;
    function log2(n : positive) return natural;

end package dp_pkg;

package body dp_pkg is
    function get_acc_width(pixel_w : natural; kernel_w : natural; k_size : natural) return natural is
        variable mult_w : natural; -- := pixel_w + kernel_w;
        variable num_el : real; --    := real(k_size * k_size);
        variable extra  : natural; -- := natural(ceil(log2(num_el)));
    begin
        mult_w := pixel_w + kernel_w; -- šířka výsledku násobení jednoho pixelu a jednoho jádra
        num_el := real(k_size * k_size); -- počet prvků v okně (a jádru)
        extra  := natural(ceil(log2(num_el))); -- znovu spočítáme extra pro tento počet prvků
        return mult_w + extra;
    end function;

    function get_max_dim(dim : natural; k_size : natural; mode : string) return natural is
        variable shift : natural := 0;
    begin
        shift := k_size / 2; -- posun pro "SAME" režim
        if mode = "SAME" then
            return dim + 2 * shift;
        else
            return dim;
        end if;
    end function;

    --funkce pro nalezení nejbližší vyšší mocniny 2 (pro padding)
    function next_power_of_2(n : positive) return positive is
        variable power : natural := 2;  -- začínám od 2^1
    begin
        while power < n loop
            power := power * 2;
        end loop;
        return power;
    end function;

    function log2(n : positive) return natural is
        variable res : natural  := 0;
        variable val : positive := 1;
    begin
        while val < n loop
            res := res + 1;
            val := val * 2;
        end loop;
        return res;
    end function;

end package body dp_pkg;
