//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Sun Mar 21 18:16:33 2021
//Host        : DESKTOP-KFAJ11H running 64-bit major release  (build 9200)
//Command     : generate_target ALU.bd
//Design      : ALU
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ALU,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ALU,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=8,numReposBlks=8,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=4,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "ALU.hwdef" *) 
module ALU
   (A,
    AND_OUT,
    AVALID,
    B,
    BVALID,
    D,
    MOD_OUT,
    OR_OUT,
    P,
    Q,
    QVALID,
    S,
    XOR_OUT,
    clk);
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.A DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.A, LAYERED_METADATA undef" *) input [15:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.AND_OUT DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.AND_OUT, LAYERED_METADATA undef" *) output [15:0]AND_OUT;
  input AVALID;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.B DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.B, LAYERED_METADATA undef" *) input [15:0]B;
  input BVALID;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.D DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.D, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value TRUE}}}} DATA_WIDTH 16}" *) output [15:0]D;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.MOD_OUT DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.MOD_OUT, LAYERED_METADATA undef" *) output [15:0]MOD_OUT;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.OR_OUT DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.OR_OUT, LAYERED_METADATA undef" *) output [15:0]OR_OUT;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.P DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.P, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value TRUE}}}} DATA_WIDTH 32}" *) output [31:0]P;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.Q DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.Q, LAYERED_METADATA undef" *) output [31:0]Q;
  output QVALID;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.S DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.S, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value TRUE}}}} DATA_WIDTH 16}" *) output [15:0]S;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.XOR_OUT DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.XOR_OUT, LAYERED_METADATA undef" *) output [15:0]XOR_OUT;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN ALU_clk, FREQ_HZ 50000000, INSERT_VIP 0, PHASE 0.000" *) input clk;

  wire AVALID_1;
  wire [15:0]A_1;
  wire BVALID_1;
  wire [15:0]B_1;
  wire [15:0]and16_0_Y;
  wire [15:0]c_addsub_0_S;
  wire [15:0]c_addsub_1_S;
  wire clk_1;
  wire [31:0]div_gen_0_m_axis_dout_tdata;
  wire div_gen_0_m_axis_dout_tvalid;
  wire [15:0]mod16_0_Y;
  wire [31:0]mult_gen_0_P;
  wire [15:0]or16_0_Y;
  wire [15:0]xor16_0_Y;

  assign AND_OUT[15:0] = and16_0_Y;
  assign AVALID_1 = AVALID;
  assign A_1 = A[15:0];
  assign BVALID_1 = BVALID;
  assign B_1 = B[15:0];
  assign D[15:0] = c_addsub_1_S;
  assign MOD_OUT[15:0] = mod16_0_Y;
  assign OR_OUT[15:0] = or16_0_Y;
  assign P[31:0] = mult_gen_0_P;
  assign Q[31:0] = div_gen_0_m_axis_dout_tdata;
  assign QVALID = div_gen_0_m_axis_dout_tvalid;
  assign S[15:0] = c_addsub_0_S;
  assign XOR_OUT[15:0] = xor16_0_Y;
  assign clk_1 = clk;
  ALU_and16_0_0 and16_0
       (.A(A_1),
        .B(B_1),
        .Y(and16_0_Y));
  ALU_c_addsub_0_0 c_addsub_0
       (.A(A_1),
        .B(B_1),
        .CLK(clk_1),
        .S(c_addsub_0_S));
  ALU_c_addsub_1_0 c_addsub_1
       (.A(A_1),
        .B(B_1),
        .CLK(clk_1),
        .S(c_addsub_1_S));
  ALU_div_gen_0_2 div_gen_0
       (.aclk(clk_1),
        .m_axis_dout_tdata(div_gen_0_m_axis_dout_tdata),
        .m_axis_dout_tvalid(div_gen_0_m_axis_dout_tvalid),
        .s_axis_dividend_tdata(B_1),
        .s_axis_dividend_tvalid(BVALID_1),
        .s_axis_divisor_tdata(A_1),
        .s_axis_divisor_tvalid(AVALID_1));
  ALU_mod16_0_0 mod16_0
       (.A(A_1),
        .B(B_1),
        .Y(mod16_0_Y));
  ALU_mult_gen_0_0 mult_gen_0
       (.A(A_1),
        .B(B_1),
        .CLK(clk_1),
        .P(mult_gen_0_P));
  ALU_or16_0_0 or16_0
       (.A(A_1),
        .B(B_1),
        .Y(or16_0_Y));
  ALU_xor16_0_0 xor16_0
       (.A(A_1),
        .B(B_1),
        .Y(xor16_0_Y));
endmodule
