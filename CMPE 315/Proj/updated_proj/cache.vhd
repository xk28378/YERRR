
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cache is
  port(
    CPU_data: in std_logic_vector(7 downto 0);
    CPU_addr: in std_logic_vector(7 downto 0);
    R_W: in  std_logic;
    h_m: in std_logic;
    clk: in std_logic;
    rd_data: out std_logic_vector(7 downto 0)
  );
end cache;

architecture structural of cache is 
  component cache_block
  port(
    byte_off: in std_logic_vector(1 downto 0);
    wr_data: in std_logic_vector(7 downto 0);
    w_r_en: in std_logic; 
    h_m: in std_logic;
    clk: in std_logic;
    rd_data: out std_logic_vector(7 downto 0)
  );
  end component;
  component decoder3_8
  port(
    a : in std_logic_vector(2 downto 0);
    en: in std_logic;
    b : out std_logic_vector(7 downto 0)
  );
  end component;
  component mux_8_1_8bit
  port(
    A: in std_logic_vector(7 downto 0);
    B: in std_logic_vector(7 downto 0);
    C: in std_logic_vector(7 downto 0);
    D: in std_logic_vector(7 downto 0);
    E: in std_logic_vector(7 downto 0);
    F: in std_logic_vector(7 downto 0);
    G: in std_logic_vector(7 downto 0);
    H: in std_logic_vector(7 downto 0);
    SEL0: in std_logic;
    SEL1: in std_logic;
    SEL2: in std_logic;
    OUT1: out std_logic_vector(7 downto 0));
  end component;
component and2
  port(
    input1: in std_logic;
    input2: in std_logic;
    output: out std_logic
  );
end component;
  signal write_out: std_logic_vector(7 downto 0);
  signal blk_off: std_logic_vector(2 downto 0);
  signal byte_off: std_logic_vector(1 downto 0);
  signal write_enable, write1, write2,write3,write4, write5, write6, write7, write8: std_logic;
  signal rd_data1, rd_data2, rd_data3, rd_data4, rd_data5, rd_data6, rd_data7, rd_data8: std_logic_vector(7 downto 0);
begin
  blk_off <= CPU_addr(4 downto 2);
  byte_off <= CPU_addr(1 downto 0);
  -- write_enable <= (R_W and h_m );--and (not clk));
  and_0: and2 port map(R_W,h_m,write_enable);
  write_decoder: decoder3_8 port map(blk_off,write_enable,write_out);
  -- write1 <= write_out(0) and clk;
  -- write2 <= write_out(1) and clk;
  -- write3 <= write_out(2) and clk;
  -- write4 <= write_out(3) and clk;
  -- write5 <= write_out(4) and clk;
  -- write6 <= write_out(5) and clk;
  -- write7 <= write_out(6) and clk;
  -- write8 <= write_out(7) and clk;
  and_1: and2 port map(write_out(0),clk,write1);
  and_2: and2 port map(write_out(1),clk,write2);
  and_3: and2 port map(write_out(2),clk,write3);
  and_4: and2 port map(write_out(3),clk,write4);
  and_5: and2 port map(write_out(4),clk,write5);
  and_6: and2 port map(write_out(5),clk,write6);
  and_7: and2 port map(write_out(6),clk,write7);
  and_8: and2 port map(write_out(7),clk,write8);
  cache_block0: cache_block port map(byte_off,CPU_data,write1,h_m,clk,rd_data1);
  cache_block1: cache_block port map(byte_off,CPU_data,write2,h_m,clk,rd_data2);
  cache_block2: cache_block port map(byte_off,CPU_data,write3,h_m,clk,rd_data3);
  cache_block3: cache_block port map(byte_off,CPU_data,write4,h_m,clk,rd_data4);
  cache_block4: cache_block port map(byte_off,CPU_data,write5,h_m,clk,rd_data5);
  cache_block5: cache_block port map(byte_off,CPU_data,write6,h_m,clk,rd_data6);
  cache_block6: cache_block port map(byte_off,CPU_data,write7,h_m,clk,rd_data7);
  cache_block7: cache_block port map(byte_off,CPU_data,write8,h_m,clk,rd_data8);
  mux: mux_8_1_8bit port map(rd_data1,rd_data2, rd_data3, rd_data4,rd_data5,rd_data6,rd_data7,rd_data8,blk_off(0),blk_off(1),blk_off(2),rd_data);
  -- rd_data(31 downto 0) <= rd_data1;
  -- rd_data(63 downto 32) <= rd_data2;
  -- rd_data(95 downto 64) <= rd_data3;
  -- rd_data(127 downto 96) <= rd_data4;
  -- rd_data(159 downto 128) <= rd_data5;
  -- rd_data(191 downto 160) <= rd_data6;
  -- rd_data(223 downto 192) <= rd_data7;
  -- rd_data(255 downto 224) <= rd_data8;
  -- rd_data(256) <= '0';
  -- rd_data(264 downto 257) <= write1 & write2 & write3 & write4 & write5 & write6 & write7& write8;
  -- rd_data(7) <= write_enable;

end structural;