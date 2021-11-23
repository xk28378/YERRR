library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity encoder4_2 is 
port(
  a: in std_logic;
  b: in std_logic;
  c: in std_logic;
  d: in std_logic;
  out1: out std_logic_vector(1 downto 0)
);
end encoder4_2;

architecture structural of encoder4_2 is
begin
  out1(0) <= b or d;
  out1(1) <= c or d;
end structural;
