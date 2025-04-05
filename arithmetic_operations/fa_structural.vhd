--
library ieee;
use ieee.std_logic_1164.all; 
entity xor_1 is  
port ( s: out std_logic;
       a: in std_logic;
       b: in std_logic);
end xor_1;
architecture behav of xor_1 is
begin
      s <= '1' when a/=B else '0';
end behav;
--
library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all; -- for conv_std_logic_vector
entity adder is  
port ( s: out std_logic;
       co: out std_logic;
       a: in std_logic;
       b: in std_logic;
       ci:in std_logic);
end adder;
architecture behav of adder is
signal Result : std_logic_vector(1 downto 0);
begin   

	Result <= conv_std_logic_vector((conv_integer(a) + 
			conv_integer(b) + conv_integer(ci)),2);  
	s <= Result (0);
	co <= Result (1);
end behav;

-- structural model adder 8 bit
library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;-- for + operator
use ieee.std_logic_arith.all; -- for conv_std_logic_vector
entity adder_8 is  
port (	s: inout std_logic_vector(7 downto 0);
       	co: inout std_logic;
       	off: out std_logic;
       	a: in std_logic_vector(7 downto 0);
       	b: in std_logic_vector(7 downto 0);
       	ci:in std_logic);
end adder_8;
architecture behav of adder_8 is

component adder is  
port ( s: out std_logic;
       co: out std_logic;
       a: in std_logic;
       b: in std_logic;
       ci:in std_logic);
end component;
--
component xor_1 is  
port ( s: out std_logic;
       a: in std_logic;
       b: in std_logic);
end component;

signal c1, c2, c3, c4, c5, c6, c7: std_logic;
--signal Result : std_logic_vector(8 downto 0);
begin    

--	Result <= conv_std_logic_vector((conv_integer(a) +
--			conv_integer(b)	+ conv_integer(ci)),9);  
--	s <= Result (7 downto 0);
--	co <= Result (8);
--	off <= (a(7) and b(7) and not s(7)) or
--		(not a(7) and not b(7) and s(7));	

	a0:  adder port map(s(0), c1, a(0), b(0), ci);
	a1:  adder port map(s(1), c2, a(1), b(1), c1);
	a2:  adder port map(s(2), c3, a(2), b(2), c2);
	a3:  adder port map(s(3), c4, a(3), b(3), c3);
	a4:  adder port map(s(4), c5, a(4), b(4), c4);
	a5:  adder port map(s(5), c6, a(5), b(5), c5);
	a6:  adder port map(s(6), c7, a(6), b(6), c6);
	a7:  adder port map(s(7), co, a(7), b(7), c7);
	--off <= '1' when co/=c7 else '0'; 
	x1:  xor_1 port map(off, c7, co);
end behav;


