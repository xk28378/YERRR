-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Wed Dec  1 13:43:00 2021


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
