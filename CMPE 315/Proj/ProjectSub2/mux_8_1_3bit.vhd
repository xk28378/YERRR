library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux_8_1 is
  port(
    A: in std_logic_vector(2 downto 0);
    B: in std_logic_vector(2 downto 0);
    C: in std_logic_vector(2 downto 0);
    D: in std_logic_vector(2 downto 0);
    E: in std_logic_vector(2 downto 0);
    F: in std_logic_vector(2 downto 0);
    G: in std_logic_vector(2 downto 0);
    H: in std_logic_vector(2 downto 0);
    SEL0: in std_logic;
    SEL1: in std_logic;
    SEL2: in std_logic;
    OUT1: out std_logic_vector(2 downto 0));
end mux_8_1;

architecture structural of mux_8_1 is 
  component mux_3_bit
  port(
    A: in std_logic_vector(2 downto 0);
    B: in std_logic_vector(2 downto 0);
    C: in std_logic_vector(2 downto 0);
    D: in std_logic_vector(2 downto 0);
    SEL0: in std_logic;
    SEL1: in std_logic;
    OUT1: out std_logic_vector(2 downto 0)
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
  signal mid1, mid2: std_logic_vector(2 downto 0);
  begin
    unit1: mux_3_bit port map(A,B,C,D,SEL0,SEL1,mid1);
    unit2: mux_3_bit port map(E,F,G,H,SEL0,SEL1,mid2);
    unit3: mux_2_1 port map(mid1(0), mid2(0),SEL2,OUT1(0));
    unit4: mux_2_1 port map(mid1(1), mid2(1),SEL2,OUT1(1));
    unit5: mux_2_1 port map(mid1(2), mid2(2),SEL2,OUT1(2));

  end structural;
  