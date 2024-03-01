#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <stdbool.h>

#define THRESHOLD 0.0000001

// Déclarations de fonctions
void generateSymmetricMatrix(double **matrix, int n);
void printMatrix(double **A, int n);
void convertToTridiagonal(double **matrix, int n);
void generateRotationMatrix(double **matrix, int n, int i, int j, double c, double s);
void applyRotation(double **A, double **S, int n);
void qrDecomposition(double **A, double **Q, double **R, int n);
void findEigenvaluesAndEigenvectors(double **A, double **eigenVectors, int n);

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

void convertToTridiagonal(double **A, int n) {
    // Commencer par la première ligne
    for (int i = 0; i < n ; i++) { // Pas besoin d'aller jusqu'à la dernière ligne
        // Parcourir les éléments à partir de la fin de la ligne, à l'exception des éléments déjà sur les diagonales
        for (int j = n - 1; j > i + 1; j--) { // Commencer par le dernier élément et ignorer les 2 diagonales les plus proches
            //Récupération de l'élément clé qui est l'élément de la matrice à supprimer
            double keyElement = A[i][j];
            //Récupération de l'élément pivot qui est l'élément de la matrice qui va être utilisé pour supprimer l'élément clé
            double pivotElement = A[i][j-1];
            //calcul de c et s
            double theta = atan(keyElement/pivotElement);
            double c = cos(theta);
            double s = sin(theta);

            // Allocation de la matrice de rotation
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

            applyRotation(A, S, n);

        }
    }
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

void qrDecomposition(double **A, double **Q, double **R, int n) {
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
            double keyElement = R[i][i-1];
            double pivotElement = R[i-1][i-1]; 
            double theta = atan(keyElement/pivotElement);
            double c = cos(theta);
            double s = sin(theta);

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
}

void findEigenvaluesAndEigenvectors(double **A, double **eigenVectors, int n) {
    double **Q = (double **)malloc(n * sizeof(double *));
    double **R = (double **)malloc(n * sizeof(double *));
    for (int i = 0; i < n; i++) {
        Q[i] = (double *)malloc(n * sizeof(double));
        R[i] = (double *)malloc(n * sizeof(double));
        eigenVectors[i] = (double *)malloc(n * sizeof(double));
        for (int j = 0; j < n; j++) {
            Q[i][j] = (i == j) ? 1.0 : 0.0;
            eigenVectors[i][j]=(i==j)?1.0 : 0.0;
        }
    }

    bool converged = false;
    while (!converged) {
        qrDecomposition(A, Q, R, n); // Utilisez votre fonction existante de décomposition QR
        // Reassemble A as R*Q
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                A[i][j] = 0.0;
                for (int k = 0; k < n; k++) {
                    A[i][j] += R[i][k] * Q[k][j];
                }
            }
        }

        // Vérifier la convergence
        converged = true;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (i != j && fabs(A[i][j]) > THRESHOLD) {
                    converged = false;
                    break;
                }
            }
            if (!converged) break;
        }
        // Accumuler les vecteurs propres
        double **temp = (double **)malloc(n * sizeof(double *));
        for (int i = 0; i < n; i++) {
            temp[i] = (double *)calloc(n, sizeof(double)); // Initialisez à 0 pour la multiplication
        }

        // Multiplication de matrices: temp = eigenVectors * Q
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                for (int k = 0; k < n; k++) {
                    temp[i][j] += eigenVectors[i][k] * Q[k][j];
                }
            }
        }

        // Copiez temp dans eigenVectors
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                eigenVectors[i][j] = temp[i][j];
            }
        }
    }

    printf("\n Valeurs propres : \n");
    printMatrix(A,n);
    printf("\nVecteurs propres\n");
    printMatrix(eigenVectors,n);
    // À ce stade, A est presque diagonale, et les valeurs sur la diagonale sont les valeurs propres
    // Les vecteurs propres sont accumulés dans la matrice que vous avez mise à jour à chaque itération

    // Libération de la mémoire pour Q et R
    for (int i = 0; i < n; i++) {
        free(Q[i]);
        free(R[i]);
    }
    free(Q);
    free(R);
}

int main() {

    int n = 3; // Taille de la matrice

    // Allocation de la matrice
    // i représente les lignes et j les colonnes
    double **A = (double **)malloc(n * sizeof(double *));
    for (int i = 0; i < n; i++) {
        A[i] = (double *)malloc(n * sizeof(double));
    }

    //Allocation de la matrice des vecteurs propres
    double **eigenVectors = (double **)malloc(n * sizeof(double *));
    for (int i = 0; i < n; i++) {
        eigenVectors[i] = (double *)malloc(n * sizeof(double));
    }

    //génération de la matrice symétrique
    generateSymmetricMatrix(A, n);

    //conversion de la matrice en tridiagonale
    convertToTridiagonal(A,n);
    printf("\nmatrice tridiagonalisee \n");
    printMatrix(A, n);

    //calcul des valeurs propres et des vecteurs propres
    findEigenvaluesAndEigenvectors(A,eigenVectors,n);

    // Libération de la mémoire
    for (int i = 0; i < n; i++) {
        free(A[i]);
    }
    free(A);

    return 0;
}
