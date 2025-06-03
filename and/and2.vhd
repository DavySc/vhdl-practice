library ieee;
use ieee.std_logic_1164.all;

entity and2 is
	port(
            E : in std_logic;
	        F : in std_logic;
	        O : out std_logic
	    );
end and2;

architecture behavioural of and2 is
begin
	O <= E and F;
end behavioural;
