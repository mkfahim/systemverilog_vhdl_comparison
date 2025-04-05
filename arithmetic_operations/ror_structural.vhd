

library ieee;
use ieee.std_logic_1164.all; 
entity mux2to1_8 is  
port ( in0: in std_logic_vector ( 7 downto 0);
       in1: in std_logic_vector (7 downto 0);
       sel: in std_logic;
       o: out std_logic_vector(7 downto 0));  
end mux2to1_8;

architecture str of mux2to1_8 is

begin
	o <= in1 when sel = '1' else in0;
end str;


----- behavioral model rotate right b is only for 2:0 bits for ror
library ieee;
use ieee.std_logic_1164.all; 
entity rotate_right_8 is  
port ( s: out std_logic_vector(7 downto 0);
       a: in std_logic_vector(7 downto 0);
       b: in std_logic_vector(7 downto 0));
end rotate_right_8;

architecture behav of rotate_right_8 is

component mux2to1_8 is  
port ( in0: in std_logic_vector ( 7 downto 0);
       in1: in std_logic_vector (7 downto 0);
       sel: in std_logic;
       o: out std_logic_vector(7 downto 0));  
end component;

signal s1, s2: std_logic_vector(7 downto 0); 

begin  

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

	--s1 <= a(0) & a(7 downto 1) when b(0) = '1' else a; 
	mux1:   mux2to1_8 port map(a, a(0) & a(7 downto 1), b(0), s1);
	--s2 <= s1(1 downto 0) & s1(7 downto 2) when b(1) = '1' else s1;
	mux2:   mux2to1_8 port map(s1, s1(1 downto 0) & s1(7 downto 2), b(1), s2);
	--s <= s2(3 downto 0) & s2(7 downto 4) when b(2) = '1' else s2;
	mux4:   mux2to1_8 port map(s2, s2(3 downto 0) & s2(7 downto 4), b(2), s);
end behav;

