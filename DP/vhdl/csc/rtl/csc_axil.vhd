--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    csc_axil.vhd
-- Popis:     Top-level IP převodu barev: AXI4-Lite registry (mapa jako HLS) + csc_core
--
-- Mapa registrů je shodná s HLS variantou se stejnými G_CH_IN/G_CH_OUT, takže stačí driver
-- vygenerovaný Vitisem (XHls_csc_rgb / XHls_csc_rgb_to_gray / XHls_csc_gray_to_rgb):
--   3 -> 3: 0x10 c00, c01, c02, c10, c11, c12, c20, c21, c22, o0, o1, o2   (12 registrů po 8 B)
--   3 -> 1: 0x10 c00, c01, c02, o0                                       (4 registry)
--   1 -> 3: 0x10 c00, c10, c20, o0, o1, o2                               (6 registrů)
-- Koeficienty jsou bity 17:0 (Q2.15 se znaménkem), offsety bity 9:0; jen ty se ukládají (G_REG_W).
-- Jádro přijímá data jen při run = ap_start | auto_restart (ovladač zapíše 0x81 na 0x00).
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;
use work.axil_regbank_pkg.all;

entity csc_axil is
    generic(
        G_CH_IN  : positive := 3;
        G_CH_OUT : positive := 3
    );
    port(
        aclk                  : in  std_logic;
        aresetn               : in  std_logic;
        -- AXI4-Lite (bundle control)
        s_axi_control_awaddr  : in  std_logic_vector(7 downto 0);
        s_axi_control_awvalid : in  std_logic;
        s_axi_control_awready : out std_logic;
        s_axi_control_wdata   : in  std_logic_vector(31 downto 0);
        s_axi_control_wstrb   : in  std_logic_vector(3 downto 0);
        s_axi_control_wvalid  : in  std_logic;
        s_axi_control_wready  : out std_logic;
        s_axi_control_bresp   : out std_logic_vector(1 downto 0);
        s_axi_control_bvalid  : out std_logic;
        s_axi_control_bready  : in  std_logic;
        s_axi_control_araddr  : in  std_logic_vector(7 downto 0);
        s_axi_control_arvalid : in  std_logic;
        s_axi_control_arready : out std_logic;
        s_axi_control_rdata   : out std_logic_vector(31 downto 0);
        s_axi_control_rresp   : out std_logic_vector(1 downto 0);
        s_axi_control_rvalid  : out std_logic;
        s_axi_control_rready  : in  std_logic;
        interrupt             : out std_logic;
        -- AXI4-Stream Video
        s_axis_video_tdata    : in  std_logic_vector(G_CH_IN * C_PIX_W - 1 downto 0);
        s_axis_video_tuser    : in  std_logic_vector(0 downto 0);
        s_axis_video_tlast    : in  std_logic;
        s_axis_video_tvalid   : in  std_logic;
        s_axis_video_tready   : out std_logic;
        m_axis_video_tdata    : out std_logic_vector(G_CH_OUT * C_PIX_W - 1 downto 0);
        m_axis_video_tuser    : out std_logic_vector(0 downto 0);
        m_axis_video_tlast    : out std_logic;
        m_axis_video_tvalid   : out std_logic;
        m_axis_video_tready   : in  std_logic
    );
end entity;

architecture rtl of csc_axil is
    -- Počet registrů podle varianty (jako HLS top funkce)
    function num_regs(ch_in, ch_out : positive) return positive is
    begin
        if ch_out = 1 then
            return 4;
        end if;                         -- c00 c01 c02 o0
        if ch_in = 1 then
            return 6;
        end if;                         -- c00 c10 c20 o0 o1 o2
        return 12;
    end function;
    constant C_NUM_REGS : positive := num_regs(G_CH_IN, G_CH_OUT);

    -- Platné šířky registrů: koeficienty C_CSC_COEFF_W, offsety C_CSC_OFFSET_W (pořadí jako mapa HLS)
    function reg_widths(num_regs : positive) return t_width_array is
        variable widths : t_width_array(0 to num_regs - 1);
    begin
        for reg in 0 to num_regs - 1 loop
            widths(reg) := C_CSC_COEFF_W;
        end loop;
        if num_regs = 12 then
            for reg in 9 to 11 loop
                widths(reg) := C_CSC_OFFSET_W;
            end loop;
        elsif num_regs = 4 then
            widths(3) := C_CSC_OFFSET_W;
        else
            for reg in 3 to 5 loop
                widths(reg) := C_CSC_OFFSET_W;
            end loop;
        end if;
        return widths;
    end function;

    signal regs                         : t_reg_array(0 to C_NUM_REGS - 1);
    signal run                          : std_logic;
    signal coeff                        : t_csc_coeff_array;
    signal offset                       : t_csc_offset_array;
    signal core_s_tvalid, core_s_tready : std_logic;

    function reg_to_coeff(reg : std_logic_vector) return signed is
    begin
        return signed(reg(C_CSC_COEFF_W - 1 downto 0));
    end function;
    function reg_to_offset(reg : std_logic_vector) return signed is
    begin
        return signed(reg(C_CSC_OFFSET_W - 1 downto 0));
    end function;
