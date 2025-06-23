library ieee;
use ieee.std_logic_1164.all;

entity mux16 is
    port(
	    A, B : in std_logic_vector(15 downto 0);
	    S    : in std_logic;
	    O    : out std_logic_vector(15 downto 0)
	);
end mux16;

architecture rtl of mux16 is
begin
    O <= A when S = '0' else B;
end rtl;
