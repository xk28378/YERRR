-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Sat Oct 23 13:36:35 2021


architecture structural of mux_4_bit is
  component mux_4_1
    port(
      a: in std_logic;
      b: in std_logic;
      c: in std_logic;
      d: in std_logic;
      sel0: in std_logic;
      sel1: in std_logic;
      out1: out std_logic);
  end component;
begin
  Unit1: mux_4_1 port map (A(0),B(0),C(0),D(0),SEL0,SEL1,OUT1(0));
  Unit2: mux_4_1 port map (A(1),B(1),C(1),D(1),SEL0,SEL1,OUT1(1));
  Unit3: mux_4_1 port map (A(2),B(2),C(2),D(2),SEL0,SEL1,OUT1(2));
  Unit4: mux_4_1 port map (A(3),B(3),C(3),D(3),SEL0,SEL1,OUT1(3));
end structural;
