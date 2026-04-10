----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.05.2020 17:03:22
-- Design Name: 
-- Module Name: AXI_MM2S_RD - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- LIBRARY UNISIM;
-- USE UNISIM.VCOMPONENTS.ALL;

entity AXI_MM2S is
	generic(
		C_TRANSFER_WSIZE_WIDTH : integer := 12;
		C_M_AXI_ID_WIDTH       : integer := 1;
		C_M_AXI_ADDR_WIDTH     : integer := 32;
		C_M_AXI_DATA_WIDTH     : integer := 32;
		C_M_AXI_ARUSER_WIDTH   : integer := 0;
		C_M_AXI_RUSER_WIDTH    : integer := 0;
		C_M_AXI_BURST_LEN      : integer := 16;
		C_S_AXIS_TDATA_WIDTH   : integer := 32;
		C_S_AXIS_TUSER_WIDTH   : integer := 0
	);
	Port(
		-- common
		clk           : in  std_logic;
		reset         : in  std_logic;
		-- USER
		address       : in  std_logic_vector(C_M_AXI_ADDR_WIDTH - 1 downto 0);
		size_words    : in  std_logic_vector(C_TRANSFER_WSIZE_WIDTH - 1 downto 0);
		run           : in  std_logic;
		run_ack       : out std_logic;
		busy          : out std_logic;
		status        : out std_logic_vector(1 downto 0);
		done          : out std_logic;
		error         : out std_logic;
		-- AXI 
		m_axi_arid    : out std_logic_vector(C_M_AXI_ID_WIDTH - 1 downto 0);
		m_axi_araddr  : out std_logic_vector(C_M_AXI_ADDR_WIDTH - 1 downto 0);
		m_axi_arlen   : out std_logic_vector(7 downto 0);
		m_axi_arsize  : out std_logic_vector(2 downto 0);
		m_axi_arburst : out std_logic_vector(1 downto 0);
		m_axi_arlock  : out std_logic;
		m_axi_arcache : out std_logic_vector(3 downto 0);
		m_axi_arprot  : out std_logic_vector(2 downto 0);
		m_axi_arqos   : out std_logic_vector(3 downto 0);
		m_axi_aruser  : out std_logic_vector(C_M_AXI_ARUSER_WIDTH - 1 downto 0);
		m_axi_arvalid : out std_logic;
		m_axi_arready : in  std_logic;
		m_axi_rid     : in  std_logic_vector(C_M_AXI_ID_WIDTH - 1 downto 0);
		m_axi_rdata   : in  std_logic_vector(C_M_AXI_DATA_WIDTH - 1 downto 0);
		m_axi_rresp   : in  std_logic_vector(1 downto 0);
		m_axi_rlast   : in  std_logic;
		m_axi_ruser   : in  std_logic_vector(C_M_AXI_RUSER_WIDTH - 1 downto 0);
		m_axi_rvalid  : in  std_logic;
		m_axi_rready  : out std_logic;
		-- AXIS
		m_axis_tvalid : out std_logic;
		m_axis_tready : in  std_logic;
		m_axis_tdata  : out std_logic_vector(C_S_AXIS_TDATA_WIDTH - 1 downto 0);
		m_axis_tlast  : out std_logic;
		m_axis_tuser  : out std_logic_vector(C_S_AXIS_TUSER_WIDTH - 1 downto 0)
	);
end AXI_MM2S;

architecture Behavioral of AXI_MM2S is

	function clogb2(bit_depth : integer) return integer is
		variable depth : integer := bit_depth;
		variable count : integer := 1;
	begin
		for clogb2 in 1 to bit_depth loop -- Works for up to 32 bit integers
			if (bit_depth <= 2) then
				count := 1;
			else
				if (depth <= 1) then
					count := count;
				else
					depth := depth / 2;
					count := count + 1;
				end if;
			end if;
		end loop;
		return (count);
	end;

	type t_burst_lengths is array (0 to 8) of integer;
	constant C_BURST_LENGTHS : t_burst_lengths := (1, 2, 4, 8, 16, 32, 64, 128, 256);

	-- sequencer fsm acessing the FIFO
	type fsm_t is (SIdle, SAddress, SRead, SDone, SError);
	signal state : fsm_t;

	constant C_M_AXI_BURST_LEN_L2 : integer := clogb2(C_M_AXI_BURST_LEN);

	signal is_last : boolean;

