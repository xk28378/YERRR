-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Wed Dec  1 01:30:49 2021


architecture structural of dff is 
component Dlatch
  port ( d   : in  std_logic;
         clk : in  std_logic;
         q   : out std_logic;
         qbar: out std_logic); 
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
  signal in1,rst_bar,clk_bar, in2, mid1,mid2, temp: std_logic;
begin
  -- clk_bar <= not clk;
  inverter1: inverter port map(clk, clk_bar);
  inverter2: inverter port map(rst,rst_bar);
  and_1: and2 port map(d,rst_bar,in1);
  and_2: and2 port map(mid1,rst_bar,in2);
  -- in1 <= d and not rst;
  -- in2 <= mid1 and not rst;
  Dlatch1: Dlatch port map(in1,clk,mid1,mid2);
  Dlatch2: Dlatch port map(in2,clk_bar,q,qbar);
  -- output: process

  -- begin
  --   wait until ( clk'EVENT and clk = '0' and rst = '0' ); 
  --   q <= d;
  --   qbar <= not d ;
  --   wait until ( clk'EVENT and clk = '0' and rst = '1');
  --   q <= '0';
  --   qbar <= not d ;
  -- end process output;


end structural;
