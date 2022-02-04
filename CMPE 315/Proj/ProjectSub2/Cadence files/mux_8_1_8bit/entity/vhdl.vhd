-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Fri Nov 19 20:40:27 2021


library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux_8_1_8bit is
  port(
    A: in std_logic_vector(7 downto 0);
    B: in std_logic_vector(7 downto 0);
    C: in std_logic_vector(7 downto 0);
    D: in std_logic_vector(7 downto 0);
    E: in std_logic_vector(7 downto 0);
    F: in std_logic_vector(7 downto 0);
    G: in std_logic_vector(7 downto 0);
    H: in std_logic_vector(7 downto 0);
    SEL0: in std_logic;
    SEL1: in std_logic;
    SEL2: in std_logic;
    OUT1: out std_logic_vector(7 downto 0));
end mux_8_1_8bit;
