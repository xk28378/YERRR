// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sun Mar 21 18:17:52 2021
// Host        : DESKTOP-KFAJ11H running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {C:/Users/nehmy/OneDrive/Desktop/415 Hws and Projects/HW4Phase1 -
//               1/HW4Phase1/HW4/HW4.srcs/sources_1/bd/ALU/ip/ALU_c_addsub_0_0/ALU_c_addsub_0_0_sim_netlist.v}
// Design      : ALU_c_addsub_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ALU_c_addsub_0_0,c_addsub_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_14,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module ALU_c_addsub_0_0
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
  (* c_add_mode = "0" *) 
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
  ALU_c_addsub_0_0_c_addsub_v12_0_14 U0
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

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "16" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "0000000000000000" *) 
(* C_B_WIDTH = "16" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) 
(* C_OUT_WIDTH = "16" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_addsub_v12_0_14" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module ALU_c_addsub_0_0_c_addsub_v12_0_14
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
  (* c_add_mode = "0" *) 
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
  ALU_c_addsub_0_0_c_addsub_v12_0_14_viv xst_addsub
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
hVHy4qQ5zNq4tz/5wXVDPO16MR4GyJ57zFKPzmW3ffs/nl3Quh0Uvc+kg/dMHDz/P7ZdYH8w7Os8
mgOiC0M4N9Uqg2Qbu5us/8j5Hsz+3mBjuusMMg4/zqkf4OzXSyshyU7ERi6u1FLIzwGPinDohcxa
CkBPCu+adtdUVsTV1iPkFCxw9BLq8FmXGtUkGu77H8onJ+JefLbigxHWCTK8qx6N2m+cELZar4oD
ys+LA4ljVogqxx6YoJ4zB7KELm5316c+SDA462Q9m1vpEPRtuT1yFPIkl+o6qfNEI7txxb7Bmztp
1RXMQFQjnLEqT1x+D0oNq3gknUKCkw5++/qrHg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kj0uA0jRX1gcmFlxM5B3E4f4QUj+keuNEmPQlg8q3n6tLImISKQogR2LXXeqjwVo3Iu/4ZOnXw1N
toZSF2dVlW3LBGimdPsaTvMDxXz4OLOYCc/+RF0zZyw+VlXdtTNUw3a+w1ZgqUPYOtuZLWCwJaP4
vAEYdV9Y4myBBil+3xQNaFK3DVNnV0qboi10qFD/bMIbGNA//rwahAMbenqE6X5QjBNGfgxM1g9D
hKjXSrzz1jix6UQPpePepS1zHZG7ANRVuKM8unKWS9uquOeb1dX40TUFpIoBOaZ2J8WoJbW6YGMr
C6dmkv86G7RzHS2yPtyaHi5876TeXGiS3bpUIQ==

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
