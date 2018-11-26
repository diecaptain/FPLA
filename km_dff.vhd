library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity km_dff is
  port ( clk : in std_logic;
         I : in std_logic;
         Y : out std_logic);
       end km_dff;
architecture behav of km_dff is
   begin
    process (clk, I)
      begin
        if (clk'event and clk = '1') then
            Y <= I;
          end if;
      end process;
    end behav;