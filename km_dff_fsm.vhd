library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity km_dff_fsm is 
  port (clk,en,rst : in std_logic;
        I : in std_logic;
         Y : out std_logic);
       end km_dff_fsm;
architecture fsm of km_dff_fsm is
  type states is (state1,state2);
  signal nstate,cstate,state : states;
  begin
  process (clk,en,rst)
     if (reset = '1') then
		            state <= initial;
		            elsif ( clock'event and clock = '1') then
		              cstate <= nstate;
		               end if;
		               end process;