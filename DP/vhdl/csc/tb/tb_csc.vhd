--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    tb_csc.vhd
-- Popis:     Testbench csc_core proti golden modelu (HEX z imgproc_cli, koeficienty z imgproc_coeffs_pkg)
--
--  G_PRESET: 0 RGB->šedá 601, 1 YCbCr 601 full, 2 YCbCr 709 full, 3 YCbCr 601 studio,
--            4 YCbCr 709 studio, 5 šedá->RGB. Spouští scripts/run_ghdl.sh s různými
--            G_VALID_PCT / G_READY_PCT (náhodné mezery a backpressure).
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;
use work.imgproc_coeffs_pkg.all;

entity tb_csc is
    generic (
        G_PRESET    : natural  := 1;
        G_WIDTH     : positive := 64;
        G_HEIGHT    : positive := 48;
        G_FRAMES    : positive := 2;
        G_VALID_PCT : natural  := 100;
        G_READY_PCT : natural  := 100;
        G_DATA_DIR  : string   := "data/"
    );
end entity;

architecture sim of tb_csc is
    constant C_PERIOD : time := 5 ns;

    function ch_in(p : natural) return positive is
    begin
        if p = 5 then return 1; end if;
        return 3;
    end function;
    function ch_out(p : natural) return positive is
    begin
        if p = 0 then return 1; end if;
        return 3;
    end function;
    function in_file(p : natural) return string is
    begin
        if p = 5 then return G_DATA_DIR & "in_gray.hex"; end if;
        return G_DATA_DIR & "in_rgb.hex";
    end function;
    function exp_file(p : natural) return string is
    begin
        case p is
            when 0      => return G_DATA_DIR & "csc_rgb_to_gray_bt601.hex";
            when 1      => return G_DATA_DIR & "csc_rgb_to_ycbcr_bt601_full.hex";
            when 2      => return G_DATA_DIR & "csc_rgb_to_ycbcr_bt709_full.hex";
            when 3      => return G_DATA_DIR & "csc_rgb_to_ycbcr_bt601_studio.hex";
            when 4      => return G_DATA_DIR & "csc_rgb_to_ycbcr_bt709_studio.hex";
            when others => return G_DATA_DIR & "csc_gray_to_rgb.hex";
        end case;
    end function;
    function sel_coeff(p : natural) return t_csc_coeff is
    begin
        case p is
            when 0      => return C_CSC_RGB_TO_GRAY_BT601_COEFF;
            when 1      => return C_CSC_RGB_TO_YCBCR_BT601_FULL_COEFF;
            when 2      => return C_CSC_RGB_TO_YCBCR_BT709_FULL_COEFF;
            when 3      => return C_CSC_RGB_TO_YCBCR_BT601_STUDIO_COEFF;
            when 4      => return C_CSC_RGB_TO_YCBCR_BT709_STUDIO_COEFF;
            when others => return C_CSC_GRAY_TO_RGB_COEFF;
        end case;
    end function;
    function sel_offset(p : natural) return t_csc_offset is
    begin
        case p is
            when 0      => return C_CSC_RGB_TO_GRAY_BT601_OFFSET;
            when 1      => return C_CSC_RGB_TO_YCBCR_BT601_FULL_OFFSET;
            when 2      => return C_CSC_RGB_TO_YCBCR_BT709_FULL_OFFSET;
            when 3      => return C_CSC_RGB_TO_YCBCR_BT601_STUDIO_OFFSET;
            when 4      => return C_CSC_RGB_TO_YCBCR_BT709_STUDIO_OFFSET;
            when others => return C_CSC_GRAY_TO_RGB_OFFSET;
        end case;
    end function;
    function pass_fail(n : natural) return string is
    begin
        if n = 0 then return "PASS"; end if;
        return "FAIL";
    end function;

    constant C_CI : positive := ch_in(G_PRESET);
    constant C_CO : positive := ch_out(G_PRESET);

    signal aclk    : std_logic := '0';
    signal aresetn : std_logic := '0';
    signal coeff   : t_csc_coeff_array;
    signal offset  : t_csc_offset_array;

    signal s_data                                     : std_logic_vector(C_CI * C_PIX_W - 1 downto 0);
    signal m_data                                     : std_logic_vector(C_CO * C_PIX_W - 1 downto 0);
    signal s_user, s_last, s_valid, s_ready, src_done : std_logic;
    signal m_user, m_last, m_valid, m_ready, snk_done : std_logic;
    signal errors, cycles                             : natural;
