`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2021 08:15:29 PM
// Design Name: 
// Module Name: cathode
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


module cathode(
    input [3:0] value,
    output reg [7:0] CAT
    );
    
    always@(value)begin
        case(value)
            4'b0000:
                CAT = 8'b11000000;
            4'b0001:
                CAT = 8'b11111001;
            4'b0010:
                CAT = 8'b00100100;
            4'b0011:
                CAT = 8'b00110000;
            4'b0100:
                CAT = 8'b00011001;
            4'b0101:
                CAT = 8'b00010010;
            4'b0110:
                CAT = 8'b00000010;
            4'b0111:
                CAT = 8'b01111000;       
            4'b1000:
                CAT = 8'b00000000;        
            4'b1001:
                CAT = 8'b00010000;         
            4'b1010:
                CAT = 8'b00001000;       
            4'b1011:
                CAT = 8'b00000011;
            4'b1100:
                CAT = 8'b01000110; 
            4'b1101:
                CAT = 8'b00100001;            
            4'b1110:
                CAT = 8'b00000110;           
            4'b1111:
                CAT = 8'b00001110; 
        endcase
        end
endmodule
