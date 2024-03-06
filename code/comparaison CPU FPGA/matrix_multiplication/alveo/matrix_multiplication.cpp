#include <hls_stream.h>
#include <ap_int.h>

#define MATRIX_SIZE 32 // Ajustez selon les besoins et la capacité de votre FPGA
#define DATA_WIDTH 32
#define NUM_WORDS 8    // Nombre de mots traités par cycle d'horloge

// Utilisation de types fixés pour une efficacité accrue sur FPGA
typedef ap_int<DATA_WIDTH> data_t;
typedef hls::stream<data_t> stream_t;

extern "C" {
void matrix_multiply(data_t* mat1, data_t* mat2, data_t* result, int size) {
    #pragma HLS INTERFACE m_axi port=mat1 offset=slave bundle=gmem0
    #pragma HLS INTERFACE m_axi port=mat2 offset=slave bundle=gmem1
    #pragma HLS INTERFACE m_axi port=result offset=slave bundle=gmem2
    #pragma HLS INTERFACE s_axilite port=size
    #pragma HLS INTERFACE s_axilite port=return

    data_t local_mat1[MATRIX_SIZE][MATRIX_SIZE];
    data_t local_mat2[MATRIX_SIZE][MATRIX_SIZE];
    data_t local_result[MATRIX_SIZE][MATRIX_SIZE] = {0};

    // Charger mat1 et mat2 dans les mémoires locales
    Load_Matrices: for(int i = 0; i < size; i++) {
        for(int j = 0; j < size; j++) {
            #pragma HLS PIPELINE
            local_mat1[i][j] = mat1[i * size + j];
            local_mat2[i][j] = mat2[i * size + j];
        }
    }

    // Calcul de la multiplication matricielle
    Compute: for(int i = 0; i < size; i++) {
        for(int j = 0; j < size; j++) {
            for(int k = 0; k < size; k++) {
                #pragma HLS PIPELINE
                local_result[i][j] += local_mat1[i][k] * local_mat2[k][j];
            }
        }
    }

    // Stocker le résultat dans la mémoire globale
    Store_Result: for(int i = 0; i < size; i++) {
        for(int j = 0; j < size; j++) {
            #pragma HLS PIPELINE
            result[i * size + j] = local_result[i][j];
        }
    }
}
}
