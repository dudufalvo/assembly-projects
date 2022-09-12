
#include <stdio.h>


// check is (x,y) is inside circle with a given (radius)
int inside_cicle(int x, int y, int radius);

int main (){
    int x, y, radius = 5, retval;

    printf ("Introduza x:\n");
    scanf ("%d", &x);
    printf ("Introduza y\n");
    scanf ("%d", &y);

    retval = inside_cicle(x, y, radius);

    if (retval > 0) printf ("ponto (%d,%d) dentro do circulo (r=%d)\n", x, y, radius);
    else printf ("ponto (%d,%d) fora do circulo (r=%d)\n", x, y, radius);

    return 0;
}
