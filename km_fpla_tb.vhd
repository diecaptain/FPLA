library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity km_fpla_tb is
end km_fpla_tb;
architecture behav of km_fpla_tb is
  component km_fpla is
  generic ( msb     : integer);
  port ( clk,mode,data_sel,data_plu,rst : in std_logic;
         I1,I2             : in std_logic_vector(msb downto 0);
         O1,O2             : out std_logic_vector(msb downto 0));
       end component;
  constant tb_msb : integer := 2;
  signal tb_clk,tb_mode,tb_data_sel,tb_data_plu,tb_rst : std_logic := '0';
  signal tb_I1,tb_I2,tb_O1,tb_O2 : std_logic_vector(tb_msb downto 0) := "000";
  constant period : time := 10 ns;
  constant run_period : time := 100 us;
  constant clk_period : time := 10 ns;
  begin
    uut : km_fpla generic map (msb => tb_msb)
                  port map (clk => tb_clk, mode => tb_mode, data_sel => tb_data_sel, data_plu => tb_data_plu, rst => tb_rst, I1 => tb_I1, I2 => tb_I2, O1 => tb_O1, O2 => tb_O2);
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
        tb_mode <= '1';
        tb_data_sel <= '0';
        wait for period;
        tb_data_sel <= '0';
        wait for period;
        tb_data_sel <= '0';
        wait for period;
        tb_data_sel <= '0';
        wait for period;
        tb_data_sel <= '0';
        wait for period;
        tb_data_sel <= '0';
        wait for period;
        tb_data_sel <= '0';
        wait for period;
        tb_data_sel <= '0';
        wait for period;
        tb_data_sel <= '0';
        wait for period;
        tb_data_sel <= '0';
        wait for period;
        tb_data_sel <= '0';
        wait for period;
        tb_data_sel <= '0';
        wait for period;
        tb_data_sel <= '0';
        wait for period;
        tb_data_sel <= '0';
        wait for period;
        tb_data_sel <= '0';
        wait for period;
        tb_data_sel <= '0';
        wait for period;
        tb_data_sel <= '0';
        wait for period;
        tb_data_sel <= '0';
        wait for period;
        tb_data_plu <= '0';
        wait for period;
        tb_data_plu <= '1';
        wait for period;
        tb_data_plu <= '1';
        wait for period;
        tb_data_plu <= '0';
        wait for period;
        tb_mode <= '0';
        tb_I1 <= "000";
        tb_I2 <= "000";
        wait for run_period;
        tb_I1 <= "111";
        tb_I2 <= "111";
        wait for run_period;
        tb_I1 <= "010";
        tb_I2 <= "101";
        wait for run_period;
        tb_I1 <= "100";
        tb_I2 <= "001";
        wait for run_period;
        tb_I1 <= "110";
        tb_I2 <= "100";
        wait for period;
        wait;
      end process;
    end behav;
