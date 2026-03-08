library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package conv_pkg is

    -- =========================================================================
    -- VHDL-2008: Nepodmíněná pole nepodmíněných typů
    -- =========================================================================
    -- Můžeme definovat matici, u které určíme velikost a bitovou šířku až při použití!
    type signed_matrix_t   is array (natural range <>, natural range <>) of signed;
    type signed_array_1d_t is array (natural range <>) of signed;

    -- =========================================================================
    -- SDÍLENÉ FUNKCE
    -- =========================================================================
    function get_acc_width(pixel_w : natural; kernel_w : natural; k_size : natural) return natural;
    function get_max_dim(dim : natural; k_size : natural; mode : string) return natural;

end package conv_pkg;

package body conv_pkg is

    function get_acc_width(pixel_w : natural; kernel_w : natural; k_size : natural) return natural is
        variable mult_w : natural := pixel_w + kernel_w;
        variable num_el : real := real(k_size * k_size);
        variable extra  : natural := natural(ceil(log2(num_el)));
    begin
        return mult_w + extra;
    end function;

    function get_max_dim(dim : natural; k_size : natural; mode : string) return natural is
        variable shift : natural := k_size / 2;
    begin
        if mode = "SAME" then
            return dim + 2 * shift;
        else
            return dim;
        end if;
    end function;

end package body conv_pkg;