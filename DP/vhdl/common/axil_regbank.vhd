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
--   0x14 + 8*i  u RO registru "ap_vld" (bit0 = 1, výstup je platný od prvního done)
--
-- Poznámky k návrhu:
--  * Bodová VHDL jádra nemají snímek ani řádek jako transakci, běží nepřetržitě. Pro shodné
--    chování s ovladačem: run = ap_start_reg or auto_restart; jádro s run = 0 drží TREADY = 0.
--    done_in (konec snímku u okénkových jader, u bodových nepoužito) nastaví ap_done_reg/ISR.
--  * G_REG_W = platná šířka každého registru. Ukládají se jen platné bity, horní bity jsou
--    konstantní 0 a syntéza jejich FF odstraní (jako HLS: nepoužité bity = reserved, čtou se 0).
--    U 12 registrů CSC to ušetří 192 FF a zmenší čtecí multiplexor.
--  * Zápisové kanály AW a W se přijímají nezávisle (AXI4-Lite to dovoluje), odpověď B až
--    po obou. Čtení má latenci 1 takt. Neplatné adresy: zápis se ignoruje, čtení vrací 0.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package axil_regbank_pkg is
    type t_reg_array is array (natural range <>) of std_logic_vector(31 downto 0);
    type t_width_array is array (natural range <>) of natural range 1 to 32;
end package;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.axil_regbank_pkg.all;

entity axil_regbank is
    generic (
        G_NUM_REGS : positive := 12;
        G_REG_W    : t_width_array;               -- platná šířka každého registru (bity nad ní = 0)
        G_RO_MASK  : std_logic_vector := "0";     -- bit = 1 -> registr je výstup jádra (jen čtení)
        G_ADDR_W   : positive := 8
    );
    port (
        aclk            : in  std_logic;
        aresetn         : in  std_logic;
        -- AXI4-Lite slave
        s_axi_awaddr    : in  std_logic_vector(G_ADDR_W - 1 downto 0);
        s_axi_awvalid   : in  std_logic;
        s_axi_awready   : out std_logic;
        s_axi_wdata     : in  std_logic_vector(31 downto 0);
        s_axi_wstrb     : in  std_logic_vector(3 downto 0);
        s_axi_wvalid    : in  std_logic;
        s_axi_wready    : out std_logic;
        s_axi_bresp     : out std_logic_vector(1 downto 0);
        s_axi_bvalid    : out std_logic;
        s_axi_bready    : in  std_logic;
        s_axi_araddr    : in  std_logic_vector(G_ADDR_W - 1 downto 0);
        s_axi_arvalid   : in  std_logic;
        s_axi_arready   : out std_logic;
        s_axi_rdata     : out std_logic_vector(31 downto 0);
        s_axi_rresp     : out std_logic_vector(1 downto 0);
        s_axi_rvalid    : out std_logic;
        s_axi_rready    : in  std_logic;
        -- Jádro
        regs            : out t_reg_array(0 to G_NUM_REGS - 1);     -- RW parametry
        ro_in           : in  t_reg_array(0 to G_NUM_REGS - 1);     -- RO výstupy jádra (ostatní ignorováno)
        run             : out std_logic;
        done_in         : in  std_logic;                            -- 1takt pulz: transakce (snímek) dokončena
        interrupt       : out std_logic
    );
end entity;

architecture rtl of axil_regbank is
    constant C_IS_READ_ONLY : std_logic_vector(0 to G_NUM_REGS - 1) := G_RO_MASK;

    signal reg_value        : t_reg_array(0 to G_NUM_REGS - 1) := (others => (others => '0'));
    signal ap_start_reg     : std_logic := '0';
    signal auto_restart_reg : std_logic := '0';
    signal ap_done_reg      : std_logic := '0';
    signal global_irq_en    : std_logic := '0';
    signal irq_enable       : std_logic_vector(1 downto 0) := "00";
    signal irq_status       : std_logic_vector(1 downto 0) := "00";
    signal ro_valid_reg     : std_logic := '0';

    signal aw_captured, w_captured : std_logic := '0';
    signal aw_addr_reg             : std_logic_vector(G_ADDR_W - 1 downto 0) := (others => '0');
    signal w_data_reg              : std_logic_vector(31 downto 0) := (others => '0');
    signal w_strb_reg              : std_logic_vector(3 downto 0) := (others => '0');
    signal bvalid_reg              : std_logic := '0';
    signal rvalid_reg              : std_logic := '0';
    signal rdata_reg               : std_logic_vector(31 downto 0) := (others => '0');

    -- Index registru z adresy (0x10 + 8 * index, i pro "+4" = ap_vld), -1 = jiná adresa
    function addr_to_reg_index(addr : std_logic_vector) return integer is
        constant C_ADDR : natural := to_integer(unsigned(addr));
    begin
        if (C_ADDR >= 16) and ((C_ADDR mod 4) = 0) and (((C_ADDR - 16) / 8) < G_NUM_REGS) then
            return (C_ADDR - 16) / 8;
        end if;
        return -1;
    end function;
