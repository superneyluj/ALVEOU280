#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define DATA_SIZE 4096

void vector_add(int* in1, int* in2, int* out, int size) {
    for (int i = 0; i < size; i++) {
        out[i] = in1[i] + in2[i];
    }
}

int main() {
    int source_in1[DATA_SIZE];
    int source_in2[DATA_SIZE];
    int source_sw_results[DATA_SIZE];

    // Initialisation des données de test
    srand(time(NULL)); // Initialisation du générateur de nombres aléatoires
    for (int i = 0; i < DATA_SIZE; i++) {
        source_in1[i] = rand() % 100; // Générer un nombre aléatoire entre 0 et 99
        source_in2[i] = rand() % 100; // Générer un nombre aléatoire entre 0 et 99
    }

    // Mesurer le temps d'exécution de l'addition vectorielle
    clock_t start_time = clock();
    vector_add(source_in1, source_in2, source_sw_results, DATA_SIZE);
    clock_t end_time = clock();

    double time_taken = (double)(end_time - start_time) / CLOCKS_PER_SEC;
    printf("L'addition vectorielle a pris %f secondes.\n", time_taken);

    // Optionnel : Afficher les résultats pour vérifier la correction
    /* for (int i = 0; i < DATA_SIZE; i++) {
        printf("%d + %d = %d\n", source_in1[i], source_in2[i], source_sw_results[i]);
    } */

    return 0;
}
