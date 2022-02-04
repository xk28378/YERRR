-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Sun Dec  5 15:14:20 2021


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
