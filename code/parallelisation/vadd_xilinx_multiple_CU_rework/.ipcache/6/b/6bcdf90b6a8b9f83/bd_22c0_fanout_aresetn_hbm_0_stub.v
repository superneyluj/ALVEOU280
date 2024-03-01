// Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
// Date        : Wed Oct  6 10:37:32 2021
// Host        : localhost.localdomain running 64-bit Red Hat Enterprise Linux release 8.3 (Ootpa)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_22c0_fanout_aresetn_hbm_0_stub.v
// Design      : bd_22c0_fanout_aresetn_hbm_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "pipeline_reg_v1_0_0,Vivado 2022.2.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(d, q, clk, resetn)
/* synthesis syn_black_box black_box_pad_pin="d[0:0],q[0:0],clk,resetn" */;
  input [0:0]d;
  output [0:0]q;
  input clk;
  input resetn;
endmodule
