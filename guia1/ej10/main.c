#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

int main()
{
    int16_t n = 0x02A3;

    printf("--- PRUEBAS CON n = %04X (%d) ---\n\n", (uint16_t)n, n);

    int16_t a= (n >> 8) & 0x00FF;
    printf("a. Byte de la izquierda: %04X\n",a);

    int16_t b = n & 0x00FF;
    printf("b. Byte de la derecha: %04X\n",b);

    int16_t c = n & 0x0001;
    printf("c. Devolver 1 si el numero es impar, y 0 si es par: %04X\n",c);

    int16_t d = n >> 15;
    printf("d. Devolver -1 si el numero es negativo, y 0 si es positivo: %04X\n",d);

    int16_t e = (n >> 4) & 0x0FFF;
    printf("e. Devolver el número que representan los primeros 12 bits: %04X\n",e);

    int16_t f = n & 0x000F;
    printf("f. Devolver el número que representan los últimos 4 bits: %04X\n",f);

    return 0;
}
