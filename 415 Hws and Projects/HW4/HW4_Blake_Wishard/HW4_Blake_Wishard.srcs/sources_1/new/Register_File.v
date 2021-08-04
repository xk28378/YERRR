`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2021 05:09:05 PM
// Design Name: 
// Module Name: SSD
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


module Register_File(
    
    input clk,
    input WRITE_enable,
    input RS_enable,
    input RD_enable,
    input [15:0] Write_data,
    input [3:0] RD_addr,
    input [3:0] RS_addr,
    output reg[15:0] RD_data,
    output reg[15:0] RS_data
    );
    reg [15:0] ALU_CPU [15:0];
    assign WRITE_enable = 1;
    assign RS_enable = 1;
    assign RD_enable = 1;
    always @(posedge clk)
    begin   
        if(WRITE_enable)begin
            ALU_CPU[RD_addr]<= Write_data;
            if(RS_enable)begin
                RS_data <= ALU_CPU[RS_addr];
                if(RD_enable)begin
                    RD_data <= ALU_CPU[RD_addr];
                end
            end
        end
    end
endmodule
