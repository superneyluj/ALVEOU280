// Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
// Date        : Wed Oct  6 10:44:44 2021
// Host        : localhost.localdomain running 64-bit Red Hat Enterprise Linux release 8.3 (Ootpa)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_85ad_hbm_inst_0_stub.v
// Design      : bd_85ad_hbm_inst_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "hbm_v1_0_13,Vivado 2022.2.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(HBM_REF_CLK_0, AXI_00_ACLK, AXI_00_ARESET_N, 
  AXI_00_ARADDR, AXI_00_ARBURST, AXI_00_ARID, AXI_00_ARLEN, AXI_00_ARSIZE, AXI_00_ARVALID, 
  AXI_00_AWADDR, AXI_00_AWBURST, AXI_00_AWID, AXI_00_AWLEN, AXI_00_AWSIZE, AXI_00_AWVALID, 
  AXI_00_RREADY, AXI_00_BREADY, AXI_00_WDATA, AXI_00_WLAST, AXI_00_WSTRB, 
  AXI_00_WDATA_PARITY, AXI_00_WVALID, AXI_01_ACLK, AXI_01_ARESET_N, AXI_01_ARADDR, 
  AXI_01_ARBURST, AXI_01_ARID, AXI_01_ARLEN, AXI_01_ARSIZE, AXI_01_ARVALID, AXI_01_AWADDR, 
  AXI_01_AWBURST, AXI_01_AWID, AXI_01_AWLEN, AXI_01_AWSIZE, AXI_01_AWVALID, AXI_01_RREADY, 
  AXI_01_BREADY, AXI_01_WDATA, AXI_01_WLAST, AXI_01_WSTRB, AXI_01_WDATA_PARITY, 
  AXI_01_WVALID, AXI_02_ACLK, AXI_02_ARESET_N, AXI_02_ARADDR, AXI_02_ARBURST, AXI_02_ARID, 
  AXI_02_ARLEN, AXI_02_ARSIZE, AXI_02_ARVALID, AXI_02_AWADDR, AXI_02_AWBURST, AXI_02_AWID, 
  AXI_02_AWLEN, AXI_02_AWSIZE, AXI_02_AWVALID, AXI_02_RREADY, AXI_02_BREADY, AXI_02_WDATA, 
  AXI_02_WLAST, AXI_02_WSTRB, AXI_02_WDATA_PARITY, AXI_02_WVALID, AXI_03_ACLK, 
  AXI_03_ARESET_N, AXI_03_ARADDR, AXI_03_ARBURST, AXI_03_ARID, AXI_03_ARLEN, AXI_03_ARSIZE, 
  AXI_03_ARVALID, AXI_03_AWADDR, AXI_03_AWBURST, AXI_03_AWID, AXI_03_AWLEN, AXI_03_AWSIZE, 
  AXI_03_AWVALID, AXI_03_RREADY, AXI_03_BREADY, AXI_03_WDATA, AXI_03_WLAST, AXI_03_WSTRB, 
  AXI_03_WDATA_PARITY, AXI_03_WVALID, AXI_04_ACLK, AXI_04_ARESET_N, AXI_04_ARADDR, 
  AXI_04_ARBURST, AXI_04_ARID, AXI_04_ARLEN, AXI_04_ARSIZE, AXI_04_ARVALID, AXI_04_AWADDR, 
  AXI_04_AWBURST, AXI_04_AWID, AXI_04_AWLEN, AXI_04_AWSIZE, AXI_04_AWVALID, AXI_04_RREADY, 
  AXI_04_BREADY, AXI_04_WDATA, AXI_04_WLAST, AXI_04_WSTRB, AXI_04_WDATA_PARITY, 
  AXI_04_WVALID, APB_0_PWDATA, APB_0_PADDR, APB_0_PCLK, APB_0_PENABLE, APB_0_PRESET_N, 
  APB_0_PSEL, APB_0_PWRITE, AXI_00_ARREADY, AXI_00_AWREADY, AXI_00_RDATA_PARITY, 
  AXI_00_RDATA, AXI_00_RID, AXI_00_RLAST, AXI_00_RRESP, AXI_00_RVALID, AXI_00_WREADY, 
  AXI_00_BID, AXI_00_BRESP, AXI_00_BVALID, AXI_01_ARREADY, AXI_01_AWREADY, 
  AXI_01_RDATA_PARITY, AXI_01_RDATA, AXI_01_RID, AXI_01_RLAST, AXI_01_RRESP, AXI_01_RVALID, 
  AXI_01_WREADY, AXI_01_BID, AXI_01_BRESP, AXI_01_BVALID, AXI_02_ARREADY, AXI_02_AWREADY, 
  AXI_02_RDATA_PARITY, AXI_02_RDATA, AXI_02_RID, AXI_02_RLAST, AXI_02_RRESP, AXI_02_RVALID, 
  AXI_02_WREADY, AXI_02_BID, AXI_02_BRESP, AXI_02_BVALID, AXI_03_ARREADY, AXI_03_AWREADY, 
  AXI_03_RDATA_PARITY, AXI_03_RDATA, AXI_03_RID, AXI_03_RLAST, AXI_03_RRESP, AXI_03_RVALID, 
  AXI_03_WREADY, AXI_03_BID, AXI_03_BRESP, AXI_03_BVALID, AXI_04_ARREADY, AXI_04_AWREADY, 
  AXI_04_RDATA_PARITY, AXI_04_RDATA, AXI_04_RID, AXI_04_RLAST, AXI_04_RRESP, AXI_04_RVALID, 
  AXI_04_WREADY, AXI_04_BID, AXI_04_BRESP, AXI_04_BVALID, APB_0_PRDATA, APB_0_PREADY, 
  APB_0_PSLVERR, apb_complete_0, DRAM_0_STAT_CATTRIP, DRAM_0_STAT_TEMP)
