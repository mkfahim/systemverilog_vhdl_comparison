------------- testbench for timings with reset, with two delaya for one signal
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

























--
--------------- testbench for timings with reset
--library ieee;
--use ieee.std_logic_1164.all;
--
--entity test_project is
--end test_project;
--
--architecture behave of test_project is
--
--component project is 
--port(   clk : in std_logic;
--        pc : in std_logic_vector(10 downto 0);
--	rst: in std_logic;
--	alu_logic, load_logic, store_logic, 
--	branch_logic : out std_logic
--      );
--end component;
--
--signal clk, rst : std_logic;
--signal pc : std_logic_vector(10 downto 0);
--signal alu_logic, load_logic, store_logic, 
--	branch_logic : std_logic;
--
--begin
--
--ic1 : project
--port map( clk , pc, rst ,alu_logic, load_logic, 
--	store_logic, branch_logic);            
--process
--begin
--    clk <= '1'; 
--    wait for 10 ns;
--    clk <= '0'; 
--    wait for 10 ns;
--end process;
--
--process 
--begin
--   pc <= "00000000100";---reset
--   rst <='1';
--   wait for 100 ns;--
--
--   pc <= "00000000100";---assuming 'and' is at pc address value=4
--   rst <= '0';
--   wait for 100 ns;--
--
--   pc <= "01000000000";-- assuming 'lw' is at pc address value=512
--   rst <= '0';
--   wait for 100 ns;--
--
--   pc <= "01010000000";---assuming 'sw' is at pc address value=640
--   rst <= '0';
--   wait for 100 ns;--
--
--   pc <= "01011000000";---assuming 'br' is at pc address value=704
--   rst <= '0';
--   wait for 100 ns;--
--
--   pc <= "XXXXXXXXXXX";---reset
--   rst <= '1';
--   wait for 100 ns;--
--
--   wait;
--
--end process;
--end behave;
















-------original code
--library ieee;
--use ieee . std_logic_1164.all;
--use ieee . std_logic_arith.all;
--use ieee . std_logic_unsigned.all;
--
--entity test_project is
--end test_project;
--
--architecture behave of test_project is
--
--component project is 
--port( clk : in std_logic;
--      pc : in std_logic_vector(10 downto 0);
--      icachehit : in std_logic;
--      rst , w_r , dcachehit : in std_logic;
--      mem_read , mem_write : out std_logic;
--      mdr , alu_done , ld_done , str_done : out std_logic;
--      inv_addr , dcache_read , dcache_write , icache_write : out std_logic 
--      );
--end component;
--
--signal clk : std_logic;
--signal pc : std_logic_vector(10 downto 0);
--signal icachehit : std_logic;
--signal rst , w_r , dcachehit : std_logic;
--signal mem_read , mem_write : std_logic;
--signal mdr , alu_done , ld_done , str_done : std_logic;
--signal inv_addr , dcache_read , dcache_write , icache_write : std_logic;
--
--begin
--
--ic1 : project 
--port map(   clk , pc , icachehit , rst , w_r , dcachehit , mem_read , mem_write ,
--            mdr , alu_done , ld_done , str_done , inv_addr ,
--            dcache_read , dcache_write , icache_write);
--            
--process
--begin
--    clk <= '0';
--    wait for 10 ns;
--    clk <= '1';
--    wait for 10 ns;
--end process;
--
--process 
--begin
--   
--   -- for invalid pc address 
--   pc <= "00000000001";--- assuming 'j' at invalid pc address value=1
--   wait for 100 ns; 
--
--   -- for alu I-cache miss            
--   pc <= "00000000100";----- assuming 'and' is at pc address value=4
--   icachehit <= '0';
--   wait for 200 ns;
--
--   -- for alu Icache hit
--   pc <= "00000001000";--- assuming 'addi' is at pc address value=8
--   icachehit <= '1';
--   wait for 200 ns;
--
--   -- for load I-cache and D-cache hit
--   pc <= "01000000000";-- assuming 'lw' is at pc address value=512
--   icachehit <= '1';
--   dcachehit <= '1';
--   rst <= '0';
--   w_r <= '1';
--   wait for 200 ns;
--
--   ---- for load Icache and Dcache miss
--   pc <= "01000000000";---- 'lw' is at pc address value=512
--   icachehit <= '0';
--   dcachehit <= '0';
--   rst <= '0';
--   w_r <= '1';
--   wait for 200 ns;
--
--   -- for load Icache hit and Dcache miss
--   pc <= "01000000000";--'lw' is at pc address value=512
--   icachehit <= '1';
--   dcachehit <= '0';
--   rst <= '0';
--   w_r <= '1';
--   wait for 200 ns;
--
--   -- for load I-cache miss and D-cache hit
--   pc <= "01000000000";--'lw' is at pc address value=512
--   icachehit <= '0';
--   dcachehit <= '1';
--   rst <= '0';
--   w_r <= '1';
--   wait for 200 ns;
--
--   --- for store I-cache miss and D-cache hit
--   pc <= "01010000000";--- assuming 'sw' is at pc address value=640
--   icachehit<='0';
--   dcachehit<='1';
--   rst <= '0';
--   w_r <= '0';
--   wait for 200 ns;
--
--   -- for store I-cache and D-cache miss
--   pc <= "01010000000";---'sw' is at pc address value=640
--   icachehit <= '0';
--   dcachehit <= '0';
--   rst <= '0';
--   w_r <= '0';
--   wait for 200 ns;
--
--   -- for store Icache hit Dcache miss
--   pc <= "01010000000";---'sw' is at pc address value=640
--   icachehit <= '1';
--   dcachehit <= '0';
--   rst <= '0';
--   w_r <= '0';
--   wait for 200 ns;
--
--   -- for store I-cache and D-cache hit
--   pc <= "01010000000";---'sw' is at pc address value=640
--   icachehit <= '1';
--   dcachehit <= '1';
--   rst <= '0';
--   w_r <= '0';
--   wait for 200 ns;
--   wait;
--
--end process;
--end behave;
--


