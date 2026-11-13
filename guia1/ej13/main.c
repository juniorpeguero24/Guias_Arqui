#include <stdio.h>

void imprimirDiasActivos(char dias) {
    // Array con los nombres según el bit que ocupan (de bit 0 a bit 6)
    const char* nombresDias[] = {
        "Domingo", // Bit 0
        "Lunes",   // Bit 1
        "Martes",  // Bit 2
        "Miercoles",// Bit 3
        "Jueves",  // Bit 4
        "Viernes", // Bit 5
        "Sabado"   // Bit 6
    };

    printf("Dias activos:\n");
    int seImprimioAlguno = 0;

    // Evaluamos del bit 0 al bit 6
    for (int i = 0; i < 7; i++) {
        // Comprobamos si el bit i está encendido usando una máscara
        if ((dias >> i) & 1) {
            printf("- %s\n", nombresDias[i]);
            seImprimioAlguno = 1;
        }
    }

    if (!seImprimioAlguno) {
        printf("- Ningun dia activo\n");
    }
}

int main() {
    // Ejemplo del enunciado: 10 = 0x0A = 0b00001010
    // Bits activos: Bit 1 (Lunes) y Bit 3 (Miércoles)
    char byteDias = 10;

    imprimirDiasActivos(byteDias);

    return 0;
}
