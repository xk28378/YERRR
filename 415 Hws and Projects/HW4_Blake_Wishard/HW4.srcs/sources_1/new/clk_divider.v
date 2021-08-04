`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2021 10:20:34 PM
// Design Name: 
// Module Name: clk_divider
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


module clk_divider(
    input clk,
    output reg clk_div
    );
    integer count_20 = 0;
    always @(posedge clk) begin
       count_20 <= count_20 + 1;
       if(count_20 == 49999)
       begin
          count_20<=0;
          clk_div <= !clk_div;
   end
end
endmodule
