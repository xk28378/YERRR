-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Wed Dec  1 13:29:40 2021


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cache_block is 
port(
  byte_off: in std_logic_vector(1 downto 0);
  wr_data: in std_logic_vector(7 downto 0);
  w_r_en: in std_logic; 
  h_m: in std_logic;
  clk: in std_logic;
  rd_data: out std_logic_vector(7 downto 0)
);
end cache_block;
