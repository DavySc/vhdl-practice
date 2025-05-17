library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led_blinker is
port(
    i_clock : in std_logic;
    i_enable : in std_logic;
    i_switch1 : in std_logic;
    i_switch2 : in std_logic;
    o_led_drive : out std_logic
    );
 end led_blinker;

architecture rtl of led_blinker is
    constant c_CNT_100_hz : natural := 125000;
    constant c_CNT_50_hz : natural := 250000;
    constant c_CNT_10_hz : natural := 1250000;
    constant c_CNT_1_hz : natural := 12500000;

    signal counter_100_hz : natural range 0 to c_CNT_100hz;
    signal counter_50_hz : natural range 0 to c_CNT_50hz;
    signal counter_10_hz : natural range 0 to c_CNT_10hz;
    signal counter_1_hz : natural range 0 to c_CNT_1hz;

    signal toggle_100_hz : std_logic := 0;
    signal toggle_50_hz : std_logic := 0;
    signal toggle_10_hz : std_logic := 0;
    signal toggle_1_hz : std_logic := 0;

    signal selection : std_logic := 0;
begin

    p_100hz : process (i_clock) is
    begin if rising_edge(i_clock) then
      if counter_100_hz = c_CNT_100_hz - 1 then
         toggle_100_hz <= not toggle_100_hz;
         counter_100_hz <= 0;
      else
        counter_100_hz <= counter_100_hz + 1;
      end if;
    end if;
    end process p_100hz;

    p_50hz : process (i_clock) is
    begin if rising_edge(i_clock) then
      if counter_50_hz = c_CNT_50_hz - 1 then
         toggle_50_hz <= not toggle_50_hz;
         counter_50_hz <= 0;
      else
        counter_50_hz <= counter_50_hz + 1;
      end if;
    end if;
    end process p_50hz;

    p_10hz : process (i_clock) is
    begin if rising_edge(i_clock) then
      if counter_10_hz = c_CNT_10_hz - 1 then
         toggle_10_hz <= not toggle_10_hz;
         counter_10_hz <= 0;
      else
        counter_10_hz <= counter_10_hz + 1;
      end if;
    end if;
    end process p_10hz;
    
    p_1hz : process (i_clock) is
    begin if rising_edge(i_clock) then
      if counter_1_hz = c_CNT_1_hz - 1 then
         toggle_1_hz <= not toggle_1_hz;
         counter_1_hz <= 0;
      else
        counter_1_hz <= counter_1_hz + 1;
      end if;
    end if;
    end process p_1hz;

selection <= toggle_100_hz when (i_switch1 = 0 and i_switch2 = 0) else
             toggle_50_hz when  (i_switch1 = 0 and i_switch2 = 1) else
             toggle_10_hz when  (i_switch1 = 1 and i_switch2 = 0) else
             toggle_1_hz;     

o_led_drive <= i_enable and selection;
end rtl;