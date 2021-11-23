-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Sat Oct 23 13:36:35 2021


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
