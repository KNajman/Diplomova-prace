--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    axil_regbank.vhd
-- Popis:     Registrová banka AXI4-Lite s mapou shodnou s HLS (s_axilite, bundle control)
--
-- Mapa (stejná jako generuje Vitis HLS 2025.2, takže VHDL i HLS jádro ovládá jeden C driver
-- vygenerovaný Vitisem, např. XHls_csc_rgb_*):
--   0x00 ap_ctrl: bit0 ap_start (RW, nuluje se při spuštění bez auto_restart),
--                 bit1 ap_done (R, nuluje se čtením), bit2 ap_idle (R), bit3 ap_ready (R, nuluje čtení),
--                 bit7 auto_restart (RW), bit9 interrupt (R)
--   0x04 GIE (bit0), 0x08 IER (bit0 done, bit1 ready), 0x0C ISR (bit0 done, bit1 ready, zápis 1 = přepnutí)
--   0x10 + 8*i  registr i (32 b; RW parametr, nebo RO výstup jádra podle G_RO_MASK)
--   0x14 + 8*i  u RO registru "ap_vld" (bit0 = 1, výstup je platný od prvního done)
--
-- Poznámky k návrhu:
--  * Bodová VHDL jádra nemají snímek ani řádek jako transakci, běží nepřetržitě. Pro shodné
--    chování s ovladačem: run = ap_start or auto_restart; jádro s run = 0 drží TREADY = 0.
--    done_in (konec snímku u okénkových jader, u bodových nepoužito) nastaví ap_done/ISR.
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
        G_REG_W    : t_width_array;               -- platná šířka registru i (bity nad ní = 0)
        G_RO_MASK  : std_logic_vector := "0";     -- bit i = 1 -> registr i je výstup jádra (jen čtení)
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
    constant C_RO : std_logic_vector(0 to G_NUM_REGS - 1) := G_RO_MASK;

    signal reg_r      : t_reg_array(0 to G_NUM_REGS - 1) := (others => (others => '0'));
    signal ap_start   : std_logic := '0';
    signal auto_rst   : std_logic := '0';
    signal ap_done    : std_logic := '0';
    signal gie        : std_logic := '0';
    signal ier        : std_logic_vector(1 downto 0) := "00";
    signal isr        : std_logic_vector(1 downto 0) := "00";
    signal ro_valid   : std_logic := '0';

    signal aw_ok, w_ok : std_logic := '0';
    signal aw_addr     : std_logic_vector(G_ADDR_W - 1 downto 0) := (others => '0');
    signal w_data      : std_logic_vector(31 downto 0) := (others => '0');
    signal w_strb      : std_logic_vector(3 downto 0) := (others => '0');
    signal bvalid      : std_logic := '0';
    signal rvalid      : std_logic := '0';
    signal rdata       : std_logic_vector(31 downto 0) := (others => '0');

    -- Index registru z adresy (0x10 + 8*i), -1 = jiná adresa; data_part = 0 pro +0, 1 pro +4
    function reg_index(a : std_logic_vector) return integer is
        variable n : natural := to_integer(unsigned(a));
    begin
        if (n >= 16) and ((n mod 4) = 0) and (((n - 16) / 8) < G_NUM_REGS) then
            return (n - 16) / 8;
        end if;
        return -1;
    end function;
