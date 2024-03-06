#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void multiplyMatrices(int **mat1, int **mat2, int **result, int n) {
    int i, j, k;
    for (i = 0; i < n; i++) {   
        for (j = 0; j < n; j++) {
            result[i][j] = 0;
            for (k = 0; k < n; k++) {
                result[i][j] += mat1[i][k] * mat2[k][j];
            }
        }
    }
}

void fillMatrixWithRandomNumbers(int **matrix, int n) {
    int i, j;
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            matrix[i][j] = rand() % 10; // Generate random numbers between 0 and 9
        }
    }
}

int main() {
    int n = 512; // Taille des matrices
    int k = 50; // Nombre de multiplications à effectuer

    // Allocation de mémoire pour les matrices
    int **matrix1 = (int **)malloc(n * sizeof(int *));
    int **matrix2 = (int **)malloc(n * sizeof(int *));
    int **result = (int **)malloc(n * sizeof(int *));
    for (int i = 0; i < n; i++) {
        matrix1[i] = (int *)malloc(n * sizeof(int));
        matrix2[i] = (int *)malloc(n * sizeof(int));
        result[i] = (int *)malloc(n * sizeof(int));
    }

    srand(time(NULL)); // Initialisation du générateur de nombres aléatoires

    clock_t start = clock(); // Début du chronométrage

    // Réalisation de k multiplications de matrices
    for (int iteration = 0; iteration < k; iteration++) {
        fillMatrixWithRandomNumbers(matrix1, n);
        fillMatrixWithRandomNumbers(matrix2, n);
        multiplyMatrices(matrix1, matrix2, result, n);
    }

    clock_t end = clock(); // Fin du chronométrage
    double time_spent = (double)(end - start) / CLOCKS_PER_SEC; // Calcul du temps passé

    printf("Temps total pour %d multiplications de matrices de taille %dx%d : %f secondes\n", k, n, n, time_spent);

    // Libération de la mémoire
    for (int i = 0; i < n; i++) {
        free(matrix1[i]);
        free(matrix2[i]);
        free(result[i]);
    }
    free(matrix1);
    free(matrix2);
    free(result);

    return 0;
}
