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
extern void print_matrix_RowMajor(char* desc, MKL_INT m, MKL_INT n, MKL_Complex8* a);
extern void print_rmatrix(char* desc, MKL_INT m, MKL_INT n, float* a, MKL_INT lda);
static void fprintf_matrixRowMajor(MKL_Complex8* A, int row, int col, const char* name, bool withPrint);
static void _setMatrixRowMajor(int row, int col, MKL_Complex8* pA, const char* name, bool withPrint);
static void _refreshCache(float* pA);
extern void printEigen(char* desc, float* S, int m);
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
 
  //Priorit� Temps-Reel
/*
  struct sched_param param_rt;   
  int max_priority = sched_get_priority_max(SCHED_RR);
  param_rt.sched_priority = max_priority;
  ret = sched_setscheduler(0, SCHED_RR, &param_rt);
  if( ret != 0 )
    printf("\nThread Cheev %d Error on setting priority\n", indexThread);
*/    
    
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
  //local_h_A_Groups = (MKL_Complex8*)malloc(nb_matrix_thread * size_Matrix * sizeof(MKL_Complex8));
  local_h_A_Groups = (MKL_Complex8*)numa_alloc_onnode(nb_matrix_thread * size_Matrix * sizeof(MKL_Complex8), 0);
  
  MKL_Complex8* local_h_H_Groups = (MKL_Complex8*)(h_H_Groups[indexThread]);
  //local_h_H_Groups = (MKL_Complex8*)malloc(nb_matrix_thread * size_Matrix * sizeof(MKL_Complex8));
  local_h_H_Groups = (MKL_Complex8*)numa_alloc_onnode(nb_matrix_thread * size_Matrix * sizeof(MKL_Complex8), 0);
  
  float* local_h_W_Groups = (float*)(h_W_Groups[indexThread]);
  //local_h_W_Groups = (float*)malloc(nb_matrix_thread * size_Vector * sizeof(float));
  local_h_W_Groups = (float*)numa_alloc_onnode(nb_matrix_thread * size_Vector * sizeof(float), 0);
  
  MKL_Complex8* local_h_Z_Groups;
  
  int *isuppz;
  
  
  if(ModeCheev == 2) {
    local_h_Z_Groups = (MKL_Complex8*)(h_Z_Groups[indexThread]);
    //local_h_Z_Groups = (MKL_Complex8*)malloc(nb_matrix_thread * size_Matrix * sizeof(MKL_Complex8));
    local_h_Z_Groups = (MKL_Complex8*)numa_alloc_onnode(nb_matrix_thread * size_Matrix * sizeof(MKL_Complex8), 0);
    
    //isuppz = (int*)malloc(2 * local_n * sizeof(int));
    isuppz = (int*)numa_alloc_onnode(2 * local_n * sizeof(int), 0);
  }
  
  //Vidage du cache
  //float *CacheBuffer = (float*)malloc(SIZE_CACHE * sizeof(float));
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

	  //rwork = (float*)malloc((3*local_n-2)*sizeof(float));
    rwork = (float*)numa_alloc_onnode((3*local_n-2)*sizeof(float), 0);
	  cheev("Vectors", "Upper", &local_n, local_h_H_Groups , &local_n, local_h_W_Groups, &workOpt, &lwork, rwork, &info);
	  lwork = (int)workOpt.real;

	  //work = (MKL_Complex8*)malloc(lwork * sizeof(MKL_Complex8));
    work = (MKL_Complex8*)numa_alloc_onnode(lwork * sizeof(MKL_Complex8), 0);

	}else if(ModeCheev == 1) {

	  cheevd("Vectors", "Upper", &local_n, local_h_H_Groups , &local_n, local_h_W_Groups, &workOpt, &lwork, &rworkOpt, &lrwork, &iworkOpt, &liwork, &info);

	  lwork = (int)workOpt.real;
	  //work = (MKL_Complex8*)malloc(lwork * sizeof(MKL_Complex8));
    work = (MKL_Complex8*)numa_alloc_onnode(lwork * sizeof(MKL_Complex8), 0);

	  lrwork = (int) rworkOpt;
	  //rwork = (float*)malloc(lrwork * sizeof(float));
    rwork = (float*)numa_alloc_onnode(lrwork * sizeof(float), 0);

	  liwork = iworkOpt;
	  //iwork = (int*)malloc(liwork * sizeof(int));
    iwork = (int*)numa_alloc_onnode(liwork * sizeof(int), 0);

	}else if(ModeCheev == 2) {

    cheevr("Vectors", "All", "Upper", &local_n, local_h_H_Groups, &local_n, &vl, &vu, &il, &iu, &abstol, &eig_founds, local_h_W_Groups, local_h_Z_Groups, &local_n, isuppz, &workOpt, &lwork, &rworkOpt, &lrwork, &iworkOpt, &liwork, &info);
	  
   //cheevr( "Vectors", "Values", "Lower", &n, a, &lda, &vl, &vu, &il, &iu, &abstol, &m, w, z, &ldz, isuppz, work, &lwork, rwork, &lrwork, iwork, &liwork, &info );

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
    for(int i=0; i < nb_matrix_thread; i++) {
      _setMatrixRowMajor( local_n, local_n, local_h_A_Groups+(i*size_Matrix), "h_A", withPrint);
      cblas_cherk(CblasColMajor, CblasUpper, CblasConjTrans, local_n, local_n, alpha, local_h_A_Groups+(i*size_Matrix), local_n, beta, local_h_H_Groups+(i*size_Matrix), local_n);
    }
    
    //Refresh du cache
    _refreshCache(CacheBuffer);
    
    //Fin d'initialisation thread
    sem_post(&Cheev_Ready[indexThread]);
    
    //Attente synchro
    sem_wait(&Cheev_Start[indexThread]);
    
    //D�but de mesure de temps
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
  /**********************************/
  
  

  /*
	while (1) {

		//En attente du post Sémaphore du Thread_Control_Cheev
		sem_wait(OMSVD_Sem_Cheevs_in+ indexThread);

		//printf("\nCalcul LAPACK Cheev....\n");
		if (OMSVD_ModeCheev == 0){
		//info = LAPACKE_cheev(LAPACK_COL_MAJOR, 'V', 'U', OMSVD_n, OMSVD_h_H_Groups + (indexThread*OMSVD_sizeMatriceH) , OMSVD_n, OMSVD_h_W_Groups+ (indexThread*OMSVD_sizeVecteurW) ); //+ (compteur_cycles*OMSVD_nbCore*OMSVD_sizeMatriceH) ;;; +(compteur_cycles*OMSVD_nbCore*OMSVD_sizeVecteurW)
			cheev("Vectors", "Upper", &n, (OMSVD_h_H_Groups + (indexThread*OMSVD_sizeMatriceH)), &OMSVD_n, (OMSVD_h_W_Groups+ (indexThread*OMSVD_sizeVecteurW)), work, &lwork, rwork, &info);
		}else if (OMSVD_ModeCheev == 1){
			//info = LAPACKE_cheevd(LAPACK_COL_MAJOR, 'V', 'U', OMSVD_n, OMSVD_h_H_Groups + (indexThread*OMSVD_sizeMatriceH) , OMSVD_n, OMSVD_h_W_Groups+ (indexThread*OMSVD_sizeVecteurW) ); //+ (compteur_cycles*OMSVD_nbCore*OMSVD_sizeMatriceH) ;;; +(compteur_cycles*OMSVD_nbCore*OMSVD_sizeVecteurW)
			cheevd("Vectors", "Upper", &n, (OMSVD_h_H_Groups + (indexThread*OMSVD_sizeMatriceH)), &OMSVD_n, (OMSVD_h_W_Groups+ (indexThread*OMSVD_sizeVecteurW)), work, &lwork, rwork, &lrwork, iwork, &liwork, &info);
		}
		if(info != 0) printf("\n\n\n\n\n************************ERRRRRRRRROOOOOOOOOOOOOOOORRRRRRRRRRRRR Cheev\n\n\n\n\n\n");




		//printf("\nTrace = %f \n", trace);
		//printf("\nTraceMat = %f \n", traceMat);
		//info = LAPACKE_cheev(LAPACK_COL_MAJOR, 'V', 'U', OMSVD_n, OMSVD_h_H_Groups + (indexThread*OMSVD_sizeMatriceH) , OMSVD_n, OMSVD_h_W_Groups+ (indexThread*OMSVD_sizeVecteurW) ); //+ (compteur_cycles*OMSVD_nbCore*OMSVD_sizeMatriceH) ;;; +(compteur_cycles*OMSVD_nbCore*OMSVD_sizeVecteurW)

		sem_post(OMSVD_Sem_Cheevs_out+ indexThread);
		compteur_cycles++;


		if(compteur_cycles == (OMSVD_nbCycle-1)) {
			compteur_cycles = 0;
		}

	}
 
 
  */

	return NULL;
 
 
}













