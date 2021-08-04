`timescale 1ns / 1ps

module tb_part4;
//variables
reg clk,clr,enable,up,load;
reg[3:0] V;
wire [3:0] Q;
wire rc0;

part4 test_unit(.CLK(clk),.CLR(clr), .UP(up), .Q(Q), .ENABLE(enable), .LOAD(load), .V(V), .RC0(rc0));
//start clock
always #5 clk = (clk ^ 1'b1);

initial begin
//setup
clk = 0;
#5
up = 1;
#10
clr = 1;

//first 10 cycles
#10
clr = 0;
enable = 1;
up = 1;
load = 0;
//hold value for 5 cycles
#100 enable = 0;
//count down  for 20 cycles
#50 enable = 1;up = 0;
//clear counter
#195 clr = 1;
//load V value into counter
#5 clr = 0; V = 4'b1100;load = 1; up = 1;  
#5 clr = 0; load = 0;
//count up for 11 cycles
#115 enable = 0;
end
endmodule
