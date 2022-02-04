-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Fri Nov 19 17:42:15 2021


architecture structural of mux_4_1 is
  component mux_2_1
    port(
      in1: in std_logic;
      in2: in std_logic;
      sel: in std_logic;
      out1: out std_logic);
  end component;
  signal mid1, mid2: std_logic;
begin
  Unit1: mux_2_1 port map(a,b,sel0,mid1);
  Unit2: mux_2_1 port map(c,d,sel0,mid2);
  Unit3: mux_2_1 port map(mid1,mid2,sel1,out1);
end structural;
