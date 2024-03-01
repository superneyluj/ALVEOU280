-- Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
-- Date        : Wed Apr 14 09:47:13 2021
-- Host        : localhost.localdomain running 64-bit Red Hat Enterprise Linux release 8.3 (Ootpa)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_85ad_hbm_inst_0_stub.vhdl
-- Design      : bd_85ad_hbm_inst_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcu280-fsvh2892-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    HBM_REF_CLK_0 : in STD_LOGIC;
    AXI_00_ACLK : in STD_LOGIC;
    AXI_00_ARESET_N : in STD_LOGIC;
    AXI_00_ARADDR : in STD_LOGIC_VECTOR ( 32 downto 0 );
    AXI_00_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_00_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_00_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_00_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    AXI_00_ARVALID : in STD_LOGIC;
    AXI_00_AWADDR : in STD_LOGIC_VECTOR ( 32 downto 0 );
    AXI_00_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_00_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_00_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_00_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    AXI_00_AWVALID : in STD_LOGIC;
    AXI_00_RREADY : in STD_LOGIC;
    AXI_00_BREADY : in STD_LOGIC;
    AXI_00_WDATA : in STD_LOGIC_VECTOR ( 255 downto 0 );
    AXI_00_WLAST : in STD_LOGIC;
    AXI_00_WSTRB : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_00_WDATA_PARITY : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_00_WVALID : in STD_LOGIC;
    AXI_01_ACLK : in STD_LOGIC;
    AXI_01_ARESET_N : in STD_LOGIC;
    AXI_01_ARADDR : in STD_LOGIC_VECTOR ( 32 downto 0 );
    AXI_01_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_01_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_01_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_01_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    AXI_01_ARVALID : in STD_LOGIC;
    AXI_01_AWADDR : in STD_LOGIC_VECTOR ( 32 downto 0 );
    AXI_01_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_01_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_01_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_01_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    AXI_01_AWVALID : in STD_LOGIC;
    AXI_01_RREADY : in STD_LOGIC;
    AXI_01_BREADY : in STD_LOGIC;
    AXI_01_WDATA : in STD_LOGIC_VECTOR ( 255 downto 0 );
    AXI_01_WLAST : in STD_LOGIC;
    AXI_01_WSTRB : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_01_WDATA_PARITY : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_01_WVALID : in STD_LOGIC;
    AXI_02_ACLK : in STD_LOGIC;
    AXI_02_ARESET_N : in STD_LOGIC;
    AXI_02_ARADDR : in STD_LOGIC_VECTOR ( 32 downto 0 );
    AXI_02_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_02_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_02_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_02_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    AXI_02_ARVALID : in STD_LOGIC;
    AXI_02_AWADDR : in STD_LOGIC_VECTOR ( 32 downto 0 );
    AXI_02_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_02_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_02_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_02_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    AXI_02_AWVALID : in STD_LOGIC;
    AXI_02_RREADY : in STD_LOGIC;
    AXI_02_BREADY : in STD_LOGIC;
    AXI_02_WDATA : in STD_LOGIC_VECTOR ( 255 downto 0 );
    AXI_02_WLAST : in STD_LOGIC;
    AXI_02_WSTRB : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_02_WDATA_PARITY : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_02_WVALID : in STD_LOGIC;
    AXI_03_ACLK : in STD_LOGIC;
    AXI_03_ARESET_N : in STD_LOGIC;
    AXI_03_ARADDR : in STD_LOGIC_VECTOR ( 32 downto 0 );
    AXI_03_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_03_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_03_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_03_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    AXI_03_ARVALID : in STD_LOGIC;
    AXI_03_AWADDR : in STD_LOGIC_VECTOR ( 32 downto 0 );
    AXI_03_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_03_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_03_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_03_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    AXI_03_AWVALID : in STD_LOGIC;
    AXI_03_RREADY : in STD_LOGIC;
    AXI_03_BREADY : in STD_LOGIC;
    AXI_03_WDATA : in STD_LOGIC_VECTOR ( 255 downto 0 );
    AXI_03_WLAST : in STD_LOGIC;
    AXI_03_WSTRB : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_03_WDATA_PARITY : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_03_WVALID : in STD_LOGIC;
    AXI_04_ACLK : in STD_LOGIC;
    AXI_04_ARESET_N : in STD_LOGIC;
    AXI_04_ARADDR : in STD_LOGIC_VECTOR ( 32 downto 0 );
    AXI_04_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_04_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_04_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_04_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    AXI_04_ARVALID : in STD_LOGIC;
    AXI_04_AWADDR : in STD_LOGIC_VECTOR ( 32 downto 0 );
    AXI_04_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_04_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_04_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_04_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    AXI_04_AWVALID : in STD_LOGIC;
    AXI_04_RREADY : in STD_LOGIC;
    AXI_04_BREADY : in STD_LOGIC;
    AXI_04_WDATA : in STD_LOGIC_VECTOR ( 255 downto 0 );
    AXI_04_WLAST : in STD_LOGIC;
    AXI_04_WSTRB : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_04_WDATA_PARITY : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_04_WVALID : in STD_LOGIC;
    AXI_05_ACLK : in STD_LOGIC;
    AXI_05_ARESET_N : in STD_LOGIC;
    AXI_05_ARADDR : in STD_LOGIC_VECTOR ( 32 downto 0 );
    AXI_05_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_05_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_05_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_05_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    AXI_05_ARVALID : in STD_LOGIC;
    AXI_05_AWADDR : in STD_LOGIC_VECTOR ( 32 downto 0 );
    AXI_05_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_05_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_05_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_05_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    AXI_05_AWVALID : in STD_LOGIC;
    AXI_05_RREADY : in STD_LOGIC;
    AXI_05_BREADY : in STD_LOGIC;
    AXI_05_WDATA : in STD_LOGIC_VECTOR ( 255 downto 0 );
    AXI_05_WLAST : in STD_LOGIC;
    AXI_05_WSTRB : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_05_WDATA_PARITY : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_05_WVALID : in STD_LOGIC;
    AXI_06_ACLK : in STD_LOGIC;
    AXI_06_ARESET_N : in STD_LOGIC;
    AXI_06_ARADDR : in STD_LOGIC_VECTOR ( 32 downto 0 );
    AXI_06_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_06_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_06_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_06_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    AXI_06_ARVALID : in STD_LOGIC;
    AXI_06_AWADDR : in STD_LOGIC_VECTOR ( 32 downto 0 );
    AXI_06_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_06_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_06_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_06_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    AXI_06_AWVALID : in STD_LOGIC;
    AXI_06_RREADY : in STD_LOGIC;
    AXI_06_BREADY : in STD_LOGIC;
    AXI_06_WDATA : in STD_LOGIC_VECTOR ( 255 downto 0 );
    AXI_06_WLAST : in STD_LOGIC;
    AXI_06_WSTRB : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_06_WDATA_PARITY : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_06_WVALID : in STD_LOGIC;
    APB_0_PWDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    APB_0_PADDR : in STD_LOGIC_VECTOR ( 21 downto 0 );
    APB_0_PCLK : in STD_LOGIC;
    APB_0_PENABLE : in STD_LOGIC;
    APB_0_PRESET_N : in STD_LOGIC;
    APB_0_PSEL : in STD_LOGIC;
    APB_0_PWRITE : in STD_LOGIC;
    AXI_00_ARREADY : out STD_LOGIC;
    AXI_00_AWREADY : out STD_LOGIC;
    AXI_00_RDATA_PARITY : out STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_00_RDATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
    AXI_00_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_00_RLAST : out STD_LOGIC;
    AXI_00_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_00_RVALID : out STD_LOGIC;
    AXI_00_WREADY : out STD_LOGIC;
    AXI_00_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_00_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_00_BVALID : out STD_LOGIC;
    AXI_01_ARREADY : out STD_LOGIC;
    AXI_01_AWREADY : out STD_LOGIC;
    AXI_01_RDATA_PARITY : out STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_01_RDATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
    AXI_01_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_01_RLAST : out STD_LOGIC;
    AXI_01_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_01_RVALID : out STD_LOGIC;
    AXI_01_WREADY : out STD_LOGIC;
    AXI_01_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_01_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_01_BVALID : out STD_LOGIC;
    AXI_02_ARREADY : out STD_LOGIC;
    AXI_02_AWREADY : out STD_LOGIC;
    AXI_02_RDATA_PARITY : out STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_02_RDATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
    AXI_02_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_02_RLAST : out STD_LOGIC;
    AXI_02_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_02_RVALID : out STD_LOGIC;
    AXI_02_WREADY : out STD_LOGIC;
    AXI_02_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_02_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_02_BVALID : out STD_LOGIC;
    AXI_03_ARREADY : out STD_LOGIC;
    AXI_03_AWREADY : out STD_LOGIC;
    AXI_03_RDATA_PARITY : out STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_03_RDATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
    AXI_03_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_03_RLAST : out STD_LOGIC;
    AXI_03_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_03_RVALID : out STD_LOGIC;
    AXI_03_WREADY : out STD_LOGIC;
    AXI_03_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_03_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_03_BVALID : out STD_LOGIC;
    AXI_04_ARREADY : out STD_LOGIC;
    AXI_04_AWREADY : out STD_LOGIC;
    AXI_04_RDATA_PARITY : out STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_04_RDATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
    AXI_04_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_04_RLAST : out STD_LOGIC;
    AXI_04_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_04_RVALID : out STD_LOGIC;
    AXI_04_WREADY : out STD_LOGIC;
    AXI_04_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_04_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_04_BVALID : out STD_LOGIC;
    AXI_05_ARREADY : out STD_LOGIC;
    AXI_05_AWREADY : out STD_LOGIC;
    AXI_05_RDATA_PARITY : out STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_05_RDATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
    AXI_05_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_05_RLAST : out STD_LOGIC;
    AXI_05_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_05_RVALID : out STD_LOGIC;
    AXI_05_WREADY : out STD_LOGIC;
    AXI_05_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_05_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_05_BVALID : out STD_LOGIC;
    AXI_06_ARREADY : out STD_LOGIC;
    AXI_06_AWREADY : out STD_LOGIC;
    AXI_06_RDATA_PARITY : out STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_06_RDATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
    AXI_06_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_06_RLAST : out STD_LOGIC;
    AXI_06_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_06_RVALID : out STD_LOGIC;
    AXI_06_WREADY : out STD_LOGIC;
    AXI_06_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    AXI_06_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_06_BVALID : out STD_LOGIC;
    APB_0_PRDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    APB_0_PREADY : out STD_LOGIC;
    APB_0_PSLVERR : out STD_LOGIC;
    apb_complete_0 : out STD_LOGIC;
    DRAM_0_STAT_CATTRIP : out STD_LOGIC;
    DRAM_0_STAT_TEMP : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "HBM_REF_CLK_0,AXI_00_ACLK,AXI_00_ARESET_N,AXI_00_ARADDR[32:0],AXI_00_ARBURST[1:0],AXI_00_ARID[5:0],AXI_00_ARLEN[3:0],AXI_00_ARSIZE[2:0],AXI_00_ARVALID,AXI_00_AWADDR[32:0],AXI_00_AWBURST[1:0],AXI_00_AWID[5:0],AXI_00_AWLEN[3:0],AXI_00_AWSIZE[2:0],AXI_00_AWVALID,AXI_00_RREADY,AXI_00_BREADY,AXI_00_WDATA[255:0],AXI_00_WLAST,AXI_00_WSTRB[31:0],AXI_00_WDATA_PARITY[31:0],AXI_00_WVALID,AXI_01_ACLK,AXI_01_ARESET_N,AXI_01_ARADDR[32:0],AXI_01_ARBURST[1:0],AXI_01_ARID[5:0],AXI_01_ARLEN[3:0],AXI_01_ARSIZE[2:0],AXI_01_ARVALID,AXI_01_AWADDR[32:0],AXI_01_AWBURST[1:0],AXI_01_AWID[5:0],AXI_01_AWLEN[3:0],AXI_01_AWSIZE[2:0],AXI_01_AWVALID,AXI_01_RREADY,AXI_01_BREADY,AXI_01_WDATA[255:0],AXI_01_WLAST,AXI_01_WSTRB[31:0],AXI_01_WDATA_PARITY[31:0],AXI_01_WVALID,AXI_02_ACLK,AXI_02_ARESET_N,AXI_02_ARADDR[32:0],AXI_02_ARBURST[1:0],AXI_02_ARID[5:0],AXI_02_ARLEN[3:0],AXI_02_ARSIZE[2:0],AXI_02_ARVALID,AXI_02_AWADDR[32:0],AXI_02_AWBURST[1:0],AXI_02_AWID[5:0],AXI_02_AWLEN[3:0],AXI_02_AWSIZE[2:0],AXI_02_AWVALID,AXI_02_RREADY,AXI_02_BREADY,AXI_02_WDATA[255:0],AXI_02_WLAST,AXI_02_WSTRB[31:0],AXI_02_WDATA_PARITY[31:0],AXI_02_WVALID,AXI_03_ACLK,AXI_03_ARESET_N,AXI_03_ARADDR[32:0],AXI_03_ARBURST[1:0],AXI_03_ARID[5:0],AXI_03_ARLEN[3:0],AXI_03_ARSIZE[2:0],AXI_03_ARVALID,AXI_03_AWADDR[32:0],AXI_03_AWBURST[1:0],AXI_03_AWID[5:0],AXI_03_AWLEN[3:0],AXI_03_AWSIZE[2:0],AXI_03_AWVALID,AXI_03_RREADY,AXI_03_BREADY,AXI_03_WDATA[255:0],AXI_03_WLAST,AXI_03_WSTRB[31:0],AXI_03_WDATA_PARITY[31:0],AXI_03_WVALID,AXI_04_ACLK,AXI_04_ARESET_N,AXI_04_ARADDR[32:0],AXI_04_ARBURST[1:0],AXI_04_ARID[5:0],AXI_04_ARLEN[3:0],AXI_04_ARSIZE[2:0],AXI_04_ARVALID,AXI_04_AWADDR[32:0],AXI_04_AWBURST[1:0],AXI_04_AWID[5:0],AXI_04_AWLEN[3:0],AXI_04_AWSIZE[2:0],AXI_04_AWVALID,AXI_04_RREADY,AXI_04_BREADY,AXI_04_WDATA[255:0],AXI_04_WLAST,AXI_04_WSTRB[31:0],AXI_04_WDATA_PARITY[31:0],AXI_04_WVALID,AXI_05_ACLK,AXI_05_ARESET_N,AXI_05_ARADDR[32:0],AXI_05_ARBURST[1:0],AXI_05_ARID[5:0],AXI_05_ARLEN[3:0],AXI_05_ARSIZE[2:0],AXI_05_ARVALID,AXI_05_AWADDR[32:0],AXI_05_AWBURST[1:0],AXI_05_AWID[5:0],AXI_05_AWLEN[3:0],AXI_05_AWSIZE[2:0],AXI_05_AWVALID,AXI_05_RREADY,AXI_05_BREADY,AXI_05_WDATA[255:0],AXI_05_WLAST,AXI_05_WSTRB[31:0],AXI_05_WDATA_PARITY[31:0],AXI_05_WVALID,AXI_06_ACLK,AXI_06_ARESET_N,AXI_06_ARADDR[32:0],AXI_06_ARBURST[1:0],AXI_06_ARID[5:0],AXI_06_ARLEN[3:0],AXI_06_ARSIZE[2:0],AXI_06_ARVALID,AXI_06_AWADDR[32:0],AXI_06_AWBURST[1:0],AXI_06_AWID[5:0],AXI_06_AWLEN[3:0],AXI_06_AWSIZE[2:0],AXI_06_AWVALID,AXI_06_RREADY,AXI_06_BREADY,AXI_06_WDATA[255:0],AXI_06_WLAST,AXI_06_WSTRB[31:0],AXI_06_WDATA_PARITY[31:0],AXI_06_WVALID,APB_0_PWDATA[31:0],APB_0_PADDR[21:0],APB_0_PCLK,APB_0_PENABLE,APB_0_PRESET_N,APB_0_PSEL,APB_0_PWRITE,AXI_00_ARREADY,AXI_00_AWREADY,AXI_00_RDATA_PARITY[31:0],AXI_00_RDATA[255:0],AXI_00_RID[5:0],AXI_00_RLAST,AXI_00_RRESP[1:0],AXI_00_RVALID,AXI_00_WREADY,AXI_00_BID[5:0],AXI_00_BRESP[1:0],AXI_00_BVALID,AXI_01_ARREADY,AXI_01_AWREADY,AXI_01_RDATA_PARITY[31:0],AXI_01_RDATA[255:0],AXI_01_RID[5:0],AXI_01_RLAST,AXI_01_RRESP[1:0],AXI_01_RVALID,AXI_01_WREADY,AXI_01_BID[5:0],AXI_01_BRESP[1:0],AXI_01_BVALID,AXI_02_ARREADY,AXI_02_AWREADY,AXI_02_RDATA_PARITY[31:0],AXI_02_RDATA[255:0],AXI_02_RID[5:0],AXI_02_RLAST,AXI_02_RRESP[1:0],AXI_02_RVALID,AXI_02_WREADY,AXI_02_BID[5:0],AXI_02_BRESP[1:0],AXI_02_BVALID,AXI_03_ARREADY,AXI_03_AWREADY,AXI_03_RDATA_PARITY[31:0],AXI_03_RDATA[255:0],AXI_03_RID[5:0],AXI_03_RLAST,AXI_03_RRESP[1:0],AXI_03_RVALID,AXI_03_WREADY,AXI_03_BID[5:0],AXI_03_BRESP[1:0],AXI_03_BVALID,AXI_04_ARREADY,AXI_04_AWREADY,AXI_04_RDATA_PARITY[31:0],AXI_04_RDATA[255:0],AXI_04_RID[5:0],AXI_04_RLAST,AXI_04_RRESP[1:0],AXI_04_RVALID,AXI_04_WREADY,AXI_04_BID[5:0],AXI_04_BRESP[1:0],AXI_04_BVALID,AXI_05_ARREADY,AXI_05_AWREADY,AXI_05_RDATA_PARITY[31:0],AXI_05_RDATA[255:0],AXI_05_RID[5:0],AXI_05_RLAST,AXI_05_RRESP[1:0],AXI_05_RVALID,AXI_05_WREADY,AXI_05_BID[5:0],AXI_05_BRESP[1:0],AXI_05_BVALID,AXI_06_ARREADY,AXI_06_AWREADY,AXI_06_RDATA_PARITY[31:0],AXI_06_RDATA[255:0],AXI_06_RID[5:0],AXI_06_RLAST,AXI_06_RRESP[1:0],AXI_06_RVALID,AXI_06_WREADY,AXI_06_BID[5:0],AXI_06_BRESP[1:0],AXI_06_BVALID,APB_0_PRDATA[31:0],APB_0_PREADY,APB_0_PSLVERR,apb_complete_0,DRAM_0_STAT_CATTRIP,DRAM_0_STAT_TEMP[6:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "hbm_v1_0_13,Vivado 2022.2.2";
begin
end;
