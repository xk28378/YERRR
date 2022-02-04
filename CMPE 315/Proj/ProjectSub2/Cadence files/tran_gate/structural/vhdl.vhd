-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Mon Nov 29 23:10:23 2021


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
