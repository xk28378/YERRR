library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cache_tag is 
port(
  blk_off: in std_logic_vector(2 downto 0);
  wr_tag: in std_logic_vector(2 downto 0);
  w_r_en: in std_logic;
  rd_tag: out std_logic_vector(2 downto 0);
  clk: in std_logic
);
end cache_tag;

architecture structural of cache_tag is
  component cache_tag_block
  port(
    wr_tag: in std_logic_vector(2 downto 0);
    w_r_en: in std_logic;
    rd_tag: out std_logic_vector(2 downto 0)
  );
  end component;
  component decoder3_8
  port(
    a : in std_logic_vector(2 downto 0);
    en: in std_logic;
    b : out std_logic_vector(7 downto 0)
  );
  end component;
  component mux_8_1_3bit
  port(
    A: in std_logic_vector(2 downto 0);
    B: in std_logic_vector(2 downto 0);
    C: in std_logic_vector(2 downto 0);
    D: in std_logic_vector(2 downto 0);
    E: in std_logic_vector(2 downto 0);
    F: in std_logic_vector(2 downto 0);
    G: in std_logic_vector(2 downto 0);
    H: in std_logic_vector(2 downto 0);
    SEL0: in std_logic;
    SEL1: in std_logic;
    SEL2: in std_logic;
    OUT1: out std_logic_vector(2 downto 0));
  end component;
  signal decoder_out: std_logic_vector(7 downto 0);
  signal decoder_enable, write1, write2, write3, write4, write5, write6, write7, write8: std_logic;
  signal rd_tag1,rd_tag2,rd_tag3,rd_tag4,rd_tag5,rd_tag6,rd_tag7,rd_tag8: std_logic_vector(2 downto 0);
begin 
  decoder_enable <= (w_r_en and (not clk));
  write_decoder: decoder3_8 port map(blk_off,decoder_enable,decoder_out);
  write1 <= decoder_out(0) and clk;
  write2 <= decoder_out(1) and clk;
  write3 <= decoder_out(2) and clk;
  write4 <= decoder_out(3) and clk;
  write5 <= decoder_out(4) and clk;
  write6 <= decoder_out(5) and clk;
  write7 <= decoder_out(6) and clk;
  write8 <= decoder_out(7) and clk;
  cache_tag_block1: cache_tag_block port map(wr_tag,write1,rd_tag1);
  cache_tag_block2: cache_tag_block port map(wr_tag,write2,rd_tag2);
  cache_tag_block3: cache_tag_block port map(wr_tag,write3,rd_tag3);
  cache_tag_block4: cache_tag_block port map(wr_tag,write4,rd_tag4);
  cache_tag_block5: cache_tag_block port map(wr_tag,write5,rd_tag5);
  cache_tag_block6: cache_tag_block port map(wr_tag,write6,rd_tag6);
  cache_tag_block7: cache_tag_block port map(wr_tag,write7,rd_tag7);
  cache_tag_block8: cache_tag_block port map(wr_tag,write8,rd_tag8);
  first_mux_8_1_3bit: mux_8_1_3bit port map(rd_tag1,rd_tag2,rd_tag3,rd_tag4,rd_tag5,rd_tag6,rd_tag7,rd_tag8, blk_off(0),blk_off(1),blk_off(2),rd_tag);
end structural;