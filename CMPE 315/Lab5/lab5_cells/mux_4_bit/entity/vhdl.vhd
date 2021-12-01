-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Sat Oct 23 13:36:35 2021


library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux_4_bit is
  port(
    A: in std_logic_vector(3 downto 0);
    B: in std_logic_vector(3 downto 0);
    C: in std_logic_vector(3 downto 0);
    D: in std_logic_vector(3 downto 0);
    SEL0: in std_logic;
    SEL1: in std_logic;
    OUT1: out std_logic_vector(3 downto 0));
end mux_4_bit;
