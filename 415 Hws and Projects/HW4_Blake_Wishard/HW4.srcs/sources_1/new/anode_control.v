`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2021 07:50:40 PM
// Design Name: 
// Module Name: anode_control
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


module anode_control(
input [2:0] clk_out,
output reg [7:0] AN
    );
    always@(clk_out)begin
        case(clk_out)
            3'b000:
                AN = 8'b11111110;
            3'b001:
                AN = 8'b11111101;
            3'b010:
                AN = 8'b11111011;
            3'b011:
                AN = 8'b11110111;
            3'b100:
                AN = 8'b11101111;
            3'b101:
                AN = 8'b11011111;
            3'b110:
                AN = 8'b10111111;
            3'b111:
                AN = 8'b01111111;
        endcase
    end
 
endmodule
