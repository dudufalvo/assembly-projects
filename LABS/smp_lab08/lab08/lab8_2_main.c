#include <stdio.h>
#include <stdlib.h>

int power(int a0, int a1);

int main(int argc, char **argv){
  int a0, a1, result;

  if (argc != 3)
      printf("ERROR: This program must receive two integers as input. Example: lab8_2 2 3\n");
  else{
      a0=atoi(argv[1]);
      a1=atoi(argv[2]);
      result=power(a0,a1);
      printf("The result is %d \n", result);
 }

 return 0;
}
