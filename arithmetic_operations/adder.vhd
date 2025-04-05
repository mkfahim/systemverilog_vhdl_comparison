
library ieee;
use ieee.std_logic_1164.all; 
entity adder is  
port ( s: out std_logic;
       co: out std_logic;
       a: in std_logic;
       b: in std_logic;
       ci:in std_logic);
end adder;
architecture behav of adder is

begin   
   s <= a xor b xor ci;
   co <= (a and b) or (b and ci) or (ci and a); 
   
end behav;