#define _GNU_SOURCE

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <unistd.h>
#include <math.h>
#include <time.h>
#include <string.h>
#include <semaphore.h>
#include <mkl.h>
#include <pthread.h>
#include <sched.h>
#include <numa.h>



#define min(a,b) ((a)>(b)?(b):(a))
#define max(a,b) ((a)>(b)?(a):(b))

//#define PRINT_RESULT

#define SIZE_CACHE 6500000

bool withPrint = false;

//Definition des structures
typedef struct CheevParamThread CheevParamThread;

struct CheevParamThread {
	int index;
  	int n;
  	int ModeCheev;
  	int nb_matrix_thread;
};

//Definition des variables  globales
pthread_t *Cheev_Threads;
CheevParamThread *Cheev_Param_Threads;
sem_t *Cheev_Start;
sem_t *Cheev_Ready;
sem_t *Cheev_End;


//déclaration des matrices
MKL_Complex8 **h_A_Groups;
MKL_Complex8 **h_H_Groups;
MKL_Complex8 **h_Z_Groups; //Cheevr

float **h_W_Groups;
int Nb_Matrix_Thread;
int Nb_Threads;
int n;
int ModeCheev;
int NIter;

// Prototype de routines auxiliaires
static void _setMatrixRowMajor(int row, int col, MKL_Complex8* pA, const char* name, bool withPrint);
static void _refreshCache(float* pA);
void printMatrix(MKL_Complex8* matrix, int n);
void tempoConsole();


