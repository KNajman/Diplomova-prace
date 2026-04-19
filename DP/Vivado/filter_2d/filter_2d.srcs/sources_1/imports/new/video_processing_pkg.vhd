----------------------------------------------------------------------------------
-- Company: Technical University of Liberec
-- Engineer: Bc. Karel Najman
-- Supervisor: Ing. Martin Rozkovec, Ph.D.
-- 
-- Create Year: 2026
-- Design Name: 2D Convolutional Filter
-- Module Name: video_processing_pkg
-- Project Name: 
-- Description: Standardized package for fixed-point video processing.
--              Contains generic types and packing/unpacking conversion 
--              functions to simplify VHDL-2008 arrays handling across modules.
-- Architecture: RTL
-- Math: Fixed-point (VHDL-2008)
-- 
-- Dependencies: ieee.fixed_pkg
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;
use ieee.math_real.all;

package video_processing_pkg is

    -- =========================================================================
    -- Global Types and Constants
    -- =========================================================================
    type T_MODE is (VALID, SAME);

    -- Unconstrained arrays and matrices for maximal flexibility
    type t_sfixed_array  is array (natural range <>) of sfixed;
    type t_ufixed_array  is array (natural range <>) of ufixed;
    type t_sfixed_matrix is array (natural range <>, natural range <>) of sfixed;
    type t_ufixed_matrix is array (natural range <>, natural range <>) of ufixed;

    -- =========================================================================
    -- Conversion Functions Declarations
    -- =========================================================================
    function unpack_sfixed_array(slv : std_logic_vector; NUM : positive; H : integer; L : integer) return t_sfixed_array;
    function unpack_ufixed_array(slv : std_logic_vector; NUM : positive; H : integer; L : integer) return t_ufixed_array;

    function pack_sfixed_array(arr : t_sfixed_array; NUM : positive; H : integer; L : integer) return std_logic_vector;
    function pack_ufixed_matrix(mat : t_ufixed_matrix) return std_logic_vector;

    function log2_ceil(n : positive) return natural;

end package;

package body video_processing_pkg is

    -- =========================================================================
    -- Function: Unpack SLV to Signed Fixed-Point Array
    -- =========================================================================
    function unpack_sfixed_array(slv : std_logic_vector; NUM : positive; H : integer; L : integer) return t_sfixed_array is
        variable res : t_sfixed_array(0 to NUM - 1)(H downto L);
        constant WID : natural := H - L + 1;
    begin
        for i in 0 to NUM - 1 loop
            res(i) := to_sfixed(slv((i + 1) * WID - 1 downto i * WID), H, L);
        end loop;
        return res;
    end function;

    -- =========================================================================
    -- Function: Unpack SLV to Unsigned Fixed-Point Array
    -- =========================================================================
    function unpack_ufixed_array(slv : std_logic_vector; NUM : positive; H : integer; L : integer) return t_ufixed_array is
        variable res : t_ufixed_array(0 to NUM - 1)(H downto L);
        constant WID : natural := H - L + 1;
    begin
        for i in 0 to NUM - 1 loop
            res(i) := to_ufixed(slv((i + 1) * WID - 1 downto i * WID), H, L);
        end loop;
        return res;
    end function;

    -- =========================================================================
    -- Function: Pack Signed Fixed-Point Array to SLV
    -- =========================================================================
    function pack_sfixed_array(arr : t_sfixed_array; NUM : positive; H : integer; L : integer) return std_logic_vector is
        constant WID : natural := H - L + 1;
        variable res : std_logic_vector((NUM * WID) - 1 downto 0);
    begin
        for i in 0 to NUM - 1 loop
            res((i + 1) * WID - 1 downto i * WID) := to_slv(arr(arr'low + i));
        end loop;
        return res;
    end function;

    -- =========================================================================
    -- Function: Pack Unsigned Fixed-Point 2D Matrix to SLV
    -- =========================================================================
    function pack_ufixed_matrix(mat : t_ufixed_matrix) return std_logic_vector is
        constant ROWS : natural := mat'length(1);
        constant COLS : natural := mat'length(2);
        constant WID  : natural := mat(mat'low(1), mat'low(2))'length;
        variable res  : std_logic_vector((ROWS * COLS * WID) - 1 downto 0);
        variable idx  : natural := 0;
    begin
        for r in mat'low(1) to mat'high(1) loop
            for c in mat'low(2) to mat'high(2) loop
                res((idx + 1) * WID - 1 downto idx * WID) := to_slv(mat(r, c));
                idx                                       := idx + 1;
            end loop;
        end loop;
        return res;
    end function;

    -- =========================================================================
    -- Function: Calculate Ceiling of Log2 (for Adder Tree Sizing)
    -- =========================================================================
    function log2_ceil(n : positive) return natural is
    begin
        return integer(CEIL(LOG2(real(n)))) + 1;
    end function;

end package body;
