library ieee;
use ieee.std_logic_1164.all;

entity mux2to1_struct is
    port(
        input_1  : in std_logic;
        input_2  : in std_logic;
        sel      : in std_logic;
        mux_result : out std_logic
); 
end entity;

architecture rtl of mux2to1_struct is
begin
    mux_result <= (not sel and input_1) or (sel and input_2); 
end architecture rtl;