// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sun Mar 28 13:02:24 2021
// Host        : DESKTOP-KFAJ11H running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/nehmy/OneDrive/Desktop/415 Hws and Projects/HW4Phase1 -
//               1/HW4Phase1/HW4/HW4.runs/impl_1/.Xil/Vivado-14052-DESKTOP-KFAJ11H/dc_drv.0/dc/prj_ip.srcs/sources_1/ip/dbg_hub/dbg_hub_stub.v}
// Design      : dbg_hub
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "xsdbm_v3_0_0_xsdbm,Vivado 2019.2" *)
module dbg_hub(sl_iport0_o, sl_oport0_i, clk)
/* synthesis syn_black_box black_box_pad_pin="sl_iport0_o[36:0],sl_oport0_i[16:0],clk" */;
  output [36:0]sl_iport0_o;
  input [16:0]sl_oport0_i;
  input clk;
endmodule
