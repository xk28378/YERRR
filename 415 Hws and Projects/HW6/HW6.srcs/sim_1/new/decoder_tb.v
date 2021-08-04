`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2021 04:18:50 PM
// Design Name: 
// Module Name: decoder_tb
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


module decoder_tb();

reg [6:0] rec_word;
wire error_check;
wire [2:0] error_bit;

decoder DUT(.rec_word(rec_word),.error_check(error_check),.error_bit(error_bit));

initial
    begin
        rec_word = 7'b1111000;
        
        #50
        rec_word = 7'b0110111;
        
        #50
        rec_word = 7'b1000111;
        
        #50
        rec_word = 7'b0111010;
        
    end
endmodule
