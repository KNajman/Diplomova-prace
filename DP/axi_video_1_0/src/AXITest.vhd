library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package dtypes_p is
    type databuf_t is array (integer range <>) of std_logic_vector;
    type databufs_t is array (integer range <>) of databuf_t;
    function fill_constant(const : std_logic_vector; arr_dim : integer) return databuf_t;
    function fill_constant(const : integer; arr_dim, slv_dim : integer) return databuf_t;

    function fill_increment(arr_dim, slv_dim : integer) return databuf_t;

end package dtypes_p;

package body dtypes_p is
    function fill_constant(const : std_logic_vector; arr_dim : integer) return databuf_t is
        variable retval : databuf_t(0 to arr_dim - 1)(const'range);
    begin
        for i in retval'range loop
            retval(i) := const;
        end loop;
        return retval;
    end function;

    function fill_constant(const : integer; arr_dim, slv_dim : integer) return databuf_t is
    begin
        return fill_constant(std_logic_vector(to_unsigned(const, slv_dim)), arr_dim);
    end function;

    function fill_increment(arr_dim, slv_dim : integer) return databuf_t is
        variable retval : databuf_t(0 to arr_dim - 1)(slv_dim - 1 downto 0);
    begin
        for i in retval'range loop
            retval(i) := std_logic_vector(to_unsigned(i, slv_dim));
        end loop;
        return retval;
    end function;
end package body dtypes_p;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AXILiteMaster is
    generic(
        C_M_AXI_ADDR_WIDTH : integer := 4;
        C_M_AXI_DATA_WIDTH : integer := 32
    );
    port(
        -- Simple interface
        addr          : in  integer;
        din           : in  unsigned(C_M_AXI_DATA_WIDTH - 1 downto 0);
        dout          : out unsigned(C_M_AXI_DATA_WIDTH - 1 downto 0);
        wrun          : in  std_logic;
        rrun          : in  std_logic;
        busy          : out std_logic;
        done          : out std_logic;
        -- AXI-Lite interface
        m_axi_clk     : in  std_logic;
        m_axi_aresetn : in  std_logic;
        m_axi_awaddr  : out std_logic_vector(C_M_AXI_ADDR_WIDTH - 1 downto 0);
        m_axi_awprot  : out std_logic_vector(2 downto 0);
        m_axi_awvalid : out std_logic;
        m_axi_awready : in  std_logic;
        m_axi_wdata   : out std_logic_vector(C_M_AXI_DATA_WIDTH - 1 downto 0);
        m_axi_wstrb   : out std_logic_vector((C_M_AXI_DATA_WIDTH / 8) - 1 downto 0);
        m_axi_wvalid  : out std_logic;
        m_axi_wready  : in  std_logic;
        m_axi_bresp   : in  std_logic_vector(1 downto 0);
        m_axi_bvalid  : in  std_logic;
        m_axi_bready  : out std_logic;
        m_axi_araddr  : out std_logic_vector(C_M_AXI_ADDR_WIDTH - 1 downto 0);
        m_axi_arprot  : out std_logic_vector(2 downto 0);
        m_axi_arvalid : out std_logic;
        m_axi_arready : in  std_logic;
        m_axi_rdata   : in  std_logic_vector(C_M_AXI_DATA_WIDTH - 1 downto 0);
        m_axi_rresp   : in  std_logic_vector(1 downto 0);
        m_axi_rvalid  : in  std_logic;
        m_axi_rready  : out std_logic
    );
end entity AXILiteMaster;

architecture RTL of AXILiteMaster is

begin

    axi_master : process(m_axi_clk)
        type am_state_t is (SIdle, SWrite, SwriteAck, SRead, SDone);
        variable wa_done, wd_done : boolean    := FALSE;
        variable state, nstate    : am_state_t := SIdle;
    begin
        if rising_edge(m_axi_clk) then
            m_axi_wstrb <= (others => '1');
            if m_axi_aresetn = '0' then
                state         := SIdle;
                dout          <= (others => '0');
                m_axi_araddr  <= (others => '0');
                m_axi_arvalid <= '0';
                m_axi_awaddr  <= (others => '0');
                m_axi_rready  <= '0';
                m_axi_wdata   <= (others => '0');
                done          <= '0';
                busy          <= '0';
                m_axi_awvalid <= '0';
                m_axi_wvalid  <= '0';
                m_axi_bready  <= '0';
            else
                nstate := state;
                busy   <= '1';
                case state is
                    when SIdle =>
                        if wrun then
                            nstate        := SWrite;
                            wa_done       := FALSE;
                            wd_done       := FALSE;
                            m_axi_wdata   <= std_logic_vector(din);
                            m_axi_awaddr  <= std_logic_vector(to_unsigned(addr * 4, m_axi_awaddr'length));
                            m_axi_awvalid <= '1';
                            m_axi_wvalid  <= '1';
                        elsif rrun then
                            m_axi_araddr  <= std_logic_vector(to_unsigned(addr * 4, m_axi_araddr'length));
                            m_axi_arvalid <= '1';
                            m_axi_rready  <= '1';
                            nstate        := SRead;
                        else
                            busy <= '0';
                        end if;
                    when SWrite =>
                        if m_axi_awvalid and m_axi_awready then
                            m_axi_awvalid <= '0';
                            wa_done       := TRUE;
                        end if;
                        if m_axi_wvalid and m_axi_wready then
                            m_axi_wvalid <= '0';
                            wd_done      := TRUE;
                        end if;
                        if and(wa_done, wd_done) then
                            nstate := SwriteAck;
                        end if;
                    when SwriteAck =>
                        if m_axi_bvalid then
                            m_axi_bready <= '1';
                        end if;
                        if m_axi_bready and m_axi_bvalid then
                            nstate       := SDone;
                            m_axi_bready <= '0';
                            done         <= '1';
                        end if;
                    when SRead =>
                        if m_axi_arready and m_axi_arvalid then
                            m_axi_arvalid <= '0';
                        end if;
                        if m_axi_rvalid and m_axi_rready then
                            dout         <= unsigned(m_axi_rdata);
                            m_axi_rready <= '0';
                            done         <= '1';
                            nstate       := SDone;
                        end if;
                    when SDone =>
                        if wrun = '0' and rrun = '0' then
                            done   <= '0';
                            busy   <= '0';
                            nstate := SIdle;
                        end if;
                end case;
                state  := nstate;
            end if;
        end if;
    end process;

end architecture RTL;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dtypes_p.all;

entity AXISMaster is
    generic(
        C_M_AXIS_TDATA_WIDTH : integer := 32
    );
    port(
        -- simple interface
        din            : in  databuf_t;
        run            : in  std_logic;
        busy           : out std_logic;
        done           : out std_logic;
        -- axis interface
        m_axis_aclk    : in  std_logic;
        m_axis_aresetn : in  std_logic;
        m_axis_tvalid  : out std_logic;
        m_axis_tdata   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH - 1 downto 0);
        m_axis_tstrb   : out std_logic_vector((C_M_AXIS_TDATA_WIDTH / 8) - 1 downto 0);
        m_axis_tlast   : out std_logic;
        m_axis_tready  : in  std_logic
    );
end entity AXISMaster;

architecture RTL of AXISMaster is

begin

    process(m_axis_aclk)
        type axism_state_t is (SIdle, SStream, SDone);
        variable state, nstate    : axism_state_t := SIdle;
        variable transfer_counter : integer;
    begin
        if rising_edge(m_axis_aclk) then
            if m_axis_aresetn = '0' then
                state            := SIdle;
                transfer_counter := 0;
                m_axis_tstrb     <= (others => '0');
                m_axis_tlast     <= '0';
                m_axis_tdata     <= (others => '0');
                m_axis_tvalid    <= '0';
                done             <= '0';
                busy             <= '0';
            else
                m_axis_tstrb <= (others => '1');
                m_axis_tlast <= '0';
                nstate       := state;
                case state is
                    when SIdle =>
                        if run then
                            nstate           := SStream;
                            transfer_counter := 0;
                            m_axis_tdata     <= din(transfer_counter);
                            m_axis_tvalid    <= '1';
                            busy             <= '1';
                        else
                            busy <= '0';
                        end if;
                    when SStream =>
                        if m_axis_tvalid and m_axis_tready then
                            transfer_counter := transfer_counter + 1;

                            if transfer_counter >= (din'length - 1) then
                                m_axis_tlast <= '1';
                            else
                                m_axis_tlast <= '0';
                            end if;

                            if transfer_counter >= din'length then
                                nstate        := SDone;
                                done          <= '1';
                                m_axis_tvalid <= '0';
                                m_axis_tlast  <= '0';
                                m_axis_tdata  <= (others => '0');
                            else
                                m_axis_tvalid <= '1';
                                m_axis_tdata  <= din(transfer_counter);
                            end if;
                        end if;
                    when SDone =>
                        if run = '0' then
                            busy   <= '0';
                            done   <= '0';
                            nstate := SIdle;
                        end if;
                end case;
                state        := nstate;
            end if;
        end if;
    end process;

end architecture RTL;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dtypes_p.all;

entity AXISSlave is
    generic(
        C_S_AXIS_TDATA_WIDTH : integer := 32
    );
    port(
        run            : in  std_logic;
        busy           : out std_logic;
        done           : out std_logic;
        dout           : out databuf_t;
        s_axis_aclk    : in  std_logic;
        s_axis_aresetn : in  std_logic;
        s_axis_tready  : out std_logic;
        s_axis_tdata   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH - 1 downto 0);
        s_axis_tstrb   : in  std_logic_vector((C_S_AXIS_TDATA_WIDTH / 8) - 1 downto 0);
        s_axis_tlast   : in  std_logic;
        s_axis_tvalid  : in  std_logic
    );
end entity AXISSlave;

architecture RTL of AXISSlave is

begin

    process(s_axis_aclk)
        type axiss_state_t is (SIdle, SRead, SDone);
        variable state, nstate : axiss_state_t := SIdle;
        variable read_counter  : integer range 0 to dout'length;
    begin
        if rising_edge(s_axis_aclk) then
            if s_axis_aresetn = '0' then
                state         := SIdle;
                read_counter  := 0;
                busy          <= '0';
                done          <= '0';
                s_axis_tready <= '0';
            else
                done   <= '0';
                nstate := state;
                case state is
                    when SIdle =>
                        if run then
                            nstate := SRead;
                            busy   <= '1';
                        else
                            s_axis_tready <= '0';
                            busy          <= '0';
                        end if;
                    when SRead =>
                        s_axis_tready <= '1';
                        if s_axis_tvalid and s_axis_tready then
                            assert read_counter < dout'length report "output array index too big" severity FAILURE;
                            dout(read_counter) <= s_axis_tdata;
                            read_counter       := read_counter + 1;
                            if s_axis_tlast then
                                s_axis_tready <= '0';
                                nstate        := SDone;
                                done          <= '1';
                            end if;
                        end if;
                    when SDone =>
                        done <= '1';
                        if run = '0' then
                            busy   <= '0';
                            nstate := SIdle;
                            done   <= '0';
                        end if;
                        null;
                end case;
                state  := nstate;
            end if;
        end if;
    end process;

end architecture;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dtypes_p.all;

entity AXISlaveRD is
    generic(
        C_M_AXI_ID_WIDTH     : integer := 1;
        C_M_AXI_ADDR_WIDTH   : integer := 32;
        C_M_AXI_ARUSER_WIDTH : integer := 1;
        C_M_AXI_DATA_WIDTH   : integer := 32;
        C_M_AXI_RUSER_WIDTH  : integer := 32
    );
    port(
        data          : in  databuf_t;
        -- AXI 
        m_axi_aclk    : in  std_logic;
        m_axi_aresetn : in  std_logic;
        m_axi_arid    : in  std_logic_vector(C_M_AXI_ID_WIDTH - 1 downto 0);
        m_axi_araddr  : in  std_logic_vector(C_M_AXI_ADDR_WIDTH - 1 downto 0);
        m_axi_arlen   : in  std_logic_vector(7 downto 0);
        m_axi_arsize  : in  std_logic_vector(2 downto 0);
        m_axi_arburst : in  std_logic_vector(1 downto 0);
        m_axi_arlock  : in  std_logic;
        m_axi_arcache : in  std_logic_vector(3 downto 0);
        m_axi_arprot  : in  std_logic_vector(2 downto 0);
        m_axi_arqos   : in  std_logic_vector(3 downto 0);
        m_axi_aruser  : in  std_logic_vector(C_M_AXI_ARUSER_WIDTH - 1 downto 0);
        m_axi_arvalid : in  std_logic;
        m_axi_arready : out std_logic;
        m_axi_rid     : out std_logic_vector(C_M_AXI_ID_WIDTH - 1 downto 0);
        m_axi_rdata   : out std_logic_vector(C_M_AXI_DATA_WIDTH - 1 downto 0);
        m_axi_rresp   : out std_logic_vector(1 downto 0);
        m_axi_rlast   : out std_logic;
        m_axi_ruser   : out std_logic_vector(C_M_AXI_RUSER_WIDTH - 1 downto 0);
        m_axi_rvalid  : out std_logic;
        m_axi_rready  : in  std_logic
    );
end entity AXISlaveRD;

architecture RTL of AXISlaveRD is

begin

    process(m_axi_aclk)
        type state_t is (SAddress, STransfer);
        variable state, nstate : state_t := SAddress;
        variable len, cnt      : unsigned(m_axi_arlen'range);
        variable addr          : unsigned(m_axi_araddr'range);
        constant BSIZE : integer := data(0)'length/8;
    begin
        if rising_edge(m_axi_aclk) then
            m_axi_rresp <= "00";
            if m_axi_aresetn = '0' then
                state         := SAddress;
                m_axi_arready <= '0';
                m_axi_rvalid  <= '0';
                len           := (others => '0');
                cnt           := (others => '0');
                addr          := (others => '0');
                m_axi_rlast   <= '0';
                m_axi_rdata   <= (others => '0');
            else
                nstate        := state;
                m_axi_rlast   <= '0';
                m_axi_arready <= '0';
                m_axi_rvalid  <= '0';
                case state is
                    when SAddress =>
                        if m_axi_arvalid = '1' then
                            m_axi_arready <= '1';
                            addr          := unsigned(m_axi_araddr);
                            len           := unsigned(m_axi_arlen) + 1;
                            m_axi_rvalid  <= '0';
                            cnt           := (others => '0');
                            nstate        := STransfer;
                        end if;
                    when STransfer =>
                        m_axi_rdata <= data(to_integer(addr/BSIZE + cnt));
                        if m_axi_rvalid = '1' and m_axi_rready = '1' then
                            cnt := cnt + 1;
                        end if;
                        if cnt < len then
                            m_axi_rvalid <= '1';
                        elsif cnt >= len then
                            m_axi_rlast  <= '1';
                            m_axi_rvalid <= '1';
                            nstate       := SAddress;
                        end if;
                end case;
                state         := nstate;
            end if;
        end if;
    end process;

end architecture RTL;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dtypes_p.all;

package AXITest is

    component AXILiteMaster
        generic(
            C_M_AXI_ADDR_WIDTH : integer := 4;
            C_M_AXI_DATA_WIDTH : integer := 32
        );
        port(
            addr          : in  integer;
            din           : in  unsigned(C_M_AXI_DATA_WIDTH - 1 downto 0);
            dout          : out unsigned(C_M_AXI_DATA_WIDTH - 1 downto 0);
            wrun          : in  std_logic;
            rrun          : in  std_logic;
            busy          : out std_logic;
            done          : out std_logic;
            m_axi_clk     : in  std_logic;
            m_axi_aresetn : in  std_logic;
            m_axi_awaddr  : out std_logic_vector(C_M_AXI_ADDR_WIDTH - 1 downto 0);
            m_axi_awprot  : out std_logic_vector(2 downto 0);
            m_axi_awvalid : out std_logic;
            m_axi_awready : in  std_logic;
            m_axi_wdata   : out std_logic_vector(C_M_AXI_DATA_WIDTH - 1 downto 0);
            m_axi_wstrb   : out std_logic_vector((C_M_AXI_DATA_WIDTH / 8) - 1 downto 0);
            m_axi_wvalid  : out std_logic;
            m_axi_wready  : in  std_logic;
            m_axi_bresp   : in  std_logic_vector(1 downto 0);
            m_axi_bvalid  : in  std_logic;
            m_axi_bready  : out std_logic;
            m_axi_araddr  : out std_logic_vector(C_M_AXI_ADDR_WIDTH - 1 downto 0);
            m_axi_arprot  : out std_logic_vector(2 downto 0);
            m_axi_arvalid : out std_logic;
            m_axi_arready : in  std_logic;
            m_axi_rdata   : in  std_logic_vector(C_M_AXI_DATA_WIDTH - 1 downto 0);
            m_axi_rresp   : in  std_logic_vector(1 downto 0);
            m_axi_rvalid  : in  std_logic;
            m_axi_rready  : out std_logic
        );
    end component AXILiteMaster;

    component AXISMaster
        generic(C_M_AXIS_TDATA_WIDTH : integer := 32);
        port(
            din            : in  databuf_t;
            run            : in  std_logic;
            busy           : out std_logic;
            done           : out std_logic;
            m_axis_aclk    : in  std_logic;
            m_axis_aresetn : in  std_logic;
            m_axis_tvalid  : out std_logic;
            m_axis_tdata   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH - 1 downto 0);
            m_axis_tstrb   : out std_logic_vector((C_M_AXIS_TDATA_WIDTH / 8) - 1 downto 0);
            m_axis_tlast   : out std_logic;
            m_axis_tready  : in  std_logic
        );
    end component AXISMaster;

    component AXISSlave
        generic(C_S_AXIS_TDATA_WIDTH : integer := 32);
        port(
            run            : in  std_logic;
            busy           : out std_logic;
            done           : out std_logic;
            dout           : out databuf_t;
            s_axis_aclk    : in  std_logic;
            s_axis_aresetn : in  std_logic;
            s_axis_tready  : out std_logic;
            s_axis_tdata   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH - 1 downto 0);
            s_axis_tstrb   : in  std_logic_vector((C_S_AXIS_TDATA_WIDTH / 8) - 1 downto 0);
            s_axis_tlast   : in  std_logic;
            s_axis_tvalid  : in  std_logic
        );
    end component AXISSlave;

    component AXISlaveRD
        generic(
            C_M_AXI_ID_WIDTH     : integer := 1;
            C_M_AXI_ADDR_WIDTH   : integer := 32;
            C_M_AXI_ARUSER_WIDTH : integer := 1;
            C_M_AXI_DATA_WIDTH   : integer := 32;
            C_M_AXI_RUSER_WIDTH  : integer := 32
        );
        port(
            data          : in  databuf_t;
            m_axi_aclk    : in  std_logic;
            m_axi_aresetn : in  std_logic;
            m_axi_arid    : in  std_logic_vector(C_M_AXI_ID_WIDTH - 1 downto 0);
            m_axi_araddr  : in  std_logic_vector(C_M_AXI_ADDR_WIDTH - 1 downto 0);
            m_axi_arlen   : in  std_logic_vector(7 downto 0);
            m_axi_arsize  : in  std_logic_vector(2 downto 0);
            m_axi_arburst : in  std_logic_vector(1 downto 0);
            m_axi_arlock  : in  std_logic;
            m_axi_arcache : in  std_logic_vector(3 downto 0);
            m_axi_arprot  : in  std_logic_vector(2 downto 0);
            m_axi_arqos   : in  std_logic_vector(3 downto 0);
            m_axi_aruser  : in  std_logic_vector(C_M_AXI_ARUSER_WIDTH - 1 downto 0);
            m_axi_arvalid : in  std_logic;
            m_axi_arready : out std_logic;
            m_axi_rid     : out std_logic_vector(C_M_AXI_ID_WIDTH - 1 downto 0);
            m_axi_rdata   : out std_logic_vector(C_M_AXI_DATA_WIDTH - 1 downto 0);
            m_axi_rresp   : out std_logic_vector(1 downto 0);
            m_axi_rlast   : out std_logic;
            m_axi_ruser   : out std_logic_vector(C_M_AXI_RUSER_WIDTH - 1 downto 0);
            m_axi_rvalid  : out std_logic;
            m_axi_rready  : in  std_logic
        );
    end component AXISlaveRD;

    procedure alm_read_cmd(
        addr              : integer;
        signal clk        : in std_logic;
        signal run        : out std_logic;
        signal busy, done : in std_logic;
        signal s_addr     : out integer);

    procedure alm_write_cmd(
        addr              : integer; data : unsigned;
        signal clk        : in std_logic;
        signal run        : out std_logic;
        signal busy, done : in std_logic;
        signal s_addr     : out integer;
        signal s_data     : out unsigned);

    procedure asm_write_cmd(
        buf               : databuf_t;
        signal clk        : in std_logic;
        signal run        : out std_logic;
        signal busy, done : in std_logic;
        signal din        : out databuf_t
    );

    procedure asm_read_cmd(
        buf               : out databuf_t;
        signal clk        : in std_logic;
        signal run        : out std_logic;
        signal busy, done : in std_logic;
        signal dout       : in databuf_t
    );

    procedure asm_multi_cmd(
        bufs_in           : in databufs_t;
        bufs_out          : out databufs_t;
        signal clk        : in std_logic;
        signal run        : out std_logic_vector;
        signal busy, done : in std_logic_vector;
        signal douts      : in databufs_t;
        signal dins       : out databufs_t
    );

end package AXITest;

package body AXITest is

    procedure alm_read_cmd(
        addr              : integer;
        signal clk        : in std_logic;
        signal run        : out std_logic;
        signal busy, done : in std_logic;
        signal s_addr     : out integer) is
    begin
        if busy then
            wait until busy = '0';
        end if;
        wait until clk = '0';
        run    <= '1';
        s_addr <= addr;
        wait until done = '1';
        run    <= '0';
        wait until done = '0';
    end procedure;

    procedure alm_write_cmd(
        addr              : integer; data : unsigned;
        signal clk        : in std_logic;
        signal run        : out std_logic;
        signal busy, done : in std_logic;
        signal s_addr     : out integer;
        signal s_data     : out unsigned) is
    begin
        if busy then
            wait until busy = '0';
        end if;
        wait until clk = '0';
        run    <= '1';
        s_addr <= addr;
        s_data <= data;
        wait until done = '1';
        run    <= '0';
        wait until done = '0';
    end procedure alm_write_cmd;

    procedure asm_write_cmd(
        buf               : databuf_t;
        signal clk        : in std_logic;
        signal run        : out std_logic;
        signal busy, done : in std_logic;
        signal din        : out databuf_t
    ) is
    begin
        if busy then
            wait until busy = '0';
        end if;
        wait until clk = '0';
        din <= buf;
        run <= '1';
        wait until done = '1';
        run <= '0';
        wait until done = '0';
    end procedure;

    procedure asm_read_cmd(
        buf               : out databuf_t;
        signal clk        : in std_logic;
        signal run        : out std_logic;
        signal busy, done : in std_logic;
        signal dout       : in databuf_t
    ) is
    begin
        if busy then
            wait until busy = '0';
        end if;
        wait until clk = '0';
        run <= '1';
        wait until done = '1';
        run <= '0';
        buf := dout;
        wait until done = '0';
    end procedure;

    procedure asm_multi_cmd(
        bufs_in           : in databufs_t;
        bufs_out          : out databufs_t;
        signal clk        : in std_logic;
        signal run        : out std_logic_vector;
        signal busy, done : in std_logic_vector;
        signal douts      : in databufs_t;
        signal dins       : out databufs_t
    ) is
    begin
        if busy /= (busy'range => '0') then
            wait until busy = (busy'range => '0');
        end if;
        wait until clk = '0';
        dins     <= bufs_in;
        run      <= (others => '1');
        wait until done = (done'range => '1');
        run      <= (others => '0');
        bufs_out := douts;
        wait until done = (done'range => '0');
    end procedure;

end package body AXITest;
