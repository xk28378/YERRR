`timescale 1ns / 1ps
module MUX(
    input clk,
    output reg [15:0] ALU_OUTPUT
    );
    
    wire [15:0] S;
    wire [15:0] D;
    wire [15:0] P; 
    wire [15:0] AND_OUT;
    wire [15:0] MOD_OUT;
    wire [15:0] OR_OUT;
    wire [15:0] XOR_OUT;
    wire [31:0] Q;
    wire [3:0] opcode;

   ALU ALU_intan(.S(S),.D(D),.P(P),.MOD_OUT(MOD_OUT),.AND_OUT(AND_OUT),.OR_OUT(OR_OUT),.XOR_OUT(XOR_OUT),.Q(Q));
    
    always @(posedge clk) 
        begin 
            if(opcode == 4'b0010) 
            begin
                ALU_OUTPUT <= S;
            end
            else if(opcode == 4'b0011)begin
                ALU_OUTPUT  <= D;
            end
            else if(opcode == 4'b0100)begin
                ALU_OUTPUT <= P;
            end
            else if(opcode == 4'b0101)begin
                 ALU_OUTPUT <= Q;
            end
            else if(opcode == 4'b0111)begin
                ALU_OUTPUT <= AND_OUT;
            end
            else if(opcode == 4'b1000)begin
                ALU_OUTPUT <= OR_OUT;
            end
            else if(opcode == 4'b1001)begin
                ALU_OUTPUT <= XOR_OUT;
            end
     end
endmodule