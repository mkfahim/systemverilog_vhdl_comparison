

---- testbench for PC
library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;--required for +
use ieee.numeric_std.all;-- to use to_integer
entity testbench is
end testbench;

architecture behav of testbench is
component P_C is
Port( pc: inout std_logic_vector (7 downto 0);
      power : in std_logic;
      clk : in std_logic;
      branch_pc : in std_logic_vector (7 downto 0);
      branch_en : in std_logic;
      stop_en : in std_logic;
      next_pc: inout std_logic_vector (7 downto 0));
end component;

signal pc: std_logic_vector ( 7 downto 0);
signal power: std_logic;
signal branch_pc: std_logic_vector (7 downto 0);
signal branch_en: std_logic;
signal next_pc: std_logic_vector(7 downto 0); 
signal stop_en: std_logic;
signal clk: std_logic;

signal cycles:std_logic_vector (15 downto 0):=x"0000";
signal stop:std_logic;

begin
uut:P_C port map(pc, power, clk, branch_pc, branch_en, stop_en, next_pc);
process 
begin
	clk <= '0';wait for 5 ns;
	clk <= '1'; wait for 5 ns;

end process;

process
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

Process(clk)
begin
if FallING_EDGE (clk) then	
	cycles <= cycles + 1;  
      	if stop = '1' then  
           report INTEGER'IMAGE(to_integer(unsigned(cycles))) & " :" & 
		" pc=" & INTEGER'IMAGE(to_integer(unsigned(pc))) &
		" stop program";
	   assert false report "Test: OK" severity failure;
      	else
           if power = '0' then
                report INTEGER'IMAGE(to_integer(unsigned(cycles))) & " :" & 
		" pwr=" & INTEGER'IMAGE(to_integer(unsigned'("" & power))) &
		" pc=" & INTEGER'IMAGE(to_integer(unsigned(pc))) &
		" npc=" & INTEGER'IMAGE(to_integer(unsigned(next_pc)));
	   else
                if (stop_en = '1') then
		   report INTEGER'IMAGE(to_integer(unsigned(cycles))) & " :" & 
		   " pwr=" & INTEGER'IMAGE(to_integer(unsigned'("" & power))) &
		   " pc=" & INTEGER'IMAGE(to_integer(unsigned(pc))) &
		   " npc=" & INTEGER'IMAGE(to_integer(unsigned(next_pc))) & 
		   " stop";
		   stop <= '1';
		else
		   if (branch_en = '1') then		     
		      report INTEGER'IMAGE(to_integer(unsigned(cycles))) & " :" & 
		      " pwr=" & INTEGER'IMAGE(to_integer(unsigned'("" & power))) &
		      " pc=" & INTEGER'IMAGE(to_integer(unsigned(pc))) &
		      " npc=" & INTEGER'IMAGE(to_integer(unsigned(next_pc))) &
		      " branch to " & INTEGER'IMAGE(to_integer(unsigned(branch_pc)));
		   else
		      report INTEGER'IMAGE(to_integer(unsigned(cycles))) & " :" & 
		      " pwr=" & INTEGER'IMAGE(to_integer(unsigned'("" & power))) &
		      " pc=" & INTEGER'IMAGE(to_integer(unsigned(pc))) &
		      " npc=" & INTEGER'IMAGE(to_integer(unsigned(next_pc))) &
		      " inc_pc " & INTEGER'IMAGE(to_integer(unsigned(pc + 1)));		
                   end if;--if branch_en
                end if; -- else: !if(stop_en)
           end if;-- !if(power)
	end if;-- if(stop ='1')
end if;-- if falling edge (clk)
end process;-- process begin

end behav;
