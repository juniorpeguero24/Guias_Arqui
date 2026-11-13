#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[])
{
    FILE *origen;
    FILE *destino;

    unsigned char byte;
    unsigned char clave;
    int i = 0;

    if (argc != 4)
    {
        printf("Uso: %s <clave> <archivo_origen> <archivo_destino>\n", argv[0]);
        return 1;
    }

    origen = fopen(argv[2], "rb");
    if (origen == NULL)
    {
        printf("Error al abrir el archivo origen.\n");
        return 1;
    }

    destino = fopen(argv[3], "wb");
    if (destino == NULL)
    {
        printf("Error al abrir el archivo destino.\n");
        fclose(origen);
        return 1;
    }

    while (fread(&byte, sizeof(unsigned char), 1, origen) == 1)
    {
        clave = argv[1][i];

        byte = byte ^ clave;

        fwrite(&byte, sizeof(unsigned char), 1, destino);

        i++;

        if (argv[1][i] == '\0')
            i = 0;
    }

    fclose(origen);
    fclose(destino);

    return 0;
}
