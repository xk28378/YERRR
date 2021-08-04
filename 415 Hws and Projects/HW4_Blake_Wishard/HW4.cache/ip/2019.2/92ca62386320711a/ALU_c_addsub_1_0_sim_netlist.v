// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sun Mar 21 18:17:51 2021
// Host        : DESKTOP-KFAJ11H running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ALU_c_addsub_1_0_sim_netlist.v
// Design      : ALU_c_addsub_1_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ALU_c_addsub_1_0,c_addsub_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_14,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_14 U0
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
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_14
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_14_viv xst_addsub
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
eGqqMNkYb6elGUUZh2/Zk/aFLhY3b8K8J+zByY83FjwbPLsxl2Us/oSo34chVik7/Ey2KyBjjnff
Ojf2mT4TyqNqOCL9yNjr56J/wL65wWj/GoudPWkR0rCrtkxzX7Z+3OTn5U1yR6bxjXy/g5SCuLOb
1LqTgqh3Swzj2I+AyG5IH/iOMdxdgQ3Hb9ObfD8wrbuXS3WR1glJHwtegKMhDWjG+yMgQ+1pQStd
uwtcktwjHsjKcOkdfpvMtHZEKe8MQ2M6/dY9mZvRLp7c9XV1hClKbnuUFosDr43f+cjsyEnWYjie
zvYUq7OJLeutuKDS8MJWPL0qoQwo5vShuLu0VA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
m3HllnAUGSLF+T2KkzAnnZ/zAIAWngaZMSnFmetZ/oOzccq+BwT4/yvdEimivgCRYGJ5geVarUrS
UxruCmmqBxp0gp7cTJ+Z0s8kT8JXPWRpeRB3PrNmDSxReqwiS7tYPKmsIfWwS339YwcsPZ1Ulw1S
XpoC4e454VqjqRVvNz5nY66+22z1vsjP5OEXyH69SWVALKkXpX6YgwxTp8T26KbVSj/rDP0zGa1c
uloip47ZepwzJBA6IKkbYXKGyC5emDuKgehx/DH9hc8La6hp7xAGluNszdfOdDrYjMCyNL7meGwA
gkOuIIO9xl1xL0vERUf4Pc7mB3Peg+A+jMoknQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12384)
`pragma protect data_block
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
YnhJHtCFq2vzyqtXzAEd
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
