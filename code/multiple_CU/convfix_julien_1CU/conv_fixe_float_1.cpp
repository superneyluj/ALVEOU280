// librairies 
#include <stdint.h>
#include <hls_stream.h>
#include <ap_int.h>

// Nombre de données à convertir
#define DATA_SIZE 65536 ;

static int decalage(ap_int<24> dec24)
{
int m,u;

// Boucle qui parcoure tout le nombre sur 24 bits
for(m=23;m>=0;m--)
{
	// Si on trouve que le m-ième bit est à 1 alors on sort de la boucle et on retourne la position
	if(dec24[m]==1)
	{
		u = m ;
		break ;
	}

}
return u ;
}

// Fonction convertissant un nombre fixe en 24 bits en un nombre flottant sur 32 bits (norme IEEE 754)
static ap_uint<32> conversion(ap_int<24> dec24)
{
	// 1 bit de signe
	ap_uint<1> signe;
	// 8 bits non signés d'exposant
	ap_uint<8> exposant ;
	// 24 bits de mantisse ( comprend le bit caché qu'on supprimera plus tard)
	ap_uint<24> mantisse ;
	// 32 bits signés pour le résultat final de la conversion
	ap_int<32> nombre_float ;

	// Si le nombre flottant que nous voulons convertir = 0 alors on retourne 0.
	if( dec24 == 0 )
		return 0;

	// Signe
	signe = dec24[23];

	// Si le nombre est signé donc le bit de signe = 1, on fait le complément à 2
	if( signe == 1 )
		dec24 = -dec24;

	// Mantisse
	// Appel de la fonction décalage, j contient la position du premier 1
	int h = decalage(dec24) ;

	// On remplit le début de la mantisse avec les bits à partir du premier 1 du binaire de 24 bits
	mantisse(23,23-h) = dec24(h,0) ;
	// On complète avec des 0 pour avoir une mantisse complète de 23 bits + 1 bit caché à supprimer
	mantisse(23-h-1,0) = 0 ;

	// Calcul de l'exposant avec le rajout du biais de 127
	exposant = h+127 ;

	// concaténation des différents éléments, en supprimant le bit caché de la mantisse
	nombre_float = (signe,exposant,mantisse(23-1,0)) ;

	return nombre_float ;
}
// variable utilisée par les pragmas pour réaliser des mesures
const int c_size = DATA_SIZE;

// fonction qui permet de charger des données dans une stream
static void load_input(ap_uint<256>* in, hls::stream<ap_uint<256>>& inStream, int size)
{
	mem_rd:
	for (int i = 0; i < size; i++) 
	{
#pragma HLS LOOP_TRIPCOUNT min = c_size max = c_size
		// On récupère les données à convertir pointées par le pointeur in et nous les mettons dans une stream d'entrée
		inStream << in[i];
	}
}

// fonction qui va permettre de faire le calcul de la conversion 
static void compute_add(hls::stream<ap_uint<256>>& in1_stream,
		hls::stream<ap_uint<256>>& out_stream,
		int size)
{
	// Conversion avec les valeurs présentes dans la stream d'entrée, le résultat est placée dans la stream de sortie
	execute:
	for (int i = 0; i < size; i++)
	{
#pragma HLS LOOP_TRIPCOUNT min = c_size max = c_size

		// lecture de la stream d'entrée qui contient les nombres à convertir
		ap_uint<256> a = in1_stream.read();

		// on range dans des variable de 24 bits les nombres à convertir uns par uns
		ap_int<24> r0 = a( 23,  0) ;
		ap_int<24> r1 = a( 55, 32) ;
		ap_int<24> r2 = a( 87, 64) ;
		ap_int<24> r3 = a(119, 96) ;
		ap_int<24> r4 = a(151,128) ;
		ap_int<24> r5 = a(183,160) ;
		ap_int<24> r6 = a(215,192) ;
		ap_int<24> r7 = a(247,224) ;

		// On convertit ces nombres que l'on place dans des variable de 32 bits
		// On instancie 8 opérateurs de conversion en parallèles
		ap_uint<32> t0 = conversion(r0) ;
		ap_uint<32> t1 = conversion(r1) ;
		ap_uint<32> t2 = conversion(r2) ;
		ap_uint<32> t3 = conversion(r3) ;
		ap_uint<32> t4 = conversion(r4) ;
		ap_uint<32> t5 = conversion(r5) ;
		ap_uint<32> t6 = conversion(r6) ;
		ap_uint<32> t7 = conversion(r7) ;

		// On concatène dans un bus de 256 bits les 8 nombres convertit
		ap_uint<256> bus = (t7,t6,t5,t4,t3,t2,t1,t0);
		// On envoie ce bus dans la stream de sortie
		out_stream << bus ;
	}
}

// fonction qui permet de lire la stream de sortie et met les valeurs dans une zone mémoire pointée par le pointeur out
static void store_result(ap_uint<256>* out, hls::stream<ap_uint<256>>& out_stream, int size)
{
	mem_wr:
	for (int i = 0; i < size; i++)
	{
#pragma HLS LOOP_TRIPCOUNT min = c_size max = c_size
		out[i] = out_stream.read();
	}
}

extern "C"
{
// interface en 256 bits
void conv_fixe_float_1(ap_uint<256>* dec24, ap_uint<256>* nombre_float, int size)
{

#pragma HLS INTERFACE m_axi port = dec24 bundle = gmem0
#pragma HLS INTERFACE m_axi port = nombre_float bundle = gmem1

	static hls::stream<ap_uint<256>> in1_stream("input_stream_1");
	static hls::stream<ap_uint<256>> out_stream("output_stream");

// Les pragmas dataflow indique au compilateur d'exécuter les trois API suivante en parallèle
#pragma HLS dataflow

	// On divise par 8 la taille de données à envoyé et recevoir car on a des bus qui contiennent 8 nombres de 32 bits et non plus 1 seul
	int nb_mot = size / 8 ;

	load_input(dec24, in1_stream, nb_mot);
	compute_add(in1_stream, out_stream, nb_mot);
	store_result(nombre_float, out_stream, nb_mot);
}
}
