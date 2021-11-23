library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cache_tag_block is 
port(
  wr_tag: in std_logic_vector(2 downto 0);
  w_r_en: in std_logic;
  rd_tag: out std_logic_vector(2 downto 0)
);
end cache_tag_block;

architecture structural of cache_tag_block is 
component cache_1bit 
port(
  wr_data: in std_logic;
  w_r_en: in std_logic;
  rd_data: out std_logic
);
end component;
begin
  cache_1bit_0: cache_1bit port map(wr_tag(0),w_r_en,rd_tag(0));
  cache_1bit_1: cache_1bit port map(wr_tag(1),w_r_en,rd_tag(1));
  cache_1bit_2: cache_1bit port map(wr_tag(2),w_r_en,rd_tag(2));
end structural;
  