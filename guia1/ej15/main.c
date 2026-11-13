#include <stdio.h>

void imprimir_fecha(unsigned short int fecha)
{
    int dia;
    int mes;
    int anio;

    dia = (fecha >> 11) & 0x1F;
    mes = (fecha >> 7) & 0x0F;
    anio = fecha & 0x7F;

    if (anio > 50)
        anio += 1900;
    else
        anio += 2000;

    printf("%04d-%02d-%02d\n", anio, mes, dia);
}

int main()
{
    unsigned short int fecha;

    printf("Ingrese la fecha codificada: ");
    scanf("%hu", &fecha);

    imprimir_fecha(fecha);

    return 0;
}
