library ieee;
use ieee.std_logic_1164.all;

entity or8 is
    port(
	    J,K,L,M,N,P,Q,R : in std_logic;
            Z       	    : out std_logic
	);
end or8;

architecture struct of or8 is
    signal temp1, temp2 : std_logic;

    component or2
	port (
		A,B : in std_logic;
		O   : out std_logic
	    ); 
    end component;

    component or4
        port(
	        E,F,G,H : in std_logic;
		 Y       : out std_logic
	    );
    end component;

begin
    U1 : or4 port map(J, K, L, M, temp1);
    U2 : or4 port map(N, P, Q, R, temp2);
    U3 : or2 port map(temp1, temp2, Z);
end struct;
    