-------modified code for Write thru/No write Allocate
--library ieee;
--use ieee . std_logic_1164.all;
--use ieee . std_logic_arith.all;
--use ieee . std_logic_unsigned.all;
--
--entity test_project is
--end test_project;
--
--architecture behave of test_project is
--
--component project is 
--port( clk : in std_logic;
--      pc : in std_logic_vector(10 downto 0);
--      icachehit : in std_logic;
--      rst , w_r , dcachehit : in std_logic;
--      mem_read , mem_write : out std_logic;
--      mdr , alu_done , ld_done , str_done, ir : out std_logic;
--      inv_addr , dcache_read , dcache_write , icache_write : out std_logic 
--      );
--end component;
--
--signal clk : std_logic;
--signal pc : std_logic_vector(10 downto 0);
--signal icachehit : std_logic;
--signal rst , w_r , dcachehit : std_logic;
--signal mem_read , mem_write : std_logic;
--signal mdr , alu_done , ld_done , str_done, ir : std_logic;
--signal inv_addr , dcache_read , dcache_write , icache_write : std_logic;
--
--begin
--
--ic1 : project 
--port map(   clk , pc , icachehit , rst , w_r , dcachehit , mem_read , mem_write ,
--            mdr , alu_done , ld_done , str_done , ir , inv_addr ,
--            dcache_read , dcache_write , icache_write);
--            
--process
--begin
--    clk <= '1';
--    wait for 10 ns;
--    clk <= '0';
--    wait for 10 ns;
--end process;
--
--process 
--begin
--   
--   -- for rst 
--   pc <= "XXXXXXXXXXX";-- 
--   icachehit <= 'X';
--   dcachehit <= 'X';
--   rst <= '1';
--   w_r <= 'X';
--   wait for 100 ns;--200ns
--
--   -- for invalid pc address 
--   pc <= "00000000001";--- assuming 'j' at invalid pc address value=1
--   rst <= '0';
--   wait for 400 ns; --100ns
--
--   -- for load I-cache and D-cache hit
--   pc <= "01000000000";-- assuming 'lw' is at pc address value=512
--   icachehit <= '1';
--   dcachehit <= '1';
--   rst <= '0';
--   w_r <= '1';
--   wait for 400 ns;--200ns
--
--   -- for store I-cache and D-cache miss
--   pc <= "01010000000";---'sw' is at pc address value=640
--   icachehit <= '0';
--   dcachehit <= '0';
--   rst <= '0';
--   w_r <= '0';
--   wait for 400 ns;--200ns takes almost all 400 ns for Write thru/No write Allocate
--
--   -- for alu Icache hit
--   pc <= "00000001000";--- assuming 'addi' is at pc address value=8
--   icachehit <= '1';
--   rst <= '0';
--   wait for 400 ns;--200ns
--
--   ---- for load Icache and Dcache miss
--   pc <= "01000000000";---- 'lw' is at pc address value=512
--   icachehit <= '0';
--   dcachehit <= '0';
--   rst <= '0';
--   w_r <= '1';
--   wait for 400 ns;-- 200ns
--
--   --- for store I-cache miss and D-cache hit
--   pc <= "01010000000";--- assuming 'sw' is at pc address value=640
--   icachehit<='0';
--   dcachehit<='1';
--   rst <= '0';
--   w_r <= '0';
--   wait for 400 ns;---200ns
--
--   -- for load Icache hit and Dcache miss
--   pc <= "01000000000";--'lw' is at pc address value=512
--   icachehit <= '1';
--   dcachehit <= '0';
--   rst <= '0';
--   w_r <= '1';
--   wait for 400 ns;---200ns
--
--   -- for alu I-cache miss            
--   pc <= "00000000100";----- assuming 'and' is at pc address value=4
--   icachehit <= '0';
--   rst <= '0';
--   wait for 400 ns;--200ns
--
--   -- for store Icache hit Dcache miss
--   pc <= "01010000000";---'sw' is at pc address value=640
--   icachehit <= '1';
--   dcachehit <= '0';
--   rst <= '0';
--   w_r <= '0';
--   wait for 400 ns;--200ns
--
--   -- for load I-cache miss and D-cache hit
--   pc <= "01000000000";--'lw' is at pc address value=512
--   icachehit <= '0';
--   dcachehit <= '1';
--   rst <= '0';
--   w_r <= '1';
--   wait for 400 ns;---200ns
--
--   -- for store I-cache and D-cache hit
--   pc <= "01010000000";---'sw' is at pc address value=640
--   icachehit <= '1';
--   dcachehit <= '1';
--   rst <= '0';
--   w_r <= '0';
--   wait for 400 ns;--200ns
--
--   -- for reset 
--   pc <= "01010000000";---'sw' is at pc address value=640
--   icachehit <= '1';
--   dcachehit <= '1';
--   rst <= '1';
--   w_r <= '0';
--   wait for 100 ns;--200ns
--   wait;
--
--end process;
--end behave;
----




