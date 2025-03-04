


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;--for conv_integer

entity project is
port( clk : in std_logic;
     	pc : in std_logic_vector(10 downto 0);---11 
	alu_logic, load_logic, store_logic, 
	branch_logic : out std_logic
      	);
end project;

architecture behavioral of project is

function classify (
	pc_addr : std_logic_vector(10 downto 0)) 
        return std_logic_vector is
	variable f : std_logic_vector(1 downto 0);
	variable int : integer;
begin
   	int := conv_integer(pc_addr);
	if (int >= 0 and int <= 500) then  -- alu/j
   		f := "00";
	elsif (int >= 504 and int <= 600) then --load
   		f := "01";
	elsif (int >= 604 and int <= 700) then -- store
   		f := "10";
	else --- br
   		f := "11";
	end if;
return(f);
end classify;
--signal F : std_logic_vector(1 downto 0);
begin
process(clk)
variable F : std_logic_vector(1 downto 0);
variable int :integer;
begin
int := conv_integer(pc);
	if (clk = '1' and clk'event) then
	--if (rising_edge (clk)) then
--		if (int >= 0 and int <= 500) then  -- alu/j
--   			alu_logic <= '1';
--		elsif (int >= 504 and int <= 600) then --load
--   			load_logic <= '1';
--		elsif (int >= 604 and int <= 700) then -- store
--   			store_logic <= '1';
--		else --- alu/j
--   			branch_logic <= '1';
--		end if;

--		if (int >= 0 and int <= 500) then  -- alu/j
--   			f := "00";
--		elsif (int >= 504 and int <= 600) then --load
--   			f := "01";
--		elsif (int >= 604 and int <= 700) then -- store
--   			f := "10";
--		else --- alu/br/j
--   			f := "11";
--		end if;

		F := classify(pc);--right
		--F <= classify(pc);--wrong

		if (F = "00") then
			alu_logic <= '1';
		elsif(F = "01") then
			load_logic <= '1';
		elsif(F = "10") then
			store_logic <= '1';
		else
			branch_logic <= '1';
		end if;
	end if;--clk
end process;
end behavioral;