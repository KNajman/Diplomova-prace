--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    filter2d_axil.vhd
-- Popis:     Top-level IP 2D konvoluce K x K: AXI4-Lite registry + filter2d_core
--
-- Mapa registrů shodná s HLS hls_filter2d_KxK (ověřeno proti xhls_filter2d_*_hw.h, jeden driver):
--   0x00 ap_ctrl (ap_done = konec snímku -> přerušení), 0x04 GIE, 0x08 IER, 0x0C ISR
--   0x10 width [11:0], 0x18 height [11:0], 0x20 border [0] (0 nuly, 1 replikace)
--   0x28 scale [17:0] (Q.14), 0x30 delta [15:0] (se znaménkem)
--   K = 3:  0x38 + 8 * i  c<i> [7:0] (int8, i = řádek * K + sloupec), 0x80 status, 0x84 status_ap_vld
--   K >= 5: paměťové okno coeff (4 koeficienty ve slově, bajt n slova w = coeff[4w + n]),
--           5x5: 0x40 - 0x5F, status 0x60;  7x7: 0x40 - 0x7F, status 0x80 (+4 status_ap_vld, COR)
-- Adresy a šířka adresy vzorcem (video_pkg: filter_coeff_mem_base, filter_status_addr, filter_axil_addr_w).
-- Rozměry, okraj a koeficienty převezme jádro průběžně (koeficienty platí okamžitě - měnit mezi snímky).
--
-- Poznámka k návrhu (K >= 5): koeficienty nejsou samostatné registry banky - 49 adres u 7x7 znamenalo
-- dekódování 54 adres a čtecí multiplexor (obálka - jádro = 466 LUT). V okně se zapisuje po slovech
-- s WSTRB přímo do registrů koeficientů (jádro je potřebuje všechny paralelně), zpětné čtení je
-- registrovaný multiplexor slov (latence 1 takt, jak ho banka očekává).
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;
use work.axil_regbank_pkg.all;

