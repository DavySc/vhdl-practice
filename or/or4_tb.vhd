library ieee;
use ieee.std_logic_1164.all;

entity or4_tb is
    end or4_tb;

architecture behavioural of or4_tb is
    signal E,F,G,H : std_logic := '0';
    signal Y       : std_logic;

    component or4
	port(
		E,F,G,H : in std_logic;
	    Y       : out std_logic
	    );
    end component;
    
begin
    uut : or4 port map( E => E, F => F , G => G, H => H, Y => Y);
    
    stimulus : process
    begin
	wait for 10 ns;
	E <= '1';
	wait for 10 ns;
	F <= '1'; G <= '1';
	wait for 10 ns;
	H <= '1';
	wait for 10 ns;
	E <= '0'; F <= '0'; G <= '0';
	wait for 10 ns;
	H <= '0';
	wait for 10 ns;
	wait;
    end process;
end behavioural;