//Main program
int main(int argc, char * argv[])
{

	//Initialisation des parametres
	n = 3;
  Nb_Threads = 1;
  Nb_Matrix_Thread = 1;
  ModeCheev = 1;
	NIter = 1;
  int i = 0;
  int cpt = 0;

	//Arguments Ligne de commande
	for (int i = 1; i < argc; i++)
	{

		if (strcmp("-n", argv[i]) == 0)
		{
			i++;
			n = atoi(argv[i]);
			i++;
		}


		if (strcmp("-threads", argv[i]) == 0)
		{
			i++;
			Nb_Threads = atoi(argv[i]);
			i++;
		}
   
    if (strcmp("-matrix_per_threads", argv[i]) == 0)
		{
			i++;
			Nb_Matrix_Thread = atoi(argv[i]);
			i++;
		}
    
    if (strcmp("-modeCheev", argv[i]) == 0)
		{
			i++;
			ModeCheev = atoi(argv[i]);
			i++;
		}
    
		if (strcmp("-NIter", argv[i]) == 0)
		{
			i++;
			NIter = atoi(argv[i]);

		}
   
    if (strcmp("-h", argv[i]) == 0)
		{
			printf("\n./MKL_Cheev -n -threads -matrix_per_threads -modeCheev -NIter \n");
      return 0;
		}
		i = argc;

	}
 
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
 
  //Allocation m�moire
  //h_A_Groups = (MKL_Complex8**)malloc(Nb_Threads * sizeof(MKL_Complex8*));
  //h_H_Groups = (MKL_Complex8**)malloc(Nb_Threads * sizeof(MKL_Complex8*));
  //h_W_Groups = (float**)malloc(Nb_Threads * sizeof(float*));
  
  h_A_Groups = (MKL_Complex8**)numa_alloc_onnode(Nb_Threads * sizeof(MKL_Complex8*), 0);
  h_H_Groups = (MKL_Complex8**)numa_alloc_onnode(Nb_Threads * sizeof(MKL_Complex8*), 0);
  h_W_Groups = (float**)numa_alloc_onnode(Nb_Threads * sizeof(float*), 0);
  
  if(ModeCheev == 2)
    h_Z_Groups = (MKL_Complex8**)malloc(Nb_Threads * sizeof(MKL_Complex8*));
  
  //Lancement des threads
  for(i=0; i < Nb_Threads; i++) {
		pthread_create(&Cheev_Threads[i], NULL, &Thread_Cheev, (void*)(&Cheev_Param_Threads[i]));
  }
  
  //Attente initialisation pour lancer l'execution cheev des threads
  
  while(cpt < NIter) {
  
    for(i=0; i < Nb_Threads; i++)
      sem_wait(&Cheev_Ready[i]);
      
    sleep(1);
    
    for(i=0; i < Nb_Threads; i++)
      sem_post(&Cheev_Start[i]);

    cpt++;
  
  }
  
  
  //Attente join des threads
  for(i=0; i < Nb_Threads; i++) {
		pthread_join(Cheev_Threads[i], NULL);
  }
  
  
  printf("\nMKL Cheev end of benchmarks\n");
  

/*

	MKL_INT info;
	int i, j;

	// Local arrays
	int lda = max(1, m);
	const float alpha = 1.0;
	const float beta = 0.0;


	MKL_Complex8 *a = (MKL_Complex8*)malloc(m*m * sizeof(MKL_Complex8));
	MKL_Complex8 *h = (MKL_Complex8*)malloc(m*m * sizeof(MKL_Complex8));
	float *CacheBuffer = (float*)malloc(SIZE_CACHE * sizeof(float));


	float *s = (float*)malloc(m * sizeof(float));

	//Number of threads
	mkl_set_num_threads(num_threads);

	//Initialisation time

	struct timespec t0, t1, t2, t3, t4, t5, t6;
	clock_t startTime, endTime;

	double time = 0.0;
	double meanTime = 0.0;
	double cpu_time_result = 0.0;


	// Compute SVD
	for (int k = 0; k < NIter; k++)
	{


		if (m == 4)
		{
			a[0].real = 30.0f;    a[0].imag = 0.0f;  a[1].real = 70.0f;    a[1].imag = 0.0f;   a[2].real = 110.0f;    a[2].imag = 0.0f;	a[3].real = 150.0f;    a[3].imag = 0.0f;
			a[4].real = 70.0f;    a[4].imag = 0.0f;  a[5].real = 174.0f;    a[5].imag = 0.0f;   a[6].real = 278.0f;    a[6].imag = 0.0f;	a[7].real = 382.0f;    a[7].imag = 0.0f;
			a[8].real = 110.0f;    a[8].imag = 0.0f;  a[9].real = 278.0f;    a[9].imag = 0.0f;   a[10].real = 446.0f;   a[10].imag = 0.0f;	a[11].real = 614.0f;   a[11].imag = 0.0f;
			a[12].real = 150.0f;  a[12].imag = 0.0f;  a[13].real = 382.0f;  a[13].imag = 0.0f;  a[14].real = 614.0f;   a[14].imag = 0.0f;	a[15].real = 846.0f;   a[15].imag = 0.0f;

		}
		else _setMatrixRowMajor(m,m,a,"h_A",withPrint);

		//Rendre la matrice Hermitienne
		cblas_cherk(CblasRowMajor, CblasUpper, CblasConjTrans, m, m, alpha, a, m, beta, h, m);
		//Refresh du cache
		_refreshCache(CacheBuffer);


#ifdef PRINT_RESULT
		if (NIter == 1) 	print_matrix_RowMajor("h_A", m, m, a);
#endif


		clock_gettime(CLOCK_REALTIME, &t1);
		startTime = clock();

		//usleep(3000);
		info = LAPACKE_cheevd(LAPACK_ROW_MAJOR, 'V', 'U', m, h, lda, s);

		clock_gettime(CLOCK_REALTIME, &t2);
		endTime = clock();

		// Check for convergence
		if (info > 0) {
			printf("MKL => LAPACKE_cheev : The algorithm computing SVD failed to converge.\n");
			exit(1);
		}

		// Temps execution
		cpu_time_result += (double)(endTime - startTime);
		time += ((t2.tv_sec * 1e9 + ((float)t2.tv_nsec)) - (t1.tv_sec * 1e9 + ((float)t1.tv_nsec)));


	}

	// Temps d'execution

	double coeftime = (1000000 / CLOCKS_PER_SEC) / NIter;
	cpu_time_result = cpu_time_result * coeftime;
	time = time / (double)(NIter*1000);

	//Affichage Temps execution

	//printf(" Execution CPU TIME with clock_t : %lf microseconds Cheev m:%d n:%d\n", cpu_time_result, m, n);
	printf(" Execution CPU TIME with clock_gettime() : %lf microseconds Cheev m:%d n:%d\n", time, m, n);

	//Affichage Resultat

#ifdef PRINT_RESULT
	print_matrix_RowMajor("h_A", m, m, a);
	printEigen("h_S", s, m);
#endif

	//Liberer la mémoire
	free(a);
	free(h);
	free(s);
	free(CacheBuffer);
*/
  
  return 0;


}




