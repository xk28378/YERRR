`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2021 05:19:37 PM
// Design Name: 
// Module Name: position_shifter
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
module position_shifter(pos,clk,rst,rb,lb);

    input rb, lb;
    input clk, rst;
    output reg [7:0] pos;
    
    wire sr_db, sl_db;
    
    
    //button debunces
    Debounce_Top Button_Debounce_ldb(.clk(clk),.data_in(lb),.data_out(sl_db));
    
    Debounce_Top Button_Debounce_rdb(.clk(clk),.data_in(rb),.data_out(sr_db));
    
 
    
    always@(posedge clk) begin
    
        if(rst) begin
            pos <= 16'b0000000000000001;
        end 
        //right button pressed
        else if(sr_db) begin
           if(pos != 16'b0000000000000001) begin
                pos = pos >> 1;
            end
        end
         //left button pressed
         else if (sl_db) begin
            if(pos != 16'b1000000000000000) begin
                pos = pos << 1;
            end
        end
        
end
endmodule

