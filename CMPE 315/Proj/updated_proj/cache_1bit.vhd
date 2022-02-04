library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cache_1bit is 
port(
  wr_data: in std_logic;
  w_r_en: in std_logic;
  rd_data: out std_logic
);
end cache_1bit;

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