-------modified code for Write back/Write Allocate
--library ieee;
--use ieee . std_logic_1164.all;
--use ieee . std_logic_arith.all;
--use ieee . std_logic_unsigned.all;
--
--entity test_project is
--end test_project;
--
--architecture behave of test_project is
--
--component project is 
--port( clk : in std_logic;
--      pc : in std_logic_vector(10 downto 0);
--      icachehit : in std_logic;
--      rst , w_r , dcachehit : in std_logic;
--      mem_read , mem_write : out std_logic;
--      mdr , alu_done , ld_done , str_done, ir : out std_logic;
--      inv_addr , dcache_read , dcache_write , icache_write : out std_logic 
--      );
--end component;
--
--signal clk : std_logic;
--signal pc : std_logic_vector(10 downto 0);
--signal icachehit : std_logic;
--signal rst , w_r , dcachehit : std_logic;
--signal mem_read , mem_write : std_logic;
--signal mdr , alu_done , ld_done , str_done, ir : std_logic;
--signal inv_addr , dcache_read , dcache_write , icache_write : std_logic;
--
--begin
--
--ic1 : project 
--port map(   clk , pc , icachehit , rst , w_r , dcachehit , mem_read , mem_write ,
--            mdr , alu_done , ld_done , str_done , ir , inv_addr ,
--            dcache_read , dcache_write , icache_write);
--            
--process
--begin
--    clk <= '1';
--    wait for 10 ns;
--    clk <= '0';
--    wait for 10 ns;
--end process;
--
--process 
--begin
--   
--   -- for rst 
--   pc <= "XXXXXXXXXXX";-- 
--   icachehit <= 'X';
--   dcachehit <= 'X';
--   rst <= '1';
--   w_r <= 'X';
--   wait for 100 ns;--200ns
--
--   -- for invalid pc address 
--   pc <= "00000000001";--- assuming 'j' at invalid pc address value=1
--   rst <= '0';
--   wait for 500 ns; 
--
--   -- for load I-cache and D-cache hit
--   pc <= "01000000000";-- assuming 'lw' is at pc address value=512
--   icachehit <= '1';
--   dcachehit <= '1';
--   rst <= '0';
--   w_r <= '1';
--   wait for 500 ns;--
--
--   -- for store I-cache and D-cache miss
--   pc <= "01010000000";---'sw' is at pc address value=640
--   icachehit <= '0';
--   dcachehit <= '0';
--   rst <= '0';
--   w_r <= '0';
--   wait for 500 ns;-- requires almost all 500 ns for Write back/Write allocate
--
--   -- for alu Icache hit
--   pc <= "00000001000";--- assuming 'addi' is at pc address value=8
--   icachehit <= '1';
--   rst <= '0';
--   wait for 500 ns;--
--
--   ---- for load Icache and Dcache miss
--   pc <= "01000000000";---- 'lw' is at pc address value=512
--   icachehit <= '0';
--   dcachehit <= '0';
--   rst <= '0';
--   w_r <= '1';
--   wait for 500 ns;-- 
--
--   --- for store I-cache miss and D-cache hit
--   pc <= "01010000000";--- assuming 'sw' is at pc address value=640
--   icachehit<='0';
--   dcachehit<='1';
--   rst <= '0';
--   w_r <= '0';
--   wait for 500 ns;---
--
--   -- for load Icache hit and Dcache miss
--   pc <= "01000000000";--'lw' is at pc address value=512
--   icachehit <= '1';
--   dcachehit <= '0';
--   rst <= '0';
--   w_r <= '1';
--   wait for 500 ns;---
--
--   -- for alu I-cache miss            
--   pc <= "00000000100";----- assuming 'and' is at pc address value=4
--   icachehit <= '0';
--   rst <= '0';
--   wait for 500 ns;--
--
--   -- for store Icache hit Dcache miss
--   pc <= "01010000000";---'sw' is at pc address value=640
--   icachehit <= '1';
--   dcachehit <= '0';
--   rst <= '0';
--   w_r <= '0';
--   wait for 500 ns;--
--
--   -- for load I-cache miss and D-cache hit
--   pc <= "01000000000";--'lw' is at pc address value=512
--   icachehit <= '0';
--   dcachehit <= '1';
--   rst <= '0';
--   w_r <= '1';
--   wait for 500 ns;---
--
--   -- for store I-cache and D-cache hit
--   pc <= "01010000000";---'sw' is at pc address value=640
--   icachehit <= '1';
--   dcachehit <= '1';
--   rst <= '0';
--   w_r <= '0';
--   wait for 500 ns;--200ns
--
--   -- for reset 
--   pc <= "01010000000";---'sw' is at pc address value=640
--   icachehit <= '1';
--   dcachehit <= '1';
--   rst <= '1';
--   w_r <= '0';
--   wait for 100 ns;--200ns
--   wait;
--
--end process;
--end behave;
--




