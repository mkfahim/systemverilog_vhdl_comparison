


---- test bench for subtraction unit 8 bit
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity test_bench is
end test_bench;
architecture behav of test_bench is 
component addsub_8 is  
port ( s: inout std_logic_vector(7 downto 0);
       co: inout std_logic;
       ofl: out std_logic;
       a: in std_logic_vector(7 downto 0);
       b: in std_logic_vector(7 downto 0);
       sub:in std_logic);
end component;
    -- 1. Declare testbench variables  
signal a,b,s: std_logic_vector (7 downto 0); 
signal sub,co,ofl: std_logic;  
begin  
    -- 2. Instantiate the design and connect to testbench variables  
fa0:addsub_8  port map(s, co, ofl, a, b, sub); 
  
    -- 3. Provide stimulus to test the design  
process
begin  
  a <= std_logic_vector(to_unsigned(0, 8));--a <= 0;
  b <= std_logic_vector(to_unsigned(4, 8));--b <= 4;
  sub <= '0';
  wait for 10 ns;
  
  a <= "00100100";--24
  b <= "10000001";--81
  sub <= '1';
  wait for 10 ns;
  
  a <= "01100011";--63
  b <= "00001101";--0D
  sub <= '1';
  wait for 10 ns;
  
  a <= "01100101";--65
  b <= "00010010";--12
  sub <= '1';
  wait for 10 ns;

  a <= "00001101";--0D
  b <= "01110110";--76
  sub <= '1';
  wait for 10 ns;

  a <= "11101101";--ED
  b <= "10001100";--8C
  sub <= '1';
  wait for 10 ns;

  a <= "11110110";--F6
  b <= "00001010";--0A
  sub <= '0';
  wait for 10 ns;
  wait;

   end process;  
end behav;