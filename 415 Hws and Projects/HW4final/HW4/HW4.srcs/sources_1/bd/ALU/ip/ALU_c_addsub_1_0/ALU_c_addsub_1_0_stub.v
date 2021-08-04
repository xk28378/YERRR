// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sun Mar 21 18:17:51 2021
// Host        : DESKTOP-KFAJ11H running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {C:/Users/nehmy/OneDrive/Desktop/415 Hws and Projects/HW4Phase1 -
//               1/HW4Phase1/HW4/HW4.srcs/sources_1/bd/ALU/ip/ALU_c_addsub_1_0/ALU_c_addsub_1_0_stub.v}
// Design      : ALU_c_addsub_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_addsub_v12_0_14,Vivado 2019.2" *)
module ALU_c_addsub_1_0(A, B, CLK, S)
/* synthesis syn_black_box black_box_pad_pin="A[15:0],B[15:0],CLK,S[15:0]" */;
  input [15:0]A;
  input [15:0]B;
  input CLK;
  output [15:0]S;
endmodule
