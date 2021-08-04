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


module ISA(
    input clk,
    input rst,
    input cb,
    input [15:0] SW,
    output reg[7:0] AN,
    output reg [7:0] CT
    );
    wire clk_div = 0;
    wire [15:0] rd_data;
    wire [15:0] rs_data;
    wire right_valid;
    reg write = 1;
    reg WRITE_enable;
    reg RS_enable;
    reg RD_enable;
    reg [3:0]rd_addr;
    reg [3:0]rs_addr;
    reg AVALID;
    reg BVALID;
    wire [6:0] AN0 = 7'b1100011;
    wire [6:0] AN1 = 7'b0000001;
    wire [6:0] AN2 = 7'b0000111;
    wire [6:0] AN3 = 7'b0000110;
    wire [6:0] AN4 = 7'b0000110;
    wire [6:0] AN5 = 7'b0000110;
    wire [6:0] AN6 = 7'b0000110;
    wire [6:0] AN7 = 7'b0000110;
    wire cbd;
    wire [15:0] S; //c_add_S;
    wire [15:0] D; //c_sub_S;
    wire [15:0] P; 
    wire [15:0] AND_OUT; //and
    wire [15:0] OR_OUT; //or
    wire [15:0] XOR_OUT; //xor
    wire [15:0] MOD_OUT; //mod
    wire [31:0] Q;
    wire QVALID;
    reg [3:0]op_code;
    
    register_file registerfile(.clk(clk),.rst(rst),.write(write),.write_data(write_data_reg),.rd_addr(rd_addr),.rs_addr(rs_addr),.rd_data(rd_data),.rs_data(rs_data),.right_valid(right_valid));

    
    ALU alu(.A(rd_data),
    .AND_OUT(AND_OUT),
    .AVALID(AVALID),
    .B(rs_data),
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

    MUX mux(.clk(clk),
        .rst(rst),
        .write(write),
        .S(S), //c_add_S;
        .D(D), //c_sub_S;
        .P(P), 
        .AND_OUT(AND_OUT), //and
        .OR_OUT(OR_OUT), //or
        .XOR_OUT(XOR_OUT), //xor
        .MOD_OUT(MOD_OUT), //xor
        .Q(Q),
        .op_code(op_code),
        .out(write_data_wire));
        
    SSD ssd(.clk(clk),
        .rst(rst),
        .rd_data(rd_data),
        .rs_data(rd_data), 
        .AN0(AN0),
        .AN1(AN1),
        .AN2(AN2),
        .AN3(AN3),
        .AN4(AN4),
        .AN5(AN5),
        .AN6(AN6),
        .AN7(AN7));
    Debounce_cb button_debounce_cb(.clk(clk),.data_in(cb),.data_out(cbd));
    
    clk_divider(
    .clk(clk),
    .clk_out(clk_div)
    );
    always @(posedge clk)begin
        if(!rst)begin
            AN <= 8'b00000110;
        end
        
        if(cbd) begin
            AN[0] = AN0;
            AN[1] = AN1;
            AN[2] = AN2;
            AN[3] = AN3;
            AN[4] = AN4;
            AN[5] = AN5;
            AN[6] = AN6;
            AN[7] = AN7;
            write_data_reg = write_data_wire;
            op_code = {SW[15:12]};
            if(op_code < 4'b1010)begin
                
                if(op_code == 4'b0000)begin
                    rd_addr = {SW[7:4]};
                    rs_addr = {SW[3:0]};
                    write_data_reg = rs_data;
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
