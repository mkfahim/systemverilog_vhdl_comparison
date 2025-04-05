

library ieee;
use ieee.std_logic_1164.all;
entity dff_8 is
Port( d: in std_logic_vector (7 downto 0);
      clk : in std_logic;
      q : out std_logic_vector (7 downto 0));
end dff_8;

architecture str of dff_8 is  
begin

process (clk)
begin 
	if clk'event and clk = '1' then
		q <= d;
	end if;
end process;
end str;

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
--
--
library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;-- for +
entity inc_8 is  
port ( s: out std_logic_vector(7 downto 0);
       a: in std_logic_vector(7 downto 0));
end inc_8;
architecture str of inc_8 is
begin   
 	s <= a + x"01";  
	--s <= a + 1; 
end str;


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

component dff_8 is
Port( d: in std_logic_vector (7 downto 0);
      clk : in std_logic;
      q : out std_logic_vector (7 downto 0));
end component;

component inc_8 is  
port ( s: out std_logic_vector(7 downto 0);
       a: in std_logic_vector(7 downto 0));
end component;

component mux2to1_8 is  
port ( in0: in std_logic_vector ( 7 downto 0);
       in1: in std_logic_vector (7 downto 0);
       sel: in std_logic;
       o: out std_logic_vector(7 downto 0));  
end component;

signal 	inc_pc, temp_pc0, temp_pc1 : std_logic_vector(7 downto 0); 
begin 

--process (clk)
--begin 
--	if clk'event and clk = '1' then
--		pc <= next_pc;
--	end if;
--end process;
d: dff_8 port map(next_pc, clk, pc);

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

--	inc_pc <= pc + 1;	
--	temp_pc0 <= branch_pc when branch_en = '1' else inc_pc;
--	temp_pc1 <= pc when stop_en = '1' else temp_pc0;
--	next_pc <= temp_pc1 when power = '1' else x"00";

	myinc:  inc_8 port map(inc_pc, pc);
	mux0: mux2to1_8 port map(inc_pc, branch_pc, branch_en, temp_pc0);
	mux1: mux2to1_8 port map(temp_pc0, pc, stop_en, temp_pc1);
	mux2: mux2to1_8 port map(x"00", temp_pc1, power, next_pc);

end behav;


