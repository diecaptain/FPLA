library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
entity km_buffer is 
  port ( I : in std_logic;
         O : out std_logic);
       end km_buffer;
architecture behav of km_buffer is
  begin
    process (I)
      begin
        O <= I;
      end process;
    end behav;