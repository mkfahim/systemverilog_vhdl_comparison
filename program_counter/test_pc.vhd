

---- testbench for PC
library ieee;
use ieee.std_logic_1164.all;
entity testbench is
end testbench;
architecture behav of testbench is
component P_C is
Port( --pc: out std_logic_vector (7 downto 0);
      pc: inout std_logic_vector (7 downto 0);
      power : in std_logic;
      clk : in std_logic;
      branch_pc : in std_logic_vector (7 downto 0);
      branch_en : in std_logic;
      stop_en : in std_logic;
      --next_pc: out std_logic_vector (7 downto 0));
      next_pc: inout std_logic_vector (7 downto 0));
end component;

signal pc: std_logic_vector ( 7 downto 0);
signal power: std_logic;
signal branch_pc: std_logic_vector (7 downto 0);
signal branch_en: std_logic;
signal next_pc: std_logic_vector(7 downto 0); 
signal stop_en: std_logic;
signal clk: std_logic;

begin
uut:P_C port map(pc, power, clk, branch_pc, branch_en, stop_en, next_pc);
clk_Proc: process 
begin
	clk <= '1';wait for 5 ns;
	clk <= '0'; wait for 5 ns;

end process;

stim_proc:process
begin 

	power <= '0';stop_en <= '0';branch_en <= '0';
	branch_pc <= "00000000";
	wait for 10 ns;

	power <= '0';stop_en <= '0';branch_en <= '1';
	branch_pc <= "00000001";
	wait for 10 ns;

	power <= '0';stop_en <= '1';branch_en <= '0';
	branch_pc<="00000010";
	wait for 10 ns;
		
	power <= '0';stop_en <= '1';branch_en <= '1';
	branch_pc<="00000011";
	wait for 10 ns;

	power <= '1';stop_en <= '0';branch_en <= '0';
	branch_pc<="00000100";
	wait for 10 ns;

	power <= '1';stop_en <= '0';branch_en <= '1';
	branch_pc<="00000101";
	wait for 10 ns;

	power <= '1';stop_en <= '1';branch_en <= '0';
	--branch_pc <= "XXXXXXXX";
	branch_pc <= "00001000";
	wait for 10 ns;

	power <= '1';stop_en <= '1';branch_en <= '1';
	branch_pc <= "10000000";
	wait for 10 ns;

	power <= '1';stop_en <= '0';branch_en <= '1';
	branch_pc <= "11111111";
	wait for 10 ns;

	power <= '1';stop_en <= '0';branch_en <= '0';
	branch_pc <= "01000000";
	wait for 10 ns;

wait;
end process;
end behav;
