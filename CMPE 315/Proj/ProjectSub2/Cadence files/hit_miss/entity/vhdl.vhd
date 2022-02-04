-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Mon Nov 29 21:39:07 2021


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity hit_miss is
  port(
    cpu_tag: in std_logic_vector(2 downto 0);
    valid: in std_logic;
    tag: in std_logic_vector(2 downto 0);
    hit_or_miss: out std_logic
  );
end hit_miss;
