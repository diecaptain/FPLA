library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity km_plu is
  port ( clk,rst : in std_logic;
         I,S     : in std_logic_vector(1 downto 0);
         O       : out std_logic_vector(1 downto 0) );
       end km_plu;
architecture struct of km_plu is
  component km_mux21 is -- entity declaration
  port ( I0, I1 : in std_logic; -- Inputs
         s : in std_logic; -- Select line
         Y : out std_logic ); -- Output
       end component;
  component km_inv is 
  port ( I : in std_logic;
         O : out std_logic);
       end component;
  component km_nand is 
  port ( I0,I1 : in std_logic;
         O     : out std_logic);
       end  component;     
  component km_dff is
  port ( clk : in std_logic;
         I : in std_logic;
         Y : out std_logic);
       end component;
  component km_lut24 is
  port (S : in std_logic_vector(1 downto 0);
        Y : out std_logic );
     end component;
     signal Z : std_logic_vector(8 downto 0) := "000000000";
     begin
       M1 : km_lut24 port map (S => I, Y => Z(0));
       M2 : km_mux21 port map (I0 => I(0), I1 => I(1), s => S(0), Y => Z(1));
       M3 : km_inv port map (I => Z(1), O => Z(2));
       M4 : km_nand port map (I0 => Z(2), I1 => rst, O => Z(3));
       M5 : km_nand port map (I0 => Z(0), I1 => Z(3), O => Z(4));
       M6 : km_inv port map (I => Z(4), O => Z(5));  
       M7 : km_dff port map (clk => clk, I => Z(5), Y => Z(6));
       M8 : km_mux21 port map (I0 => Z(0), I1 => Z(6), s => S(1), Y => Z(7));
       M9 : km_inv port map (I => Z(7), O => Z(8));
         O(0) <= Z(8);
         O(1) <= Z(8);
       end struct;