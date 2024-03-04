#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <stdbool.h>


bool checkOffDiagonal(double **matrix, int n, double threshold);
void identificationElementDiag(double **matrix, int n);
void generateSymmetricMatrix(double **matrix, int n);
void printMatrix(double **A, int n);
void elementsToDiagonalize(double **matrix, int n);
void findMaxOffDiagonal(double **matrix, int *p, int *q, double *maxVal, int n);
void jacobiDiag(double **matrix, double **eigenVectors, int n, double threshold);

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
    //printf("\nmatrice après rotation :\n");
    //printMatrix(A,n);
}

void generateRotationMatrix(double **matrix,double** eigenVectors, int n, int p, int q,double theta) {
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
    S[p][p] = cos(theta);
    S[q][q] = cos(theta);
    S[p][q] = sin(theta); 
    S[q][p] = -sin(theta);
    //f("\n Matrice de rotation G[%d][%d]\n",p,q);
    // Appliquer la rotation
    //printf("\nmatrice de rotation :\n");
    //printMatrix(S,n);
    
    double **temp_eigenVectors = (double **)malloc(n * sizeof(double *));
    for (int i = 0; i < n; i++) {
        temp_eigenVectors[i] = (double *)malloc(n * sizeof(double));
    }

    // Copier P dans temp
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            temp_eigenVectors[i][j] = eigenVectors[i][j];
        }
    }

    // Calculer temp*S et stocker le résultat dans P
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            eigenVectors[i][j] = 0; // Réinitialiser P pour le résultat
            for (int k = 0; k < n; k++) {
                eigenVectors[i][j] += temp_eigenVectors[i][k] * S[k][j];
            }
        }
    }

    applyRotation(matrix, S, n);    
}


bool checkOffDiagonal(double **matrix,int n, double threshold){
    int i,j;
    for(i = 0; i < n ; i++){
        for( j = 0 ; j < n ; j++){
            if(i!=j && fabs(matrix[i][j])>threshold){
                //printf("\ncheck valeur : %8.4f\n",matrix[i][j]);
                return true;
            }      
        }
    }
    //printf("\n-----------------------ok--------------------------\n");
    return false;
}

void identificationElementDiag(double **matrix, int n){
    //printf("\nElements a annuler pour rendre la matrice diagonale :\n");
    for (int i = 0; i < n ; i++){
        for( int j = n-1 ; j >i  ; j--){
                //printf("\n Element a annuler : matrice [%d][%d]=%8.4f\n",i,j,matrix[i][j]);
        }
    }
}

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
            printf("%.2f ", A[i][j]);
        }
        printf("\n");
    }
}


void findMaxOffDiagonal(double **matrix, int *p, int *q, double *maxVal, int n){
    *maxVal = 0;
    for(int i = 0; i < n; i++){
        for (int j = 0; j < n; j++){
            if(i!=j){
                double absVal = fabs(matrix[i][j]);
                if(absVal > *maxVal){
                    *maxVal = absVal;
                    *p = i;
                    *q = j;
                }
            }
        } 
    }
}


void jacobiDiag(double **matrix,double **eigenVectors,int n, double threshold){
    int iterations = 0;
    while(checkOffDiagonal(matrix,n,threshold)){
        iterations++;
        int p,q; //indice de l'element le plus grand hors diagonale
        double maxVal;
        findMaxOffDiagonal(matrix, &p, &q, &maxVal,n);
        //printf("Element le plus grand hors diagonale : %8.4f ",maxVal);
        
        double theta;
        if(matrix[p][p]==matrix[q][q]){
            theta = M_PI/4;
        }else{
            double tan2theta = 2.0 * matrix[p][q]/(matrix[q][q]-matrix[p][p]);
            theta = atan(tan2theta) / 2.0;
        }
        //printf("\n theta = %8.4f\n",theta);
        generateRotationMatrix(matrix,eigenVectors,n,p,q,theta);
    }
    printf("\nNombre d'itérations : %d\n",iterations);
}


int main() {

    int n = 128; // Taille de la matrice
    double threshold = 0.0000001;

    // Allocation de la matrice
    double **A = (double **)malloc(n * sizeof(double *));
    for (int i = 0; i < n; i++) {
        A[i] = (double *)malloc(n * sizeof(double));
    }

    double **P = (double **)malloc(n * sizeof(double *));
    for (int i = 0; i < n; i++) {
        P[i] = (double *)malloc(n * sizeof(double));
    }
    for (int row = 0; row < n; row++) {
        for (int col = 0; col < n; col++) {
            if (row == col) P[row][col] = 1; // Éléments diagonaux
            else P[row][col] = 0; // Hors diagonale
        }
    }

    generateSymmetricMatrix(A, n);
    //printf("Matrice symétrique générée :\n");
    //printMatrix(A, n);


    identificationElementDiag(A,n);
    jacobiDiag(A,P,n,threshold);
    //printf("\nmatrice diagonalisee \n");
    //printMatrix(A, n);
    //printf("\nvecteurs propres\n");
    //printMatrix(P, n);

    // Libération de la mémoire
    for (int i = 0; i < n; i++) {
        free(A[i]);
    }
    free(A);

    return 0;
}