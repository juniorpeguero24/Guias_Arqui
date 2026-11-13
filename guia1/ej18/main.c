#include <stdio.h>
#include <stdlib.h>

int stringEntero(char* s){
    int i=0,suma=0;

    while (s[i] != '\0'){
        suma += (s[i] & 0x7F);
        i++;
    }
    return suma;
}

int main()
{
    char texto[]="hola";
    printf("Suma de %s: %d",texto,stringEntero(s));
    return 0;
}
