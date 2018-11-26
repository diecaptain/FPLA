library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity km_lut24 is
  port (S : in std_logic_vector(1 downto 0);
        Y : out std_logic );
     end km_lut24;
architecture behav of km_lut24 is
  --signal i : integer range 0 to 3:=0; -- change the range value
  type lut is array ( 0 to 4**1 - 1) of std_logic;
  constant my_lut : lut := (
  0 => '0',
  1 => '1',
  2 => '1',
  3 => '0'
  );
begin
  process (S)
    begin
      case S is
      when "00" => Y <= my_lut(0);
      when "01" => Y <= my_lut(1);
      when "10" => Y <= my_lut(2);
      when "11" => Y <= my_lut(3);
      when others => Y <= '0';
      end case;
    end process;
  end behav;
      