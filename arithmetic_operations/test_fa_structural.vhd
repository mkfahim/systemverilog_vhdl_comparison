
-- test bench for adder 8 bit 
library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;
architecture behav of testbench is 
component adder_8 is  
port ( 	s: inout std_logic_vector(7 downto 0);
       	co: inout std_logic;
       	off: out std_logic;
       	a: in std_logic_vector(7 downto 0);
       	b: in std_logic_vector(7 downto 0);
       	ci:in std_logic);
end component;
    	-- 1. Declare testbench variables  
signal a,b,s: std_logic_vector (7 downto 0); 
signal ci,co,off: std_logic;  
begin  
    	-- 2. Instantiate the design and connect to testbench variables  
fa0:adder_8  port map(s, co, off, a, b, ci); 
  
    	-- 3. Provide stimulus to test the design  
process
begin  
  	a <= "00000000";
  	b <= "00000000";
  	ci <= '0';
  	wait for 10 ns;
  
  	a <= "00100100";--24
  	b <= "10000001";--81
  	ci <= '1';
  	wait for 10 ns;
  
  	a <= "01100011";--63
  	b <= "00001101";--0D
  	ci <= '1';
  	wait for 10 ns;

	a <= "01100101";--65
  	b <= "00010010";--12
	ci <= '1';
	wait for 10 ns;

  	a <= "00001101";--0D
  	b <= "01110110";--76
  	ci <= '1';
  	wait for 10 ns;

  	a <= "11101101";--ED
  	b <= "10001100";--8C
  	ci <= '1';
	wait for 10 ns;

	a <= "10101010";--AA
  	b <= "01010101";--55
  	ci <= '0';
  	wait for 10 ns;
  	wait;

end process;  
end behav;
