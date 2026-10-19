--------------------------------------------------------------------------------
-- Projekt:   DP - Implementace vybraných algoritmů zpracování obrazu v hradlovém poli
-- Autor:     Bc. Karel Najman (TUL), vedoucí Ing. Martin Rozkovec, Ph.D.
-- Soubor:    threshold_core.vhd
-- Popis:     Prahování jasu (5 typů jako OpenCV cv::threshold), bodové jádro AXI4-Stream Video 8 b
--
-- Výsledek bitově shodný s imgproc_threshold() golden modelu:
--   typ 0 BINARY      above ? maxval : 0        typ 3 TOZERO      above ? value : 0
--   typ 1 BINARY_INV  above ? 0 : maxval        typ 4 TOZERO_INV  above ? 0 : value
--   typ 2 TRUNC       above ? thresh : value    above = value > thresh; neplatný typ 5..7 -> 0
--
-- Poznámky k návrhu:
--  * Typ se nedekóduje v pipeline: z registru type se mimo pipeline (mění se jen zápisem z ARM)
--    předpočítá, ODKUD vzít výsledek nad prahem a pod prahem (nula / maxval / thresh / value).
--    Datová cesta je pak jen porovnání a multiplexor 4:1 - bez větvení podle typu.
--  * Pipeline: takt 1 vstupní registr, takt 2 porovnání value > thresh (8b komparátor = CARRY8)
--    se zaregistrovaným výsledkem, takt 3 výběr zdroje. Každá operace za registrem.
--  * Řízení toku jako ostatní bodová jádra: globální pipe_enable z výstupního skid bufferu.
--  * run = 0 drží TREADY = 0 (obsluhuje obálka, jádro samo běží nepřetržitě).
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;

entity threshold_core is
    port (
        aclk          : in  std_logic;
        aresetn       : in  std_logic;
        thresh        : in  t_pix;
        maxval        : in  t_pix;
        thresh_type   : in  unsigned(C_THRESH_TYPE_W - 1 downto 0);
        -- AXI4-Stream Video vstup / výstup (8 b)
        s_axis_tdata  : in  std_logic_vector(C_PIX_W - 1 downto 0);
        s_axis_tuser  : in  std_logic;
        s_axis_tlast  : in  std_logic;
        s_axis_tvalid : in  std_logic;
        s_axis_tready : out std_logic;
        m_axis_tdata  : out std_logic_vector(C_PIX_W - 1 downto 0);
        m_axis_tuser  : out std_logic;
        m_axis_tlast  : out std_logic;
        m_axis_tvalid : out std_logic;
        m_axis_tready : in  std_logic
    );
end entity;

architecture rtl of threshold_core is
    -- zdroj výsledku (předpočítaný z typu)
    type t_result_source is (SOURCE_ZERO, SOURCE_MAXVAL, SOURCE_THRESH, SOURCE_VALUE);
    constant C_PIPE_DEPTH : natural := 3;

    signal source_above   : t_result_source := SOURCE_ZERO;
    signal source_below   : t_result_source := SOURCE_ZERO;

    signal pipe_enable    : std_logic;
    signal in_value       : t_pix := (others => '0');       -- takt 1
    signal compare_value  : t_pix := (others => '0');       -- takt 2 (hodnota zpožděná k výsledku porovnání)
    signal is_above       : std_logic := '0';               -- takt 2
    signal out_value      : t_pix := (others => '0');       -- takt 3

    signal valid_pipe : std_logic_vector(1 to C_PIPE_DEPTH) := (others => '0');
    signal sof_pipe   : std_logic_vector(1 to C_PIPE_DEPTH) := (others => '0');
    signal eol_pipe   : std_logic_vector(1 to C_PIPE_DEPTH) := (others => '0');

    signal skid_in_data, skid_out_data : std_logic_vector(C_PIX_W + 1 downto 0);

    function select_source(source : t_result_source; value, thresh_value, max_value : t_pix) return t_pix is
    begin
        case source is
            when SOURCE_MAXVAL => return max_value;
            when SOURCE_THRESH => return thresh_value;
            when SOURCE_VALUE  => return value;
            when others        => return (others => '0');
        end case;
    end function;
begin

    s_axis_tready <= pipe_enable;

    process (aclk)
    begin
        if rising_edge(aclk) then
            -- dekódování typu mimo pipeline (registr se mění jen zápisem z ARM)
            case to_integer(thresh_type) is
                when C_THRESH_BINARY     => source_above <= SOURCE_MAXVAL; source_below <= SOURCE_ZERO;
                when C_THRESH_BINARY_INV => source_above <= SOURCE_ZERO;   source_below <= SOURCE_MAXVAL;
                when C_THRESH_TRUNC      => source_above <= SOURCE_THRESH; source_below <= SOURCE_VALUE;
                when C_THRESH_TOZERO     => source_above <= SOURCE_VALUE;  source_below <= SOURCE_ZERO;
                when C_THRESH_TOZERO_INV => source_above <= SOURCE_ZERO;   source_below <= SOURCE_VALUE;
                when others              => source_above <= SOURCE_ZERO;   source_below <= SOURCE_ZERO;
            end case;

            if pipe_enable = '1' then
                in_value      <= unsigned(s_axis_tdata);                                -- takt 1
                is_above      <= to_sl(in_value > thresh);                              -- takt 2
                compare_value <= in_value;                                              -- takt 2
                if is_above = '1' then                                                  -- takt 3
                    out_value <= select_source(source_above, compare_value, thresh, maxval);
                else
                    out_value <= select_source(source_below, compare_value, thresh, maxval);
                end if;
                sof_pipe <= s_axis_tuser & sof_pipe(1 to C_PIPE_DEPTH - 1);
                eol_pipe <= s_axis_tlast & eol_pipe(1 to C_PIPE_DEPTH - 1);
            end if;

            if aresetn = '0' then
                valid_pipe <= (others => '0');
            elsif pipe_enable = '1' then
                valid_pipe <= s_axis_tvalid & valid_pipe(1 to C_PIPE_DEPTH - 1);
            end if;
        end if;
    end process;

    -- Výstupní skid buffer (registrovaný ready -> pipe_enable)
    skid_in_data <= eol_pipe(C_PIPE_DEPTH) & sof_pipe(C_PIPE_DEPTH) & std_logic_vector(out_value);
    skid : entity work.axis_skid_buffer
        generic map (G_DATA_W => C_PIX_W + 2)
        port map (aclk => aclk, aresetn => aresetn, s_data => skid_in_data, s_valid => valid_pipe(C_PIPE_DEPTH),
                  s_ready => pipe_enable, m_data => skid_out_data, m_valid => m_axis_tvalid, m_ready => m_axis_tready);

    m_axis_tdata <= skid_out_data(C_PIX_W - 1 downto 0);
    m_axis_tuser <= skid_out_data(C_PIX_W);
    m_axis_tlast <= skid_out_data(C_PIX_W + 1);

end architecture;
