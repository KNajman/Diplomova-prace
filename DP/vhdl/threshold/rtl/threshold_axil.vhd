--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    threshold_axil.vhd
-- Popis:     Top-level IP prahování: AXI4-Lite registry (mapa jako HLS hls_threshold) + threshold_core
--
-- Mapa registrů (HLS se stejným pořadím argumentů thresh, maxval, type dá stejnou mapu i driver):
--   0x00 ap_ctrl, 0x04 GIE, 0x08 IER, 0x0C ISR
--   0x10 thresh [7:0], 0x18 maxval [7:0], 0x20 type [2:0] (0 BINARY .. 4 TOZERO_INV)
-- Šířka adresy vzorcem axil_addr_w(C_THRESH_NUM_REGS).
-- Jádro přijímá data jen při run = ap_start | auto_restart (ovladač zapíše 0x81 na 0x00).
-- Práh lze měnit za běhu (např. Otsuův práh z histogramu předchozího snímku, počítá ARM);
-- změna se projeví do 2 taktů, pro změnu přesně na hranici snímku zastavit jádro (ap_start = 0).
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;
use work.axil_regbank_pkg.all;

entity threshold_axil is
    port (
        aclk          : in  std_logic;
        aresetn       : in  std_logic;
        -- AXI4-Lite (bundle control)
        s_axi_control_awaddr  : in  std_logic_vector(axil_addr_w(C_THRESH_NUM_REGS) - 1 downto 0);
        s_axi_control_awvalid : in  std_logic;
        s_axi_control_awready : out std_logic;
        s_axi_control_wdata   : in  std_logic_vector(31 downto 0);
        s_axi_control_wstrb   : in  std_logic_vector(3 downto 0);
        s_axi_control_wvalid  : in  std_logic;
        s_axi_control_wready  : out std_logic;
        s_axi_control_bresp   : out std_logic_vector(1 downto 0);
        s_axi_control_bvalid  : out std_logic;
        s_axi_control_bready  : in  std_logic;
        s_axi_control_araddr  : in  std_logic_vector(axil_addr_w(C_THRESH_NUM_REGS) - 1 downto 0);
        s_axi_control_arvalid : in  std_logic;
        s_axi_control_arready : out std_logic;
        s_axi_control_rdata   : out std_logic_vector(31 downto 0);
        s_axi_control_rresp   : out std_logic_vector(1 downto 0);
        s_axi_control_rvalid  : out std_logic;
        s_axi_control_rready  : in  std_logic;
        interrupt             : out std_logic;
        -- AXI4-Stream Video (8 b)
        s_axis_video_tdata  : in  std_logic_vector(C_PIX_W - 1 downto 0);
        s_axis_video_tuser  : in  std_logic_vector(0 downto 0);
        s_axis_video_tlast  : in  std_logic;
        s_axis_video_tvalid : in  std_logic;
        s_axis_video_tready : out std_logic;
        m_axis_video_tdata  : out std_logic_vector(C_PIX_W - 1 downto 0);
        m_axis_video_tuser  : out std_logic_vector(0 downto 0);
        m_axis_video_tlast  : out std_logic;
        m_axis_video_tvalid : out std_logic;
        m_axis_video_tready : in  std_logic
    );
end entity;

architecture rtl of threshold_axil is
    constant C_REG_THRESH : natural := 0;
    constant C_REG_MAXVAL : natural := 1;
    constant C_REG_TYPE   : natural := 2;
    constant C_NUM_REGS   : natural := C_THRESH_NUM_REGS;
    constant C_REG_W      : t_width_array(0 to C_NUM_REGS - 1) := (C_PIX_W, C_PIX_W, C_THRESH_TYPE_W);
    constant C_RO_MASK    : std_logic_vector(0 to C_NUM_REGS - 1) := (others => '0');

    signal regs : t_reg_array(0 to C_NUM_REGS - 1);
    signal run  : std_logic;
    signal core_s_tvalid, core_s_tready : std_logic;
begin

    core_s_tvalid       <= s_axis_video_tvalid and run;
    s_axis_video_tready <= core_s_tready and run;

    regbank : entity work.axil_regbank
        generic map (G_NUM_REGS => C_NUM_REGS, G_REG_W => C_REG_W, G_RO_MASK => C_RO_MASK,
                     G_ADDR_W => axil_addr_w(C_NUM_REGS))
        port map (aclk => aclk, aresetn => aresetn,
                  s_axi_awaddr => s_axi_control_awaddr, s_axi_awvalid => s_axi_control_awvalid,
                  s_axi_awready => s_axi_control_awready, s_axi_wdata => s_axi_control_wdata,
                  s_axi_wstrb => s_axi_control_wstrb, s_axi_wvalid => s_axi_control_wvalid,
                  s_axi_wready => s_axi_control_wready, s_axi_bresp => s_axi_control_bresp,
                  s_axi_bvalid => s_axi_control_bvalid, s_axi_bready => s_axi_control_bready,
                  s_axi_araddr => s_axi_control_araddr, s_axi_arvalid => s_axi_control_arvalid,
                  s_axi_arready => s_axi_control_arready, s_axi_rdata => s_axi_control_rdata,
                  s_axi_rresp => s_axi_control_rresp, s_axi_rvalid => s_axi_control_rvalid,
                  s_axi_rready => s_axi_control_rready,
                  regs => regs, ro_in => (others => (others => '0')), run => run, done_in => '0', interrupt => interrupt);

    core : entity work.threshold_core
        port map (aclk => aclk, aresetn => aresetn,
                  thresh      => unsigned(regs(C_REG_THRESH)(C_PIX_W - 1 downto 0)),
                  maxval      => unsigned(regs(C_REG_MAXVAL)(C_PIX_W - 1 downto 0)),
                  thresh_type => unsigned(regs(C_REG_TYPE)(C_THRESH_TYPE_W - 1 downto 0)),
                  s_axis_tdata => s_axis_video_tdata, s_axis_tuser => s_axis_video_tuser(0),
                  s_axis_tlast => s_axis_video_tlast, s_axis_tvalid => core_s_tvalid,
                  s_axis_tready => core_s_tready,
                  m_axis_tdata => m_axis_video_tdata, m_axis_tuser => m_axis_video_tuser(0),
                  m_axis_tlast => m_axis_video_tlast, m_axis_tvalid => m_axis_video_tvalid,
                  m_axis_tready => m_axis_video_tready);

end architecture;
