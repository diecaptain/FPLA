library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
entity km_equality_tester is
  port ( I0, I1 : in std_logic;
         O : out std_logic );
       end km_equality_tester;
architecture struct of km_equality_tester is
  component km_xor is
  port ( I0, I1 : in std_logic;
         O : out std_logic );
       end component;
       begin
         equality_tester : km_xor port map (I0 => I0,
                                            I1 => I1,
                                            O => O );
                                          end struct;
