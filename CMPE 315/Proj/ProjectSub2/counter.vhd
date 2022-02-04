library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity counter is 
  port(
    clk: in std_logic;
    rst: in std_logic;
    out1: out std_logic_vector(18 downto 0)
  );
end counter;

architecture structural of counter is 
  component dff
  port ( d   : in  std_logic;
    clk : in  std_logic;
    rst: in std_logic;
    q   : out std_logic;
    qbar: out std_logic); 
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
  signal in_1,out_1,out_2,out_3,out_4,out_5,out_6,out_7,out_8,out_9,out_10,out_11,out_12,out_13,out_14,out_15,out_16,out_17,out_18,out_19: std_logic;
  signal temp_1,temp_2,temp_3,temp_4,temp_5,temp_6,temp_7,temp_8,temp_9,temp_10,temp_11,temp_12,temp_13,temp_14,temp_15,temp_16,temp_17,temp_18,temp_19: std_logic;
  signal or1,or__2,or3,or4,or5,or6,or7,or8,or9,or10,or11,or12,or13,or14,or15,or16,or17,or18,or19: std_logic;
begin
  -- in_1 <= not(out_1 or out_2 or out_3 or out_4 or out_5 or out_6 or out_7 or out_8 or out_9 or out_10 or out_11  or out_12  or out_13  or out_14  or out_15  or out_16  or out_17  or out_18  or out_19 ) or rst;
  or_1: or2 port map(out_1, out_2,or1);
  or_2: or2 port map(or1, out_3,or__2);
  or_3: or2 port map(or__2, out_4,or3);
  or_4: or2 port map(or3, out_5,or4);
  or_5: or2 port map(or4, out_6,or5);
  or_6: or2 port map(or5, out_7,or6);
  or_7: or2 port map(or6, out_8,or7);
  or_8: or2 port map(or7, out_9,or8);
  or_9: or2 port map(or8, out_10,or9);
  or_10: or2 port map(or9, out_11,or10);
  or_11: or2 port map(or10, out_12,or11);
  or_12: or2 port map(or11, out_13,or12);
  or_13: or2 port map(or12, out_14,or13);
  or_14: or2 port map(or13, out_15,or14);
  or_15: or2 port map(or14, out_16,or15);
  or_16: or2 port map(or15, out_17,or16);
  or_17: or2 port map(or16, out_18,or17);
  or_18: or2 port map(or17, out_19,or18);
  inverter1: inverter port map(or18,or19);
  or_19: or2 port map(or19,rst,in_1);
  out1(0) <= out_1;--and not rst;
  out1(1) <= out_2 ;--and not rst;
  out1(2) <= out_3 ;--and not rst;
  out1(3) <= out_4 ;--and not rst;
  out1(4) <= out_5 ;--and not rst;
  out1(5) <= out_6 ;--and not rst;
  out1(6) <= out_7 ;--and not rst;
  out1(7) <= out_8 ;--and not rst;
  out1(8) <= out_9 ;--and not rst;
  out1(9) <= out_10 ;--and not rst;
  out1(10) <= out_11 ;--and not rst;
  out1(11) <= out_12 ;--and not rst;
  out1(12) <= out_13 ;--and not rst;
  out1(13) <= out_14 ;--and not rst;
  out1(14) <= out_15 ;--and not rst;
  out1(15) <= out_16 ;--and not rst;
  out1(16) <= out_17 ;--and not rst;
  out1(17) <= out_18 ;--and not rst;
  out1(18) <= out_19 ;--and not rst;
  unit1: dff port map(in_1,clk,rst,out_1, temp_1);
  unit2: dff port map(out_1,clk,rst,out_2, temp_2);
  unit3: dff port map(out_2,clk,rst,out_3, temp_3);
  unit4: dff port map(out_3,clk,rst,out_4, temp_4);
  unit5: dff port map(out_4,clk,rst,out_5, temp_5);
  unit6: dff port map(out_5,clk,rst,out_6, temp_6);
  unit7: dff port map(out_6,clk,rst,out_7, temp_7);
  unit8: dff port map(out_7,clk,rst,out_8, temp_8);
  unit9: dff port map(out_8,clk,rst,out_9, temp_9);
  unit10: dff port map(out_9,clk,rst,out_10, temp_10);
  unit11: dff port map(out_10,clk,rst,out_11, temp_11);
  unit12: dff port map(out_11,clk,rst,out_12, temp_12);
  unit13: dff port map(out_12,clk,rst,out_13, temp_13);
  unit14: dff port map(out_13,clk,rst,out_14, temp_14);
  unit15: dff port map(out_14,clk,rst,out_15, temp_15);
  unit16: dff port map(out_15,clk,rst,out_16, temp_16);
  unit17: dff port map(out_16,clk,rst,out_17, temp_17);
  unit18: dff port map(out_17,clk,rst,out_18, temp_18);
  unit19: dff port map(out_18,clk,rst,out_19, temp_19);
end structural;
