-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Wed Dec  1 13:29:40 2021


architecture structural of cache_block is  
  component cache_8bit
  port(
    wr_data: in std_logic_vector(7 downto 0);
    w_r_en: in std_logic;
    rd_data: out std_logic_vector(7 downto 0)
  );
  end component;
  component decoder2_4
  port(
    a : in std_logic_vector(1 downto 0);
    en: in std_logic;
    b : out std_logic_vector(3 downto 0)
  );
  end component;
  component mux_8_bit 
  port(
    A: in std_logic_vector(7 downto 0);
    B: in std_logic_vector(7 downto 0);
    C: in std_logic_vector(7 downto 0);
    D: in std_logic_vector(7 downto 0);
    SEL0: in std_logic;
    SEL1: in std_logic;
    OUT1: out std_logic_vector(7 downto 0)
  );
  end component;
component and2
  port(
    input1: in std_logic;
    input2: in std_logic;
    output: out std_logic
  );
end component;
  signal write_out: std_logic_vector(3 downto 0);
  signal write_enable, write1, write2,write3,write4: std_logic :='0';
  signal rd_data1, rd_data2, rd_data3, rd_data4: std_logic_vector(7 downto 0):="00000000";
begin
  -- write_enable <= (w_r_en and h_m);-- and (not clk));
  and_0: and2 port map(w_r_en,h_m,write_enable);
  write_decoder: decoder2_4 port map(byte_off,write_enable,write_out);
  -- write1 <= write_out(0) and clk;
  -- write2 <= write_out(1) and clk;
  -- write3 <= write_out(2) and clk;
  -- write4 <= write_out(3) and clk;
  and_1: and2 port map(write_out(0),clk,write1);
  and_2: and2 port map(write_out(1),clk,write2);
  and_3: and2 port map(write_out(2),clk,write3);
  and_4: and2 port map(write_out(3),clk,write4);
  cache_8bit0: cache_8bit port map(wr_data,write1,rd_data1);
  cache_8bit1: cache_8bit port map(wr_data,write2,rd_data2);
  cache_8bit2: cache_8bit port map(wr_data,write3,rd_data3);
  cache_8bit3: cache_8bit port map(wr_data,write4,rd_data4);
  mux: mux_8_bit port map(rd_data1,rd_data2, rd_data3, rd_data4,byte_off(0),byte_off(1),rd_data);
  -- rd_data(7 downto 0) <= rd_data1;
  -- rd_data(15 downto 8) <= rd_data2;
  -- rd_data(23 downto 16) <= rd_data3;
  -- rd_data(27 downto 24) <= rd_data4(3 downto 0);
  -- rd_data(7 downto 28) <= write_out;
end structural;
