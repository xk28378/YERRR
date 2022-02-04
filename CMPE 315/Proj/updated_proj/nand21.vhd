library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity nand21 is
  port(
    input1: in std_logic;
    input2: in std_logic;
    output: out std_logic
  );
  end nand21;
architecture structural of nand21 is
  begin
    output <= input1 nand input2;
  end structural;
