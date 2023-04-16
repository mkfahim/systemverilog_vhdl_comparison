
--ROM: implementation without input file
library ieee,std;
use ieee.std_logic_1164.all; 
--use ieee.numeric_std.all;-- for to_integer and unsigned
use ieee.std_logic_unsigned.all;--for conv_integer

entity program_rom is  
port ( pc: in std_logic_vector(7 downto 0);
       code: out std_logic_vector(15 downto 0));
end program_rom;

architecture str of program_rom is
type rom_type is array(10 downto 0) of std_logic_vector(15 downto 0);
--signal rom: rom_type:= (x"FFFF", 
--			x"9999", 
--			x"8888", 
--			x"7777", 
--			x"6666", 
--			x"5555",
--			x"4444", 
--			x"3333", 
--			x"2222", 
--			x"1111",
--			x"0000");
signal rom: rom_type;
begin
			rom(10)<= x"FFFF"; 
			rom(9)<= x"9999"; 
			rom(8)<= x"8888"; 
			rom(7)<= x"7777"; 
			rom(6)<= x"6666"; 
			rom(5)<= x"5555";
			rom(4)<= x"4444"; 
			rom(3)<= x"3333"; 
			rom(2)<= x"2222"; 
			rom(1)<= x"1111";
			rom(0)<= x"0000";

			--code <= rom(to_integer(unsigned(pc)));
			code <= rom(conv_integer(pc));
----use std_logic_vector pc as index for rom array	
end str;