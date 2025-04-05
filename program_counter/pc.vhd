

-- PC: program counter
---- behavioral model
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity P_C is
Port( pc: inout std_logic_vector (7 downto 0);
      power : in std_logic;
      clk : in std_logic;
      branch_pc : in std_logic_vector (7 downto 0);
      branch_en : in std_logic;
      stop_en : in std_logic;
      next_pc: inout std_logic_vector (7 downto 0));
end P_C;

architecture behav of P_C is 
signal 	inc_pc, temp_pc0, temp_pc1 : std_logic_vector(7 downto 0);   

begin 
process (clk)
begin 
	if clk'event and clk = '1' then
		pc <= next_pc;
	end if;
end process;

--process(all)-- enable vhdl 2008 in properties of file in projext window
--process(power, stop_en, branch_en, pc)
--begin
--	if (power = '1')then
--		if (stop_en = '1')then
--			next_pc <= pc;
--		else 
--			if (branch_en = '1')then
--				next_pc <= branch_pc;
--			else
--				next_pc <= pc + 1;
--			end if;
--		end if;
--	else
--		next_pc <= x"00"; 
--	end if;
--end process;

--	next_pc <= x"00" when power = '0' else 
--		   pc when stop_en = '1' else 
--		   branch_pc when branch_en = '1' else 
--		   pc + 1;	

	inc_pc <= pc + 1;
	temp_pc0 <= branch_pc when branch_en = '1' else inc_pc;
	temp_pc1 <= pc when stop_en = '1' else temp_pc0;
	next_pc <= temp_pc1 when power = '1' else x"00";
end behav;