--------------- for classify 
--library ieee;
--use ieee . std_logic_1164.all;
--use ieee . std_logic_arith.all;
--use ieee . std_logic_unsigned.all;
--
--entity test_project is
--end test_project;
--
--architecture behave of test_project is
--
--component project is 
--port( clk : in std_logic;
--      pc : in std_logic_vector(10 downto 0);
--	F : out std_logic_vector(1 downto 0)
--      );
--end component;
--
--signal clk : std_logic;
--signal pc : std_logic_vector(10 downto 0);
--signal F: std_logic_vector(1 downto 0);
--
--begin
--
--ic1 : project
--port map(   clk , pc , F);            
--process
--begin
--    clk <= '0';
--    wait for 10 ns;
--    clk <= '1';
--    wait for 10 ns;
--end process;
--
--process 
--begin
--   
--   -- for invalid pc address 
--   pc <= "00000000001";--- assuming 'j' at invalid pc address value=1
--   wait for 400 ns; --100ns
--
--   -- for alu I-cache miss            
--   pc <= "00000000100";----- assuming 'and' is at pc address value=4
--   wait for 40 ns;--200ns
--
--   -- for alu Icache hit
--   pc <= "00000001000";--- assuming 'addi' is at pc address value=8
--   wait for 40 ns;--200ns
--
--   -- for load I-cache and D-cache hit
--   pc <= "01000000000";-- assuming 'lw' is at pc address value=512
--   wait for 40 ns;--200ns
--
--   ---- for load Icache and Dcache miss
--   pc <= "01000000000";---- 'lw' is at pc address value=512
--   wait for 40 ns;-- 200ns
--
--   -- for load Icache hit and Dcache miss
--   pc <= "01000000000";--'lw' is at pc address value=512
--   wait for 40 ns;---200ns
--
--   -- for load I-cache miss and D-cache hit
--   pc <= "01000000000";--'lw' is at pc address value=512
--   wait for 40 ns;---200ns
--
--   --- for store I-cache miss and D-cache hit
--   pc <= "01010000000";--- assuming 'sw' is at pc address value=640
--   wait for 40 ns;---200ns
--
--   -- for store I-cache and D-cache miss
--   pc <= "01010000000";---'sw' is at pc address value=640
--   wait for 40 ns;--200ns
--
--   -- for store Icache hit Dcache miss
--   pc <= "01010000000";---'sw' is at pc address value=640
--   wait for 40 ns;--200ns
--
--   -- for store I-cache and D-cache hit
--   pc <= "01010000000";---'sw' is at pc address value=640
--   wait for 40 ns;--200ns
--
--end process;
--end behave;


