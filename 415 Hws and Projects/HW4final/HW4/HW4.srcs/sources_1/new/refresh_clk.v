`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2021 08:33:32 PM
// Design Name: 
// Module Name: refresh_clk
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


module refresh_clk(
    input clk,
    output reg[2:0] refresh_out = 0
    );
    always @(posedge clk) begin
       refresh_out <= refresh_out +1;
   end
endmodule
