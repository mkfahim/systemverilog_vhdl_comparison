



------------- 2nd testbench for classify 
library ieee;
use ieee.std_logic_1164.all;

entity test_project is
end test_project;

architecture behave of test_project is

component project is 
port(   clk : in std_logic;
        pc : in std_logic_vector(10 downto 0);
	alu_logic, load_logic, store_logic, 
	branch_logic : out std_logic
      );
end component;

signal clk : std_logic;
signal pc : std_logic_vector(10 downto 0);
signal alu_logic, load_logic, store_logic, 
	branch_logic : std_logic;

begin

ic1 : project
port map( clk , pc ,alu_logic, load_logic, 
	store_logic, branch_logic);            
process
begin
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
end process;

process 
begin
   
   pc <= "00000000001";---assuming 'j' at invalid pc address value=1
   wait for 40 ns; --
           
   pc <= "00000000100";---assuming 'and' is at pc address value=4
   wait for 40 ns;--

   pc <= "00000001000";--- assuming 'addi' is at pc address value=8
   wait for 40 ns;

   pc <= "01000000000";-- assuming 'lw' is at pc address value=512
   wait for 40 ns;--

   pc <= "01010000000";---assuming 'sw' is at pc address value=640
   wait for 40 ns;--

   pc <= "01011000000";---assuming 'br' is at pc address value=704
   wait for 40 ns;---

end process;
end behave;

