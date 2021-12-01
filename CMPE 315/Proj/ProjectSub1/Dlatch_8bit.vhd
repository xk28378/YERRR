library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity Dlatch_8bit is 
port ( 
    d   : in  std_logic_vector(7 downto 0);
    clk : in  std_logic;
    q   : out std_logic_vector(7 downto 0);
    qbar: out std_logic_vector(7 downto 0));
end Dlatch_8bit;

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