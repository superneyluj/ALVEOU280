#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <stdbool.h>

#define THRESHOLD 0.001

// Déclarations de fonctions
void generateSymmetricMatrix(double **matrix, int n);
void printMatrix(double **A, int n);
void elementsToTridiagonalize(double **matrix, int n);
void generateRotationMatrix(double **matrix, int n, int i, int j, double c, double s);
void applyRotation(double **A, double **S, int n);
void qrDecomposition(double **A, double **Q, double **R, int n);
void findEigenvaluesAndEigenvectors(double **A, double **eigenVectors, int n);


//Fonction qui génère une matrice symétrique
// avec i qui représente le nombre de lignes et j le nombre de colonnes
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

//Fonction qui print une matrice
void printMatrix(double **A, int n) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            printf("%8.4f ", A[i][j]);
        }
        printf("\n");
    }
}

//Fonction qui transforme une matrice en une matrice tridiagonale grâce à des rotations
void elementsToTridiagonalize(double **matrix, int n) {
    // Commencer par la première ligne
    for (int i = 0; i < n ; i++) { // Pas besoin d'aller jusqu'à la dernière ligne
        // Parcourir les éléments à partir de la fin de la ligne, à l'exception des éléments déjà sur les diagonales
        for (int j = n - 1; j > i + 1; j--) { // Commencer par le dernier élément et ignorer les 2 diagonales les plus proches

            //Le keyElement est l'élément à supprimer
            double keyElement = matrix[i][j];
            //Le pivotElement est l'élément qui va être utilisé pour supprimer le keyElement
            double pivotElement = matrix[i][j-1]; 
            //Le theta est l'angle de rotation, c et s sont les cosinus et sinus de l'angle qui vont être utilisés pour créer la matrice de rotation
            double theta = atan(keyElement/pivotElement);
            double c = cos(theta);
            double s = sin(theta);
            //Générer la matrice de rotation à laquelle on envoie la matrice
            //Et les indices du KeyElement et du PivotElement qui vont nous permettre de savoir sur quel plan on va effectuer la rotation
            //Le plan de rotation est dicté par les colonnes de la matrice
            //Exemple  : KeyElement = R[0][2] et PivotElement = R[0][1]
            //Donc plan de rotation (2,1)
            generateRotationMatrix(matrix, n, j, j-1, c, s);
        }
    }
}

//Fonction qui applique une rotation à une matrice
//Elle prend en argument la matrice d'entrée, et la matrice de rotation
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

//Fonction qui génère une matrice de rotation
void generateRotationMatrix(double **matrix, int n, int i, int j, double c, double s) {
    // Allocation de la matrice
    double **S = (double **)malloc(n * sizeof(double *));
    for (int i = 0; i < n; i++) {
        S[i] = (double *)malloc(n * sizeof(double));
    }
    //La matrice de rotation est une matrice identité
    for (int row = 0; row < n; row++) {
        for (int col = 0; col < n; col++) {
            if (row == col) S[row][col] = 1; // Éléments diagonaux
            else S[row][col] = 0; // Hors diagonale
        }
    }

    //On remplace les éléments dans la matrice de rotation
    S[i][i] = c; S[i][j] = s;
    S[j][i] = -s; S[j][j] = c;
    // Appliquer la rotation
    applyRotation(matrix, S, n);
}

