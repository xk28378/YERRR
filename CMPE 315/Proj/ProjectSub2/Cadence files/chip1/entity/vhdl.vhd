-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Wed Dec  8 13:55:58 2021


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity chip1 is 
port(
  cpu_add    : in  std_logic_vector(7 downto 0);
  cpu_data   : inout  std_logic_vector(7 downto 0);
  cpu_rd_wrn : in  std_logic;    
  start      : in  std_logic;
  clk        : in  std_logic;
  reset      : in  std_logic;
  mem_data   : in  std_logic_vector(7 downto 0);
  vdd       : in  std_logic;
  gnd        : in  std_logic;
  busy       : out std_logic;
  mem_add    : out std_logic_vector(7 downto 0));
end chip1;
