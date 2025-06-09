library ieee;
use ieee.std_logic_1164.all;

entity or4 is
    port(
	    E,F,G,H : in std_logic;
        Y       : out std_logic
	);
end or4;

architecture struct of or4 is
    signal temp1, temp2 : std_logic;

    component or2
	port (
		A,B : in std_logic;
		O   : out std_logic
	    ); 
    end component;

begin
    U1 : or2 port map(E, F, temp1);
    U2 : or2 port map(G, H, temp2);
    U3 : or2 port map(temp1, temp2, Y);
end struct;
    
