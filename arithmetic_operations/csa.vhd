

-- behavioral model of adder
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

	Result <= conv_std_logic_vector((conv_integer(a) + conv_integer(b)
			+ conv_integer(ci)),2);  
	s <= Result (0);
	co <= Result (1);
end behav;

library ieee;
use ieee.std_logic_1164.all; 
entity mux2to1 is  
port ( i0: in std_logic;
       i1: in std_logic;
       s: in std_logic;
       o: out std_logic);  
end mux2to1;
architecture behav of mux2to1 is

begin  
	o <= i1 when s = '1' else i0;  
end behav;


-- structural model of carru select adder 8-bit
library ieee;
use ieee.std_logic_1164.all; 
entity adder_8 is  
port ( s: out std_logic_vector(7 downto 0);
       co: inout std_logic;
       os: out std_logic;
       a: in std_logic_vector(7 downto 0);
       b: in std_logic_vector(7 downto 0);
       ci:in std_logic);
end adder_8;
architecture str of adder_8 is
component adder is  
port ( s: out std_logic;
       co: out std_logic;
       a: in std_logic;
       b: in std_logic;
       ci:in std_logic);
end component;

component mux2to1 is  
port ( i0: in std_logic;
       i1: in std_logic;
       s: in std_logic;
       o: out std_logic);  
end component;

signal c1, c2, c3, c4, c5, c6, c7: std_logic;
signal s47_0,s47_1,c47_0,c47_1:std_logic_vector(3 downto 0);
begin   
	a0:  adder port map(s(0), c1, a(0), b(0), ci);
	a1:  adder port map(s(1), c2, a(1), b(1), c1);
	a2:  adder port map(s(2), c3, a(2), b(2), c2);
	a3:  adder port map(s(3), c4, a(3), b(3), c3);
--	a4:  adder port map(s(4), c5, a(4), b(4), c4);
--	a5:  adder port map(s(5), c6, a(5), b(5), c5);
--	a6:  adder port map(s(6), c7, a(6), b(6), c6);
--	a7:  adder port map(s(7), co, a(7), b(7), c7);

	a04:  adder port map(s47_0(0), c47_0(0), a(4), b(4), '0');
	a05:  adder port map(s47_0(1), c47_0(1), a(5), b(5), c47_0(0));
	a06:  adder port map(s47_0(2), c47_0(2), a(6), b(6), c47_0(1));
	a07:  adder port map(s47_0(3), c47_0(3), a(7), b(7), c47_0(2));
--
	a14:  adder port map(s47_1(0), c47_1(0), a(4), b(4), '1');
	a15:  adder port map(s47_1(1), c47_1(1), a(5), b(5), c47_1(0));
	a16:  adder port map(s47_1(2), c47_1(2), a(6), b(6), c47_1(1));
	a17:  adder port map(s47_1(3), c47_1(3), a(7), b(7), c47_1(2));
--
	mux_carry:   mux2to1 port map(c47_0(3),c47_1(3),c4,co);
	mux_offset:  mux2to1 port map(c47_0(2),c47_1(2),c4,c7);

	mux_sum0:   mux2to1 port map(s47_0(0),s47_1(0),c4,s(4));
	mux_sum1:   mux2to1 port map(s47_0(1),s47_1(1),c4,s(5));
	mux_sum2:   mux2to1 port map(s47_0(2),s47_1(2),c4,s(6));
	mux_sum3:   mux2to1 port map(s47_0(3),s47_1(3),c4,s(7));

	os <= co xor c7; --use if co defined as inout 
   
end str;

