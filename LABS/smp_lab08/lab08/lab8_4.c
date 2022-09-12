#include <stdio.h>

int par_ou_impar(int a0);

int main(){
    int value = 0;
    int result = 0;
    
    printf("Insira um valor: ");
    scanf("%d", &value);

    result = par_ou_impar(value);
    
    if (result==0) printf("eh par");
    else printf("eh impar");

    return 0;
}
