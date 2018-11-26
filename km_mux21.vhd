library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
entity km_mux21 is -- entity declaration
  port ( I0, I1 : in std_logic; -- Inputs
         s : in std_logic; -- Select line
         Y : out std_logic ); -- Output
       end km_mux21;
architecture behav of km_mux21 is -- behavioral architecture
    begin
    process (s,I0,I1) -- Mux process
      begin
      if s = '0' then -- If condition begin
        Y <= not I0;
      else
        Y <= not I1;
      
      end if; -- If condition conclude
    end process;
  end behav;
