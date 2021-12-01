library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux_2_1 is 
port (
  in1: in std_logic;
  in2: in std_logic;
  sel: in std_logic;
  out1: out std_logic);
end mux_2_1;
architecture structural of mux_2_1 is

begin

out1 <= (in1 and (not sel)) or (in2 and sel);

end structural;
