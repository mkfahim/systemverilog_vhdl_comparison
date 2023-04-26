

-- test bench for rotate right
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity testbench is
end testbench;

architecture behav of testbench is 

component rotate_right_8 is  
port ( s: out std_logic_vector(7 downto 0);
       a: in std_logic_vector(7 downto 0);
       b: in std_logic_vector(7 downto 0));
end component;

signal s,a,b: std_logic_vector( 7 downto 0);
begin
sll8: rotate_right_8 port map(s, a, b);

process begin
	a <= x"00";b <= x"00"; 
	wait for 10 ns;
	for j in 1 to 7 loop
		a <= a + x"04";
		b <= b + x"01";
    		wait for 10 ns;
	end loop;
	A <= x"F6";
      	B <= x"0A";
	wait for 10 ns;
	wait;

end process;
end behav;