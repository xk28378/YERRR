library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity chip1 is 
port(
  cpu_add    : in  std_logic_vector(7 downto 0);
  cpu_data   : inout  std_logic_vector(7 downto 0);
  cpu_rd_wrn : in  std_logic;    
  start      : in  std_logic;
  clk        : in  std_logic;
  reset      : in  std_logic;
  mem_data   : in  std_logic_vector(7 downto 0);
  vdd       : in  std_logic;
  gnd        : in  std_logic;
  busy       : out std_logic;
  mem_add    : out std_logic_vector(7 downto 0));
end chip1;

architecture structural of chip1 is 
component cache 
port(
  CPU_data: in std_logic_vector(7 downto 0);
  CPU_addr: in std_logic_vector(7 downto 0);
  R_W: in  std_logic;
  h_m: in std_logic;
  clk: in std_logic;
  rd_data: out std_logic_vector(7 downto 0)
);
end component;
component state_machine 
port(
    RM: in std_logic;
    RH: in std_logic;
    WM: in std_logic;
    WH: in std_logic;
    clk: in std_logic;
    rst: in std_logic;
    busy: out std_logic;
    count: out std_logic_vector(18 downto 0)
  );
end component;
component hit_miss
port(
    cpu_tag: in std_logic_vector(2 downto 0);
    valid: in std_logic;
    tag: in std_logic_vector(2 downto 0);
    hit_or_miss: out std_logic
  );
end component;
component cache_tag
port(
  blk_off: in std_logic_vector(2 downto 0);
  wr_tag: in std_logic_vector(2 downto 0);
  w_r_en: in std_logic;
  rd_tag: out std_logic_vector(2 downto 0);
  clk: in std_logic
);
end component;
component cache_valid 
port(
  blk_off: in std_logic_vector(2 downto 0);
  wr_valid: in std_logic;
  w_r_en: in std_logic;
  rd_valid: out std_logic;
  rst: in std_logic;
  clk: in std_logic
);
end component;
component Dlatch
port ( 
  d   : in  std_logic;
  clk : in  std_logic;
  q   : out std_logic;
  qbar: out std_logic); 
end component;
component Dlatch_8bit
port ( 
  d   : in  std_logic_vector(7 downto 0);
  clk : in  std_logic;
  q   : out std_logic_vector(7 downto 0);
  qbar: out std_logic_vector(7 downto 0));
end component;
component mux_2_1_8bit
port (
    a: in std_logic_vector(7 downto 0);
    b: in std_logic_vector(7 downto 0);
    sel: in std_logic;
    out1: out std_logic_vector(7 downto 0)
  );
end component;
component mux_2_1
port (
  in1: in std_logic;
  in2: in std_logic;
  sel: in std_logic;
  out1: out std_logic);
end component;
component mux2_1_8bit
  port (
    a: in std_logic_vector(7 downto 0);
    b: in std_logic_vector(7 downto 0);
    sel: in std_logic;
    out1: out std_logic_vector(7 downto 0)
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
    OUT1: out std_logic_vector(7 downto 0));
end component;
component tran_gate                    
  port ( sel   : in std_logic;
         input : in std_logic;
         output:out std_logic);
