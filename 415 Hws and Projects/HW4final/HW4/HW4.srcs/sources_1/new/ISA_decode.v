`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2021 02:18:06 PM
// Design Name: 
// Module Name: ISA_decode
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


module ISA_decode(
    input clk,
    input rst,
    input cb,
    input [15:0] SW,
    output reg[7:0] AN,
    output reg[7:0] CAT
    );  
    //wire clk_div = 0;
    wire [15:0] rd_data;
    wire [15:0] rs_data;
    wire right_valid;
    wire [7:0] AN_OUT;
    wire [7:0] CAT_OUT;
    wire write;
    reg read;
    reg ssd = 1;
    integer count = 0;
    //reg load_val;
    reg [15:0]write_data_reg;
    wire [15:0]write_data_wire;
    reg [15:0]user;
    reg [3:0]rd_addr;
    reg [3:0]rs_addr;
    wire cbd;
    reg [3:0]op_code;
    
    register_file registerfile(.clk(clk),.rst(rst),.read(read),.op_code(op_code),.write_data(write_data_reg),.rd_addr(rd_addr),.rs_addr(rs_addr),.rd_data(rd_data),.rs_data(rs_data),.right_valid(right_valid));

        
    SSD ssd_wrap(.clk(clk),
        .rst(rst),
        .rd_data(rs_data),
        .rs_data(rd_data), 
        .AN(AN_OUT),
        .CAT(CAT_OUT));
        
    Debounce_cb button_debounce_cb(.clk(clk),.data_in(cb),.data_out(cbd));
    
    //ila_0 debugger(.clk(clk),.probe0(rs_data),.probe1(rd_data));
    
    always @(posedge clk)begin
        if(ssd)begin
            AN <= AN_OUT;
            CAT <= CAT_OUT;
            end
        if(!rst)begin
            AN <= 8'b00000000;
            CAT <= 8'b10101010;
            ssd = 0;
            rd_addr = 0;
            rs_addr = 0;
        end else if(cbd) begin
                ssd = 1;
                op_code = {SW[15:12]};
                if(op_code < 4'b1010)begin
                    if(op_code == 4'b0000)begin
                        rd_addr = {SW[7:4]};
                        rs_addr = {SW[3:0]};
                        read = 1;
                        write_data_reg = write_data_wire;
                    end
                    else if(op_code == 4'b0001)begin
                        rd_addr = {SW[11:8]};
                        write_data_reg = {SW[7:0]};
                    end
                    else begin
                        rd_addr = {SW[7:4]};
                        rs_addr = {SW[3:0]};
                    end
    
                end
            
        end
        
    end
    
endmodule
