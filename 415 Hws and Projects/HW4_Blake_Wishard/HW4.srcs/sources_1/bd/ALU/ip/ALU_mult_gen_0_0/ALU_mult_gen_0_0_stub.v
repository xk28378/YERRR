// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sun Mar 21 18:17:23 2021
// Host        : DESKTOP-KFAJ11H running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {C:/Users/nehmy/OneDrive/Desktop/415 Hws and Projects/HW4Phase1 -
//               1/HW4Phase1/HW4/HW4.srcs/sources_1/bd/ALU/ip/ALU_mult_gen_0_0/ALU_mult_gen_0_0_stub.v}
// Design      : ALU_mult_gen_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "mult_gen_v12_0_16,Vivado 2019.2" *)
module ALU_mult_gen_0_0(CLK, A, B, P)
/* synthesis syn_black_box black_box_pad_pin="CLK,A[15:0],B[15:0],P[31:0]" */;
  input CLK;
  input [15:0]A;
  input [15:0]B;
  output [31:0]P;
endmodule
