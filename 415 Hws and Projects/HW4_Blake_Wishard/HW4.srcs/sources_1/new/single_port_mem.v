`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: EEHPC
// Engineer: Hiren Paneliya
// 
// Create Date:
// Design Name: 
// Module Name: single_port_RAM
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


//Designing a 1024x16 bit memory block 

module single_port_mem #(
    parameter memoryDepth = 1024, //depth of the memory
    parameter addressBitWidth = 10, //no of address bit required to access memory locations
    parameter dataBitWidth = 16, // data bit width
    parameter MEM_FILE = "text_data.mem" //absolute path for the memory file
)(
    input clk,
    input read_enable,
    input write_enable,
    input [addressBitWidth-1:0] address,
    input signed [dataBitWidth-1:0] data_in,
    output reg signed [dataBitWidth-1:0] data_out
    );
    
    reg signed [dataBitWidth-1:0] mem[0:memoryDepth-1];
    
    initial begin
        $readmemh(MEM_FILE,mem);
    end
        
    always @(posedge clk) begin
        if( write_enable) begin
              mem[address] <= data_in;
        end
        else if(read_enable) begin
              data_out <= mem[address];
        end
        
    end

endmodule
