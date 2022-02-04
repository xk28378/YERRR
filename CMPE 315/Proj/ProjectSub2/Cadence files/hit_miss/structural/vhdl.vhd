-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Mon Nov 29 21:39:07 2021


architecture structural of hit_miss is
signal mid1: std_logic_vector(2 downto 0);
signal hit_tag: std_logic;
begin
  mid1 <= not(cpu_tag xor tag);
  hit_tag <= mid1(0) and mid1(1) and mid1(2);
  hit_or_miss <= hit_tag and valid;
end structural;