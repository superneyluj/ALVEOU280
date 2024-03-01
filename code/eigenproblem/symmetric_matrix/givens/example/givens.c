#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define N 3 // Taille de la matrice

void printMatrix(double A[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            printf("%8.4f ", A[i][j]);
        }
        printf("\n");
    }
}

void generateRotationMatrix(double S[N][N], double theta) {
    // Initialiser S comme la matrice identité
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            S[i][j] = (i == j) ? 1.0 : 0.0;
        }
    }
    // Remplacer par les valeurs de rotation
    S[1][1] = cos(theta);
    S[1][2] = -sin(theta);
    S[2][1] = sin(theta);
    S[2][2] = cos(theta);
}

void matrixMultiplication(double A[N][N], double B[N][N], double C[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            C[i][j] = 0.0;
            for (int k = 0; k < N; k++) {
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }
}

void transposeMatrix(double A[N][N], double A_T[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            A_T[i][j] = A[j][i];
        }
    }
}

int main() {
    double A[N][N] = {{1, 2, 4}, {2, 1, 2}, {4, 2, 1}};
    double S[N][N], S_T[N][N], temp[N][N], A_prime[N][N];
    double keyElement = 4.0, pivotElement = 2.0;
    double theta = atan2(keyElement, pivotElement);

    generateRotationMatrix(S, theta);
    transposeMatrix(S, S_T);

    // Calcul de S^T * A
    matrixMultiplication(S_T, A, temp);
    // Calcul de (S^T * A) * S = A'
    matrixMultiplication(temp, S, A_prime);

    printf("Original Matrix A:\n");
    printMatrix(A);
    printf("\nRotation Matrix S:\n");
    printMatrix(S);
    printf("\nMatrix A' after rotation A' = S^T * A * S:\n");
    printMatrix(A_prime);

    return 0;
}
