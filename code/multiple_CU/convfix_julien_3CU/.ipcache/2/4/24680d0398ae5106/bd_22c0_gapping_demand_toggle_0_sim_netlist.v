// Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
// Date        : Wed Apr 14 09:50:08 2021
// Host        : localhost.localdomain running 64-bit Red Hat Enterprise Linux release 8.3 (Ootpa)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_22c0_gapping_demand_toggle_0_sim_netlist.v
// Design      : bd_22c0_gapping_demand_toggle_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_22c0_gapping_demand_toggle_0,c_counter_binary_v12_0_15,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_15,Vivado 2022.2.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    CE,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0, CLK_DOMAIN cd_ctrl_00, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} DATA_WIDTH 1}" *) output [0:0]Q;

  wire CE;
  wire CLK;
  wire [0:0]Q;
  wire NLW_U0_THRESH0_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_COUNT_BY = "1" *) 
  (* C_COUNT_MODE = "0" *) 
  (* C_COUNT_TO = "1" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_LOAD = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_HAS_THRESH0 = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_LOAD_LOW = "0" *) 
  (* C_RESTRICT_COUNT = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_THRESH0_VALUE = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "1" *) 
  (* C_XDEVICEFAMILY = "virtexuplusHBM" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_15 U0
       (.CE(CE),
        .CLK(CLK),
        .L(1'b0),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_U0_THRESH0_UNCONNECTED),
        .UP(1'b1));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Pm2SJs7d9Fv63wM7NDCFAh74wwRMiobLscABjYcdKRmBp/hTfX25x4qPAHYe9BgKPKM5nAH1Q88y
tLekuUd5Uwvolg6M6BbpRmg7wPDWxq/FXtPOsOt6xPyK/Q5nOiaVWfhnIPcHerii9fUGwFvFyFLz
8SlwikP8uxGMD4pGcBQ=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
k5+OqTSWZl8tLwDjz7AL7G4jJ5kqnKvQlH1utDN3pSd8qBLBnLNoCfi9KqbT/nTIXBEWFhDGLqdq
SxxwBQlFDDLNzRbqiYuvHpw3m/Ko/h0TVzew5u25XhiUzDv0dbVXRF/bgvFYIj+of/hcUK7/u4lA
BrSiZ+E+fEQ3XKGP+h209JO+Zbi8MkUtOZ1764DcN//9WPTwCOrpVQwh57T9jq6RQFP5UQOU6DEM
MsIBiOKZGYMaWS+VIQZLj79sWmDvBmcrZvDu2dQO/tHVhH0SRtedXSq4HvKEBctfhI+DHK8c6CWj
LAe9o9EnEwfKpswbtOF1Gx+5wvDRUc52oiMcyA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
EwQ1PAD9EO0u6sErWd05TImxM8wHPIXoIXqsOCgSCrQXCX+Aup0+24t/iMbJvp7tLOOV4X9HB4Sx
BX7Nl44gK8+FW554dUr6SxVhsyN/2lag46z6ajUro5wFvwF0446rGXHoBQwJ99qsR6ZU2s1lpfXy
d7tZvNZ4Pepj444P+4s=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Y335xyvKvLgtMNgiEI5QCkXaLKiX+tX3eNlKCeNggZ/+egEmIUeJJ4M6oLgRybxl2Zm+T8lZHdP3
hJX+LUBsFljC317ajjbEKQyLPOhty8lueiIYbYSMTkZ75N9EmCmZWVzZl7yF8BOcIJyGTZ5Jk5a4
wrwHDSofHQBi0HPzya3WOz0nlSo+6yK0sZmoGs2EaaNFj/FuvnqcHnJzbSn9J98jYMEEHspdSv4j
5hyhztpFw40hZ4CllhtGD4PWaWDQZhx+gEsddkNN+axv0P4aLkcvZgC3GAmsv5vONqyCM29UHEte
FKOBkIPMnbgirqAsnQ0TEnHrknwQD0gW46UI+A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
pH5V4EoVkur+/3Qts29p4GTBa+Pflbr4lspnyAlgoU4VVSms1lCIOjT8Y+4iGoGNVYSEPh7pbBkD
ohTWJ4YP7x0A/ael5ziddaqFa6+jteqdJo3NDOgxYYmThu+G4Vyp8+9bBMD9m7boeF9VlylCyeIY
UbStKw12Qlu8MFZC5QQECWheIevAM/5IiX8KAJce6YcLJlcT0NS+6NLf9fuhC1zGamL8oU4Tx6Yv
TxagjiCPuAnY9oGFAC1ARsMtCEk+7nM2vQaa4ORnz+HtF+YtS5dO5PLdyn2enYPfUWBnwFqusZgD
RkXmXtG2hl5PNxjNTFs6ADHX0APp2lqdzLaVhA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
b2jZSMGTkURQX2Mnz0ud2FSe/Bjs0v4AXAz308Xvt7o2dAKxbEMWsmCjshL9nyJcmWBSCHDJmUuq
ehJow6a4uO2USdRTZGtac7CRaPuAD8vsz62BkwYXzVkXuU5HwsK03BFlcEsyeDMhLxvQMI8ZbD4U
mrkuvcBjqLaZ9z8BsEoKzjMwXBja8u1PrIpiYwMvbj+85tq2+k5aRP11eixa+oEkyTJ48U9d91kO
uT167MFuyHTKhYHqn1Pficw6wH9TjR4lY/AO7G3H0JbvNFRx99whkKU5IrbS4l2aamtzxT5kt+K8
uLXXWPkCfwro5VP0TqN90k87s+ZVUE7SMiyYYg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
E87uh195q/QgKzLN/Z8Duxn8bl9v6y2Tlbj2ZS8vPFVYn39LK91oFFWdEq+JMasOS3yNDKtwFIG1
9ASENx3Zxf3UkmX8+o65E2JgPlDqG2v4w3naJRli5gr8NFWzcmPwUrx1SJoGjKqoQY1HLk/yqQGV
Ql+OlIYtryXax3Axv0ULhdhANnwLktX3Nv85OKgWE8j2uQd4DNCTdVF+XoMzX3lwaMjUNl3uefAv
h0tm8b7YLj26KGHFmRMPlioub3R8bkdD0V2rj1Xg7OCybZcXsrxKJW8O0Tc5tg2Xk6RaaL5A9rdk
BH1ZvHje21VtXaJXbCx3BnQF93CpreUFBNjvkQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
ATEnyxJ1wJ7AG7/L1D+/zhC9yRlO/m4/3ITqHT9To0Fxmt+k035H1BKRg+AGgZZf3jv2vU2OkuwK
0fb0JNMVHJ1EaZTmKqkAXA4Zrln2ZR5sbdqsmm5SNjOcGrntChlFbhkYDA9dWAIFes6eOgpY1cDI
7fXOnf1W+VJ3TBx3TJoaL2uSVK1Uc6Ko42ETnxQ3MP2Rf3z+yK7YMRIeKO53v+le7oAYhhoGGX/9
x68sdDs3O+yqSlTflGsPiiJ8ZIbuiNdOFlQtmFHVHDLfI374WsMCh9U2KdFHclaM1L/J3VlpE12j
FInZ1PVj24olU0RHzTy/roRqMKkSuUWf6CDKQTfCUp5iCOTTNMo4BD0CfdPiAyKYI3PgAW62shvo
ozfb2/f/rfaaf32PfemP+JJlviUmsMRH82xm7X3wlOc+dsDyvEhl6n7/d/uGHmLHw+HI1wR/l3Ak
LfnDzx1bGsfugJSReDkV4ZRDJnoHGoedPexXzZQ/DLBbO18hc+NUklaJ

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
K3A6lj8I5aWLX6YXG3lsUmXuSVUFcXmmDd+VBtvUVguIKgCUG5p1SZmwwnK/MLnUZ9RPlRtzw4Km
B2HmpoBqgfue7/nt3XBnFrIdWWUM8aWHRANfT0UzZ7BgneH0a7OLq1/4Jf9mdi+kF1jyfuqShCuS
UwLrhdHudgYbAQRnCDoibNV2F2D4tTQDATZ/sUqHvjseWxTXVuezg72as4RJqY1v5Elw8x6qucmC
bbHqt9vbXDaBAO1Km2oWcBTgOnb8odEomTtRGTQg5KC+8TeT7jv/RU3ZNwVgKmq3xKgeDRlbtaCh
TZqRT0GbnMPVhsnxIcp1sbuv6pxsFoYqBAaakQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mg25oRFFlVaKPGbXX0/4x7yyN95L7YENdEewwR4tfR/TKHT80PdRcgL4+I/XYI376ThMnAZg80v9
LUrW8auPoc5dJq0RDIphu0XpUFS/hx+p4aemN2yGvJnzAZexYYNS2GjrZRn5ICUZJyCEwMfQ9ini
6kAH73Qm3TL2Ybts+8tDZg3AnLu39E1ED8PzXUghGPtPr3Xl0f/PCIdO+TR12A5E2/u1F/ROHTHz
2SOA9RzHFKSRq2YS6Fas2PVz9qF1TvSSlrW0MS8AwVATByHmSowP8qJLfe1y+Zm8lNnv4R0gSc8C
Yh7rP8X5lgcQXalmLGhYKJNDp+PQyR9KV8y4ug==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
B7Mtw6G+i1V5/aA7zapwc6HdEQ+y5LjXJvbKUH3WEPGhT7wXwZZCfSElIDICzNG68BXXOMDq9kZk
dEmnvAW1uAcoJ5MXPqBGQWIqHd0dLOHyoJ3w7xxpFWfspU1wKYDYfzGQnihihyAQ9NaBbL3/E1r9
exq6oftWsvcIUMNWNX8xVIUWK9mFjkDizZ6JF15u7kGBhlZM8YoPRLgvlW13cUUjq4OHHy+6sQjM
XUuoLVSNo3XEaY8WPN/sE2N3G6tynmzl/HzwB2pFZm1q6y/Co9sAiCPDKo9MCUyTRBuVdDuavNmV
hz4u+lHRycm1BzDIqlppQYWa7o1wBdJMp0QIEA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 5168)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
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
    reg GRESTORE_int;

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
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

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

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
