`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2021 06:15:20 PM
// Design Name: 
// Module Name: mod16
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


module mod16
    #(parameter data_width = 16)
    (
        input [data_width-1:0] A,
        input [data_width-1:0] B,
        output [data_width-1:0] Y
    );
        
        reg [data_width-1:0] Y_internal;
        
        always @(*) begin
            Y_internal = A % B;
        end
        
        assign Y = Y_internal;
endmodule
