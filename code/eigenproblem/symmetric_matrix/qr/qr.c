#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <stdbool.h>

#define THRESHOLD 0.01

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
}


void qrDecomposition(double **A, double **Q, double **R, int n) {
    printf("\n-----------------QR COMPUTATION-----------------\n");
    // Initialiser R avec A
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            R[i][j] = A[i][j];
        }
    }
    
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            Q[i][j] = (i == j) ? 1.0 : 0.0;
        }
    }


    for (int i = 1; i < n; i++) {
        printf("\nKeyElement [%d][%d] = %.2f, PivotElement [%d][%d] = %.2f\n",  i,i-1,R[i][i-1],i-1,i-1,R[i-1][i-1]);
            double keyElement = R[i][i-1];
            double pivotElement = R[i-1][i-1]; 
            double theta = atan(keyElement/pivotElement);
            double c = cos(theta);
            double s = sin(theta);
            printf("\nQR : cos(theta) = %.2f  sin(theta) = %.2f",c,s);


            double **G = (double **)malloc(n * sizeof(double *));
            for (int i = 0; i < n; i++) {
                G[i] = (double *)malloc(n * sizeof(double));
            }
            
            for (int row = 0; row < n; row++) {
                for (int col = 0; col < n; col++) {
                    if (row == col) G[row][col] = 1; 
                    else G[row][col] = 0; 
                }
            }  

            G[i-1][i-1] = c; 
            G[i][i] = c;
            G[i-1][i] = s; 
            G[i][i-1] = -s;
            printf("\n Matrice de rotation : \n");
            printMatrix(G,n);

            double **temp = (double **)malloc(n * sizeof(double *));
            for (int i = 0; i < n; i++) {
                temp[i] = (double *)malloc(n * sizeof(double));
            }

            for (int i = 0; i < n; i++) {
                for (int j = 0; j < n; j++) {
                    for (int k = 0; k < n; k++) {
                        temp[i][j] += G[i][k] * R[k][j]; 
                    }
                }
            }
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < n; j++) {
                R[i][j] = temp[i][j];
                }
            }
            

            // Initialisation de la matrice temporaire pour Q
            double **tempQ = (double **)malloc(n * sizeof(double *));
            for (int i = 0; i < n; i++) {
                tempQ[i] = (double *)calloc(n, sizeof(double)); // Initialisez à 0
            }

            // Mise à jour de Q avec G^T * Q
            for (int row = 0; row < n; row++) {
                for (int col = 0; col < n; col++) {
                    for (int k = 0; k < n; k++) {
                        // Attention ici à l'ordre des indices pour G^T
                        tempQ[row][col] += G[col][k] * Q[row][k]; 
                    }
                }
            }

            // Copiez le résultat de tempQ dans Q
            for (int row = 0; row < n; row++) {
                for (int col = 0; col < n; col++) {
                    Q[row][col] = tempQ[row][col];
                }
            }
    }
    printf("\nComposante R\n");
    printMatrix(R,n);

    printf("\nComposante Q\n");
    printMatrix(Q,n);
}



int main() {

    int n = 3; // Taille de la matrice

    // Allocation de la matrice
    double **A = (double **)malloc(n * sizeof(double *));
    for (int i = 0; i < n; i++) {
        A[i] = (double *)malloc(n * sizeof(double));
    }

        double **Q = (double **)malloc(n * sizeof(double *));
    for (int i = 0; i < n; i++) {
        Q[i] = (double *)malloc(n * sizeof(double));
    }

        double **R = (double **)malloc(n * sizeof(double *));
    for (int i = 0; i < n; i++) {
        R[i] = (double *)malloc(n * sizeof(double));
    }

    generateSymmetricMatrix(A, n);
    printf("Matrice symétrique générée :\n");
    printMatrix(A, n);

    elementsToTridiagonalize(A,n);
    printf("\nmatrice tridiagonalisee \n");
    printMatrix(A, n);

    qrDecomposition(A,Q,R,n);

    // Libération de la mémoire
    for (int i = 0; i < n; i++) {
        free(A[i]);
    }
    free(A);

    return 0;
}