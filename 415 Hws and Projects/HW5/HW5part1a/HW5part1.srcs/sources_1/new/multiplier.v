`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2021 04:31:09 PM
// Design Name: 
// Module Name: multiplier
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


module multiplier(output reg signed [39:0] saved_mult,
                input signed [19:0] a,b,
                input clk);
                
reg signed [19:0] saved_a, saved_b;
wire signed [20:0] mult;

always @(posedge clk) begin
    saved_a <= a;
    saved_b <= b;
end

assign mult = saved_a * saved_b;

always @(posedge clk)begin
    saved_mult <= mult;
end

endmodule
