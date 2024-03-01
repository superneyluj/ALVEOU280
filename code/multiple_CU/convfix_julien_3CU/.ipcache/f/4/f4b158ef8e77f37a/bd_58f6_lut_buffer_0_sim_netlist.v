// Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
// Date        : Wed Apr 14 09:49:37 2021
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
