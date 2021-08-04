`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2021 05:39:44 PM
// Design Name: 
// Module Name: part2
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


module part2(
        input clk, rst, start, a_write_en, b_write_en, p_read_en,
        input [6:0] a_addr, b_addr, p_addr,
        input signed [15:0] a_data, b_data,
        output reg signed [31:0] p_data,
        output reg done);

reg signed [15:0] a_SSRAM [0:127];
reg signed [15:0] b_SSRAM [0:127];
reg signed [31:0] p_SSRAM [0:127];

reg pipelined_a_en, pipelined_b_en, pipelined_p_en;
reg signed [15:0] pipelined_a_d_out, pipelined_b_d_out, pipelined_p_d_out;

reg cnt_rst, ab_cnt_ce, p_cnt_ce;
wire ab_cnt_tc, ab_rd, p_wr;

reg [6:0] ab_counter, p_counter;
wire [6:0] a_SSRAM_addr, b_SSRAM_addr, p_SSRAM_addr;

reg signed [15:0] a_SSRAM_d_out, b_SSRAM_d_out;
wire signed [31:0] prod;

wire addr_sel;

parameter [2:0] idle = 3'b000,
                cmp0 = 3'b001,
                cmp1 = 3'b010,
                comp = 3'b011,
                last0 = 3'b100,
                last1 = 3'b101,
                result = 3'b110;
reg [2:0] current_state, next_state;

always @(posedge clk)begin // a/b address counter
    if (cnt_rst)begin
        ab_counter <= 0;
    end
    else if(ab_cnt_ce)begin
        ab_counter <= ab_counter + 1;
    end
end

assign ab_cnt_tc = ab_counter == 127;
assign a_SSRAM_addr = addr_sel ? ab_counter : a_addr;
assign b_SSRAM_addr = addr_sel ? ab_counter : b_addr;

always @(posedge clk) begin //a RAM pipelined
    if (pipelined_a_en)begin
        a_SSRAM_d_out <= pipelined_a_d_out;
    end
    if (ab_rd | a_write_en) begin
        if (a_write_en) begin
            a_SSRAM[a_SSRAM_addr] <= a_data;
            pipelined_a_d_out <= a_data;
        end
    end
    else begin
        pipelined_a_d_out <= a_SSRAM[a_SSRAM_addr];
    end
end

always @(posedge clk) begin //b RAM pipelined
    if (pipelined_b_en)begin
        b_SSRAM_d_out <= pipelined_b_d_out;
    end
    if (ab_rd | b_write_en) begin
        if (b_write_en) begin
            b_SSRAM[b_SSRAM_addr] <= b_data;
            pipelined_b_d_out <= b_data;
        end
    end
    else begin
        pipelined_b_d_out <= b_SSRAM[b_SSRAM_addr];
    end
end

assign prod = {{16{a_SSRAM_d_out[15]}}, a_SSRAM_d_out} * {{16{b_SSRAM_d_out[15]}}, b_SSRAM_d_out};

always @(posedge clk) begin //p address counter
    if (cnt_rst) begin
        p_counter <= 0;
    end
    else if (p_cnt_ce) begin
        p_counter <= p_counter + 1;
    end
end

assign p_SSRAM_addr = addr_sel ? p_counter : p_addr;

always @(posedge clk) begin //p RAM pipelined
    if(pipelined_p_en) begin
        p_data <= pipelined_p_d_out;
        pipelined_p_en <= p_read_en | p_wr;
    end
    if(p_read_en | p_wr) begin
        if (p_wr) begin
            p_SSRAM[p_SSRAM_addr] <= prod;
            pipelined_p_d_out <= prod;
        end
    end
    else begin
        pipelined_p_d_out <= p_SSRAM[p_SSRAM_addr];
    end
end

always @(posedge clk) begin //state register
    if (rst) begin
        current_state <= idle;
    end
    else begin
        current_state <= next_state;
    end
end

always @* begin //FSM Logic
    cnt_rst = 1'b0;
    ab_cnt_ce = 1'b0;
    p_cnt_ce = 1'b0;
    done = 1'b0;

    case (current_state)
        idle:   if(!start) begin
                    next_state = idle;
                    cnt_rst = 1'b1;
                end
                else begin
                    next_state = cmp0;
                    ab_cnt_ce = 1'b1;
                end
        cmp0:   begin
                    next_state = cmp1;
                    ab_cnt_ce = 1'b1;
                end
        cmp1:   begin
                    next_state = comp;
                    ab_cnt_ce = 1'b1;
                    p_cnt_ce = 1'b1;
                end
        comp:   begin
                    if(!ab_cnt_tc) begin
                        next_state = comp;
                    end
                    else begin
                        next_state = last0;
                        ab_cnt_ce = 1'b1;
                        p_cnt_ce = 1'b1;
                    end
                end
        last0:  begin
                    next_state = last1;
                    p_cnt_ce = 1'b1;
                end
        last1:  begin
                    next_state = result;
                    p_cnt_ce = 1'b1;
                end 
        result: begin
                    next_state = idle;
                    cnt_rst = 1'b1;
                    done = 1'b1;
                end
    endcase
end

assign ab_rd = ab_cnt_ce;
assign p_wr = p_cnt_ce;
assign addr_sel = current_state != idle;

endmodule
