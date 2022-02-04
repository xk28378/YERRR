-- Created by @(#)$CDS: vhdlin version 6.1.7-64b 09/27/2016 19:46 (sjfhw304) $
-- on Wed Dec  1 01:14:08 2021


architecture structural of cache_1bit is
  component Dlatch 
  port ( 
    d   : in  std_logic;
    clk : in  std_logic;
    q   : out std_logic;
    qbar: out std_logic); 
  end component;
  component tran_gate
  port ( 
    sel   : in std_logic;
    input : in std_logic;
    output:out std_logic
  );
  end component; 
  signal mid1, mid2: std_logic;
begin
    unit1: Dlatch port map(wr_data,w_r_en,mid1,mid2);
    unit2: tran_gate port map(w_r_en,mid1,rd_data);
end structural;          