--------------- for validity 
--library ieee;
--use ieee . std_logic_1164.all;
--use ieee . std_logic_arith.all;
--use ieee . std_logic_unsigned.all;
--
--entity test_project is
--end test_project;
--
--architecture behave of test_project is
--
--component project is 
--port( clk : in std_logic;
--      pc : in std_logic_vector(10 downto 0);
--	val : out std_logic
--      );
--end component;
--
--signal clk : std_logic;
--signal pc : std_logic_vector(10 downto 0);
--signal val: std_logic;
--
--begin
--
--ic1 : project
--port map(   clk , pc , val);            
--process
--begin
--    clk <= '0';
--    wait for 10 ns;
--    clk <= '1';
--    wait for 10 ns;
--end process;
--
--process 
--begin
--   
--   -- for invalid pc address 
--   pc <= "00000000001";--- assuming 'j' at invalid pc address value=1
--   wait for 40 ns; --100ns
--
--   -- for alu I-cache miss            
--   pc <= "00000000100";----- assuming 'and' is at pc address value=4
--   wait for 40 ns;--200ns
--
--   -- for alu Icache hit
--   pc <= "00000001000";--- assuming 'addi' is at pc address value=8
--   wait for 40 ns;--200ns
--
--   -- for load I-cache and D-cache hit
--   pc <= "01000000000";-- assuming 'lw' is at pc address value=512
--   wait for 40 ns;--200ns
--
--   ---- for load Icache and Dcache miss
--   pc <= "01000000000";---- 'lw' is at pc address value=512
--   wait for 40 ns;-- 200ns
--
--   -- for load Icache hit and Dcache miss
--   pc <= "01000000000";--'lw' is at pc address value=512
--   wait for 40 ns;---200ns
--
--   -- for load I-cache miss and D-cache hit
--   pc <= "01000000000";--'lw' is at pc address value=512
--   wait for 40 ns;---200ns
--
--   --- for store I-cache miss and D-cache hit
--   pc <= "01010000000";--- assuming 'sw' is at pc address value=640
--   wait for 40 ns;---200ns
--
--   -- for store I-cache and D-cache miss
--   pc <= "01010000000";---'sw' is at pc address value=640
--   wait for 40 ns;--200ns
--
--   -- for store Icache hit Dcache miss
--   pc <= "01010000000";---'sw' is at pc address value=640
--   wait for 40 ns;--200ns
--
--   -- for store I-cache and D-cache hit
--   pc <= "01010000000";---'sw' is at pc address value=640
--   wait for 40 ns;--200ns
--
--end process;
--end behave;
--


