-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Wed Dec  1 19:53:52 2021


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity counter is 
  port(
    clk: in std_logic;
    rst: in std_logic;
    out1: out std_logic_vector(18 downto 0)
  );
end counter;
