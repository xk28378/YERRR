--
-- Entity: same_clk_dff
-- Architecture : structural
-- Author: cpatel2
--

library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;       

entity same_clk_dff is                      
  port ( d   : in  std_logic;
         clk : in  std_logic;
         rst: in std_logic;
         q   : out std_logic;
         qbar: out std_logic); 
end same_clk_dff;                          

architecture structural of same_clk_dff is 
component negative_Dlatch                      
  port ( d   : in  std_logic;
         clk : in  std_logic;
         q   : out std_logic;
         qbar: out std_logic); 
end component;
  signal in1, in2, mid1,mid2: std_logic;
begin
  in1 <= d and not rst;
  in2 <= mid1 and not rst;
  negative_Dlatch1: negative_Dlatch port map(in1,clk,mid1,mid2);
  negative_Dlatch2: negative_Dlatch port map(in2,clk,q,qbar);
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
