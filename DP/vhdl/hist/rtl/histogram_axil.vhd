--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    histogram_axil.vhd
-- Popis:     Top-level IP histogramu: AXI4-Lite registry (mapa jako HLS hls_histogram) + histogram_core
--
-- Mapa registrů (shodná s HLS, driver XHls_histogram):
--   0x00 ap_ctrl (ap_done = histogram snímku platný -> přerušení), 0x04 GIE, 0x08 IER, 0x0C ISR
--   0x10 height [11:0]
--   0x18 status [1:0] (jen čtení: bit0 SKIPPED, bit1 EARLY_SOF), 0x1C status_ap_vld (COR)
--   0x400 - 0x7FF hist[256] (jen čtení, 32 b na koš)
--
-- Poznámky k návrhu:
--  * Výsledková paměť 256 x 32 b je BRAM (simple dual port): zápis z výsypu čítačů jádra, čtení
--    z AXI4-Lite s registrovaným výstupem (latence 1 takt, banka data přebírá v taktu 3).
--    Obsah platí od ap_done do konce dalšího snímku - dvojí buffer jako v HLS.
--  * Šířka adresy vzorcem v video_pkg: C_HIST_AXIL_ADDR_W = clog2(0x400 + 4 * 256) = 11 b.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;
use work.axil_regbank_pkg.all;

entity histogram_axil is
    generic (
        G_MAX_WIDTH  : positive := C_MAX_WIDTH;
        G_MAX_HEIGHT : positive := C_MAX_HEIGHT;
        G_USE_BRAM   : boolean  := true     -- koše v BRAM (jako HLS), false = 256 čítačů ve FF
    );
    port (
        aclk          : in  std_logic;
        aresetn       : in  std_logic;
        -- AXI4-Lite (bundle control)
        s_axi_control_awaddr  : in  std_logic_vector(C_HIST_AXIL_ADDR_W - 1 downto 0);
        s_axi_control_awvalid : in  std_logic;
        s_axi_control_awready : out std_logic;
        s_axi_control_wdata   : in  std_logic_vector(31 downto 0);
        s_axi_control_wstrb   : in  std_logic_vector(3 downto 0);
        s_axi_control_wvalid  : in  std_logic;
        s_axi_control_wready  : out std_logic;
        s_axi_control_bresp   : out std_logic_vector(1 downto 0);
        s_axi_control_bvalid  : out std_logic;
        s_axi_control_bready  : in  std_logic;
        s_axi_control_araddr  : in  std_logic_vector(C_HIST_AXIL_ADDR_W - 1 downto 0);
        s_axi_control_arvalid : in  std_logic;
        s_axi_control_arready : out std_logic;
        s_axi_control_rdata   : out std_logic_vector(31 downto 0);
        s_axi_control_rresp   : out std_logic_vector(1 downto 0);
        s_axi_control_rvalid  : out std_logic;
        s_axi_control_rready  : in  std_logic;
        interrupt             : out std_logic;
        -- AXI4-Stream Video (8 b), průchozí
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

architecture rtl of histogram_axil is
    constant C_BINS       : natural := C_HIST_BINS;
    constant C_MEM_BASE   : natural := C_HIST_MEM_BASE;
    constant C_ADDR_W     : natural := C_HIST_AXIL_ADDR_W;
    constant C_REG_HEIGHT : natural := 0;
    constant C_REG_STATUS : natural := 1;
    constant C_NUM_REGS   : natural := 2;
    constant C_REG_W      : t_width_array(0 to C_NUM_REGS - 1) := (C_DIM_W, 2);
    constant C_RO_MASK    : std_logic_vector(0 to C_NUM_REGS - 1) := "01";

    type t_result_memory is array (0 to C_BINS - 1) of std_logic_vector(31 downto 0);
    signal result_memory : t_result_memory := (others => (others => '0'));
    attribute ram_style : string;
    attribute ram_style of result_memory : signal is "block";

    signal regs       : t_reg_array(0 to C_NUM_REGS - 1);
    signal ro_in      : t_reg_array(0 to C_NUM_REGS - 1) := (others => (others => '0'));
    signal run        : std_logic;
    signal status     : std_logic_vector(1 downto 0);
    signal frame_done : std_logic;
    signal core_s_tvalid, core_s_tready : std_logic;

    signal result_write_enable : std_logic;
    signal result_write_addr   : unsigned(C_PIX_W - 1 downto 0);
    signal result_write_data   : std_logic_vector(31 downto 0);
    signal mem_read_word       : unsigned(C_ADDR_W - 3 downto 0);
    signal mem_read_data       : std_logic_vector(31 downto 0) := (others => '0');
begin

    -- Bez spuštění jádro nepřijímá; run drží 1 po celý snímek (ap_start se nuluje s ap_done)
    core_s_tvalid       <= s_axis_video_tvalid and run;
    s_axis_video_tready <= core_s_tready and run;

    ro_in(C_REG_STATUS)(1 downto 0) <= status;

    regbank : entity work.axil_regbank
        generic map (G_NUM_REGS => C_NUM_REGS, G_REG_W => C_REG_W, G_RO_MASK => C_RO_MASK,
                     G_ADDR_W => C_ADDR_W, G_MEM_BASE => C_MEM_BASE, G_MEM_WORDS => C_BINS)
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
                  regs => regs, ro_in => ro_in, run => run, done_in => frame_done, interrupt => interrupt,
                  mem_read_word => mem_read_word, mem_read_data => mem_read_data);

    -- výsledková BRAM: zápis z jádra, registrované čtení pro AXI4-Lite
    result_memory_port : process (aclk)
    begin
        if rising_edge(aclk) then
            if result_write_enable = '1' then
                result_memory(to_integer(result_write_addr)) <= result_write_data;
            end if;
            mem_read_data <= result_memory(to_integer(mem_read_word(C_PIX_W - 1 downto 0)));
        end if;
    end process;

    core : entity work.histogram_core
        generic map (G_MAX_WIDTH => G_MAX_WIDTH, G_MAX_HEIGHT => G_MAX_HEIGHT, G_USE_BRAM => G_USE_BRAM)
        port map (aclk => aclk, aresetn => aresetn, run => run,
                  height => unsigned(regs(C_REG_HEIGHT)(C_DIM_W - 1 downto 0)),
                  status => status, frame_done => frame_done,
                  result_write_enable => result_write_enable, result_write_addr => result_write_addr,
                  result_write_data => result_write_data,
                  s_axis_tdata => s_axis_video_tdata, s_axis_tuser => s_axis_video_tuser(0),
                  s_axis_tlast => s_axis_video_tlast, s_axis_tvalid => core_s_tvalid,
                  s_axis_tready => core_s_tready,
                  m_axis_tdata => m_axis_video_tdata, m_axis_tuser => m_axis_video_tuser(0),
                  m_axis_tlast => m_axis_video_tlast, m_axis_tvalid => m_axis_video_tvalid,
                  m_axis_tready => m_axis_video_tready);

end architecture;
