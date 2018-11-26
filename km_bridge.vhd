library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
entity km_bridge is
  port ( I0, I1 : in std_logic;
         O : out std_logic );
       end km_bridge;
architecture struct of km_bridge is
  component km_xor is
  port ( I0, I1 : in std_logic;
         O : out std_logic );
       end component;
       begin
         bridge : km_xor port map (I0 => I0,
                                   I1 => I1,
                                   O => O );
                                  end struct;
