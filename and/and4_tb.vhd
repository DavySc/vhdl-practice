library ieee;
use ieee.std_logic_1164.all;

entity and4_tb is
end and4_tb;

architecture behavior of and4_tb is
    signal A, B, C, D : std_logic := '0';
    signal Y          : std_logic;

    component and4
        port (
            A, B, C, D : in std_logic;
            Y          : out std_logic
        );
    end component;

begin
    uut: and4 port map(A => A, B => B, C => C, D => D, Y => Y);

    stimulus: process
    begin
        -- Test all 0s
        A <= '0'; B <= '0'; C <= '0'; D <= '0'; wait for 10 ns;
        -- One 1
        A <= '1'; wait for 10 ns;
        -- Half 1s
        B <= '1'; C <= '1'; wait for 10 ns;
        -- All 1s
        D <= '1'; wait for 10 ns;

        -- Finish simulation
        wait;
    end process;
end behavior;
