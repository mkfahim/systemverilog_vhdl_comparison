
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

---- behavioral model shift left logic b is 2 to 0 for sll 
library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;-- for shift_left,unsigend and to_integer
entity shift_left_logic_8 is  
port ( s: out std_logic_vector(7 downto 0);
       a: in std_logic_vector(7 downto 0);
       b: in std_logic_vector(7 downto 0));
end shift_left_logic_8;

architecture behav of shift_left_logic_8 is

component mux2to1_8 is  
port ( in0: in std_logic_vector ( 7 downto 0);
       in1: in std_logic_vector (7 downto 0);
       sel: in std_logic;
       o: out std_logic_vector(7 downto 0));  
end component;  
signal s1, s2: std_logic_vector(7 downto 0);-- shift by 1,2...signals

begin 
--	 s  <= 	a when b(2 downto 0) = "000" else
--		a(6 downto 0) & '0' when b(2 downto 0) = "001" else 
--		a(5 downto 0) & "00" when b(2 downto 0) = "010" else
--		a(4 downto 0) & "000" when b(2 downto 0) = "011" else
--		a(3 downto 0) & "0000" when b(2 downto 0) = "100" else
--		a(2 downto 0) & "00000" when b(2 downto 0) = "101" else
--		a(1 downto 0) & "000000" when b(2 downto 0) = "110" else
--		a(0) & "0000000" when b(2 downto 0) = "111" else
--		x"ZZ";

   	--s1 <= a(6 downto 0) & '0' when b(0) = '1' else a;
	mux1:   mux2to1_8 port map(a, a(6 downto 0) & '0', b(0), s1);
	--s2 <= s1(5 downto 0) & "00" when b(1) = '1' else s1;
	mux2:   mux2to1_8 port map(s1, s1(5 downto 0) & "00", b(1), s2);
   	--s <= s2(3 downto 0) & "0000" when b(2) = '1' else s2;
	mux4:   mux2to1_8 port map(s2, s2(3 downto 0) & "0000", b(2), s);
end behav;
