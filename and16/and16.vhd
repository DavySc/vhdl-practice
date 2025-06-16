library ieee;
use ieee.std_logic_1164.all;

entity and16 is
    port(
	    A : in std_logic_vector(15 downto 0);
	    B : in std_logic_vector(15 downto 0);
	    O : out std_logic_vector(15 downto 0)
        ); end and16;

architecture rtl of and16 is
begin
    O <= A and B;
end rtl;
