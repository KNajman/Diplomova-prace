----------------------------------------------------------------------------------
-- Modul: Testbench pro Top-Level 2D Konvoluce
-- Upraveno: Odesílací automat (FSM) pro režim SAME a výpočet HW velikosti
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.video_processing_pkg.all;

entity tb_filter_2d is
end entity tb_filter_2d;

architecture SIM of tb_filter_2d is

    -- =========================================================================
    -- NASTAVENÍ TESTBENCHE (Nyní můžeme testovat nativně SAME mód!)
    -- =========================================================================
    constant C_MODE : T_MODE := VALID; 
    
    constant C_IMG_W   : positive := 10;
    constant C_IMG_H   : positive := 10;
    constant C_PIX_CNT : positive := C_IMG_W * C_IMG_H;

    constant C_KER_SIZE : positive := 3;
    constant C_PAD      : natural  := C_KER_SIZE / 2; -- Šířka nulového okraje (pro 3x3 = 1)

    constant C_PIX_H : integer := 7;
    constant C_PIX_L : integer := 0;

    constant C_KER_H   : integer := 3;
    constant C_KER_L   : integer := -4;
    constant C_FRACT_B : natural := abs(C_KER_L);
    constant C_KER_WID : integer := C_KER_H - C_KER_L + 1;

    -- Výpočet velikosti pro "Zlatý model" a Checkery
    constant C_OUT_W : positive := C_IMG_W when (C_MODE=SAME) else (C_IMG_W - C_KER_SIZE + 1);
    constant C_OUT_H : positive := C_IMG_H when (C_MODE=SAME) else (C_IMG_H - C_KER_SIZE + 1);
    constant C_OUT_PIX_CNT : positive := C_OUT_W * C_OUT_H;

    -- Výpočet velikosti pro HARDWARE
    -- HW běží jako čistý VALID. Pokud chceme na výstupu SAME, musíme ho krmit nafouklým obrazem s okraji!
    constant C_HW_IMG_W : positive := C_IMG_W when (C_MODE=VALID) else (C_IMG_W + 2 * C_PAD);
    constant C_HW_IMG_H : positive := C_IMG_H when (C_MODE=VALID) else (C_IMG_H + 2 * C_PAD);

    constant CLK_PERIOD : time := 10 ns;

    type int_array is array (natural range <>) of integer;

    constant KERNEL_3x3_SOBEL_X : int_array(0 to 8) := (-16, 0, 16, -32, 0, 32, -16, 0, 16);
    constant KERNEL_3x3_GAUSS   : int_array(0 to 8) := (1, 2, 1, 2, 4, 2, 1, 2, 1);
    constant KERNEL_3x3_IDENTITY: int_array(0 to 8) := (0, 0, 0, 0, 16, 0, 0, 0, 0);

    signal clk     : std_logic := '0';
    signal aresetn : std_logic := '0';

    signal s_tdata  : std_logic_vector(C_PIX_H - C_PIX_L downto 0) := (others => '0');
    signal s_tvalid : std_logic := '0';
    signal s_tready : std_logic;
    signal s_tlast  : std_logic := '0';
    signal s_tuser  : std_logic_vector(0 downto 0) := (others => '0');

    signal m_tdata  : std_logic_vector(C_PIX_H - C_PIX_L downto 0);
    signal m_tvalid : std_logic;
    signal m_tready : std_logic := '1';
    signal m_tlast  : std_logic;
    signal m_tuser  : std_logic_vector(0 downto 0);

    signal kernel_in : std_logic_vector((C_KER_SIZE * C_KER_SIZE * C_KER_WID) - 1 downto 0) := (others => '0');

    signal input_image    : int_array(0 to C_PIX_CNT - 1) := (others => 0);
    signal expected_image : int_array(0 to C_OUT_PIX_CNT - 1) := (others => 0);

    signal start_test : std_logic := '0';
    signal test_done  : std_logic := '0';
    signal test_error : std_logic := '0';

    function flatten_kernel(k : int_array) return std_logic_vector is
        variable res : std_logic_vector((C_KER_SIZE * C_KER_SIZE * C_KER_WID) - 1 downto 0) := (others => '0');
    begin
        for i in 0 to (C_KER_SIZE * C_KER_SIZE) - 1 loop
            res((i + 1) * C_KER_WID - 1 downto i * C_KER_WID) := std_logic_vector(to_signed(k(k'low + i), C_KER_WID));
        end loop;
        return res;
    end function;

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
        if MODE = SAME then
            y_start := 0; y_end := C_IMG_H - 1; x_start := 0; x_end := C_IMG_W - 1;
        else
            y_start := offset; y_end := C_IMG_H - 1 - offset; x_start := offset; x_end := C_IMG_W - 1 - offset;
        end if;

        out_idx := 0;
        for y in y_start to y_end loop
            for x in x_start to x_end loop
                acc := 0;
                for kr in 0 to C_KER_SIZE - 1 loop
                    for kc in 0 to C_KER_SIZE - 1 loop
                        r_in := y + (kr - offset); c_in := x + (kc - offset);
                        if r_in >= 0 and r_in < C_IMG_H and c_in >= 0 and c_in < C_IMG_W then
                            val := img(r_in * C_IMG_W + c_in);
                        else
                            val := 0;
                        end if;
                        acc := acc + (val * kernel(kr * C_KER_SIZE + kc));
                    end loop;
                end loop;

                acc_sig := to_signed(acc, 32);
                if C_FRACT_B > 0 then
                    acc_sig := acc_sig + to_signed(2 ** (C_FRACT_B - 1), 32);
                    acc_sig := shift_right(acc_sig, C_FRACT_B);
                end if;
                acc := to_integer(acc_sig);

                if acc < 0 then acc := 0; elsif acc > 255 then acc := 255; end if;

                res(out_idx) := acc;
                out_idx      := out_idx + 1;
            end loop;
        end loop;
        return res;
    end function;

begin

    clk <= not clk after CLK_PERIOD / 2;

    dut : entity work.filter_2d
        generic map(
            G_IMAGE_WIDTH   => C_HW_IMG_W,  -- POZOR! HW nyní dostává šířku HW obrazu
            G_IMAGE_HEIGHT  => C_HW_IMG_H,  -- HW nyní dostává výšku HW obrazu
            G_KERNEL_SIZE   => C_KER_SIZE,
            G_PIXEL_HIGH    => C_PIX_H,
            G_PIXEL_LOW     => C_PIX_L,
            G_KERNEL_HIGH   => C_KER_H,
            G_KERNEL_LOW    => C_KER_L
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
            m_axis_tlast  => m_tlast,
            m_axis_tuser  => m_tuser
        );

    feeder_proc : process
        variable img_idx : integer;
    begin
        s_tvalid <= '0';
        s_tlast  <= '0';
        s_tuser  <= (others => '0');
        wait until start_test = '1';

        -- =====================================================================
        -- FSM GENERÁTOR SOUŘADNIC (Předloha pro HW Padding Wrapper)
        -- =====================================================================
        -- V reálném FPGA je toto nejúspornější varianta "automatu" pro padding.
        -- Nepotřebujeme složité stavové stroje (IDLE, TOP_PAD, LEFT_PAD atd.),
        -- stačí 2 hardwarové čítače (hw_r, hw_c) a jeden komparátor ohraničení.
        
        for hw_r in 0 to C_HW_IMG_H - 1 loop
            for hw_c in 0 to C_HW_IMG_W - 1 loop
                
                -- Logika komparátoru (Oblast rámečku nul)
                if C_MODE = SAME and (hw_r < C_PAD or hw_r >= C_IMG_H + C_PAD or hw_c < C_PAD or hw_c >= C_IMG_W + C_PAD) then
                    -- Generujeme Padding ('0')
                    s_tdata <= (others => '0');
                else
                    -- Jsme v aktivním obraze, načteme reálná data
                    if C_MODE = SAME then
                        img_idx := (hw_r - C_PAD) * C_IMG_W + (hw_c - C_PAD);
                    else
                        img_idx := hw_r * C_IMG_W + hw_c;
                    end if;
                    
                    s_tdata <= std_logic_vector(to_unsigned(input_image(img_idx), C_PIX_H - C_PIX_L + 1));
                end if;

                s_tvalid <= '1';
                
                -- TUSER a TLAST reagují striktně na rozšířený HW obraz!
                if hw_r = 0 and hw_c = 0 then s_tuser(0) <= '1'; else s_tuser(0) <= '0'; end if;
                if hw_c = C_HW_IMG_W - 1 then s_tlast <= '1'; else s_tlast <= '0'; end if;

                loop
                    wait until rising_edge(clk);
                    if s_tready = '1' then exit; end if;
                end loop;
                
            end loop;
        end loop;

        s_tdata <= (others => '0');
        s_tuser <= (others => '0');
        s_tlast <= '0';
        
        while start_test = '1' loop
            s_tvalid <= '1';
            wait until rising_edge(clk);
        end loop;

        s_tvalid <= '0';
    end process;

    checker_proc : process
        variable hw_val, exp_val : integer;
        variable err_detected    : std_logic;
    begin
        test_done  <= '0';
        test_error <= '0';
        
        wait until start_test = '1';
        err_detected := '0';
        test_error   <= '0';

        for i in 0 to C_OUT_PIX_CNT - 1 loop
            loop
                wait until rising_edge(clk);
                if m_tvalid = '1' then
                    
                    if is_X(m_tdata) then
                        report "CRITICAL ERROR: HW output m_tdata contains 'X' or 'U'!" severity error;
                        hw_val := 0; 
                        err_detected := '1';
                        test_error   <= '1';
                    else
                        hw_val  := to_integer(unsigned(m_tdata));
                    end if;
                    
                    exp_val := expected_image(i);

                    if abs (hw_val - exp_val) > 2 then
                        report "Error at index " & integer'image(i) & "! Expected: " & integer'image(exp_val) & ", Got HW: " & integer'image(hw_val)
                        severity error;
                        err_detected := '1';
                        test_error   <= '1';
                    end if;
                    
                    exit; 
                end if;
            end loop;
        end loop;

        test_done  <= '1';
        wait until start_test = '0';
        test_done  <= '0';
    end process;

    main_proc : process
        variable seed1, seed2 : positive := 1;
        variable rand_real    : real;
    begin
        aresetn <= '0';
        wait for CLK_PERIOD * 5;
        aresetn <= '1';
        wait for CLK_PERIOD * 5;

        report "=== START 2D CONVOLUTION TESTS ===";

        for i in 0 to C_PIX_CNT - 1 loop
            uniform(seed1, seed2, rand_real);
            input_image(i) <= integer(rand_real * 255.0);
        end loop;
        wait for 1 ns;

        report ">> TEST 1: IDENTITY";
        kernel_in      <= flatten_kernel(KERNEL_3x3_IDENTITY);
        expected_image <= sw_convolution(input_image, KERNEL_3x3_IDENTITY, C_MODE);
        start_test <= '1';
        wait until test_done = '1';
        wait for 1 ns; 
        start_test <= '0';
        wait for CLK_PERIOD * 10;
        
        if test_error = '0' then report "TEST 1: PASSED"; else report "TEST 1: FAILED" severity warning; end if;
        wait for CLK_PERIOD * 20;
        
        report ">> TEST 2: SOBEL X-EDGES";
        kernel_in      <= flatten_kernel(KERNEL_3x3_SOBEL_X);
        expected_image <= sw_convolution(input_image, KERNEL_3x3_SOBEL_X, C_MODE);
        start_test <= '1';
        wait until test_done = '1';
        wait for 1 ns;
        start_test <= '0';
        wait for CLK_PERIOD * 10;
        
        if test_error = '0' then report "TEST 2: PASSED"; else report "TEST 2: FAILED" severity warning; end if;
        wait for CLK_PERIOD * 20;
        
        report ">> TEST 3: GAUSSIAN BLUR";
        kernel_in      <= flatten_kernel(KERNEL_3x3_GAUSS);
        expected_image <= sw_convolution(input_image, KERNEL_3x3_GAUSS, C_MODE);
        start_test <= '1';
        wait until test_done = '1';
        wait for 1 ns;
        start_test <= '0';
        wait for CLK_PERIOD * 10;
        
        if test_error = '0' then report "TEST 3: PASSED"; else report "TEST 3: FAILED" severity warning; end if;

        report "=== ALL TESTS COMPLETED ===";
        std.env.stop;
        wait;
    end process;

end architecture SIM;