`timescale 1ns / 1ps

module part2(
 input signed [8:0] A,B,  // inputs                 
           input signed [3:0] S,// select
           output signed [8:0] Q // output
    );
    reg signed [8:0] Result;
    assign Q = Result; // out
    reg [8:0] count = 9'b000000000;//counter for rotate
    always @(*)
    begin
        case(S)
        4'b0000: begin // Addition0
           Result = A + B ; 
           end
        4'b0001: begin // Subtraction1
           Result = A - B ;
           end
        4'b0010: begin// Multiplication2
           Result = A * B;
           end
         4'b0011: begin// Logical shift right3
           Result = B>>A;
           end
         4'b0100: begin// Rotate left4
           Result = {B[9:0]};
           for(count = 0; count < A; count  = count + 1'b1)
           begin
           Result = {Result[7:0],Result[8]};
           end
           end
          4'b0101: begin//  Logical or 5
           Result = A | B;
           end
          4'b0110: begin//  Logical and 6
           Result = A & B;
           end
          4'b0111: begin// Logical nand 7
           Result = !(A & B);
           end
          4'b1000: begin// Logical xnor 8
           Result = 9'b111111111 ^ (A ^ B);
           end
          4'b1001: begin// complement of B 9
           Result = (B ^ 9'b111111111) + 1'b1;
           end
          default: Result = 9'b000000000 ; 
        endcase
    end

endmodule
