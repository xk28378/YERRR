--
-- Entity: dff
-- Architecture : structural
-- Author: cpatel2
--

library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;       

entity dff is                      
  port ( d   : in  std_logic;
         clk : in  std_logic;
         rst: in std_logic;
         q   : out std_logic;
         qbar: out std_logic); 
end dff;                          

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
  output7: in std_logic
);
end component;
component and2
port(
  input1: in std_logic;
  input2: in std_logic;
  output: out std_logic
);
end component;
  signal in1,rst_bar,clk_bar, in2, mid1,mid2: std_logic;
begin
  -- clk_bar <= not clk;
  inverter1: inverter port map(clk, clk_bar);
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