begin

    regs      <= reg_r;
    run       <= ap_start or auto_rst;
    interrupt <= gie and (isr(0) or isr(1));

    s_axi_awready <= not aw_ok;
    s_axi_wready  <= not w_ok;
    s_axi_bvalid  <= bvalid;
    s_axi_bresp   <= "00";
    s_axi_arready <= not rvalid;
    s_axi_rvalid  <= rvalid;
    s_axi_rdata   <= rdata;
    s_axi_rresp   <= "00";

    process (aclk)
        variable n    : natural;
        variable i    : integer;
        variable rd   : std_logic_vector(31 downto 0);
        variable clr_done, clr_ready : boolean;
    begin
        if rising_edge(aclk) then
            clr_done := false;
            if aresetn = '0' then
                aw_ok <= '0'; w_ok <= '0'; bvalid <= '0'; rvalid <= '0';
                ap_start <= '0'; auto_rst <= '0'; ap_done <= '0';
                gie <= '0'; ier <= "00"; isr <= "00"; ro_valid <= '0';
            else
                -- Zápis: AW a W nezávisle, provedení po obou
                if (s_axi_awvalid = '1') and (aw_ok = '0') then
                    aw_addr <= s_axi_awaddr; aw_ok <= '1';
                end if;
                if (s_axi_wvalid = '1') and (w_ok = '0') then
                    w_data <= s_axi_wdata; w_strb <= s_axi_wstrb; w_ok <= '1';
                end if;
                if (aw_ok = '1') and (w_ok = '1') and (bvalid = '0') then
                    n := to_integer(unsigned(aw_addr));
                    i := reg_index(aw_addr);
                    if n = 16#00# then
                        if w_strb(0) = '1' then
                            if w_data(0) = '1' then ap_start <= '1'; end if;
                            auto_rst <= w_data(7);
                        end if;
                    elsif n = 16#04# then
                        gie <= w_data(0);
                    elsif n = 16#08# then
                        ier <= w_data(1 downto 0);
                    elsif n = 16#0C# then
                        isr <= isr xor w_data(1 downto 0);      -- TOW
                    elsif (i >= 0) and (((n - 16) mod 8) = 0) and (C_RO(i) = '0') then
                        for bit in 0 to 31 loop
                            if (w_strb(bit / 8) = '1') and (bit < G_REG_W(G_REG_W'low + i)) then
                                reg_r(i)(bit) <= w_data(bit);
                            end if;
                        end loop;
                    end if;
                    bvalid <= '1';
                end if;
                if (bvalid = '1') and (s_axi_bready = '1') then
                    bvalid <= '0'; aw_ok <= '0'; w_ok <= '0';
                end if;

                -- Čtení (latence 1 takt)
                if (s_axi_arvalid = '1') and (rvalid = '0') then
                    n  := to_integer(unsigned(s_axi_araddr));
                    i  := reg_index(s_axi_araddr);
                    rd := (others => '0');
                    if n = 16#00# then
                        rd(0) := ap_start;
                        rd(1) := ap_done;
                        rd(2) := not (ap_start or auto_rst);    -- ap_idle
                        rd(3) := ap_start or auto_rst;          -- ap_ready (připraveno přijímat)
                        rd(7) := auto_rst;
                        rd(9) := gie and (isr(0) or isr(1));
                        clr_done := true;
                    elsif n = 16#04# then
                        rd(0) := gie;
                    elsif n = 16#08# then
                        rd(1 downto 0) := ier;
                    elsif n = 16#0C# then
                        rd(1 downto 0) := isr;
                    elsif i >= 0 then
                        if ((n - 16) mod 8) = 0 then
                            if C_RO(i) = '1' then
                                for bit in 0 to 31 loop
                                    if bit < G_REG_W(G_REG_W'low + i) then rd(bit) := ro_in(i)(bit); end if;
                                end loop;
                            else
                                rd := reg_r(i);
                            end if;
                        elsif C_RO(i) = '1' then
                            rd(0) := ro_valid;                  -- ap_vld
                        end if;
                    end if;
                    rdata  <= rd;
                    rvalid <= '1';
                end if;
                if (rvalid = '1') and (s_axi_rready = '1') then
                    rvalid <= '0';
                end if;

                -- Dokončení transakce jádra
                if done_in = '1' then
                    ap_done  <= '1';
                    ro_valid <= '1';
                    if auto_rst = '0' then ap_start <= '0'; end if;
                    if ier(0) = '1' then isr(0) <= '1'; end if;
                elsif clr_done then
                    ap_done <= '0';
                end if;
            end if;
        end if;
    end process;

end architecture;
