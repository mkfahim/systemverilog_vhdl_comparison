


-- test bench for adder 8 bit gate
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;-- for to_unsigned
entity test_bench is
end test_bench;
architecture behav of test_bench is 
component adder_8 is  
port ( 	s: out std_logic_vector(7 downto 0);
       	co: inout std_logic;
       	os: out std_logic;
       	a: in std_logic_vector(7 downto 0);
       	b: in std_logic_vector(7 downto 0);
       	ci:in std_logic);
end component;
    	-- 1. Declare testbench variables  
signal a,b,s: std_logic_vector (7 downto 0); 
signal ci,co,os: std_logic;  
begin  
    	-- 2. Instantiate the design and connect to testbench variables  
csa0:adder_8  port map(s, co, os, a, b, ci); 
  
    	-- 3. Provide stimulus to test the design  
process
begin  
  	a <= std_logic_vector(to_unsigned(0, 8));--a <= 0;
  	b <= std_logic_vector(to_unsigned(4, 8));--b <= 4;
	ci <= to_unsigned(0,1)(0);-- ci <= 0;
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

	a <= "11110110";--F6
  	b <= "00001010";--0A
  	ci <= '0';
  	wait for 10 ns;
  	
wait;
end process;  
end behav;


