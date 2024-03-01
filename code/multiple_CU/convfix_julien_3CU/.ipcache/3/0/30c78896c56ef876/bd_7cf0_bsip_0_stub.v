// Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
// Date        : Wed Apr 14 09:50:02 2021
// Host        : localhost.localdomain running 64-bit Red Hat Enterprise Linux release 8.3 (Ootpa)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_7cf0_bsip_0_stub.v
// Design      : bd_7cf0_bsip_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bsip_v1_1_0_bsip,Vivado 2022.2.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(drck, reset, sel, shift, tdi, update, capture, runtest, 
  tck, tms, tap_tdo, tdo, tap_tdi, tap_tms, tap_tck)
/* synthesis syn_black_box black_box_pad_pin="drck,reset,sel,shift,tdi,update,capture,runtest,tck,tms,tap_tdo,tdo,tap_tdi,tap_tms,tap_tck" */;
  output drck;
  output reset;
  output sel;
  output shift;
  output tdi;
  output update;
  output capture;
  output runtest;
  output tck;
  output tms;
  output tap_tdo;
  input tdo;
  input tap_tdi;
  input tap_tms;
  input tap_tck;
endmodule
