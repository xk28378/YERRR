`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2021 05:19:07 PM
// Design Name: 
// Module Name: pow_position
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
module pow_position(pos,clk,rst,init,d);

    input [15:0] init, d;
    input clk, rst;
    output reg [15:0] pos;  
    
    wire [15:0] random2init, powpos;
     
    //random pow position
    random2 random2_intan(.pos(random2init));
   
    assign init = random2init;
    assign d = pos;
    //initial
    assign init = 16'b0000000000000001;
    
    
    always@(posedge clk) 
    begin
        //starting the game and saving the players possition
        if(rst) begin
            pos <= init; 
        end  
        //now saving the pos posistion 
        else
            pos <= d;
        end
    
endmodule
