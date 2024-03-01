ERROR_FLAGS := -Wall
COMPILER := /opt/intel/oneapi/compiler/latest/linux/bin/icx
INCLUDES := -I/opt/intel/oneapi/mkl/latest/include/
LIBS := -lmkl_sequential -lmkl_intel_lp64 -lrt -lmkl_core -lpthread -lnuma
LIB_PATH := /opt/intel/oneapi/mkl/latest/lib/intel64

all: MKL_Cheev

MKL_Cheev: src/MKL_Cheev.c
	$(COMPILER) -o $@ $^ $(ERROR_FLAGS) $(LIBS) -L$(LIB_PATH) $(INCLUDES)

 
clean:
	rm -f MKL_Cheev
