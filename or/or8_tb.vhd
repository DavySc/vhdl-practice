library ieee;
use ieee.std_logic_1164.all;

library ieee;
use ieee.std_logic_1164.all;

entity or8_tb is
end or8_tb;

architecture behavior of or8_tb is

    -- Signals to connect to the or8 DUT (device under test)
    signal J, K, L, M, N, P, Q, R : std_logic := '0';
    signal Z : std_logic;

    -- Component declaration for the DUT
    component or8
        port(
            J, K, L, M, N, P, Q, R : in std_logic;
            Z : out std_logic
        );
    end component;

begin

    -- Instantiate the DUT
    uut: or8
        port map (
            J => J, K => K, L => L, M => M,
            N => N, P => P, Q => Q, R => R,
            Z => Z
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- All inputs 0 → Z should be 0
        J <= '0'; K <= '0'; L <= '0'; M <= '0';
        N <= '0'; P <= '0'; Q <= '0'; R <= '0';
        wait for 10 ns;

        -- One input high → Z should be 1
        J <= '1';
        wait for 10 ns;

        -- Reset, try another input
        J <= '0'; K <= '1';
        wait for 10 ns;

        -- Multiple inputs high
        K <= '1'; L <= '1'; M <= '1';
        wait for 10 ns;

        -- All inputs high
        J <= '1'; K <= '1'; L <= '1'; M <= '1';
        N <= '1'; P <= '1'; Q <= '1'; R <= '1';
        wait for 10 ns;

        -- Back to all 0
        J <= '0'; K <= '0'; L <= '0'; M <= '0';
        N <= '0'; P <= '0'; Q <= '0'; R <= '0';
        wait for 10 ns;

        wait; -- end of simulation
    end process;

end behavior;

