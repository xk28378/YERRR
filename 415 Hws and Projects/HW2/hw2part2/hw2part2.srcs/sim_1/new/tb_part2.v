`timescale 1ns / 1ps

module tb_part2;
 reg[8:0] A,B;
 reg[3:0] S;

//Output
 wire[8:0] Q;
 //counter
 reg[3:0] i;
 part2 test_unit(
            .A(A),.B(B),  //Inputs                 
            .S(S),//Select
            .Q(Q)//output
     );
    initial begin
    // testing all 0s
      A = 9'b000000000;
      B = 9'b000000000;
      S = 4'b0000;
      
      #15
      
      for (i=0;i <= 9;i = i+ 1'b1)
      begin
       S = S + 4'b0001;
       #15;   
      end;
      //testing all 1s
      A = 9'b000000001;
      B = 9'b000000001;
      S = 4'b0000;
      
      #15
      
      for (i=0;i <= 9;i = i+ 1'b1)
      begin
       S = S + 4'b0001;
       #15;   
      end;
      //testing all positive inputs
      A = 9'b000101001;
      B = 9'b000100001;
      S = 4'b0000;
      
      #15
      
      for (i=0;i <= 9;i = i+ 1'b1)
      begin
       S = S + 4'b0001;
       #15;   
      end;
      //testing all negative inputs
      A = 9'b111101111;
      B = 9'b111101101;
      S = 4'b0000;
      
      #15
      
      for (i=0;i <= 9;i = i+ 1'b1)
      begin
       S = S + 4'b0001;
       #15;   
      end;
      //testing one positive and one negative input
      A = 9'b101100001;
      B = 9'b000100001;
      S = 4'b0000;
      
      #15
      
      for (i=0;i <= 9;i = i+ 1'b1)
      begin
       S = S + 4'b0001;
       #15;   
      end;
      A = 9'b000000000;
      B = 9'b000000000;
      S = 4'b0000;
    end
endmodule
