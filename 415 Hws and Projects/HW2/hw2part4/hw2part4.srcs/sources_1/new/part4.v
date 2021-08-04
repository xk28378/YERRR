`timescale 1ns / 1ps



module part4(input CLK, CLR,ENABLE, UP,LOAD, //single bit inputs
    output reg [3:0] Q, //output
    input [3:0] V, //load value
    output reg RC0); //single bit output
//at clock edge
  always @(posedge CLK ) 
    begin 
        RC0 = 1'b0;//start with RC0 as 0
      if (CLR) //if clear is 1
        Q = 4'b0000; 
      else //if clear is 0
        if(ENABLE)
            if(LOAD)//is load is 1
                Q = V;
            else//if load is 0
                if (UP) //if up is 1
                    Q = Q + 1'b1;
                if(!UP) //if up is 0
                    Q = Q - 1'b1;
                if(Q == 4'b1111 | Q == 4'b0000)//if the output is 15 or 0
                        RC0 = 1'b1;
         end 
      
    endmodule 
