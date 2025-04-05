

----- behavioral model shift right arithmetic b is only for 2:0 bits for sra
library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;-- for to_integer
entity shift_right_arithmetic_8 is  
port ( s: out std_logic_vector(7 downto 0);
       a: in std_logic_vector(7 downto 0);
       b: in std_logic_vector(7 downto 0));
end shift_right_arithmetic_8;

architecture beh of shift_right_arithmetic_8 is
signal s1, s2: std_logic_vector(7 downto 0); 
begin  

----below is Arithmetic shift right 
	--s <= to_stdlogicvector(to_bitvector(a) sra 
	--	to_integer(unsigned(b (2 downto 0))));
--Process(all)
--begin
--	if (b(2 downto 0) = "000")then
--		s <= a;
--	elsif (b(2 downto 0) = "001")then
--		s <= a(7) & a(7 downto 1);
--	elsif (b(2 downto 0) = "010")then
--		s <= a(7) & a(7) & a(7 downto 2);
--	elsif (b(2 downto 0) = "011")then
--		s <= a(7) & a(7) & a(7) & a(7 downto 3);
--	elsif (b(2 downto 0) = "100")then
--		s <= a(7) & a(7) & a(7) & a(7) & a(7 downto 4);
--	elsif (b(2 downto 0) = "101")then
--		s <= a(7) & a(7) & a(7) & a(7) & a(7) & a(7 downto 5);
--	elsif (b(2 downto 0) = "110")then
--		s <= a(7) & a(7) & a(7) & a(7) & a(7) & a(7) & a(7 downto 6);
--	elsif (b(2 downto 0) = "111")then
--		s <= a(7) & a(7) & a(7) & a(7) & a(7) & a(7) & a(7) & a(7) ;
--	else 
--		s <= x"ZZ";
--	end if;
--end process;

	s1 <= a(7) & a(7 downto 1) when b(0) = '1' else a;  
	s2 <= s1(7) & s1(7) & s1(7 downto 2) when b(1) = '1' else s1;  
	s<= s2(7) & s2(7) & s2(7) & s2(7) & s2(7 downto 4) when b(2) = '1' else s2;
end beh;

