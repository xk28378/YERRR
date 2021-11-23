-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Sat Oct 23 13:36:35 2021


architecture structural of mux_2_1 is

begin

out1 <= (in1 and (not sel)) or (in2 and sel);

end structural;
