library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.FIXED_PKG.ALL;

-- Použití našeho nového balíčku pro snadnou práci s pixely
use work.vid_processing_pkg.all;

entity tb_color_space_conversion is
-- Testbench nemá žádné porty
end entity tb_color_space_conversion;

architecture SIM of tb_color_space_conversion is

    -- =========================================================================
    -- NASTAVENÍ TESTBENCHE A GENERIC PARAMETRŮ
    -- =========================================================================
    constant C_CHANNELS      : positive := 3;
    constant C_BITS_PER_CHAN : positive := 8;
    constant C_INT_BITS      : integer  := 1;  -- Znamenko + cela cast (staci pro rozsah -1.0 az +1.0)
    constant C_FRAC_BITS     : integer  := -14;
    constant C_COEFF_W       : integer  := C_INT_BITS - C_FRAC_BITS + 1;

    constant CLK_PERIOD      : time := 10 ns;

    -- =========================================================================
    -- SIGNÁLY PRO DUT (Device Under Test)
    -- =========================================================================
    signal clk              : std_logic := '0';
    signal rst_n            : std_logic := '0';

    -- Konfigurace (Ploché vektory)
    signal cfg_coeffs_flat  : std_logic_vector((C_CHANNELS * C_CHANNELS * C_COEFF_W) - 1 downto 0) := (others => '0');
    signal cfg_offsets_flat : std_logic_vector((C_CHANNELS * C_BITS_PER_CHAN) - 1 downto 0) := (others => '0');

    -- AXI4-Stream IN (RGB)
    signal s_axis_tdata     : std_logic_vector((C_CHANNELS * C_BITS_PER_CHAN) - 1 downto 0) := (others => '0');
    signal s_axis_tuser     : std_logic := '0';
    signal s_axis_tlast     : std_logic := '0';
    signal s_axis_tvalid    : std_logic := '0';
    signal s_axis_tready    : std_logic;

    -- AXI4-Stream OUT (YCbCr)
    signal m_axis_tdata     : std_logic_vector((C_CHANNELS * C_BITS_PER_CHAN) - 1 downto 0);
    signal m_axis_tuser     : std_logic;
    signal m_axis_tlast     : std_logic;
    signal m_axis_tvalid    : std_logic;
    signal m_axis_tready    : std_logic := '1'; -- TB je vždy připraven přijímat

    -- =========================================================================
    -- DEFINICE KOEFICIENTŮ REC.601 (Odpovídá C++ testbenchi)
    -- =========================================================================
    -- Y  =  0.299*R + 0.587*G + 0.114*B
    -- Cb = -0.169*R - 0.331*G + 0.500*B + 128
    -- Cr =  0.500*R - 0.419*G - 0.081*B + 128

    -- Využijeme matici s reálnými čísly, testbench se postará o převod na sfixed
    type real_matrix_t is array (0 to 2, 0 to 2) of real;
    constant REC601_COEFFS_REAL : real_matrix_t := (
        ( 0.299,  0.587,  0.114), -- Y
        (-0.169, -0.331,  0.500), -- Cb
        ( 0.500, -0.419, -0.081)  -- Cr
    );
    
    constant REC601_OFFSETS : integer_vector(0 to 2) := (0, 128, 128);

