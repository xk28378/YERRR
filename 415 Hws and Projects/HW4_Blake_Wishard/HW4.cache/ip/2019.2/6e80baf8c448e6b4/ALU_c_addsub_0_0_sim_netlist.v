// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sun Mar 21 18:17:51 2021
// Host        : DESKTOP-KFAJ11H running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ALU_c_addsub_0_0_sim_netlist.v
// Design      : ALU_c_addsub_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ALU_c_addsub_0_0,c_addsub_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_14,Vivado 2019.2" *) 
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

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
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
F3a6C8IOXO1hL0fmRUf+g/zoiSR9t+HVjXr7qBzEbDMwzNtgC+HnfoNaE/eSa/9ToSB9tCNwbyij
6dkgLhqjXkek18tQyHuHDHi81sXdL0PZ/OLHmYGKk3eOuGdp2dyQCfPPH8+bqUic5mXRNVV/Sb+q
eAMlN5d20GiS0jEWn83cYSlX75p3g+S99Y1Lkbr00ELmB/AcwGCIv8k9tOmVPTza87jc/9tBIjxc
CRk3holGQJNpGdR86aefCGEJvALKxfcKSaQOl2TSANRXePhI2MvnBq3QhIENrsVaehbbMh9aNrMM
jWuggdLGZsq/L8ek+pCmi70GtdDN5ZBVu3rRsA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
49Kooev9gng+jlu5o1MlVvhc7rbdgr2Ble2IpAgfeYuEaQRNhxC7JlEEZaCo/Jzbwzf2zfgzLU43
TSQkIbS6+QrgXwcEu0bBbT9thZUv10WvvmKVgWmWT5lp2kha9T+/YC0kKpy3CN+EpChkC/YvO3tr
dxwNhyVL1rG2WTXLItOiHAItTuh+A7TGfJHdnwuFMFU72egBFuiYMkV5UUZiAKyHdXP9es9j0+ur
CjGStNg5dFynx262Ok6BeEhkS9hb1KhgoKXMIwOCY4gvOKBlPorLl/TTcAqOh+7vgM84rCtUIpvw
o1JFe+R3zSTM23azEyrjlsc9TyTFiUxgH3IhVw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12384)
`pragma protect data_block
2uZ/xI9kx9QIrubL9mrwfW9Ec6vshy33oUZwC92WKdR33LklS1jrA9csv+uyI7Vq0aUcj2ZUDHsx
Hi7Ww63E+pqc9/rDG6zxavuhUT746GcJ/980A1EVhiLxLdHaG7zWAypmAsstrr9dWJCv6V72vl2Y
11esI63TnIsCyXKRRiFTR47CmUKi/5t5PUc0l97/nBNAonmP3I10pXZxmC9S5DIN5EoBuGv1HnJv
ADekUFm/vuZ+WvtbqQ/ul6sS8VNVd5WeP0H2XarG+TUKVlxKp80Kn+g/8uIOJ6FWA0kQ8Bv2Evwu
41t/Lbd9deW0fTH8XUD91mY5xXq48C6a7kDtzmvZR+/R7WXpfnrwYTXbgYIHzdBBwIJwVcWRx9ys
kz+5kn114YzyndiHxOqHyaoLlIMFVb2cW8pQd2W3708udHkHs6BxbdsKY4m8P6kb602LJfWCeno+
COhL3QUeq331eRsrzUOJj8eXueuPt0jDC1CXcLFoPpRpYctUcjyjDLdk2OW2Dv+L4fzirYSvkFpi
a6tC2DfQAqKDjEvXFcnDgkJ8zh6Nct3g1r2LEvm21LiY7gASgoiCQo74Ca6G9F+G35D74tR14r06
iNw8K70c09zaEzxNlDZqhQByupzFQTZPnTfG/ma9Lkf51wG44nhQsjejS7yK9ivReFE51n03+jvs
/filwaCFL6sU7XCGMfQBpntlQyfJOcdxpK5KDPpwbyalVwssWAG67Hn4cfEJkEdZ9UdNE7vhcT00
rPsUdMcgVmr9idOXpCn+NKMtrDDvcMTIPa8fKrKJGcpvZleKgNSo6yT8awGYpoXCUXceBkJ94Dgd
bYevRzw7Rrj8/5pAjMu9yKKwUo/5NvbZWiHljy7EsZi3x1t20+bUSJo8ItP3vtmyziOhATZLQtM1
i9YW+1r0EAuYZnlFeIlgxW9lyrpkDfV9PLEZlwRQOSkExRsmFiim7ldzepe+sKcNIrlhquwKY3L0
7aFsa0Pd5q+nyWe1fnxEHJiVCYZXPuaTzzLeS8/2g7DB9Dl8khDX7nOnEy7eyCf8EjdxC12Ii5Sc
sdf7MTzmH0KdKNc1z3sNHeUNkG8+voV1p7uJhDQkkpNCEVskqZjvamhNd6RKwC49eBq1Q/h0A7DI
3KhYdzmlN4OrPmau8fB+d/EzSvr6HSR0HwuI1YfFX1ofHYk4D2hVlU6B9OyzOhEb+VjWh9waTVVx
tEtkL1gTHLXZKTGf7R8c6VDye6/WQs6yKNb8hOB7SaStL/xTsVQGC5YB+YLSkd+fQqVxjkwG8Bc7
8DY8neFULkBjMeD6o2q6ENXr2mQCJgY+rqTl8n+AS6P0Ux8QdW+xyxIdlwdNkVuk0ozuv6uvksWE
CME8+pWZ3jLXsM5tZeNPYwO22sF9IwK1SOKA5Ygx3CaT6lfWy/dk+rlsabGbJWMlSRWyUw9TWw+x
AlNlBm33YYRHbn+AAm32hk43OSqAVZf0My39p2DXgL+KybGYaPoZ4kBXa3byTwMqbwDcTckS+cnh
C6+e4FsUS6EhZPZSsxjWRHqxSD49EzwsRur+GSp9fpv9oledZ5jhDuvm+VXcLwz5mx5yvAwvpoed
yjbAYonVjCE3b4ti7q7qMCBGRRbnNGXobefw1NcU0VwOne/ydAxS0Dduka71bkWiGMJSXf9Oi/A6
mpqDU2cZFDTySetlX7GS9/I/B3dF+IeuRJ50j/Zz/m/YvWu3gCA0aQoiI0QIthVRW5+5JjUEC3Qe
X+HoVLJeHvO4M8a7LedVA2CzkVF/SWLk6Hm/79mpIObqEyERZ0UtpS/lJ9y4QqXqzwmM/8QayckY
Il4Dsc1Twehmh3KA5ylPrnnYA52pnVwOwItvnrOTJwT+44lTBKpa95SIxA6Bb0YrkTTiv1DAGuFa
LpiqqT6XKEGxO/iLqjjGbbFR1zTSA4b2BhANpoLPc2ZjDP2uAUyvw/UFoFff10ImGBPTbGI9TeSn
VXW/xIt94y1MzDk3COrRougbhS3YIJYDI4uc3ZBud5eQfjAqRUYpI6N3aUFjKk158QOcp2Qjbq3K
WLsfD+dDgMCazEwxXMCSbZeCWH1YHIzJMVCBrpnQ/IhQj2oTXOKANMkP9sDpZz3OR79QaiPRtonk
593Epw9n7c9F7r3Qz1ekMntkVk1PHeZ18F4YbgQ4ArxFyPlrPuFLdkIpFe84PfcP0+Hm/IXPbPAa
+7jzX9IbfSk+Ste90RVHG1SR0NT690NeqFzMQlKKN573Xdm+ZzEWnYdvqnQ0g67d55+pA9PXpyr4
8ZM3USvIn2siRAy+oJNjNCC2+7nWxCFxSX+KqkxnlvtXy70i97h9RubfHqv6EHJR3QYlv+wEpYug
0UrGBcfS+P2TWW/TzYeoNJUCP2MG0C4UKBmMh79SJNPbCE0zlmYiLSzOYjVEos0ABISLDBjnE0Oo
qIzxBY8OmmqhFp22lbkxBJOKs5XfyzmGNeLJ4Jo2OLM9j8xJ2roKy1SQdfp4JAolL/Kx2KWxaNp+
Iidn3DblXyTWahRv5kTq9ec4s7XgN2q3xvISfn6QOzk6U4Fc28CRDfNyDfXK1UzzIunqFwBS47yX
8l03qDJ7kYrEyLAePbLVhWFtejFVIFcIrOTWWkFF9Jq2+Qv3mT3vHMai+L9EOPRTNTln0ik13ldK
Ss0NenBE7WqWTvNvvCMTsdi0OEuDjrQNBWWYw2xPF6lHHN3y6TnFqHsEQnoRCS7tumyiAg92PyDT
ZFe7k7yINvP2/euQbXy/tDSfOL6/Er2tI1iWMBDQ8k2hSq5p8QxoSYTl5Fm7Ims0zRvpSagiLMIT
RaxzXYPZIaeceUSoSi/NfnLW24P0Am1+CLUaXFZR2Lkzz3cIE4DuYDkt+XxnNy00K76pgxw0T1sr
fwg9IdfLk0WApXagz8QOUo1fb3l/lGzSlbUVzpP94p89yCT+b5dbgbQn9RFtXF9gPht0sNYolXqz
b6G5hgcNpNzLkCRe5HuYZlwaeoB21rLRhojQVyEJtT3/Ypsyh3D6cGx3yuqZk+R+zOFKEft931Z2
1bjzVTWnA/TlPJWoWXiEyC8s6Gm3cvWDVLb1NoknHv+M4KmW7z9DtCI2e+aV/MNpKzlRUm/XoOm6
l9CN3yMG1TdMjYdj4vocaNotCUucLCFyJ8AAzieNKuq9/UIArof5vtT+9tGbA/TKCJMaHsVodOC2
fVOFAWm69dkxYt98X2hAG4bb4VXM9sSKDs+hqLO8xrZTGP03lnNQ4+m2Klu/X8OvnjlZ/0lk2F68
lRMMVDBngbSa4e6GXfML0zjWfFLa+9rPcJ50qIa2bNf2tR1uhq2oaNSS/Jq0l3jX5+bj3+5oeBxl
MLjpwb59FecGz2+IB4uYj5vCUW4CEST25R2L0485xGGX3vpJdoVJTO2Rn2b7I7mmYQ3wvq6Fr4dn
LR0yl/a8ZrK3V5y1O82M8NyOYHGFkVXWu3xGUjCfq5sAMozGYta52ottJkho6QPwzhDU1gGw+Dh+
4WPBauG4+UI2FtfL4kTbJipONcozwBBo2N+G39+CBKOEMMtTENdteBlLMKWsFQDfoQI68kdXfj3j
VtJ6QHs4Hq+Xt8GhO8S7ImlwjdnkJXOcUk23y51QJVECAhg9A/XftQVPb9apR/8aqZGPl+naEILk
JiZnoRPE0I8U62btKAYUO4xVEYT9DPJQgcqEjnAPsKhSnDUAegRy9lvOwNEfH1yDEG8IJwTmmY6Z
AVKCucXT0nI/QXeJkGCL+OLktsv8nMvIb4TFPhcPVQZ7D7e/Kkig9cUr6oNKE3lZOyY4YJqHk2F2
EOaiWXYPWs4kEZF9YSVA6cerXysWo66T/cXrR3Ll+sWqwT/DbgqM8BbdAjyF+Yks2YzyLxJDX++E
rDyzTWcuUifFfjMLOSHQu0ZYDifKFSm3EyRnhtdGTJTFG5myypGlDMYQs7K7Z63ZV/nBvYdITtxL
rEGGbpISs7CjZOQbRcvU9Ad+6G+Ka+dfxYOKXDhXtVmAqLyuEFZUVvyOZhBDASCiz05GiMkuYYPq
s+yaodoZZQIqAOLunf8jVC8Y2lMnNfcIGpoU7EhFrUIlD1GHWOYJ7Ln+tSVuDvfQgR5mlMIOB1ku
FveZllPYjKO1F/nw4H9A8ih4CvdTjas8y9P4Aal564UgnZObWr+3sj3Scqn59TTVlvuFogOiIdrD
jhWLPJChE/tRw6dVEJPO0rtvP8r3D6arGxKya4mYTnPkVTSggEjO25lRxYSulFK97d3s7287EMtp
0JgDttzUtdvDwMJGEQBUvvL6E4HdKUPkJ3XlHrqQXzyPxsrflAWs/g2rVJ+yd6HjBvKfFK8uQXQ4
ZA0I7V5b/lbTVApTIa8ba5EZ8EKMwycf/SyeoQClngSiZ2jEIM2s8+IPwwpMNvpsPHZ8JkjYB6EG
Fa5FW8c8k2rnemJ0CjepD3GxxDPGSmiKQtZ3mt2qbJ2zDk2rq5kP9d0QIWKxQbvpCpwd3heT8m1M
tvO96MGQptdYC/AZbelfTdLOX6NKXWb/LbIrBMT55LcegqJ5IetoMQNEdX23psqra0poaQ76iJK6
xx4UN1QfQejo3Jji7gRr8w3j/dwfY2xz7s/js07AOlxV73u9SvErd2LqseLo5BSO3EzwgaJtaFBv
eMaYgoYo4futwQ9/1gktYjXhNk55wz2c1OEN3SYe9xDyoCs23qdzvcIDUc2Mj0qSs6uhzQ5uZPBW
N0ndocCWDBrfswbwH5bhHi5QaqDRqxBG7XXsmEhLHLXNqTuQJ7C8JG4tusKNCI7J8uNMSfHQn3Xh
Fy6XGafootVCbtOe8+qDdF/XlASd41UvaeimclYofPK/qY41RX7Klqs9g3NKq+H4AlN9mw6k7i+Y
xycL8yTFPsuLxGtngnJEWJST33ZWmVY9Im4dePbRusFLUCX5v1o9V+2XIxQv46lmGce4+cWDzYXU
2vX2hKe/2EfIkgVwY62nn6Tg3bt5XbPQIpV6ib9vz1bLiALGqYRo408csUswV2bqqtmUCERgWXVJ
zQitVK4IO0Gmmjv81JGjBCaiFynWZK51N/RvC86pZSolv8jZxVWfegv1rsLSQesVPLUroVlBY5YF
bdrBy5jL0BjUGJ08f+BsCgG0Dq+qo0YylgY+8xaJOGGrW5sGBQpo6ouN/bt5nWBHrLNiEVtd+Fm8
Zsvf3sH5meskMXe297Ci0C+sROl8ZF23HExYCRwCjLQcKsfGPZYcSKmTiQhjc5lSC/kPVQmyzjU9
e2Mof9ZP23/KURFlY00tUtzD06wuD9LWnErypO3ufG6yi96wGOy5ydsSCvg+1oDjzLwdJxFZ7kDF
TeK+WrFw1p9rgjjcMzdTP5cxktBTCiwX4jHDXxlevzERSJtxt+6F5xSuq2S/gNsxu5I2jd4EtOf0
ZihTP6tF+4cHl7P5o2KzQL2h/SlWdfcs93VS1uulqOd73+aSft8HRiijPhmpRoaxDFvfBJIHQStw
mu4WlBHio+UGjYX9fGNDdCBd9Zqd7PmIu9gxix+bpsw5xg4gFlMHWuyNlwnIA/2HLzwzjwF6R/g3
DRNqVOATSqbH1Yp4ZLELSLVDqkBwHUOEpBqg8JhtFUOWWQyOVBqLQ1BHL90K7RzouJEuFflq1JSS
VoTYStMNR+aS4v2AAEeKeTLgslNJ15EZe1UYqHHSDlRHNm/AJCDnC5Bg8tGGA3E+SXJJWtzyGVc6
WQnKNYNcqY3YMCJq2tItW88PvquUi1+R88VfhLO9ZnvX5oAKJ2JXH3RJ7nkmAkJjqzVXlVpbD/1a
857ucdkVK7xAl+CzhNfHEi0WYBOlvD/Y2No3j3GSc2eokMdx7ce2XapT324+aKf9yLjM317xwgzL
teigy+Y950FFrNULHQ0V6zCG773D6vUClY0v3UJGD4LX4Awx4ZhTJeARUxylSV/YUeXTgsUQ1d+h
/wyOWmC5GaIvCKABf2+bIogpmc9LaG6SLu2FFvzcey1llCI5isqausdvo5rNWrb3lknnp3TE2zA/
c4qm/vodSvfDTt9n0INiTBVDfmv6K9dRvR8okzLngGSwKDLcr+MGhPFu/qAb8HIpiWTGmkdpfnh6
9s1FFpVioHHuPT7KeGo0gTmN+S0JpyypQH7cJayibP1ka9UsVF7X1ZmZnJ3HaX5LWTaHJTkIqnEQ
o2qB6xzJsu6uJbUFqE9DQPl4nU9xu7J/qujHhUi14z4yuvyjks1CuBd9ieA1X7wI9U3f+X/PLonq
4vsd8uO7yTP/SgWLjygpgt7nqROGa/Uuq23rFg80DcPSSk8/vGzTcBlkLXHIU2LGvrgYq4wTUkdz
OndiBifJWq3bBq89oLQngGN52vYwHozNkRtrhw2bzpVxOL8kskpCFjlNbSnxVWo/33t5YRJ6tAGC
gIHC/HhiXhIb8zRYRnd3/rAaGGNrNl7OT2gHHKHPGUUkQfe1GSQtq1hyYkuXRsUnh2Ue+tEvClcj
LRJtOnmHjaPct2mPur2fKifXozM1/Yrmb3MJty5yuQGi4nxkpWeIeIsmMee0NyTz/YHmM3eOLEQd
QrP+U/1tgWhlJ/oGe7+EAJN1Na5Pc/f5h0lV//ELbNBSejKTMAaIX7BNw4tYQ2nXKnbcB1stZ5Jq
qixQco5amrRC+7PtMAvmH50eAGF2xMzCW2jYvuC2INUQyZqaWUKeTXbAx5mlVPHIXokj0SqlAPvT
G+zd/FVl/hMoNIqO82Vw2CGCH47jYaodsgzrIoexLdEFyCO37r8Keb/LEcGU9LMMIAI+7sFNTaS4
+yjsmXSzBgUsxxl+blHFklO82q+bhep30fTQQrlwL73Slh3pGg2IfYGyxo3Dc0mRG3sTJvAUfDzE
Yx2x3p3YRMPON8UO41PGUE1EkRALrAnIacANXCxskc9gNCAhu+JnQW6X0FKT4cI8VSNZLQ0rlhQ9
kdfnY84EBvAqOz2dvVVMbI/RhAh2BEOO+wTHOfkTkQQ7slirInBkpDV0Lk3wybsF0pFpsrNkXuNG
eNZC4n9ez0xGtWQxkmgqeDjEZ3KV5kiBD/nfDrgzDHRE1Ld40pitfA79ifOfiCnRNOhO4rQha5z2
RH3tQj2WzwsiC1MTmF+Rax3liRZjKczvt+/n7kfBi8WseUCgFP5NRfvg2+hUExsZzVrITnw5qOPY
JThMM8yqnY4HPs8ID/AJ4nIuXw7EliuXO4E6H8K2flBgN6AoY1nxZ3Y/CR9V+MT8W4IWbYd5oTcv
HbFipYlR+p7emHg2KXQgyG5icBYrdUeiyVy7Rx5R1msiwPw7R0YSkFVy7sy/uHED4vKrku2J7P1d
jYmTm2yD4wgNoJPNN+xgEyOJ4hongzCltb4/U4TEWIgljsbPZMQKJmHG63VLy+1Dx+GVVJn0hvEI
pikQaQL0e9iZlMBCRFBD6Ropbyj68vbXd4Ro2D+6gmWuQsmKVG2uUOQhC4RV673eF3xcSp2l4Vv3
l36Wz5KhsmX8IEOlRdSb/Gq4Ko9LWCytH9cet2dvTEeIN51GsbwYGjJSDqWv48DohTO2LtJ+Pm5b
Y8YhjHueXPnq/mFPG1SyKtC3+a3HAlDZNP84VuY3Thgi0lKw5dH0IUyEh83KfLBPHUvPVRsKBS42
3vPdD5U3FDZ7zOiutOJ9JZmu7+htOM6um9i+VtnRyJ/Hvq/Uz+b2NgdbOUGovLzNeiMOEIS5C6J5
fglMud4nD3gds4K4TKJOfz2DdckbvjbXk84uHHojWqMm1Tn8AxBT0lBJy/r/6dbUc1uEWRmRB0E0
bWPWbeUgmyW8j8KD3LhR1dw+oKCvNCpHuT1Tpp4h+t5DB4DYoPTC8PLYHXwYIhiRlDL4slQVgy09
4w0jqxnZT3GhgYaIvEH3xPSChItDg5eTFcQhE5llJJT4tj0iyIl4bJwyMe4XZRyS4KJFtox5Rs8N
yGP8CfVvIIrrk0HmdKLpboLXQKdXyWwfyjI/NJyYxHD8frWZyeXGufCDVI7gy1G9sILVZktR1IWz
K+Gb4FF/fI+1tTsiD9Fv9Mmuf/lVfA7zdGQJLLk+VoqpT6k72A/7/vEDt+ziNtMkBK4B1rhTx9Fw
A31cTswJq1yM9yvj1TpjusOpcLwbn8c1GQTJuUunC+mRVvTZcBjsiVBWky0N7A0kXrXhqXXPmMYs
tAABH19ZwZvtc7hzIquN/SgEfPCTMMLEi/m4ohaVQRhNIYTfM793wJpOsUQ1uopkvxfu6saiFBKI
cywoBE6HubZdFB5IK2bejSvdYz6L9Rf/kD1/+IP3m0P6EYPgil9rSH2XK3iluN4oiYLqT98iwxnP
T1yvv4uRsdJ1UZW3havodsJXK73C8uH7PPwc/l5R9ElRQjMcjbKX3kOoAF5lFrh8mwW8brxizMNt
hDSPcE0yIsHt+UXWrW7qbuAnSQ8VYpdw/6euXWVc1aqRSrl3lqkTrKUf2xeZR5Pxz0q4KwcFkP4K
pDnrWZGdPXtzbwjScH+2melq935SCiPMNiIGVsU0E1ZXZxSnqoZKwG0Pe/BTfLVyvzuMXaDdHaex
pla3zSz++babEDbmmnZN4Yat+xXI+1mn7z1lrGsxjUYa7GeslrXAxfhSoRhDtBPHkW32g3BTwSb/
ybtbBIsnodPcWS7WW4IIJv/+Flpch4W+UMYv8sag2loE0TU7zZBxKWOZjGWP7Kbde798IcfiLVfP
5TBoqvGkEWu3/47UsIpb/SJwowpXnnwnjwDA5VLJU4ih8QmTGV004NDCRCZq8yqO2IZWSIo5LPbf
ryAzaoX7DblXV3kkSitJfNMT5EKJGXcJX8cCqEBlLzKIqNtKTIReXg9uieODeHECuQG+jpQwq18y
PzQgYpc0aBM21ZSV2TajkB4M7VEohbzEgdvXDGGzDkzSt0iL/vYxlOx5Em/epwWIBzE5gwwM2yDe
HZ1bHtcXgATi8UhcZviN+oOin+JE0Qg+KvUFUVbRk1NKlLx9Zar2VdvyheHYP8HohhGzhgs6CB64
bmSjOLD1HXksKjby+NggeS9SLHJRbJP+p3PV/FmY906TfPBcwD3wMDkBK2zWV6grhDYoWdYu6BxX
pp4VYLltYfLh1eOB96vTYf5SG8IgW1JLcQESe/8uO8Vnvautwpwr6pbkTSzVn/6+pxyuJM6gsHpv
AhtP/08a2rDLi/9u65GQObtqsOz8Wy6aqN71jpDSlp6Bo4vcbt3eafwup24xdyspixyYIUjUv5Hi
2Ae/DMmsPe59vz/eEKZ9V82FV9o8DKuQGhDn6k4IOQvb8TJedWBK5Gp/ci6FOIK/fArE3xfEL8sH
3AH2Z6cBFcPOECPUZppvqH8jk9d7LTwtROkWKN3IS4RnzJVu4lEpQPZedYcZYZRUzZt4gmOAO4fJ
duX1bpzovkylBe1jtLPK2PCR8Iss166Do4zRI/wucyMezkoXur6cuIFrkb6lGMi1nPX5da+LXEGq
YqyxuLwbD29VFAwI3KM8E6qCZkD7vGCrbsJQnwa9D750NWTr8fK2U/C7tUPoDtETQ0SrbqmVUy49
y7ziGeXeF4UgUDSPwVfQSESOOxSz+x9rF2e9FTMJ9FVhbS5ktSdFa9W9QUE9nmQDvkRgpsf49sUd
bKTrDgDHLjm9k1jeKKqMDPeXarw8QItPpH33Eqj2ApJfzaHwaA6GF69Vv7CYH4k0Fwzj7lPH7O90
aKtumSpHWa/Sp53cASupP8zPXGVO1YEzCEGWBT8t30+R78Fg3iIW5NEd01IwCenIms56rZTC6lfi
NL8rKdR9okQeDyW0Ue7t0xrrnSUon4Mt8F8zmyMra6xKw7fnPlGkah7rQp1eZiBlDDEYeDRAh6bn
efSU4Mv7okhW/IiE9jBoXvPf+m4/Ke0nMmtj9XkJf5eg1Hfel0Bh6qVhPMQt8WziPNQG6EF74+76
aVjJi4W5RzRWrfQy5uIXqkEKE6VMFUjH8lXKsidOkvLtbvqLJxctie5XU/ZxqauCjLFZ0j2Uyifr
9BQq5bhTlrqIZwtOMNUf2osbA/pSLBIrgO2wMDhA3mpZ0oovte+Cn1hPgtgu6mAIq8K2fdbd5WCz
D+749QA2pCeF87p1aZXUvKPY6gGRekqrCsc/Z6utVjDCr/3CQgtIUCXKbNEEFbRLNvdfC9WNB/Ua
hamxiMbkfsBtYidlp/u8eUWM2npsUnkpalLF0WQgJyupfuzxj/eO5v8vSijBFlcPPlVx5qxqINz/
M2j4DV4d2QnVIiKiysnuJ7o4WETuoPwioPCsajDb/Yh+ixL4nj2AEwsUsQb/v7VGtiQFmjPGAZK3
r5tlzsbM57sn5rDMCjfcMWgIfxESZcM2xwePTjaOYA3Ky3UWglUuLrRrWQUy1C8C0JnWNvAP7Z1v
tJzVxQ8JlKQqj2dDmHRH4cfUKJMzmrukIi9nql6O6LQa8rdyjfmu3lNLadd5UNgVTJpjqNfPLe31
YcjXbMdBebJLf27ZpSB3c7WmGcykZz9orM7vTtd/gA1bDJL1rlPjyAam55ZP8MgIdx1Fgm6SaI6m
g4jiwoLUfVg2YMOHWJVsUqHfXSkS0i5fMf03+v6y4MP1JN/CwYVeegdWU6u1XnaUGrFaQg7Sa4p3
gOZVQOSUKaH3QsISK3S9blFQ49LwF2+m1MtjHgiZ21XGJ2uykttACtVIU1e4YkPKg5uYeWOhqbk7
O11bcs4oCzPOFMzYfmMaGracrYYgD3WZgYDGt3pv9GD25YH+PhaOLE6ccOo9MRijgmco5cHAlTRG
oJm52XjUlC4vpgCb/TbyzSpHgJmwGKspjGyOBn5lNbL8vGARbfslmgxbAmJHJrLffAldwxN1ZdY1
rN4NibrgKgVoeRWMg4fUtkfnXdKIWNQ9LRFUVEeF+EbRxgLYHFL4XvF9j8uRYmHZ+9/2jZYCoMtg
G65P3RlTxfjoW2M1ubJ2qdf7kajgIz35hzdnHbUXJmqYUsV1B70geXPbEKXeST/IYzlRMIIYBlk9
Iop2WAbz9YLrL+YzzlEpq72nEBkj+xadbFAogcJlHf5IWv4KanRbJRcUiZ4whjCx0x5UcesSc5Ka
TBYnrzbA4d+RyxBxHZQtULiZgYiUUNWDERtIKbAtHXh9DDhMgxzm/+ZLU2/eOFMwMLyudTAl94aw
LAqQ2iOWyPuzPduM7dyEOGH6OOxvNROgrD2eTBfdZiXlFaCSo/b1GinA16x2FvaHLVC3Nq3Gozpa
t2bAhb25FwrCpmZNCx16n8JLkhefF6wmDto/nA5paBazLE1RUDPOgzZ1f183sscpqRsrNps6sB1B
8JWx8yWj1aIqdNH7USt+pJCHsGPeVoordqwKFZhdhnSv782CV6TZpFGlhcDwEcyer7Yy0IMZBwI2
J3SZj4Jwk+znfQF1+DK1DwZO7SG6d6CM5fhm8OgHlUnv0RnCWBbp2ZZkVgFMER1vqf5jMXtMFBIE
ItT+3Rrvz5s7s3yGm+Wj2h2iBZWCcqsV1XJHeo8mUpGZ9U05FcSXLdgLJKDhfyRS4mrlNxqiXhlZ
ynu0mXbOIHIc53DvY81cSQU800snm+yoDrJ4tsaPbKxn5kIklFyW2mSTT2vinBhJt5VrIE8F/LdD
eNpVjYmlTcNtjbCT7ubi9604GE3GYA6LgpCG9ejMaAvm5ZLtOCgM2pViOYMSByjh7yCsHsQeNg93
FXaxD5cRksvVRKptnInh4h/plGt5yEr0rxfMFe6gqs4nOpgZquXbnjfh0TcctJDDAH+nVjuYluqb
GdIzcAXSGv8v/aXU5Svy0azsojjUw6yIfSeqqXAAp1EwlPdDeQeGbmVVmMokXxThYBg70pfoFf21
BDbEGFbsSvro1nv8eH5nXcxVlGalT/gOVFUuTiV1hCKz5+BYEOQB5cxm1I/cgsvc3WZN3sfhTRMk
xhwOGtwJtCG4Kv8IvFNxL6UQ43azeHvPiHSVKfNvNkN3Zo2kSWLg9W0gTFug+dR72hDK29Naw5Dq
jkjgn7x9k+kH1LnK8EBJ1SqmvkIbu2ZAS3SuIz/CQ+vOSjf0cD5NGGHlQWacjTqEqCe8+QMBOhfK
6dB19LeLnpeQ3n9wcDqvQ7BsJpfzl83nPt9F6cGyg0t/9YqzNSXZIhcvT1esztkFib+TfMNm0gmv
iiFbdoUcE+5huxAibwvO38Z20s7kWjFIDZjR6a0aTLN+j3fwGp7G6ouVwk8so1SzYX0keRcP6YVg
9FtMKD034IWdZvI3p2B0bbEE9928mXalyc8K+sdE2N2FmlScjc2UymlcRdWaaBBFpFzzFO+7q8hB
0USEMPlzV1Wjf5RF/01CEXsN8AIbuCnWabPquRJQ+iG/S0u2JNsB9N+rX57oaIkxAbFIiMdpN20o
zimAe6jDisMj1voR+P7IwTswFwubPnMCy3H6IiSoPG8hn6/GO9c+y+QBxbSZjPY2btjVn2HccTwM
9Fl+E2IgT/ICfmifvmX+f8RCUcQsJ1CrArmI1bM3RS90fMxY8iDzdU0dBbRQRYujxEApPxSu2s5W
E3Jx3ZOFkxZ1Xfzm/cgvHpyCKcuZt63H2K2jBFNqh+21tDSDCDwPZVEkg1uOTzN4k1Qp3LOYHyN/
2CUrIW9VhPDJXoEza0u7oJ772oxqvaby5treooryQADvL0LeqtrymB1v2FIYZaZI2HpeFwc9PzA1
Vdf58NT7ng+/M+IULx/c/MOd++D5bAxLm6YAmpPMCd0zjDE/xKcHWPiX26CEkzDGnhC8IV2b8PIg
rfKjMe3FYOH+Ko9KRzrg9GLcWn8ctxgGUmEByyAK78/898YtSLUm8R2IeL14Xlt8IH1MbqzqsEba
UtSpFG8LQjOjoDsY7Wzdtbwua/S8A7TF02AIwC7vCSgWrxhR93M5tLLOJxT/paHoRBEc7xmwesUE
GFeo2DqKXCR7iMSVM1uXGS00/vHcAL+69y7B67GO3OfOW2/GuJeGp/J2sEnGGAia18/CpKip7Sb6
T9oepowi+KSudgZ7bzs3ZAWcW8afO6xW5Talr2sZlYGIM9MlYomxsRfaC0mX2BlzB/4EljSzjBnt
4z5HqBlhrM44pbTGF4zp9e8+I/5mDcwfB4YCsut/3JyN51j3nZLZ5lQ89d2rhsCkRk5bhIU89MYy
nGskvAg+Wo7zHoQs+c4cZUtfilSlrUNMvymZLBW3OH/Pn/dEZAUmiO9D56XsOu6VBFYsSCidufHV
PCKK316AfcF0eZnD+nNvt2CLMDTwqVL3SnbIy85liY4BTofvnpv6l0HNrRglwG4liCM0QpqMZ5uh
tUh0q4uTd1iQa+OF/psCjlcin7grXDr1zGCxS2RqFJI944aSS3eo+MOh46xw1hfxyW7LmVCmxZff
oGqfXulwdJxo7zLrm7a3BF7NEop2v5m7FX7l7XPfNjxlCzRZdSz/+9wzNbPrAay7XHgz9jQsz5YD
V3G7Kx2s1Jo+NUstyaErG7ZXU4xR+un6ExyShon+zlvteQVYqPQdIl7mp0z1udIb2rwGsSsQI0zV
E9nFz0rJWi7rRoxxnqyNMRWYf0uSpOS7ttYhwhk9r/5i5igq3i8Hy/ikqlSb7mzEs3sNUUIim1zc
6q4zbgGqdBJN5/Rue6ImGHA8xIaAG4PiNSR8r76crBahuTQiLPNtwC4l+f3srRXukI5Te28Rv8IZ
nOn16cjYlFbd0DDTS4awEdIAxz7B5H2Ek9XnnvDky13VNo0+I1CZy2GjaP4NJYXyrV2HKBLpL2Xu
R9ITat12Yqxm4dPEvvcP5s+anDz6LFkivj+dAFmq9dKwe8+E6DJou8gEreMq99as14vP4BMsdYTN
AXTdFdLVOrP4sny9iLKhzI9KameX9Nv9MvB1s/ZXCJxknK9xlwvn0dufbKSzVeXWKqVi8F2zQHv3
ZH2zm36NqQzloLKzgYaSl1f4B7ZOxU01JmPkxNUHpvtVkUJ5Vv+TA8v6LUTGLL96IG4qyW5zP4hy
KelmfbHEbFrgN/XEwqfFc6vusexVtJjECIgeN+WzEfa6MbAq/f2O4IYcGYEV6aUFypv5o3W+4biB
LZ7/tg3qz+jnVwnHvE176FWA+k/1JO+MxIVWPrWSVsH7ztzxo/fVaPy/rV2ONl+S/W/4YKvYb8sH
UfT5BCJO0S/vjc/i07J+sX3CRDj4jzOLjdpC21JsdC6sIQT1C+cIFEFpPBnWAFPF/oKXOapkF/JR
5u91+mSrd/rtePnjEqDmvKqD6pGmN+irUFkZEy6oSukDp0rUknyzKO5znQSxXSvRCKsFIlqYTYtg
M1KLbuVdg0rfBELbd3sjfMDPlOm0S8nQRsBihpW2W5R8QhK8dJ/YEEsDavU3/BmP2bkCeXtXYKct
+mFxa2nKH7jBYoelP3qOcRRYCMzu+zSW9peoaLOn0lpjVPUfO9Bgv+2GF4EjJuvR60/T9S9eTYaT
9d3fXx43QnDlyB3zXGUjvFC3HZzXGLzeMcPRuFt9egb6zeGw0VKFvrp6y5auLcZc65d9u2Uw20BC
/TTUiQbEDlkca4JhyJ4fmcM9Nvk4MkpToofQn09LBY1JJvIzteyF0d09V80pYGAelC3WhCOqVtqu
Emb/733rRuAj1cAR5gcjzujyb3CA8BCm1fJ2IWIBqKZ9QS/Qd4yYlAwWj14nOXe+fT7IbR64jfkx
Fnae8x4whDIkQ8NnIVegd+fGjCiWWRZ23fCyziSs4mYet6m/L33o3Q7uBgfoSas0oC3nF+Owo4PN
AIWFcS51NeeO8hjVb5N5jnqe4P2Fhy01FrCm1MwMQGF7abczdrfpuDX7XQoCGk6sFx0amPtQVoXV
1hoxNa8uwge0f2gzr4qmMpdZpMBj7QCYLxyHqGzC9kLVpkLpoMUZCLhF6UgTOZF0cF200ETXSzpU
2dyZBl6/PXv3j3fadAOhsrHQJLwKeDswb5dphK1LRGcG1MveOVyGSDifg2/YAyOq3O9S36qbi6eX
CErKn6UYBZAE41fL7CdYb6EeZQygtctBK/yWdyuxO+1zbWkTjRR1bc9ReFCzpo+PP9Om8azVUkAk
Sjhhh4qRm17LHXGfKqFYbMvVNEsVi6/8RobNi1CGlI6V1SEGw1q2yR28UYsJVpCdoCiaFGOTCZd3
ylqXXBcgBzw0+XR5iu0YDhWCEGAyCXkYVIkvwu5ggMbIEv2D80gVxjLl74VBSdLSF2EupcLiLO6o
7TZKMZvn7bTb9BCwtv9UhHPnNNe+ffQob3k4CAtzwjG5qm/DBTmQjSk+NefvLvPM5OrHqi/jsqhW
4VNoMakC4ee7xITc5gIsiE8GC+eRJsUrAAH4TqLzQtDOT65UCvVDLmTdhT92iAK7LwhBlKgcsSoC
mpoaPrcmnEtxowEOGBD8tjx9BUW7i2IvakpHUjFxFsftyuvSi4ll5vQAADOWyOflGR4ZlJp4DDET
MPGP+JqL0RWMewq3X8ZZ9/UcSTqWqB0RZp9WM5tc7pIK1aG5jfCFTeE8ONGWQ5YWrrXsf5k/rCNB
WmEuh/c5RdeglWK3i/Yw68+l71ss/ZpPpGAKFGaPXJKo7QqeVbKKSsCkZOI2vcynysQDXGjFYBkt
3ADr6xrYraFB18CBUmZJYC2FSymHyb4Ig1m4gcWUMbxxd+ONYyv7DLzQn0r9qJk9XuekyWd90/8g
wQhIy0R2yZBzhQSrn+YJtpVRUhUCsG2bK2nGgY6fIN0eKHG11mbA/DEIO7FZfzTTOcC1NWfopa0/
ii1KZoGXdkn03olEsdfjJNIR9o/KRjm9at/nrGjt7ya6E5nDQMz8SSH0H/r86+gqs3DyypgOmXVi
MoN3f6n+uEcOOidf1ZqfjBr1dxl6DHGo/nGoHF3FpM7838TMEet2O7HUflqIHcBEWan1MIu81Na3
Q5eKD+B1prNyXxG7pPsbewOwCNzmjSyTB+wKhYtLyvef0FHImBYBSul4h1S9YXO5+VSPScGShZl8
yZKFsJyGxXVnQO/qNdkQurxO5K7jSGu+ugyt3W1LMcgYJu/5JsGbikCcwiU9W8dx4eNmEQFyVo+n
rMrzCh5nnYE6OJysS4ffz/cNzNVhhQm20euG+AGdADOU1+p/Hgsv3txqXWhTMfxp87IZjyN3EjTt
/XmAcJAYnoSnbhDMDQBZdLZKbsWIcsrHkv908HnrNYiYUbz0KZdeTDcpyZAbdfLL13jqGB4mVfID
uzwp2qFvWJ/A0OkEgrEnRUTdgNBf2yCXeBv7LgTBhfjgg/dy/eFQrQeTIidcQ7DzhLbw2C2VksgN
I1vITAKVLgLdHyrpOGxjdv/Ax9NylJiR8/IBMapYbBzXmN5LoahL5RbhMFSFVbN0YYg7w8Lrk0hV
Wa/Ax4ybZAlkjEvqEnHxDewEJqq7MspA1aHV4GaxN7sYISDT5Akq/RRfvbrhbfmTkFxhBtQOnV4t
yQ/TEeWYtwQElEzCHEEwvSgt1quKCYMcd3n8SECUFnTllDniRg2KDv/SV4cfuRoPvt5PZFEXfz1k
fZEcjVHZmOT9DU14P1BmaLJWzsN+gEbrpG/th474P2BoepXm+Om5ZepVJx7D4I1YrzamnOY38bwz
soc/4eBGabMx8JiaLS58
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
