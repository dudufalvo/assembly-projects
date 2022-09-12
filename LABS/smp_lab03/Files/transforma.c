#include <stdio.h>
#include <stdlib.h>

#include "vector.h"

/* Definir a nossa struct para os vectores */
struct _vector_t {
	size_t size;
	int *data;
};

void ZeroVector(vector_t *ptr){
	int vec2x1[2]={0,0}; 
	
 	free(ptr->data);
 	ptr->data=vec2x1;
 	ptr->size=2;
 }


int main(int argc, char **argv) {
	vector_t *v;
	
	v = vector_new();
	vector_set(v, 0, 10);
	vector_set(v, 1, 20);

	printf("O vector tem tamanho %d x 1 \n", v->size);
	printf("O vector tem valores [ %d, %d ] \n",vector_get(v, 0), vector_get(v, 1));
	
	ZeroVector(v);
	
	printf("\n O vector tem tamanho %d x 1 \n", v->size);
	printf("O vector tem valores [ %d, %d ] \n",vector_get(v, 0), vector_get(v, 1));
	
	printf("\n Isto não parece estar nada bem. Vamos lá ver outra vez ...\n");
	printf("O vector tem tamanho %d x 1 \n", v->size);
	printf("O vector tem valores [ %d, %d ] \n",vector_get(v, 0), vector_get(v, 1));
	
	return 0;
}		
