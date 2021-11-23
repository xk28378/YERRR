library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cache_valid is 
port(
  blk_off: in std_logic_vector(2 downto 0);
  wr_valid: in std_logic;
  w_r_en: in std_logic;
  rd_valid: out std_logic;
  rst: in std_logic;
  clk: in std_logic
);
end cache_valid;

architecture structural of cache_valid is 
component dff
  port ( d   : in  std_logic;
    clk : in  std_logic;
    rst: in std_logic;
    q   : out std_logic;
    qbar: out std_logic); 
  end component;
component decoder3_8
  port(
    a : in std_logic_vector(2 downto 0);
    en: in std_logic;
    b : out std_logic_vector(7 downto 0)
  );
end component;
component mux_4_1
  port(
    a: in std_logic;
    b: in std_logic;
    c: in std_logic;
    d: in std_logic;
    sel0: in std_logic;
    sel1: in std_logic;
    out1: out std_logic);
  end component;
component mux_2_1
  port (
    in1: in std_logic;
    in2: in std_logic;
    sel: in std_logic;
    out1: out std_logic
  );
  end component;
signal decoder_out: std_logic_vector(7 downto 0);
signal decoder_enable, write1, write2, write3, write4, write5, write6, write7, write8: std_logic;
signal rd_valid1,rd_valid2,rd_valid3,rd_valid4,rd_valid5,rd_valid6,rd_valid7,rd_valid8,mid1,mid2: std_logic;
begin
  decoder_enable <= (w_r_en and (not clk));
  write_decoder: decoder3_8 port map(blk_off,decoder_enable,decoder_out);
  write1 <= (rst or decoder_out(0)) and clk;
  write2 <= (rst or decoder_out(1)) and clk;
  write3 <= (rst or decoder_out(2)) and clk;
  write4 <= (rst or decoder_out(3)) and clk;
  write5 <= (rst or decoder_out(4)) and clk;
  write6 <= (rst or decoder_out(5)) and clk;
  write7 <= (rst or decoder_out(6)) and clk;
  write8 <= (rst or decoder_out(7)) and clk;
  cache_1bit_0: dff port map(wr_valid,write1,rst,rd_valid1);
  cache_1bit_1: dff port map(wr_valid,write2,rst,rd_valid2);
  cache_1bit_2: dff port map(wr_valid,write3,rst,rd_valid3);
  cache_1bit_3: dff port map(wr_valid,write4,rst,rd_valid4);
  cache_1bit_4: dff port map(wr_valid,write5,rst,rd_valid5);
  cache_1bit_5: dff port map(wr_valid,write6,rst,rd_valid6);
  cache_1bit_6: dff port map(wr_valid,write7,rst,rd_valid7);
  cache_1bit_7: dff port map(wr_valid,write8,rst,rd_valid8);
  mux_4_1_1: mux_4_1 port map(rd_valid1,rd_valid2,rd_valid3,rd_valid4,blk_off(0), blk_off(1),mid1);
  mux_4_1_2: mux_4_1 port map(rd_valid5,rd_valid6,rd_valid7,rd_valid8,blk_off(0), blk_off(1),mid2);
  unit3: mux_2_1 port map(mid1, mid2,blk_off(2),rd_valid);

end structural;
  