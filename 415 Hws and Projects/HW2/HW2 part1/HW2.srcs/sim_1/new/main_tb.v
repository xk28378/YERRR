`timescale 1ns / 1ps

module main_tb();

 reg a = 1'b0;  
 reg b = 1'b0;
 reg c = 1'b0;  
 
 wire out;

main uut_main(.a(a),.b(b),.out(out));


endmodule