void *Thread_Cheev(void *param) {

	int cpt = 0;
	int info;
	float trace = 0.0;
	float traceMat = 0.0;

	CheevParamThread *paramThread = (CheevParamThread*) param;
	int indexThread = paramThread->index;
  	int local_n = paramThread->n;
  	int ModeCheev = paramThread->ModeCheev;
  	int nb_matrix_thread = paramThread->nb_matrix_thread;
  
  	int size_Matrix = local_n*local_n;
  	int size_Vector = local_n;
  	const float alpha = 1.0;
	const float beta = 0.0;
 
  	//Mesure de temps
  	struct timespec t0, t1, t2;

	double time = 0.0;
	double meanTime = 0.0;
  	int ret;
     
  	//Affinite CPU
  	cpu_set_t CPU_AFFINITY;		
  	CPU_ZERO (&CPU_AFFINITY);
	CPU_SET (indexThread*2, &CPU_AFFINITY);
	ret = sched_setaffinity(0, sizeof(CPU_AFFINITY), &CPU_AFFINITY);
	if( ret != 0 )
		printf("\nThread Cheev %d Error on setting CPU Affinity\n", indexThread);
	
  
	//Affichage commande 
	printf("\nIndex thread : %d / Nb_Matrix per thread : %d / Size Matrix : %dx%d / ModeCheev : %d\n", indexThread, nb_matrix_thread, local_n, local_n, ModeCheev);
	
	//Pointeur local pour chaque thread
	MKL_Complex8* local_h_A_Groups = (MKL_Complex8*)(h_A_Groups[indexThread]);
	local_h_A_Groups = (MKL_Complex8*)numa_alloc_onnode(nb_matrix_thread * size_Matrix * sizeof(MKL_Complex8), 0);
	
	MKL_Complex8* local_h_H_Groups = (MKL_Complex8*)(h_H_Groups[indexThread]);
	local_h_H_Groups = (MKL_Complex8*)numa_alloc_onnode(nb_matrix_thread * size_Matrix * sizeof(MKL_Complex8), 0);
	
	float* local_h_W_Groups = (float*)(h_W_Groups[indexThread]);
	//local_h_W_Groups = (float*)malloc(nb_matrix_thread * size_Vector * sizeof(float));
	local_h_W_Groups = (float*)numa_alloc_onnode(nb_matrix_thread * size_Vector * sizeof(float), 0);
  
	MKL_Complex8* local_h_Z_Groups;
	
	int *isuppz;
	
	
	if(ModeCheev == 2) {
		local_h_Z_Groups = (MKL_Complex8*)(h_Z_Groups[indexThread]);
		local_h_Z_Groups = (MKL_Complex8*)numa_alloc_onnode(nb_matrix_thread * size_Matrix * sizeof(MKL_Complex8), 0);
    	isuppz = (int*)numa_alloc_onnode(2 * local_n * sizeof(int), 0);
  }
  
  	//Vidage du cache
  	float *CacheBuffer = (float*)numa_alloc_onnode(SIZE_CACHE * sizeof(float), 0);

	//Espace de travail LAPACK Cheev
	MKL_Complex8 workOpt;
	MKL_Complex8 *work;

	float rworkOpt;
	float *rwork;

	int iworkOpt;
	int *iwork;

	int lwork=-1;
	int lrwork=-1;
	int liwork=-1;
 
	float abstol, vl, vu;
	vl = -5.0;
	vu = 5.0;
	int il, iu;
	abstol = -1.0;
	int eig_founds;

	if(ModeCheev == 0) {

		rwork = (float*)numa_alloc_onnode((3*local_n-2)*sizeof(float), 0);
	  	cheev("Vectors", "Upper", &local_n, local_h_H_Groups , &local_n, local_h_W_Groups, &workOpt, &lwork, rwork, &info);
	  	lwork = (int)workOpt.real;
    	work = (MKL_Complex8*)numa_alloc_onnode(lwork * sizeof(MKL_Complex8), 0);

	}else if(ModeCheev == 1) {

	  	cheevd("Vectors", "Upper", &local_n, local_h_H_Groups , &local_n, local_h_W_Groups, &workOpt, &lwork, &rworkOpt, &lrwork, &iworkOpt, &liwork, &info);
	  	lwork = (int)workOpt.real;
    	work = (MKL_Complex8*)numa_alloc_onnode(lwork * sizeof(MKL_Complex8), 0);
	  	lrwork = (int) rworkOpt;
    	rwork = (float*)numa_alloc_onnode(lrwork * sizeof(float), 0);
	  	liwork = iworkOpt;
    	iwork = (int*)numa_alloc_onnode(liwork * sizeof(int), 0);

	}else if(ModeCheev == 2) {

    cheevr("Vectors", "All", "Upper", &local_n, local_h_H_Groups, &local_n, &vl, &vu, &il, &iu, &abstol, &eig_founds, local_h_W_Groups, local_h_Z_Groups, &local_n, isuppz, &workOpt, &lwork, &rworkOpt, &lrwork, &iworkOpt, &liwork, &info);
	lwork = (int)workOpt.real;
	work = (MKL_Complex8*)malloc(lwork * sizeof(MKL_Complex8));
	lrwork = (int) rworkOpt;
	rwork = (float*)malloc(lrwork * sizeof(float));
	liwork = iworkOpt;
	iwork = (int*)malloc(liwork * sizeof(int));
	}
 
  	//Attente synchro main
  	//sem_wait
  
  
  	while(cpt < NIter) {
  
    //Initialisation Matrice A pour Cherk
	//Une matrice aléatoire sera crée : local_h_A_Groups
	//Et nous aurons une matrice hermitienne en sortie : local_h_H_Groups
    for(int i=0; i < nb_matrix_thread; i++) {
      	_setMatrixRowMajor( local_n, local_n, local_h_A_Groups+(i*size_Matrix), "h_A", withPrint);
      	cblas_cherk(CblasColMajor, CblasUpper, CblasConjTrans, local_n, local_n, alpha, local_h_A_Groups+(i*size_Matrix), local_n, beta, local_h_H_Groups+(i*size_Matrix), local_n);
		printf("Matrice de sortie #%d:\n", i+1);
    	printMatrix(local_h_H_Groups+(i*size_Matrix), local_n);
    }

    //Refresh du cache
    _refreshCache(CacheBuffer);
    
    //Fin d'initialisation thread
    sem_post(&Cheev_Ready[indexThread]);
    
    //Attente synchro
    sem_wait(&Cheev_Start[indexThread]);
    
    //Début de mesure de temps
    clock_gettime(CLOCK_REALTIME, &t0);
    
    for(int i=0; i < nb_matrix_thread; i++) {
    
      if (ModeCheev == 0) {
			cheev("Vectors", "Upper", &local_n, (local_h_H_Groups + (i*size_Matrix)), &local_n, (local_h_W_Groups+ (i*size_Vector)), work, &lwork, rwork, &info);
		  }else if (ModeCheev == 1) {
			cheevd("Vectors", "Upper", &local_n, (local_h_H_Groups + (i*size_Matrix)), &local_n, (local_h_W_Groups+ (i*size_Vector)), work, &lwork, rwork, &lrwork, iwork, &liwork, &info);
		  }else if (ModeCheev == 2) {
        cheevr("Vectors", "All", "Upper", &local_n, (local_h_H_Groups + (i*size_Matrix)), &local_n, &vl, &vu, &il, &iu, &abstol, &eig_founds, (local_h_W_Groups + (i*size_Vector)), (local_h_Z_Groups + (i*size_Matrix)), &local_n, isuppz, work, &lwork, rwork, &lrwork, iwork, &liwork, &info);
         if( info > 0 ) {
            printf( "The algorithm failed to compute eigenvalues.\n" );       
        } 
      }       
    }
    
    //Fin de mesure de temps
    clock_gettime(CLOCK_REALTIME, &t1);
    
    time += ((t1.tv_sec * 1e9 + ((float)t1.tv_nsec)) - (t0.tv_sec * 1e9 + ((float)t0.tv_nsec)));
    
    cpt++;
  }
  
  	//Affichage temps d'execution
  	time = time / (double)(NIter*1000000);

	printf("Thread %d => MKL_Cheev Execution time of %d Matrix : %lf ms \n", indexThread, nb_matrix_thread, time);
	return NULL;
}

