-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Wed Dec  1 13:36:56 2021


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cache is
  port(
    CPU_data: in std_logic_vector(7 downto 0);
    CPU_addr: in std_logic_vector(7 downto 0);
    R_W: in  std_logic;
    h_m: in std_logic;
    clk: in std_logic;
    rd_data: out std_logic_vector(7 downto 0)
  );
end cache;
