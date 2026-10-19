--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    axil_regbank.vhd
-- Popis:     Registrová banka AXI4-Lite s mapou shodnou s HLS (s_axilite, bundle control)
--
-- Mapa (stejná jako generuje Vitis HLS 2025.2, takže VHDL i HLS jádro ovládá jeden C driver
-- vygenerovaný Vitisem, např. XHls_csc_rgb_*):
--   0x00 ap_ctrl: bit0 ap_start_reg (RW, nuluje se při spuštění bez auto_restart),
--                 bit1 ap_done_reg (R, nuluje se čtením), bit2 ap_idle (R), bit3 ap_ready (R, nuluje čtení),
--                 bit7 auto_restart (RW), bit9 interrupt (R)
--   0x04 GIE (bit0), 0x08 IER (bit0 done, bit1 ready), 0x0C ISR (bit0 done, bit1 ready, zápis 1 = přepnutí)
--   0x10 + 8*i  registr i (32 b; RW parametr, nebo RO výstup jádra podle G_RO_MASK)
--   0x14 + 8*i  u RO registru "ap_vld" (bit0 = 1 po done, nuluje se čtením - COR jako HLS)
--
-- Poznámky k návrhu:
--  * Bodová VHDL jádra nemají snímek ani řádek jako transakci, běží nepřetržitě. Pro shodné
--    chování s ovladačem: run = ap_start_reg or auto_restart; jádro s run = 0 drží TREADY = 0.
--    done_in (konec snímku u okénkových jader, u bodových nepoužito) nastaví ap_done_reg/ISR.
--  * G_REG_W = platná šířka každého registru. Ukládají se jen platné bity, horní bity jsou
--    konstantní 0 a syntéza jejich FF odstraní (jako HLS: nepoužité bity = reserved, čtou se 0).
--    U 12 registrů CSC to ušetří 192 FF a zmenší čtecí multiplexor.
--  * Zápisové kanály AW a W se přijímají nezávisle (AXI4-Lite to dovoluje), odpověď B až
--    po provedení zápisu. Neplatné adresy: zápis se ignoruje, čtení vrací 0.
--  * Dekódování adresy je pipelinované a bez aritmetiky: adresa se porovná s konstantami
--    16 + 8 * k (každé porovnání = 8bitová rovnost, 2 úrovně LUT) a výsledek výběru se
--    zaregistruje. Zápis i čtení tak trvají o takt déle (u AXI4-Lite nevadí), ale kritická
--    cesta už nevede přes odčítání a dělení adresy (v1: 9 úrovní logiky, 3x CARRY8).
--    Zápis: takt 1 zachycení AW+W, takt 2 dekódování, takt 3 provedení + BVALID.
--    Čtení:  takt 1 zachycení AR, takt 2 dekódování, takt 3 multiplexor dat + RVALID.
--  * Volitelné paměťové okno (G_MEM_BASE, G_MEM_WORDS) pro pole, která HLS mapuje do AXI4-Lite
--    (např. hist[256] na 0x400 - 0x7FF): jádro dodá paměť s registrovaným čtením, banka jí posílá
--    index slova a v taktu 3 vrátí data. Zápis do okna se ignoruje (u histogramu je jen pro čtení).
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package axil_regbank_pkg is
    type t_reg_array   is array (natural range <>) of std_logic_vector(31 downto 0);
    type t_width_array is array (natural range <>) of natural range 1 to 32;
end package;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.axil_regbank_pkg.all;
use work.video_pkg.all;               -- clog2, to_sl