begin

    -- =========================================================================
    -- INSTANTIACE DUT
    -- =========================================================================
    dut : entity work.color_space_conversion
        generic map (
            G_CHANNELS_IN     => C_CHANNELS,
            G_CHANNELS_OUT    => C_CHANNELS,
            G_BITS_PER_CHAN   => C_BITS_PER_CHAN,
            G_COEFF_INT_BITS  => C_INT_BITS,
            G_COEFF_FRAC_BITS => C_FRAC_BITS
        )
        port map (
            clk              => clk,
            rst_n            => rst_n,
            cfg_coeffs_flat  => cfg_coeffs_flat,
            cfg_offsets_flat => cfg_offsets_flat,
            s_axis_tdata     => s_axis_tdata,
            s_axis_tuser     => s_axis_tuser,
            s_axis_tlast     => s_axis_tlast,
            s_axis_tvalid    => s_axis_tvalid,
            s_axis_tready    => s_axis_tready,
            m_axis_tdata     => m_axis_tdata,
            m_axis_tuser     => m_axis_tuser,
            m_axis_tlast     => m_axis_tlast,
            m_axis_tvalid    => m_axis_tvalid,
            m_axis_tready    => m_axis_tready
        );

    -- =========================================================================
    -- HODINY
    -- =========================================================================
    clk <= not clk after CLK_PERIOD / 2;

    -- =========================================================================
    -- HLAVNÍ TESTOVACÍ PROCES (Stimulus)
    -- =========================================================================
    stimulus_proc : process
        variable v_pixel_in  : pixel_t(0 to 2)(7 downto 0);
        variable v_pixel_out : pixel_t(0 to 2)(7 downto 0);
    begin
        -- 1. INIT A RESET
        rst_n <= '0';
        wait for CLK_PERIOD * 5;
        rst_n <= '1';
        wait for CLK_PERIOD * 2;

        -- 2. KONFIGURACE (Zabalení reálných hodnot do plochého vektoru pro AXI-Lite rozhraní)
        report "--- Konfigurace modulu na Rec.601 ---";
        for i in 0 to C_CHANNELS-1 loop
            -- Zabalení offsetu
            cfg_offsets_flat(((i+1)*C_BITS_PER_CHAN)-1 downto i*C_BITS_PER_CHAN) <= std_logic_vector(to_unsigned(REC601_OFFSETS(i), C_BITS_PER_CHAN));
            
            -- Zabalení koeficientů
            for j in 0 to C_CHANNELS-1 loop
                cfg_coeffs_flat(((i*C_CHANNELS + j + 1)*C_COEFF_W)-1 downto (i*C_CHANNELS + j)*C_COEFF_W) <= 
                    to_slv(to_sfixed(REC601_COEFFS_REAL(i, j), C_INT_BITS, C_FRAC_BITS));
            end loop;
        end loop;
        
        wait for CLK_PERIOD * 2;

        -- 3. TEST: ČERVENÝ PIXEL (R=255, G=0, B=0)
        report "--- Spoustim Test RGB -> YCbCr (Cervena barva) ---";
        
        -- Skládáme pixel pomocí pomocného pole a naší nové fuknce z balíčku
        v_pixel_in(R_CH) := x"FF"; -- 255
        v_pixel_in(G_CH) := x"00"; -- 0
        v_pixel_in(B_CH) := x"00"; -- 0

        s_axis_tdata  <= pack_pixel(v_pixel_in, C_BITS_PER_CHAN);
        s_axis_tuser  <= '1'; -- Start of frame
        s_axis_tlast  <= '0';
        s_axis_tvalid <= '1';

        -- Čekání na přijetí (AXI handshake)
        wait until rising_edge(clk) and s_axis_tready = '1';
        s_axis_tvalid <= '0'; -- Uvolnění sběrnice po jednom taktu
        s_axis_tuser  <= '0';

        -- 4. ČEKÁNÍ NA VÝSTUP (Pipeline zpoždění)
        wait until rising_edge(clk) and m_axis_tvalid = '1';

        -- Rozbalení TDATA z HW do pole kanálů pro snadnou kontrolu
        for i in 0 to C_CHANNELS-1 loop
            v_pixel_out(i) := m_axis_tdata(((i+1)*C_BITS_PER_CHAN)-1 downto i*C_BITS_PER_CHAN);
        end loop;

        report "Vstup RGB: (" & integer'image(to_integer(unsigned(v_pixel_in(R_CH)))) & ", " & 
                                integer'image(to_integer(unsigned(v_pixel_in(G_CH)))) & ", " & 
                                integer'image(to_integer(unsigned(v_pixel_in(B_CH)))) & ")";
                                
        report "Vystup YCbCr z HW: (" & integer'image(to_integer(unsigned(v_pixel_out(Y_CH)))) & ", " & 
                                        integer'image(to_integer(unsigned(v_pixel_out(CB_CH)))) & ", " & 
                                        integer'image(to_integer(unsigned(v_pixel_out(CR_CH)))) & ")";

        -- 5. VYHODNOCENÍ (S tolerancí 2 úrovní, stejně jako v C++)
        assert (abs(to_integer(unsigned(v_pixel_out(Y_CH)))  - 76)  <= 2) report "CHYBA v kanalu Y!"  severity failure;
        assert (abs(to_integer(unsigned(v_pixel_out(CB_CH))) - 84)  <= 2) report "CHYBA v kanalu Cb!" severity failure;
        assert (abs(to_integer(unsigned(v_pixel_out(CR_CH))) - 255) <= 2) report "CHYBA v kanalu Cr!" severity failure;

        report "-> TEST USPESNY (Vysledky odpovidaji C++ referencnimu modelu)";

        wait for CLK_PERIOD * 10;
        
        -- Konec simulace (zastavení v populárních simulátorech)
        std.env.stop;
        wait;
    end process;

end architecture SIM;