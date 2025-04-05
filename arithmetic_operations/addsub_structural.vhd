-- to use  /*   */   enable vhdl 2008 in properties

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

-- behavioral model adder 8 bit
library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all; -- for conv_std_logic_vector
entity adder_8 is  
port ( s: inout std_logic_vector(7 downto 0);--use inout if using vhdl 2002
       co: inout std_logic;
       ofl: out std_logic;
       a: in std_logic_vector(7 downto 0);
       b: in std_logic_vector(7 downto 0);
       ci:in std_logic);
end adder_8;
architecture behav of adder_8 is
signal Result : std_logic_vector(8 downto 0);
begin    
	s <= a + b + ci;
   	co <= (a(7) and b(7))or(a(7) and not s(7)) or(b(7) and not s(7));
   	ofl <= (a(7) and b(7) and not s(7)) or
		(not a(7) and not b(7) and s(7));   
end behav;



--structural model addition/subtraction unit

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 use ieee.std_logic_arith.all; --- conv_std_logic_vector
entity addsub_8 is  
port ( s: inout std_logic_vector(7 downto 0);
       co: inout std_logic;
       ofl: out std_logic;
       a: in std_logic_vector(7 downto 0);
       b: in std_logic_vector(7 downto 0);
       sub:in std_logic);
end addsub_8;
architecture struct of addsub_8 is  

component adder_8 is  
port ( s: inout std_logic_vector(7 downto 0);
       co: inout std_logic;
       ofl: out std_logic;
       a: in std_logic_vector(7 downto 0);
       b: in std_logic_vector(7 downto 0);
       ci:in std_logic);
end component; 

component xor_1 is  
port ( s: out std_logic;
       a: in std_logic;
       b: in std_logic);
end component;
 
signal xb:std_logic_vector(7 downto 0);
begin
	--xb <= b xor (sub & sub & sub & sub & sub & sub & sub & sub);
	xors:for i in 0 to 7 generate
    		--xb(i) <= b(i) xor sub;
		myxor:xor_1 port map(xb(i), sub, b(i));
	end generate;

--	s <= a + xb + sub;
--	co <= (a(7) and xb(7))or(a(7) and not s(7)) or(xb(7) and not s(7));
--	ofl <= (a(7) and xb(7) and not s(7)) 
--		or(not a(7) and not xb(7) and s(7));
	myadder:   adder_8 port map(s, co, ofl, a, xb, sub);
end struct;

