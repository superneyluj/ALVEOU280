#include "utils.h"
#include "validation.h"
#include "matrix_algo.h"
#include "divide_and_conquer.h"

#include <stdio.h>

#define EPS 0.00000000000001

int main(int argc, char**argv)
{
    //Déclaration des variables
    // r : variable de retour
    // error_str : chaine de caractère pour stocker le message d'erreur
    // error_code : code d'erreur
    // T, Q, L, Q_t, tmp1, tmp2 : matrices
    int r;
    const char*error_str = NULL;
    int        error_code = 0;
    
    matrix_type_t T, Q, L, Q_t, tmp1, tmp2;

    //Récupération des arguments et du chemin du fichier où se trouve la matrice
    if (argc != 2) {
        printf("usage:   %s path/to/input/matrix\n", argv[0]);
        printf("example: %s data/in.mat\n", argv[0]);
        return -1;
    }

    //Lecture de la matrice
    T = read_matrix_from_file(argv[1]);
    if (T == NULL) {
        error_code = -2;
        error_str = "unable to read matrix from file";
        goto err0;
    }

    //Vérification si la matrice est carrée
    if (!matrix_is_square(T)) {
        error_code = -3;
        error_str = "matrix is not square";
        goto err1;
    }

    //vérification si la matrice est symétrique
    if (!matrix_is_symmetric(T, EPS)) {
        error_code = -4;
        error_str = "matrix is not symmetric";
        goto err1;
    }

    //vérification si la matrice est tridiagonale
    if (!matrix_is_tridiagonal(T, EPS)) {
        error_code = -5;
        error_str = "matrix is not tridiagonal";
        goto err1;
    }

    //Lancement de la fonction divide_and_conquer
    r = matrix_divide_and_conquer(T, &Q, &L, EPS);
    if (r) {
        error_code = r;
        error_str = "unable to run divide-and-conquer algorithm";
        goto err1;
    }

    //Affichage des résultats
    printf("\n");
    printf("in:\n");
    matrix_print(T, EPS);
    printf("Q:\n");
    matrix_print(Q, EPS);
    printf("L:\n");
    matrix_print(L, EPS);
    Q_t = matrix_transpose(Q);
    printf("Q t:\n");
    matrix_print(Q_t, EPS);
    printf("Q * L * Q t:\n");
    tmp1 = matrix_mul(Q, L);
    tmp2 = matrix_mul(tmp1, Q_t);
    matrix_print(tmp2, EPS);
    matrix_free(tmp1);
    matrix_free(tmp2);
    matrix_free(Q);
    matrix_free(L);
    matrix_free(Q_t);
    matrix_free(T);

    return 0;
 err1:
    matrix_free(T);
 err0:
    printf("error: %s\n", error_str);
    return error_code;
}
