-- Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
-- Date        : Wed Apr 14 09:51:17 2021
-- Host        : localhost.localdomain running 64-bit Red Hat Enterprise Linux release 8.3 (Ootpa)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ulp_dpa_hub_0_stub.vhdl
-- Design      : ulp_dpa_hub_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcu280-fsvh2892-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    mon_clk : in STD_LOGIC;
    mon_resetn : in STD_LOGIC;
    trace_clk : in STD_LOGIC;
    trace_resetn : in STD_LOGIC;
    trace_rst : out STD_LOGIC;
    out_valid : out STD_LOGIC;
    out_ready : in STD_LOGIC;
    out_data : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    trace0_counter : out STD_LOGIC_VECTOR ( 44 downto 0 );
    trace0_read : out STD_LOGIC;
    trace0_event : in STD_LOGIC;
    trace0_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    trace0_counter_overflow : out STD_LOGIC;
    trace0_valid : in STD_LOGIC;
    trace1_counter : out STD_LOGIC_VECTOR ( 44 downto 0 );
    trace1_read : out STD_LOGIC;
    trace1_event : in STD_LOGIC;
    trace1_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    trace1_counter_overflow : out STD_LOGIC;
    trace1_valid : in STD_LOGIC;
    trace2_counter : out STD_LOGIC_VECTOR ( 44 downto 0 );
    trace2_read : out STD_LOGIC;
    trace2_event : in STD_LOGIC;
    trace2_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    trace2_counter_overflow : out STD_LOGIC;
    trace2_valid : in STD_LOGIC;
    trace3_counter : out STD_LOGIC_VECTOR ( 44 downto 0 );
    trace3_read : out STD_LOGIC;
    trace3_event : in STD_LOGIC;
    trace3_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    trace3_counter_overflow : out STD_LOGIC;
    trace3_valid : in STD_LOGIC;
    trace4_counter : out STD_LOGIC_VECTOR ( 44 downto 0 );
    trace4_read : out STD_LOGIC;
    trace4_event : in STD_LOGIC;
    trace4_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    trace4_counter_overflow : out STD_LOGIC;
    trace4_valid : in STD_LOGIC;
    trace5_counter : out STD_LOGIC_VECTOR ( 44 downto 0 );
    trace5_read : out STD_LOGIC;
    trace5_event : in STD_LOGIC;
    trace5_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    trace5_counter_overflow : out STD_LOGIC;
    trace5_valid : in STD_LOGIC;
    trace6_counter : out STD_LOGIC_VECTOR ( 44 downto 0 );
    trace6_read : out STD_LOGIC;
    trace6_event : in STD_LOGIC;
    trace6_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    trace6_counter_overflow : out STD_LOGIC;
    trace6_valid : in STD_LOGIC;
    trace7_counter : out STD_LOGIC_VECTOR ( 44 downto 0 );
    trace7_read : out STD_LOGIC;
    trace7_event : in STD_LOGIC;
    trace7_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    trace7_counter_overflow : out STD_LOGIC;
    trace7_valid : in STD_LOGIC;
    trace8_counter : out STD_LOGIC_VECTOR ( 44 downto 0 );
    trace8_read : out STD_LOGIC;
    trace8_event : in STD_LOGIC;
    trace8_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    trace8_counter_overflow : out STD_LOGIC;
    trace8_valid : in STD_LOGIC;
    trace9_counter : out STD_LOGIC_VECTOR ( 44 downto 0 );
    trace9_read : out STD_LOGIC;
    trace9_event : in STD_LOGIC;
    trace9_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    trace9_counter_overflow : out STD_LOGIC;
    trace9_valid : in STD_LOGIC;
    trace10_counter : out STD_LOGIC_VECTOR ( 44 downto 0 );
    trace10_read : out STD_LOGIC;
    trace10_event : in STD_LOGIC;
    trace10_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    trace10_counter_overflow : out STD_LOGIC;
    trace10_valid : in STD_LOGIC;
    trace11_counter : out STD_LOGIC_VECTOR ( 44 downto 0 );
    trace11_read : out STD_LOGIC;
    trace11_event : in STD_LOGIC;
    trace11_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    trace11_counter_overflow : out STD_LOGIC;
    trace11_valid : in STD_LOGIC;
    trace12_counter : out STD_LOGIC_VECTOR ( 44 downto 0 );
    trace12_read : out STD_LOGIC;
    trace12_event : in STD_LOGIC;
    trace12_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    trace12_counter_overflow : out STD_LOGIC;
    trace12_valid : in STD_LOGIC;
    trace13_counter : out STD_LOGIC_VECTOR ( 44 downto 0 );
    trace13_read : out STD_LOGIC;
    trace13_event : in STD_LOGIC;
    trace13_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    trace13_counter_overflow : out STD_LOGIC;
    trace13_valid : in STD_LOGIC;
    trace14_counter : out STD_LOGIC_VECTOR ( 44 downto 0 );
    trace14_read : out STD_LOGIC;
    trace14_event : in STD_LOGIC;
    trace14_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    trace14_counter_overflow : out STD_LOGIC;
    trace14_valid : in STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "mon_clk,mon_resetn,trace_clk,trace_resetn,trace_rst,out_valid,out_ready,out_data[63:0],s_axi_awaddr[3:0],s_axi_awprot[2:0],s_axi_awvalid,s_axi_awready,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_wvalid,s_axi_wready,s_axi_bvalid,s_axi_bready,s_axi_bresp[1:0],s_axi_araddr[3:0],s_axi_arprot[2:0],s_axi_arvalid,s_axi_arready,s_axi_rdata[31:0],s_axi_rresp[1:0],s_axi_rvalid,s_axi_rready,trace0_counter[44:0],trace0_read,trace0_event,trace0_data[63:0],trace0_counter_overflow,trace0_valid,trace1_counter[44:0],trace1_read,trace1_event,trace1_data[63:0],trace1_counter_overflow,trace1_valid,trace2_counter[44:0],trace2_read,trace2_event,trace2_data[63:0],trace2_counter_overflow,trace2_valid,trace3_counter[44:0],trace3_read,trace3_event,trace3_data[63:0],trace3_counter_overflow,trace3_valid,trace4_counter[44:0],trace4_read,trace4_event,trace4_data[63:0],trace4_counter_overflow,trace4_valid,trace5_counter[44:0],trace5_read,trace5_event,trace5_data[63:0],trace5_counter_overflow,trace5_valid,trace6_counter[44:0],trace6_read,trace6_event,trace6_data[63:0],trace6_counter_overflow,trace6_valid,trace7_counter[44:0],trace7_read,trace7_event,trace7_data[63:0],trace7_counter_overflow,trace7_valid,trace8_counter[44:0],trace8_read,trace8_event,trace8_data[63:0],trace8_counter_overflow,trace8_valid,trace9_counter[44:0],trace9_read,trace9_event,trace9_data[63:0],trace9_counter_overflow,trace9_valid,trace10_counter[44:0],trace10_read,trace10_event,trace10_data[63:0],trace10_counter_overflow,trace10_valid,trace11_counter[44:0],trace11_read,trace11_event,trace11_data[63:0],trace11_counter_overflow,trace11_valid,trace12_counter[44:0],trace12_read,trace12_event,trace12_data[63:0],trace12_counter_overflow,trace12_valid,trace13_counter[44:0],trace13_read,trace13_event,trace13_data[63:0],trace13_counter_overflow,trace13_valid,trace14_counter[44:0],trace14_read,trace14_event,trace14_data[63:0],trace14_counter_overflow,trace14_valid";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "trace_integrator,Vivado 2022.2.2";
begin
end;
