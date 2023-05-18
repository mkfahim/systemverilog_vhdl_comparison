


--behavioral model addition/subtraction unit

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
architecture behav of addsub_8 is  
--signal xb:std_logic_vector(7 downto 0);
signal Result:std_logic_vector(8 downto 0);
begin
--	xb(0) <= b(0) xor sub;
--	xb(1) <= b(1) xor sub;
--	xb(2) <= b(2) xor sub;
--	xb(3) <= b(3) xor sub;
--	xb(4) <= b(4) xor sub;
--	xb(5) <= b(5) xor sub;
--	xb(6) <= b(6) xor sub;
--	xb(7) <= b(7) xor sub;

--	xors:for i in 0 to 7 generate
--    		xb(i) <= b(i) xor sub;
--		--xb(i) <= '1' when b(i) /= sub else '0';--works too
--	end generate;
--
----	s <= a + xb + sub;
----	co <= (a(7) and xb(7))or(a(7) and not s(7)) or(xb(7) and not s(7));
--	Result <= ('0' & a) + ('0' & xb) + sub;  
--	s <= Result (7 downto 0);
--	co <= Result (8);
--
--	ofl <= (a(7) and xb(7) and not s(7)) 
--		or(not a(7) and not xb(7) and s(7));
-------------------------------------------------------------
	Result <= (('0' & a) - ('0' & b)) when sub = '1' 
			else  (('0' & a) + ('0' & b));
	s <= Result (7 downto 0);
	co <= Result (8) xor sub ; 	
	ofl <= (a(7) and (sub xor b(7)) and not s(7)) or
		(not a(7) and not (sub xor b(7)) and s(7));
   
end behav;

