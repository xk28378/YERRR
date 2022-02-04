-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Wed Dec  1 13:13:13 2021


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity state_machine is 
  port(
    RM: in std_logic;
    RH: in std_logic;
    WM: in std_logic;
    WH: in std_logic;
    clk: in std_logic;
    rst: in std_logic;
    busy: out std_logic;
    count: out std_logic_vector(18 downto 0)
  );
end state_machine;
