-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
-- Tool Version Limit: 2025.11
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- 
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity hls_filter_2d_control_s_axi is
generic (
    C_S_AXI_ADDR_WIDTH    : INTEGER := 9;
    C_S_AXI_DATA_WIDTH    : INTEGER := 32);
port (
    ACLK                  :in   STD_LOGIC;
    ARESET                :in   STD_LOGIC;
    ACLK_EN               :in   STD_LOGIC;
    AWADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    AWVALID               :in   STD_LOGIC;
    AWREADY               :out  STD_LOGIC;
    WDATA                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    WSTRB                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH/8-1 downto 0);
    WVALID                :in   STD_LOGIC;
    WREADY                :out  STD_LOGIC;
    BRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    BVALID                :out  STD_LOGIC;
    BREADY                :in   STD_LOGIC;
    ARADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    ARVALID               :in   STD_LOGIC;
    ARREADY               :out  STD_LOGIC;
    RDATA                 :out  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    RRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    RVALID                :out  STD_LOGIC;
    RREADY                :in   STD_LOGIC;
    interrupt             :out  STD_LOGIC;
    width                 :out  STD_LOGIC_VECTOR(12 downto 0);
    height                :out  STD_LOGIC_VECTOR(12 downto 0);
    kernel_0_0            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_0_1            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_0_2            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_0_3            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_0_4            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_1_0            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_1_1            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_1_2            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_1_3            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_1_4            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_2_0            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_2_1            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_2_2            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_2_3            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_2_4            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_3_0            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_3_1            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_3_2            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_3_3            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_3_4            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_4_0            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_4_1            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_4_2            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_4_3            :out  STD_LOGIC_VECTOR(7 downto 0);
    kernel_4_4            :out  STD_LOGIC_VECTOR(7 downto 0);
    inv_divisor           :out  STD_LOGIC_VECTOR(31 downto 0);
    fraction_bits         :out  STD_LOGIC_VECTOR(4 downto 0);
    delta                 :out  STD_LOGIC_VECTOR(31 downto 0);
    borderType            :out  STD_LOGIC_VECTOR(0 downto 0);
    ap_start              :out  STD_LOGIC;
    ap_done               :in   STD_LOGIC;
    ap_ready              :in   STD_LOGIC;
    ap_idle               :in   STD_LOGIC
);
end entity hls_filter_2d_control_s_axi;

