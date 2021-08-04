`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2021 05:57:06 PM
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


module SSD(
    input clk,
    input rst,
    input [15:0] rd_data,
    input [15:0] rs_data, 
    output reg [7:0] AN0,
    output reg [7:0] AN1,
    output reg [7:0] AN2,
    output reg [7:0] AN3,
    output reg [7:0] AN4,
    output reg [7:0] AN5,
    output reg [7:0] AN6,
    output reg [7:0] AN7
    );
    
    always @(posedge clk)begin
        if(!rst)begin
            AN0 <= 8'b00111111;
            AN1 <= 8'b00111111;
            AN2 <= 8'b00111111;
            AN3 <= 8'b00111111;
            AN4 <= 8'b00111111;
            AN5 <= 8'b00111111;
            AN6 <= 8'b00111111;
            AN7 <= 8'b00111111;
        end 
        else begin
            if(rs_data[7:0] == 0)begin
                AN0 <= 8'b00111111;
                AN2 <= 8'b00111111;
            end 
            else if(rs_data[7:0] == 1)begin
                AN0 <= 8'b00000110;
                AN2 <= 8'b00000110;
            end
            else if(rs_data[7:0] == 2)begin
                AN0 <= 8'b01011011;
                AN2 <= 8'b01011011;
            end
            else if(rs_data[7:0] == 3)begin
                AN0 <= 8'b01001111;
                AN2 <= 8'b01001111;
            end
            else if(rs_data[7:0] == 4)begin
                AN0 <= 8'b01100110;
                AN2 <= 8'b01100110;
            end
            else if(rs_data[7:0] == 5)begin
                AN0 <= 8'b01101101;
                AN2 <= 8'b01101101;
            end
            else if(rs_data[7:0] == 6)begin
                AN0 <= 8'b01111101;
                AN2 <= 8'b01111101;
            end
           else if(rs_data[7:0] == 7)begin
                AN0 <= 8'b00000111;
                AN2 <= 8'b00000111;
            end
            else if(rs_data[7:0] == 8)begin
                AN0 <= 8'b01111111;
                AN2 <= 8'b01111111;
            end
            else if(rs_data[7:0] == 9)begin
                AN0 <= 8'b01101111;
                AN2 <= 8'b01101111;
            end
            else if(rs_data[7:0] == 10)begin
                AN0 <= 8'b01110111;
                AN2 <= 8'b01110111;
            end
            else if(rs_data[7:0] == 11)begin
                AN0 <= 8'b01111100;
                AN2 <= 8'b01111100;
            end
            else if(rs_data[7:0] == 12)begin
                AN0 <= 8'b00111001;
                AN2 <= 8'b00111001;
            end
            else if(rs_data[7:0] == 13)begin
                AN0 <= 8'b01011110;
                AN2 <= 8'b01011110;
            end
            else if(rs_data[7:0] == 14)begin
                AN0 <= 8'b01111001;
                AN2 <= 8'b01111001;
            end
            else if(rs_data[7:0] == 15)begin
                AN0 <= 8'b01110001;
                AN2 <= 8'b01110001;
            end
            
            //second and fourth ssd
            
            if(rs_data[15:8] == 0)begin
                AN1 <= 8'b00111111;
                AN3 <= 8'b00111111;
            end 
            else if(rs_data[15:8] == 1)begin
                AN1 <= 8'b00000110;
                AN3 <= 8'b00000110;
            end
            else if(rs_data[15:8] == 2)begin
                AN1 <= 8'b01011011;
                AN3 <= 8'b01011011;
            end
            else if(rs_data[15:8] == 3)begin
                AN1 <= 8'b01001111;
                AN3 <= 8'b01001111;
            end
            else if(rs_data[15:8] == 4)begin
                AN1 <= 8'b01100110;
                AN3 <= 8'b01100110;
            end
            else if(rs_data[15:8] == 5)begin
                AN1 <= 8'b01101101;
                AN3 <= 8'b01101101;
            end
            else if(rs_data[15:8] == 6)begin
                AN1 <= 8'b01111101;
                AN3 <= 8'b01111101;
            end
           else if(rs_data[15:8] == 7)begin
                AN1 <= 8'b00000111;
                AN3 <= 8'b00000111;
            end
            else if(rs_data[15:8] == 8)begin
                AN1 <= 8'b01111111;
                AN3 <= 8'b01111111;
            end
            else if(rs_data[15:8] == 9)begin
                AN1 <= 8'b01101111;
                AN3 <= 8'b01101111;
            end
            else if(rs_data[15:8] == 10)begin
                AN1 <= 8'b01110111;
                AN3 <= 8'b01110111;
            end
            else if(rs_data[15:8] == 11)begin
                AN1 <= 8'b01111100;
                AN3 <= 8'b01111100;
            end
            else if(rs_data[15:8] == 12)begin
                AN1 <= 8'b00111001;
                AN3 <= 8'b00111001;
            end
            else if(rs_data[15:8] == 13)begin
                AN1 <= 8'b01011110;
                AN3 <= 8'b01011110;
            end
            else if(rs_data[15:8] == 14)begin
                AN1 <= 8'b01111001;
                AN3 <= 8'b01111001;
            end
            else if(rs_data[15:8] == 15)begin
                AN1 <= 8'b01110001;
                AN3 <= 8'b01110001;
            end
            
            //rd_data segment
            //first and third ssd
            
            if(rd_data[7:0] == 0)begin
                AN4 <= 8'b00111111;
                AN6 <= 8'b00111111;
            end 
            else if(rd_data[7:0] == 1)begin
                AN4 <= 8'b00000110;
                AN6 <= 8'b00000110;
            end
            else if(rd_data[7:0] == 2)begin
                AN4 <= 8'b01011011;
                AN6 <= 8'b01011011;
            end
            else if(rd_data[7:0] == 3)begin
                AN4 <= 8'b01001111;
                AN6 <= 8'b01001111;
            end
            else if(rd_data[7:0] == 4)begin
                AN4 <= 8'b01100110;
                AN6 <= 8'b01100110;
            end
            else if(rd_data[7:0] == 5)begin
                AN4 <= 8'b01101101;
                AN6 <= 8'b01101101;
            end
            else if(rd_data[7:0] == 6)begin
                AN4 <= 8'b01111101;
                AN6 <= 8'b01111101;
            end
           else if(rd_data[7:0] == 7)begin
                AN4 <= 8'b00000111;
                AN6 <= 8'b00000111;
            end
            else if(rd_data[7:0] == 8)begin
                AN4 <= 8'b01111111;
                AN6 <= 8'b01111111;
            end
            else if(rd_data[7:0] == 9)begin
                AN4 <= 8'b01101111;
                AN6 <= 8'b01101111;
            end
            else if(rd_data[7:0] == 10)begin
                AN4 <= 8'b01110111;
                AN6 <= 8'b01110111;
            end
            else if(rd_data[7:0] == 11)begin
                AN4 <= 8'b01111100;
                AN6 <= 8'b01111100;
            end
            else if(rd_data[7:0] == 12)begin
                AN4 <= 8'b00111001;
                AN6 <= 8'b00111001;
            end
            else if(rd_data[7:0] == 13)begin
                AN4 <= 8'b01011110;
                AN6 <= 8'b01011110;
            end
            else if(rd_data[7:0] == 14)begin
                AN4 <= 8'b01111001;
                AN6 <= 8'b01111001;
            end
            else if(rd_data[7:0] == 15)begin
                AN4 <= 8'b01110001;
                AN6 <= 8'b01110001;
            end
            
            //second and fourth ssd
            
            if(rd_data[15:8] == 0)begin
                AN5 <= 8'b00111111;
                AN7 <= 8'b00111111;
            end 
            else if(rd_data[15:8] == 1)begin
                AN5 <= 8'b00000110;
                AN7 <= 8'b00000110;
            end
            else if(rd_data[15:8] == 2)begin
                AN5 <= 8'b01011011;
                AN7 <= 8'b01011011;
            end
            else if(rd_data[15:8] == 3)begin
                AN5 <= 8'b01001111;
                AN7 <= 8'b01001111;
            end
            else if(rd_data[15:8] == 4)begin
                AN5 <= 8'b01100110;
                AN7 <= 8'b01100110;
            end
            else if(rd_data[15:8] == 5)begin
                AN5 <= 8'b01101101;
                AN7 <= 8'b01101101;
            end
            else if(rd_data[15:8] == 6)begin
                AN5 <= 8'b01111101;
                AN7 <= 8'b01111101;
            end
           else if(rd_data[15:8] == 7)begin
                AN5 <= 8'b00000111;
                AN7 <= 8'b00000111;
            end
            else if(rd_data[15:8] == 8)begin
                AN5 <= 8'b01111111;
                AN7 <= 8'b01111111;
            end
            else if(rd_data[15:8] == 9)begin
                AN5 <= 8'b01101111;
                AN7 <= 8'b01101111;
            end
            else if(rd_data[15:8] == 10)begin
                AN5 <= 8'b01110111;
                AN7 <= 8'b01110111;
            end
            else if(rd_data[15:8] == 11)begin
                AN5 <= 8'b01111100;
                AN7 <= 8'b01111100;
            end
            else if(rd_data[15:8] == 12)begin
                AN5 <= 8'b00111001;
                AN7 <= 8'b00111001;
            end
            else if(rd_data[15:8] == 13)begin
                AN5 <= 8'b01011110;
                AN7 <= 8'b01011110;
            end
            else if(rd_data[15:8] == 14)begin
                AN5 <= 8'b01111001;
                AN7 <= 8'b01111001;
            end
            else if(rd_data[15:8] == 15)begin
                AN5 <= 8'b01110001;
                AN7 <= 8'b01110001;
            end
        
        end
    end
endmodule
