library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cache_test is

end cache_test;

architecture test of cache_test is

component cache
port(
  CPU_data: in std_logic_vector(7 downto 0);
  CPU_addr: in std_logic_vector(7 downto 0);
  R_W: in  std_logic;
  h_m: in std_logic;
  clk: in std_logic;
  rd_data: out std_logic_vector(7 downto 0)
);
end component;

for cache_1 : cache use entity work.cache(structural);
  signal CPU_data_1: std_logic_vector(7 downto 0);
  signal rd_data_1 : std_logic_vector(7 downto 0);
  signal CPU_addr_1: std_logic_vector(7 downto 0);
  signal clock,R_W_1,hit_m : std_logic;

procedure print_output is
    variable out_line: line;
 
    begin
    write (out_line, string'(" CPU_data:"));
    write (out_line, CPU_data_1);
    write (out_line, string'(" CPU_addr"));
    write (out_line, CPU_addr_1);
    write (out_line, string'(" R_W:"));
    write (out_line, R_W_1);
    write (out_line, string'(" h_m:"));
    write (out_line, hit_m);
    write (out_line, string'(" CLK:"));
    write (out_line, clock);
    writeline(output, out_line);
    write (out_line, string'(" rd_data:"));
    write (out_line, rd_data_1);
    writeline(output, out_line);
    -- write (out_line, rd_data_1(31 downto 0));
    -- writeline(output, out_line);
    -- write (out_line, rd_data_1(63 downto 7));
    -- writeline(output, out_line);
    -- write (out_line, rd_data_1(95 downto 64));
    -- writeline(output, out_line);
    -- write (out_line, rd_data_1(127 downto 96));
    -- writeline(output, out_line);
    -- write (out_line, rd_data_1(159 downto 128));
    -- writeline(output, out_line);
    -- write (out_line, rd_data_1(191 downto 160));
    -- writeline(output, out_line);
    -- write (out_line, rd_data_1(223 downto 192));
    -- writeline(output, out_line);
    -- write (out_line, rd_data_1(255 downto 224));
    -- writeline(output, out_line);
    -- write (out_line, rd_data_1(7 downto 256));
    writeline(output, out_line);
    writeline(output, out_line);
 end print_output;
 
begin

cache_1 : cache port map (CPU_data_1, CPU_addr_1, R_W_1,hit_m, clock,rd_data_1);

clk : process
   begin  -- process clk

    clock<='0','1' after 5 ns;
    wait for 10 ns;

  end process clk;
  
io_process: process

  file infile  : text is in "cache_in.txt";
  variable CPU_data_11: std_logic_vector(7 downto 0);
  variable rd_data_11 : std_logic_vector(7 downto 0);
  variable CPU_addr_11 : std_logic_vector(7 downto 0);
  variable R_W_11,hit_m_1 : std_logic;
  variable buf : line;

begin

  while not (endfile(infile)) loop


    readline(infile,buf);
    read (buf,CPU_data_11);
    CPU_data_1<=CPU_data_11;

    readline(infile,buf);
    read (buf,CPU_addr_11);
    CPU_addr_1<=CPU_addr_11;

    readline(infile,buf);
    read (buf,R_W_11);
    R_W_1<=R_W_11;

    readline(infile,buf);
    read (buf,hit_m_1);
    hit_m<=hit_m_1;


    wait until falling_edge(clock);
    rd_data_11:=rd_data_1;
    print_output;
    
    

  end loop;

end process io_process;

end test;
