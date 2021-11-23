library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity decoder3_8 is
  port(
  a : in std_logic_vector(2 downto 0);
  en: in std_logic;
  b : out std_logic_vector(7 downto 0)
  );
 end decoder3_8;
  
 architecture structural of decoder3_8 is
 begin
  
 b(0) <= not a(2) and not a(1) and not a(0) and en;
 b(1) <= not a(2) and not a(1) and a(0) and en;
 b(2) <= not a(2) and a(1) and not a(0) and en;
 b(3) <= not a(2) and a(1) and a(0) and en;
 b(4) <= a(2) and not a(1) and not a(0) and en;
 b(5) <= a(2) and not a(1) and a(0) and en;
 b(6) <= a(2) and a(1) and not a(0) and en;
 b(7) <= a(2) and a(1) and a(0) and en;
  
 end structural;