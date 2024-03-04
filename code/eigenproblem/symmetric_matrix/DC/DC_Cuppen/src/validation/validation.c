#include "validation.h"
#include "macro.h"

#include <math.h>

__inline__ int matrix_is_square(const matrix_type_t mat)
{
    return (matrix_height(mat) == matrix_width(mat));
}

int matrix_is_symmetric(const matrix_type_t mat, long double eps)
{
    unsigned i, j;
    
    if (!matrix_is_square(mat)) {
        return 0;
    }

    for (i = 1; i <= matrix_height(mat); i++) {
        for (j = 1; j <= i; j++) {
            if (!are_equal(matrix_get(mat, i, j), matrix_get(mat, j, i))) {
                return 0;
            }
        }
    }

    return 1;
}

int matrix_is_tridiagonal(const matrix_type_t mat, long double eps)
{
    unsigned i, j;
    
    if (!matrix_is_square(mat)) {
        return 0;
    }

    for (i = 1; i <= matrix_height(mat); i++) {
        for (j = 1; j <= matrix_width(mat); j++) {
            long double cell = matrix_get(mat, i, j);
            if ((i == j) || (i - 1 == j) || (i + 1 == j)) {
                if (is_zero(cell)) {
                    return 0;
                }
            } else {
                if (!is_zero(cell)) {
                    return 0;
                }
            }
        }
    }

    return 1;
}
