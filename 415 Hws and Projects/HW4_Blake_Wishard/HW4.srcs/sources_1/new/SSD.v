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
    output reg [7:0] AN,
    output reg [7:0] CAT
    );
    wire refresh_clk;
    wire [2:0]refresh_out;
    wire [3:0]out_value;
    wire [7:0] AN_wire;
    wire [7:0] CAT_wire;
    
    clk_divider test(.clk(clk),.clk_div(refresh_clk));
    
    refresh_clk test1(.clk(refresh_clk),.refresh_out(refresh_out));
    
    anode_control test2(.clk_out(refresh_out),.AN(AN_wire));
    
    BCD_on test3(
    .value1(rs_data[3:0]),
    .value2(rs_data[7:4]),
    .value3(rs_data[11:8]),
    .value4(rs_data[15:12]),
    .value5(rd_data[3:0]),
    .value6(rd_data[7:4]),
    .value7(rd_data[11:8]),
    .value8(rd_data[15:12]),
    .clk_out(refresh_out),
    .out_value(out_value));
    
    cathode test4(
    .value(out_value),
    .CAT(CAT_wire));
    always@(posedge clk)begin
        CAT <= CAT_wire;
        AN <= AN_wire;
    end
  
endmodule