-- ------------------------Address Info-------------------
-- Protocol Used: ap_ctrl_hs
--
-- 0x000 : Control signals
--         bit 0  - ap_start (Read/Write/COH)
--         bit 1  - ap_done (Read/COR)
--         bit 2  - ap_idle (Read)
--         bit 3  - ap_ready (Read/COR)
--         bit 7  - auto_restart (Read/Write)
--         bit 9  - interrupt (Read)
--         others - reserved
-- 0x004 : Global Interrupt Enable Register
--         bit 0  - Global Interrupt Enable (Read/Write)
--         others - reserved
-- 0x008 : IP Interrupt Enable Register (Read/Write)
--         bit 0 - enable ap_done interrupt (Read/Write)
--         bit 1 - enable ap_ready interrupt (Read/Write)
--         others - reserved
-- 0x00c : IP Interrupt Status Register (Read/TOW)
--         bit 0 - ap_done (Read/TOW)
--         bit 1 - ap_ready (Read/TOW)
--         others - reserved
-- 0x010 : Data signal of width
--         bit 12~0 - width[12:0] (Read/Write)
--         others   - reserved
-- 0x014 : reserved
-- 0x018 : Data signal of height
--         bit 12~0 - height[12:0] (Read/Write)
--         others   - reserved
-- 0x01c : reserved
-- 0x020 : Data signal of kernel_0_0
--         bit 7~0 - kernel_0_0[7:0] (Read/Write)
--         others  - reserved
-- 0x024 : reserved
-- 0x028 : Data signal of kernel_0_1
--         bit 7~0 - kernel_0_1[7:0] (Read/Write)
--         others  - reserved
-- 0x02c : reserved
-- 0x030 : Data signal of kernel_0_2
--         bit 7~0 - kernel_0_2[7:0] (Read/Write)
--         others  - reserved
-- 0x034 : reserved
-- 0x038 : Data signal of kernel_0_3
--         bit 7~0 - kernel_0_3[7:0] (Read/Write)
--         others  - reserved
-- 0x03c : reserved
-- 0x040 : Data signal of kernel_0_4
--         bit 7~0 - kernel_0_4[7:0] (Read/Write)
--         others  - reserved
-- 0x044 : reserved
-- 0x048 : Data signal of kernel_1_0
--         bit 7~0 - kernel_1_0[7:0] (Read/Write)
--         others  - reserved
-- 0x04c : reserved
-- 0x050 : Data signal of kernel_1_1
--         bit 7~0 - kernel_1_1[7:0] (Read/Write)
--         others  - reserved
-- 0x054 : reserved
-- 0x058 : Data signal of kernel_1_2
--         bit 7~0 - kernel_1_2[7:0] (Read/Write)
--         others  - reserved
-- 0x05c : reserved
-- 0x060 : Data signal of kernel_1_3
--         bit 7~0 - kernel_1_3[7:0] (Read/Write)
--         others  - reserved
-- 0x064 : reserved
-- 0x068 : Data signal of kernel_1_4
--         bit 7~0 - kernel_1_4[7:0] (Read/Write)
--         others  - reserved
-- 0x06c : reserved
-- 0x070 : Data signal of kernel_2_0
--         bit 7~0 - kernel_2_0[7:0] (Read/Write)
--         others  - reserved
-- 0x074 : reserved
-- 0x078 : Data signal of kernel_2_1
--         bit 7~0 - kernel_2_1[7:0] (Read/Write)
--         others  - reserved
-- 0x07c : reserved
-- 0x080 : Data signal of kernel_2_2
--         bit 7~0 - kernel_2_2[7:0] (Read/Write)
--         others  - reserved
-- 0x084 : reserved
-- 0x088 : Data signal of kernel_2_3
--         bit 7~0 - kernel_2_3[7:0] (Read/Write)
--         others  - reserved
-- 0x08c : reserved
-- 0x090 : Data signal of kernel_2_4
--         bit 7~0 - kernel_2_4[7:0] (Read/Write)
--         others  - reserved
-- 0x094 : reserved
-- 0x098 : Data signal of kernel_3_0
--         bit 7~0 - kernel_3_0[7:0] (Read/Write)
--         others  - reserved
-- 0x09c : reserved
-- 0x0a0 : Data signal of kernel_3_1
--         bit 7~0 - kernel_3_1[7:0] (Read/Write)
--         others  - reserved
-- 0x0a4 : reserved
-- 0x0a8 : Data signal of kernel_3_2
--         bit 7~0 - kernel_3_2[7:0] (Read/Write)
--         others  - reserved
-- 0x0ac : reserved
-- 0x0b0 : Data signal of kernel_3_3
--         bit 7~0 - kernel_3_3[7:0] (Read/Write)
--         others  - reserved
-- 0x0b4 : reserved
-- 0x0b8 : Data signal of kernel_3_4
--         bit 7~0 - kernel_3_4[7:0] (Read/Write)
--         others  - reserved
-- 0x0bc : reserved
-- 0x0c0 : Data signal of kernel_4_0
--         bit 7~0 - kernel_4_0[7:0] (Read/Write)
--         others  - reserved
-- 0x0c4 : reserved
-- 0x0c8 : Data signal of kernel_4_1
--         bit 7~0 - kernel_4_1[7:0] (Read/Write)
--         others  - reserved
-- 0x0cc : reserved
-- 0x0d0 : Data signal of kernel_4_2
--         bit 7~0 - kernel_4_2[7:0] (Read/Write)
--         others  - reserved
-- 0x0d4 : reserved
-- 0x0d8 : Data signal of kernel_4_3
--         bit 7~0 - kernel_4_3[7:0] (Read/Write)
--         others  - reserved
-- 0x0dc : reserved
-- 0x0e0 : Data signal of kernel_4_4
--         bit 7~0 - kernel_4_4[7:0] (Read/Write)
--         others  - reserved
-- 0x0e4 : reserved
-- 0x0e8 : Data signal of inv_divisor
--         bit 31~0 - inv_divisor[31:0] (Read/Write)
-- 0x0ec : reserved
-- 0x0f0 : Data signal of fraction_bits
--         bit 4~0 - fraction_bits[4:0] (Read/Write)
--         others  - reserved
-- 0x0f4 : reserved
-- 0x0f8 : Data signal of delta
--         bit 31~0 - delta[31:0] (Read/Write)
-- 0x0fc : reserved
-- 0x100 : Data signal of borderType
--         bit 0  - borderType[0] (Read/Write)
--         others - reserved
-- 0x104 : reserved
-- (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

architecture behave of hls_filter_2d_control_s_axi is
attribute DowngradeIPIdentifiedWarnings : STRING;
attribute DowngradeIPIdentifiedWarnings of behave : architecture is "yes";
    type states is (wridle, wrdata, wrresp, wrreset, rdidle, rddata, rdreset);  -- read and write fsm states
    signal wstate  : states := wrreset;
    signal rstate  : states := rdreset;
    signal wnext, rnext: states;
    constant ADDR_AP_CTRL              : INTEGER := 16#000#;
    constant ADDR_GIE                  : INTEGER := 16#004#;
    constant ADDR_IER                  : INTEGER := 16#008#;
    constant ADDR_ISR                  : INTEGER := 16#00c#;
    constant ADDR_WIDTH_DATA_0         : INTEGER := 16#010#;
    constant ADDR_WIDTH_CTRL           : INTEGER := 16#014#;
    constant ADDR_HEIGHT_DATA_0        : INTEGER := 16#018#;
    constant ADDR_HEIGHT_CTRL          : INTEGER := 16#01c#;
    constant ADDR_KERNEL_0_0_DATA_0    : INTEGER := 16#020#;
    constant ADDR_KERNEL_0_0_CTRL      : INTEGER := 16#024#;
    constant ADDR_KERNEL_0_1_DATA_0    : INTEGER := 16#028#;
    constant ADDR_KERNEL_0_1_CTRL      : INTEGER := 16#02c#;
    constant ADDR_KERNEL_0_2_DATA_0    : INTEGER := 16#030#;
    constant ADDR_KERNEL_0_2_CTRL      : INTEGER := 16#034#;
    constant ADDR_KERNEL_0_3_DATA_0    : INTEGER := 16#038#;
    constant ADDR_KERNEL_0_3_CTRL      : INTEGER := 16#03c#;
    constant ADDR_KERNEL_0_4_DATA_0    : INTEGER := 16#040#;
    constant ADDR_KERNEL_0_4_CTRL      : INTEGER := 16#044#;
    constant ADDR_KERNEL_1_0_DATA_0    : INTEGER := 16#048#;
    constant ADDR_KERNEL_1_0_CTRL      : INTEGER := 16#04c#;
    constant ADDR_KERNEL_1_1_DATA_0    : INTEGER := 16#050#;
    constant ADDR_KERNEL_1_1_CTRL      : INTEGER := 16#054#;
    constant ADDR_KERNEL_1_2_DATA_0    : INTEGER := 16#058#;
    constant ADDR_KERNEL_1_2_CTRL      : INTEGER := 16#05c#;
    constant ADDR_KERNEL_1_3_DATA_0    : INTEGER := 16#060#;
    constant ADDR_KERNEL_1_3_CTRL      : INTEGER := 16#064#;
    constant ADDR_KERNEL_1_4_DATA_0    : INTEGER := 16#068#;
    constant ADDR_KERNEL_1_4_CTRL      : INTEGER := 16#06c#;
    constant ADDR_KERNEL_2_0_DATA_0    : INTEGER := 16#070#;
    constant ADDR_KERNEL_2_0_CTRL      : INTEGER := 16#074#;
    constant ADDR_KERNEL_2_1_DATA_0    : INTEGER := 16#078#;
    constant ADDR_KERNEL_2_1_CTRL      : INTEGER := 16#07c#;
    constant ADDR_KERNEL_2_2_DATA_0    : INTEGER := 16#080#;
    constant ADDR_KERNEL_2_2_CTRL      : INTEGER := 16#084#;
    constant ADDR_KERNEL_2_3_DATA_0    : INTEGER := 16#088#;
    constant ADDR_KERNEL_2_3_CTRL      : INTEGER := 16#08c#;
    constant ADDR_KERNEL_2_4_DATA_0    : INTEGER := 16#090#;
    constant ADDR_KERNEL_2_4_CTRL      : INTEGER := 16#094#;
    constant ADDR_KERNEL_3_0_DATA_0    : INTEGER := 16#098#;
    constant ADDR_KERNEL_3_0_CTRL      : INTEGER := 16#09c#;
    constant ADDR_KERNEL_3_1_DATA_0    : INTEGER := 16#0a0#;
    constant ADDR_KERNEL_3_1_CTRL      : INTEGER := 16#0a4#;
    constant ADDR_KERNEL_3_2_DATA_0    : INTEGER := 16#0a8#;
    constant ADDR_KERNEL_3_2_CTRL      : INTEGER := 16#0ac#;
    constant ADDR_KERNEL_3_3_DATA_0    : INTEGER := 16#0b0#;
    constant ADDR_KERNEL_3_3_CTRL      : INTEGER := 16#0b4#;
    constant ADDR_KERNEL_3_4_DATA_0    : INTEGER := 16#0b8#;
    constant ADDR_KERNEL_3_4_CTRL      : INTEGER := 16#0bc#;
    constant ADDR_KERNEL_4_0_DATA_0    : INTEGER := 16#0c0#;
    constant ADDR_KERNEL_4_0_CTRL      : INTEGER := 16#0c4#;
    constant ADDR_KERNEL_4_1_DATA_0    : INTEGER := 16#0c8#;
    constant ADDR_KERNEL_4_1_CTRL      : INTEGER := 16#0cc#;
    constant ADDR_KERNEL_4_2_DATA_0    : INTEGER := 16#0d0#;
    constant ADDR_KERNEL_4_2_CTRL      : INTEGER := 16#0d4#;
    constant ADDR_KERNEL_4_3_DATA_0    : INTEGER := 16#0d8#;
    constant ADDR_KERNEL_4_3_CTRL      : INTEGER := 16#0dc#;
    constant ADDR_KERNEL_4_4_DATA_0    : INTEGER := 16#0e0#;
    constant ADDR_KERNEL_4_4_CTRL      : INTEGER := 16#0e4#;
    constant ADDR_INV_DIVISOR_DATA_0   : INTEGER := 16#0e8#;
    constant ADDR_INV_DIVISOR_CTRL     : INTEGER := 16#0ec#;
    constant ADDR_FRACTION_BITS_DATA_0 : INTEGER := 16#0f0#;
    constant ADDR_FRACTION_BITS_CTRL   : INTEGER := 16#0f4#;
    constant ADDR_DELTA_DATA_0         : INTEGER := 16#0f8#;
    constant ADDR_DELTA_CTRL           : INTEGER := 16#0fc#;
    constant ADDR_BORDERTYPE_DATA_0    : INTEGER := 16#100#;
    constant ADDR_BORDERTYPE_CTRL      : INTEGER := 16#104#;
    constant ADDR_BITS         : INTEGER := 9;

    signal AWREADY_t           : STD_LOGIC;
    signal WREADY_t            : STD_LOGIC;
    signal ARREADY_t           : STD_LOGIC;
    signal RVALID_t            : STD_LOGIC;
    signal BVALID_t            : STD_LOGIC;
    signal waddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal wmask               : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal aw_hs               : STD_LOGIC;
    signal w_hs                : STD_LOGIC;
    signal rdata_data          : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal ar_hs               : STD_LOGIC;
    signal raddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    -- internal registers
    signal int_ap_idle         : STD_LOGIC := '0';
    signal int_ap_ready        : STD_LOGIC := '0';
    signal task_ap_ready       : STD_LOGIC;
    signal int_ap_done         : STD_LOGIC := '0';
    signal task_ap_done        : STD_LOGIC;
    signal int_task_ap_done    : STD_LOGIC := '0';
    signal int_ap_start        : STD_LOGIC := '0';
    signal int_interrupt       : STD_LOGIC := '0';
    signal int_auto_restart    : STD_LOGIC := '0';
    signal auto_restart_status : STD_LOGIC := '0';
    signal auto_restart_done   : STD_LOGIC;
    signal int_gie             : STD_LOGIC := '0';
    signal int_ier             : UNSIGNED(1 downto 0) := (others => '0');
    signal int_isr             : UNSIGNED(1 downto 0) := (others => '0');
    signal int_width           : UNSIGNED(12 downto 0) := (others => '0');
    signal int_height          : UNSIGNED(12 downto 0) := (others => '0');
    signal int_kernel_0_0      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_0_1      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_0_2      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_0_3      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_0_4      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_1_0      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_1_1      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_1_2      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_1_3      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_1_4      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_2_0      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_2_1      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_2_2      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_2_3      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_2_4      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_3_0      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_3_1      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_3_2      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_3_3      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_3_4      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_4_0      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_4_1      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_4_2      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_4_3      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_kernel_4_4      : UNSIGNED(7 downto 0) := (others => '0');
    signal int_inv_divisor     : UNSIGNED(31 downto 0) := (others => '0');
    signal int_fraction_bits   : UNSIGNED(4 downto 0) := (others => '0');
    signal int_delta           : UNSIGNED(31 downto 0) := (others => '0');
    signal int_borderType      : UNSIGNED(0 downto 0) := (others => '0');


begin
-- ----------------------- Instantiation------------------


-- ----------------------- AXI WRITE ---------------------
    AWREADY_t <=  '1' when wstate = wridle else '0';
    AWREADY   <=  AWREADY_t;
    WREADY_t  <=  '1' when wstate = wrdata else '0';
    WREADY    <=  WREADY_t;
    BVALID_t  <=  '1' when wstate = wrresp else '0';
    BVALID    <=  BVALID_t;
    BRESP     <=  "00";  -- OKAY
    wmask     <=  (31 downto 24 => WSTRB(3), 23 downto 16 => WSTRB(2), 15 downto 8 => WSTRB(1), 7 downto 0 => WSTRB(0));
    aw_hs     <=  AWVALID and AWREADY_t;
    w_hs      <=  WVALID and WREADY_t;

    -- write FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                wstate <= wrreset;
            elsif (ACLK_EN = '1') then
                wstate <= wnext;
            end if;
        end if;
    end process;

    process (wstate, AWVALID, WVALID, BREADY, BVALID_t)
    begin
        case (wstate) is
        when wridle =>
            if (AWVALID = '1') then
                wnext <= wrdata;
            else
                wnext <= wridle;
            end if;
        when wrdata =>
            if (WVALID = '1') then
                wnext <= wrresp;
            else
                wnext <= wrdata;
            end if;
        when wrresp =>
            if (BREADY = '1' and BVALID_t = '1') then
                wnext <= wridle;
            else
                wnext <= wrresp;
            end if;
        when others =>
            wnext <= wridle;
        end case;
    end process;

    waddr_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (aw_hs = '1') then
                    waddr <= UNSIGNED(AWADDR(ADDR_BITS-1 downto 2) & (1 downto 0 => '0'));
                end if;
            end if;
        end if;
    end process;

-- ----------------------- AXI READ ----------------------
    ARREADY_t <= '1' when (rstate = rdidle) else '0';
    ARREADY <= ARREADY_t;
    RDATA   <= STD_LOGIC_VECTOR(rdata_data);
    RRESP   <= "00";  -- OKAY
    RVALID_t  <= '1' when (rstate = rddata) else '0';
    RVALID    <= RVALID_t;
    ar_hs   <= ARVALID and ARREADY_t;
    raddr   <= UNSIGNED(ARADDR(ADDR_BITS-1 downto 0));

    -- read FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                rstate <= rdreset;
            elsif (ACLK_EN = '1') then
                rstate <= rnext;
            end if;
        end if;
    end process;

    process (rstate, ARVALID, RREADY, RVALID_t)
    begin
        case (rstate) is
        when rdidle =>
            if (ARVALID = '1') then
                rnext <= rddata;
            else
                rnext <= rdidle;
            end if;
        when rddata =>
            if (RREADY = '1' and RVALID_t = '1') then
                rnext <= rdidle;
            else
                rnext <= rddata;
            end if;
        when others =>
            rnext <= rdidle;
        end case;
    end process;

    rdata_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    rdata_data <= (others => '0');
                    case (TO_INTEGER(raddr)) is
                    when ADDR_AP_CTRL =>
                        rdata_data(9) <= int_interrupt;
                        rdata_data(7) <= int_auto_restart;
                        rdata_data(3) <= int_ap_ready;
                        rdata_data(2) <= int_ap_idle;
                        rdata_data(1) <= int_task_ap_done;
                        rdata_data(0) <= int_ap_start;
                    when ADDR_GIE =>
                        rdata_data(0) <= int_gie;
                    when ADDR_IER =>
                        rdata_data(1 downto 0) <= int_ier;
                    when ADDR_ISR =>
                        rdata_data(1 downto 0) <= int_isr;
                    when ADDR_WIDTH_DATA_0 =>
                        rdata_data <= RESIZE(int_width(12 downto 0), 32);
                    when ADDR_HEIGHT_DATA_0 =>
                        rdata_data <= RESIZE(int_height(12 downto 0), 32);
                    when ADDR_KERNEL_0_0_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_0_0(7 downto 0), 32);
                    when ADDR_KERNEL_0_1_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_0_1(7 downto 0), 32);
                    when ADDR_KERNEL_0_2_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_0_2(7 downto 0), 32);
                    when ADDR_KERNEL_0_3_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_0_3(7 downto 0), 32);
                    when ADDR_KERNEL_0_4_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_0_4(7 downto 0), 32);
                    when ADDR_KERNEL_1_0_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_1_0(7 downto 0), 32);
                    when ADDR_KERNEL_1_1_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_1_1(7 downto 0), 32);
                    when ADDR_KERNEL_1_2_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_1_2(7 downto 0), 32);
                    when ADDR_KERNEL_1_3_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_1_3(7 downto 0), 32);
                    when ADDR_KERNEL_1_4_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_1_4(7 downto 0), 32);
                    when ADDR_KERNEL_2_0_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_2_0(7 downto 0), 32);
                    when ADDR_KERNEL_2_1_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_2_1(7 downto 0), 32);
                    when ADDR_KERNEL_2_2_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_2_2(7 downto 0), 32);
                    when ADDR_KERNEL_2_3_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_2_3(7 downto 0), 32);
                    when ADDR_KERNEL_2_4_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_2_4(7 downto 0), 32);
                    when ADDR_KERNEL_3_0_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_3_0(7 downto 0), 32);
                    when ADDR_KERNEL_3_1_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_3_1(7 downto 0), 32);
                    when ADDR_KERNEL_3_2_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_3_2(7 downto 0), 32);
                    when ADDR_KERNEL_3_3_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_3_3(7 downto 0), 32);
                    when ADDR_KERNEL_3_4_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_3_4(7 downto 0), 32);
                    when ADDR_KERNEL_4_0_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_4_0(7 downto 0), 32);
                    when ADDR_KERNEL_4_1_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_4_1(7 downto 0), 32);
                    when ADDR_KERNEL_4_2_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_4_2(7 downto 0), 32);
                    when ADDR_KERNEL_4_3_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_4_3(7 downto 0), 32);
                    when ADDR_KERNEL_4_4_DATA_0 =>
                        rdata_data <= RESIZE(int_kernel_4_4(7 downto 0), 32);
                    when ADDR_INV_DIVISOR_DATA_0 =>
                        rdata_data <= RESIZE(int_inv_divisor(31 downto 0), 32);
                    when ADDR_FRACTION_BITS_DATA_0 =>
                        rdata_data <= RESIZE(int_fraction_bits(4 downto 0), 32);
                    when ADDR_DELTA_DATA_0 =>
                        rdata_data <= RESIZE(int_delta(31 downto 0), 32);
                    when ADDR_BORDERTYPE_DATA_0 =>
                        rdata_data <= RESIZE(int_borderType(0 downto 0), 32);
                    when others =>
                        NULL;
                    end case;
                end if;
            end if;
        end if;
    end process;

