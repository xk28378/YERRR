-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Sat Oct 23 13:36:35 2021


library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity alu_4 is port(
  A: in std_logic_vector(3 downto 0);
  B: in std_logic_vector(3 downto 0);
  Cin: in std_logic;
  S0: in std_logic;
  S1: in std_logic;
  G: out std_logic_vector(3 downto 0);
  Cout: out std_logic
  );
end alu_4;