begin

    regbank : entity work.axil_regbank
        generic map(G_NUM_REGS => C_NUM_REGS, G_REG_W => reg_widths(C_NUM_REGS), G_RO_MASK => (0 to C_NUM_REGS - 1 => '0'), G_ADDR_W => 8)
        port map(aclk          => aclk, aresetn => aresetn,
                 s_axi_awaddr  => s_axi_control_awaddr, s_axi_awvalid => s_axi_control_awvalid,
                 s_axi_awready => s_axi_control_awready, s_axi_wdata => s_axi_control_wdata,
                 s_axi_wstrb   => s_axi_control_wstrb, s_axi_wvalid => s_axi_control_wvalid,
                 s_axi_wready  => s_axi_control_wready, s_axi_bresp => s_axi_control_bresp,
                 s_axi_bvalid  => s_axi_control_bvalid, s_axi_bready => s_axi_control_bready,
                 s_axi_araddr  => s_axi_control_araddr, s_axi_arvalid => s_axi_control_arvalid,
                 s_axi_arready => s_axi_control_arready, s_axi_rdata => s_axi_control_rdata,
                 s_axi_rresp   => s_axi_control_rresp, s_axi_rvalid => s_axi_control_rvalid,
                 s_axi_rready  => s_axi_control_rready,
                 regs          => regs, ro_in => (others => (others => '0')), run => run, done_in => '0', interrupt => interrupt);

    -- Registry -> matice (nepoužité prvky 0)
    process(regs)
    begin
        coeff  <= (others => (others => (others => '0')));
        offset <= (others => (others => '0'));
        if C_NUM_REGS = 12 then
            for out_ch in 0 to 2 loop
                for in_ch in 0 to 2 loop
                    coeff(out_ch, in_ch) <= reg_to_coeff(regs(3 * out_ch + in_ch));
                end loop;
                offset(out_ch) <= reg_to_offset(regs(9 + out_ch));
            end loop;
        elsif C_NUM_REGS = 4 then
            for in_ch in 0 to 2 loop
                coeff(0, in_ch) <= reg_to_coeff(regs(in_ch));
            end loop;
            offset(0) <= reg_to_offset(regs(3));
        else
            for out_ch in 0 to 2 loop
                coeff(out_ch, 0) <= reg_to_coeff(regs(out_ch));
                offset(out_ch)   <= reg_to_offset(regs(3 + out_ch));
            end loop;
        end if;
    end process;

    -- Bez spuštění jádro nepřijímá
    core_s_tvalid       <= s_axis_video_tvalid and run;
    s_axis_video_tready <= core_s_tready and run;

    core : entity work.csc_core
        generic map(G_CH_IN => G_CH_IN, G_CH_OUT => G_CH_OUT)
        port map(aclk          => aclk, aresetn => aresetn, coeff => coeff, offset => offset,
                 s_axis_tdata  => s_axis_video_tdata, s_axis_tuser => s_axis_video_tuser(0),
                 s_axis_tlast  => s_axis_video_tlast, s_axis_tvalid => core_s_tvalid, s_axis_tready => core_s_tready,
                 m_axis_tdata  => m_axis_video_tdata, m_axis_tuser => m_axis_video_tuser(0),
                 m_axis_tlast  => m_axis_video_tlast, m_axis_tvalid => m_axis_video_tvalid,
                 m_axis_tready => m_axis_video_tready);

end architecture;