void print_matrix_RowMajor(char* desc, MKL_INT m, MKL_INT n, MKL_Complex8* a) {
	MKL_INT i, j;
	printf("\n %s\n", desc);
	for (i = 0; i < m; i++) {
		for (j = 0; j < n; j++)
			printf(" (%6.2f,%6.2f)", a[i*n + j].real, a[i*n + j].imag);
		printf("\n");
	}
}


void print_rmatrix(char* desc, MKL_INT m, MKL_INT n, float* a, MKL_INT lda) {
	MKL_INT i, j;
	printf("\n %s\n", desc);
	for (i = 0; i < m; i++) {
		for (j = 0; j < n; j++) printf(" %6.2f", a[i*lda + j]);
		printf("\n");
	}
}

/*
static void fprintf_matrixRowMajor(MKL_Complex8* A, int row, int col, const char* name, bool withPrint)
{
	if (withPrint == true)
	{
		fstream outfile;
		outfile.open(name, ios::out);
		outfile.setf(std::ios_base::left, std::ios_base::basefield);

		for (int iRow = 0; iRow < row; iRow++)
		{
			for (int jCol = 0; jCol < col; jCol++)
				outfile << A[jCol + iRow*col].real << " " << A[iRow*col + jCol].imag << " ";
			outfile << endl;
		}

		outfile.close();
	}
}
*/

