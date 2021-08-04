`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2021 02:25:57 PM
// Design Name: 
// Module Name: MUX
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


module MUX(
    input clk,
    input rst,
    input read,
    input [15:0] user,
    input [15:0] rs_data, //c_add_S;
    input [15:0] rd_data, //c_sub_S;
    input [3:0] op_code,
    output reg[15:0] out,
    output reg write
    );
    
    wire [15:0] S; //c_add_S;
    wire [15:0] D; //c_sub_S;
    wire [15:0] P; 
    wire [15:0] AND_OUT; //and
    wire [15:0] OR_OUT; //or
    wire [15:0] XOR_OUT; //xor
    wire [15:0] MOD_OUT; //mod
    wire [31:0] Q;
    wire QVALID;
    integer rd,rs;
    reg AVALID = 1;
    reg BVALID = 1;
   
    
     ALU alu(.A(rd),
    .AND_OUT(AND_OUT),
    .AVALID(AVALID),
    .B(rs),
    .BVALID(BVALID),
    .D(D),
    .MOD_OUT(MOD_OUT),
    .OR_OUT(OR_OUT),
    .P(P),
    .Q(Q),
    .QVALID(QVALID),
    .S(S),
    .XOR_OUT(XOR_OUT),
    .clk(clk));
    
    
    
    always @(posedge clk)
    begin 
        if(op_code < 4'b1010 )begin
            rd = rd_data;
            rs = rs_data;
             if(op_code == 4'b0000)begin
                out <= rs_data;
            end
            else if(op_code == 4'b0001)begin
                out <= user;
            end 
            else if(op_code == 4'b0010)begin
                out = S;
                write = 0;
            end
            else if(op_code == 4'b0011)begin
                out = D;
                write = 0;
            end
            else if(op_code == 4'b0100)begin
                out = P;
                write = 0;
            end
            else if(op_code == 4'b0101)begin
                out = Q;
                write = 0;
            end
            else if(op_code == 4'b0110)begin
                out = MOD_OUT;
                write = 0;
            end
            else if(op_code == 4'b0111)begin
                out = AND_OUT;
                write = 0;
            end
            else if(op_code == 4'b1000)begin
                out = OR_OUT;
                write = 0;
            end
            else if(op_code == 4'b1001)begin
                out = XOR_OUT;
                write = 0;
        end
    end
    end
    
    
endmodule
