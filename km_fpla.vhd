library ieee;
use ieee.std_logic_1164.all;
-- use ieee.std_logic_arith.all;
entity km_fpla is
  generic ( msb     : integer := 2);
  port ( clk,mode,data_sel,rst : in std_logic;
         data_plu          : in std_logic_vector;
         I1,I2             : in std_logic_vector(msb downto 0);
         O1,O2             : out std_logic_vector(msb downto 0));
       end km_fpla;
architecture struct of km_fpla is
  component km_buffer is
  port ( I : in std_logic;
         O : out std_logic);
       end component;
  component km_mode is
  port (clk,mode : in std_logic;
        mode_sel : out std_logic );
      end component;
  component km_selreg is
  generic (width : integer := 17);
  port (clk,data  : in std_logic;
        S         : out std_logic_vector(width downto 0));
        end component;
  component km_plunew is
  port ( clk,mode_sel,data,rst : in std_logic;
         I,S     : in std_logic_vector(1 downto 0);
         O       : out std_logic_vector(1 downto 0) );
       end component;
  constant int_width : integer := 18;
  constant total : integer := 8;
  constant buff : integer := 12;
  signal Z : std_logic_vector(int_width downto 0);
  signal Y1,Y2,Z1,Z2 : std_logic_vector(total downto 0);
  signal B : std_logic_vector(buff downto 0);
  begin
    B1 : km_buffer port map (I => I1(0), O => B(1));
    B2 : km_buffer port map (I => I1(1), O => B(2));
    B3 : km_buffer port map (I => I1(2), O => B(3));
    B4 : km_buffer port map (I => I2(0), O => B(4));
    B5 : km_buffer port map (I => I2(1), O => B(5));
    B6 : km_buffer port map (I => I2(2), O => B(6));
    Y1(0) <= B(1);
    Y2(0) <= B(4);
    Y2(2) <= B(5);
    --Y2(3) <= B(5);
    Y1(3) <= B(2);
    Y1(6) <= B(3);
    Y2(7) <= B(6);
    --Y2(7) <= B(6);
    M0 : km_mode port map (clk => clk, mode => mode, mode_sel => B(0));
    B7 : km_buffer port map (I => B(0), O => Z(0));
    M1 : km_selreg port map (clk => clk, data => data_sel, S => Z(18 downto 1));
    M2 : km_plunew port map (clk => clk, mode_sel => Z(0), data => data_plu, rst => rst, I(0) => Y1(0), I(1) => Y2(0), S(0) => Z(1), S(1) => Z(10), O(0) => Z1(0), O(1) => Z2(0));
    B8 : km_buffer port map (I => Z1(0), O => Y1(1));
    B9 : km_buffer port map (I => Z2(0), O => Y2(5));
    M3 : km_plunew port map (clk => clk, mode_sel => Z(0), data => data_plu, rst => rst, I(0) => Y1(1), I(1) => Y2(1), S(0) => Z(2), S(1) => Z(11), O(0) => Z1(1), O(1) => Z2(1));
    B10 : km_buffer port map (I => Z1(1), O => Y1(2));
    B11 : km_buffer port map (I => Z2(1), O => B(7));
    M4 : km_plunew port map (clk => clk, mode_sel => Z(0), data => data_plu, rst => rst, I(0) => Y1(2), I(1) => Y2(2), S(0) => Z(3), S(1) => Z(12), O(0) => Z1(2), O(1) => Z2(2));
    B12 : km_buffer port map (I => Z1(2), O => B(8));
    B13 : km_buffer port map (I => Z2(2), O => Y2(3));
    M5 : km_plunew port map (clk => clk, mode_sel => Z(0), data => data_plu, rst => rst, I(0) => Y1(3), I(1) => Y2(3), S(0) => Z(4), S(1) => Z(13), O(0) => Z1(3), O(1) => Z2(3));
    B14 : km_buffer port map (I => Z1(3), O => Y1(4));
    B15 : km_buffer port map (I => Z2(3), O => Y2(8));
    M6 : km_plunew port map (clk => clk, mode_sel => Z(0), data => data_plu, rst => rst, I(0) => Y1(4), I(1) => Y2(4), S(0) => Z(5), S(1) => Z(14), O(0) => Z1(4), O(1) => Z2(4));
    B16 : km_buffer port map (I => Z1(4), O => Y1(5));
    B17 : km_buffer port map (I => Z2(4), O => Y2(1));
    M7 : km_plunew port map (clk => clk, mode_sel => Z(0), data => data_plu, rst => rst, I(0) => Y1(5), I(1) => Y2(5), S(0) => Z(6), S(1) => Z(15), O(0) => Z1(5), O(1) => Z2(5));
    B18 : km_buffer port map (I => Z1(5), O => B(9));
    B19 : km_buffer port map (I => Z2(5), O => Y2(6));
    M8 : km_plunew port map (clk => clk, mode_sel => Z(0), data => data_plu, rst => rst, I(0) => Y1(6), I(1) => Y2(6), S(0) => Z(7), S(1) => Z(16), O(0) => Z1(6), O(1) => Z2(6));
    B20 : km_buffer port map (I => Z1(6), O => Y1(7));
    B21 : km_buffer port map (I => Z2(6), O => B(10));
    M9 : km_plunew port map (clk => clk, mode_sel => Z(0), data => data_plu, rst => rst, I(0) => Y1(7), I(1) => Y2(7), S(0) => Z(8), S(1) => Z(17), O(0) => Z1(7), O(1) => Z2(7));
    B22 : km_buffer port map (I => Z1(7), O => Y1(8));
    B23 : km_buffer port map (I => Z2(7), O => Y2(4));
    M10 : km_plunew port map (clk => clk, mode_sel => Z(0), data => data_plu, rst => rst, I(0) => Y1(8), I(1) => Y2(8), S(0) => Z(9), S(1) => Z(18), O(0) => Z1(8), O(1) => Z2(8));
    B24 : km_buffer port map (I => Z1(8), O => B(11));
    B25 : km_buffer port map (I => Z2(8), O => B(12));
   O2(1) <= B(7);
   O1(0) <= B(8);
   O1(1) <= B(9);
   O2(0) <= B(10);
   O1(2) <= B(11);
   O2(2) <= B(12);
  -- O1(0) <= Z1(0);
   --O2(0) <= Z2(0);
   --O1(1) <= Z1(3);
   --O2(1) <= Z2(3);
   --O1(2) <= Z1(6);
   --O2(2) <= Z2(6);
  end struct;