static void _setMatrixRowMajor(int row, int col, MKL_Complex8* pA, const char* name, bool withPrint)
{

		//srand(static_cast<unsigned>(time(0)));

		for (int iRow = 0; iRow < row; iRow++)
		{
			for (int jCol = 0; jCol < col; jCol++)
			{
				float real = rand() % 100;
				float imag = rand() % 100;
				pA[jCol + iRow*col].real = real;
				pA[jCol + iRow*col].imag = imag;

			}
		}


	//fprintf_matrixRowMajor(pA, row, col, name, withPrint);

}


/*
static void _setMatrixRowMajor(int row, int col, MKL_Complex8* pA, const char* name, bool withPrint)
{
	if (row == 4 && col == 3)
	{
		pA[0] = { 41.0f ,67.0f };
		pA[1] = { 62.0f ,64.0f };
		pA[2] = { 95.0f ,42.0f };
		pA[3] = { 34.0f , 0.0f };
		pA[4] = { 5.0f  ,45.0f };
		pA[5] = { 27.0f ,36.0f };
		pA[6] = { 69.0f ,24.0f };
		pA[7] = { 81.0f ,27.0f };
		pA[8] = { 91.0f , 4.0f };
		pA[9] = { 78.0f ,58.0f };
		pA[10] = { 61.0f ,91.0f };
		pA[11] = { 2.0f ,53.0f };
	}
	else
	{
		//srand(static_cast<unsigned>(time(0)));

		for (int iRow = 0; iRow < row; iRow++)
		{
			for (int jCol = 0; jCol < col; jCol++)
			{
				float real = rand() % 100;
				float imag = rand() % 100;
				pA[jCol + iRow*col].real = real;
				pA[jCol + iRow*col].imag = imag;

			}
		}
	}

	fprintf_matrixRowMajor(pA, row, col, name, withPrint);

}
*/


static void _refreshCache(float* pA)
{

		for (int i = 0; i < SIZE_CACHE; i++)
		{

			pA[i]= i;

		}

}

void printEigen(char* desc, float* S, int m) {

	int i;

	printf("\n %s\n", desc);
	for (i = 0; i < m; i++)
		printf("%f \t", S[i]);


}


void tempoConsole() {

	char C;
	printf("Tapez RETURN pour sortir\n");
	scanf("%c", &C);
	exit(0);
}
