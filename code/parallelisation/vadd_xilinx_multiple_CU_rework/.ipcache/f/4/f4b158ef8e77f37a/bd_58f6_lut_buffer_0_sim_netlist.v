// Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
// Date        : Wed Oct  6 10:39:54 2021
// Host        : localhost.localdomain running 64-bit Red Hat Enterprise Linux release 8.3 (Ootpa)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_58f6_lut_buffer_0_sim_netlist.v
// Design      : bd_58f6_lut_buffer_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_58f6_lut_buffer_0,lut_buffer_v2_0_0_lut_buffer,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "lut_buffer_v2_0_0_lut_buffer,Vivado 2022.2.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (tdi_i,
    tms_i,
    tck_i,
    drck_i,
    sel_i,
    shift_i,
    update_i,
    capture_i,
    runtest_i,
    reset_i,
    bscanid_en_i,
    tdo_o,
    tdi_o,
    tms_o,
    tck_o,
    drck_o,
    sel_o,
    shift_o,
    update_o,
    capture_o,
    runtest_o,
    reset_o,
    bscanid_en_o,
    tdo_i);
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TDI" *) input tdi_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TMS" *) input tms_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TCK" *) input tck_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan DRCK" *) input drck_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan SEL" *) input sel_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan SHIFT" *) input shift_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan UPDATE" *) input update_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan CAPTURE" *) input capture_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan RUNTEST" *) input runtest_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan RESET" *) input reset_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan BSCANID_EN" *) input bscanid_en_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TDO" *) output tdo_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TDI" *) output tdi_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TMS" *) output tms_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TCK" *) output tck_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan DRCK" *) output drck_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan SEL" *) output sel_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan SHIFT" *) output shift_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan UPDATE" *) output update_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan CAPTURE" *) output capture_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan RUNTEST" *) output runtest_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan RESET" *) output reset_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan BSCANID_EN" *) output bscanid_en_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TDO" *) input tdo_i;

  wire bscanid_en_i;
  wire bscanid_en_o;
  wire capture_i;
  wire capture_o;
  wire drck_i;
  wire drck_o;
  wire reset_i;
  wire reset_o;
  wire runtest_i;
  wire runtest_o;
  wire sel_i;
  wire sel_o;
  wire shift_i;
  wire shift_o;
  wire tck_i;
  wire tck_o;
  wire tdi_i;
  wire tdi_o;
  wire tdo_i;
  wire tdo_o;
  wire tms_i;
  wire tms_o;
  wire update_i;
  wire update_o;
  wire [31:0]NLW_inst_bscanid_o_UNCONNECTED;

  (* C_EN_BSCANID_VEC = "0" *) 
  (* DONT_TOUCH *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lut_buffer_v2_0_0_lut_buffer inst
       (.bscanid_en_i(bscanid_en_i),
        .bscanid_en_o(bscanid_en_o),
        .bscanid_i({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .bscanid_o(NLW_inst_bscanid_o_UNCONNECTED[31:0]),
        .capture_i(capture_i),
        .capture_o(capture_o),
        .drck_i(drck_i),
        .drck_o(drck_o),
        .reset_i(reset_i),
        .reset_o(reset_o),
        .runtest_i(runtest_i),
        .runtest_o(runtest_o),
        .sel_i(sel_i),
        .sel_o(sel_o),
        .shift_i(shift_i),
        .shift_o(shift_o),
        .tck_i(tck_i),
        .tck_o(tck_o),
        .tdi_i(tdi_i),
        .tdi_o(tdi_o),
        .tdo_i(tdo_i),
        .tdo_o(tdo_o),
        .tms_i(tms_i),
        .tms_o(tms_o),
        .update_i(update_i),
        .update_o(update_o));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
cRs2djBuGFv5c2u7TW0s4pKPVMlnFXHreojHoG4kjOAPaBD3DQ+/POkj62XFaU9TpSC+sBLuzm5D
CvV38s0HYvQ6r9T9UBkDpWAaYsTZ3K8iIDusEy3Q3ndukTF4KxkIjdm/WDObdySqE4eyE3ENrt3r
TTU/3dyqOHifVTd689E=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ok3mPInDtNuLBEpoavg2sNuCWhfkqR0G/NCENbbdiY6+3rRJh1QrqP0wqM5PxyHVNpejHlG13BuW
NfCtWTRToR9/HLebE3MWoasbdqm9wyt/jvVbqhoxu4Yig0QI++yMR6KHt3yfyS/Bjaaa1hTEh/Dp
cV9m+8zg1ZOBCx9GIA3ameTfqqZ64e5Qqp2WnGHddb9Ir3SZUsPDqL9l/V6oanV5BEKZ9OGkTi6T
XzdIoh7/YrQCv9WMBxEumjSteM1w5WOKh6oySTK++0E9KPnvhXLJJl2acAHZkTLrsU/+ijSKUS+x
GowObKrO8AdOCBPkPwFYE/tw38EdHSIqjTWiVg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
FAAPW7HWHSVbq7jL5mPra3N6hkxy7jrReqFBlD4Ltv4oMo4s2ff8mILPOHJ8kEhs4w9iB2bw2otg
05vSEBETrK+qElIqmMYY3ErabJTGX2G15tuCNgRSHLD+arRp2jPrZpO+D2NotvmJXfKR1KOLCgNZ
d3zkf9Db8eMhgUiSnYE=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DNX71AB7JqFRG/szbD0s0QojVKmJaWIPSLFQGU8ZkuuMQ1N+wa02JQIN8vWJJgesV4cI733w7qdG
CbCA8h08Kq0BkJB288AS+tsFoBGujMStusdYt2Lm/HygBXmBZSXaDPmJjsHnMFm2zhRZlVdZxQDv
Ngi0pxfrg0jzHGoR7QpQETwYjoFdD/41WfFjNS028o1i+vjifDm3cRN48emYSTa6WUb7buYlW7/7
G88GwEuDVkQAKEhfYR/Qd9iJgXIM4Yhm2JawMEXT7w5u+4QgkoVbuvepdBEzma43uUjRuqOmM9Ue
LGOud6cCOe4h73bo15EZQINkK9Bqt0Gzyh+gGw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
5JIlOcf7Nv2S7vGZjJUlDtxYPJEntEmRLQV2EpB2sd7l+21deA7gARAIS0boLwVEMC/E4LUcjFW5
obzKWklwL+g/RJIlHQYSwbAAS28rh9Rv/0OhN9x+QHvwuMlZ/tHUB9+vt5hSpQHKl2tg7loIRulM
xGiAk8lu5UClGShnfMtQ1p+NLGlTTd0kRF3449obmbOaANW83Ypdi/tNQ1Wqv1ncLPtQSN8XSNgv
LLqf0f+TNWfHbw0deZzoW6cHh5dLCFT3Js0SxG4pb0wxRliqb27rw/8nQb72r58zcAT29uzGSzne
9lkCqfy2UARCWNoE1TIQyBSpXg1ELUg/UtAvFQ==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPqqsreBP4iDid/e01HKd74eD5B/yzyDg6KStG3DGiRAcf5A+jg9SQz4J5FZ6S0vjOq+syFCmGY5
erugG/zWRfVez6LGH4eiyusUk+BVF5mkWeX2RxiEuHQYXc+qFpULvNwBS710RAEk8/tUTAfpGUf3
gCFNSv98AX7Z1DC6O60gAJBAcfjXSkOUOTGfXiADgmpp+cqQ46oPHV/LfqCNZYNXNgziK8P0/TU+
tsSLbrdk+GHg2W642OcjthHKGktmlxbhdbedNCeLbqyWHtjqTFXxZGsitTNebRztIgTFpwELSjgJ
OguJTxMlhWiRqgJjjoc1u7/8Auffi6YeXETyLg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cvw9Wo1sNwLBNV0K4sVxLrbhoXTwC5uzu3n0R0uR2xzT6I4V14nmbD9GZcozapn97cX/q+mDAQ5y
S7mHo0Q3Gc/gBIdwmsmPeKTly3ovUxJhSReiRrn5e9YwPrQsVKjWODy9aM7eJLRGOYsyxse9aNJz
s7uO+mxonb9B1n2T+mA8lvuQQ/dxBHJZcWnpdr/xUys7M2nq+3/TOq+0gpIry4rwfnbhoMU8tSEa
AIDk7lJWpdb2GN0Avsu7xG661sMY/DCwwcrRi+vlBXCkV+aGj34qUxpIgJ+1fk+xFBGFtxZDNhdk
yZAHfSfQjA/LSzWnh0E+NvPdo0pyK4Hd6oGPcA==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
H+BgkNp7pniCwsWPF1nsr9Q9SF9OUa4xiutWUx//YlhzTnzhQDHmeX1pQMmMMGO79lOGj7zLbjGF
7UoqKxRaDAzMIbcZ/uKNE18b3Dk6BgqrU0XJvzAXz+OvbibolB7sS00n5RZuLXQmmqIXdC12799w
nbF6/C3/ijssB9O594F0dil3dRgIlkKBapQgMvg/Cf9cnOhZF8PP6H+vB/uW+ly47Br3Ai02UeW7
JXlDQXTPyI67Z54M/84/3+x6NyG+n6J1iMWP8rZE9VevFV2q8lEwrRhNvStKZKRfSrzohKA9dgB3
CTpzAeGWjdGtVMsbQA3gMvQEh4uUeWQVzK2kMD3mEFHQsmajRwttCmfA1xyTKyNPajfw6FN7jTEr
KFt7/akN/jrppt2jy3nN6vC6nsdWl66YQG0TOCpF3khNWJdMc1WCuUFPlZuwf8pFBk7nytLsEAkt
P4fsK5QhcTnuxuAX4YewZdHIvoO1Are61/l3JwFPk0Ul+sZ21h350SGL

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
eBzrrcm7wbmhxtD0A2F2TIoltE/JNUSpWP/KZQktEQHbMRrQxsHNO95a/vBFvCrAaRcdXBbooze1
8w4X3rmFL2A0ZZmQjPv5YsakDqZI7JlYbg5HtPJj3iQGEeEcc2e+cAOk0Ng2uX3VECM0p/Z4Lvhn
08fBFmcvzxoWvUBzytXhYR/t18WHFvX/te4qbN66xYgr5ujH0eBrrUb3+rgjWUaW7X2PHk11CRLZ
iGzhcQgBZTinneE9VOdJ/laAZUZ21dMX1DHlLC++zawVPHMsbTsgsrpcv9HTfInAJyli9f0uSkAJ
gitw9LL/w5z9gArsjYRXx8yuEfeZ6YXiRERgog==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2960)
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
