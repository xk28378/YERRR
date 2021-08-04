`timescale 1ns / 1ps


module ALU_tb;

reg [15:0]A;
reg [15:0]B;
reg AVALID;
reg BVALID;
reg clk;

wire [15:0] S; //c_add_S;
wire [15:0] D; //c_sub_S;
wire [15:0] P; 
wire [15:0] AND_OUT; //and
wire [15:0] OR_OUT; //or
wire [15:0] XOR_OUT; //xor
wire [15:0] MOD_OUT; //xor
wire [31:0] Q;
wire QVALID;

ALU alu_uut(.A(A),
    .AND_OUT(AND_OUT),
    .AVALID(AVALID),
    .B(B),
    .BVALID(BVALID),
    .D(D),
    //.MOD_OUT(MOD_OUT),
    .OR_OUT(OR_OUT),
    .P(P),
    .Q(Q),
    .QVALID(QVALID),
    .S(S),
    .XOR_OUT(XOR_OUT),
    .clk(clk));

always #5 clk = (clk ^ 1'b1); 

initial begin
    

    clk = 0;
    #200
    AVALID = 1;
    BVALID = 0;    
    A = 16'b0000000001001111; // 5
    B = 16'b0000000000100101;  
    #20
    BVALID = 0;
    
   #200
    BVALID = 0; 
    #20   
    A = 16'b0000000000101101; // 5
    B = 16'b0000000000011001;  
    #20
    BVALID = 0;
    #200
    
    BVALID = 0; 
    #20   
    A = 16'b0000000100101111; // 5
    B = 16'b0000000000000101;  
    #20
    BVALID = 0;

    
    end


endmodule