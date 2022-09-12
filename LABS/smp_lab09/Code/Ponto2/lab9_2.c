#include <stdio.h>


int max (int *table, int n);

int min (int *table, int n);


int main (){

    int array[10] = {0, 1, -2, 30, 4, 5, 6, 7, 8, 9};
    int n = 10, vMax, vMin;

    vMax = max(array, n);
    vMin = min(array, n);

    printf ("O valor maximo: %d\n",vMax);
    printf ("O valor minimo: %d\n",vMin);

    return 0;
}
