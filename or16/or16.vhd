library ieee;
use ieee.std_logic_1164.all;

entity or16 is
    port(
	    A, B : in std_logic_vector(15 downto 0);
	    O    : out std_logic_vector(15 downto 0)
	);
end or16;


architecture rtl of or16 is
begin
    O <= A or B;
end rtl;

