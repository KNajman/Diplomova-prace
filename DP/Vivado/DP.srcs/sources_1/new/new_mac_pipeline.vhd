----------------------------------------------------------------------------------
-- Modul: MAC Pipeline (Multiply-Accumulate) pro 2D Konvoluci
-- Architektura: Plně pipelinovaný strom optimalizovaný pro DSP48 řezy
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_processing_pkg.all;

use ieee.fixed_float_types.all;
use ieee.fixed_pkg.all;

entity mac_pipeline is                  -- Multiply-Accumulate Pipeline
    generic(
        -- Definice desetinné čárky přes indexy (VHDL-2008 styl)
        -- Pixely jsou typicky 8-bit celá čísla: ufixed(7 downto 0)
        G_PIX_HIGH    : integer  := 7;
        G_PIX_LOW     : integer  := 0;
        -- Kernel může být např. Q4.4: sfixed(3 downto -4)
        G_KERNEL_SIZE : positive := 3;  -- Např. 3 pro 3x3 okno
        G_KER_HIGH    : integer  := 3;
        G_KER_LOW     : integer  := -4
    );
    port(
        clk             : in  std_logic;
        rst             : in  std_logic;
        pipeline_en     : in  std_logic;
        -- Vstupy jsou "rozbalená" 1D pole (např. 0 to 8 pro 3x3 okno)
        window_in       : in  t_ufixed_array(0 to (G_KERNEL_SIZE * G_KERNEL_SIZE) - 1)(G_PIX_HIGH downto G_PIX_LOW);
        kernel_in       : in  t_sfixed_array(0 to (G_KERNEL_SIZE * G_KERNEL_SIZE) - 1)(G_KER_HIGH downto G_KER_LOW);
        window_valid_in : in  std_logic;
        -- Výstup je zpět klasický logický vektor, abychom mohli jít do AXI streamu
        pixel_out       : out std_logic_vector(G_PIX_HIGH - G_PIX_LOW downto 0);
        mac_valid_out   : out std_logic
    );
end entity mac_pipeline;

architecture RTL of mac_pipeline is

    constant C_NUM_ELEMENTS : positive := G_KERNEL_SIZE * G_KERNEL_SIZE;

    -- =========================================================================
    -- AUTOMATICKÝ VÝPOČET BITOVÝCH ŠÍŘEK
    -- Knihovna fixed_pkg nám dává obrovskou výhodu - velikost výsledku násobení
    -- je přesně součet indexů. Nemusíme to vůbec počítat ručně!
    -- MULT_HIGH = G_PIX_HIGH + G_KER_HIGH + 1
    -- MULT_LOW  = G_PIX_LOW + G_KER_LOW
    -- =========================================================================
    constant C_MULT_HIGH : integer := G_PIX_HIGH + G_KER_HIGH + 1;
    constant C_MULT_LOW  : integer := G_PIX_LOW + G_KER_LOW;

    -- Akumulátor potřebuje bity navíc pro součet prvků okna (např. +4 bity pro 9 prvků)
    constant C_ACC_HIGH : integer := C_MULT_HIGH + log2_ceil(C_NUM_ELEMENTS);

    signal mult_regs  : t_sfixed_array(0 to C_NUM_ELEMENTS - 1)(C_MULT_HIGH downto C_MULT_LOW);
    signal acc_reg    : sfixed(C_ACC_HIGH downto C_MULT_LOW);
    signal valid_pipe : std_logic_vector(2 downto 0) := (others => '0');

begin

    process(clk)
        variable v_sum : sfixed(C_ACC_HIGH downto C_MULT_LOW);
    begin
        if rising_edge(clk) then
            if rst = '1' then
                valid_pipe    <= (others => '0');
                pixel_out     <= (others => '0');
                mac_valid_out <= '0';
                -- fixed_pkg umožňuje nulování přes (others => '0')
                acc_reg       <= (others => '0');
            elsif pipeline_en = '1' then

                valid_pipe(0) <= window_valid_in;
                valid_pipe(1) <= valid_pipe(0);
                valid_pipe(2) <= valid_pipe(1);
                mac_valid_out <= valid_pipe(2);

                -- =========================================================================
                -- FÁZE 1: Násobení (DSP bloky)
                -- =========================================================================
                for i in 0 to C_NUM_ELEMENTS - 1 loop
                    -- Zde se děje Fixed-point magie. Násobení UFIXED a SFIXED automaticky
                    -- generuje správný SFIXED výsledek se správně zarovnanou čárkou!
                    mult_regs(i) <= sfixed(window_in(i)) * kernel_in(i);
                end loop;

                -- =========================================================================
                -- FÁZE 2: Akumulace (Sčítací strom)
                -- =========================================================================
                v_sum := (others => '0');
                for i in 0 to C_NUM_ELEMENTS - 1 loop
                    -- Resize zde používáme jen pro bezpečné rozšíření do většího akumulátoru
                    v_sum := v_sum + resize(mult_regs(i), C_ACC_HIGH, C_MULT_LOW);
                end loop;
                acc_reg <= v_sum;

                -- =========================================================================
                -- FÁZE 3: Saturace a Zaokrouhlení (To hlavní proč fixed_pkg používáme)
                -- =========================================================================
                -- Z obrovského sfixed akumulátoru s desetinnými místy vyřízneme zpět  
                -- Unsigned formát pixelu (např. 7 downto 0). 
                -- Kompilátor sám vloží hradla pro kontrolu přetečení (>255), 
                -- podtečení (<0) a přičtení 0.5 pro správné zaokrouhlení zlomku!
                pixel_out <= to_slv(resize(
                    arg            => acc_reg,
                    left_index     => G_PIX_HIGH,
                    right_index    => G_PIX_LOW,
                    overflow_style => fixed_saturate,
                    round_style    => fixed_round
                ));

            end if;
        end if;
    end process;

end architecture RTL;
