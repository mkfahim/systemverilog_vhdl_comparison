

-- PC: program counter
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;-- for +
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
begin 

process (clk)
begin 
	if clk'event and clk = '1' then
		pc <= next_pc;
	end if;
end process;

process(power, stop_en, branch_en, pc)
begin
	if (power = '1')then
		if (stop_en = '1')then
			next_pc <= pc;
		else 
			if (branch_en = '1')then
				next_pc <= branch_pc;
			else
				next_pc <= pc + 1;
			end if;
		end if;
	else
		next_pc <= x"00"; 
	end if;
end process;

end behav;


