`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2021 01:48:45 PM
// Design Name: 
// Module Name: register_file
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


module register_file(clk,rst,read,op_code,write_data,rd_addr,rs_addr,rd_data,rs_data,right_valid);
    
    input clk;
    input rst;
    input read;
    input [3:0] op_code;
    input [15:0] write_data;
    input [3:0] rd_addr;
    input [3:0] rs_addr;
    output reg[15:0] rd_data;
    output reg[15:0] rs_data;
    output reg right_valid; 
    wire [15:0] out;
    reg [15:0]out_reg [15:0];
    wire write = 1;
    integer i;
    integer x,y;
    integer count = 0;
    MUX mux(.clk(clk),
        .rst(rst),
        .user(user),
        .read(read),
        .rs_data(rs_data),
        .rd_data(rd_data),
        .op_code(op_code),
        .out(out),
        .write(write)
        );
        
always @(posedge clk)
begin

    if(!rst)
    begin
        for (i=0; i < 15; i = i + 1)begin  // Setting individual memory cells to 0\
            out_reg[i] <= 0;
        end
        rs_data <= 0;
        rd_data <= 0;
        
        
    end else begin
        if(op_code <= 4'b0001)begin
            //right_valid = 1;
            //out_reg[rd_addr]= out;
            //rd_data = out_reg[rd_addr];
            //rs_data = out_reg[rs_addr];
            right_valid = 1;
            out_reg[rd_addr]= write_data;
            rd_data = write_data;            
            rs_data = out_reg[rs_addr];
        end //else begin
            
       // end
        else if(op_code == 4'b0010)begin
            out_reg[rd_addr] =  {out_reg[rd_addr][7:0]} + {out_reg[rs_addr][7:0]};
            rd_data = {out_reg[rd_addr][7:0]} + {out_reg[rs_addr][7:0]};
            rs_data = out_reg[rs_addr];
        end
        else if(op_code == 4'b0011)begin
            out_reg[rd_addr] = out_reg[rd_addr] - out_reg[rs_addr];
            rd_data = out_reg[rd_addr];
            rs_data = out_reg[rs_addr];
        end
        else if(op_code == 4'b0100)begin
            out_reg[rd_addr] = out_reg[rd_addr] * out_reg[rs_addr];
            rd_data = out_reg[rd_addr];
            rs_data = out_reg[rs_addr];
        end
        else if(op_code == 4'b0101)begin
            out_reg[rd_addr] = out_reg[rd_addr] / out_reg[rs_addr];
            rd_data = out_reg[rd_addr];
            rs_data = out_reg[rs_addr];
        end
        else if(op_code == 4'b0110)begin
            out_reg[rd_addr] = out_reg[rd_addr] % out_reg[rs_addr];
            rd_data = out_reg[rd_addr];
            rs_data = out_reg[rs_addr];
        end
        else if(op_code == 4'b0111)begin
            out_reg[rd_addr] = out_reg[rd_addr] && out_reg[rs_addr];
            rd_data = out_reg[rd_addr];
            rs_data = out_reg[rs_addr];
        end
        else if(op_code == 4'b1000)begin
            out_reg[rd_addr] = out_reg[rd_addr] || out_reg[rs_addr];
            rd_data = out_reg[rd_addr];
            rs_data = out_reg[rs_addr];
        end
        else if(op_code == 4'b1001)begin
            out_reg[rd_addr] = out_reg[rd_addr] ^ out_reg[rs_addr];
            rd_data = out_reg[rd_addr];
            rs_data = out_reg[rs_addr];
    end
    end
end

endmodule