--------------- for data cache check
--library ieee;
--use ieee . std_logic_1164.all;
--
--entity test_project is
--end test_project;
--
--architecture behave of test_project is
--
--component project is 
--port( clk : in std_logic;
--      F : in std_logic_vector(1 downto 0);
--	rst, dcachehit, w_r : in std_logic;
--	alu_logic, load_hit_logic, store_hit_logic, 
--	load_miss_logic, store_miss_logic : out std_logic
--      );
--end component;
--
--signal clk : std_logic;
--signal F : std_logic_vector(1 downto 0);
--signal rst, dcachehit, w_r: std_logic;
--signal alu_logic, load_hit_logic, store_hit_logic, 
--	load_miss_logic, store_miss_logic : std_logic;
--
--begin
--
--ic1 : project
--port map(   clk , F , rst, dcachehit, w_r, alu_logic, load_hit_logic, store_hit_logic, 
--	load_miss_logic, store_miss_logic);         
--process
--begin
--    clk <= '0';
--    wait for 10 ns;
--    clk <= '1';
--    wait for 10 ns;
--end process;
--
--process 
--begin
--   
--   -- for reset 
--   rst <= '1';---
--   --F <= "XX";
--   wait for 40 ns; --100ns
--   
--   -- for alu/br/j
--   F <= "00";
--   rst <= '0';
--   wait for 40 ns;---200ns
--
--   -- for load and Dcache miss
--   F <= "01";
--   dcachehit <= '0';
--   rst <= '0';
--   w_r <= '1';
--   wait for 40 ns;---200ns
--
--   -- for load and D-cache hit
--   F <= "01";
--   dcachehit <= '1';
--   rst <= '0';
--   w_r <= '1';
--   wait for 40 ns;---200ns
--
--
--   -- for store Dcache miss
--   F <= "10";
--   dcachehit <= '0';
--   rst <= '0';
--   w_r <= '0';
--   wait for 40 ns;--200ns
--
--   -- for store and D-cache hit
--   F <= "10";
--   dcachehit <= '1';
--   rst <= '0';
--   w_r <= '0';
--   wait for 40 ns;--200ns
--
--end process;
--end behave;
--








------------- 2nd testbench for classify to empleement  functions
--library ieee;
--use ieee.std_logic_1164.all;
--
--entity test_project is
--end test_project;
--
--architecture behave of test_project is
--
--component project is 
--port(   clk : in std_logic;
--        pc : in std_logic_vector(10 downto 0);
--	alu_logic, load_logic, store_logic, 
--	branch_logic : out std_logic
--      );
--end component;
--
--signal clk : std_logic;
--signal pc : std_logic_vector(10 downto 0);
--signal alu_logic, load_logic, store_logic, 
--	branch_logic : std_logic;
--
--begin
--
--ic1 : project
--port map( clk , pc ,alu_logic, load_logic, 
--	store_logic, branch_logic);            
--process
--begin
--    clk <= '0';
--    wait for 10 ns;
--    clk <= '1';
--    wait for 10 ns;
--end process;
--
--process 
--begin
--   
--   pc <= "00000000001";---assuming 'j' at invalid pc address value=1
--   wait for 40 ns; --
--           
--   pc <= "00000000100";---assuming 'and' is at pc address value=4
--   wait for 40 ns;--
--
--   pc <= "00000001000";--- assuming 'addi' is at pc address value=8
--   wait for 40 ns;---
--
--   pc <= "01000000000";-- assuming 'lw' is at pc address value=512
--   wait for 40 ns;--
--
--   pc <= "01010000000";---assuming 'sw' is at pc address value=640
--   wait for 40 ns;--
--
--   pc <= "01011000000";---assuming 'br' is at pc address value=704
--   wait for 40 ns;---
--   wait;
--
--end process;
--end behave;



