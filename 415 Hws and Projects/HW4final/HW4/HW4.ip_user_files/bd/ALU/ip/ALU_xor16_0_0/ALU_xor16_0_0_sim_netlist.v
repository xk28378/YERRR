// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sun Mar 21 18:17:15 2021
// Host        : DESKTOP-KFAJ11H running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {C:/Users/nehmy/OneDrive/Desktop/415 Hws and Projects/HW4Phase1 -
//               1/HW4Phase1/HW4/HW4.srcs/sources_1/bd/ALU/ip/ALU_xor16_0_0/ALU_xor16_0_0_sim_netlist.v}
// Design      : ALU_xor16_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ALU_xor16_0_0,xor16,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "xor16,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module ALU_xor16_0_0
   (A,
    B,
    Y);
  input [15:0]A;
  input [15:0]B;
  output [15:0]Y;

  wire [15:0]A;
  wire [15:0]B;
  wire [15:0]Y;

  ALU_xor16_0_0_xor16 inst
       (.A(A),
        .B(B),
        .Y(Y));
endmodule

(* ORIG_REF_NAME = "xor16" *) 
module ALU_xor16_0_0_xor16
   (Y,
    B,
    A);
  output [15:0]Y;
  input [15:0]B;
  input [15:0]A;

  wire [15:0]A;
  wire [15:0]B;
  wire [15:0]Y;

  LUT2 #(
    .INIT(4'h6)) 
    \Y[0]_INST_0 
       (.I0(B[0]),
        .I1(A[0]),
        .O(Y[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[10]_INST_0 
       (.I0(B[10]),
        .I1(A[10]),
        .O(Y[10]));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[11]_INST_0 
       (.I0(B[11]),
        .I1(A[11]),
        .O(Y[11]));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[12]_INST_0 
       (.I0(B[12]),
        .I1(A[12]),
        .O(Y[12]));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[13]_INST_0 
       (.I0(B[13]),
        .I1(A[13]),
        .O(Y[13]));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[14]_INST_0 
       (.I0(B[14]),
        .I1(A[14]),
        .O(Y[14]));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[15]_INST_0 
       (.I0(B[15]),
        .I1(A[15]),
        .O(Y[15]));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[1]_INST_0 
       (.I0(B[1]),
        .I1(A[1]),
        .O(Y[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[2]_INST_0 
       (.I0(B[2]),
        .I1(A[2]),
        .O(Y[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[3]_INST_0 
       (.I0(B[3]),
        .I1(A[3]),
        .O(Y[3]));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[4]_INST_0 
       (.I0(B[4]),
        .I1(A[4]),
        .O(Y[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[5]_INST_0 
       (.I0(B[5]),
        .I1(A[5]),
        .O(Y[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[6]_INST_0 
       (.I0(B[6]),
        .I1(A[6]),
        .O(Y[6]));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[7]_INST_0 
       (.I0(B[7]),
        .I1(A[7]),
        .O(Y[7]));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[8]_INST_0 
       (.I0(B[8]),
        .I1(A[8]),
        .O(Y[8]));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[9]_INST_0 
       (.I0(B[9]),
        .I1(A[9]),
        .O(Y[9]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