entity filter2d_axil is
    generic (
        G_K         : positive := 3;
        G_MAX_WIDTH : positive := C_MAX_WIDTH;
        G_USE_DSP   : boolean  := false
    );
    port (
        aclk          : in  std_logic;
        aresetn       : in  std_logic;
        -- AXI4-Lite (bundle control)
        s_axi_control_awaddr  : in  std_logic_vector(filter_axil_addr_w(G_K) - 1 downto 0);
        s_axi_control_awvalid : in  std_logic;
        s_axi_control_awready : out std_logic;
        s_axi_control_wdata   : in  std_logic_vector(31 downto 0);
        s_axi_control_wstrb   : in  std_logic_vector(3 downto 0);
        s_axi_control_wvalid  : in  std_logic;
        s_axi_control_wready  : out std_logic;
        s_axi_control_bresp   : out std_logic_vector(1 downto 0);
        s_axi_control_bvalid  : out std_logic;
        s_axi_control_bready  : in  std_logic;
        s_axi_control_araddr  : in  std_logic_vector(filter_axil_addr_w(G_K) - 1 downto 0);
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

architecture rtl of filter2d_axil is
    constant C_TAPS          : natural := G_K * G_K;
    constant C_COEFF_IN_MEM  : boolean := filter_coeff_in_memory(G_K);
    constant C_MEM_WORDS     : natural := filter_coeff_mem_words(G_K);
    constant C_MEM_INDEX_W   : natural := clog2(C_MEM_WORDS);
    constant C_ADDR_W        : natural := filter_axil_addr_w(G_K);
    constant C_REG_WIDTH  : natural := 0;
    constant C_REG_HEIGHT : natural := 1;
    constant C_REG_BORDER : natural := 2;
    constant C_REG_SCALE  : natural := 3;
    constant C_REG_DELTA  : natural := 4;
    constant C_REG_COEFF  : natural := 5;                   -- první koeficient (jen K = 3)
    constant C_NUM_REGS   : natural := filter_num_regs(G_K);
    constant C_REG_STATUS : natural := C_NUM_REGS - 1;      -- poslední (u K >= 5 za oknem)

    function mem_words return natural is
    begin
        if C_COEFF_IN_MEM then
            return C_MEM_WORDS;
        end if;
        return 0;
    end function;
    function mem_base return natural is
    begin
        if C_COEFF_IN_MEM then
            return filter_coeff_mem_base(G_K);
        end if;
        return 0;
    end function;
    function regs_after_mem return natural is
    begin
        if C_COEFF_IN_MEM then
            return 1;
        end if;
        return 0;
    end function;

    function reg_widths return t_width_array is
        variable widths : t_width_array(0 to C_NUM_REGS - 1);
    begin
        widths(C_REG_WIDTH)  := C_DIM_W;
        widths(C_REG_HEIGHT) := C_DIM_W;
        widths(C_REG_BORDER) := 1;
        widths(C_REG_SCALE)  := C_FILTER_SCALE_W;
        widths(C_REG_DELTA)  := C_FILTER_DELTA_W;
        if not C_COEFF_IN_MEM then
            for tap in 0 to C_TAPS - 1 loop
                widths(C_REG_COEFF + tap) := C_FILTER_COEFF_W;
            end loop;
        end if;
        widths(C_REG_STATUS) := 4;
        return widths;
    end function;
    function read_only_mask return std_logic_vector is
        variable mask : std_logic_vector(0 to C_NUM_REGS - 1) := (others => '0');
    begin
        mask(C_REG_STATUS) := '1';
        return mask;
    end function;

    signal coeff      : t_filter_coeff_array(0 to C_TAPS - 1) := (others => (others => '0'));
    signal regs       : t_reg_array(0 to C_NUM_REGS - 1);
    signal ro_in      : t_reg_array(0 to C_NUM_REGS - 1) := (others => (others => '0'));
    signal run        : std_logic;
    signal status     : std_logic_vector(3 downto 0);
    signal frame_done : std_logic;
    signal core_s_tvalid, core_s_tready : std_logic;

    signal mem_read_word    : unsigned(C_ADDR_W - 3 downto 0);
    signal mem_read_data    : std_logic_vector(31 downto 0) := (others => '0');
    signal mem_write_enable : std_logic;
    signal mem_write_word   : unsigned(C_ADDR_W - 3 downto 0);
    signal mem_write_data   : std_logic_vector(31 downto 0);
    signal mem_write_strb   : std_logic_vector(3 downto 0);
begin

    -- Bez spuštění jádro nepřijímá (ani do vstupního skid bufferu); run drží 1 po celý snímek
    -- (ap_start se nuluje až s ap_done), rozpracovaný snímek se tedy vždy dokončí
    core_s_tvalid       <= s_axis_video_tvalid and run;
    s_axis_video_tready <= core_s_tready and run;

    ro_in(C_REG_STATUS)(3 downto 0) <= status;

    gen_coeff_regs : if not C_COEFF_IN_MEM generate
        gen_tap : for tap in 0 to C_TAPS - 1 generate
            coeff(tap) <= signed(regs(C_REG_COEFF + tap)(C_FILTER_COEFF_W - 1 downto 0));
        end generate;
    end generate;

    -- K >= 5: koeficienty v okně coeff, slovo w bajt n = coeff[4w + n]
    gen_coeff_memory : if C_COEFF_IN_MEM generate
        process (aclk)
            variable read_word : std_logic_vector(31 downto 0);
        begin
            if rising_edge(aclk) then
                if mem_write_enable = '1' then
                    for tap in 0 to C_TAPS - 1 loop
                        if (mem_write_word(C_MEM_INDEX_W - 1 downto 0) = tap / 4) and (mem_write_strb(tap mod 4) = '1') then
                            coeff(tap) <= signed(mem_write_data(8 * (tap mod 4) + C_FILTER_COEFF_W - 1 downto 8 * (tap mod 4)));
                        end if;
                    end loop;
                end if;
                read_word := (others => '0');
                for tap in 0 to C_TAPS - 1 loop
                    if mem_read_word(C_MEM_INDEX_W - 1 downto 0) = tap / 4 then
                        read_word(8 * (tap mod 4) + C_FILTER_COEFF_W - 1 downto 8 * (tap mod 4)) := std_logic_vector(coeff(tap));
                    end if;
                end loop;
                mem_read_data <= read_word;
            end if;
        end process;
    end generate;

    regbank : entity work.axil_regbank
        generic map (G_NUM_REGS => C_NUM_REGS, G_REG_W => reg_widths, G_RO_MASK => read_only_mask,
                     G_ADDR_W => C_ADDR_W, G_MEM_BASE => mem_base, G_MEM_WORDS => mem_words,
                     G_MEM_WRITABLE => C_COEFF_IN_MEM, G_REGS_AFTER_MEM => regs_after_mem)
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
                  mem_read_word => mem_read_word, mem_read_data => mem_read_data,
                  mem_write_enable => mem_write_enable, mem_write_word => mem_write_word,
                  mem_write_data => mem_write_data, mem_write_strb => mem_write_strb);

    core : entity work.filter2d_core
        generic map (G_K => G_K, G_MAX_WIDTH => G_MAX_WIDTH, G_USE_DSP => G_USE_DSP)
        port map (aclk => aclk, aresetn => aresetn, run => run,
                  width => unsigned(regs(C_REG_WIDTH)(C_DIM_W - 1 downto 0)),
                  height => unsigned(regs(C_REG_HEIGHT)(C_DIM_W - 1 downto 0)),
                  border_replicate => regs(C_REG_BORDER)(0), coeff => coeff,
                  scale => signed(regs(C_REG_SCALE)(C_FILTER_SCALE_W - 1 downto 0)),
                  delta => signed(regs(C_REG_DELTA)(C_FILTER_DELTA_W - 1 downto 0)),
                  status => status, frame_done => frame_done,
                  s_axis_tdata => s_axis_video_tdata, s_axis_tuser => s_axis_video_tuser(0),
                  s_axis_tlast => s_axis_video_tlast, s_axis_tvalid => core_s_tvalid,
                  s_axis_tready => core_s_tready,
                  m_axis_tdata => m_axis_video_tdata, m_axis_tuser => m_axis_video_tuser(0),
                  m_axis_tlast => m_axis_video_tlast, m_axis_tvalid => m_axis_video_tvalid,
                  m_axis_tready => m_axis_video_tready);

end architecture;
