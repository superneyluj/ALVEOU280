#include <stdio.h>
#include <stdlib.h>
#include <CL/cl.h>

#define MATRIX_SIZE 32
#define DATA_SIZE (MATRIX_SIZE * MATRIX_SIZE)

// Utilitaire pour vérifier les erreurs OpenCL
void checkError(cl_int error, const char* message) {
    if (error != CL_SUCCESS) {
        printf("%s failed with error code %d\n", message, error);
        exit(1);
    }
}

int main() {
    cl_platform_id platform_id = NULL;
    cl_device_id device_id = NULL;
    cl_context context = NULL;
    cl_command_queue command_queue = NULL;
    cl_program program = NULL;
    cl_kernel kernel = NULL;
    cl_uint ret_num_devices;
    cl_uint ret_num_platforms;
    cl_int ret;

    // Initialisation d'OpenCL
    ret = clGetPlatformIDs(1, &platform_id, &ret_num_platforms);
    checkError(ret, "Getting platforms");
    
    ret = clGetDeviceIDs(platform_id, CL_DEVICE_TYPE_ACCELERATOR, 1, &device_id, &ret_num_devices);
    checkError(ret, "Getting device");

    context = clCreateContext(NULL, 1, &device_id, NULL, NULL, &ret);
    checkError(ret, "Creating context");

    command_queue = clCreateCommandQueue(context, device_id, 0, &ret);
    checkError(ret, "Creating command queue");

    // Charger le fichier binaire .xclbin pour le FPGA
    const char* binary_file = "path/to/your/kernel.xclbin";
    FILE *file = fopen(binary_file, "rb");
    if (!file) {
        printf("Failed to open the .xclbin file.\n");
        exit(1);
    }
    fseek(file, 0, SEEK_END);
    size_t binary_size = ftell(file);
    rewind(file);

    unsigned char *binary_content = (unsigned char*)malloc(binary_size);
    fread(binary_content, 1, binary_size, file);
    fclose(file);

    size_t size = binary_size;
    program = clCreateProgramWithBinary(context, 1, &device_id, &size, (const unsigned char **)&binary_content, NULL, &ret);
    checkError(ret, "Creating program with binary");

    ret = clBuildProgram(program, 1, &device_id, NULL, NULL, NULL);
    checkError(ret, "Building program");

    kernel = clCreateKernel(program, "matrix_multiply", &ret);
    checkError(ret, "Creating kernel");

    // Création des données pour les matrices
    int *mat1 = (int*)malloc(DATA_SIZE * sizeof(int));
    int *mat2 = (int*)malloc(DATA_SIZE * sizeof(int));
    int *result = (int*)malloc(DATA_SIZE * sizeof(int));
    
    // Initialisation des matrices ici...
    // par exemple, mat1[0] = 1; mat2[0] = 2; etc.

    // Création des tampons mémoire OpenCL pour les matrices
    cl_mem mat1_buf = clCreateBuffer(context, CL_MEM_READ_ONLY, DATA_SIZE * sizeof(int), NULL, &ret);
    checkError(ret, "Creating buffer mat1");
    cl_mem mat2_buf = clCreateBuffer(context, CL_MEM_READ_ONLY, DATA_SIZE * sizeof(int), NULL, &ret);
    checkError(ret, "Creating buffer mat2");
    cl_mem result_buf = clCreateBuffer(context, CL_MEM_WRITE_ONLY, DATA_SIZE * sizeof(int), NULL, &ret);
    checkError(ret, "Creating buffer result");

    // Copie des matrices vers les tampons mémoire
    ret = clEnqueueWriteBuffer(command_queue, mat1_buf, CL_TRUE, 0, DATA_SIZE * sizeof(int), mat1, 0, NULL, NULL);
    checkError(ret, "Copying mat1 to device");
    ret = clEnqueueWriteBuffer(command_queue, mat2_buf, CL_TRUE, 0, DATA_SIZE * sizeof(int), mat2, 0, NULL, NULL);
    checkError(ret, "Copying mat2 to device");

    // Configuration des arguments du kernel
    ret = clSetKernelArg(kernel, 0, sizeof(cl_mem), (void *)&mat1_buf);
    ret |= clSetKernelArg(kernel, 1, sizeof(cl_mem), (void *)&mat2_buf);
    ret |= clSetKernelArg(kernel, 2, sizeof(cl_mem), (void *)&result_buf);
    ret |= clSetKernelArg(kernel, 3, sizeof(int), (void *)&MATRIX_SIZE);
    checkError(ret, "Setting kernel arguments");

    // Lancement du kernel
    size_t global_item_size = MATRIX_SIZE; // Process one element per kernel invocation
    ret = clEnqueueNDRangeKernel(command_queue, kernel, 1, NULL, &global_item_size, NULL, 0, NULL, NULL);
    checkError(ret, "Enqueueing kernel");

    // Récupération des résultats
    ret = clEnqueueReadBuffer(command_queue, result_buf, CL_TRUE, 0, DATA_SIZE * sizeof(int), result, 0, NULL, NULL);
    checkError(ret, "Reading back result");

    // Affichage des résultats ou traitement suivant ici...

    // Nettoyage
    ret = clFlush(command_queue);
    ret = clFinish(command_queue);
    ret = clReleaseKernel(kernel);
    ret = clReleaseProgram(program);
    ret = clReleaseMemObject(mat1_buf);
    ret = clReleaseMemObject(mat2_buf);
    ret = clReleaseMemObject(result_buf);
    ret = clReleaseCommandQueue(command_queue);
    ret = clReleaseContext(context);
    free(mat1);
    free(mat2);
    free(result);
    free(binary_content);

    return 0;
}
