`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2021 03:49:18 PM
// Design Name: 
// Module Name: decoder
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


module decoder(

    input [6:0] rec_word,
    output [2:0] error_bit,
    output error_check
    );
    
    wire [2:0] computed;
    wire [2:0] received;
    
    //received
    assign received = {rec_word[3],rec_word[1],rec_word[0]};
     
     //computed
     assign computed[0] = rec_word[2] ^ rec_word[4] ^ rec_word[6];
     assign computed[1] = rec_word[2] ^ rec_word[5] ^ rec_word[6];
     assign computed[2] = rec_word[4] ^ rec_word[5] ^ rec_word[6];
    
    //get error bits 
     assign error_bit = computed ^ received;
    
    //check if there is an error
     assign error_check = error_bit[0] | error_bit[1] | error_bit[2];
        
    endmodule
