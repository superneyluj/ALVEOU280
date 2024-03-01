#include <stdio.h>
#include <math.h>

void printMatrix(double A[3][3], int size) {
    for(int i = 0; i < size; i++) {
        for(int j = 0; j < size; j++) {
            printf("%f ", A[i][j]);
        }
        printf("\n");
    }
}

void householderTransformation(double A[3][3], int size) {
    double x[2] = {A[1][0], A[2][0]};
    double norm_x = sqrt(x[0]*x[0] + x[1]*x[1]);
    double v[2] = {x[0] + norm_x, x[1]};
    double norm_v = sqrt(v[0]*v[0] + v[1]*v[1]);
    double u[2] = {v[0] / norm_v, v[1] / norm_v};

    double H[3][3] = {
        {1.0, 0.0, 0.0},
        {0.0, 1 - 2*u[0]*u[0], -2*u[0]*u[1]},
        {0.0, -2*u[0]*u[1], 1 - 2*u[1]*u[1]}
    };

    double temp[3][3] = {0};

    // H*A
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            for (int k = 0; k < size; k++) {
                temp[i][j] += H[i][k] * A[k][j];
            }
        }
    }

    // Reset A to 0
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            A[i][j] = 0;
        }
    }

    // H*A*H'
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            for (int k = 0; k < size; k++) {
                A[i][j] += temp[i][k] * H[k][j];
            }
        }
    }
}

int main() {
    double A[3][3] = {
        {4.0, 1.0, 2.0},
        {1.0, 3.0, -1.0},
        {2.0, -1.0, 1.0}
    };

    printf("Original Matrix:\n");
    printMatrix(A, 3);

    householderTransformation(A, 3);

    printf("Tridiagonal Matrix:\n");
    printMatrix(A, 3);

    return 0;
}