//Fonction qui effectue la décomposition QR
void qrDecomposition(double **A, double **Q, double **R, int n) {
    // Initialiser R avec A
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            R[i][j] = A[i][j];
        }
    }
    
    // Initialiser Q avec la matrice identité
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            Q[i][j] = (i == j) ? 1.0 : 0.0;
        }
    }

    // Appliquer la décomposition QR avec des rotations de Givens
    for (int i = 1; i < n; i++) {

            //Le keyElement est l'élément à supprimer
            double keyElement = R[i][i-1];
            //Le pivotElement est l'élément qui va être utilisé pour supprimer le keyElement
            double pivotElement = R[i-1][i-1]; 
            double theta = atan(keyElement/pivotElement);
            double c = cos(theta);
            double s = sin(theta);

            // Initialisation de la matrice de rotation
            double **G = (double **)malloc(n * sizeof(double *));
            for (int i = 0; i < n; i++) {
                G[i] = (double *)malloc(n * sizeof(double));
            }
            
            // Initialisation de la matrice de rotation
            for (int row = 0; row < n; row++) {
                for (int col = 0; col < n; col++) {
                    if (row == col) G[row][col] = 1; 
                    else G[row][col] = 0; 
                }
            }  

            // Remplissage de la matrice de rotation
            //Contrairement à la matrice de rotation précédente, le plan de rotation est défini par les indices qui représentes les lignes de la matrice
            //Exemple : KeyElement = R[1][0] et PivotElement = R[0][0]
            //Donc rotation sur le plan (1,0)
            G[i-1][i-1] = c; 
            G[i][i] = c;
            G[i-1][i] = s; 
            G[i][i-1] = -s;


            // Initialisation de la matrice temporaire pour R
            double **temp = (double **)malloc(n * sizeof(double *));
            for (int i = 0; i < n; i++) {
                temp[i] = (double *)malloc(n * sizeof(double));
            }

            // Mise à jour de R avec G^T * R
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < n; j++) {
                    for (int k = 0; k < n; k++) {
                        temp[i][j] += G[i][k] * R[k][j]; 
                    }
                }
            }

            // Copiez le résultat de temp dans R
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


//Fonction qui trouve les valeurs propres et les vecteurs propres
void findEigenvaluesAndEigenvectors(double **A, double **eigenVectors, int n) {
    
    int iterations = 0;
    // Initialisation de Q et R
    double **Q = (double **)malloc(n * sizeof(double *));
    double **R = (double **)malloc(n * sizeof(double *));

    // Allocation de la mémoire pour Q et R
    for (int i = 0; i < n; i++) {
        Q[i] = (double *)malloc(n * sizeof(double));
        R[i] = (double *)malloc(n * sizeof(double));
        eigenVectors[i] = (double *)malloc(n * sizeof(double));
        for (int j = 0; j < n; j++) {
            Q[i][j] = (i == j) ? 1.0 : 0.0;
            eigenVectors[i][j]=(i==j)?1.0 : 0.0;
        }
    }

    // Itérer jusqu'à ce que la matrice A soit presque diagonale
    bool converged = false;
    while (!converged) {
        
        iterations++;
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

        // Allocation de la mémoire temporaires pour les vecteurs propres
        double **temp = (double **)malloc(n * sizeof(double *));
        for (int i = 0; i < n; i++) {
            temp[i] = (double *)calloc(n, sizeof(double));
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
    printf("\nIterations %d\n", iterations);
    /*printf("\n Valeurs propres : \n");
    printMatrix(A,n);
    printf("\nVecteurs propres\n");
    printMatrix(eigenVectors,n);*/
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

    int n = 64; // Taille de la matrice

    // Allocation de la matrice
    double **A = (double **)malloc(n * sizeof(double *));
    for (int i = 0; i < n; i++) {
        A[i] = (double *)malloc(n * sizeof(double));
    }

    double **eigenVectors = (double **)malloc(n * sizeof(double *));
    for (int i = 0; i < n; i++) {
        eigenVectors[i] = (double *)malloc(n * sizeof(double));
    }

    generateSymmetricMatrix(A, n);
    /*printf("Matrice symétrique générée :\n");
    printMatrix(A, n);*/

    elementsToTridiagonalize(A,n);

    findEigenvaluesAndEigenvectors(A,eigenVectors,n);

    // Libération de la mémoire
    for (int i = 0; i < n; i++) {
        free(A[i]);
    }
    free(A);

    // Libération de la mémoire
    for (int i = 0; i < n; i++) {
        free(eigenVectors[i]);
    }
    free(eigenVectors);

    return 0;
}
