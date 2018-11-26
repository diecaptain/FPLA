library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
entity km_nand is 
  port ( I0,I1 : in std_logic;
         O     : out std_logic);
       end km_nand;
architecture behav of km_nand is
  begin
    process (I0, I1)
      begin
      O <= not (I0 and I1);
    end process;
  end behav;
