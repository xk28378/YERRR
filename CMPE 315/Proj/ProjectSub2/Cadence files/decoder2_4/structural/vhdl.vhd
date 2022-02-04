-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Sat Nov 20 21:57:13 2021


 architecture structural of decoder2_4 is
 begin
  
 b(0) <= not a(0) and not a(1) and en;
 b(1) <= a(0) and not a(1) and en;
 b(2) <= not a(0) and a(1) and en;
 b(3) <= a(0) and a(1) and en;
  
 end structural;