-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Fri Nov 19 20:37:37 2021


architecture structural of mux_8_bit is
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
  Unit5: mux_4_1 port map (A(4),B(4),C(4),D(4),SEL0,SEL1,OUT1(4));
  Unit6: mux_4_1 port map (A(5),B(5),C(5),D(5),SEL0,SEL1,OUT1(5));
  Unit7: mux_4_1 port map (A(6),B(6),C(6),D(6),SEL0,SEL1,OUT1(6));
  Unit8: mux_4_1 port map (A(7),B(7),C(7),D(7),SEL0,SEL1,OUT1(7));
 
end structural;
