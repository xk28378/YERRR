-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Sat Oct 23 13:36:35 2021


library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity xor2 is

  port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    output   : out std_logic);
end xor2;
