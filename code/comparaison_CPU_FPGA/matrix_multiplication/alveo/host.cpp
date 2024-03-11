#define OCL_CHECK(error, call)                                                                   \
        call;                                                                                        \
        if (error != CL_SUCCESS) {                                                                   \
            printf("%s:%d Error calling " #call ", error code is: %d\n", __FILE__, __LINE__, error); \
            exit(EXIT_FAILURE);                                                                      \
        }


#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <vector>
#include <algorithm>
#include "xcl2/xcl2.hpp"

#define MATRIX_SIZE 512
#define DATA_SIZE (MATRIX_SIZE * MATRIX_SIZE)
#define ITERATIONS 10

int main(int argc, char** argv) {

    if (argc != 2) {
        std::cout << "Usage: " << argv[0] << " <XCLBIN File>" << std::endl;
        return EXIT_FAILURE;
    }

    std::string binaryFile = argv[1];
    cl_int err;
    cl::Context context;
    cl::Kernel matrix_multiplication;
    cl::CommandQueue q;

    // Declarer et initialiser une matrice alignee avec des valeurs aleatoires
    std::vector<std::vector<int, aligned_allocator<int>>> randomMatrixin1(MATRIX_SIZE, std::vector<int, aligned_allocator<int>>(MATRIX_SIZE));
    std::vector<std::vector<int, aligned_allocator<int>>> randomMatrixin2(MATRIX_SIZE, std::vector<int, aligned_allocator<int>>(MATRIX_SIZE));
    std::vector<std::vector<int, aligned_allocator<int>>> Matrixresult(MATRIX_SIZE, std::vector<int, aligned_allocator<int>>(MATRIX_SIZE));

    // Générer des valeurs aléatoires pour la matrice
    for (int i = 0; i < MATRIX_SIZE; ++i) {
        std::generate(randomMatrixin1[i].begin(), randomMatrixin1[i].end(), std::rand);
        std::generate(randomMatrixin2[i].begin(), randomMatrixin2[i].end(), std::rand);
    }

    auto devices = xcl::get_xil_devices();
    auto fileBuf = xcl::read_binary_file(binaryFile);
    cl::Program::Binaries bins{{fileBuf.data(),fileBuf.size()}};
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
            OCL_CHECK(err, matrix_multiplication = cl::Kernel(program, "matrix_multiplication", &err));
            valid_device = true;
            break; // we break because we found a valid device
        }
    }
    if (!valid_device) {
        std::cout << "Failed to program any device found, exit!\n";
        exit(EXIT_FAILURE);
    }


    //Creating buffers
    OCL_CHECK(err, cl::Buffer buffer_in1 = cl::Buffer(context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_ONLY, sizeof(int) * DATA_SIZE,randomMatrixin1.data()[0].data(), &err));
    OCL_CHECK(err, cl::Buffer buffer_in2 = cl::Buffer(context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_ONLY, sizeof(int) * DATA_SIZE,randomMatrixin2.data()[0].data(), &err));
    OCL_CHECK(err, cl::Buffer buffer_out = cl::Buffer(context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_ONLY, sizeof(int) * DATA_SIZE,Matrixresult.data()[0].data(), &err));

    OCL_CHECK(err, err = matrix_multiplication.setArg(0, buffer_in1));
    OCL_CHECK(err, err = matrix_multiplication.setArg(1, buffer_in2));
    OCL_CHECK(err, err = matrix_multiplication.setArg(2, buffer_out));
    OCL_CHECK(err, err = matrix_multiplication.setArg(3, MATRIX_SIZE));
    OCL_CHECK(err, err = matrix_multiplication.setArg(4, ITERATIONS));

    // Copy input data to device global memory
    OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_in1, buffer_in2}, 0 /* 0 means from host*/));

    // Launch the Kernel

    OCL_CHECK(err, err = q.enqueueTask(matrix_multiplication));

    // Copy Result from Device Global Memory to Host Local Memory
    OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_out}, CL_MIGRATE_MEM_OBJECT_HOST));
    q.finish();


    return 0;
}
