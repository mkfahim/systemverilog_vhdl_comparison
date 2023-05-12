

-- behavioral model adder 8 bit
library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;-- for + operator
use ieee.std_logic_arith.all; -- for conv_std_logic_vector
entity adder_8 is  
port ( --s: out std_logic_vector(7 downto 0);
	s: inout std_logic_vector(7 downto 0);
       --co: out std_logic;
       co: inout std_logic;
       off: out std_logic;
       a: in std_logic_vector(7 downto 0);
       b: in std_logic_vector(7 downto 0);
       ci:in std_logic);
end adder_8;
architecture behav of adder_8 is
signal Result : std_logic_vector(8 downto 0);
begin    
	--s <= a + b + ci;
   	--co <= (a(7) and b(7))or(a(7) and not s(7)) 
	--	or(b(7) and not s(7));

	--Result <= ('0' & a) + ('0' & b) + ci;
	Result <= conv_std_logic_vector((conv_integer(a) + conv_integer(b)
			+ conv_integer(ci)),9);   
	s <= Result (7 downto 0);
	co <= Result (8);

	off <= (a(7) and b(7) and not s(7)) or
		(not a(7) and not b(7) and s(7));	   
end behav;


