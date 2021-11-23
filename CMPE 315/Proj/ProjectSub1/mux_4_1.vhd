library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux_4_1 is port(
    a: in std_logic;
    b: in std_logic;
    c: in std_logic;
    d: in std_logic;
    sel0: in std_logic;
    sel1: in std_logic;
    out1: out std_logic);
end mux_4_1;
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
