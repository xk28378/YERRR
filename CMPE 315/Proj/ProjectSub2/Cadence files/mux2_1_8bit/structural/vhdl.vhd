-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Sun Dec  5 15:14:20 2021


architecture structural of mux2_1_8bit is

  component mux_2_1
  port (
  in1: in std_logic;
  in2: in std_logic;
  sel: in std_logic;
  out1: out std_logic);
  end component;

  begin


  call1: mux_2_1 port map (a(0),b(0),sel,out1(0));
  call2: mux_2_1 port map (a(1),b(1),sel,out1(1));
  call3: mux_2_1 port map (a(2),b(2),sel,out1(2));
  call4: mux_2_1 port map (a(3),b(3),sel,out1(3));
  call5: mux_2_1 port map (a(4),b(4),sel,out1(4));
  call6: mux_2_1 port map (a(5),b(5),sel,out1(5));
  call7: mux_2_1 port map (a(6),b(6),sel,out1(6));
  call8: mux_2_1 port map (a(7),b(7),sel,out1(7));

end structural;