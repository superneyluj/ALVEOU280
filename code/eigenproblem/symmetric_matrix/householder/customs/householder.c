#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void printMatrix(double **matrix, int n) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            printf("%f ", matrix[i][j]);
        }
        printf("\n");
    }
}

void generateSymmetricMatrix(double **matrix, int n) {
    srand(time(NULL)); // Initialisation du générateur de nombres aléatoires
    for (int i = 0; i < n; i++) {
        for (int j = i; j < n; j++) {
            double value = rand() % 10; // Génère un nombre aléatoire entre 0 et 9
            matrix[i][j] = value;
            matrix[j][i] = value; // Assure la symétrie de la matrice
        }
    }
}

void householderTransformation(double **A, int n) {
    for (int k = 0; k < n - 2; k++) {
        // Calcul de la norme de la colonne sous-diagonale
        double norm = 0;
        for (int i = k + 1; i < n; i++) {
            norm += A[i][k] * A[i][k];
        }
        norm = sqrt(norm);

        // Calcul du vecteur u
        double *u = (double *)malloc(n * sizeof(double));
        for (int i = 0; i < k + 1; i++) {
            u[i] = 0;
        }
        u[k + 1] = A[k + 1][k] - norm;
        for (int i = k + 2; i < n; i++) {
            u[i] = A[i][k];
        }

        // Calcul de la norme de u
        double norm_u = 0;
        for (int i = k + 1; i < n; i++) {
            norm_u += u[i] * u[i];
        }

        // Construction de la matrice de Householder H = I - 2uu^T / ||u||^2
        double **H = (double **)malloc(n * sizeof(double *));
        for (int i = 0; i < n; i++) {
            H[i] = (double *)malloc(n * sizeof(double));
            for (int j = 0; j < n; j++) {
                H[i][j] = -2 * u[i] * u[j] / norm_u;
                if (i == j) {
                    H[i][j] += 1;
                }
            }
        }

        // Application de la transformation de Householder à A: HAH
        double **newA = (double **)malloc(n * sizeof(double *));
        for (int i = 0; i < n; i++) {
            newA[i] = (double *)malloc(n * sizeof(double));
            for (int j = 0; j < n; j++) {
                newA[i][j] = 0;
                for (int k = 0; k < n; k++) {
                    for (int l = 0; l < n; l++) {
                        newA[i][j] += H[i][k] * A[k][l] * H[l][j];
                    }
                }
            }
        }

        // Copier newA dans A
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                A[i][j] = newA[i][j];
            }
            free(newA[i]);
            free(H[i]);
        }
        free(newA);
        free(H);
        free(u);
    }
}

int main() {
    int n = 8; // Taille de la matrice
    double **A = (double **)malloc(n * sizeof(double *));
    for (int i = 0; i < n; i++) {
        A[i] = (double *)malloc(n * sizeof(double));
    }

    generateSymmetricMatrix(A, n); // Génère une matrice symétrique aléatoire
    printf("Matrice symétrique générée :\n");
    printMatrix(A, n);

    householderTransformation(A, n); // Applique la tridiagonalisation
    printf("\nMatrice après tridiagonalisation :\n");
    printMatrix(A, n);

    // Libération de la mémoire
    for (int i = 0; i < n; i++) {
        free(A[i]);
    }
    free(A);

    return 0;
}
