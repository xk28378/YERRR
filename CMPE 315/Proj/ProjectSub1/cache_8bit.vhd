library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cache_8bit is 
port(
  wr_data: in std_logic_vector(7 downto 0);
  w_r_en: in std_logic;
  rd_data: out std_logic_vector(7 downto 0)
);
end cache_8bit;

architecture structural of cache_8bit is
  component cache_1bit 
  port(
    wr_data: in std_logic;
    w_r_en: in std_logic;
    rd_data: out std_logic
  );
  end component;
begin
  cache_1bit_0: cache_1bit port map(wr_data(0),w_r_en,rd_data(0));
  cache_1bit_1: cache_1bit port map(wr_data(1),w_r_en,rd_data(1));
  cache_1bit_2: cache_1bit port map(wr_data(2),w_r_en,rd_data(2));
  cache_1bit_3: cache_1bit port map(wr_data(3),w_r_en,rd_data(3));
  cache_1bit_4: cache_1bit port map(wr_data(4),w_r_en,rd_data(4));
  cache_1bit_5: cache_1bit port map(wr_data(5),w_r_en,rd_data(5));
  cache_1bit_6: cache_1bit port map(wr_data(6),w_r_en,rd_data(6));
  cache_1bit_7: cache_1bit port map(wr_data(7),w_r_en,rd_data(7));
end structural;