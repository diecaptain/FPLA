library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity km_selreg is
  generic (width : integer := 1);
  port (clk,data  : in std_logic;
        S         : out std_logic_vector(width downto 0);
        data_out  : out std_logic);
        end km_selreg;
architecture struct of km_selreg is
  component km_dff is
  port ( clk : in std_logic;
         I : in std_logic;
         Y : out std_logic);
       end component;
   signal Z: std_logic_vector(width+1 downto 0) := "000";
   begin
     Z(0) <= data;
     selector : for j in 0 to width generate
       selector_j : km_dff port map (clk => clk, I => Z(j), Y => Z(j+1));
       end generate selector;
       S(width downto 0) <= Z(width+1 downto 1);
       data_out <= Z(width+1);
     end struct;
