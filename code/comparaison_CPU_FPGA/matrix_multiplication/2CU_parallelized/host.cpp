#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <vector>
#include <algorithm>
#include <random>
#include "xcl2/xcl2.hpp"

#define MATRIX_SIZE 512
#define DATA_SIZE (MATRIX_SIZE * MATRIX_SIZE)
#define NUM_CU 10

#define OCL_CHECK(error, call)                                                                   \
        call;                                                                                        \
        if (error != CL_SUCCESS) {                                                                   \
            printf("%s:%d Error calling " #call ", error code is: %d\n", __FILE__, __LINE__, error); \
            exit(EXIT_FAILURE);                                                                      \
        }

int main(int argc, char** argv) {

    if (argc != 2) {
        std::cout << "Usage: " << argv[0] << " <XCLBIN File>" << std::endl;
        return EXIT_FAILURE;
    }

    std::vector<std::vector<std::vector<int>>> in1(NUM_CU, std::vector<std::vector<int>>(MATRIX_SIZE, std::vector<int>(MATRIX_SIZE)));
    std::vector<std::vector<std::vector<int>>> in2(NUM_CU, std::vector<std::vector<int>>(MATRIX_SIZE, std::vector<int>(MATRIX_SIZE)));
    std::vector<std::vector<std::vector<int>>> out(NUM_CU, std::vector<std::vector<int>>(MATRIX_SIZE, std::vector<int>(MATRIX_SIZE)));

    for (int i = 0; i < NUM_CU; ++i) {
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<int> dis(1, 9);

        for (int j = 0; j < MATRIX_SIZE; ++j) {
            for (int k = 0; k < MATRIX_SIZE; ++k) {
                in2[i][j][k] = dis(gen);
                in1[i][j][k] = dis(gen);
            }
        }
    }

    std::string binaryFile = argv[1];
    cl_int err;
    cl::Context context;
    std::vector<cl::Kernel> matrix_multiplication;
    cl::CommandQueue q;

    // OPENCL HOST CODE AREA START
    // get_xil_devices() is a utility API which will find the xilinx
    // platforms and will return list of devices connected to Xilinx platform
    auto devices = xcl::get_xil_devices();
    // read_binary_file() is a utility API which will load the binaryFile
    // and will return the pointer to file buffer.
    auto fileBuf = xcl::read_binary_file(binaryFile);
    cl::Program::Binaries bins{{fileBuf.data(), fileBuf.size()}};
    bool valid_device = false;
    for (unsigned int i = 0; i < devices.size(); i++) {
        auto device = devices[i];
        // Creating Context and Command Queue for selected Device
        OCL_CHECK(err, context = cl::Context(device, nullptr, nullptr, nullptr, &err));
        OCL_CHECK(err, q = cl::CommandQueue(context, device, CL_QUEUE_PROFILING_ENABLE, &err));
        std::cout << "Trying to program device[" << i << "]: " << device.getInfo<CL_DEVICE_NAME>() << std::endl;
        cl::Program program(context, {device}, bins, nullptr, &err);
        if (err != CL_SUCCESS) {
            std::cout << "Failed to program device[" << i << "] with xclbin file!\n";
        } else {
            std::cout << "Device[" << i << "]: program successful!\n";
            for(int j = 0; j < NUM_CU ; j++){
                OCL_CHECK(err, matrix_multiplication[j] = cl::Kernel(program, "matrix_multiplication", &err));
            }
            valid_device = true;
            break; // we break because we found a valid device
        }
    }
    if (!valid_device) {
        std::cout << "Failed to program any device found, exit!\n";
        exit(EXIT_FAILURE);
    }

    // Création d'un vecteur de buffers
    std::vector<cl::Buffer> buffer_matrixIn1(NUM_CU);
    std::vector<cl::Buffer> buffer_matrixIn2(NUM_CU);
    std::vector<cl::Buffer> buffer_matrixOut(NUM_CU);
    
    // Configuration des arguments du kernel
    int size = MATRIX_SIZE;
    for(int i = 0; i < NUM_CU; i++ ){

        buffer_matrixIn1[i] = cl::Buffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, sizeof(int) * MATRIX_SIZE * MATRIX_SIZE,in1[i][0].data());
        buffer_matrixIn2[i] = cl::Buffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, sizeof(int) * MATRIX_SIZE * MATRIX_SIZE,in2[i][0].data());
        buffer_matrixOut[i] = cl::Buffer(context, CL_MEM_WRITE_ONLY, sizeof(int) * MATRIX_SIZE * MATRIX_SIZE);
        OCL_CHECK(err, err = matrix_multiplication[i].setArg(0,  buffer_matrixIn1[i]));
        OCL_CHECK(err, err = matrix_multiplication[i].setArg(1,  buffer_matrixIn2[i]));
        OCL_CHECK(err, err = matrix_multiplication[i].setArg(2, buffer_matrixOut[i]));
        OCL_CHECK(err, err = matrix_multiplication[i].setArg(3, size));

    }

    for (int i = 0; i < NUM_CU; i++) {
    OCL_CHECK(err, err = q.enqueueWriteBuffer(buffer_matrixIn1[i], CL_TRUE, 0,
                                              sizeof(int) * MATRIX_SIZE * MATRIX_SIZE, in1[i][0].data()));
    OCL_CHECK(err, err = q.enqueueWriteBuffer(buffer_matrixIn2[i], CL_TRUE, 0,
                                              sizeof(int) * MATRIX_SIZE * MATRIX_SIZE, in2[i][0].data()));
    }

    // Launch the Kernel
    // For HLS kernels global and local size is always (1,1,1). So, it is
    // recommended
    // to always use enqueueTask() for invoking HLS kernels
    for (int i = 0; i < NUM_CU; i++){
        OCL_CHECK(err, err = q.enqueueTask(matrix_multiplication[i]));
    }
    
    // Copy Result from Device Global Memory to Host Local Memory
    for (int i = 0; i < NUM_CU; i++) {
        OCL_CHECK(err, err = q.enqueueReadBuffer(buffer_matrixOut[i], CL_TRUE, 0,
                                             sizeof(int) * MATRIX_SIZE * MATRIX_SIZE, out[i][0].data()));
    }
 
    q.finish();

    return 0;
}