entity axil_regbank is
    generic(
        G_NUM_REGS : positive         := 12;
        G_REG_W    : t_width_array;     -- platná šířka každého registru (bity nad ní = 0)
        G_RO_MASK  : std_logic_vector := "0"; -- bit = 1 -> registr je výstup jádra (jen čtení)
        G_ADDR_W   : positive         := 8;
        G_MEM_BASE  : natural         := 0; -- paměťové okno (pole HLS v AXI4-Lite), zarovnané na svou velikost
        G_MEM_WORDS : natural         := 0  -- počet 32b slov okna (mocnina 2), 0 = bez okna
    );
    port(
        aclk          : in  std_logic;
        aresetn       : in  std_logic;
        -- AXI4-Lite slave
        s_axi_awaddr  : in  std_logic_vector(G_ADDR_W - 1 downto 0);
        s_axi_awvalid : in  std_logic;
        s_axi_awready : out std_logic;
        s_axi_wdata   : in  std_logic_vector(31 downto 0);
        s_axi_wstrb   : in  std_logic_vector(3 downto 0);
        s_axi_wvalid  : in  std_logic;
        s_axi_wready  : out std_logic;
        s_axi_bresp   : out std_logic_vector(1 downto 0);
        s_axi_bvalid  : out std_logic;
        s_axi_bready  : in  std_logic;
        s_axi_araddr  : in  std_logic_vector(G_ADDR_W - 1 downto 0);
        s_axi_arvalid : in  std_logic;
        s_axi_arready : out std_logic;
        s_axi_rdata   : out std_logic_vector(31 downto 0);
        s_axi_rresp   : out std_logic_vector(1 downto 0);
        s_axi_rvalid  : out std_logic;
        s_axi_rready  : in  std_logic;
        -- Jádro
        regs          : out t_reg_array(0 to G_NUM_REGS - 1); -- RW parametry
        ro_in         : in  t_reg_array(0 to G_NUM_REGS - 1); -- RO výstupy jádra (ostatní ignorováno)
        run           : out std_logic;
        done_in       : in  std_logic;  -- 1takt pulz: transakce (snímek) dokončena
        interrupt     : out std_logic;
        -- Paměťové okno: index slova (adresa / 4) a data z paměti jádra s registrovaným čtením (latence 1)
        mem_read_word : out unsigned(G_ADDR_W - 3 downto 0);
        mem_read_data : in  std_logic_vector(31 downto 0) := (others => '0')
    );
end entity;

