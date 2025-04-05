
------------- testbench for timings with reset
library ieee;
use ieee.std_logic_1164.all;

entity test_project is
end test_project;

architecture behave of test_project is

component project is 
port(   clk : in std_logic;
        pc : in std_logic_vector(10 downto 0);
	rst: in std_logic;
	alu_logic, load_logic, store_logic, 
	branch_logic : out std_logic
      );
end component;

signal clk, rst : std_logic;
signal pc : std_logic_vector(10 downto 0);
signal alu_logic, load_logic, store_logic, 
	branch_logic : std_logic;

begin

ic1 : project
port map( clk , pc, rst ,alu_logic, load_logic, 
	store_logic, branch_logic);            
process
begin
    clk <= '1'; 
    wait for 10 ns;
    clk <= '0'; 
    wait for 10 ns;
end process;

process 
begin
   pc <= "00000000100";---reset
   rst <='1';
   wait for 100 ns;--

   pc <= "00000000100";---assuming 'and' is at pc address value=4
   rst <= '0';
   wait for 100 ns;--

   pc <= "01000000000";-- assuming 'lw' is at pc address value=512
   rst <= '0';
   wait for 100 ns;--

   pc <= "01010000000";---assuming 'sw' is at pc address value=640
   rst <= '0';
   wait for 100 ns;--

   pc <= "01011000000";---assuming 'br' is at pc address value=704
   rst <= '0';
   wait for 100 ns;--

   pc <= "XXXXXXXXXXX";---reset
   rst <= '1';
   wait for 100 ns;--

   wait;

end process;
end behave;




