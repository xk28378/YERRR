-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Thu Nov 18 11:10:58 2021


architecture structural of mux_2_1 is

begin

out1 <= (in1 and (not sel)) or (in2 and sel);

end structural;
