library IEEE;
use IEEE.std_logic_1164.all;
entity test is
end test;

architecture behav of test is
component and_gate is
    port(a : in std_logic;      
         b : in std_logic;     
         c : out std_logic);
end component;
signal a,b,c :std_logic;
begin
dut: and_gate port map(a,b,c);
	process begin
   		a<='0'; b<='0'; wait for 10 ns;
   		a<='0'; b<='1'; wait for 10 ns;
    		a<='1'; b<='0'; wait for 10 ns;
			a<='1'; b<='1'; wait for 10 ns;
  	wait;
	end process;
end behav;