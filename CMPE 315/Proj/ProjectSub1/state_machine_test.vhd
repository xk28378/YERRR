library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity state_machine_test is

end state_machine_test;

architecture test of state_machine_test is

component state_machine
port(
  RM: in std_logic;
  RH: in std_logic;
  WM: in std_logic;
  WH: in std_logic;
  clk: in std_logic;
  rst: in std_logic;
  busy: out std_logic;
  count: out std_logic_vector(18 downto 0)
);
end component;

for state_machine_1 : state_machine use entity work.state_machine(structural);
  signal RM_1: std_logic;
  signal RH_1: std_logic;
  signal WM_1: std_logic;
  signal WH_1: std_logic;
  signal busy_1: std_logic;
  signal clock: std_logic;
  signal rst_1: std_logic;
  signal count_1: std_logic_vector(18 downto 0);

procedure print_output is
    variable out_line: line;
 
    begin
    write (out_line, string'(" RM:"));
    write (out_line, RM_1);
    write (out_line, string'(" RH:"));
    write (out_line, RH_1);
    write (out_line, string'(" WM:"));
    write (out_line, WM_1);
    write (out_line, string'(" WH:"));
    write (out_line, WH_1);
    write (out_line, string'(" CLK:"));
    write (out_line, clock);
    write (out_line, string'(" rst:"));
    write (out_line, rst_1);
    writeline(output, out_line);
    write (out_line, string'(" count:"));
    write (out_line, count_1);
    -- write (out_line, string'(" count:"));
    -- write (out_line, count_1(18 downto 0));
    -- write (out_line, string'(" count:"));
    -- write (out_line, count_1(37 downto 19));
    -- write (out_line, string'(" count:"));
    -- write (out_line, count_1(56 downto 38));
    -- write (out_line, string'(" count:"));
    -- write (out_line, count_1(18 downto 57));
    write (out_line, string'(" busy:"));
    write (out_line, busy_1);
    writeline(output, out_line);
    -- write (out_line, busy_1(31 downto 0));
    -- writeline(output, out_line);
    -- write (out_line, busy_1(63 downto 7));
    -- writeline(output, out_line);
    -- write (out_line, busy_1(95 downto 64));
    -- writeline(output, out_line);
    -- write (out_line, busy_1(127 downto 96));
    -- writeline(output, out_line);
    -- write (out_line, busy_1(159 downto 128));
    -- writeline(output, out_line);
    -- write (out_line, busy_1(191 downto 160));
    -- writeline(output, out_line);
    -- write (out_line, busy_1(223 downto 192));
    -- writeline(output, out_line);
    -- write (out_line, busy_1(255 downto 224));
    -- writeline(output, out_line);
    -- write (out_line, busy_1(7 downto 256));
    writeline(output, out_line);
    writeline(output, out_line);
 end print_output;
 
begin

state_machine_1 : state_machine port map (RM_1, RH_1,WM_1,WH_1,clock,rst_1,busy_1,count_1);

clk : process
   begin  -- process clk

    clock<='0','1' after 5 ns;
    wait for 10 ns;

  end process clk;
  
io_process: process

  file infile  : text is in "state_machine_in.txt";
  variable RM_11: std_logic;
  variable RH_11: std_logic;
  variable WM_11: std_logic;
  variable WH_11: std_logic;
  variable busy_11: std_logic;
  variable rst_11: std_logic;
  variable count_11: std_logic_vector(18 downto 0);
  variable buf : line;

begin

  while not (endfile(infile)) loop


    readline(infile,buf);
    read (buf,RM_11);
    RM_1<=RM_11;

    readline(infile,buf);
    read (buf,RH_11);
    RH_1<=RH_11;

    readline(infile,buf);
    read (buf,WM_11);
    WM_1<=WM_11;

    readline(infile,buf);
    read (buf,WH_11);
    WH_1<=WH_11;

    readline(infile,buf);
    read (buf,rst_11);
    rst_1<=rst_11;

    wait until falling_edge(clock);
    busy_11:=busy_1;
    count_11:=count_1;
    print_output;
    
    
    

  end loop;

  for i in 0 to 30 loop
    wait until falling_edge(clock);
    busy_11:=busy_1;
    count_11:=count_1;
    print_output;
  end loop;

end process io_process;

end test;
