`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2021 12:58:16 AM
// Design Name: 
// Module Name: tb_part3
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


module tb_part3;

reg clk;
reg reset;
reg rd_en;
reg wr_en;
reg [15:0] data_in;


wire full;
wire empty;
wire [15:0] data_out;
integer i,fid_in, fid_out, status;
part3 uut (.clk(clk),.reset(reset),.rd_en(rd_en),.wr_en(wr_en),.full(full),.empty(empty),.data_in(data_in),.data_out(data_out));
always # 1.75 clk = ~ clk;


initial begin
// Initialize Inputs
clk = 0;
reset = 0;
rd_en = 0;
wr_en = 0;
data_in = 0;

#40;
reset =1;
#90;
reset =0;

for(i=1;i<257;i=i+1)
begin
wr_en=0;
data_in = i;
wr_en=1;
#20;
end
wr_en=0;
#40;
rd_en =1;
#500;
end

endmodule
