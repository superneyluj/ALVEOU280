#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

// Définition de la structure pour stocker les valeurs propres et vecteurs propres
typedef struct {
    double* values;
    double** vectors;
} EigenResult;

// Fonction pour allouer de la mémoire pour une matrice
double** allocate_matrix(int n, int m) {
    double** matrix = (double**)malloc(n * sizeof(double*));
    for (int i = 0; i < n; i++) {
        matrix[i] = (double*)malloc(m * sizeof(double));
    }
    return matrix;
#include <time.h>

}

// Fonction pour libérer de la mémoire pour une matrice
void free_matrix(double** matrix, int n) {
    for (int i = 0; i < n; i++) {
        free(matrix[i]);
    }
    free(matrix);
}

// Fonction pour calculer les valeurs propres et vecteurs propres d'une matrice tridiagonale symétrique
EigenResult eigen_decomposition(double** matrix, int n) {
    if (n == 1) {
        EigenResult result;
        result.values = (double*)malloc(sizeof(double));
        result.vectors = allocate_matrix(n, n);
        result.values[0] = matrix[0][0];
        result.vectors[0][0] = 1;
        return result;
    } else if (n == 2) {
        EigenResult result;
        result.values = (double*)malloc(2 * sizeof(double));
        result.vectors = allocate_matrix(n, n);
        double trace = matrix[0][0] + matrix[1][1];
        double det = matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0];
        double sqrt_part = sqrt(pow(matrix[0][0] - matrix[1][1], 2) + 4 * matrix[0][1] * matrix[1][0]);
        result.values[0] = 0.5 * (trace - sqrt_part);
        result.values[1] = 0.5 * (trace + sqrt_part);
        result.vectors[0][0] = 1;
        result.vectors[0][1] = (matrix[0][0] - result.values[0]) / matrix[0][1];
        result.vectors[1][0] = 1;
        result.vectors[1][1] = (matrix[0][0] - result.values[1]) / matrix[0][1];
        return result;
    } else {
        int half = n / 2;
        double** submatrix1 = allocate_matrix(half, half);
        double** submatrix2 = allocate_matrix(n - half, n - half);
        for (int i = 0; i < half; i++) {
            for (int j = 0; j < half; j++) {
                submatrix1[i][j] = matrix[i][j];
            }
        }
        for (int i = half; i < n; i++) {
            for (int j = half; j < n; j++) {
                submatrix2[i - half][j - half] = matrix[i][j];
            }
        }
        for (int i = half; i < n; i++) {
            submatrix1[half - 1][i - half] = matrix[half - 1][i];
            submatrix2[i - half][half - 1] = matrix[i][half - 1];
        }
        EigenResult result1 = eigen_decomposition(submatrix1, half);
        EigenResult result2 = eigen_decomposition(submatrix2, n - half);
        EigenResult result;
        result.values = (double*)malloc(n * sizeof(double));
        result.vectors = allocate_matrix(n, n);
        for (int i = 0; i < half; i++) {
            result.values[i] = result1.values[i];
            for (int j = 0; j < n; j++) {
                result.vectors[i][j] = 0;
            }
            result.vectors[i][i] = 1;
            if (i > 0) {
                result.vectors[i][i - 1] = result1.vectors[i][i - 1];
            }
            if (i < half - 1) {
            result.vectors[i][i + 1] = result1.vectors[i][i + 1];
            }
        }   
        for (int i = half; i < n; i++) {
            result.values[i] = result2.values[i - half];
            for (int j = 0; j < n; j++) {
                result.vectors[i][j] = 0;
            }   
            result.vectors[i][i] = 1;
            if (i > half) {
                result.vectors[i][i - 1] = result2.vectors[i - half][i - half - 1];
            }
            if (i < n - 1) {
                result.vectors[i][i + 1] = result2.vectors[i - half][i - half + 1];
            }
        }
        free_matrix(submatrix1, half);
        free_matrix(submatrix2, n - half);
        free(result1.values);
        free_matrix(result1.vectors, half);
        free(result2.values);
        free_matrix(result2.vectors, n - half);
        return result;
    }
}

// Fonction pour afficher les valeurs propres et vecteurs propres
void print_eigen_result(EigenResult result, int n) {
    printf("Valeurs propres : \n");
    for (int i = 0; i < n; i++) {
        printf("%f \n", result.values[i]);
    }
    printf("Vecteurs propres : \n");
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            printf("%f ", result.vectors[i][j]);
        }
    printf("\n");
    }
}

// Fonction principale
int main() {
    int n = 4;
    double** matrix = allocate_matrix(n, n);

    //A la place de de cette matrice je veux générer une matrice tridiagonale symétrique aléatoire
    //pour cela je vais utiliser la fonction rand() pour générer des valeurs aléatoires
    //et je vais utiliser la fonction srand() pour initialiser le générateur de nombres aléatoires
    //avec une graine (seed) qui est le temps actuel
    srand(time(NULL));
    for (int i = 0; i < n; i++) {
        matrix[i][i] = rand() % 10;
        if (i < n - 1) {
            matrix[i][i + 1] = rand() % 10;
            matrix[i + 1][i] = matrix[i][i + 1];
        }
    }

    //Maintenant je vais afficher cette matrice sur le terminal
    printf("La matrice tridiagonale symétrique aléatoire est : \n");
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            printf("%f ", matrix[i][j]);
        }
        printf("\n");
    }
    
    EigenResult result = eigen_decomposition(matrix, n);
    print_eigen_result(result, n);
    free_matrix(matrix, n);
    free(result.values);
    free_matrix(result.vectors, n);
    return 0;
}
