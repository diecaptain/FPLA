library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
entity km_inv is 
  port ( I : in std_logic;
         O : out std_logic);
       end km_inv;
architecture behav of km_inv is
  begin
    process (I)
      begin
        O <= not I;
      end process;
    end behav;
