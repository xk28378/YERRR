library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;  

entity or2 is
  port(
    INPUT1: in std_logic;
    INPUT2: in std_logic;
    OUTPUT: out std_logic
  );
end or2;

architecture structural of or2 is 
begin
  OUTPUT <= INPUT1 or INPUT2;
end structural;