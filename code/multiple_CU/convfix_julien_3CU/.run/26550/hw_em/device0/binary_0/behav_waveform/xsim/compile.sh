#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2022.2.2 (64-bit)
#
# Filename    : compile.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for compiling the simulation design source files
#
# Generated by Vivado on Thu May 13 10:03:08 EDT 2021
# SW Build 3788238 on Tue Feb 21 19:59:23 MST 2023
#
# IP Build 3783773 on Tue Feb 21 23:41:56 MST 2023
#
# usage: compile.sh
#
# ****************************************************************************
set -Eeuo pipefail

xv_cxl_lib_path="/home/fpga/tools/Vivado/2022.2/data/xsim"
xv_cpt_lib_path="/home/fpga/tools/Vivado/2022.2/data/simmodels/xsim/2022.2/lnx64/6.2.0/systemc/protected"
xv_ext_lib_path="/home/fpga/tools/Vivado/2022.2/data/simmodels/xsim/2022.2/lnx64/6.2.0/ext"
xv_boost_lib_path="/home/fpga/tools/Vivado/2022.2/tps/boost_1_72_0"

# compile systemC design sources
echo "xsc -c --gcc_compile_options "-DBOOST_SYSTEM_NO_DEPRECATED" --gcc_compile_options "-I/home/fpga/tools/Vitis_HLS/2022.2/include" --cppversion 14 --gcc_compile_options "-I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_smartconn_data_0_0/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_smartconn_data_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_4/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_4/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_5/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_5/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_6/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_6/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_7/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_7/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_8/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_8/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_9/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_9/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_10/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_10/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_11/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_11/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_12/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_12/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_13/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_13/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_36/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_36/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_14/sim_tlm/top -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_14/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_16/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_16/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_17/sim_tlm/top -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_17/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_19/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_19/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_23/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_23/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_25/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_25/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_27/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_27/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_29/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_29/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_31/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_31/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_33/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_33/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_35/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_35/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_0/sysc/include -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_5/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_5/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_8/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_8/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_11/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_11/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_14/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_14/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_17/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_17/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_20/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_20/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_23/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_23/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_3/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_3/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_4/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_4/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_6/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_6/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_7/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_7/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_9/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_9/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_10/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_10/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_12/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_12/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_13/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_13/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_15/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_15/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_16/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_16/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_18/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_18/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_19/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_19/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_21/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_21/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_22/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_22/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_profile_vip_0_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_profile_vip_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_irq_const_tieoff_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_hub_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_hub_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon0_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon0_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon1_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon1_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon2_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon2_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon3_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon3_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon4_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon4_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon5_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon5_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon6_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon6_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon7_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon7_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon8_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon8_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_xbar_3/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_xbar_3/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_xbar_4/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_xbar_4/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m01_regslice_4/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m01_regslice_4/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m02_regslice_4/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m02_regslice_4/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m03_regslice_4/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m03_regslice_4/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_1/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_1/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m04_regslice_4/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m04_regslice_4/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_2/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_2/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_s00_regslice_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_s00_regslice_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m00_regslice_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m00_regslice_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_3/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_3/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m01_regslice_5/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m01_regslice_5/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_4/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_4/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m02_regslice_5/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m02_regslice_5/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_5/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_5/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m03_regslice_5/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m03_regslice_5/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_6/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_6/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m04_regslice_5/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m04_regslice_5/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_7/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_7/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m05_regslice_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m05_regslice_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_8/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_8/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m06_regslice_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m06_regslice_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_9/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_9/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m07_regslice_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m07_regslice_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_10/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_10/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m08_regslice_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m08_regslice_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_11/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_11/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m09_regslice_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m09_regslice_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_12/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_12/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m10_regslice_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m10_regslice_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_13/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_13/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_embedded_schedular_0/sysc -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_embedded_schedular_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_smartconnect_0_0/xtlm -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_smartconnect_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_vip_0_0/sysc -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_vip_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_sim_address_0_0/sysc -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_sim_address_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_sim_qdma_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_xbar_0/src -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_xbar_0/sim -I$xv_boost_lib_path -I$xv_ext_lib_path/protobuf/include -I$xv_cxl_lib_path/ip/sim_qdma_cpp_v1_0/include -I$xv_cxl_lib_path/ip/xscl/include -I$xv_cxl_lib_path/ip/xtlm_ipc_v1_0/include -I$xv_cxl_lib_path/ip/sim_qdma_sc_v1_0/include -I$xv_cxl_lib_path/ip/xtlm_simple_interconnect_v1_0/include -I$xv_cxl_lib_path/ip/xtlm_ap_ctrl_v1_0/include -I$xv_cxl_lib_path/ip/sim_ddr_v1_0/include -I$xv_cxl_lib_path/ip/common_cpp_v1_0/include -I$xv_cxl_lib_path/ip/common_rpc_v1/include -I$xv_cxl_lib_path/ip/xtlm/include -I$xv_cxl_lib_path/ip/emu_perf_common_v1_0/include" -work xil_defaultlib -f pfm_top_wrapper_xsc.prj"
xsc -c --gcc_compile_options "-DBOOST_SYSTEM_NO_DEPRECATED" --gcc_compile_options "-I/home/fpga/tools/Vitis_HLS/2022.2/include" --cppversion 14 --gcc_compile_options "-I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_smartconn_data_0_0/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_smartconn_data_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_4/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_4/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_5/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_5/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_6/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_6/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_7/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_7/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_8/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_8/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_9/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_9/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_10/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_10/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_11/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_11/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_12/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_12/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_13/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_13/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_36/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_36/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_14/sim_tlm/top -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_14/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_16/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_16/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_17/sim_tlm/top -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_17/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_19/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_19/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_23/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_23/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_25/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_25/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_27/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_27/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_29/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_29/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_31/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_31/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_33/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_33/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_35/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/ip/ip_35/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_memory_subsystem_0/bd_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_0/sysc/include -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_5/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_5/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_8/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_8/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_11/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_11/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_14/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_14/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_17/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_17/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_20/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_20/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_23/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_23/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_3/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_3/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_4/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_4/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_6/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_6/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_7/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_7/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_9/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_9/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_10/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_10/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_12/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_12/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_13/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_13/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_15/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_15/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_16/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_16/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_18/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_18/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_19/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_19/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_21/xtlm -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_21/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_22/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/ip/ip_22/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_hmss_0_0/bd_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_profile_vip_0_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_profile_vip_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_irq_const_tieoff_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_hub_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_hub_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon0_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon0_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon1_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon1_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon2_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon2_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon3_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon3_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon4_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon4_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon5_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon5_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon6_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon6_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon7_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon7_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon8_0/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_dpa_mon8_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_xbar_3/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_xbar_3/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_xbar_4/src -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_xbar_4/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m01_regslice_4/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m01_regslice_4/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m02_regslice_4/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m02_regslice_4/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m03_regslice_4/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m03_regslice_4/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_1/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_1/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m04_regslice_4/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m04_regslice_4/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_2/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_2/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_s00_regslice_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_s00_regslice_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m00_regslice_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m00_regslice_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_3/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_3/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m01_regslice_5/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m01_regslice_5/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_4/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_4/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m02_regslice_5/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m02_regslice_5/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_5/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_5/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m03_regslice_5/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m03_regslice_5/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_6/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_6/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m04_regslice_5/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m04_regslice_5/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_7/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_7/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m05_regslice_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m05_regslice_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_8/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_8/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m06_regslice_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m06_regslice_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_9/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_9/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m07_regslice_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m07_regslice_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_10/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_10/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m08_regslice_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m08_regslice_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_11/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_11/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m09_regslice_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m09_regslice_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_12/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_12/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m10_regslice_0/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_m10_regslice_0/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_13/sysc -I../../../../prj.ip_user_files/bd/pfm_dynamic/ip/pfm_dynamic_auto_cc_13/sim -I../../../../prj.ip_user_files/bd/pfm_dynamic/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_embedded_schedular_0/sysc -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_embedded_schedular_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_smartconnect_0_0/xtlm -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_smartconnect_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_vip_0_0/sysc -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_axi_vip_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_sim_address_0_0/sysc -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_sim_address_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_sim_qdma_0_0/sim -I../../../../prj.ip_user_files/bd/pfm_top/sim -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_xbar_0/src -I../../../../prj.ip_user_files/bd/pfm_top/ip/pfm_top_xbar_0/sim -I$xv_boost_lib_path -I$xv_ext_lib_path/protobuf/include -I$xv_cxl_lib_path/ip/sim_qdma_cpp_v1_0/include -I$xv_cxl_lib_path/ip/xscl/include -I$xv_cxl_lib_path/ip/xtlm_ipc_v1_0/include -I$xv_cxl_lib_path/ip/sim_qdma_sc_v1_0/include -I$xv_cxl_lib_path/ip/xtlm_simple_interconnect_v1_0/include -I$xv_cxl_lib_path/ip/xtlm_ap_ctrl_v1_0/include -I$xv_cxl_lib_path/ip/sim_ddr_v1_0/include -I$xv_cxl_lib_path/ip/common_cpp_v1_0/include -I$xv_cxl_lib_path/ip/common_rpc_v1/include -I$xv_cxl_lib_path/ip/xtlm/include -I$xv_cxl_lib_path/ip/emu_perf_common_v1_0/include" -work xil_defaultlib -f pfm_top_wrapper_xsc.prj 2>&1 | tee -a compile.log &
XSC_SYSC_PID=$!

# compile Verilog/System Verilog design sources
echo "xvlog --incr --relax -L uvm -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L hbm_v1_0_13 -L xilinx_vip -prj pfm_top_wrapper_vlog.prj"
xvlog --incr --relax -L uvm -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L hbm_v1_0_13 -L xilinx_vip -prj pfm_top_wrapper_vlog.prj 2>&1 | tee compile.log

# compile VHDL design sources
echo "xvhdl --incr --relax -prj pfm_top_wrapper_vhdl.prj"
xvhdl --incr --relax -prj pfm_top_wrapper_vhdl.prj 2>&1 | tee -a compile.log

echo "Waiting for jobs to finish..."
wait $XSC_SYSC_PID
echo "No pending jobs, compilation finished."
