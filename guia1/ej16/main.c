#include <stdio.h>
#include <stdlib.h>

unsigned short int codificar_fecha(int dia,int mes,int anio){
    int anio_offset;

    if (anio >= 1951 && anio <= 1999)
        anio_offset = anio - 1900;
    else
        if (anio >= 2000 && anio <=2050)
            anio_offset = anio - 2000;
        else
            anio_offset = anio % 100;

    unsigned short int fecha_codificada = ((dia&0x1F)<<11 | (mes&0x0F)<<7 | (anio_offset&0x7F));

    return fecha_codificada;
}

int main()
{
    int d,m,a;

    printf("Ingrese dia, mes y anio: ");scanf("%d %d %d",&d,&m,&a);
    unsigned short int codificada=codificar_fecha(d,m,a);
    printf("Fecha cod. Hexa.: %04X\n",codificada);
    printf("Fecha cod. Dec.: %hu\n",codificada);
    return 0;
}
