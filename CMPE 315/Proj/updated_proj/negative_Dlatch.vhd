library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;       

entity negative_Dlatch is                      
  port ( d   : in  std_logic;
         clk : in  std_logic;
         q   : out std_logic;
         qbar: out std_logic); 
end negative_Dlatch;                          

architecture structural of negative_Dlatch is 

 
  
begin
  
  output: process (d,clk)                  

  begin                          
    if clk = '0' then 
    q <= d;
    qbar <= not d ;
 end if; 
 end process output;        
                             
end structural;

