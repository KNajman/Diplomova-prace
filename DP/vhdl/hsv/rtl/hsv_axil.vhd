--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    hsv_axil.vhd
-- Popis:     Top-level IP převodu RGB <-> HSV: AXI4-Lite řízení (mapa jako HLS) + rgb2hsv_core / hsv2rgb_core
--
-- Poznámky k návrhu:
--  * HLS verze nemají žádné parametry, mapa registrů obsahuje jen řízení 0x00 - 0x0C
--    (ap_ctrl, GIE, IER, ISR). Registrová banka potřebuje aspoň jeden datový registr, proto má
--    jeden nevyužitý registr šířky 1 b na 0x10 (HLS tam vrací 0, VHDL také - bit se nikam nepoužije
--    a syntéza ho odstraní).
--  * G_RGB_TO_HSV = true -> RGB -> HSV, false -> HSV -> RGB (jedno IP, dvě konfigurace).
--  * G_USE_DSP se předává hsv2rgb_core (násobení HSV -> RGB vždy v DSP); u RGB -> HSV nemá vliv,
--    obě násobení tabulkou (17 a 20 b) dává syntéza do DSP sama. Srovnání false / true viz vysledky.md.
--  * Jádro přijímá data jen při run = ap_start | auto_restart (ovladač zapíše 0x81 na 0x00).
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;
use work.axil_regbank_pkg.all;

entity hsv_axil is
    generic(
        G_RGB_TO_HSV : boolean := true;
        G_USE_DSP    : boolean := false    -- jen HSV -> RGB: true = násobení v DSP (use_dsp = "yes")
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
        s_axis_video_tdata    : in  std_logic_vector(C_RGB_W - 1 downto 0);
        s_axis_video_tuser    : in  std_logic_vector(0 downto 0);
        s_axis_video_tlast    : in  std_logic;
        s_axis_video_tvalid   : in  std_logic;
        s_axis_video_tready   : out std_logic;
        m_axis_video_tdata    : out std_logic_vector(C_RGB_W - 1 downto 0);
        m_axis_video_tuser    : out std_logic_vector(0 downto 0);
        m_axis_video_tlast    : out std_logic;
        m_axis_video_tvalid   : out std_logic;
        m_axis_video_tready   : in  std_logic
    );
end entity;

architecture rtl of hsv_axil is
    constant C_UNUSED_REG_W : t_width_array(0 to 0) := (0 => 1);

    signal run          : std_logic;
    signal core_s_tvalid : std_logic;
    signal core_s_tready : std_logic;
begin

    regbank : entity work.axil_regbank
        generic map(G_NUM_REGS => 1, G_REG_W => C_UNUSED_REG_W, G_RO_MASK => "0", G_ADDR_W => 8)
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
                 regs          => open, ro_in => (others => (others => '0')), run => run, done_in => '0',
                 interrupt     => interrupt);

    -- Bez spuštění jádro nepřijímá
    core_s_tvalid       <= s_axis_video_tvalid and run;
    s_axis_video_tready <= core_s_tready and run;

    gen_rgb_to_hsv : if G_RGB_TO_HSV generate
        core : entity work.rgb2hsv_core
            port map(aclk          => aclk, aresetn => aresetn,
                     s_axis_tdata  => s_axis_video_tdata, s_axis_tuser => s_axis_video_tuser(0),
                     s_axis_tlast  => s_axis_video_tlast, s_axis_tvalid => core_s_tvalid, s_axis_tready => core_s_tready,
                     m_axis_tdata  => m_axis_video_tdata, m_axis_tuser => m_axis_video_tuser(0),
                     m_axis_tlast  => m_axis_video_tlast, m_axis_tvalid => m_axis_video_tvalid,
                     m_axis_tready => m_axis_video_tready);
    end generate;

    gen_hsv_to_rgb : if not G_RGB_TO_HSV generate
        core : entity work.hsv2rgb_core
            generic map(G_USE_DSP => G_USE_DSP)
            port map(aclk          => aclk, aresetn => aresetn,
                     s_axis_tdata  => s_axis_video_tdata, s_axis_tuser => s_axis_video_tuser(0),
                     s_axis_tlast  => s_axis_video_tlast, s_axis_tvalid => core_s_tvalid, s_axis_tready => core_s_tready,
                     m_axis_tdata  => m_axis_video_tdata, m_axis_tuser => m_axis_video_tuser(0),
                     m_axis_tlast  => m_axis_video_tlast, m_axis_tvalid => m_axis_video_tvalid,
                     m_axis_tready => m_axis_video_tready);
    end generate;

end architecture;
