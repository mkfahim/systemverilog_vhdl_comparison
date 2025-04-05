
library ieee;
use ieee.std_logic_1164.all; 
entity xor_1 is  
port ( s: out std_logic;
       a: in std_logic;
       b: in std_logic);
end xor_1;
architecture str of xor_1 is
begin
      s<=a xor B;
end str;


library ieee;
use ieee.std_logic_1164.all; 
entity half_adder is  
port ( s: out std_logic;
       c: out std_logic;
       a: in std_logic;
       b: in std_logic);
end half_adder;
architecture struct of half_adder is

begin   
   s <= a xor b;
   c <= a and b;
   
end struct;


-- structural model of level 1 cla 4 bit
library ieee;
use ieee.std_logic_1164.all; 
entity adder_cla_4 is  
port ( s: out std_logic_vector(3 downto 0);
       co: out std_logic;
       a: in std_logic_vector(3 downto 0);
       b: in std_logic_vector(3 downto 0);
       ci:in std_logic;
       c3: out std_logic	);
end adder_cla_4;
architecture str of adder_cla_4 is
component half_adder is  
port ( s: out std_logic;
       c: out std_logic;
       a: in std_logic;
       b: in std_logic);
end component;
--
component xor_1 is  
port ( s: out std_logic;
       a: in std_logic;
       b: in std_logic);
end component;

signal c:std_logic_vector(3 downto 1);
signal g,p: std_logic_vector(3 downto 0);

begin   
	--g(3 downto 0) <=a(3 downto 0) and b(3 downto 0);--gi = ai and bi
   	--p(3 downto 0) <=a(3 downto 0) xor b(3 downto 0);-- pi = ai xor bi
	adders:for i in 3 downto 0 generate  
		a0:half_adder port map(p(i), g(i), a(i), b(i));
	end generate; 
   	c(1)<=g(0)xor(p(0) and ci);--c1 = g0 + p0c0
   	c(2)<=g(1) xor (g(0) and p(1)) xor (p(1) and p(0) and ci);--c2 = g1 + p1c1
   	c(3)<=g(2) xor (g(1)  and p(2)) xor (g(0) and p(2)  and p(1)) xor
		(p(2) and p(1)  and p(0) and ci);-- c3 = g2 + p2c2
   	co <=g(3) xor (g(2) and p(3)) xor (g(1) and p(3) and p(2)) xor 
		(g(0) and p(3) and p(2) and p(1)) xor 
		(p(3) and p(2) and p(1)  and p(0)  and ci);-- c4 = g3 + p3c3
   	s(0)<=p(0) xor ci;-- si = pi xor ci
	--s(3 downto 1)<=p(3 downto 1) xor c(3 downto 1);
	xors:for i in 3 downto 1 generate  
		myxor1:xor_1 port map(s(i), p(i), c(i));
	end generate;
   	c3 <=c(3);
   
end str;


-- structural model of carry look ahead adder 8-bit
library ieee;
use ieee.std_logic_1164.all; 
entity adder_8 is  
port ( s: out std_logic_vector(7 downto 0);
       co: inout std_logic;
       off: out std_logic;
       a: in std_logic_vector(7 downto 0);
       b: in std_logic_vector(7 downto 0);
       ci:in std_logic);
end adder_8;
architecture str of adder_8 is
component adder_cla_4 is  
port ( s: out std_logic_vector(3 downto 0);
       co: inout std_logic;
       a: in std_logic_vector(3 downto 0);
       b: in std_logic_vector(3 downto 0);
       ci:in std_logic;
       c3: out std_logic	);
end component;

signal c3, c4, c7: std_logic;

begin   
a0:  adder_cla_4 port map(s(3 downto 0), c4, a(3 downto 0),
		 b(3 downto 0), ci, c3);
a1:  adder_cla_4 port map(s(7 downto 4), co, a(7 downto 4), 
		 b(7 downto 4), c4, c7);

     off <= co xor c7; 
   
end str;
