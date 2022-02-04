library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux2_1_8bit is
  port (
    a: in std_logic_vector(7 downto 0);
    b: in std_logic_vector(7 downto 0);
    sel: in std_logic;
    out1: out std_logic_vector(7 downto 0)
  );
end mux2_1_8bit;

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