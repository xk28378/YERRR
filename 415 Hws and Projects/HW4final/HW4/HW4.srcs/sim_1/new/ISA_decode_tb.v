`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2021 02:28:06 PM
// Design Name: 
// Module Name: ISA_decode_tb
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


module ISA_decode_tb;

    reg clk;
    reg rst;
    reg cb;
    reg [15:0] SW;
    wire [7:0] AN;
    ISA_decode test_unit(
    .clk(clk),
    .rst(rst),
    .cb(rst),
    .SW(SW),
    .AN(AN));
    
    always #5 clk = (clk ^ 1'b1);
    
    initial begin
    
    clk = 0;
    #5
    SW = 16'b0001000000011101;
    #20
    SW = 16'b0001011100001110;
    #20
    SW = 16'b0010000001110000;
    
    end

endmodule
