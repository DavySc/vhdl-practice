library ieee;
use ieee.std_logic_1164.all;

entity mux2to1 is
port(
    input_1    : in std_logic;
    input_2    : in std_logic;
    sel        : in std_logic;
    mux_result : out std_logic
);
end;

architecture rtl of mux2to1 is
begin
  process(all) is
    begin
      if sel = '0' then 
         mux_result <= input_2;
      else 
          mux_result <= input_1;
     end if;
  end process;
end rtl;

-- Testbench for 2-to-1 Mux (process-based)
library ieee;
use ieee.std_logic_1164.all;

entity tb_mux2to1 is
end entity;

architecture behavior of tb_mux2to1 is

    -- DUT component declaration
    component mux2to1
        port (
            input_1    : in  std_logic;
            input_2    : in  std_logic;
            sel        : in  std_logic;
            mux_result : out std_logic
        );
    end component;

    -- Signals to connect to DUT
    signal input_1, input_2, sel, mux_result : std_logic;

begin

    -- Instantiate DUT
    uut: mux2to1
        port map (
            input_1    => input_1,
            input_2    => input_2,
            sel        => sel,
            mux_result => mux_result
        );

    -- Stimulus process (You must fill this in)
    stim_proc: process
begin
    -- Step 1: Initialize inputs
    input_1 <= '0';
    input_2 <= '1';
    sel     <= '0';
    wait for 10 ns;
    assert mux_result = input_2;

    -- Step 2: Change select line
    sel <= '1';
    wait for 10 ns;
    assert mux_result = input_1;

    -- Step 3: Change data inputs
    input_1 <= '1';
    input_2 <= '0';
    sel     <= '0';
    wait for 10 ns;
    assert mux_result = '0'

    wait;
    end process;

end architecture;

