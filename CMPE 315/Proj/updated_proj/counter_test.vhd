library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity counter_test is

end counter_test;

architecture test of counter_test is

component counter
  port(
    clk: in std_logic;
    rst: in std_logic;
    out1: out std_logic_vector(18 downto 0)
  );
end component;

for counter_1 : counter use entity work.counter(structural);
  signal out_1 : std_logic_vector(18 downto 0):="0000000000000000000";
  signal clock: std_logic;
  signal rst_1: std_logic:='1';
  signal in_1 : std_logic;

procedure print_output is
    variable out_line: line;
 
    begin
    write (out_line, string'(" Clk: "));
    write (out_line, clock);
    write (out_line, string'(" Rst: "));
    write (out_line, rst_1);
    writeline(output, out_line);
    write (out_line, string'(" Out: "));
    write (out_line, out_1);
    writeline(output, out_line);
    writeline(output, out_line);
 end print_output;
 
begin

counter_1 : counter port map (clock,rst_1,out_1);

clk : process
   begin  -- process clk

    clock<='0','1' after 5 ns;
    wait for 10 ns;

  end process clk;
  
io_process: process

begin
  --set reset high to start and then low after to see 1 shift across
  for i in 0 to 20 loop
    if(i <= 0) then
    rst_1 <= '1';
    else
    rst_1 <= '0';
    end if;
    wait until falling_edge(clock);
    print_output;
  end loop;


end process io_process;

end test;
