library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux_3_bit is
  port(
    A: in std_logic_vector(2 downto 0);
    B: in std_logic_vector(2 downto 0);
    C: in std_logic_vector(2 downto 0);
    D: in std_logic_vector(2 downto 0);
    SEL0: in std_logic;
    SEL1: in std_logic;
    OUT1: out std_logic_vector(2 downto 0));
end mux_3_bit;

architecture structural of mux_3_bit is
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
end structural;




    
    
