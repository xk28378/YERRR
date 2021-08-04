`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2021 01:44:43 PM
// Design Name: 
// Module Name: or16
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


module or16

#(parameter data_width = 16)
    (
        input [data_width-1:0] A,
        input [data_width-1:0] B,
        output [data_width-1:0] Y
    );
        
        reg [data_width-1:0] Y_internal;
        
        always @(*) begin
            Y_internal = A | B;
        end
        
        assign Y = Y_internal;
        
endmodule
