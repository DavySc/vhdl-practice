library ieee;
use ieee.std_logic_1164.all;

entity mux16_tb is
    end mux16_tb;

architecture rtl of mux16_tb is
	signal	A,B :  std_logic_vector(15 downto 0);
	signal	S   :  std_logic;
	signal	O   :  std_logic_vector(15 downto 0);

    component mux16
	port(
		A,B : in std_logic_vector(15 downto 0);
		S   : in std_logic;
		O   : out std_logic_vector(15 downto 0)
	    );
	end component;

begin
    uut : mux16 port map(A=>A, B=>B, S=>S, O=>O);

	stim_proc : process
	begin

        A <= (others => '0');
        B <= (others => '0');
	S <= '1';
	wait for 10 ns;
        B <= (others => '1');
        wait for 10 ns;
	S <= '0';
        A <= (others => '1');
        wait for 10 ns;
        B(0) <= '0';
        wait for 10 ns;
        B(0) <= '1';
        B(1) <= '0';
	S <= '1';
        wait for 10 ns;
        B(1) <= '1';
        B(15) <= '0';
        wait for 10 ns;
        A(0) <= '0';
        wait;
	end process;
end rtl;
