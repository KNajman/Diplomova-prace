----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.05.2020 16:32:20
-- Design Name: 
-- Module Name: xpm_fifo_wrapper - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Library xpm;
use xpm.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity xpm_fifo_wrapper is
	generic(
		CLOCKING_MODE       : string  := "common_clock";
		FIFO_MEMORY_TYPE    : string  := "auto";
		PACKET_FIFO         : string  := "false";
		REVERSE_WORD_ORDER  : integer := 0;
		FIFO_DEPTH          : integer := 2048;
		WTDATA_WIDTH        : integer := 64;
		TUSER_WIDTH         : integer := 1;
		RTDATA_WIDTH        : integer := 32;
		RELATED_CLOCKS      : integer := 0;
		WR_DATA_COUNT_WIDTH : integer := 32;
		RD_DATA_COUNT_WIDTH : integer := 32
	);
	port(
		s_reset            : in  std_logic;
		m_aclk             : in  std_logic;
		s_aclk             : in  std_logic;
		s_axis_tvalid      : in  std_logic;
		s_axis_tready      : out std_logic;
		s_axis_tdata       : in  std_logic_vector(WTDATA_WIDTH - 1 downto 0);
		s_axis_tlast       : in  std_logic;
		s_axis_tuser       : in  std_logic_vector(TUSER_WIDTH - 1 downto 0);
		m_axis_tvalid      : out std_logic;
		m_axis_tready      : in  std_logic;
		m_axis_tdata       : out std_logic_vector(RTDATA_WIDTH - 1 downto 0);
		m_axis_tlast       : out std_logic;
		m_axis_tuser       : out std_logic_vector(TUSER_WIDTH - 1 downto 0);
		wr_data_count_axis : out std_logic_vector(WR_DATA_COUNT_WIDTH - 1 downto 0);
		rd_data_count_axis : out std_logic_vector(RD_DATA_COUNT_WIDTH - 1 downto 0)
	);
end xpm_fifo_wrapper;

architecture Behavioral of xpm_fifo_wrapper is

	signal s_aresetn         : std_logic;
	signal s_areset          : std_logic;
	signal s_cntr            : unsigned(3 downto 0) := to_unsigned(6, 4);
	signal s_axis_tready_sig : std_logic;

	constant WRITE_READ_RATIO : integer := WTDATA_WIDTH / RTDATA_WIDTH;

	constant DAF_WRITE_DATA_WIDTH : integer := WTDATA_WIDTH + TUSER_WIDTH * WRITE_READ_RATIO + WRITE_READ_RATIO;
	constant DAF_READ_DATA_WIDTH  : integer := RTDATA_WIDTH + TUSER_WIDTH + 1;

	signal df_m_axis_tvalid : std_logic;
	signal df_m_axis_tready : std_logic;
	signal df_m_axis_tdata  : std_logic_vector(WTDATA_WIDTH - 1 downto 0);
	signal df_m_axis_tlast  : std_logic;
	signal df_m_axis_tuser  : std_logic_vector(TUSER_WIDTH - 1 downto 0);

	signal daf_data_valid : std_logic;
	signal daf_dout       : std_logic_vector(DAF_READ_DATA_WIDTH - 1 downto 0);
	signal daf_full       : std_logic;
	signal daf_din        : std_logic_vector(DAF_WRITE_DATA_WIDTH - 1 downto 0);
	signal daf_rd_en      : std_logic;
	signal daf_wr_en      : std_logic;

