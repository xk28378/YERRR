-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Fri Nov 19 20:40:27 2021


architecture structural of mux_8_1_8bit is 
  component mux_8_bit
  port(
    A: in std_logic_vector(7 downto 0);
    B: in std_logic_vector(7 downto 0);
    C: in std_logic_vector(7 downto 0);
    D: in std_logic_vector(7 downto 0);
    SEL0: in std_logic;
    SEL1: in std_logic;
    OUT1: out std_logic_vector(7 downto 0)
  );
  end component;
  component mux_2_1
  port (
    in1: in std_logic;
    in2: in std_logic;
    sel: in std_logic;
    out1: out std_logic
  );
  end component;
  signal mid1, mid2: std_logic_vector(7 downto 0);
  begin
    unit1: mux_8_bit port map(A,B,C,D,SEL0,SEL1,mid1);
    unit2: mux_8_bit port map(E,F,G,H,SEL0,SEL1,mid2);
    unit3: mux_2_1 port map(mid1(0), mid2(0),SEL2,OUT1(0));
    unit4: mux_2_1 port map(mid1(1), mid2(1),SEL2,OUT1(1));
    unit5: mux_2_1 port map(mid1(2), mid2(2),SEL2,OUT1(2));
    unit6: mux_2_1 port map(mid1(3), mid2(3),SEL2,OUT1(3));
    unit7: mux_2_1 port map(mid1(4), mid2(4),SEL2,OUT1(4));
    unit8: mux_2_1 port map(mid1(5), mid2(5),SEL2,OUT1(5));
    unit9: mux_2_1 port map(mid1(6), mid2(6),SEL2,OUT1(6));
    unit10:mux_2_1 port map(mid1(7), mid2(7),SEL2,OUT1(7));

  end structural;
