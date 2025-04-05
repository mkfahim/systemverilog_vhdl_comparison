--- code for timings with reset, delay with wait
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
	wait until clk = '1'; -- for synchronous reset, works
	--wait until rising_edge(clk);
--		if (rst = '1') then
		if rst /= '0' then 
			alu_logic <= '0';
			load_logic <= '0';
			store_logic <= '0';
			branch_logic <= '0';
    			wait until rst = '0' ; 
  		end if ;
		--wait until clk = '1'; -- for Asynchronous reset, doesnt work

		if (int >= 0 and int <= 500) then  -- alu/j
   			--alu_logic <= '1';
			load_logic <= '0';
			store_logic <= '0';
			branch_logic <= '0';
			--alu_logic <= transport '1' after 1*20 ns;
			--alu_logic <= '1' after 1*20 ns;
			--wait for 1*20 ns; alu_logic <= '1';	
			--for i in 1 to 1 loop wait until rising_edge(clk); end loop;
			--for i in 1 to 1 loop wait until clk = '1'; end loop;
			--alu_logic <= '1';
			--for i in 1 to 1 loop wait until clk = '1';alu_logic <= '1';  end loop;
			for i in 1 to 1 loop alu_logic <= '1'; wait until (clk = '1')  ;  end loop;
	 
		elsif (int >= 504 and int <= 600) then --load
   			--load_logic <= '1';
			alu_logic <= '0';
			store_logic <= '0';
			branch_logic <= '0';
			--load_logic <= transport '1' after 1*20 ns;
			--load_logic <= '1' after 1*20 ns;
			--wait for 1*20 ns; load_logic <= '1';	
			--for i in 1 to 1 loop wait until rising_edge(clk); end loop;
			--for i in 1 to 1 loop wait until clk = '1'; end loop;
			--load_logic <= '1';
			--for i in 1 to 1 loop wait until clk = '1';load_logic <= '1';  end loop;
			for i in 1 to 1 loop load_logic <= '1'; wait until (clk = '1')  ;  end loop;

		elsif (int >= 604 and int <= 700) then -- store
   			--store_logic <= '1';
			alu_logic <= '0';
			load_logic <= '0';
			branch_logic <= '0';
			--store_logic <= transport '1' after 2*20 ns;
			--store_logic <= '1' after 2*20 ns;
			--wait for 2*20 ns; store_logic <= '1';
			--for i in 1 to 1 loop wait until rising_edge(clk); end loop;
			--for i in 1 to 1 loop wait until clk = '1'; end loop;
    			--store_logic <= '1';	
			--for i in 1 to 1 loop wait until clk = '1';store_logic <= '1';  end loop;	
			for i in 1 to 1 loop store_logic <= '1'; wait until (clk = '1')  ;  end loop;

		else --- br/j
   			--branch_logic <= '1';				
			alu_logic <= '0';
			load_logic <= '0';
			store_logic <= '0';
			--branch_logic <= transport '1' after 3*20 ns;
			--branch_logic <= '1' after 3*20 ns;
			--wait for 2*20 ns; branch_logic <= '1';
			--for i in 1 to 3 loop wait until rising_edge(clk); end loop;
			--for i in 1 to 3 loop wait until clk = '1'; end loop;
    			--branch_logic <= '1';	
			--for i in 1 to 1 loop wait until clk = '1';branch_logic <= '1';  end loop;
			for i in 1 to 1 loop branch_logic <= '1'; wait until (clk = '1')  ;  end loop;		

		end if;
end process;
end behavioral;






