#include <stdio.h>

/* Count the number of times, a given character (toFind) appears in a string */
int FindChar(char *ptr, char toFind);

/* In how many words, appears the character (toFind) ? */
int FindWordsWithChar(char *ptr, char toFind);


int main(){
    char str[]="Sistemas de Microprocessadores Rocks";
    char tf='s';

    printf("Char '%c' appears %d times in the sentence '%s'\n", tf, FindChar(str,tf), str);

    printf("Char '%c' appears in %d words in the sentence '%s'\n", tf, FindWordsWithChar(str,tf), str);

    return 0;
}