begin

    regs      <= reg_value;
    run       <= ap_start_reg or auto_restart_reg;
    interrupt <= global_irq_en and (irq_status(0) or irq_status(1));

    s_axi_awready <= not aw_captured;
    s_axi_wready  <= not w_captured;
    s_axi_bvalid  <= bvalid_reg;
    s_axi_bresp   <= "00";
    s_axi_arready <= not rvalid_reg;
    s_axi_rvalid  <= rvalid_reg;
    s_axi_rdata   <= rdata_reg;
    s_axi_rresp   <= "00";

    process (aclk)
        variable addr_int                      : natural;
        variable reg_idx                       : integer;
        variable read_word                     : std_logic_vector(31 downto 0);
        variable clear_done_on_read, clr_ready : boolean;
    begin
        if rising_edge(aclk) then
            clear_done_on_read := false;
            if aresetn = '0' then
                aw_captured <= '0'; w_captured <= '0'; bvalid_reg <= '0'; rvalid_reg <= '0';
                ap_start_reg <= '0'; auto_restart_reg <= '0'; ap_done_reg <= '0';
                global_irq_en <= '0'; irq_enable <= "00"; irq_status <= "00"; ro_valid_reg <= '0';
            else
                -- Zápis: AW a W nezávisle, provedení po obou
                if (s_axi_awvalid = '1') and (aw_captured = '0') then
                    aw_addr_reg <= s_axi_awaddr; aw_captured <= '1';
                end if;
                if (s_axi_wvalid = '1') and (w_captured = '0') then
                    w_data_reg <= s_axi_wdata; w_strb_reg <= s_axi_wstrb; w_captured <= '1';
                end if;
                if (aw_captured = '1') and (w_captured = '1') and (bvalid_reg = '0') then
                    addr_int := to_integer(unsigned(aw_addr_reg));
                    reg_idx := addr_to_reg_index(aw_addr_reg);
                    if addr_int = 16#00# then
                        if w_strb_reg(0) = '1' then
                            if w_data_reg(0) = '1' then ap_start_reg <= '1'; end if;
                            auto_restart_reg <= w_data_reg(7);
                        end if;
                    elsif addr_int = 16#04# then
                        global_irq_en <= w_data_reg(0);
                    elsif addr_int = 16#08# then
                        irq_enable <= w_data_reg(1 downto 0);
                    elsif addr_int = 16#0C# then
                        irq_status <= irq_status xor w_data_reg(1 downto 0);      -- TOW
                    elsif (reg_idx >= 0) and (((addr_int - 16) mod 8) = 0) and (C_IS_READ_ONLY(reg_idx) = '0') then
                        for bit in 0 to 31 loop
                            if (w_strb_reg(bit / 8) = '1') and (bit < G_REG_W(G_REG_W'low + reg_idx)) then
                                reg_value(reg_idx)(bit) <= w_data_reg(bit);
                            end if;
                        end loop;
                    end if;
                    bvalid_reg <= '1';
                end if;
                if (bvalid_reg = '1') and (s_axi_bready = '1') then
                    bvalid_reg <= '0'; aw_captured <= '0'; w_captured <= '0';
                end if;

                -- Čtení (latence 1 takt)
                if (s_axi_arvalid = '1') and (rvalid_reg = '0') then
                    addr_int := to_integer(unsigned(s_axi_araddr));
                    reg_idx  := addr_to_reg_index(s_axi_araddr);
                    read_word := (others => '0');
                    if addr_int = 16#00# then
                        read_word(0) := ap_start_reg;
                        read_word(1) := ap_done_reg;
                        read_word(2) := not (ap_start_reg or auto_restart_reg);    -- ap_idle
                        read_word(3) := ap_start_reg or auto_restart_reg;          -- ap_ready (připraveno přijímat)
                        read_word(7) := auto_restart_reg;
                        read_word(9) := global_irq_en and (irq_status(0) or irq_status(1));
                        clear_done_on_read := true;
                    elsif addr_int = 16#04# then
                        read_word(0) := global_irq_en;
                    elsif addr_int = 16#08# then
                        read_word(1 downto 0) := irq_enable;
                    elsif addr_int = 16#0C# then
                        read_word(1 downto 0) := irq_status;
                    elsif reg_idx >= 0 then
                        if ((addr_int - 16) mod 8) = 0 then
                            if C_IS_READ_ONLY(reg_idx) = '1' then
                                for bit in 0 to 31 loop
                                    if bit < G_REG_W(G_REG_W'low + reg_idx) then read_word(bit) := ro_in(reg_idx)(bit); end if;
                                end loop;
                            else
                                read_word := reg_value(reg_idx);
                            end if;
                        elsif C_IS_READ_ONLY(reg_idx) = '1' then
                            read_word(0) := ro_valid_reg;                  -- ap_vld
                        end if;
                    end if;
                    rdata_reg  <= read_word;
                    rvalid_reg <= '1';
                end if;
                if (rvalid_reg = '1') and (s_axi_rready = '1') then
                    rvalid_reg <= '0';
                end if;

                -- Dokončení transakce jádra
                if done_in = '1' then
                    ap_done_reg  <= '1';
                    ro_valid_reg <= '1';
                    if auto_restart_reg = '0' then ap_start_reg <= '0'; end if;
                    if irq_enable(0) = '1' then irq_status(0) <= '1'; end if;
                elsif clear_done_on_read then
                    ap_done_reg <= '0';
                end if;
            end if;
        end if;
    end process;

end architecture;
