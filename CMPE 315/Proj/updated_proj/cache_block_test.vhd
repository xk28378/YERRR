library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cache_block_test is

end cache_block_test;

architecture test of cache_block_test is

component cache_block
  port (
    byte_off: in std_logic_vector(1 downto 0);
    wr_data: in std_logic_vector(7 downto 0);
    w_r_en: in std_logic; 
    h_m: in std_logic;
    clk: in std_logic;
    rd_data: out std_logic_vector(7 downto 0));
end component;

for cache_block_1 : cache_block use entity work.cache_block(structural);
  signal wr_d : std_logic_vector(7 downto 0);
  signal rd_d : std_logic_vector(7 downto 0);
  signal bite_off: std_logic_vector(1 downto 0);
  signal clock,w_r_e,hit_m : std_logic;

procedure print_output is
    variable out_line: line;
 
    begin
    write (out_line, string'(" Byte_offset:"));
    write (out_line, bite_off);
    write (out_line, string'(" Write_data:"));
    write (out_line, wr_d);
    write (out_line, string'(" w/r_en:"));
    write (out_line, w_r_e);
    write (out_line, string'(" h_m:"));
    write (out_line, hit_m);
    writeline(output, out_line);
    write (out_line, string'(" Output:"));
    write (out_line, rd_d);
    writeline(output, out_line);
    writeline(output, out_line);
 end print_output;
 
begin

cache_block_1 : cache_block port map (bite_off,wr_d,w_r_e,hit_m,clock,rd_d);

clk : process
   begin  -- process clk

    clock<='0','1' after 5 ns;
    wait for 10 ns;

  end process clk;
  
io_process: process

  file infile  : text is in "cache_1bit_in.txt";
  file outfile : text is out "cache_1bit_out.txt";
  variable wr_d1: std_logic_vector(7 downto 0);
  variable rd_d1: std_logic_vector(7 downto 0);
  variable bite_off1: std_logic_vector(1 downto 0);
  variable w_r_e1,hit_m1 : std_logic;
  variable buf : line;

begin

  while not (endfile(infile)) loop


    readline(infile,buf);
    read (buf,bite_off1);
    bite_off<=bite_off1;

    readline(infile,buf);
    read (buf,wr_d1);
    wr_d<=wr_d1;

    readline(infile,buf);
    read (buf,w_r_e1);
    w_r_e<=w_r_e1;

    readline(infile,buf);
    read (buf,hit_m1);
    hit_m<=hit_m1;



    wait until falling_edge(clock);
    rd_d1:=rd_d;
    --print_output;
    
    

  end loop;

end process io_process;

end test;
