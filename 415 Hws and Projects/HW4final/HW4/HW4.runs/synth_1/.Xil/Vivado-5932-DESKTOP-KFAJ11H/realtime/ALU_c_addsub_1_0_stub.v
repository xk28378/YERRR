// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_addsub_v12_0_14,Vivado 2019.2" *)
module ALU_c_addsub_1_0(A, B, CLK, S);
  input [15:0]A;
  input [15:0]B;
  input CLK;
  output [15:0]S;
endmodule
