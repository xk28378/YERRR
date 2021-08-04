// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sun Mar 21 18:17:51 2021
// Host        : DESKTOP-KFAJ11H running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {C:/Users/nehmy/OneDrive/Desktop/415 Hws and Projects/HW4Phase1 -
//               1/HW4Phase1/HW4/HW4.srcs/sources_1/bd/ALU/ip/ALU_c_addsub_1_0/ALU_c_addsub_1_0_sim_netlist.v}
// Design      : ALU_c_addsub_1_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ALU_c_addsub_1_0,c_addsub_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_14,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module ALU_c_addsub_1_0
   (A,
    B,
    CLK,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [15:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN ALU_clk, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value TRUE}}}} DATA_WIDTH 16}" *) output [15:0]S;

  wire [15:0]A;
  wire [15:0]B;
  wire CLK;
  wire [15:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "16" *) 
  (* c_add_mode = "1" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "0000000000000000" *) 
  (* c_b_width = "16" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "16" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  ALU_c_addsub_1_0_c_addsub_v12_0_14 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "1" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "16" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "0000000000000000" *) 
(* C_B_WIDTH = "16" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) 
(* C_OUT_WIDTH = "16" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_addsub_v12_0_14" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module ALU_c_addsub_1_0_c_addsub_v12_0_14
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [15:0]A;
  input [15:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [15:0]S;

  wire \<const0> ;
  wire [15:0]A;
  wire [15:0]B;
  wire CLK;
  wire [15:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_AINIT_VAL = "0" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "16" *) 
  (* c_add_mode = "1" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "0000000000000000" *) 
  (* c_b_width = "16" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "16" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  ALU_c_addsub_1_0_c_addsub_v12_0_14_viv xst_addsub
       (.A(A),
        .ADD(1'b0),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b0),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_xst_addsub_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
dmmXCzwxW2FLu/vVGpJzoQ/uTl0t/oirVzDN8rGCQ/cshHIr5KZa8hMP1zjDcrW6js/9tSBuCaB1
Ioj63zjqZA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
N9Ijk+dhcsedFOz7GhClRR68iRquy2ZzjVLVhi5GByFuPpr/oGFn021AFcKE54GT1hqizIMvWGS0
qRbWSO/aiWGT8c930WMeayc4xm2b65tzi7UyXSjcZqyZqk5spgPewfSuL0LKD5R4+zccn3yeTyAR
Cpi6LZ2KmpRW5biXvss=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
M8NGALCMec7MmW5uPCxfU8HATjWU2XqyPU8phSDe3mtyor4pgfPtg5TJdKOytKhxa+fQwJxytwzI
KPxtYmaRH/KFiGrOvm7jO78NIlt31qN95S7sMYrLxORaZ4bbNMg4RfwEB0haV15qORczgxWEpvBX
6Qukl64ihp4NiBjXt4YYGoDiNMSczgOe3tLn7UWjfPQnsJ8aMxugelO5AciSBxAdohgLMRE3cu6p
gwakO6ytq1vAR8bqHLT8g/Kdsxn72SBHYdpkba0NfEvzzheOlZY7fNuWD48V6QefMjsX1taMkmQH
m38VdXlC6Ocia7H3zT8LvNLtxrpG8zyD+UI+sg==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
I1BukTJgP0oEpI/mdw6jwrYhUTr7MTzY5G/EvfuPKQfGzYRI1qLG+aEQeclA1P65+tkbstBEIIg8
ZhiouPVaom8KwKZHBX7eLpxvNBcYVFfnJb1ES5wdcph3sgGtaYKSpspp51oYPM6ZD7DmMGdoc/Wg
JVIUuIfRpo8AnEMfkayPkbwuB0VUKpz5BXS50B+5jvgK7cFe2gUp2ckThqzKUjViVB56Swsz+IQe
l7GvtTbuNcSwapfPtNHH0bWSQStfIzPZZm1A2IZ2WCYafRPkj7uibtKNgnKgIZs1197qomgXbb+b
fDx1iikgF8snJsPchukmgxkMSQtLntwbLs6H+w==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UNzBll4hVdQjkp7KJChMHZ9agdKjtTu8+3O75Phz7SpwUZ73Z533+9pCfaH7QI/cwqaVREb20HXT
ji2kU1DV7+Cwbshd08hvUBl23F60ITYS+3rluBLIFX3pzXhjjSu8HQpnxXppbCODvCiWrDLqRU/y
lcFf7B+yp5jK6vEY5xuh8is/oxSPNFwip6GSMqDnE45GU6kU+6n8FTk8pAZUNKnh3j0t6YzcwS3J
wYUhnJpEQYd7+0D/NPjEz0YFqzB8WCh70MxBRJzwdXpuRLiFzplysvw+eHjMPVeU/UPKJWuwWuwc
Bfxw0ThSXZit/SSD+BGhxjbEI9T6rh66FpqbTg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
F7AZy6dB5VKzcudhyRSKWKUbVrSs4vS9jtgDkM6KrVPs3ghP3AF2TeIDyl03EesBxeIQxHqq8thx
uVIGQN5wt92jkzGo61VyUoF2dYHY2dkK9PY4bicayI6rppCS18HnyCC5ODrTMKgOpoj+PEmghCZl
j8+i3NFWPAo6M/MAtVI=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
NQpRHEO/CEh2TWVl2zAKLb4TTDP4G4mQHrGzJeErDNbJ2L2B4iz3unsCjzHkoDagHoU9jeHYNzw1
EdgeGwokAwsWnHc0V18iEu5CZPPLrncpORhuc7qe0zJvoIFW4tgNZuIjFZI6bkrWzgxNYlkitGJ7
wQxgR+6ZenldybAjVF7d1R8FQmrEKWQ9ztmGHKMd9PfWD1VsbOoxbNA1tkQ3Suq2M9HDzUONaPQq
yMnGxLE4+4xTZZFVVFZeizNxqQcM1Y6s2MEUyS89U6rdAH95x9zDN8PGrif1SUWhpoz33cYp/IL8
acGyIWDbmuS0X+xsLC8cWcrO/MxKDk8bj12S7g==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
W2ZLxVMM2bO/6hqe8KRsBOYby+akb1JiKHhCv9fhS2DK483JVHKKDFtV5ZylpQSPfpmWVI6nDnNm
XtxOYqhOdd9wAHIVXly/nJQ3BORIgR42ZfKk3tkiYQd75XwTJmWjvIda5LTjKISy58Rg+7/yc6kX
SAKkQWzcaHy0VIrsbeLAK7Rz2vPrBQAwZijqUO1uD9pTa1ID2lBqRKOaN/lex50cPJ7PNmyesOUe
aisZi7+ubKWoKmZJmdUy4nKUk4a0FLkIqdFpmX+Bu5UVgWOF47nrEwh3c1MVRxWa1uvngQGGl026
FTa0G+nc1Q9KslAvMQ+fMbz+FbnTF3u/A9gizA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ExvmxHgSJkeLy1yTLLwuZIaoOCrHjmUt5/buVEkn1bfdUYXD357uY4AEPX2YgaOyWMwdcvxr1Hhd
o/0sllo+E5eLJZ5o/RugVur1urJyYoGhViAyX8cbnR2OM5xnXeq+3LNZEHqTFrBbP6NhXKeHQahj
5FVQwpEvus2Wu+nI6QaEzpwoK/9zUVVdjtnHyeO33nwOojJjL6tKebvwBp+xWtKoUWdONdA5Hqjk
BkTTFTSGLFInfNigOymhMBzsJcUkoUkDCmxFvPsNK6es4kmsZt+wKe0icVqCFOT56uk0t4b7GhOi
Ek0os6VaQSngbyvWYCy4ZkbEcfYEYju8uCBYCg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U2AHnT0ZylQXY4GEiBlK89eqI6DmA8ApAZL07+ooe2Ye/NC5gbSuzTL4Kpsj1tAuQHrdfgQj5emZ
rV/ODfZCIxJwyOtOq1tS5U03YJ0oV+aDSayDfxEH+jbM3Q6OFODLIyqJWHZgg5wKUXTl4PfhlJjK
Teqxm79fhhco02cQARotG2xtPsw0npFG05bOkbB5t6c7Tsp0HD0WFgJSuME0bty4ge7pGO2XwB5f
Re2RlSwfVJnicAAj6kXQPUJGj93qAFrq9zyDAwL1M4XBD/GCFPA4G3zytUtXuy8PJ2XH6y7uciCY
knz/jrTOHINENU32sivl/a0ZRVGfjbm9Bs2ftA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12416)
`pragma protect data_block
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
`pragma protect end_protected
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
