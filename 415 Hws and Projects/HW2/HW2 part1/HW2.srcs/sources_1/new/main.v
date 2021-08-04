`timescale 1ns / 1ps

module part1();
    //inputs
    reg a = 1'b0;
    reg b = 1'b0;
    reg c = 1'b0;
   //outputs
    reg out_reg = 1'b0; 
    
    always @(*)
    begin
        case ({c,b,a})//case statment using the inputs
            3'b000  : out_reg = 1;
            3'b001  : out_reg = 1;
            3'b100  : out_reg = 0;
            3'b101  : out_reg = 0;
            3'b110  : out_reg = 1;
            3'b111  : out_reg = 0;
    endcase
  end
  

//testbench
initial begin
//forloop that checks using all forms of inputs
for(reg[2:0] temp = 3'b000; temp < 8; temp = temp + 1)
begin
    a = temp[0];
    b = temp[1];
    c = temp[2];
    #50;
end
    
end
    
endmodule


    
