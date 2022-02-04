-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Wed Dec  1 13:43:00 2021


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cache_tag_block is 
port(
  wr_tag: in std_logic_vector(2 downto 0);
  w_r_en: in std_logic;
  rd_tag: out std_logic_vector(2 downto 0)
);
end cache_tag_block;
