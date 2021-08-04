`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2021 08:03:26 PM
// Design Name: 
// Module Name: BCD_on
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


module BCD_on(
    input [3:0] value1,
    input [3:0] value2,
    input [3:0] value3,
    input [3:0] value4,
    input [3:0] value5,
    input [3:0] value6,
    input [3:0] value7,
    input [3:0] value8,
    input [2:0] clk_out,
    output reg [3:0] out_value
    );
    
    always@(clk_out)begin
        case(clk_out)
            3'b000:
                out_value = value1;
            3'b001:
                out_value = value2;
            3'b010:
                out_value = value3;
            3'b011:
                out_value = value4;
            3'b100:
                out_value = value5;
            3'b101:
                out_value = value6;
            3'b110:
                out_value = value7;
            3'b111:
                out_value = value8;
        endcase
    end
endmodule
