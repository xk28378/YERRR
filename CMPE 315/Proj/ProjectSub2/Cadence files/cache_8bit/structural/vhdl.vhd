-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Wed Dec  1 13:27:49 2021


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