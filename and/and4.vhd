library ieee;
use ieee.std_logic_1164.all;

entity and4 is
	port(
	        A, B, C, D : in std_logic;
	        Y : out std_logic
	    );
end and4;


architecture struct of and4 is
	signal temp1, temp2 : std_logic;

	component and2
		port(
		        E, F : in std_logic;
		        O    : out std_logic
		    );
	end component;
begin
	U1 : and2 port map(A, B, temp1);
	U2 : and2 port map(C, D, temp2);
	U3 : and2 port map(temp1, temp2, Y);
end struct;
