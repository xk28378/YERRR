library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity hit_miss is
  port(
    cpu_tag: in std_logic_vector(2 downto 0);
    valid: in std_logic;
    tag: in std_logic_vector(2 downto 0);
    hit_or_miss: out std_logic
  );
end hit_miss;
architecture structural of hit_miss is
signal mid1: std_logic_vector(2 downto 0);
signal hit_tag: std_logic;
begin
  mid1 <= not(cpu_tag xor tag);
  hit_tag <= mid1(0) and mid1(1) and mid1(2);
  hit_or_miss <= hit_tag and valid;
end structural;