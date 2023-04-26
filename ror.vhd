

----- behavioral model rotate right b is only for 2:0 bits for ror
library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;-- for to_integer and unsigned
use ieee.numeric_std.all;-- for rotate and shift_right
entity rotate_right_8 is  
port ( s: out std_logic_vector(7 downto 0);
       a: in std_logic_vector(7 downto 0);
       b: in std_logic_vector(7 downto 0));
end rotate_right_8;

architecture behav of rotate_right_8 is
signal s1, s2: std_logic_vector(7 downto 0); 

begin  
-- below are rotate right implementations
	--s <= a ror to_integer(unsigned(b (2 downto 0)));--select vdl 2008 to use this 
	--s <= std_logic_vector(rotate_right(unsigned(a), 
	--	to_integer(unsigned(b(2 downto 0)))));-- not in original code

----Process(a,b)	
--Process(all)-- use vhdl 2008 in properties to use this
--begin
--	if (b(2 downto 0) = "000")then
--		s <= a;
--	elsif (b(2 downto 0) = "001")then
--		s <= a(0) & a(7 downto 1);
--	elsif (b(2 downto 0) = "010")then
--		s <= a(1 downto 0) & a(7 downto 2);
--	elsif (b(2 downto 0) = "011")then
--		s <= a(2 downto 0) & a(7 downto 3);
--	elsif (b(2 downto 0) = "100")then
--		s <= a(3 downto 0) & a(7 downto 4);
--	elsif (b(2 downto 0) = "101")then
--		s <= a(4 downto 0) & a(7 downto 5);
--	elsif (b(2 downto 0) = "110")then
--		s <= a(5 downto 0) & a(7 downto 6);
--	elsif (b(2 downto 0) = "111")then
--		s <= a(6 downto 0) & a(7);
--	else 
--		s <= x"ZZ";
--	end if;
--end process;

	s1 <= a(0) & a(7 downto 1) when b(0) = '1' else a;  
	s2 <= s1(1 downto 0) & s1(7 downto 2) when b(1) = '1' else s1;
	s <= s2(3 downto 0) & s2(7 downto 4) when b(2) = '1' else s2;
end behav;