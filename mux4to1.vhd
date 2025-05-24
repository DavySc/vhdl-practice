library ieee;
use ieee.std_logic_1164.all;

entity mux4to1 is
    port(
        input_0    : in std_logic;
        input_1    : in std_logic;
        input_2    : in std_logic;
        input_3    : in std_logic;
        sel        : in std_logic_vector( 1 downto 0);
        mux_result : out std_logic
    );
end entity mux4to1;

architecture rtl of mux4to1 is
  begin
           p_mux : process(all) is
            begin case sel is
              when "00" =>
                mux_result <= input_0; 
              when "01"  => 
                mux_result <= input_1;
              when "10" =>  
                mux_result <= input_2;
              when others =>  
                mux_result <= input_3;
            end case;
        end process p_mux;
  end architecture rtl;

