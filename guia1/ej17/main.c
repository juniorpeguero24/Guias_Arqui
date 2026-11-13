#include <stdio.h>
#include <stdlib.h>

void a_mayusculas(char* s){
    int i=0;
    while (s[i] != '\0'){
        if (s[i]>='a' && s[i]<='z')
            s[i] &= 0xDF;
        i++;
    }
}

int main()
{
    char texto[] = "hola mundo 123!";
    a_mayusculas(texto);
    printf("%s",texto);
    return 0;
}
