library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity video_gen is
    generic(
        C_MAX_LINE_WIDTH  : integer := 4096;
        C_MAX_LINE_BWIDTH : integer := integer(ceil(log2(real(C_MAX_LINE_WIDTH + 1))))
    );
    port(
        clk              : in  std_logic;
        rst              : in  std_logic;
        -- video counts
        video_h_active   : in  unsigned(C_MAX_LINE_BWIDTH - 1 downto 0);
        video_h_fporch   : in  unsigned(C_MAX_LINE_BWIDTH - 1 downto 0);
        video_h_sync     : in  unsigned(C_MAX_LINE_BWIDTH - 1 downto 0);
        video_h_bporch   : in  unsigned(C_MAX_LINE_BWIDTH - 1 downto 0);
        video_h_sync_pol : in  std_logic;
        video_v_active   : in  unsigned(C_MAX_LINE_BWIDTH - 1 downto 0);
        video_v_fporch   : in  unsigned(C_MAX_LINE_BWIDTH - 1 downto 0);
        video_v_sync     : in  unsigned(C_MAX_LINE_BWIDTH - 1 downto 0);
        video_v_bporch   : in  unsigned(C_MAX_LINE_BWIDTH - 1 downto 0);
        video_v_sync_pol : in  std_logic;
        -- video
        video_hsync      : out std_logic;
        video_vsync      : out std_logic;
        video_active     : out std_logic;
        video_active_end : out std_logic;
        video_frame_end  : out std_logic
    );
end entity video_gen;

architecture RTL of video_gen is

    signal hcount, vcount : unsigned(C_MAX_LINE_BWIDTH - 1 downto 0);

begin

    vga : process(clk) is
    begin
        if rising_edge(clk) then
            video_frame_end <= '0';
            if rst = '1' then
                hcount <= (others => '0');
                vcount <= (others => '0');
            else
                hcount <= hcount + 1;
                if hcount >= video_h_bporch then
                    hcount <= (others => '0');
                    vcount <= vcount + 1;
                    if vcount >= video_v_bporch then
                        video_frame_end <= '1';
                        vcount          <= (others => '0');
                    end if;
                end if;
            end if;
        end if;
    end process vga;

    syncs : process(clk) is
    begin
        if rising_edge(clk) then
            if rst = '1' then
                video_active <= '0';
                video_hsync  <= not video_h_sync_pol;
                video_vsync  <= not video_v_sync_pol;
                video_active <= '0';
            else
                if hcount <= video_h_active and vcount <= video_v_active then
                    video_active <= '1';
                else
                    video_active <= '0';
                end if;
                if hcount = unsigned(video_h_active) and vcount = unsigned(video_v_active) then
                    video_active_end <= '1';
                else
                    video_active_end <= '0';
                end if;
                if hcount >= video_h_fporch and hcount < video_h_sync then
                    video_hsync <= video_h_sync_pol;
                else
                    video_hsync <= not video_h_sync_pol;
                end if;
                if vcount >= video_v_fporch and vcount < video_v_sync then
                    video_vsync <= video_v_sync_pol;
                else
                    video_vsync <= not video_v_sync_pol;
                end if;
            end if;
        end if;
    end process syncs;

end architecture RTL;
