-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Wed Dec  1 00:30:44 2021


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity Dlatch_8bit is 
port ( 
    d   : in  std_logic_vector(7 downto 0);
    clk : in  std_logic;
    q   : out std_logic_vector(7 downto 0);
    qbar: out std_logic_vector(7 downto 0));
end Dlatch_8bit;
