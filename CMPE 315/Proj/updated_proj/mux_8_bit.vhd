library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux_8_bit is
  port(
    A: in std_logic_vector(7 downto 0);
    B: in std_logic_vector(7 downto 0);
    C: in std_logic_vector(7 downto 0);
    D: in std_logic_vector(7 downto 0);
    SEL0: in std_logic;
    SEL1: in std_logic;
    OUT1: out std_logic_vector(7 downto 0));
end mux_8_bit;

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




    
    
