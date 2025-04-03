
---- code for timings with reset, delay with wait, gives right output
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

begin

process
variable int :integer;
begin
int := conv_integer(pc);

	--if rst = '1' then ---Asynchronous rst
	if rst /= '0' then ---Asynchronous rst
		alu_logic <= '0';
		load_logic <= '0';
		store_logic <= '0';
		branch_logic <= '0';
    		wait until rst = '0' ; 
		--wait on rst;--works like above
	else
		--wait until clk'event and clk = '1';
		if (clk = '1' and clk'event) then --------Asynchronous rst works

			if (int >= 0 and int <= 500) then  -- alu/j
   				--alu_logic <= '1';
				load_logic <= '0';
				store_logic <= '0';
				branch_logic <= '0';
--				wait for 1*20 ns; alu_logic <= '1';
--				wait for 20 ns; alu_logic <= '0'; 
				for i in 1 to 1 loop wait until rising_edge(clk); end loop;
				alu_logic <= '1';
				for i in 1 to 1 loop wait until rising_edge(clk); end loop;
				alu_logic <= '0';

	 
			elsif (int >= 504 and int <= 600) then --load
   				--load_logic <= '1';
				alu_logic <= '0';
				store_logic <= '0';
				branch_logic <= '0';
--				wait for 2*20 ns; load_logic <= '1';
--				wait for 20 ns; load_logic <= '0';
				for i in 1 to 2 loop wait until rising_edge(clk); end loop;
				load_logic <= '1';
				for i in 1 to 1 loop wait until rising_edge(clk); end loop;
				load_logic <= '0';


			elsif (int >= 604 and int <= 700) then -- store
   				--store_logic <= '1';
				alu_logic <= '0';
				load_logic <= '0';
				branch_logic <= '0';
--				wait for 3*20 ns; store_logic <= '1';
--				wait for 20 ns; store_logic <= '0';
				for i in 1 to 3 loop wait until rising_edge(clk); end loop;
    				store_logic <= '1';
				for i in 1 to 1 loop wait until rising_edge(clk); end loop;
    				store_logic <= '0';	

			else --- br/j
   				--branch_logic <= '1';	
				alu_logic <= '0';
				load_logic <= '0';
				store_logic <= '0';
--				wait for 4*20 ns; branch_logic <= '1';
--				wait for 20 ns; branch_logic <= '0';
				for i in 1 to 4 loop wait until rising_edge(clk); end loop;
    				branch_logic <= '1';
				for i in 1 to 1 loop wait until rising_edge(clk); end loop;
    				branch_logic <= '0';			

			end if;
			wait on pc;
		end if;---clk
	end if; ---rst. Asysnchromous reset
	--wait on clk;----- use it only if rst = 1;
end process;
end behavioral;



