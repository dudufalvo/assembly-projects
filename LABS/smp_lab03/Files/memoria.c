/*
 * memoria.c
 */

	/*MEM:
	/* Descreva (editando os coment�rios) o efeito em termos de mem�ria de cada
	    uma das declara��es e instru��es assinaladas com o coment�rio /*MEM:
	   Quais as zonas de mem�ria implicadas: armazenamento est�tico, pilha ou heap?
	   Alguma  mem�ria � reservada ou libertada? Se sim, onde esta essa mem�ria?
	   A instru��o em quest�o pode levar a uma fuga de mem�ria?
	  
	 */

#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

#define DELTA 33

int calls, seed=356;   /*MEM:*/

int soma_ds(int a){     /*MEM:*/
 int d=DELTA;           /*MEM:*/
 calls++; 				/*MEM:*/
 return a+d+seed; 
}   					/*MEM:*/

int main() {
	int num;								/*MEM:*/
	int *ptr;
	int **handle;
	 
	 num = 14;								/*MEM:*/
	 ptr = (int *)malloc(2 * sizeof(int));	/*MEM:*/
	 handle = &ptr;							/*MEM:*/
	 **handle = num;						/*MEM:*/
	 *(*handle+1) = num+1;					/*MEM*/
	 *ptr = num-2;							/*MEM:*/
	 ptr = &num;							/*MEM:*/
	 *ptr = soma_ds(num-2);					/*MEM:*/

}
