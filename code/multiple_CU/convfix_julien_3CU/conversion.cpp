#define OCL_CHECK(error, call)                                                                   \
		call;                                                                                        \
		if (error != CL_SUCCESS) {                                                                   \
			printf("%s:%d Error calling " #call ", error code is: %d\n", __FILE__, __LINE__, error); \
			exit(EXIT_FAILURE);                                                                      \
		}

#include <stdlib.h>
#include <fstream>
#include <iostream>
#include "conversion.h"
#include <stdio.h>
#include <ap_int.h>
#include <time.h>

static const std::string error_message =
		"Error: Result mismatch:\n"
		"i = %d CPU result = %d Device result = %d\n";

// fonction verification qui utilise la méthode du Cast
float verification(int dec24)
{
	int  z  ;
	float F ;

	// nombre négatif
	if (((dec24 >> 23) & 0x000001) == 1)
	{
		// Mise à 1 des bits du 1er octet
		z = dec24 | 0xFF000000 ;
	}
	else
	{
	    // Si le nombre est pas négatif, on ne touche pas le premier octet, il reste à 0
		z = dec24 ;
	}

	// On force la valeur p à être une valeur flottante (cast)
	F = (float) z ;
	return F ;
}


// fonction qui permet de calculer le delta entre 2 temps mesurés 
static double ts_delta(struct timespec t1 , struct timespec t2)
{
	struct timespec diff ;
	diff.tv_sec = t1.tv_sec - t2.tv_sec ;
	diff.tv_nsec = t1.tv_nsec - t2.tv_nsec ;
	if(diff.tv_nsec <0)
	{
		diff.tv_sec -- ;
		diff.tv_nsec += 1e9 ;
	}

	return diff.tv_nsec + diff.tv_sec *1e9 ;
}

int main(int argc, char* argv[])
{
	//structure
	struct timespec t_start, t_stop;

	if(argc < 2) {
		std::cout << "Usage: " << argv[0] <<" <xclbin>" << std::endl;
		return EXIT_FAILURE;
	}

	std::string xclbinFilename = argv[argc-1];

	FILE* fp;
	if ((fp = fopen(xclbinFilename.c_str(), "r")) == nullptr) {
		printf("ERROR: %s xclbin not available please build\n", xclbinFilename.c_str());
		exit(EXIT_FAILURE);
	}
	std::cout << "Loading: '" << xclbinFilename << "'\n";
	std::ifstream bin_file(xclbinFilename, std::ifstream::binary);
	bin_file.seekg (0, bin_file.end);
	unsigned nb = bin_file.tellg();
	bin_file.seekg (0, bin_file.beg);
	char *buf = new char [nb];
	bin_file.read(buf, nb);

	// nombre de données à convertir 
	unsigned int DATA_COUNT = 1024;
	// Process split packets of size DATA_COUNT/split
	unsigned int split = 16; 
	if( argc == 3 )
		DATA_COUNT *= atoi(argv[1]);
	std::cout << "Process " << DATA_COUNT << " elements of size 4B" << std::endl;

	std::vector<cl::Device> devices;
	cl::Device device;
	std::vector<cl::Platform> platforms ;
	bool found_device = false ;

   	// On regarde toutes les plateformes connectées au serveur, et on recherche une appellée Xilinx. On cherche surtout une carte accélératrice de Xilinx
	std::cout << "Search device" << std::endl;
	cl::Platform::get(&platforms);
	for(size_t i = 0; (i < platforms.size() ) & (found_device == false) ;i++){
		cl::Platform platform = platforms[i];
		std::string platformName = platform.getInfo<CL_PLATFORM_NAME>();
		if ( platformName == "Xilinx"){
			devices.clear();
			platform.getDevices(CL_DEVICE_TYPE_ACCELERATOR, &devices);
			if (devices.size()){
				device = devices[0];
				found_device = true;
				break;
			}
		}
	}
	if (found_device == false){
		std::cout << "Error: Unable to find Target Device "
				<< device.getInfo<CL_DEVICE_NAME>() << std::endl;
		return EXIT_FAILURE;
	}
	
	// Si on a trouvé une carte accélératrice de Xilinx, on écrit sur la console qu'on en a trouvé une 
	std::cout << "Device found" << std::endl;

	// Création du contexte et de la file d'attente (queue) pour le dispositif selectioné
	cl_int err;
	cl::Context context;
	cl::Program program ;
	OCL_CHECK(err, context = cl::Context(device, NULL, NULL, NULL, &err));

	cl::Program::Binaries bins;
	bins.push_back({buf,nb});
	OCL_CHECK(err, program = cl::Program(context, devices, bins, NULL, &err));
	
	// Création de 3 queues de commandes pour réaliser des transferts de données et des exécutions en parallèles 
	cl::CommandQueue q_htd, q_dth, q_exe;
	OCL_CHECK(err, q_htd = cl::CommandQueue(context, device, CL_QUEUE_PROFILING_ENABLE, &err));
	OCL_CHECK(err, q_dth = cl::CommandQueue(context, device, CL_QUEUE_PROFILING_ENABLE, &err));
	OCL_CHECK(err, q_exe = cl::CommandQueue(context, device, CL_QUEUE_PROFILING_ENABLE, &err));


	// Création d'un noyau qui appel la fonction noyau
	cl::Kernel conv_fixe_float_256;
	cl::Kernel conv_fixe_float_257;
	cl::Kernel conv_fixe_float_258;
	OCL_CHECK(err, conv_fixe_float_256 = cl::Kernel(program,"conv_fixe_float_1:{conv_1}", &err));
	OCL_CHECK(err, conv_fixe_float_257 = cl::Kernel(program,"conv_fixe_float_1:{conv_2}", &err));
	OCL_CHECK(err, conv_fixe_float_258 = cl::Kernel(program,"conv_fixe_float_1:{conv_3}", &err));

	
	size_t buffer_size = DATA_COUNT / split * sizeof(int);
	size_t allocated_size = DATA_COUNT * sizeof(int);

	// Allocation d'une zone mémoire sur le processeur
	int *ptr_a1, *ptr_b1,*ptr_a2, *ptr_b2,*ptr_a3, *ptr_b3;

	cl_mem_ext_ptr_t inExt1, outExt1;
	inExt1.flags = 0|XCL_MEM_TOPOLOGY;
	outExt1.flags = 1|XCL_MEM_TOPOLOGY;
	inExt1.obj = 0 ; outExt1.obj = 0;
	inExt1.param = 0; outExt1.param = 0;

	cl_mem_ext_ptr_t inExt2, outExt2;
	inExt2.flags = 2|XCL_MEM_TOPOLOGY;
	outExt2.flags = 3|XCL_MEM_TOPOLOGY;
	inExt2.obj = 0 ; outExt2.obj = 0;
	inExt2.param = 0; outExt2.param = 0;

	cl_mem_ext_ptr_t inExt3, outExt3;
	inExt3.flags = 4|XCL_MEM_TOPOLOGY;
	outExt3.flags = 5|XCL_MEM_TOPOLOGY;
	inExt3.obj = 0 ; outExt3.obj = 0;
	inExt3.param = 0; outExt3.param = 0;

	OCL_CHECK(err, cl::Buffer buffer_a1(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_EXT_PTR_XILINX, allocated_size, &inExt1, &err));
	OCL_CHECK(err, cl::Buffer buffer_b1(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_EXT_PTR_XILINX, allocated_size, &outExt1, &err));
	OCL_CHECK(err, ptr_a1 = (int*) q_htd.enqueueMapBuffer(buffer_a1 , CL_TRUE , CL_MAP_READ, 0, allocated_size, NULL, NULL, &err));
	OCL_CHECK(err, ptr_b1 = (int*) q_dth.enqueueMapBuffer(buffer_b1 , CL_TRUE , CL_MAP_WRITE , 0, allocated_size, NULL, NULL, &err));

	OCL_CHECK(err, cl::Buffer buffer_a2(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_EXT_PTR_XILINX, allocated_size, &inExt2, &err));
	OCL_CHECK(err, cl::Buffer buffer_b2(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_EXT_PTR_XILINX, allocated_size, &outExt2, &err));
	OCL_CHECK(err, ptr_a2 = (int*) q_htd.enqueueMapBuffer(buffer_a2 , CL_TRUE , CL_MAP_READ, 0, allocated_size, NULL, NULL, &err));
	OCL_CHECK(err, ptr_b2 = (int*) q_dth.enqueueMapBuffer(buffer_b2 , CL_TRUE , CL_MAP_WRITE , 0, allocated_size, NULL, NULL, &err));

	OCL_CHECK(err, cl::Buffer buffer_a3(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_EXT_PTR_XILINX, allocated_size, &inExt3, &err));
	OCL_CHECK(err, cl::Buffer buffer_b3(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_EXT_PTR_XILINX, allocated_size, &outExt3, &err));
	OCL_CHECK(err, ptr_a3 = (int*) q_htd.enqueueMapBuffer(buffer_a3 , CL_TRUE , CL_MAP_READ, 0, allocated_size, NULL, NULL, &err));
	OCL_CHECK(err, ptr_b3 = (int*) q_dth.enqueueMapBuffer(buffer_b3 , CL_TRUE , CL_MAP_WRITE , 0, allocated_size, NULL, NULL, &err));

    // Création de 4 zones mémoires sur le FPGA d'une taille choisie
	OCL_CHECK(err, cl::Buffer buffer_a_0_1(context, CL_MEM_EXT_PTR_XILINX, buffer_size, &inExt1, &err));
	OCL_CHECK(err, cl::Buffer buffer_a_1_1(context, CL_MEM_EXT_PTR_XILINX, buffer_size, &inExt1, &err));
	OCL_CHECK(err, cl::Buffer buffer_b_0_1(context, CL_MEM_EXT_PTR_XILINX, buffer_size, &outExt1, &err));
	OCL_CHECK(err, cl::Buffer buffer_b_1_1(context, CL_MEM_EXT_PTR_XILINX, buffer_size, &outExt1, &err));

	OCL_CHECK(err, cl::Buffer buffer_a_0_2(context, CL_MEM_EXT_PTR_XILINX, buffer_size, &inExt2, &err));
	OCL_CHECK(err, cl::Buffer buffer_a_1_2(context, CL_MEM_EXT_PTR_XILINX, buffer_size, &inExt2, &err));
	OCL_CHECK(err, cl::Buffer buffer_b_0_2(context, CL_MEM_EXT_PTR_XILINX, buffer_size, &outExt2, &err));
	OCL_CHECK(err, cl::Buffer buffer_b_1_2(context, CL_MEM_EXT_PTR_XILINX, buffer_size, &outExt2, &err));

	OCL_CHECK(err, cl::Buffer buffer_a_0_3(context, CL_MEM_EXT_PTR_XILINX, buffer_size, &inExt3, &err));
	OCL_CHECK(err, cl::Buffer buffer_a_1_3(context, CL_MEM_EXT_PTR_XILINX, buffer_size, &inExt3, &err));
	OCL_CHECK(err, cl::Buffer buffer_b_0_3(context, CL_MEM_EXT_PTR_XILINX, buffer_size, &outExt3, &err));
	OCL_CHECK(err, cl::Buffer buffer_b_1_3(context, CL_MEM_EXT_PTR_XILINX, buffer_size, &outExt3, &err));



	std::cout << "Init data" << std::endl;

	// Remplissage d'une zone mémoire pointée sur le processeur (simulation)
	ap_int<24> dec24 = 0 ;
	for(int i=0 ; i<DATA_COUNT ; i++)
	{
		ptr_a1[i] = dec24 ;
		dec24 = dec24 + 1 ;
	}

	for(int i=0 ; i<DATA_COUNT ; i++)
	{
		ptr_a2[i] = dec24 ;
		dec24 = dec24 + 1 ;
	}

	for(int i=0 ; i<DATA_COUNT ; i++)
	{
		ptr_a3[i] = dec24 ;
		dec24 = dec24 + 1 ;
	}

	OCL_CHECK(err, err = q_htd.finish()) ; 
	OCL_CHECK(err, err = q_dth.finish()) ;

	std::cout << "Start computation" << std::endl;

	// Créations des évenements pour réaliser des dépendances
	cl::Event htd_event_0, htd_event_1;
	cl::Event exe_event_0, exe_event_1;
	cl::Event dth_event_0, dth_event_1;

	std::vector<cl::Event> htd_wait, dth_wait, exe_wait;


	for( unsigned int i = 0; i < split; i++ )
	{
		void* pa1 = ptr_a1 + DATA_COUNT/split*i;
		void* pb1 = ptr_b1 + DATA_COUNT/split*i;

		void* pa2 = ptr_a2 + DATA_COUNT/split*i;
		void* pb2 = ptr_b2 + DATA_COUNT/split*i;

		void* pa3 = ptr_a3 + DATA_COUNT/split*i;
		void* pb3 = ptr_b3 + DATA_COUNT/split*i;

		// En fonction de l'itération on choisi un buffer
		// Car un tour de boucle sur 2 le résultat de la division par 2 aura comme reste 0 
		cl::Buffer *b_a1 = (i%2==0) ? &buffer_a_0_1 : &buffer_a1;
		cl::Buffer *b_b1 = (i%2==0) ? &buffer_b_0_1 : &buffer_b1;

		cl::Buffer *b_a2 = (i%2==0) ? &buffer_a_0_2 : &buffer_a2;
		cl::Buffer *b_b2 = (i%2==0) ? &buffer_b_0_2 : &buffer_b2;

		cl::Buffer *b_a3 = (i%2==0) ? &buffer_a_0_3 : &buffer_a3;
		cl::Buffer *b_b3 = (i%2==0) ? &buffer_b_0_3 : &buffer_b3;

		cl::Event* phtd_event = (i%2==0) ? &htd_event_0 : &htd_event_1;
		cl::Event* pexe_event = (i%2==0) ? &exe_event_0 : &exe_event_1;
		cl::Event* pdth_event = (i%2==0) ? &dth_event_0 : &dth_event_1;

		// CPU -> FPGA
		if( i <= 1 )
			htd_wait = {};
		else
			htd_wait = {*pexe_event};
		// Transfert des données du CPU vers la carte FPGA dans le buffer *b_a
		//Ce buffer sera un coup sur 2 buffer_a_0 et buffer_a_1
		OCL_CHECK(err, err = q_htd.enqueueWriteBuffer(*b_a1,CL_FALSE,0,buffer_size,pa1,&htd_wait,phtd_event));
		OCL_CHECK(err, err = q_htd.enqueueWriteBuffer(*b_a2,CL_FALSE,0,buffer_size,pa2,&htd_wait,phtd_event));
		OCL_CHECK(err, err = q_htd.enqueueWriteBuffer(*b_a3,CL_FALSE,0,buffer_size,pa3,&htd_wait,phtd_event));

		//Execution
		if( i <= 1 )
			exe_wait = {*phtd_event};
		else
			exe_wait = {*phtd_event,*pdth_event};

		// On règle les arguments du noyau avec les bon buffers selon l'itération
		OCL_CHECK(err, err = conv_fixe_float_256.setArg(0,*b_a1));
		OCL_CHECK(err, err = conv_fixe_float_256.setArg(1,*b_b1));
		OCL_CHECK(err, err = conv_fixe_float_256.setArg(2,DATA_COUNT/split));
		OCL_CHECK(err, err = q_exe.enqueueTask(conv_fixe_float_256, &exe_wait,pexe_event));

		// On règle les arguments du noyau avec les bon buffers selon l'itération
		OCL_CHECK(err, err = conv_fixe_float_257.setArg(0,*b_a2));
		OCL_CHECK(err, err = conv_fixe_float_257.setArg(1,*b_b2));
		OCL_CHECK(err, err = conv_fixe_float_257.setArg(2,DATA_COUNT/split));
		OCL_CHECK(err, err = q_exe.enqueueTask(conv_fixe_float_257, &exe_wait,pexe_event));

		// On règle les arguments du noyau avec les bon buffers selon l'itération
		OCL_CHECK(err, err = conv_fixe_float_258.setArg(0,*b_a3));
		OCL_CHECK(err, err = conv_fixe_float_258.setArg(1,*b_b3));
		OCL_CHECK(err, err = conv_fixe_float_258.setArg(2,DATA_COUNT/split));
		OCL_CHECK(err, err = q_exe.enqueueTask(conv_fixe_float_258, &exe_wait,pexe_event));


		// FPGA -> CPU
		dth_wait = {*pexe_event};
		OCL_CHECK(err, err = q_dth.enqueueReadBuffer(*b_b1,CL_FALSE,0,buffer_size,pb1,&dth_wait,pdth_event));
		OCL_CHECK(err, err = q_dth.enqueueReadBuffer(*b_b2,CL_FALSE,0,buffer_size,pb2,&dth_wait,pdth_event));
		OCL_CHECK(err, err = q_dth.enqueueReadBuffer(*b_b3,CL_FALSE,0,buffer_size,pb3,&dth_wait,pdth_event));
	}

	std::cout << "Wait results" << std::endl;

	OCL_CHECK(err, err = q_htd.finish()) ;
	OCL_CHECK(err, err = q_exe.finish()) ;
	OCL_CHECK(err, err = q_dth.finish()) ;

	std::cout << "Check results" << std::endl;

	// Check results
	int ecount = 0;
	int match=0 ;
	float CPU_result_a1 ,CPU_result_a2,CPU_result_a3;

	// Vérification des résultats du kernel
	/*for(int i=0; i<DATA_COUNT;i++)
	{
		CPU_result_a1 = verification(ptr_a1[i]);//appel de la fct, elle nous renvoie F

		if ((ptr_b1&[i] != *((int*) &CPU_result_a1)))
		{
			printf("[%04d] 0x%08x vs 0x%08x\n",i,*((int*) &CPU_result_a1), ptr_b1[i]);
			// valeur de match qui passe à 1 si il y a une erreur dans la conversion
			 match = 1 ;
			 ecount++;
		}
	}

	// Vérification des résultats du kernel
	for(int i=0; i<DATA_COUNT;i++)
	{
		CPU_result_a2 = verification(ptr_a2[i]);//appel de la fct, elle nous renvoie F

		if ((ptr_b2&[i] != *((int*) &CPU_result_a2)))
		{
			printf("[%04d] 0x%08x vs 0x%08x\n",i,*((int*) &CPU_result_a2), ptr_b2[i]);
			//printf("Erreur dans la conversion\n") ;
			//printf("CPU_result_a = 0x%08x  |  FPGA_result_a = 0x%08x\n",*((int*) &CPU_result_a), ptr_b[i]);

			// valeur de match qui passe à 1 si il y a une erreur dans la conversion
			 match = 1 ;
			 ecount++;
		}
	}

	// Vérification des résultats du kernel
	for(int i=0; i<DATA_COUNT;i++)
	{
		CPU_result_a3 = verification(ptr_a3[i]);//appel de la fct, elle nous renvoie F

		if ((ptr_b3&[i] != *((int*) &CPU_result_a3)))
		{
			printf("[%04d] 0x%08x vs 0x%08x\n",i,*((int*) &CPU_result_a3), ptr_b3		[i]);
			//printf("Erreur dans la conversion\n") ;
			//printf("CPU_result_a = 0x%08x  |  FPGA_result_a = 0x%08x\n",*((int*) &CPU_result_a), ptr_b[i]);

			// valeur de match qui passe à 1 si il y a une erreur dans la conversion
			 match = 1 ;
			 ecount++;
		}
	}*/

	if( match ){
		std::cout << ecount << "errors detected" << std::endl;
	}

	std::cout << "TEST " << (match ? "FAILED" : "PASSED") << std::endl ;

	OCL_CHECK(err, err = q_dth.enqueueUnmapMemObject(buffer_a1, ptr_a1));
	OCL_CHECK(err, err = q_dth.enqueueUnmapMemObject(buffer_b1, ptr_b1));
	OCL_CHECK(err, err = q_dth.enqueueUnmapMemObject(buffer_a2, ptr_a2));
	OCL_CHECK(err, err = q_dth.enqueueUnmapMemObject(buffer_b2, ptr_b2));
	OCL_CHECK(err, err = q_dth.enqueueUnmapMemObject(buffer_a3, ptr_a3));
	OCL_CHECK(err, err = q_dth.enqueueUnmapMemObject(buffer_b3, ptr_b3));
	OCL_CHECK(err, err = q_dth.finish());

	return (match ? EXIT_FAILURE :  EXIT_SUCCESS);
}
