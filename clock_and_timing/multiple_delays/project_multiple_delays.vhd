

------------------- code for timings with reset
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;----------------for conv_integer

entity project is

port( clk : in std_logic;
     	pc : in std_logic_vector(10 downto 0);
	rst: in std_logic;
	alu_logic, load_logic, store_logic, 
	branch_logic : out std_logic
      	);
end project;

architecture behavioral of project is

begin
--process(clk, rst)
process (rst,pc)---- this works for double delay
--process (clk,pc)
--process (pc)
--process(all)-- works only with VHDL 2008
--process (clk)

variable int :integer;
begin
int := conv_integer(pc);

--------------Asynxhronous reset	
	if (rst = '1') then
		alu_logic <= '0';
		load_logic <= '0';
		store_logic <= '0';
		branch_logic <= '0';
	else
		if (clk = '1' and clk'event) then
			if (int >= 0 and int <= 500) then  -- alu/j
   				--alu_logic <= '1';
				--alu_logic <= '1' after 20 ns;
				alu_logic <= '1' after 1*20 ns,'0' after 2*20 ns;-- works with rst, pc in process	
				load_logic <= '0';
				store_logic <= '0';
				branch_logic <= '0';
--			
			elsif (int >= 504 and int <= 600) then --load
   				--load_logic <= '1';
				--load_logic <= '1' after 40 ns;	
				load_logic <= '1' after 2*20 ns,'0' after 3*20 ns;
				alu_logic <= '0';
				store_logic <= '0';
				branch_logic <= '0';
--				
			elsif (int >= 604 and int <= 700) then -- store
   				--store_logic <= '1';
				--store_logic <= '1' after 60 ns;
				store_logic <= '1' after 3*20 ns,'0' after 4*20 ns;			
				alu_logic <= '0';
				load_logic <= '0';
				branch_logic <= '0';
--		
			else --- br/j
   				--branch_logic <= '1';
				--branch_logic <= '1' after 80 ns;
				branch_logic <= '1' after 4*20 ns,'0' after 5*20 ns;	
				alu_logic <= '0';
				load_logic <= '0';
				store_logic <= '0';

			end if;
		end if; --clk
	end if;--rst

end process;
end behavioral;



