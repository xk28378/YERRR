library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity decoder2_4 is
  port(
  a : in std_logic_vector(1 downto 0);
  en: in std_logic;
  b : out std_logic_vector(3 downto 0)
  );
 end decoder2_4;
  
 architecture structural of decoder2_4 is
 begin
  
 b(0) <= not a(0) and not a(1) and en;
 b(1) <= a(0) and not a(1) and en;
 b(2) <= not a(0) and a(1) and en;
 b(3) <= a(0) and a(1) and en;
  
 end structural;