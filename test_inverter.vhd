
library ieee;
use ieee.std_logic_1164.all;

entity test is
end test;

architecture behav of test is
component inverter is 
port (	i: in std_logic;
	o: out std_logic);
end component;
signal i,o: std_logic;

begin
tb : inverter port map(i,o);
	process
	begin 
    		i <='0'; wait for 10 ns;
    		i <='1'; wait for 10 ns;
	wait;
	end process;
end behav;