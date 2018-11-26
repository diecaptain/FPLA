library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity km_plu_tb is
end km_plu_tb;
architecture behav of km_plu_tb is
  component km_plu is
  port ( clk,rst : in std_logic;
         I,S     : in std_logic_vector(1 downto 0);
         O       : out std_logic_vector(1 downto 0) );
       end component;
  signal tb_clk,tb_rst : std_logic := '0';
  signal tb_I,tb_S : std_logic_vector(1 downto 0) := "00";
  signal tb_O : std_logic_vector(1 downto 0);
  constant period : time := 100 ps;
  constant clk_period : time := 100 ps;
  begin
    uut : km_plu port map (clk => tb_clk, rst => tb_rst, I => tb_I, S => tb_S, O => tb_O);
      clk_process : process
      begin
        -- wait for period;
        tb_clk <= '0';
        wait for clk_period/2;
        tb_clk <= '1';
        wait for clk_period/2;
      end process;
      stim_process: process
      begin
        wait for period;
        tb_I <= "00";
        tb_S <= "00";
        wait for period;
        tb_S <= "01";
        wait for period;
        tb_S <= "10";
        wait for period;
        tb_S <= "11";
        wait for period;
        tb_I <= "01";
        tb_S <= "00";
        wait for period;
        tb_S <= "01";
        wait for period;
        tb_S <= "10";
        wait for period;
        tb_S <= "11";
        wait for period;
        tb_I <= "10";
        tb_S <= "00";
        wait for period;
        tb_S <= "01";
        wait for period;
        tb_S <= "10";
        wait for period;
        tb_S <= "11";
        wait for period;
        tb_I <= "11";
        tb_S <= "00";
        wait for period;
        tb_S <= "01";
        wait for period;
        tb_S <= "10";
        wait for period;
        tb_S <= "11";
        wait for period;
        wait;
      end process;
    end behav;