/* synthesis syn_black_box black_box_pad_pin="HBM_REF_CLK_0,AXI_00_ACLK,AXI_00_ARESET_N,AXI_00_ARADDR[32:0],AXI_00_ARBURST[1:0],AXI_00_ARID[5:0],AXI_00_ARLEN[3:0],AXI_00_ARSIZE[2:0],AXI_00_ARVALID,AXI_00_AWADDR[32:0],AXI_00_AWBURST[1:0],AXI_00_AWID[5:0],AXI_00_AWLEN[3:0],AXI_00_AWSIZE[2:0],AXI_00_AWVALID,AXI_00_RREADY,AXI_00_BREADY,AXI_00_WDATA[255:0],AXI_00_WLAST,AXI_00_WSTRB[31:0],AXI_00_WDATA_PARITY[31:0],AXI_00_WVALID,AXI_01_ACLK,AXI_01_ARESET_N,AXI_01_ARADDR[32:0],AXI_01_ARBURST[1:0],AXI_01_ARID[5:0],AXI_01_ARLEN[3:0],AXI_01_ARSIZE[2:0],AXI_01_ARVALID,AXI_01_AWADDR[32:0],AXI_01_AWBURST[1:0],AXI_01_AWID[5:0],AXI_01_AWLEN[3:0],AXI_01_AWSIZE[2:0],AXI_01_AWVALID,AXI_01_RREADY,AXI_01_BREADY,AXI_01_WDATA[255:0],AXI_01_WLAST,AXI_01_WSTRB[31:0],AXI_01_WDATA_PARITY[31:0],AXI_01_WVALID,AXI_02_ACLK,AXI_02_ARESET_N,AXI_02_ARADDR[32:0],AXI_02_ARBURST[1:0],AXI_02_ARID[5:0],AXI_02_ARLEN[3:0],AXI_02_ARSIZE[2:0],AXI_02_ARVALID,AXI_02_AWADDR[32:0],AXI_02_AWBURST[1:0],AXI_02_AWID[5:0],AXI_02_AWLEN[3:0],AXI_02_AWSIZE[2:0],AXI_02_AWVALID,AXI_02_RREADY,AXI_02_BREADY,AXI_02_WDATA[255:0],AXI_02_WLAST,AXI_02_WSTRB[31:0],AXI_02_WDATA_PARITY[31:0],AXI_02_WVALID,AXI_03_ACLK,AXI_03_ARESET_N,AXI_03_ARADDR[32:0],AXI_03_ARBURST[1:0],AXI_03_ARID[5:0],AXI_03_ARLEN[3:0],AXI_03_ARSIZE[2:0],AXI_03_ARVALID,AXI_03_AWADDR[32:0],AXI_03_AWBURST[1:0],AXI_03_AWID[5:0],AXI_03_AWLEN[3:0],AXI_03_AWSIZE[2:0],AXI_03_AWVALID,AXI_03_RREADY,AXI_03_BREADY,AXI_03_WDATA[255:0],AXI_03_WLAST,AXI_03_WSTRB[31:0],AXI_03_WDATA_PARITY[31:0],AXI_03_WVALID,AXI_04_ACLK,AXI_04_ARESET_N,AXI_04_ARADDR[32:0],AXI_04_ARBURST[1:0],AXI_04_ARID[5:0],AXI_04_ARLEN[3:0],AXI_04_ARSIZE[2:0],AXI_04_ARVALID,AXI_04_AWADDR[32:0],AXI_04_AWBURST[1:0],AXI_04_AWID[5:0],AXI_04_AWLEN[3:0],AXI_04_AWSIZE[2:0],AXI_04_AWVALID,AXI_04_RREADY,AXI_04_BREADY,AXI_04_WDATA[255:0],AXI_04_WLAST,AXI_04_WSTRB[31:0],AXI_04_WDATA_PARITY[31:0],AXI_04_WVALID,APB_0_PWDATA[31:0],APB_0_PADDR[21:0],APB_0_PCLK,APB_0_PENABLE,APB_0_PRESET_N,APB_0_PSEL,APB_0_PWRITE,AXI_00_ARREADY,AXI_00_AWREADY,AXI_00_RDATA_PARITY[31:0],AXI_00_RDATA[255:0],AXI_00_RID[5:0],AXI_00_RLAST,AXI_00_RRESP[1:0],AXI_00_RVALID,AXI_00_WREADY,AXI_00_BID[5:0],AXI_00_BRESP[1:0],AXI_00_BVALID,AXI_01_ARREADY,AXI_01_AWREADY,AXI_01_RDATA_PARITY[31:0],AXI_01_RDATA[255:0],AXI_01_RID[5:0],AXI_01_RLAST,AXI_01_RRESP[1:0],AXI_01_RVALID,AXI_01_WREADY,AXI_01_BID[5:0],AXI_01_BRESP[1:0],AXI_01_BVALID,AXI_02_ARREADY,AXI_02_AWREADY,AXI_02_RDATA_PARITY[31:0],AXI_02_RDATA[255:0],AXI_02_RID[5:0],AXI_02_RLAST,AXI_02_RRESP[1:0],AXI_02_RVALID,AXI_02_WREADY,AXI_02_BID[5:0],AXI_02_BRESP[1:0],AXI_02_BVALID,AXI_03_ARREADY,AXI_03_AWREADY,AXI_03_RDATA_PARITY[31:0],AXI_03_RDATA[255:0],AXI_03_RID[5:0],AXI_03_RLAST,AXI_03_RRESP[1:0],AXI_03_RVALID,AXI_03_WREADY,AXI_03_BID[5:0],AXI_03_BRESP[1:0],AXI_03_BVALID,AXI_04_ARREADY,AXI_04_AWREADY,AXI_04_RDATA_PARITY[31:0],AXI_04_RDATA[255:0],AXI_04_RID[5:0],AXI_04_RLAST,AXI_04_RRESP[1:0],AXI_04_RVALID,AXI_04_WREADY,AXI_04_BID[5:0],AXI_04_BRESP[1:0],AXI_04_BVALID,APB_0_PRDATA[31:0],APB_0_PREADY,APB_0_PSLVERR,apb_complete_0,DRAM_0_STAT_CATTRIP,DRAM_0_STAT_TEMP[6:0]" */;
  input HBM_REF_CLK_0;
  input AXI_00_ACLK;
  input AXI_00_ARESET_N;
  input [32:0]AXI_00_ARADDR;
  input [1:0]AXI_00_ARBURST;
  input [5:0]AXI_00_ARID;
  input [3:0]AXI_00_ARLEN;
  input [2:0]AXI_00_ARSIZE;
  input AXI_00_ARVALID;
  input [32:0]AXI_00_AWADDR;
  input [1:0]AXI_00_AWBURST;
  input [5:0]AXI_00_AWID;
  input [3:0]AXI_00_AWLEN;
  input [2:0]AXI_00_AWSIZE;
  input AXI_00_AWVALID;
  input AXI_00_RREADY;
  input AXI_00_BREADY;
  input [255:0]AXI_00_WDATA;
  input AXI_00_WLAST;
  input [31:0]AXI_00_WSTRB;
  input [31:0]AXI_00_WDATA_PARITY;
  input AXI_00_WVALID;
  input AXI_01_ACLK;
  input AXI_01_ARESET_N;
  input [32:0]AXI_01_ARADDR;
  input [1:0]AXI_01_ARBURST;
  input [5:0]AXI_01_ARID;
  input [3:0]AXI_01_ARLEN;
  input [2:0]AXI_01_ARSIZE;
  input AXI_01_ARVALID;
  input [32:0]AXI_01_AWADDR;
  input [1:0]AXI_01_AWBURST;
  input [5:0]AXI_01_AWID;
  input [3:0]AXI_01_AWLEN;
  input [2:0]AXI_01_AWSIZE;
  input AXI_01_AWVALID;
  input AXI_01_RREADY;
  input AXI_01_BREADY;
  input [255:0]AXI_01_WDATA;
  input AXI_01_WLAST;
  input [31:0]AXI_01_WSTRB;
  input [31:0]AXI_01_WDATA_PARITY;
  input AXI_01_WVALID;
  input AXI_02_ACLK;
  input AXI_02_ARESET_N;
  input [32:0]AXI_02_ARADDR;
  input [1:0]AXI_02_ARBURST;
  input [5:0]AXI_02_ARID;
  input [3:0]AXI_02_ARLEN;
  input [2:0]AXI_02_ARSIZE;
  input AXI_02_ARVALID;
  input [32:0]AXI_02_AWADDR;
  input [1:0]AXI_02_AWBURST;
  input [5:0]AXI_02_AWID;
  input [3:0]AXI_02_AWLEN;
  input [2:0]AXI_02_AWSIZE;
  input AXI_02_AWVALID;
  input AXI_02_RREADY;
  input AXI_02_BREADY;
  input [255:0]AXI_02_WDATA;
  input AXI_02_WLAST;
  input [31:0]AXI_02_WSTRB;
  input [31:0]AXI_02_WDATA_PARITY;
  input AXI_02_WVALID;
  input AXI_03_ACLK;
  input AXI_03_ARESET_N;
  input [32:0]AXI_03_ARADDR;
  input [1:0]AXI_03_ARBURST;
  input [5:0]AXI_03_ARID;
  input [3:0]AXI_03_ARLEN;
  input [2:0]AXI_03_ARSIZE;
  input AXI_03_ARVALID;
  input [32:0]AXI_03_AWADDR;
  input [1:0]AXI_03_AWBURST;
  input [5:0]AXI_03_AWID;
  input [3:0]AXI_03_AWLEN;
  input [2:0]AXI_03_AWSIZE;
  input AXI_03_AWVALID;
  input AXI_03_RREADY;
  input AXI_03_BREADY;
  input [255:0]AXI_03_WDATA;
  input AXI_03_WLAST;
  input [31:0]AXI_03_WSTRB;
  input [31:0]AXI_03_WDATA_PARITY;
  input AXI_03_WVALID;
  input AXI_04_ACLK;
  input AXI_04_ARESET_N;
  input [32:0]AXI_04_ARADDR;
  input [1:0]AXI_04_ARBURST;
  input [5:0]AXI_04_ARID;
  input [3:0]AXI_04_ARLEN;
  input [2:0]AXI_04_ARSIZE;
  input AXI_04_ARVALID;
  input [32:0]AXI_04_AWADDR;
  input [1:0]AXI_04_AWBURST;
  input [5:0]AXI_04_AWID;
  input [3:0]AXI_04_AWLEN;
  input [2:0]AXI_04_AWSIZE;
  input AXI_04_AWVALID;
  input AXI_04_RREADY;
  input AXI_04_BREADY;
  input [255:0]AXI_04_WDATA;
  input AXI_04_WLAST;
  input [31:0]AXI_04_WSTRB;
  input [31:0]AXI_04_WDATA_PARITY;
  input AXI_04_WVALID;
  input [31:0]APB_0_PWDATA;
  input [21:0]APB_0_PADDR;
  input APB_0_PCLK;
  input APB_0_PENABLE;
  input APB_0_PRESET_N;
  input APB_0_PSEL;
  input APB_0_PWRITE;
  output AXI_00_ARREADY;
  output AXI_00_AWREADY;
  output [31:0]AXI_00_RDATA_PARITY;
  output [255:0]AXI_00_RDATA;
  output [5:0]AXI_00_RID;
  output AXI_00_RLAST;
  output [1:0]AXI_00_RRESP;
  output AXI_00_RVALID;
  output AXI_00_WREADY;
  output [5:0]AXI_00_BID;
  output [1:0]AXI_00_BRESP;
  output AXI_00_BVALID;
  output AXI_01_ARREADY;
  output AXI_01_AWREADY;
  output [31:0]AXI_01_RDATA_PARITY;
  output [255:0]AXI_01_RDATA;
  output [5:0]AXI_01_RID;
  output AXI_01_RLAST;
  output [1:0]AXI_01_RRESP;
  output AXI_01_RVALID;
  output AXI_01_WREADY;
  output [5:0]AXI_01_BID;
  output [1:0]AXI_01_BRESP;
  output AXI_01_BVALID;
  output AXI_02_ARREADY;
  output AXI_02_AWREADY;
  output [31:0]AXI_02_RDATA_PARITY;
  output [255:0]AXI_02_RDATA;
  output [5:0]AXI_02_RID;
  output AXI_02_RLAST;
  output [1:0]AXI_02_RRESP;
  output AXI_02_RVALID;
  output AXI_02_WREADY;
  output [5:0]AXI_02_BID;
  output [1:0]AXI_02_BRESP;
  output AXI_02_BVALID;
  output AXI_03_ARREADY;
  output AXI_03_AWREADY;
  output [31:0]AXI_03_RDATA_PARITY;
  output [255:0]AXI_03_RDATA;
  output [5:0]AXI_03_RID;
  output AXI_03_RLAST;
  output [1:0]AXI_03_RRESP;
  output AXI_03_RVALID;
  output AXI_03_WREADY;
  output [5:0]AXI_03_BID;
  output [1:0]AXI_03_BRESP;
  output AXI_03_BVALID;
  output AXI_04_ARREADY;
  output AXI_04_AWREADY;
  output [31:0]AXI_04_RDATA_PARITY;
  output [255:0]AXI_04_RDATA;
  output [5:0]AXI_04_RID;
  output AXI_04_RLAST;
  output [1:0]AXI_04_RRESP;
  output AXI_04_RVALID;
  output AXI_04_WREADY;
  output [5:0]AXI_04_BID;
  output [1:0]AXI_04_BRESP;
  output AXI_04_BVALID;
  output [31:0]APB_0_PRDATA;
  output APB_0_PREADY;
  output APB_0_PSLVERR;
  output apb_complete_0;
  output DRAM_0_STAT_CATTRIP;
  output [6:0]DRAM_0_STAT_TEMP;
endmodule
