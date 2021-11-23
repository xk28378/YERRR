library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;       

entity tran_gate is                      
  port ( sel   : in std_logic;
         input : in std_logic;
         output:out std_logic);
end tran_gate;                          

architecture structural of tran_gate is 

begin
  txprocess: process (sel, input)                 
  begin                           
    if (sel = '0') then
      output <= input;
    else
      output <= 'Z';
    end if;
  end process txprocess;   
 
end structural;
