`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2021 05:22:15 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input rst, 
    //buttons
    input cb, 
    input lb, 
    input rb, 
    //LED lights
    output reg [15:0] LED,
    //RGB lights
    output reg [5:0] RGB
    );
    
    //wires and integers for positions, pows and buttons
    wire [3:0] pos;
    integer position = 0;
    integer pow1,pow2,pow3,pow4;
    reg [15:0] pow_pos = 16'b0000000000000000;
    reg [15:0] init;
    wire[15:0] pow_out;
    wire[15:0] pos_out;
    wire p;
    wire lbd, rbd, cbd;
    
    //button debounce
    Debounce_Top Button_Debounce_ldb(.clk(clk),.data_in(lb),.data_out(lbd));
    
    Debounce_Top Button_Debounce_rdb(.clk(clk),.data_in(rb),.data_out(rbd));
    
    Debounce_Top Button_Debounce_cdb(.clk(clk),.data_in(cb),.data_out(cbd));
    //positions of pows
    pow_position pow_pos_(.pos(pow_out),.clk(clk),.rst(rst),.init(init),.d(pow_pos));
    //position_shifter
    position_shifter pos_shift(.pos(pos_out),.clk(clk),.rst(rst),.rb(rb),.lb(lb));
    //random position to start
    random2 random(.pos(pos), .clk(clk), .rst(rst));
    //LED pulser
    pulser blinky_pulse(.p(p),.clk(clk));
    
    always@(posedge clk) begin
        if (!rst) begin 
        //setup
            position = pos ^ 4'b0110;
            pow1 = position ^ 4'b1001;
            pow2 = pow1 ^ 4'b1010;
            pow3 = pow2 ^ 4'b0100;
            pow4 = pow3 ^ 4'b1011;
            LED = 16'b0000000000000000;
            RGB = 6'b100100;
            LED[position] = 1'b1;
        end
        if(p)begin
        //pulser
            LED[position] = LED[position] ^ 1'b1;
        end
        //conditionals to check if pows are saved and win condition
        if(pow1 <16 & pow1 != position)begin
            LED[pow1] = 1'b1;
        end
        if(pow2 <16 & pow2 != position)begin
            LED[pow2] = 1'b1;
        end
        if(pow3 <16 & pow3 != position)begin
            LED[pow3] = 1'b1;
        end
        if(pow4 <16 & pow4 != position)begin
            LED[pow4] = 1'b1;
        end
        if(pow1 == 16 & pow2 == 16 & pow3 == 16 & pow4 == 16)begin
            RGB = 6'b010010;
        end
        //left button pressed
        if (lbd) begin
            if(position != 15) begin
                position = position + 1;
                if(position-1 != pow1 & position-1 != pow2 & position-1 != pow3 & position-1 != pow4)begin
                    LED[position-1] = 1'b0;
                end
            end 
            else begin
                position = 15;
            end
        end
        //right button is pressed
        else if (rbd) begin
            if(position != 0) begin
                position = position - 1;
                if(position +1 != pow1 & position +1 != pow2 & position+1 != pow3 & position+1 != pow4)begin
                    LED[position+1] = 1'b0;
                end
            end 
            else begin
                position = 0;
            end 
        end    
        //center button is pressed
        else if(cbd)begin
            if(pow1 == position)begin
                pow1 = 16;
            end
            if(pow2 == position)begin
                pow2 = 16;
            end
            if(pow3 == position)begin
                pow3 = 16;
            end
            if(pow4 == position)begin
                pow4 = 16;
            end
            
        end
        else begin
            LED <= LED;
        end
    end
endmodule
