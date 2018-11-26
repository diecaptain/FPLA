library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity km_lutnew is
  port (clk,data,I0,I1 : in std_logic;
        O,data_out     : out std_logic );
      end km_lutnew;
architecture struct of km_lutnew is
  component km_mux21 is -- entity declaration
  port ( I0, I1 : in std_logic; -- Inputs
         s : in std_logic; -- Select line
         Y : out std_logic ); -- Output
       end component;
 -- component km_inv is 
 -- port ( I : in std_logic;
 --        O : out std_logic);
 --      end component;
 -- component km_nand is 
 -- port ( I0,I1 : in std_logic;
 --        O     : out std_logic);
 --      end  component;     
  component km_dff is
  port ( clk : in std_logic;
         I : in std_logic;
         Y : out std_logic);
       end component;
       signal Z : std_logic_vector(4 downto 2) := "000";
       signal I : std_logic_vector(4 downto 0) := "00000";
       begin
         I(0) <= data;
     --    M1 : km_nand port map (I0 => mode, I1 => clk, O => Z(0));
     --    M2 : km_inv port map (I => Z(0), O => Z(1));
         dff: for j in 0 to 3 generate
           begin
             dff_j : km_dff port map (clk => clk, I => I(j), Y => I(j+1));
             end generate dff;
         M3 : km_mux21 port map (I0 => I(1), I1 => I(2), s => I1, Y => Z(2));
         M4 : km_mux21 port map (I0 => I(3), I1 => I(4), s => I1, Y => Z(3));
         M5 : km_mux21 port map (I0 => Z(2), I1 => Z(3), s => I0, Y => Z(4));
         O <= Z(4);
         data_out <= I(4);
       end struct;
