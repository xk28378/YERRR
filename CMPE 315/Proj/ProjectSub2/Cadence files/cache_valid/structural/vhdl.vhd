-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Wed Dec  1 13:38:43 2021


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
component or2
  port(
    INPUT1: in std_logic;
    INPUT2: in std_logic;
    OUTPUT: out std_logic
  );
end component;
component inverter
  port(
  input7: in std_logic;
  output7: out std_logic
  );
end component;
component and2
  port(
    input1: in std_logic;
    input2: in std_logic;
    output: out std_logic
  );
end component;
signal decoder_out: std_logic_vector(7 downto 0);
signal decoder_enable, clk_bar,write1, write2, write3, write4, write5, write6, write7, write8: std_logic;
signal rd_valid1,rd_valid2,rd_valid3,rd_valid4,rd_valid5,rd_valid6,rd_valid7,rd_valid8,mid1,mid2: std_logic;
signal or1,or__2,or3,or4,or5,or6,or7,or8: std_logic;
begin
  -- decoder_enable <= (w_r_en and (not clk));
  inverter_1: inverter port map(clk,clk_bar);
  and_0: and2 port map(w_r_en,clk_bar,decoder_enable);
  write_decoder: decoder3_8 port map(blk_off,decoder_enable,decoder_out);
  -- write1 <= (rst or decoder_out(0)) and clk;
  -- write2 <= (rst or decoder_out(1)) and clk;
  -- write3 <= (rst or decoder_out(2)) and clk;
  -- write4 <= (rst or decoder_out(3)) and clk;
  -- write5 <= (rst or decoder_out(4)) and clk;
  -- write6 <= (rst or decoder_out(5)) and clk;
  -- write7 <= (rst or decoder_out(6)) and clk;
  -- write8 <= (rst or decoder_out(7)) and clk;
  or_1: or2 port map(rst,decoder_out(0),or1);
  or_2: or2 port map(rst,decoder_out(1),or__2);
  or_3: or2 port map(rst,decoder_out(2),or3);
  or_4: or2 port map(rst,decoder_out(3),or4);
  or_5: or2 port map(rst,decoder_out(4),or5);
  or_6: or2 port map(rst,decoder_out(5),or6);
  or_7: or2 port map(rst,decoder_out(6),or7);
  or_8: or2 port map(rst,decoder_out(7),or8);
  and_1: and2 port map(or1,clk,write1);
  and_2: and2 port map(or__2,clk,write2);
  and_3: and2 port map(or3,clk,write3);
  and_4: and2 port map(or4,clk,write4);
  and_5: and2 port map(or5,clk,write5);
  and_6: and2 port map(or6,clk,write6);
  and_7: and2 port map(or7,clk,write7);
  and_8: and2 port map(or8,clk,write8);
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
