




--
--- code for timings with reset
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;--for conv_integer

entity project is

port( clk : in std_logic;
     	pc : in std_logic_vector(10 downto 0);---11 
	rst: in std_logic;
	alu_logic, load_logic, store_logic, 
	branch_logic : out std_logic
      	);
end project;

architecture behavioral of project is
constant clock_period : time := 20 ns;
begin
process(clk, rst)
--process(all)

variable int :integer;
begin
int := conv_integer(pc);

	if (clk = '1' and clk'event) then
		if (rst = '1') then
			alu_logic <= '0';
			load_logic <= '0';
			store_logic <= '0';
			branch_logic <= '0';
		else
			if (int >= 0 and int <= 500) then  -- alu/j
   				--alu_logic <= '1';
				--alu_logic <= '1' after 20 ns;
				alu_logic <= '1' after 1*clock_period;			
				load_logic <= '0';
				store_logic <= '0';
				branch_logic <= '0';
			elsif (int >= 504 and int <= 600) then --load
   				--load_logic <= '1';
				--load_logic <= '1' after 40 ns;
				load_logic <= '1' after 2*clock_period;
				alu_logic <= '0';
				store_logic <= '0';
				branch_logic <= '0';
			elsif (int >= 604 and int <= 700) then -- store
   				--store_logic <= '1';
				--store_logic <= '1' after 60 ns;
				store_logic <= '1' after 3*clock_period;			
				alu_logic <= '0';
				load_logic <= '0';
				branch_logic <= '0';
			else --- br/j
   				--branch_logic <= '1';
				--branch_logic <= '1' after 80 ns;
				branch_logic <= '1' after 4*clock_period;			
				alu_logic <= '0';
				load_logic <= '0';
				store_logic <= '0';

			end if;
		end if; --rst
	end if;--clk
end process;
end behavioral;