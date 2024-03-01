PLATFORM ?= /opt/xilinx/platforms/xilinx_u280_gen3x16_xdma_1_202211_1/xilinx_u280_gen3x16_xdma_1_202211_1.xpfm
VITIS_DIRS ?= --temp_dir vitis_tmp/ --report_dir vitis_report/ --log_dir vitis_logs/
PROGRAM ?= host
HOST_C ?= host.cpp
PROGRAM_KERNEL ?= vadd
SOURCE_KERNEL ?= vadd.cpp

all: $(PROGRAM) sw_emu/$(PROGRAM).xclbin hw_emu/$(PROGRAM).xclbin hw/$(PROGRAM).xclbin	
	@echo "\E[32m **************************Done************************** \E[0m"


compilation: $(HOST_C)	
	g++ -g -I$(XILINX_VIVADO)/include -I /home/fpga/Desktop/AlveoU280/vadd_xilinx/xcl2 -I$(XILINX_XRT)/include -I /home/fpga/tools/Vitis_HLS/2022.2/include -o $(PROGRAM) $(HOST_C) xcl2/xcl2.cpp -Wall -Wextra -Wpedantic -L$(XILINX_XRT)/lib -lxilinxopencl
	@echo -e "\E[32m **************************compilation C OK************************** \E[0m"
	
sw_emu: $(SOURCE_KERNEL)
	@# -t build targets : [sw_emu,hw_emu,hw]
	@# --platform : path to xpfm file
	@# -c : compile
	@# -k : kernel name		
	@# -o : output file
	mkdir sw_emu
	v++ -t sw_emu --platform $(PLATFORM) -c -k $(PROGRAM_KERNEL) -o sw_emu/$(PROGRAM).xo $(SOURCE_KERNEL) $(VITIS_DIRS) --save-temps
	v++ -t sw_emu --platform $(PLATFORM) --link sw_emu/$(PROGRAM).xo -o sw_emu/$(PROGRAM).xclbin --config ./$(PROGRAM).cfg $(VITIS_DIRS) --save-temps
	export XCL_EMULATION_MODE=sw_emu ; ./$(PROGRAM) sw_emu/$(PROGRAM).xclbin
	@echo -e "\E[32m **************************sw_emu OK************************** \E[0m"


hw_emu : $(SOURCE_KERNEL) $(PROGRAM).cfg
	mkdir hw_emu
	v++ -t hw_emu --platform $(PLATFORM) -c -k $(PROGRAM_KERNEL) -o hw_emu/$(PROGRAM).xo $(SOURCE_KERNEL) $(VITIS_DIRS)--save-temps
	v++ -t hw_emu --platform $(PLATFORM) --link hw_emu/$(PROGRAM).xo -o hw_emu/$(PROGRAM).xclbin --config ./$(PROGRAM).cfg $(VITIS_DIRS) --save-temps
	export XCL_EMULATION_MODE=hw_emu ; ./$(PROGRAM) hw_emu/$(PROGRAM).xclbin
	@echo -e "\E[32m **************************hw_emu  OK************************** \E[0m"

hw: $(SOURCE_KERNEL) $(PROGRAM).cfg
	mkdir hw
	v++ -t hw --platform $(PLATFORM) -c -k $(PROGRAM_KERNEL) -o hw/$(PROGRAM).xo $(SOURCE_KERNEL) $(VITIS_DIRS) --save-temps	
	v++ -t hw --platform $(PLATFORM) --link hw/$(PROGRAM).xo -o hw/$(PROGRAM).xclbin --config ./$(PROGRAM).cfg $(VITIS_DIRS) --save-temps
	unset XCL_EMULATION_MODE; ./$(PROGRAM) hw/$(PROGRAM).xclbin
	@echo -e "\E[32m **************************hw  OK************************** \E[0m"

clear: clean
	rm -rf sw_emu
	rm -rf hw_emu
	rm -rf hw
	rm $(PROGRAM)

clean:
	rm -rf vitis_tmp vitis_report vitis_logs
	rm -rf *.log
	rm -rf *.csv
	rm -rf *.jou
	rm -rf *.str
	rm -rf *.txt
	rm -rf *.run_summary