begin
    aclk <= not aclk after C_PERIOD / 2;
    aresetn <= '1' after 4 * C_PERIOD;

    gen_coeff : for o in 0 to 2 generate
        gen_in : for i in 0 to 2 generate
            coeff(o, i) <= to_signed(sel_coeff(G_PRESET)(o, i), C_CSC_COEFF_W);
        end generate;
        offset(o) <= to_signed(sel_offset(G_PRESET)(o), C_CSC_OFFSET_W);
    end generate;

    src : entity work.axis_file_source
        generic map (G_FILE => in_file(G_PRESET), G_WIDTH => G_WIDTH, G_HEIGHT => G_HEIGHT, G_FRAMES => G_FRAMES,
                     G_DATA_W => C_CI * C_PIX_W, G_VALID_PCT => G_VALID_PCT, G_SEED => 3 + G_PRESET)
        port map (aclk => aclk, aresetn => aresetn, m_tdata => s_data, m_tuser => s_user, m_tlast => s_last,
                  m_tvalid => s_valid, m_tready => s_ready, done => src_done);

    dut : entity work.csc_core
        generic map (G_CH_IN => C_CI, G_CH_OUT => C_CO)
        port map (aclk => aclk, aresetn => aresetn, coeff => coeff, offset => offset,
                  s_axis_tdata => s_data, s_axis_tuser => s_user, s_axis_tlast => s_last, s_axis_tvalid => s_valid,
                  s_axis_tready => s_ready, m_axis_tdata => m_data, m_axis_tuser => m_user, m_axis_tlast => m_last,
                  m_axis_tvalid => m_valid, m_axis_tready => m_ready);

    snk : entity work.axis_file_sink
        generic map (G_FILE => exp_file(G_PRESET), G_WIDTH => G_WIDTH, G_HEIGHT => G_HEIGHT, G_FRAMES => G_FRAMES,
                     G_DATA_W => C_CO * C_PIX_W, G_READY_PCT => G_READY_PCT, G_SEED => 17 + G_PRESET,
                     G_NAME => "csc")
        port map (aclk => aclk, aresetn => aresetn, s_tdata => m_data, s_tuser => m_user, s_tlast => m_last,
                  s_tvalid => m_valid, s_tready => m_ready, errors => errors, cycles => cycles, done => snk_done);

    check : process
        constant C_PIXELS : natural := G_WIDTH * G_HEIGHT * G_FRAMES;
    begin
        wait until snk_done = '1' for 10 ms;
        assert snk_done = '1' report "TIMEOUT: prijemce nedostal vsechny pixely" severity failure;
        if (G_VALID_PCT = 100) and (G_READY_PCT = 100) then
            assert cycles = C_PIXELS - 1
                report "Propustnost: " & integer'image(cycles + 1) & " taktu na " & integer'image(C_PIXELS) & " px"
                severity error;
        end if;
        report "VYSLEDEK csc preset " & integer'image(G_PRESET) & " " & integer'image(G_VALID_PCT) & "/"
            & integer'image(G_READY_PCT) & ": " & pass_fail(errors) & " (" & integer'image(errors) & " chyb, "
            & integer'image(C_PIXELS) & " px, " & integer'image(cycles + 1) & " taktu)";
        assert errors = 0 severity failure;
        std.env.stop;
        wait;
    end process;
end architecture;
