library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity km_mode is
  port (clk,mode : in std_logic;
        mode_sel : out std_logic );
      end km_mode;
architecture struct of km_mode is
  component km_inv is 
  port ( I : in std_logic;
         O : out std_logic);
       end component;
  component km_nand is 
  port ( I0,I1 : in std_logic;
         O     : out std_logic);
       end  component;
  signal z : std_logic := '0';
  begin
    M1 : km_nand port map (I0 => clk, I1 => mode, O => Z);
    M2 : km_inv port map (I => Z, O => mode_sel);
    end struct;
