#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

void generateSymmetricMatrix(double **matrix, int n) {
    srand(time(NULL)); // Initialisation du générateur de nombres aléatoires
    for (int i = 0; i < n; i++) {
        for (int j = i; j < n; j++) {
            double value = 1+(rand() % 9); // Génère un nombre aléatoire entre 0 et 9
            matrix[i][j] = value;
            matrix[j][i] = value; // Assure la symétrie de la matrice
        }
    }
}

void identificationElementTridiDiag(double **matrix, int n){
    printf("\nElements a annuler pour rendre la matrice tridiagonale :\n");
    for (int i = 0; i < n ; i++){
        for( int j = n-1 ; j >i+1  ; j--){
                printf("\n Element a annuler : matrice [%d][%d]=%8.4f\n",i,j,matrix[i][j]);
        }
    }
}

void printMatrix(double **A, int n) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            printf("%8.4f ", A[i][j]);
        }
        printf("\n");
    }
}


void elementsToTridiagonalize(double **matrix, int n) {
    // Commencer par la première ligne
    for (int i = 0; i < n ; i++) { // Pas besoin d'aller jusqu'à la dernière ligne
        // Parcourir les éléments à partir de la fin de la ligne, à l'exception des éléments déjà sur les diagonales
        for (int j = n - 1; j > i + 1; j--) { // Commencer par le dernier élément et ignorer les 2 diagonales les plus proches
            printf("Key element [%d][%d] = %.2f Pivot Element :[%d][%d] : %.2f\n", i, j, matrix[i][j], i, j-1, matrix[i][j-1]);
            double keyElement = matrix[i][j];
            double pivotElement = matrix[i][j-1]; 
            double theta = atan(keyElement/pivotElement);
            double c = cos(theta);
            double s = sin(theta);
            generateRotationMatrix(matrix, n, j, j-1, c, s);
        }
    }
}


void generateRotationMatrix(double **matrix, int n, int i, int j, double c, double s) {
    // Allocation de la matrice
    double **S = (double **)malloc(n * sizeof(double *));
    for (int i = 0; i < n; i++) {
        S[i] = (double *)malloc(n * sizeof(double));
    }
    for (int row = 0; row < n; row++) {
        for (int col = 0; col < n; col++) {
            if (row == col) S[row][col] = 1; // Éléments diagonaux
            else S[row][col] = 0; // Hors diagonale
        }
    }
    // Définir les éléments de rotation
    S[i][i] = c; S[i][j] = s;
    S[j][i] = -s; S[j][j] = c;
    printf("\n Matrice de rotation G[%d][%d]\n",j,i);
    printMatrix(S,n);
    // Appliquer la rotation
    applyRotation(matrix, S, n);
}

void applyRotation(double **A, double **S, int n) {
    double **temp = (double **)malloc(n * sizeof(double *));
    for (int i = 0; i < n; i++) {
        temp[i] = (double *)malloc(n * sizeof(double));
    }

    // Calcul de S^T * A
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            temp[i][j] = 0;
            for (int k = 0; k < n; k++) {
                temp[i][j] += S[k][i] * A[k][j]; // Notez l'usage de S[k][i] pour S^T
            }
        }
    }

    // Calcul de (S^T * A) * S = temp * S
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            A[i][j] = 0; // Réinitialiser A pour le résultat
            for (int k = 0; k < n; k++) {
                A[i][j] += temp[i][k] * S[k][j];
            }
        }
    }

    // Libération de la mémoire
    for (int i = 0; i < n; i++) {
        free(temp[i]);
    }
    free(temp);
    printf("\nMatrice après rotation :\n");
    printMatrix(A, n);
}



int main() {

    int n = 4; // Taille de la matrice

    // Allocation de la matrice
    double **A = (double **)malloc(n * sizeof(double *));
    for (int i = 0; i < n; i++) {
        A[i] = (double *)malloc(n * sizeof(double));
    }

    generateSymmetricMatrix(A, n);
    printf("Matrice symétrique générée :\n");
    printMatrix(A, n);

    identificationElementTridiDiag(A,n);

    elementsToTridiagonalize(A,n);
    printf("\nmatrice tridiagonalisee \n");
    printMatrix(A, n);

    // Libération de la mémoire
    for (int i = 0; i < n; i++) {
        free(A[i]);
    }
    free(A);

    return 0;
}