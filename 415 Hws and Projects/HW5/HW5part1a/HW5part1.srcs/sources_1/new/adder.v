`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2021 04:31:09 PM
// Design Name: 
// Module Name: adder
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
module adder(
    output reg signed [10:0] save_sum,
    input signed [9:0] a,b,
    input clk);
                
reg signed [9:0] save_a, save_b;
wire signed [10:0] sum;

always @(posedge clk) begin
    save_a <= a;
    save_b <= b;
end

assign sum = save_a + save_b;

always @(posedge clk)begin
    save_sum <= sum;
end

endmodule