//Main program
int main(int argc, char * argv[])
{

	//Initialisation des parametres
 	n = 1;
  	Nb_Threads = 1;
  	Nb_Matrix_Thread = 1;
	ModeCheev = 1;
	NIter = 1;
  	int i = 0;
  	int cpt = 0;

 
  	printf("\n\n************* MKL_Cheev n : %d / Number_threads : %d / Number Matrix per thread : %d  / ModeCheev : %d (0: Cheev / 1: Cheevd / 2: Cheevr / 3: Cheevx ) / NIter %d *************\n\n\n\n", n, Nb_Threads, Nb_Matrix_Thread, ModeCheev, NIter);

	//*******************************************Algorithme Cheevd Lapack****************************************//

  	//Allocation du tableau/Parametre des petits threads Cheev
	Cheev_Threads = (pthread_t*)malloc(Nb_Threads*sizeof(pthread_t));
	Cheev_Param_Threads = (CheevParamThread*)malloc(Nb_Threads*sizeof(CheevParamThread));

	for(i=0; i<Nb_Threads; i++) {
		Cheev_Param_Threads[i].index = i;
    	Cheev_Param_Threads[i].n = n;
    	Cheev_Param_Threads[i].ModeCheev = ModeCheev;
    	Cheev_Param_Threads[i].nb_matrix_thread = Nb_Matrix_Thread;
  	}
  

	Cheev_Start = (sem_t*)malloc(Nb_Threads*sizeof(sem_t));
	Cheev_Ready = (sem_t*)malloc(Nb_Threads*sizeof(sem_t));
	Cheev_End = (sem_t*)malloc(Nb_Threads*sizeof(sem_t));

	for(i=0; i<Nb_Threads; i++){
		sem_init(&Cheev_Start[i], 0, 0);
		sem_init(&Cheev_Ready[i], 0, 0);
		sem_init(&Cheev_End[i], 0, 0);
	}
	
	//Allocation memoire
	h_A_Groups = (MKL_Complex8**)numa_alloc_onnode(Nb_Threads * sizeof(MKL_Complex8*), 0);
	h_H_Groups = (MKL_Complex8**)numa_alloc_onnode(Nb_Threads * sizeof(MKL_Complex8*), 0);
	h_W_Groups = (float**)numa_alloc_onnode(Nb_Threads * sizeof(float*), 0);
  
  	if(ModeCheev == 2){
		h_Z_Groups = (MKL_Complex8**)malloc(Nb_Threads * sizeof(MKL_Complex8*));
	}
    
	//Lancement des threads
	for(i=0; i < Nb_Threads; i++) {
			pthread_create(&Cheev_Threads[i], NULL, &Thread_Cheev, (void*)(&Cheev_Param_Threads[i]));
	}
  
  	//Attente initialisation pour lancer l'execution cheev des threads
 	while(cpt < NIter) {
  
		for(i=0; i < Nb_Threads; i++){
			sem_wait(&Cheev_Ready[i]);
		}

		sleep(1);
		
		for(i=0; i < Nb_Threads; i++){
			sem_post(&Cheev_Start[i]);
		}

		cpt++;
  	}
  
  
  	//Attente join des threads
	for(i=0; i < Nb_Threads; i++){
			pthread_join(Cheev_Threads[i], NULL);
	}

	numa_free(h_A_Groups);
	numa_free(h_H_Groups);
	numa_free(h_W_Groups);

	free(Cheev_Start);
	free(Cheev_Ready);
	free(Cheev_End);

  	printf("\nMKL Cheev end of benchmarks\n");
  	return 0;
}


static void _setMatrixRowMajor(int row, int col, MKL_Complex8* pA, const char* name, bool withPrint){

	for (int iRow = 0; iRow < row; iRow++){
		for (int jCol = 0; jCol < col; jCol++){
			float real = rand() % 100;
			float imag = rand() % 100;
			pA[jCol + iRow*col].real = real;
			pA[jCol + iRow*col].imag = imag;
		}
	}

	printf("La matrice d'entree generee aleatoirement : ");
	for (int iRow = 0; iRow < row; iRow++){
		for (int jCol = 0; jCol < col; jCol++){
			printf("%5.2f+%5.2fi",pA[jCol + iRow*col].real, pA[jCol + iRow*col].imag );
			printf("\n");
		}
	}
}


static void _refreshCache(float* pA){

	for (int i = 0; i < SIZE_CACHE; i++){
		pA[i]= i;
	}
}


void printMatrix(MKL_Complex8* matrix, int n) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            if (j < i) {
                // Pour une matrice hermitienne, affichez uniquement la partie supérieure.
                printf("       *        "); // Utilisez des espaces pour les éléments non affichés.
            } else {
                printf("(%6.2f,%6.2f) ", matrix[i*n + j].real, matrix[i*n + j].imag);
            }
        }
        printf("\n");
    }
}

