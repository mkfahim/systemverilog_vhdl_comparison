

-- testbench for rom
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;-- for +b
entity test_bench is
end test_bench;

architecture behav of test_bench is
component program_rom is  
port ( pc: in std_logic_vector(7 downto 0);
       code: out std_logic_vector(15 downto 0));
end component;

signal code : std_logic_vector (15 downto 0);
signal pc: std_logic_vector ( 7 downto 0);

begin
uut:program_rom port map (pc, code);


stim_proc:process
begin 

	--pc <= "00000000";
	pc <= x"00";
	wait for 10 ns;

  	for i in 1 to 8 loop 
  		-- pc <= pc + "00000001";
   		--pc <= pc + x"01";
		pc <= pc + 2;
   		wait for 10 ns;
  	end loop;
   	pc <= "11111111";
   	wait for 10 ns;
	wait;
end process;

end behav;