-- ----------------------- Register logic ----------------
    interrupt            <= int_interrupt;
    ap_start             <= int_ap_start;
    task_ap_done         <= (ap_done and not auto_restart_status) or auto_restart_done;
    task_ap_ready        <= ap_ready and not int_auto_restart;
    auto_restart_done    <= auto_restart_status and (ap_idle and not int_ap_idle);
    width                <= STD_LOGIC_VECTOR(int_width);
    height               <= STD_LOGIC_VECTOR(int_height);
    kernel_0_0           <= STD_LOGIC_VECTOR(int_kernel_0_0);
    kernel_0_1           <= STD_LOGIC_VECTOR(int_kernel_0_1);
    kernel_0_2           <= STD_LOGIC_VECTOR(int_kernel_0_2);
    kernel_0_3           <= STD_LOGIC_VECTOR(int_kernel_0_3);
    kernel_0_4           <= STD_LOGIC_VECTOR(int_kernel_0_4);
    kernel_1_0           <= STD_LOGIC_VECTOR(int_kernel_1_0);
    kernel_1_1           <= STD_LOGIC_VECTOR(int_kernel_1_1);
    kernel_1_2           <= STD_LOGIC_VECTOR(int_kernel_1_2);
    kernel_1_3           <= STD_LOGIC_VECTOR(int_kernel_1_3);
    kernel_1_4           <= STD_LOGIC_VECTOR(int_kernel_1_4);
    kernel_2_0           <= STD_LOGIC_VECTOR(int_kernel_2_0);
    kernel_2_1           <= STD_LOGIC_VECTOR(int_kernel_2_1);
    kernel_2_2           <= STD_LOGIC_VECTOR(int_kernel_2_2);
    kernel_2_3           <= STD_LOGIC_VECTOR(int_kernel_2_3);
    kernel_2_4           <= STD_LOGIC_VECTOR(int_kernel_2_4);
    kernel_3_0           <= STD_LOGIC_VECTOR(int_kernel_3_0);
    kernel_3_1           <= STD_LOGIC_VECTOR(int_kernel_3_1);
    kernel_3_2           <= STD_LOGIC_VECTOR(int_kernel_3_2);
    kernel_3_3           <= STD_LOGIC_VECTOR(int_kernel_3_3);
    kernel_3_4           <= STD_LOGIC_VECTOR(int_kernel_3_4);
    kernel_4_0           <= STD_LOGIC_VECTOR(int_kernel_4_0);
    kernel_4_1           <= STD_LOGIC_VECTOR(int_kernel_4_1);
    kernel_4_2           <= STD_LOGIC_VECTOR(int_kernel_4_2);
    kernel_4_3           <= STD_LOGIC_VECTOR(int_kernel_4_3);
    kernel_4_4           <= STD_LOGIC_VECTOR(int_kernel_4_4);
    inv_divisor          <= STD_LOGIC_VECTOR(int_inv_divisor);
    fraction_bits        <= STD_LOGIC_VECTOR(int_fraction_bits);
    delta                <= STD_LOGIC_VECTOR(int_delta);
    borderType           <= STD_LOGIC_VECTOR(int_borderType);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_interrupt <= '0';
            elsif (ACLK_EN = '1') then
                if (int_gie = '1' and (int_isr(0) or int_isr(1)) = '1') then
                    int_interrupt <= '1';
                else
                    int_interrupt <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_start <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AP_CTRL and WSTRB(0) = '1' and WDATA(0) = '1') then
                    int_ap_start <= '1';
                elsif (ap_ready = '1') then
                    int_ap_start <= int_auto_restart; -- clear on handshake/auto restart
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_done <= '0';
            elsif (ACLK_EN = '1') then
                if (true) then
                    int_ap_done <= ap_done;
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_task_ap_done <= '0';
            elsif (ACLK_EN = '1') then
                if (task_ap_done = '1') then
                    int_task_ap_done <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AP_CTRL) then
                    int_task_ap_done <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_idle <= '0';
            elsif (ACLK_EN = '1') then
                if (true) then
                    int_ap_idle <= ap_idle;
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_ready <= '0';
            elsif (ACLK_EN = '1') then
                if (task_ap_ready = '1') then
                    int_ap_ready <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AP_CTRL) then
                    int_ap_ready <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_auto_restart <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AP_CTRL and WSTRB(0) = '1') then
                    int_auto_restart <= WDATA(7);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                auto_restart_status <= '0';
            elsif (ACLK_EN = '1') then
                if (int_auto_restart = '1') then
                    auto_restart_status <= '1';
                elsif (ap_idle = '1') then
                    auto_restart_status <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_gie <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_GIE and WSTRB(0) = '1') then
                    int_gie <= WDATA(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ier <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_IER and WSTRB(0) = '1') then
                    int_ier <= UNSIGNED(WDATA(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_isr(0) <= '0';
            elsif (ACLK_EN = '1') then
                if (int_ier(0) = '1' and ap_done = '1') then
                    int_isr(0) <= '1';
                elsif (w_hs = '1' and waddr = ADDR_ISR and WSTRB(0) = '1') then
                    int_isr(0) <= int_isr(0) xor WDATA(0); -- toggle on write
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_isr(1) <= '0';
            elsif (ACLK_EN = '1') then
                if (int_ier(1) = '1' and ap_ready = '1') then
                    int_isr(1) <= '1';
                elsif (w_hs = '1' and waddr = ADDR_ISR and WSTRB(0) = '1') then
                    int_isr(1) <= int_isr(1) xor WDATA(1); -- toggle on write
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_width(12 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_WIDTH_DATA_0) then
                    int_width(12 downto 0) <= (UNSIGNED(WDATA(12 downto 0)) and wmask(12 downto 0)) or ((not wmask(12 downto 0)) and int_width(12 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_height(12 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_HEIGHT_DATA_0) then
                    int_height(12 downto 0) <= (UNSIGNED(WDATA(12 downto 0)) and wmask(12 downto 0)) or ((not wmask(12 downto 0)) and int_height(12 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_0_0(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_0_0_DATA_0) then
                    int_kernel_0_0(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_0_0(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_0_1(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_0_1_DATA_0) then
                    int_kernel_0_1(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_0_1(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_0_2(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_0_2_DATA_0) then
                    int_kernel_0_2(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_0_2(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_0_3(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_0_3_DATA_0) then
                    int_kernel_0_3(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_0_3(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_0_4(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_0_4_DATA_0) then
                    int_kernel_0_4(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_0_4(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_1_0(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_1_0_DATA_0) then
                    int_kernel_1_0(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_1_0(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_1_1(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_1_1_DATA_0) then
                    int_kernel_1_1(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_1_1(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_1_2(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_1_2_DATA_0) then
                    int_kernel_1_2(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_1_2(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_1_3(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_1_3_DATA_0) then
                    int_kernel_1_3(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_1_3(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_1_4(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_1_4_DATA_0) then
                    int_kernel_1_4(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_1_4(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_2_0(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_2_0_DATA_0) then
                    int_kernel_2_0(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_2_0(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_2_1(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_2_1_DATA_0) then
                    int_kernel_2_1(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_2_1(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_2_2(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_2_2_DATA_0) then
                    int_kernel_2_2(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_2_2(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_2_3(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_2_3_DATA_0) then
                    int_kernel_2_3(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_2_3(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_2_4(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_2_4_DATA_0) then
                    int_kernel_2_4(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_2_4(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_3_0(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_3_0_DATA_0) then
                    int_kernel_3_0(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_3_0(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_3_1(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_3_1_DATA_0) then
                    int_kernel_3_1(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_3_1(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_3_2(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_3_2_DATA_0) then
                    int_kernel_3_2(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_3_2(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_3_3(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_3_3_DATA_0) then
                    int_kernel_3_3(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_3_3(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_3_4(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_3_4_DATA_0) then
                    int_kernel_3_4(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_3_4(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_4_0(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_4_0_DATA_0) then
                    int_kernel_4_0(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_4_0(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_4_1(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_4_1_DATA_0) then
                    int_kernel_4_1(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_4_1(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_4_2(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_4_2_DATA_0) then
                    int_kernel_4_2(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_4_2(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_4_3(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_4_3_DATA_0) then
                    int_kernel_4_3(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_4_3(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_kernel_4_4(7 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_KERNEL_4_4_DATA_0) then
                    int_kernel_4_4(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_kernel_4_4(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_inv_divisor(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_INV_DIVISOR_DATA_0) then
                    int_inv_divisor(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_inv_divisor(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_fraction_bits(4 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_FRACTION_BITS_DATA_0) then
                    int_fraction_bits(4 downto 0) <= (UNSIGNED(WDATA(4 downto 0)) and wmask(4 downto 0)) or ((not wmask(4 downto 0)) and int_fraction_bits(4 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_delta(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_DELTA_DATA_0) then
                    int_delta(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_delta(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_borderType(0 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_BORDERTYPE_DATA_0) then
                    int_borderType(0 downto 0) <= (UNSIGNED(WDATA(0 downto 0)) and wmask(0 downto 0)) or ((not wmask(0 downto 0)) and int_borderType(0 downto 0));
                end if;
            end if;
        end if;
    end process;


-- ----------------------- Memory logic ------------------

end architecture behave;
