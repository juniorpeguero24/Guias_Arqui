#include <stdio.h>

void weekday_set(char *dias, int dia)
{
    char mascara = 1 << dia;
    *dias = *dias | mascara;
}

void weekday_reset(char *dias, int dia)
{
    char mascara = 1 << dia;
    *dias = *dias & ~mascara;
}

void mostrar_binario(char nro)
{
    char mascara = 1 << 6;

    for (int i = 6; i >= 0; i--)
    {
        printf("%d", (nro & mascara) != 0);
        mascara >>= 1;
    }

    printf("\n");
}

int main()
{
    char dias = 0;

    weekday_set(&dias, 0); // Domingo
    weekday_set(&dias, 2); // Martes
    weekday_set(&dias, 6); // Sábado

    mostrar_binario(dias);

    weekday_reset(&dias, 2); // Sacamos martes

    mostrar_binario(dias);

    return 0;
}
