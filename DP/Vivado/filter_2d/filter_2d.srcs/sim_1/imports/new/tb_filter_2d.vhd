----------------------------------------------------------------------------------
-- Company: Technical University of Liberec
-- Engineer: Bc. Karel Najman
-- 
-- Description: Testbench pro Top-Level 2D Konvoluce (filter_2d).
--              Ověřuje plně Fixed-Point DSP logiku proti "Zlatému" softwarovému
--              modelu s přesnou simulací Q-formátu (zaokrouhlení a saturace).
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

-- Zapnutí balíčku
use work.video_processing_pkg.all;

entity tb_filter_2d is
    -- Testbench nemá porty
end entity tb_filter_2d;

architecture SIM of tb_filter_2d is

-- =========================================================================
-- NASTAVENÍ TESTBENCHE (Odpovídá generikům ve filter_2d)
-- =========================================================================
constant C_MODE : T_MODE := VALID;

-- čtvercový obraz pro jednoduchost (10x10) -> 100 pixelů, což je dostatečné pro testování, a rychlé pro simulaci
constant C_IMG_W : positive := 12;      -- 12 místo 10 kvůli SAME režimu (padding přidává 1 pixel na každou stranu)
constant C_IMG_H : positive := C_IMG_W;

constant C_PIX_CNT : positive := C_IMG_W * C_IMG_H;

constant C_KER_SIZE : positive := 3;

-- Pixel je klasický 8-bit Unsigned (7 downto 0)
constant C_PIX_H : integer := 7;
constant C_PIX_L : integer := 0;

-- Kernel je v Q4.4 formátu (8-bit Signed se zlomkem) -> (3 downto -4)
constant C_KER_H   : integer := 3;
constant C_KER_L   : integer := -4;
constant C_FRACT_B : natural := abs (C_KER_L); -- Počet zlomkových bitů (4)

constant C_KER_WID : integer := C_KER_H - C_KER_L + 1; -- 8 bitů

constant C_OUT_W       : positive := C_IMG_W when (C_MODE = SAME) else (C_IMG_W - C_KER_SIZE + 1);
constant C_OUT_H       : positive := C_IMG_H when (C_MODE = SAME) else (C_IMG_H - C_KER_SIZE + 1);
constant C_OUT_PIX_CNT : positive := C_OUT_W * C_OUT_H;

constant CLK_PERIOD : time := 10 ns;

-- =========================================================================
-- DATOVÉ TYPY A KONSTANTY (Testovací Kernely)
-- V Q4.4 formátu reprezentuje hodnota 16 číslo 1.0 (16 * 2^-4 = 1)
-- =========================================================================
type int_array is array (natural range <>) of integer;

-- Sobel X (Detekce vertikálních hran)
constant KERNEL_3x3_SOBEL_X : int_array(0 to 8) := (
    -16, 0, 16,
    -32, 0, 32,
    -16, 0, 16
);

-- Gaussian Blur (Vyhlazení, součet prvků je 16, takže výsledek bude automaticky /16)
constant KERNEL_3x3_GAUSS : int_array(0 to 8) := (
    1, 2, 1,
    2, 4, 2,
    1, 2, 1
);

-- Identita (Kopie původního obrazu)
constant KERNEL_3x3_IDENTITY : int_array(0 to 8) := (
    0, 0, 0,
    0, 16, 0,
    0, 0, 0
);

-- Identita (Kopie původního obrazu)
constant KERNEL_5x5_IDENTITY : int_array(0 to 24) := ( -- @suppress "Unused declaration"
    0, 0, 0, 0, 0,
    0, 0, 0, 0, 0,
    0, 0, 25, 0, 0,
    0, 0, 0, 0, 0,
    0, 0, 0, 0, 0
);

-- =========================================================================
-- SIGNÁLY
-- =========================================================================
signal clk     : std_logic := '0';
signal aresetn : std_logic := '0';      -- Active-Low Reset

-- AXI Stream Slave (Vstup obrazu)
signal s_tdata  : std_logic_vector(C_PIX_H - C_PIX_L downto 0) := (others => '0');
signal s_tvalid : std_logic                                    := '0';
signal s_tready : std_logic;
signal s_tlast  : std_logic                                    := '0';
signal s_tuser  : std_logic_vector(0 downto 0)                 := (others => '0');

-- AXI Stream Master (Výstup konvoluce)
signal m_tdata  : std_logic_vector(C_PIX_H - C_PIX_L downto 0);
signal m_tvalid : std_logic;
signal m_tready : std_logic := '1';     -- Master je vždy připraven přijímat data
signal m_tlast  : std_logic;
signal m_tuser  : std_logic_vector(0 downto 0);

signal kernel_in : std_logic_vector((C_KER_SIZE * C_KER_SIZE * C_KER_WID) - 1 downto 0) := (others => '0');

-- Datové buffery pro simulaci
signal input_image    : int_array(0 to C_PIX_CNT - 1)     := (others => 0);
signal expected_image : int_array(0 to C_OUT_PIX_CNT - 1) := (others => 0);