--------------- testbench for timings 
--library ieee;
--use ieee.std_logic_1164.all;
--
--entity test_project is
--end test_project;
--
--architecture behave of test_project is
--
--component project is 
----generic(clock_period: time);
--port(   clk : in std_logic;
--        pc : in std_logic_vector(10 downto 0);
--	alu_logic, load_logic, store_logic, 
--	branch_logic : out std_logic
--      );
--end component;
--
--signal clk : std_logic;
--signal pc : std_logic_vector(10 downto 0);
--signal alu_logic, load_logic, store_logic, 
--	branch_logic : std_logic;
--constant clock_period : time := 20 ns;
--begin
--
--ic1 : project
----generic map(clock_period)
--port map( clk , pc ,alu_logic, load_logic, 
--	store_logic, branch_logic);            
--process
--begin
--    clk <= '0'; 
--    wait for 10 ns;
--    --wait for clock_period/2;
--    clk <= '1'; 
--    wait for 10 ns;
--    --wait for clock_period/2;
--end process;
--
--process 
--begin
--
--   pc <= "00000000100";---assuming 'and' is at pc address value=4
--   --wait for 40 ns;--
--   wait for 100 ns;--
--
--   pc <= "01000000000";-- assuming 'lw' is at pc address value=512
--   --wait for 40 ns;--
--   wait for 100 ns;--
--
--   pc <= "01010000000";---assuming 'sw' is at pc address value=640
--   --wait for 40 ns;--
--   wait for 100 ns;--
--
--   pc <= "01011000000";---assuming 'br' is at pc address value=704
--   --wait for 40 ns;---
--   wait for 100 ns;--
--
--   wait;
--
--end process;
--end behave;







--






----
--------------- testbench for timings with reset, with two delaya for one signal
--library ieee;
--use ieee.std_logic_1164.all;
--
--entity test_project is
--end test_project;
--
--architecture behave of test_project is
--
--component project is 
--port(   clk : in std_logic;
--        pc : in std_logic_vector(10 downto 0);
--	rst: in std_logic;
--	alu_logic, load_logic, store_logic, 
--	branch_logic : out std_logic
--      );
--end component;
--
--signal clk, rst : std_logic;
--signal pc : std_logic_vector(10 downto 0);
--signal alu_logic, load_logic, store_logic, 
--	branch_logic : std_logic;
--
--begin
--
--ic1 : project
--port map( clk , pc, rst ,alu_logic, load_logic, 
--	store_logic, branch_logic);            
--process
--begin
--    clk <= '1'; 
--    wait for 10 ns;
--    clk <= '0'; 
--    wait for 10 ns;
--end process;
--
--process 
--begin
--   pc <= "00000000100";---reset
--   rst <='1';
--   wait for 100 ns;--
--
--   pc <= "00000000100";---assuming 'and' is at pc address value=4
--   rst <= '0';
--   wait for 200 ns;--
--
--   pc <= "01000000000";-- assuming 'lw' is at pc address value=512
--   rst <= '0';
--   wait for 200 ns;--
--
--   pc <= "01010000000";---assuming 'sw' is at pc address value=640
--   rst <= '0';
--   wait for 200 ns;--
--
--   pc <= "01011000000";---assuming 'br' is at pc address value=704
--   rst <= '0';
--   wait for 200 ns;--
--
--   pc <= "XXXXXXXXXXX";---reset
--   rst <= '1';
--   wait for 100 ns;--
--
--   wait;
--
--end process;
--end behave;
----
--















