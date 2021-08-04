`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2021 04:29:18 AM
// Design Name: 
// Module Name: tb_ISA_decode
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


module tb_ISA_decode;
    reg clk;
    reg rst;
    reg cb;
    reg[15:0] SW;
    wire [7:0] AN;
    wire [7:0] CAT;
    wire [15:0]rs_data;
    wire [15:0]rd_data;
    
    ISA_decode tries(
    .clk(clk),
    .rst(rst),
    .cb(cb),
    .SW(SW),
    .AN(AN),
    .CAT(CAT),
    .RD_data(rd_data),
    .RS_data(rs_data)
    );  
    
    always #5 clk = (clk ^ 1'b1); 
    
    initial begin
    clk = 0;
    #200
    rst = 1;
    #10
    SW = 16'b0001000000011101;
    cb = 1;
    #20
    cb = 0;
    #200
    SW = 16'b0001011100001110;
    cb = 1;
    #20
    cb = 0;
    #200
    SW = 16'b0010000001110000;
    cb = 1;
    #20
    cb = 0;
        
    end
    
endmodule