end component;
component encoder4_2
  port(
    a: in std_logic;
    b: in std_logic;
    c: in std_logic;
    d: in std_logic;
    out1: out std_logic_vector(1 downto 0)
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
signal idle,busy_1,busy_1_bar,start_bar,r_w_bar,h_m_bar,not_mem_en,sel0,sel1,first_byte_en,second_byte_en,cpu_data_en,third_byte_en,fourth_byte_en,mem_data_en,mem_addr_en,tag_valid_write,start_1,r_w,r_w_1,valid_1,temp1,temp2,temp7,temp8,temp9,temp10,temp_01,temp_02,temp_03,temp_04,temp_05,temp_06,temp_07,temp_08,temp_09,temp_010,temp_011,temp_inv,h_m,RH,rh_1,RM,rm_1,WH,wh_1,WM,wm_1: std_logic;
signal tag_1: std_logic_vector(2 downto 0);
signal cpu_addr,cpu_addr_1,rm_mux_out,cache_data,cpu_data_1,mem_addr,temp3,temp4,temp5,temp6,temp11,temp12,temp13,temp14,temp15,temp16,cpu_d,rd_data: std_logic_vector(7 downto 0);
signal first_byte,second_byte,third_byte,fourth_byte: std_logic_vector(7 downto 0);
signal counter: std_logic_vector(18 downto 0);
begin
  first_byte(7 downto 2) <= cpu_addr_1(7 downto 2);
  first_byte(1) <= gnd;
  first_byte(0) <= gnd;
  second_byte(7 downto 2) <= cpu_addr_1(7 downto 2);
  second_byte(1) <= gnd;
  second_byte(0) <= vdd;
  third_byte(7 downto 2) <= cpu_addr_1(7 downto 2);
  third_byte(1) <= vdd;
  third_byte(0) <= gnd;
  fourth_byte(7 downto 2) <= cpu_addr_1(7 downto 2);
  fourth_byte(1) <= vdd;
  fourth_byte(0) <= vdd;  
  -- mem_en <= mem_addr_en;
  -- not_mem_en <= not mem_addr_en;
  inverter_01: inverter port map(mem_addr_en,not_mem_en);
  busy <= busy_1;
  -- idle <= not busy_1 and not start;
  inverter_0: inverter port map(busy_1,busy_1_bar);
  inverter_1: inverter port map(start,start_bar);
  and_0: and2 port map(busy_1_bar,start_bar,idle);
  -- temp1 <= not cpu_rd_wrn;
  inverter_2: inverter port map(cpu_rd_wrn,temp1);
  -- rh_1 <= h_m and not r_w;
  -- rm_1 <= not h_m and not r_w;
  -- wh_1 <= h_m and r_w;
  -- wm_1<= not h_m and r_w; 
  inverter_3: inverter port map(r_w,r_w_bar);
  inverter_4: inverter port map(h_m,h_m_bar);
  and_1: and2 port map(h_m,r_w_bar,rh_1);
  and_2: and2 port map(h_m_bar,r_w_bar,rm_1);
  and_3: and2 port map(h_m,r_w,wh_1);
  and_4: and2 port map(h_m_bar,r_w,wm_1);
  -- mem_addr_en <= counter(0) and RM;
  and_05: and2 port map(counter(0),RM,mem_addr_en);
  rh_latch: Dlatch port map(rh_1,start,RH,temp7);
  rm_latch: Dlatch port map(rm_1,start,RM,temp8);
  wh_latch: Dlatch port map(wh_1,start,WH,temp9);
  wm_latch: Dlatch port map(wm_1,start,WM,temp10);
  -- cache_latch_1: Dlatch_8bit port map(cpu_data,WH,cache_data,temp11);
  -- cache_latch_2: Dlatch_8bit port map(mem_data,mem_data_en,cache_data,temp12);
  -- cache_latch_3: Dlatch_8bit port map(first_byte,first_byte_en,cpu_addr,temp13);
  -- cache_latch_4: Dlatch_8bit port map(second_byte,second_byte_en,cpu_addr,temp14);
  -- cache_latch_5: Dlatch_8bit port map(third_byte,third_byte_en,cpu_addr,temp15);
  -- cache_latch_6: Dlatch_8bit port map(fourth_byte,fourth_byte_en,cpu_addr,temp16);
  -- tag_valid_write <= counter(7) and RM;
  and_5: and2 port map(counter(7),RM,tag_valid_write);
  -- cpu_data_en <= not ((counter(17) and RM) or (counter(0) and RH));
  and_6: and2 port map(counter(17), RM,temp_01);
  and_7: and2 port map(counter(0),RH,temp_02);
  or_1: or2 port map(temp_01,temp_02,temp_03);
  inverter_5: inverter port map(temp_03,cpu_data_en);
  -- first_byte_en <= (RM and (counter(8) or counter(9)));
  or_2: or2 port map(counter(8),counter(9),temp_04);
  and_8: and2 port map(RM,temp_04,first_byte_en);
  -- second_byte_en <= (RM and (counter(10) or counter(11)));
  or_3: or2 port map(counter(10),counter(11),temp_05);
  and_9: and2 port map(RM,temp_05,second_byte_en);
  -- third_byte_en <= (RM and (counter(12) or counter(13)));
  or_4: or2 port map(counter(12),counter(13),temp_06);
  and_10: and2 port map(RM,temp_06,third_byte_en);
  -- fourth_byte_en <= (RM and (counter(14) or counter(15)));
  or_5: or2 port map(counter(14),counter(15),temp_07);
  and_11: and2 port map(RM,temp_07,fourth_byte_en);
  -- sel0 <= second_byte_en or fourth_byte_en;
  or_05: or2 port map(second_byte_en,fourth_byte_en,sel0);
  -- sel1 <= fourth_byte_en or third_byte_en;
  or_6: or2 port map(fourth_byte_en,third_byte_en,sel1);
  rm_mux: mux_8_bit port map(first_byte,second_byte,third_byte,fourth_byte,sel0,sel1,rm_mux_out);
  addr_mux: mux2_1_8bit port map(cpu_addr_1,rm_mux_out,mem_data_en,cpu_addr);
  cache_data_mux: mux2_1_8bit port map(cpu_data,mem_data,mem_data_en,cache_data);
  -- mem_data_en <= (RM and (counter(8) or counter(9))) or (RM and (counter(11) or counter(10))) or (RM and (counter(12) or counter(13))) or (RM and (counter(14) or counter(15)));
  or_7: or2 port map(first_byte_en,second_byte_en,temp_08);
  or_8: or2 port map(temp_08,third_byte_en,temp_09);
  or_9: or2 port map(temp_09,fourth_byte_en,mem_data_en);
  -- r_w_1 <= mem_data_en or (WH and (counter(18) and not counter(0)));
  inverter_6: inverter port map(counter(0),temp_inv);
  and_12: and2 port map(counter(18),temp_inv,temp_010);
  and_13: and2 port map(WH,temp_010,temp_011);
  or_10: or2 port map(mem_data_en,temp_011,r_w_1);
  start_mux: mux_2_1 port map(gnd,start,clk,start_1);
  mem_addr_trangate1: tran_gate port map(not_mem_en,mem_addr(0),mem_add(0));
  mem_addr_trangate2: tran_gate port map(not_mem_en,mem_addr(1),mem_add(1));
  mem_addr_trangate3: tran_gate port map(not_mem_en,mem_addr(2),mem_add(2));
  mem_addr_trangate4: tran_gate port map(not_mem_en,mem_addr(3),mem_add(3));
  mem_addr_trangate5: tran_gate port map(not_mem_en,mem_addr(4),mem_add(4));
  mem_addr_trangate6: tran_gate port map(not_mem_en,mem_addr(5),mem_add(5));
  mem_addr_trangate7: tran_gate port map(not_mem_en,mem_addr(6),mem_add(6));
  mem_addr_trangate8: tran_gate port map(not_mem_en,mem_addr(7),mem_add(7));
  cpu_data_trangate1: tran_gate port map(cpu_data_en,cpu_data_1(0),cpu_data(0));
  cpu_data_trangate2: tran_gate port map(cpu_data_en,cpu_data_1(1),cpu_data(1));
  cpu_data_trangate3: tran_gate port map(cpu_data_en,cpu_data_1(2),cpu_data(2));
  cpu_data_trangate4: tran_gate port map(cpu_data_en,cpu_data_1(3),cpu_data(3));
  cpu_data_trangate5: tran_gate port map(cpu_data_en,cpu_data_1(4),cpu_data(4));
  cpu_data_trangate6: tran_gate port map(cpu_data_en,cpu_data_1(5),cpu_data(5));
  cpu_data_trangate7: tran_gate port map(cpu_data_en,cpu_data_1(6),cpu_data(6));
  cpu_data_trangate8: tran_gate port map(cpu_data_en,cpu_data_1(7),cpu_data(7));
  r_w_latch: Dlatch port map(temp1,start,r_w,temp2);
  addr_latch: Dlatch_8bit port map(cpu_add,start,cpu_addr_1,temp3);
  data_latch: Dlatch_8bit port map(cpu_data,start,cpu_d,temp4);
  mem_addr_latch: Dlatch_8bit port map(cpu_addr_1,RM,mem_addr,temp6);
  hit_miss_1: hit_miss port map(cpu_addr_1(7 downto 5),valid_1,tag_1,h_m);
  state_machine_1: state_machine port map(RM,RH,WM,WH,clk,start_1,busy_1,counter);
  cache_1: cache port map(cache_data,cpu_addr,r_w_1,h_m,clk,cpu_data_1);
  cache_tag_1: cache_tag port map(cpu_addr_1(4 downto 2),cpu_addr_1(7 downto 5),tag_valid_write,tag_1,clk);
  cache_valid_1: cache_valid port map(cpu_addr_1(4 downto 2),RM,tag_valid_write,valid_1,reset,clk);
  --output_1: Dlatch_8bit port map(rd_data,idle,cpu_data,temp5);

end structural;
