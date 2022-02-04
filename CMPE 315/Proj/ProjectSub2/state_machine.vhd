library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity state_machine is 
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
end state_machine;
architecture structural of state_machine is
  component counter 
  port(
    clk: in std_logic;
    rst: in std_logic;
    out1: out std_logic_vector(18 downto 0)
  );
  end component;
  component Dlatch_19bit 
  port ( 
    d   : in  std_logic_vector(18 downto 0);
    clk : in  std_logic;
    q   : out std_logic_vector(18 downto 0);
    qbar: out std_logic_vector(18 downto 0));
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
  signal busy_check,temp1, temp2, temp3, temp4,or1,or__2,or3,or4,rst_bar,busy_check_bar: std_logic;
  signal sel: std_logic_vector(1 downto 0);
  signal out1: std_logic_vector(18 downto 0):= "0000000000000000000";
begin
  counter_1: counter port map(clk, rst, out1);
  encoder: encoder4_2 port map(RM,RH,WM,WH,sel);
  -- temp1 <= (out1(17) or out1(18)) and RM;
  -- temp2 <= (out1(0) or out1(1)) and RH;
  -- temp3 <= (out1(1) or out1(2)) and WM;
  -- temp4 <= (out1(1) or out1(2)) and WH;
  or_1: or2 port map(out1(17),out1(18),or1);
  or_2: or2 port map(out1(0),out1(1),or__2);
  or_3: or2 port map(out1(1),out1(2),or3);
  or_4: or2 port map(out1(1),out1(2),or4);
  and_1: and2 port map(or1,RM,temp1);
  and_2: and2 port map(or__2,RH,temp2);
  and_3: and2 port map(or3,WM,temp3);
  and_4: and2 port map(or4,WH,temp4);
  mux: mux_4_1 port map(temp1, temp2,temp3,temp4,sel(0),sel(1),busy_check);
  -- rm_latch: Dlatch_19bit port map(out1,RM,count,temp1);
  -- rh_latch: Dlatch_19bit port map(out2,RH,count,temp2);
  -- wm_latch: Dlatch_19bit port map(out3, WM,count,temp3);
  -- wh_latch: Dlatch_19bit port map(out4, WH,count, temp3);
  -- busy <= (not busy_check and not rst);
  inverter_1: inverter port map(rst,rst_bar);
  inverter_2: inverter port map(busy_check,busy_check_bar);
  and_5: and2 port map(rst_bar, busy_check_bar,busy);
  count <= out1;
  -- count(18 downto 0) <= out1;
  -- count(37 downto 19) <= out2;
  -- count(56 downto 38) <= out3;
  -- count(60 downto 57) <= rm_rst & rh_rst & wm_rst & wh_rst;
end structural;
