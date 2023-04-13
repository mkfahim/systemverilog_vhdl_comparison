library IEEE;
use IEEE.std_logic_1164.all;
entity and_gate is
    port(a : in std_logic;      
         b : in std_logic;     
         c : out std_logic);
end and_gate;

architecture behav of and_gate is
begin   
    c <= a AND b;
end behav;