begin

	daf_wr_en        <= df_m_axis_tvalid;
	df_m_axis_tready <= not daf_full;
	process(all) is
	begin
		if REVERSE_WORD_ORDER = 0 then
			for i in 0 to WRITE_READ_RATIO - 1 loop
				if i = WRITE_READ_RATIO - 1 then
					daf_din((i + 1) * DAF_READ_DATA_WIDTH - 1 downto i * DAF_READ_DATA_WIDTH) <= df_m_axis_tlast & df_m_axis_tuser & df_m_axis_tdata((i + 1) * RTDATA_WIDTH - 1 downto i * RTDATA_WIDTH);
				else
					daf_din((i + 1) * DAF_READ_DATA_WIDTH - 1 downto i * DAF_READ_DATA_WIDTH) <= '0' & df_m_axis_tuser & df_m_axis_tdata((i + 1) * RTDATA_WIDTH - 1 downto i * RTDATA_WIDTH);
				end if;
			end loop;
		else
			for i in 0 to WRITE_READ_RATIO - 1 loop
				if i = WRITE_READ_RATIO - 1 then
					daf_din((WRITE_READ_RATIO - i) * DAF_READ_DATA_WIDTH - 1 downto (WRITE_READ_RATIO - i - 1) * DAF_READ_DATA_WIDTH) <= df_m_axis_tlast & df_m_axis_tuser & df_m_axis_tdata((i + 1) * RTDATA_WIDTH - 1 downto i * RTDATA_WIDTH);
				else
					daf_din((WRITE_READ_RATIO - i) * DAF_READ_DATA_WIDTH - 1 downto (WRITE_READ_RATIO - i - 1) * DAF_READ_DATA_WIDTH) <= '0' & df_m_axis_tuser & df_m_axis_tdata((i + 1) * RTDATA_WIDTH - 1 downto i * RTDATA_WIDTH);
				end if;
			end loop;
		end if;
	end process;

	native2axi : for i in 0 to WRITE_READ_RATIO - 1 generate

	end generate;
	-- m_axis_tdata  <= daf_dout(RTDATA_WIDTH - 1 downto 0);
	-- m_axis_tuser  <= daf_dout(RTDATA_WIDTH + TUSER_WIDTH - 1 downto RTDATA_WIDTH);
	-- m_axis_tlast  <= daf_dout(daf_dout'high);
	(m_axis_tlast, m_axis_tuser, m_axis_tdata) <= daf_dout;
	m_axis_tvalid <= daf_data_valid;
	daf_rd_en     <= m_axis_tready;

	s_axis_tready <= s_axis_tready_sig when s_aresetn = '1' else '0';

	delay_reset : process(m_aclk)
	begin
		if rising_edge(m_aclk) then
			if s_reset then
				s_cntr    <= to_unsigned(6, s_cntr'length);
				s_aresetn <= '0';
				s_areset  <= '1';
			else
				if s_cntr > 0 then
					s_cntr    <= s_cntr - 1;
					s_aresetn <= '0';
					s_areset  <= '1';
				else
					s_aresetn <= '1';
					s_areset  <= '0';
				end if;
			end if;
		end if;
	end process;

	-- xpm_fifo_axis: AXI Stream FIFO
	-- Xilinx Parameterized Macro, version 2019.1

	xpm_fifo_axis_inst : xpm_fifo_axis
		generic map(
			CLOCKING_MODE       => CLOCKING_MODE, -- String
			FIFO_MEMORY_TYPE    => FIFO_MEMORY_TYPE, -- String
			PACKET_FIFO         => PACKET_FIFO, -- String
			FIFO_DEPTH          => FIFO_DEPTH, -- DECIMAL
			TDATA_WIDTH         => WTDATA_WIDTH, -- DECIMAL
			TID_WIDTH           => 1,   -- DECIMAL
			TDEST_WIDTH         => 1,   -- DECIMAL
			TUSER_WIDTH         => TUSER_WIDTH, -- DECIMAL
			ECC_MODE            => "no_ecc", -- String
			RELATED_CLOCKS      => RELATED_CLOCKS, -- DECIMAL
			USE_ADV_FEATURES    => "1004", -- String
			WR_DATA_COUNT_WIDTH => WR_DATA_COUNT_WIDTH, -- DECIMAL
			RD_DATA_COUNT_WIDTH => RD_DATA_COUNT_WIDTH, -- DECIMAL
			PROG_FULL_THRESH    => 10,  -- DECIMAL
			PROG_EMPTY_THRESH   => 10,  -- DECIMAL
			--			SIM_ASSERT_CHK      => 1,   -- DECIMAL; 0=disable simulation messages, 1=enable simulation messages
			CDC_SYNC_STAGES     => 2    -- DECIMAL
		)
		port map(
			s_aresetn          => s_aresetn, -- 1-bit input: Active low asynchronous reset.
			m_aclk             => s_aclk, -- 1-bit input: Master Interface Clock: All signals on master
			-- interface are sampled on the rising edge of this clock.
			s_aclk             => s_aclk, -- 1-bit input: Slave Interface Clock: All signals on slave
			-- interface are sampled on the rising edge of this clock.
			s_axis_tvalid      => s_axis_tvalid, -- 1-bit input: TVALID: Indicates that the master is driving a
			-- valid transfer. A transfer takes place when both TVALID and
			-- TREADY are asserted
			s_axis_tready      => s_axis_tready_sig, -- 1-bit output: TREADY: Indicates that the slave can accept a
			-- transfer in the current cycle.
			s_axis_tdata       => s_axis_tdata, -- TDATA_WIDTH-bit input: TDATA: The primary payload that is
			-- used to provide the data that is passing across the
			-- interface. The width of the data payload is an integer
			-- number of bytes.
			s_axis_tstrb       => (others => '1'), -- TDATA_WIDTH-bit input: TSTRB: The byte qualifier that
			-- indicates whether the content of the associated byte of
			-- TDATA is processed as a data byte or a position byte. For a
			-- 64-bit DATA, bit 0 corresponds to the least significant byte
			-- on DATA, and bit 0 corresponds to the least significant byte
			-- on DATA, and bit 7 corresponds to the most significant byte.
			-- For example: STROBE[0] = 1b, DATA[7:0] is valid STROBE[7] =
			-- 0b, DATA[63:56] is not valid
			s_axis_tkeep       => (others => '1'), -- TDATA_WIDTH-bit input: TKEEP: The byte qualifier that
			-- indicates whether the content of the associated byte of
			-- TDATA is processed as part of the data stream. Associated
			-- bytes that have the TKEEP byte qualifier deasserted are null
			-- bytes and can be removed from the data stream. For a 64-bit
			-- DATA, bit 0 corresponds to the least significant byte on
			-- DATA, and bit 7 corresponds to the most significant byte.
			-- For example: KEEP[0] = 1b, DATA[7:0] is not a NULL byte
			-- KEEP[7] = 0b, DATA[63:56] is a NULL byte
			s_axis_tlast       => s_axis_tlast, -- 1-bit input: TLAST: Indicates the boundary of a packet.
			s_axis_tid         => (others => '0'), -- TID_WIDTH-bit input: TID: The data stream identifier that
			-- indicates different streams of data.
			s_axis_tdest       => (others => '0'), -- TDEST_WIDTH-bit input: TDEST: Provides routing information
			-- for the data stream.
			s_axis_tuser       => s_axis_tuser, -- TUSER_WIDTH-bit input: TUSER: The user-defined sideband
			-- information that can be transmitted alongside the data
			-- stream.
			m_axis_tvalid      => df_m_axis_tvalid, -- 1-bit output: TVALID: Indicates that the master is driving a
			-- valid transfer. A transfer takes place when both TVALID and
			-- TREADY are asserted
			m_axis_tready      => df_m_axis_tready, -- 1-bit input: TREADY: Indicates that the slave can accept a
			-- transfer in the current cycle.
			m_axis_tdata       => df_m_axis_tdata, -- TDATA_WIDTH-bit output: TDATA: The primary payload that is
			-- used to provide the data that is passing across the
			-- interface. The width of the data payload is an integer
			-- number of bytes.
			m_axis_tstrb       => open, -- TDATA_WIDTH-bit output: TSTRB: The byte qualifier that
			-- indicates whether the content of the associated byte of
			-- TDATA is processed as a data byte or a position byte. For a
			-- 64-bit DATA, bit 0 corresponds to the least significant byte
			-- on DATA, and bit 0 corresponds to the least significant byte
			-- on DATA, and bit 7 corresponds to the most significant byte.
			-- For example: STROBE[0] = 1b, DATA[7:0] is valid STROBE[7] =
			-- 0b, DATA[63:56] is not valid
			m_axis_tkeep       => open, -- TDATA_WIDTH-bit output: TKEEP: The byte qualifier that
			-- indicates whether the content of the associated byte of
			-- TDATA is processed as part of the data stream. Associated
			-- bytes that have the TKEEP byte qualifier deasserted are null
			-- bytes and can be removed from the data stream. For a 64-bit
			-- DATA, bit 0 corresponds to the least significant byte on
			-- DATA, and bit 7 corresponds to the most significant byte.
			-- For example: KEEP[0] = 1b, DATA[7:0] is not a NULL byte
			-- KEEP[7] = 0b, DATA[63:56] is a NULL byte
			m_axis_tlast       => df_m_axis_tlast, -- 1-bit output: TLAST: Indicates the boundary of a packet.
			m_axis_tid         => open, -- TID_WIDTH-bit output: TID: The data stream identifier that
			-- indicates different streams of data.
			m_axis_tdest       => open, -- TDEST_WIDTH-bit output: TDEST: Provides routing information
			-- for the data stream.
			m_axis_tuser       => df_m_axis_tuser, -- TUSER_WIDTH-bit output: TUSER: The user-defined sideband
			-- information that can be transmitted alongside the data
			-- stream.
			prog_full_axis     => open, -- 1-bit output: Programmable Full: This signal is asserted
			-- when the number of words in the FIFO is greater than or
			-- equal to the programmable full threshold value. It is
			-- de-asserted when the number of words in the FIFO is less
			-- than the programmable full threshold value.
			wr_data_count_axis => wr_data_count_axis, -- WR_DATA_COUNT_WIDTH-bit output: Write Data Count: This bus
			-- indicates the number of words written into the FIFO.
			almost_full_axis   => open, -- 1-bit output: Almost Full: When asserted, this signal
			-- indicates that only one more write can be performed before
			-- the FIFO is full.
			prog_empty_axis    => open, -- 1-bit output: Programmable Empty- This signal is asserted
			-- when the number of words in the FIFO is less than or equal
			-- to the programmable empty threshold value. It is de-asserted
			-- when the number of words in the FIFO exceeds the
			-- programmable empty threshold value.
			rd_data_count_axis => rd_data_count_axis, -- RD_DATA_COUNT_WIDTH-bit output: Read Data Count- This bus
			-- indicates the number of words available for reading in the
			-- FIFO.
			almost_empty_axis  => open, -- 1-bit output: Almost Empty : When asserted, this signal
			-- indicates that only one more read can be performed before
			-- the FIFO goes to empty.
			injectsbiterr_axis => '0',  -- 1-bit input: Single Bit Error Injection- Injects a single
			-- bit error if the ECC feature is used.
			injectdbiterr_axis => '0',  -- 1-bit input: Double Bit Error Injection- Injects a double
			-- bit error if the ECC feature is used.
			sbiterr_axis       => open, -- 1-bit output: Single Bit Error- Indicates that the ECC
			-- decoder detected and fixed a single-bit error.
			dbiterr_axis       => open  -- 1-bit output: Double Bit Error- Indicates that the ECC
			-- decoder detected a double-bit error and data in the FIFO
			-- core is corrupted.

		);

	-- End of xpm_fifo_axis_inst instantiation

	-- modify written data in axi fashion

	xpm_fifo_async_inst : xpm_fifo_async
		generic map(
			CASCADE_HEIGHT      => 0,   -- DECIMAL
			CDC_SYNC_STAGES     => 2,   -- DECIMAL
			DOUT_RESET_VALUE    => "0", -- String
			ECC_MODE            => "no_ecc", -- String
			EN_SIM_ASSERT_ERR   => "warning", -- String
			FIFO_MEMORY_TYPE    => "auto", -- String
			FIFO_READ_LATENCY   => 0,   -- DECIMAL
			FIFO_WRITE_DEPTH    => 16,  -- DECIMAL
			FULL_RESET_VALUE    => 1,   -- DECIMAL
			PROG_EMPTY_THRESH   => 10,  -- DECIMAL
			PROG_FULL_THRESH    => 10,  -- DECIMAL
			RD_DATA_COUNT_WIDTH => 1,   -- DECIMAL
			READ_DATA_WIDTH     => DAF_READ_DATA_WIDTH, -- DECIMAL
			READ_MODE           => "fwft", -- String
			RELATED_CLOCKS      => 1,   -- DECIMAL
			SIM_ASSERT_CHK      => 0,   -- DECIMAL; 0=disable simulation messages, 1=enable simulation messages
			USE_ADV_FEATURES    => "1000", -- String
			WAKEUP_TIME         => 0,   -- DECIMAL
			WRITE_DATA_WIDTH    => DAF_WRITE_DATA_WIDTH, -- DECIMAL
			WR_DATA_COUNT_WIDTH => 1    -- DECIMAL
		)
		port map(
			almost_empty  => open,      -- 1-bit output: Almost Empty : When asserted, this signal indicates that
			-- only one more read can be performed before the FIFO goes to empty.

			almost_full   => open,      -- 1-bit output: Almost Full: When asserted, this signal indicates that
			-- only one more write can be performed before the FIFO is full.

			data_valid    => daf_data_valid, -- 1-bit output: Read Data Valid: When asserted, this signal indicates
			-- that valid data is available on the output bus (dout).

			dbiterr       => open,      -- 1-bit output: Double Bit Error: Indicates that the ECC decoder
			-- detected a double-bit error and data in the FIFO core is corrupted.

			dout          => daf_dout,  -- READ_DATA_WIDTH-bit output: Read Data: The output data bus is driven
			-- when reading the FIFO.

			empty         => open,      -- 1-bit output: Empty Flag: When asserted, this signal indicates that
			-- the FIFO is empty. Read requests are ignored when the FIFO is empty,
			-- initiating a read while empty is not destructive to the FIFO.

			full          => daf_full,  -- 1-bit output: Full Flag: When asserted, this signal indicates that the
			-- FIFO is full. Write requests are ignored when the FIFO is full,
			-- initiating a write when the FIFO is full is not destructive to the
			-- contents of the FIFO.

			overflow      => open,      -- 1-bit output: Overflow: This signal indicates that a write request
			-- (wren) during the prior clock cycle was rejected, because the FIFO is
			-- full. Overflowing the FIFO is not destructive to the contents of the
			-- FIFO.

			prog_empty    => open,      -- 1-bit output: Programmable Empty: This signal is asserted when the
			-- number of words in the FIFO is less than or equal to the programmable
			-- empty threshold value. It is de-asserted when the number of words in
			-- the FIFO exceeds the programmable empty threshold value.

			prog_full     => open,      -- 1-bit output: Programmable Full: This signal is asserted when the
			-- number of words in the FIFO is greater than or equal to the
			-- programmable full threshold value. It is de-asserted when the number
			-- of words in the FIFO is less than the programmable full threshold
			-- value.

			rd_data_count => open,      -- RD_DATA_COUNT_WIDTH-bit output: Read Data Count: This bus indicates
			-- the number of words read from the FIFO.

			rd_rst_busy   => open,      -- 1-bit output: Read Reset Busy: Active-High indicator that the FIFO
			-- read domain is currently in a reset state.

			sbiterr       => open,      -- 1-bit output: Single Bit Error: Indicates that the ECC decoder
			-- detected and fixed a single-bit error.

			underflow     => open,      -- 1-bit output: Underflow: Indicates that the read request (rd_en)
			-- during the previous clock cycle was rejected because the FIFO is
			-- empty. Under flowing the FIFO is not destructive to the FIFO.

			wr_ack        => open,      -- 1-bit output: Write Acknowledge: This signal indicates that a write
			-- request (wr_en) during the prior clock cycle is succeeded.

			wr_data_count => open,      -- WR_DATA_COUNT_WIDTH-bit output: Write Data Count: This bus indicates
			-- the number of words written into the FIFO.

			wr_rst_busy   => open,      -- 1-bit output: Write Reset Busy: Active-High indicator that the FIFO
			-- write domain is currently in a reset state.

			din           => daf_din,   -- WRITE_DATA_WIDTH-bit input: Write Data: The input data bus used when
			-- writing the FIFO.

			injectdbiterr => '0',       -- 1-bit input: Double Bit Error Injection: Injects a double bit error if
			-- the ECC feature is used on block RAMs or UltraRAM macros.

			injectsbiterr => '0',       -- 1-bit input: Single Bit Error Injection: Injects a single bit error if
			-- the ECC feature is used on block RAMs or UltraRAM macros.

			rd_clk        => m_aclk,    -- 1-bit input: Read clock: Used for read operation. rd_clk must be a
			                            -- free running clock.

			rd_en         => daf_rd_en, -- 1-bit input: Read Enable: If the FIFO is not empty, asserting this
			-- signal causes data (on dout) to be read from the FIFO. Must be held
			-- active-low when rd_rst_busy is active high.

			rst           => s_areset,  -- 1-bit input: Reset: Must be synchronous to wr_clk. The clock(s) can be
			-- unstable at the time of applying reset, but reset must be released
			-- only after the clock(s) is/are stable.

			sleep         => '0',       -- 1-bit input: Dynamic power saving: If sleep is High, the memory/fifo
			-- block is in power saving mode.

			wr_clk        => m_aclk,    -- 1-bit input: Write clock: Used for write operation. wr_clk must be a
			                            -- free running clock.

			wr_en         => daf_wr_en  -- 1-bit input: Write Enable: If the FIFO is not full, asserting this
			-- signal causes data (on din) to be written to the FIFO. Must be held
			-- active-low when rst or wr_rst_busy is active high.

		);

end Behavioral;

-- XPM_FIFO instantiation template for AXI Stream FIFO configurations
-- Refer to the targeted device family architecture libraries guide for XPM_FIFO documentation
-- =======================================================================================================================

-- Parameter usage table, organized as follows:
-- +---------------------------------------------------------------------------------------------------------------------+
-- | Parameter name       | Data type          | Restrictions, if applicable                                             |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Description                                                                                                         |
-- +---------------------------------------------------------------------------------------------------------------------+
-- +---------------------------------------------------------------------------------------------------------------------+
-- | CDC_SYNC_STAGES      | Integer            | Range: 2 - 8. Default value = 2.                                        |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Specifies the number of synchronization stages on the CDC path.                                                     |
-- | Applicable only if CLOCKING_MODE = "independent_clock"                                                              |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | CLOCKING_MODE        | String             | Allowed values: common_clock, independent_clock. Default value = common_clock.|
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Designate whether AXI Stream FIFO is clocked with a common clock or with independent clocks-                        |
-- |                                                                                                                     |
-- |   "common_clock"- Common clocking; clock both write and read domain s_aclk                                          |
-- |   "independent_clock"- Independent clocking; clock write domain with s_aclk and read domain with m_aclk             |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | ECC_MODE             | String             | Allowed values: no_ecc, en_ecc. Default value = no_ecc.                 |
-- |---------------------------------------------------------------------------------------------------------------------|
-- |                                                                                                                     |
-- |   "no_ecc" - Disables ECC                                                                                           |
-- |   "en_ecc" - Enables both ECC Encoder and Decoder                                                                   |
-- |                                                                                                                     |
-- | NOTE: ECC_MODE should be "no_ecc" if FIFO_MEMORY_TYPE is set to "auto". Violating this may result incorrect behavior.|
-- +---------------------------------------------------------------------------------------------------------------------+
-- | FIFO_DEPTH           | Integer            | Range: 16 - 4194304. Default value = 2048.                              |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Defines the AXI Stream FIFO Write Depth, must be power of two                                                       |
-- | NOTE: The maximum FIFO size (width x depth) is limited to 150-Megabits.                                             |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | FIFO_MEMORY_TYPE     | String             | Allowed values: auto, block, distributed, ultra. Default value = auto.  |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Designate the fifo memory primitive (resource type) to use-                                                         |
-- |                                                                                                                     |
-- |   "auto"- Allow Vivado Synthesis to choose                                                                          |
-- |   "block"- Block RAM FIFO                                                                                           |
-- |   "distributed"- Distributed RAM FIFO                                                                               |
-- |   "ultra"- URAM FIFO                                                                                                |
-- |                                                                                                                     |
-- | NOTE: There may be a behavior mismatch if Block RAM or Ultra RAM specific features, like ECC or Asymmetry, are selected with FIFO_MEMORY_TYPE set to "auto".|
-- +---------------------------------------------------------------------------------------------------------------------+
-- | PACKET_FIFO          | String             | Allowed values: false, true. Default value = false.                     |
-- |---------------------------------------------------------------------------------------------------------------------|
-- |                                                                                                                     |
-- |   "true"- Enables Packet FIFO mode                                                                                  |
-- |   "false"- Disables Packet FIFO mode                                                                                |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | PROG_EMPTY_THRESH    | Integer            | Range: 5 - 4194301. Default value = 10.                                 |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Specifies the minimum number of read words in the FIFO at or below which prog_empty is asserted.                    |
-- |                                                                                                                     |
-- |   Min_Value = 5                                                                                                     |
-- |   Max_Value = FIFO_WRITE_DEPTH - 5                                                                                  |
-- |                                                                                                                     |
-- | NOTE: The default threshold value is dependent on default FIFO_WRITE_DEPTH value. If FIFO_WRITE_DEPTH value is      |
-- | changed, ensure the threshold value is within the valid range though the programmable flags are not used.           |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | PROG_FULL_THRESH     | Integer            | Range: 5 - 4194301. Default value = 10.                                 |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Specifies the maximum number of write words in the FIFO at or above which prog_full is asserted.                    |
-- |                                                                                                                     |
-- |   Min_Value = 5 + CDC_SYNC_STAGES                                                                                   |
-- |   Max_Value = FIFO_WRITE_DEPTH - 5                                                                                  |
-- |                                                                                                                     |
-- | NOTE: The default threshold value is dependent on default FIFO_WRITE_DEPTH value. If FIFO_WRITE_DEPTH value is      |
-- | changed, ensure the threshold value is within the valid range though the programmable flags are not used.           |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | RD_DATA_COUNT_WIDTH  | Integer            | Range: 1 - 23. Default value = 1.                                       |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Specifies the width of rd_data_count_axis. To reflect the correct value, the width should be log2(FIFO_DEPTH)+1.    |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | RELATED_CLOCKS       | Integer            | Range: 0 - 1. Default value = 0.                                        |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Specifies if the s_aclk and m_aclk are related having the same source but different clock ratios.                   |
-- | Applicable only if CLOCKING_MODE = "independent_clock"                                                              |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | SIM_ASSERT_CHK       | Integer            | Range: 0 - 1. Default value = 0.                                        |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | 0- Disable simulation message reporting. Messages related to potential misuse will not be reported.                 |
-- | 1- Enable simulation message reporting. Messages related to potential misuse will be reported.                      |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | TDATA_WIDTH          | Integer            | Range: 8 - 2048. Default value = 32.                                    |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Defines the width of the TDATA port, s_axis_tdata and m_axis_tdata                                                  |
-- | NOTE: The maximum FIFO size (width x depth) is limited to 150-Megabits.                                             |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | TDEST_WIDTH          | Integer            | Range: 1 - 32. Default value = 1.                                       |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Defines the width of the TDEST port, s_axis_tdest and m_axis_tdest                                                  |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | TID_WIDTH            | Integer            | Range: 1 - 32. Default value = 1.                                       |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Defines the width of the ID port, s_axis_tid and m_axis_tid                                                         |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | TUSER_WIDTH          | Integer            | Range: 1 - 4086. Default value = 1.                                     |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Defines the width of the TUSER port, s_axis_tuser and m_axis_tuser                                                  |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | USE_ADV_FEATURES     | String             | Default value = 1000.                                                   |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Enables almost_empty_axis, rd_data_count_axis, prog_empty_axis, almost_full_axis, wr_data_count_axis,               |
-- | prog_full_axis sideband signals.                                                                                    |
-- |                                                                                                                     |
-- |   Setting USE_ADV_FEATURES[1] to 1 enables prog_full flag;    Default value of this bit is 0                        |
-- |   Setting USE_ADV_FEATURES[2]  to 1 enables wr_data_count;     Default value of this bit is 0                       |
-- |   Setting USE_ADV_FEATURES[3]  to 1 enables almost_full flag;  Default value of this bit is 0                       |
-- |   Setting USE_ADV_FEATURES[9]  to 1 enables prog_empty flag;   Default value of this bit is 0                       |
-- |   Setting USE_ADV_FEATURES[10] to 1 enables rd_data_count;     Default value of this bit is 0                       |
-- |   Setting USE_ADV_FEATURES[11] to 1 enables almost_empty flag; Default value of this bit is 0                       |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | WR_DATA_COUNT_WIDTH  | Integer            | Range: 1 - 23. Default value = 1.                                       |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Specifies the width of wr_data_count_axis. To reflect the correct value, the width should be log2(FIFO_DEPTH)+1.    |
-- +---------------------------------------------------------------------------------------------------------------------+

-- Port usage table, organized as follows:
-- +---------------------------------------------------------------------------------------------------------------------+
-- | Port name      | Direction | Size, in bits                         | Domain  | Sense       | Handling if unused     |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Description                                                                                                         |
-- +---------------------------------------------------------------------------------------------------------------------+
-- +---------------------------------------------------------------------------------------------------------------------+
-- | almost_empty_axis| Output    | 1                                     | m_aclk  | Active-high | DoNotCare              |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Almost Empty : When asserted, this signal indicates that only one more read can be performed before the FIFO goes to|
-- | empty.                                                                                                              |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | almost_full_axis| Output    | 1                                     | s_aclk  | Active-high | DoNotCare              |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Almost Full: When asserted, this signal indicates that only one more write can be performed before the FIFO is full.|
-- +---------------------------------------------------------------------------------------------------------------------+
-- | dbiterr_axis   | Output    | 1                                     | m_aclk  | Active-high | DoNotCare              |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Double Bit Error- Indicates that the ECC decoder detected a double-bit error and data in the FIFO core is corrupted.|
-- +---------------------------------------------------------------------------------------------------------------------+
-- | injectdbiterr_axis| Input     | 1                                     | s_aclk  | Active-high | Tie to 1'b0            |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Double Bit Error Injection- Injects a double bit error if the ECC feature is used.                                  |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | injectsbiterr_axis| Input     | 1                                     | s_aclk  | Active-high | Tie to 1'b0            |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Single Bit Error Injection- Injects a single bit error if the ECC feature is used.                                  |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | m_aclk         | Input     | 1                                     | NA      | Rising edge | Required               |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Master Interface Clock: All signals on master interface are sampled on the rising edge of this clock.               |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | m_axis_tdata   | Output    | TDATA_WIDTH                           | m_aclk  | NA          | Required               |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | TDATA: The primary payload that is used to provide the data that is passing across the interface. The width         |
-- | of the data payload is an integer number of bytes.                                                                  |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | m_axis_tdest   | Output    | TDEST_WIDTH                           | m_aclk  | NA          | Required               |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | TDEST: Provides routing information for the data stream.                                                            |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | m_axis_tid     | Output    | TID_WIDTH                             | m_aclk  | NA          | Required               |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | TID: The data stream identifier that indicates different streams of data.                                           |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | m_axis_tkeep   | Output    | TDATA_WIDTH                           | m_aclk  | NA          | Required               |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | TKEEP: The byte qualifier that indicates whether the content of the associated byte of TDATA is processed           |
-- | as part of the data stream. Associated bytes that have the TKEEP byte qualifier deasserted are null bytes           |
-- | and can be removed from the data stream. For a 64-bit DATA, bit 0 corresponds to the least significant byte         |
-- | on DATA, and bit 7 corresponds to the most significant byte. For example:                                           |
-- |                                                                                                                     |
-- |   KEEP[0] = 1b, DATA[7:0] is not a NULL byte                                                                        |
-- |   KEEP[7] = 0b, DATA[63:56] is a NULL byte                                                                          |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | m_axis_tlast   | Output    | 1                                     | m_aclk  | Active-high | Required               |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | TLAST: Indicates the boundary of a packet.                                                                          |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | m_axis_tready  | Input     | 1                                     | m_aclk  | Active-high | Required               |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | TREADY: Indicates that the slave can accept a transfer in the current cycle.                                        |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | m_axis_tstrb   | Output    | TDATA_WIDTH                           | m_aclk  | NA          | Required               |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | TSTRB: The byte qualifier that indicates whether the content of the associated byte of TDATA is processed           |
-- | as a data byte or a position byte. For a 64-bit DATA, bit 0 corresponds to the least significant byte on            |
-- | DATA, and bit 0 corresponds to the least significant byte on DATA, and bit 7 corresponds to the most significant    |
-- | byte. For example:                                                                                                  |
-- |                                                                                                                     |
-- |   STROBE[0] = 1b, DATA[7:0] is valid                                                                                |
-- |   STROBE[7] = 0b, DATA[63:56] is not valid                                                                          |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | m_axis_tuser   | Output    | TUSER_WIDTH                           | m_aclk  | NA          | Required               |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | TUSER: The user-defined sideband information that can be transmitted alongside the data stream.                     |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | m_axis_tvalid  | Output    | 1                                     | m_aclk  | Active-high | Required               |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | TVALID: Indicates that the master is driving a valid transfer.                                                      |
-- |                                                                                                                     |
-- |   A transfer takes place when both TVALID and TREADY are asserted                                                   |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | prog_empty_axis| Output    | 1                                     | m_aclk  | Active-high | DoNotCare              |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Programmable Empty- This signal is asserted when the number of words in the FIFO is less than or equal              |
-- | to the programmable empty threshold value.                                                                          |
-- | It is de-asserted when the number of words in the FIFO exceeds the programmable empty threshold value.              |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | prog_full_axis | Output    | 1                                     | s_aclk  | Active-high | DoNotCare              |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Programmable Full: This signal is asserted when the number of words in the FIFO is greater than or equal            |
-- | to the programmable full threshold value.                                                                           |
-- | It is de-asserted when the number of words in the FIFO is less than the programmable full threshold value.          |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | rd_data_count_axis| Output    | RD_DATA_COUNT_WIDTH                   | m_aclk  | NA          | DoNotCare              |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Read Data Count- This bus indicates the number of words available for reading in the FIFO.                          |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | s_aclk         | Input     | 1                                     | NA      | Rising edge | Required               |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Slave Interface Clock: All signals on slave interface are sampled on the rising edge of this clock.                 |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | s_aresetn      | Input     | 1                                     | NA      | Active-low  | Required               |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Active low asynchronous reset.                                                                                      |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | s_axis_tdata   | Input     | TDATA_WIDTH                           | s_aclk  | NA          | Required               |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | TDATA: The primary payload that is used to provide the data that is passing across the interface. The width         |
-- | of the data payload is an integer number of bytes.                                                                  |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | s_axis_tdest   | Input     | TDEST_WIDTH                           | s_aclk  | NA          | Required               |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | TDEST: Provides routing information for the data stream.                                                            |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | s_axis_tid     | Input     | TID_WIDTH                             | s_aclk  | NA          | Required               |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | TID: The data stream identifier that indicates different streams of data.                                           |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | s_axis_tkeep   | Input     | TDATA_WIDTH                           | s_aclk  | NA          | Required               |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | TKEEP: The byte qualifier that indicates whether the content of the associated byte of TDATA is processed           |
-- | as part of the data stream. Associated bytes that have the TKEEP byte qualifier deasserted are null bytes           |
-- | and can be removed from the data stream. For a 64-bit DATA, bit 0 corresponds to the least significant byte         |
-- | on DATA, and bit 7 corresponds to the most significant byte. For example:                                           |
-- |                                                                                                                     |
-- |   KEEP[0] = 1b, DATA[7:0] is not a NULL byte                                                                        |
-- |   KEEP[7] = 0b, DATA[63:56] is a NULL byte                                                                          |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | s_axis_tlast   | Input     | 1                                     | s_aclk  | Active-high | Required               |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | TLAST: Indicates the boundary of a packet.                                                                          |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | s_axis_tready  | Output    | 1                                     | s_aclk  | Active-high | Required               |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | TREADY: Indicates that the slave can accept a transfer in the current cycle.                                        |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | s_axis_tstrb   | Input     | TDATA_WIDTH                           | s_aclk  | NA          | Required               |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | TSTRB: The byte qualifier that indicates whether the content of the associated byte of TDATA is processed           |
-- | as a data byte or a position byte. For a 64-bit DATA, bit 0 corresponds to the least significant byte on            |
-- | DATA, and bit 0 corresponds to the least significant byte on DATA, and bit 7 corresponds to the most significant    |
-- | byte. For example:                                                                                                  |
-- |                                                                                                                     |
-- |   STROBE[0] = 1b, DATA[7:0] is valid                                                                                |
-- |   STROBE[7] = 0b, DATA[63:56] is not valid                                                                          |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | s_axis_tuser   | Input     | TUSER_WIDTH                           | s_aclk  | NA          | Required               |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | TUSER: The user-defined sideband information that can be transmitted alongside the data stream.                     |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | s_axis_tvalid  | Input     | 1                                     | s_aclk  | Active-high | Required               |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | TVALID: Indicates that the master is driving a valid transfer.                                                      |
-- |                                                                                                                     |
-- |   A transfer takes place when both TVALID and TREADY are asserted                                                   |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | sbiterr_axis   | Output    | 1                                     | m_aclk  | Active-high | DoNotCare              |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Single Bit Error- Indicates that the ECC decoder detected and fixed a single-bit error.                             |
-- +---------------------------------------------------------------------------------------------------------------------+
-- | wr_data_count_axis| Output    | WR_DATA_COUNT_WIDTH                   | s_aclk  | NA          | DoNotCare              |
-- |---------------------------------------------------------------------------------------------------------------------|
-- | Write Data Count: This bus indicates the number of words written into the FIFO.                                     |
-- +---------------------------------------------------------------------------------------------------------------------+

