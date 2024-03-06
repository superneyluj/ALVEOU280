#include <stdio.h>
#include <stdlib.h>
#include <CL/cl.h>

#define MATRIX_SIZE 512
#define DATA_SIZE (MATRIX_SIZE * MATRIX_SIZE)

int main(int argc, char** argv) {

    if (argc != 2) {
        std::cout << "Usage: " << argv[0] << " <XCLBIN File>" << std::endl;
        return EXIT_FAILURE;
    }

    std::string binaryFile = argv[1];
    size_t vector_size_bytes = sizeof(int) * DATA_SIZE;
    cl_int err;
    cl::Context context;
    cl::Kernel krnl_vector_add;
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

    // Afficher la matrice 1
    for (int i = 0; i < MATRIX_SIZE; ++i) {
        for (int j = 0; j < MATRIX_SIZE; ++j) {
            std::cout << randomMatrixin1[i][j] << " ";
        }
        std::cout << std::endl;
    }

    // Afficher la matrice 2
    for (int i = 0; i < MATRIX_SIZE; ++i) {
        for (int j = 0; j < MATRIX_SIZE; ++j) {
            std::cout << randomMatrixin2[i][j] << " ";
        }
        std::cout << std::endl;
    }


    return 0;
}
