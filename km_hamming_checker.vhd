library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
entity km_hamming_checker is
  port ( I0, I1 : in std_logic;
         O : out std_logic );
       end km_hamming_checker;
architecture struct of km_hamming_checker is
  component km_xor is
  port ( I0, I1 : in std_logic;
         O : out std_logic );
       end component;
       begin
         hamming_checker : km_xor port map (I0 => I0,
                                            I1 => I1,
                                            O => O );
                                          end struct;


