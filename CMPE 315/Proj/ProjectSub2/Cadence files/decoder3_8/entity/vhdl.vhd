-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Sat Nov 20 21:57:32 2021


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity decoder3_8 is
  port(
  a : in std_logic_vector(2 downto 0);
  en: in std_logic;
  b : out std_logic_vector(7 downto 0)
  );
 end decoder3_8;
