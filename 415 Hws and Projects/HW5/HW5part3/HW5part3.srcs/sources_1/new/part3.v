`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2021 12:48:35 AM
// Design Name: 
// Module Name: part3
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


module part3(
input clk, 
input reset,
input rd_en,
input wr_en,
output full,
output empty,
input [15:0] data_in,
output reg [127:0] data_out
);

// Defining Memory//
reg [15:0] mem_fifo [127:0];

//Defining Signals//
wire WE,RE;
reg full_reg,empty_reg,full_nxt,empty_nxt;
reg [7:0] w_addr,r_addr;

////// Write Section //////
//Write Pointer: Write Address//
always @(posedge clk or posedge reset)
begin
if(reset)
w_addr <= 0;
else if(WE)
w_addr <= w_addr + 1;
end

//WE:not to be written when it is full
assign WE = wr_en & ~full_reg;

//Write FIFO
always @(posedge clk)
begin
if(WE)
mem_fifo[w_addr] <= data_in;
end

////// Read Section //////
//Read Pointer: Read Address//
always @(posedge clk or posedge reset)
begin
if(reset)
r_addr <= 0;
else if(RE)
r_addr <= r_addr + 1;
end

//RE:not to be read when it is full
assign RE = rd_en & ~empty_reg;

//Read FIFO
always @(posedge clk)
begin
if(RE)
data_out <= mem_fifo[r_addr];
end

//Control Module//
always @(posedge clk or posedge reset)
begin
if(reset)
begin
full_reg <= 1'b0;
empty_reg <= 1'b1;
end

else
begin
full_reg <= full_nxt;
empty_reg <= empty_nxt;
end
end

////
always @(*)
begin
 //keep old values//
full_nxt = full_reg;
empty_nxt = empty_reg;
case ({wr_en,rd_en})
   //2'b00 No Operation
2'b01://Read
if(~empty_reg)
begin
full_nxt = 1'b0;
if((w_addr==r_addr+1) || ((r_addr==127)&& (w_addr==1'b0)))
empty_nxt = 1'b1;
end

2'b10://Write
if(~full_reg)
begin
empty_nxt = 1'b0;
if((w_addr==r_addr-1) || ((w_addr==127)&& (r_addr==1'b0)))
full_nxt = 1'b1;
end
endcase
end
///////////////////////////

assign full = full_reg;
assign empty = empty_reg;
endmodule