-- Řízení Testbenche
signal start_test : std_logic := '0';
signal test_done  : std_logic := '0';
signal feeder_done : std_logic := '0';
    signal test_error : std_logic := '0';


    function flatten_kernel(k : int_array) return std_logic_vector is
        -- Statická alokace přes globální konstanty Testbenche
        variable res : std_logic_vector((C_KER_SIZE * C_KER_SIZE * C_KER_WID) - 1 downto 0) := (others => '0');
    begin
        for i in 0 to (C_KER_SIZE * C_KER_SIZE) - 1 loop
            res((i + 1) * C_KER_WID - 1 downto i * C_KER_WID) := std_logic_vector(to_signed(k(k'low + i), C_KER_WID));
        end loop;
        return res;
    end function;

    -- =========================================================================
    -- "GOLDEN MODEL" - UNIVERZÁLNÍ SOFTWAROVÁ KONVOLUCE
    -- =========================================================================
    function sw_convolution(img : int_array; kernel : int_array; MODE : T_MODE) return int_array is
       variable res        : int_array(0 to C_OUT_PIX_CNT - 1) := (others => 0);
        variable acc        : integer;
        variable acc_sig    : signed(31 downto 0);
        variable r_in, c_in : integer;
        variable val        : integer;
        variable offset     : integer := C_KER_SIZE / 2;
        variable out_idx    : integer := 0;
        variable y_start, y_end, x_start, x_end : integer;
    begin
        -- Nastavení hranic průchodu podle režimu
        offset := C_KER_SIZE / 2;

        if MODE = SAME then
            y_start := 0;
            y_end   := C_IMG_H - 1;
            x_start := 0;
            x_end   := C_IMG_W - 1;
        else                            -- VALID mode (z oken ořezáváme okraje)
            y_start := offset;
            y_end   := C_IMG_H - 1 - offset;
            x_start := offset;
            x_end   := C_IMG_W - 1 - offset;
        end if;

        out_idx := 0;
        for y in y_start to y_end loop
            for x in x_start to x_end loop
                acc := 0;
                -- 1. Multiply-Accumulate (plně adaptivní podle C_KER_SIZE)
                for kr in 0 to C_KER_SIZE - 1 loop
                    for kc in 0 to C_KER_SIZE - 1 loop
                        r_in := y + (kr - offset);
                        c_in := x + (kc - offset);

                        -- Ošetření okrajů (Zero Padding)
                        if r_in >= 0 and r_in < C_IMG_H and c_in >= 0 and c_in < C_IMG_W then
                            val := img(r_in * C_IMG_W + c_in);
                        else
                            val := 0;
                        end if;

                        acc := acc + (val * kernel(kr * C_KER_SIZE + kc));
                    end loop;
                end loop;

                -- 2. Fixed-Point Normalizace
                acc_sig := to_signed(acc, 32);
                if C_FRACT_B > 0 then
                    acc_sig := acc_sig + to_signed(2 ** (C_FRACT_B - 1), 32);
                    acc_sig := shift_right(acc_sig, C_FRACT_B);
                end if;
                acc     := to_integer(acc_sig);

                -- 3. Saturace (Clip 0 - 255)
                if acc < 0 then
                    acc := 0;
                elsif acc > 255 then
                    acc := 255;
                end if;

                -- Uložení a inkrementace indexu
                res(out_idx) := acc;
                out_idx      := out_idx + 1;
            end loop;
        end loop;
        return res;
    end function;

begin

    -- Generování hodin
    clk <= not clk after CLK_PERIOD / 2;

    -- =========================================================================
    -- INSTANCE TESTOVANÉHO MODULU (DUT)
    -- =========================================================================
    dut : entity work.filter_2d
        generic map(
            G_IMAGE_WIDTH   => C_IMG_W,
            G_IMAGE_HEIGHT  => C_IMG_H,
            G_KERNEL_SIZE   => C_KER_SIZE,
            G_PIXEL_HIGH    => C_PIX_H,
            G_PIXEL_LOW     => C_PIX_L,
            G_KERNEL_HIGH   => C_KER_H,
            G_KERNEL_LOW    => C_KER_L,
            G_PADDING_MODE  => C_MODE,
            G_PADDING_VALUE => 0
        )
        port map(
            aclk          => clk,
            aresetn       => aresetn,
            kernel_in     => kernel_in,

            s_axis_tdata  => s_tdata,
            s_axis_tvalid => s_tvalid,
            s_axis_tready => s_tready,
            s_axis_tlast  => s_tlast,
            s_axis_tuser  => s_tuser,

            m_axis_tdata  => m_tdata,
            m_axis_tvalid => m_tvalid,
            m_axis_tready => m_tready,
            m_axis_tlast  => open,
            m_axis_tuser  => open
        );

    -- =========================================================================
    -- PROCES 1: AXI FEEDER (Tlačí data do filtru)
    -- =========================================================================
    feeder_proc : process
    begin
        s_tvalid <= '0';
        s_tlast  <= '0';
        s_tuser  <= (others => '0');
        feeder_done <= '0';
        wait until start_test = '1';

        -- 1. Odeslání celého validního obrazu
        for i in 0 to C_PIX_CNT - 1 loop
            s_tdata  <= std_logic_vector(to_unsigned(input_image(i), C_PIX_H - C_PIX_L + 1));
            s_tvalid <= '1';
            
            -- Generování SOF (Start of Frame)
            if i = 0 then s_tuser <= (others => '1');
            else s_tuser <= (others => '0'); end if;
            
            -- Generování EOL (End of Line)
            if (i + 1) mod C_IMG_W = 0 then s_tlast <= '1'; else s_tlast <= '0'; end if;

            wait until rising_edge(clk) and s_tready = '1';
        end loop;

        -- 2. "FLUSH" - Odeslání prázdných pixelů k vytlačení zbytku z pipeline
        s_tdata <= (others => '0');
        s_tuser <= (others => '0');
        s_tlast <= '0';
        for i in 0 to (C_KER_SIZE * C_IMG_W + 20) loop
            s_tvalid <= '1';
            wait until rising_edge(clk) and s_tready = '1';
        end loop;

        s_tvalid <= '0';
        feeder_done <= '1';
        wait until start_test = '0';
        feeder_done <= '0';
    end process;

    -- =========================================================================
    -- PROCES 2: AXI CHECKER (Čte data a porovnává se Zlatým Modelem)
    -- =========================================================================
    checker_proc : process
        variable hw_val, exp_val : integer;
        variable err_detected    : std_logic;
    begin
        m_tready   <= '0';
        test_done  <= '0';
        test_error <= '0';

        wait until start_test = '1';
        m_tready <= '1';
        err_detected := '0';

        for i in 0 to C_OUT_PIX_CNT - 1 loop
            wait until rising_edge(clk) and m_tvalid = '1' and m_tready = '1';

            hw_val  := to_integer(unsigned(m_tdata));
            exp_val := expected_image(i);

            if abs (hw_val - exp_val) > 2 then
                report "Chyba na indexu " & integer'image(i) & "! Ocekavano: " & integer'image(exp_val) & " Ziskano (HW): " & integer'image(hw_val)
                severity error;
                err_detected := '1';
            end if;
        end loop;

        m_tready   <= '0';
        test_error <= err_detected;
        test_done  <= '1';
        wait until start_test = '0';
        test_done  <= '0';
    end process;

    -- =========================================================================
    -- HLAVNÍ PROCES
    -- =========================================================================
    main_proc : process
        variable seed1, seed2 : positive := 1;
        variable rand_real    : real;
    begin
        -- RESET
        aresetn <= '0';
        wait for CLK_PERIOD * 5;
        aresetn <= '1';
        wait for CLK_PERIOD * 5;

        report "=== START 2D CONVOLUTION TESTS ===";

        -- Generování náhodného testovacího obrazu
        for i in 0 to C_PIX_CNT - 1 loop
            uniform(seed1, seed2, rand_real);
            input_image(i) <= integer(rand_real * 255.0);
        end loop;
        wait for 1 ns;

        report ">> TEST 1: IDENTITY (Q4.4)";
        kernel_in      <= flatten_kernel(KERNEL_3x3_IDENTITY);
        expected_image <= sw_convolution(input_image, KERNEL_3x3_IDENTITY, C_MODE);
        start_test <= '1';
        wait until test_done = '1' and feeder_done = '1';
        start_test <= '0';
        wait for CLK_PERIOD * 10;
        if test_error = '0' then report "TEST 1: PASSED"; end if;

        wait for CLK_PERIOD * 2;

        report ">> TEST 2: SOBEL X-EDGES (Saturace & Znaménka)";
        kernel_in      <= flatten_kernel(KERNEL_3x3_SOBEL_X);
        expected_image <= sw_convolution(input_image, KERNEL_3x3_SOBEL_X, C_MODE);
        start_test <= '1';
        wait until test_done = '1' and feeder_done = '1';
        start_test <= '0';
        wait for CLK_PERIOD * 10;
        if test_error = '0' then report "TEST 2: PASSED"; end if;

        wait for CLK_PERIOD * 2;

        report ">> TEST 3: GAUSSIAN BLUR (Normalizace & Zlomky)";
        kernel_in      <= flatten_kernel(KERNEL_3x3_GAUSS);
        expected_image <= sw_convolution(input_image, KERNEL_3x3_GAUSS, C_MODE);
        start_test <= '1';
        wait until test_done = '1' and feeder_done = '1';
        start_test <= '0';
        wait for CLK_PERIOD * 10;
        if test_error = '0' then report "TEST 3: PASSED"; end if;

        report "=== VSECHNY TESTY DOKONCENY ===";
        std.env.stop;
        wait;
    end process;

end architecture SIM;
