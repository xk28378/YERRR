-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Wed Dec  1 00:30:44 2021


architecture structural of Dlatch_8bit is 
component Dlatch 
port ( d   : in  std_logic;
    clk : in  std_logic;
    q   : out std_logic;
    qbar: out std_logic);
end component;
begin
  unit1: Dlatch port map(d(0),clk,q(0),qbar(0));
  unit2: Dlatch port map(d(1),clk,q(1),qbar(1));
  unit3: Dlatch port map(d(2),clk,q(2),qbar(2));
  unit4: Dlatch port map(d(3),clk,q(3),qbar(3));
  unit5: Dlatch port map(d(4),clk,q(4),qbar(4));
  unit6: Dlatch port map(d(5),clk,q(5),qbar(5));
  unit7: Dlatch port map(d(6),clk,q(6),qbar(6));
  unit8: Dlatch port map(d(7),clk,q(7),qbar(7));


end structural;