architecture rtl of axil_regbank is
    constant C_IS_READ_ONLY : std_logic_vector(0 to G_NUM_REGS - 1) := G_RO_MASK;

    constant C_ADDR_AP_CTRL : natural := 16#00#;
    constant C_ADDR_GIE     : natural := 16#04#;
    constant C_ADDR_IER     : natural := 16#08#;
    constant C_ADDR_ISR     : natural := 16#0C#;

    -- Adresa datového slova registru (0x10 + 8 * index), +4 = ap_vld u RO registru
    function reg_data_addr(reg_idx : natural) return natural is
    begin
        return 16#10# + 8 * reg_idx;
    end function;

    -- Výsledek dekódování adresy: jeden bit na každé možné cílové místo
    type t_addr_select is record
        ap_ctrl  : std_logic;
        gie      : std_logic;
        ier      : std_logic;
        isr      : std_logic;
        reg_data : std_logic_vector(0 to G_NUM_REGS - 1);
        reg_vld  : std_logic_vector(0 to G_NUM_REGS - 1);
        mem      : std_logic;           -- adresa v paměťovém okně
    end record;

    -- Paměťové okno: horní bity adresy = horní bity G_MEM_BASE (okno je zarovnané na svou velikost)
    constant C_MEM_ADDR_LSB : natural := clog2(maximum(4 * G_MEM_WORDS, 1));
    function in_memory_window(addr_value : unsigned) return std_logic is
    begin
        if (G_MEM_WORDS = 0) or (C_MEM_ADDR_LSB >= addr_value'length) then
            return '0';
        end if;
        return to_sl(addr_value(addr_value'high downto C_MEM_ADDR_LSB)
                     = to_unsigned(G_MEM_BASE / (2 ** C_MEM_ADDR_LSB), addr_value'length - C_MEM_ADDR_LSB));
    end function;

    -- Dekódování porovnáním s konstantami (žádné odčítání ani dělení adresy)
    function decode_addr(addr : std_logic_vector) return t_addr_select is
        variable addr_value : unsigned(addr'length - 1 downto 0) := unsigned(addr);
        variable sel        : t_addr_select;
    begin
        sel.ap_ctrl := to_sl(addr_value = C_ADDR_AP_CTRL);
        sel.gie     := to_sl(addr_value = C_ADDR_GIE);
        sel.ier     := to_sl(addr_value = C_ADDR_IER);
        sel.isr     := to_sl(addr_value = C_ADDR_ISR);
        for reg_idx in 0 to G_NUM_REGS - 1 loop
            sel.reg_data(reg_idx) := to_sl(addr_value = reg_data_addr(reg_idx));
            sel.reg_vld(reg_idx)  := to_sl(addr_value = reg_data_addr(reg_idx) + 4);
        end loop;
        sel.mem     := in_memory_window(addr_value);
        return sel;
    end function;

    constant C_SELECT_NONE : t_addr_select := (ap_ctrl  => '0', gie => '0', ier => '0', isr => '0',
                                               reg_data => (others => '0'), reg_vld => (others => '0'), mem => '0');

    signal reg_value        : t_reg_array(0 to G_NUM_REGS - 1) := (others => (others => '0'));
    signal ap_start_reg     : std_logic                        := '0';
    signal auto_restart_reg : std_logic                        := '0';
    signal ap_done_reg      : std_logic                        := '0';
    signal global_irq_en    : std_logic                        := '0';
    signal irq_enable       : std_logic_vector(1 downto 0)     := "00";
    signal irq_status       : std_logic_vector(1 downto 0)     := "00";
    signal ro_valid_reg     : std_logic                        := '0';

    -- Zápisová cesta
    signal aw_captured   : std_logic                               := '0';
    signal w_captured    : std_logic                               := '0';
    signal aw_addr_reg   : std_logic_vector(G_ADDR_W - 1 downto 0) := (others => '0');
    signal w_data_reg    : std_logic_vector(31 downto 0)           := (others => '0');
    signal w_strb_reg    : std_logic_vector(3 downto 0)            := (others => '0');
    signal write_decoded : std_logic                               := '0';
    signal write_select  : t_addr_select                           := C_SELECT_NONE;
    signal bvalid_reg    : std_logic                               := '0';

    -- Čtecí cesta
    signal ar_captured  : std_logic                               := '0';
    signal ar_addr_reg  : std_logic_vector(G_ADDR_W - 1 downto 0) := (others => '0');
    signal read_decoded : std_logic                               := '0';
    signal read_select  : t_addr_select                           := C_SELECT_NONE;
    signal rvalid_reg   : std_logic                               := '0';
    signal rdata_reg    : std_logic_vector(31 downto 0)           := (others => '0');
begin

    regs      <= reg_value;
    -- index slova v okně: paměť čte v taktu 2 (adresa zachycená v taktu 1), data jsou hotová v taktu 3
    mem_read_word <= unsigned(ar_addr_reg(G_ADDR_W - 1 downto 2));
    run       <= ap_start_reg or auto_restart_reg;
    interrupt <= global_irq_en and (irq_status(0) or irq_status(1));

    s_axi_awready <= not aw_captured;
    s_axi_wready  <= not w_captured;
    s_axi_bvalid  <= bvalid_reg;
    s_axi_bresp   <= "00";
    s_axi_arready <= not ar_captured;
    s_axi_rvalid  <= rvalid_reg;
    s_axi_rdata   <= rdata_reg;
    s_axi_rresp   <= "00";

    process(aclk)
        variable read_word          : std_logic_vector(31 downto 0);
        variable clear_done_on_read : boolean;
        variable clear_vld_on_read  : boolean;
    begin
        if rising_edge(aclk) then
            clear_done_on_read := false;
            clear_vld_on_read  := false;
            if aresetn = '0' then
                aw_captured      <= '0';
                w_captured       <= '0';
                write_decoded    <= '0';
                bvalid_reg       <= '0';
                ar_captured      <= '0';
                read_decoded     <= '0';
                rvalid_reg       <= '0';
                ap_start_reg     <= '0';
                auto_restart_reg <= '0';
                ap_done_reg      <= '0';
                global_irq_en    <= '0';
                irq_enable       <= "00";
                irq_status       <= "00";
                ro_valid_reg     <= '0';
            else
                ---------------------------------------------------------------- zápis
                -- takt 1: AW a W nezávisle
                if (s_axi_awvalid = '1') and (aw_captured = '0') then
                    aw_addr_reg <= s_axi_awaddr;
                    aw_captured <= '1';
                end if;
                if (s_axi_wvalid = '1') and (w_captured = '0') then
                    w_data_reg <= s_axi_wdata;
                    w_strb_reg <= s_axi_wstrb;
                    w_captured <= '1';
                end if;
                -- takt 2: dekódování adresy do registru
                if (aw_captured = '1') and (w_captured = '1') and (write_decoded = '0') and (bvalid_reg = '0') then
                    write_select  <= decode_addr(aw_addr_reg);
                    write_decoded <= '1';
                end if;
                -- takt 3: provedení zápisu a odpověď
                if write_decoded = '1' then
                    if (write_select.ap_ctrl = '1') and (w_strb_reg(0) = '1') then
                        if w_data_reg(0) = '1' then
                            ap_start_reg <= '1';
                        end if;
                        auto_restart_reg <= w_data_reg(7);
                    end if;
                    if write_select.gie = '1' then
                        global_irq_en <= w_data_reg(0);
                    end if;
                    if write_select.ier = '1' then
                        irq_enable <= w_data_reg(1 downto 0);
                    end if;
                    if write_select.isr = '1' then
                        irq_status <= irq_status xor w_data_reg(1 downto 0); -- TOW
                    end if;
                    for reg_idx in 0 to G_NUM_REGS - 1 loop
                        if (write_select.reg_data(reg_idx) = '1') and (C_IS_READ_ONLY(reg_idx) = '0') then
                            for bit in 0 to 31 loop
                                if (w_strb_reg(bit / 8) = '1') and (bit < G_REG_W(G_REG_W'low + reg_idx)) then
                                    reg_value(reg_idx)(bit) <= w_data_reg(bit);
                                end if;
                            end loop;
                        end if;
                    end loop;
                    write_decoded <= '0';
                    bvalid_reg    <= '1';
                end if;
                if (bvalid_reg = '1') and (s_axi_bready = '1') then
                    bvalid_reg  <= '0';
                    aw_captured <= '0';
                    w_captured  <= '0';
                end if;

                ---------------------------------------------------------------- čtení
                -- takt 1: zachycení adresy
                if (s_axi_arvalid = '1') and (ar_captured = '0') then
                    ar_addr_reg <= s_axi_araddr;
                    ar_captured <= '1';
                end if;
                -- takt 2: dekódování
                if (ar_captured = '1') and (read_decoded = '0') and (rvalid_reg = '0') then
                    read_select  <= decode_addr(ar_addr_reg);
                    read_decoded <= '1';
                end if;
                -- takt 3: multiplexor dat
                if read_decoded = '1' then
                    read_word := (others => '0');
                    if read_select.ap_ctrl = '1' then
                        read_word(0)       := ap_start_reg;
                        read_word(1)       := ap_done_reg;
                        read_word(2)       := not (ap_start_reg or auto_restart_reg); -- ap_idle
                        read_word(3)       := ap_start_reg or auto_restart_reg; -- ap_ready (přijímá data)
                        read_word(7)       := auto_restart_reg;
                        read_word(9)       := global_irq_en and (irq_status(0) or irq_status(1));
                        clear_done_on_read := true;
                    end if;
                    if read_select.gie = '1' then
                        read_word(0) := global_irq_en;
                    end if;
                    if read_select.ier = '1' then
                        read_word(1 downto 0) := irq_enable;
                    end if;
                    if read_select.isr = '1' then
                        read_word(1 downto 0) := irq_status;
                    end if;
                    for reg_idx in 0 to G_NUM_REGS - 1 loop
                        if read_select.reg_data(reg_idx) = '1' then
                            if C_IS_READ_ONLY(reg_idx) = '1' then
                                for bit in 0 to 31 loop
                                    if bit < G_REG_W(G_REG_W'low + reg_idx) then
                                        read_word(bit) := ro_in(reg_idx)(bit);
                                    end if;
                                end loop;
                            else
                                read_word := reg_value(reg_idx);
                            end if;
                        end if;
                        if (read_select.reg_vld(reg_idx) = '1') and (C_IS_READ_ONLY(reg_idx) = '1') then
                            read_word(0)      := ro_valid_reg; -- ap_vld
                            clear_vld_on_read := true; -- COR jako HLS
                        end if;
                    end loop;
                    if read_select.mem = '1' then
                        read_word := mem_read_data;
                    end if;
                    rdata_reg    <= read_word;
                    rvalid_reg   <= '1';
                    read_decoded <= '0';
                end if;
                if (rvalid_reg = '1') and (s_axi_rready = '1') then
                    rvalid_reg  <= '0';
                    ar_captured <= '0';
                end if;

                ---------------------------------------------------------------- jádro
                if done_in = '1' then
                    ap_done_reg  <= '1';
                    ro_valid_reg <= '1';
                    if auto_restart_reg = '0' then
                        ap_start_reg <= '0';
                    end if;
                    if irq_enable(0) = '1' then
                        irq_status(0) <= '1';
                    end if;
                else
                    if clear_done_on_read then
                        ap_done_reg <= '0';
                    end if;
                    if clear_vld_on_read then
                        ro_valid_reg <= '0';
                    end if;
                end if;
            end if;
        end if;
    end process;

end architecture;
