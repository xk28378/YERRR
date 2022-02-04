-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Sat Nov 20 21:57:32 2021


 architecture structural of decoder3_8 is
 begin
  
 b(0) <= not a(2) and not a(1) and not a(0) and en;
 b(1) <= not a(2) and not a(1) and a(0) and en;
 b(2) <= not a(2) and a(1) and not a(0) and en;
 b(3) <= not a(2) and a(1) and a(0) and en;
 b(4) <= a(2) and not a(1) and not a(0) and en;
 b(5) <= a(2) and not a(1) and a(0) and en;
 b(6) <= a(2) and a(1) and not a(0) and en;
 b(7) <= a(2) and a(1) and a(0) and en;
  
 end structural;