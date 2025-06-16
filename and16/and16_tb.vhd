library ieee;
use ieee.std_logic_1164.all;

entity and16_tb is
    end and16_tb;


architecture rtl of and16_tb is
    signal A, B : std_logic_vector(15 downto 0);
    signal O    : std_logic_vector(15 downto 0);
    component and16 is
	port(
		A, B : in std_logic_vector(15 downto 0);
		O    : out std_logic_vector(15 downto 0)
	    );
    end component;
begin
    uut : and16 port map(A => A, B => B, O => O);

    stim_proc : process
    begin
        A <= (others => '0');
        B <= (others => '0');
	wait for 10 ns;
        B <= (others => '1');
        wait for 10 ns;
        A <= (others => '1');
        wait for 10 ns;
        B(0) <= '0';
        wait for 10 ns;
        B(0) <= '1';
        B(1) <= '0';
        wait for 10 ns;
        B(1) <= '1';
        B(15) <= '0';
        wait for 10 ns;
        A(0) <= '0';
        wait;
    end process;
end rtl;

