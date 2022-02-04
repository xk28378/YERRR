-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Mon Nov 29 21:39:48 2021


architecture structural of encoder4_2 is
begin
  out1(0) <= b or d;
  out1(1) <= c or d;
end structural;
