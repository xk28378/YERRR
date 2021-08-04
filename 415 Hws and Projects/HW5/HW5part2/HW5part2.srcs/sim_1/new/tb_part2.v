`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2021 02:57:25 PM
// Design Name: 
// Module Name: tb_part2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_part2;
//inputs
reg clk,rst, start, a_write_en, b_write_en, p_read_en;
reg [6:0] a_addr, b_addr, p_addr;
reg signed [15:0] a_data, b_data;
integer count = 0;
//fucntion instantiation
part2 test(.clk(clk), .rst(rst), .start(start), .a_write_en(a_write_en), .b_write_en(b_write_en), .p_read_en(p_read_en),
        .a_addr(a_addr), .b_addr(b_addr), .p_addr(p_addr),
        .a_data(a_data), .b_data(b_data),
        .p_data(p_data),
        .done(done));
//clk set up
always#1 clk = !clk;
initial begin
clk = 0;
//reset
rst = 1;
#10
rst = 0;
#5
//Initialize Inputs
start = 1;
a_write_en = 1;
b_write_en = 1;
p_read_en = 1;
a_addr = 0;
b_addr = 0;
p_addr = 0;
a_data = 1;
b_data = 127;
    while(count < 128)begin //change input values
    #10
    a_addr = a_addr + 1;
    b_addr = b_addr + 1;
    p_addr = p_addr + 1;
    a_data = a_data + 1;
    b_data = b_data - 1;
    count = count + 1;
    end
end
endmodule
