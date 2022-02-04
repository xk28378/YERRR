-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Mon Nov 29 23:13:36 2021


architecture structural of Dlatch is 

 
  
begin
  
  output: process (d,clk)                  

  begin                          
    if clk = '1' then 
    q <= d;
    qbar <= not d ;
 end if; 
 end process output;        
                             
end structural;
