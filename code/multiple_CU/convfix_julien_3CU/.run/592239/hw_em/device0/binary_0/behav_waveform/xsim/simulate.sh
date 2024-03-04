#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2021.2 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Fri Feb 12 09:45:49 EST 2021
# SW Build 3367213 on Tue Oct 19 02:47:39 MDT 2021
#
# IP Build 3369179 on Thu Oct 21 08:25:16 MDT 2021
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail

export xv_cxl_lib_path="/home/Xilinx/Vivado/2021.2/data/xsim"
export xv_cxl_ip_path="$xv_cxl_lib_path/ip"
export xv_cpt_lib_path="/home/Xilinx/Vivado/2021.2/data/simmodels/xsim/2021.2/lnx64/6.2.0/systemc/protected"
xv_ext_lib_path="/home/Xilinx/Vivado/2021.2/data/simmodels/xsim/2021.2/lnx64/6.2.0/ext"
xv_lib_path="/home/Xilinx/Vivado/2021.2/lib/lnx64.o/Default:/home/Xilinx/Vivado/2021.2/lib/lnx64.o"

xv_ref_path=${VIVADO_LOC:-"/home/Xilinx/Vivado/2021.2"}
xv_lib_path="$xv_ref_path/lib/lnx64.o/Default:$xv_ref_path/lib/lnx64.o"

export LD_LIBRARY_PATH=$PWD:$xv_lib_path:$xv_ref_path/data/simmodels/xsim/2021.2/lnx64/6.2.0/ext/protobuf:$xv_ref_path/data/xsim/ip/xtlm:$xv_ref_path/data/xsim/ip/xtlm_simple_interconnect_v1_0:$xv_ref_path/data/xsim/ip/common_cpp_v1_0:$xv_ref_path/data/xsim/ip/emu_perf_common_v1_0:$LD_LIBRARY_PATH

# simulate design
echo "xsim emu_wrapper_behav -key {Behavioral:sim_1:Functional:emu_wrapper} -tclbatch emu_wrapper.tcl -protoinst "protoinst_files/bd_3a93.protoinst" -protoinst "protoinst_files/bd_9678.protoinst" -protoinst "protoinst_files/emu.protoinst" -log simulate.log $*"
xsim emu_wrapper_behav -key {Behavioral:sim_1:Functional:emu_wrapper} -tclbatch emu_wrapper.tcl -protoinst "protoinst_files/bd_3a93.protoinst" -protoinst "protoinst_files/bd_9678.protoinst" -protoinst "protoinst_files/emu.protoinst" -log simulate.log $*