begin

	-- axim is connected directly to FIFO
	m_axi_rready  <= m_axis_tready when state = SRead else '0';
	m_axis_tvalid <= m_axi_rvalid when state = SRead else '0';
	m_axis_tdata  <= m_axi_rdata;
	m_axis_tuser  <= m_axi_ruser;
	m_axis_tlast  <= m_axi_rlast when is_last else '0';

	m_axi_arid    <= (others => '0');
	m_axi_arsize  <= std_logic_vector(to_unsigned(clogb2((C_M_AXI_DATA_WIDTH / 8) - 1), 3));
	m_axi_arlock  <= '0';
	m_axi_arcache <= "0010";
	m_axi_arprot  <= "000";
	m_axi_arqos   <= (others => '0');
	m_axi_aruser  <= (others => '1');

	process(clk)
		variable i_burst_cnt      : unsigned(m_axi_arlen'range);
		variable i_transfer_cnt   : unsigned(size_words'range);
		variable i_address_cnt    : unsigned(m_axi_araddr'range);
		variable i_selected_burst : unsigned(m_axi_arlen'range);
	begin
		if rising_edge(clk) then
			if reset = '1' then
				state            <= SIdle;
				done             <= '0';
				status           <= (others => '0');
				m_axi_arvalid    <= '0';
				m_axi_arburst    <= "00";
				m_axi_arlen      <= (others => '0');
				i_burst_cnt      := (others => '0');
				i_transfer_cnt   := (others => '0');
				i_address_cnt    := (others => '0');
				i_selected_burst := (others => '0');
				m_axi_araddr     <= (others => '0');
				run_ack          <= '0';
				is_last          <= false;
				busy             <= '0';
				error            <= '0';
			else
				m_axi_arvalid <= '0';
				done          <= '0';
				error         <= '0';
				case state is
					when SIdle =>
						run_ack          <= '0';
						i_burst_cnt      := (others => '0');
						i_transfer_cnt   := (others => '0');
						i_address_cnt    := (others => '0');
						i_selected_burst := (others => '0');
						is_last          <= false;
						if run = '1' then
							busy           <= '1';
							state          <= SAddress;
							i_transfer_cnt := unsigned(size_words);
							i_address_cnt  := unsigned(address);
							run_ack        <= '1';
							status         <= (others => '0');
						end if;
					when SAddress =>
						-- select burst length
						m_axi_arburst <= "01";
						if i_transfer_cnt > 1 then
							if i_transfer_cnt >= C_M_AXI_BURST_LEN then
								i_selected_burst := to_unsigned(C_M_AXI_BURST_LEN, i_selected_burst'length);
							else
								for i in 1 to C_M_AXI_BURST_LEN_L2 - 2 loop
									if i_transfer_cnt(i) = '1' then
										i_selected_burst := to_unsigned(C_BURST_LENGTHS(i), i_selected_burst'length);
									end if;
								end loop;
							end if;
						else
							i_selected_burst := to_unsigned(1, i_selected_burst'length);
						end if;

						m_axi_arlen   <= std_logic_vector(i_selected_burst - 1);
						m_axi_arvalid <= '1';
						if m_axi_arready = '1' then
							-- ack address
							i_burst_cnt := i_selected_burst;
							state       <= SRead;
						end if;
						if i_transfer_cnt = i_selected_burst then
							is_last <= true;
						end if;
					when SRead =>
						if m_axi_rvalid = '1' and m_axis_tready = '1' then
							-- valid transaction
							i_burst_cnt    := i_burst_cnt - 1;
							i_transfer_cnt := i_transfer_cnt - 1;
							if i_burst_cnt = 0 or m_axi_rlast = '1' then
								status <= m_axi_rresp;
								-- capture m_axi_rresp and go to update
								if m_axi_rresp /= "00" then
									state <= SError;
								else
									if i_transfer_cnt = 0 then
										state <= SDone;
									else
										i_address_cnt := i_address_cnt + i_selected_burst * (C_M_AXI_DATA_WIDTH / 8);
										state         <= SAddress;
									end if;
								end if;
							end if;
						end if;
					when SDone =>
						busy <= '0';
						done <= '1';
						if run = '0' then
							state <= SIdle;
						end if;
					when SError =>
						busy  <= '0';
						done  <= '1';
						error <= '1';
				end case;
				m_axi_araddr <= std_logic_vector(i_address_cnt);
			end if;
		end if;
	end process;

end Behavioral;
