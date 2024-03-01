// Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
// Date        : Wed Oct  6 10:43:25 2021
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
K7PflkXrSgRnNj/7PsN8Sj5kR9hvxQhETdOK/rZwKTQucQM4K59DnUyW7N806B/jM64GoUlU1/tO
8TzORTCk8tVd3neCsWLqEMK4MGHP5o92S3CRqlf4ARXtcwuCWy2BitoURsCbLUmicRKefQDjoqJp
YbcoMAi0VneTxYrgbp5KaAfdnZE41JzwHXCx7nVqD2Q7JkaWDuIHltI/lAc/COIFls56XLs3sWuo
EwL880xdzYfGphRSOw/ug+TKWYM3Cjk4+ypioJU4k3pT6KESpuiEnwWGXIG7NbiNiM7trsZAfmKm
4lIl46RrAkorsn6ELVSG+FpsLTpuB7LDs9fmpg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
K+5UPpG++1WKsEmFMcgYTPki6uwH+0VOm60mYgCfF3YQzRcGlpzK8IPu3H9838/RLNv4rHQ2V+ek
MeGIJJa4U6j8EegaAHDr8NPUh+hBq0rCGd+wk+Ixs8wyJMYJWqjzWobZ+tjuehMykj4zZL4VDgno
VOEkNc/45b+Rlh1NEWtKoxSbK3micYJwLyPVmuOLfZP/Km+H63hgqxVFOdwfFITMtTmCmY22lGSP
pwL2c+AEeTrRYFDjS2XkMSyXiiAP69GASIvsZnx35o48C+FbXGIPEcHIhvpyinbwIrchBTVYjRlo
kylBpODrsWqwQfa8vca/b3kN1wv4dOAfRA8NMA==

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
