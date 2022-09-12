/* Incluir os headers do sistema necess�rios */
#include <stdlib.h>
#include <stdio.h>

/* Incluir o nosso header */
#include "vector.h"

/* Definir a nossa struct para os vectores */
struct _vector_t {
	size_t size;
	int *data;
};


/* Criar um novo vector com tamanho 1*/
vector_t *vector_new() {
	vector_t *retval;  

	/* Temos que primeiro alocar mem�ria para a nossa estrutura de dados */
	retval = (vector_t *)malloc(1 * sizeof(vector_t));

	/* Verificar o valor devolvido para ter a certeza que obtivemos a mem�ria pedida */
	if(retval == NULL)
		return NULL;
	 
	/* Temos agora que inicializar os dados */
	retval->size = 1;
	retval->data = (int *)malloc(retval->size * sizeof(int));

	/* Verificar o valor devolvido para ter a certeza que obtivemos a mem�ria pedida */
	if(retval->data == NULL) {
		free(retval);
		return NULL;
	}

	retval->data[0] = 0;

	/* Note que 'retval->size' poderia escrever-se '(*retval).size', 
	 * mas a nota��o '->' � mais pr�tica
	 */
	
	/* e terminamos com o ponteiro para o que se criou... */
	return retval;
}

/* Libertar a mem�ria alocada para o vector passado � fun��o */
void vector_delete(vector_t *v) {
	/* N�o esquecer, tem que libertar TODA a mem�ria que est� alocada para este vector*/
	

	/* --- ESCREVA O SEU C�DIGO AQUI --- */




}

/* Devolver o valor de um elemento do vector */
int vector_get(vector_t *v, size_t loc) {

	/* Se foi passado um ponteiro NULL pointer para o vector
	 * protestar e devolver 0.
	 */
	if(v == NULL) {
		fprintf(stderr, "vector_get: passed a NULL vector.  Returning 0.\n");
		return 0;
	}

	/* Se a posi��o do elemento pretendido for maior que o tamanho alocado
	 * devolver 0, sen�o devolver o valor do elemento pretendido.
	 */
	if(loc < v->size) {
		return v->data[loc];
	} else {
		return 0;
	}
}

/* Colocar um valor no vector */
void vector_set(vector_t *v, size_t loc, int value) {
	/* vector deve ter um comportamento din�mico, aceitando sempre mais elementos.
	 * O que fazer quando a localiza��o do elemento a colocar � maior que o tamanho j� alocado?
	 * N�o esquecer que elemntos n�o inicializados devem ficar a 0.
	 */


	/* --- ESCREVA O SEU C�DIGO AQUI --- */

}


/* Display to the monitor all the values in the list */
void vector_print(vector_t *v){
	/* Imprimir todos os valores da lista para o ecra, separando os elementos com o separador ' -> ' */


	/* --- ESCREVA O SEU C�DIGO AQUI --- */

}
