#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

//Définition de la constante EPS pour la précision
#define EPS 0.00000000000001


//Décalaration des fonctions
void generateSymmetricMatrix(double **matrix, int n);
void printMatrix(double **matrix, int n);
void matrix_divide_and_conquer(double **T, double **Q, double **L,int n, long double epsilon);


int main(int argc, char **argv){

    int n = 6; // Taille de la matrice

    // Allocation de la matrice tridiagonale
    double **T = (double **)malloc(n * sizeof(double *));
    for (int i = 0; i < n; i++) {
        T[i] = (double *)malloc(n * sizeof(double));
    }

    //Allocations des matrices de résultats
    double **Q = (double **)malloc(n * sizeof(double *));
    double **L = (double **)malloc(n * sizeof(double *));
    for (int i = 0; i < n; i++) {
        Q[i] = (double *)malloc(n * sizeof(double));
        L[i] = (double *)malloc(n * sizeof(double));
    }


    generateSymmetricMatrix(T, n);
    printf("\nMatrice tridiagonale :\n");
    printMatrix(T, n);

    matrix_divide_and_conquer(T, Q, L, n, EPS);

    // Libération de la mémoire
    for (int i = 0; i < n; i++) {
        free(T[i]);
    }
    free(T);

    return 0;
}

void generateSymmetricMatrix(double **matrix, int n) {
    // Initialisation du générateur de nombres aléatoires
    srand(time(NULL));

    for (int i = 0; i < n; i++) {
        // Diagonale principale
        matrix[i][i] = (rand() % 9) + 1;
        if (i > 0) {
            // Éléments symétriques pour la sur-diagonale et la sous-diagonale
            double value = (rand() % 9) + 1;
            matrix[i][i-1] = value; // Sous-diagonale
            matrix[i-1][i] = value; // Sur-diagonale
        }
    }
}

void printMatrix(double **matrice, int n) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            printf("%f ", matrice[i][j]);
        }
        printf("\n");
    }
}

void matrix_divide_and_conquer(double **T, double **Q, double **L, int n, long double epsilon){

    //Déclaration des variables
    int m;
    double rho;

    if (n % 2 == 0) {
        m = n / 2;
    } else {
        m = (n - 1) / 2;
    }

    printf("m = %d\n", m);
    //récupération de rho 
    rho = fabsl(T[m][m-1]);
    printf("rho = %f\n", rho);

    //Fonction qui va diviser la matrice en deux
    //et stocker les résultats dans les matrices T1 et T2

}

