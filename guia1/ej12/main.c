#include <stdio.h>

void verificarComplementoA2() {
    int nro = -1;
    int total_bits = sizeof(int) * 8; // Normalmente 32 bits
    int es_todos_unos = 1;

    printf("Representacion binaria de -1: ");

    for (int i = total_bits - 1; i >= 0; i--) {
        int bit = (nro >> i) & 1;
        printf("%d", bit);

        if (bit != 1) {
            es_todos_unos = 0; // Si algún bit no es 1, no es C2 estándar
        }
    }
    printf("\n");

    // Verificación
    if (es_todos_unos) {
        printf("VERIFICADO: La arquitectura utiliza Complemento a 2 (todos los bits de -1 son '1').\n");
    } else {
        printf("La arquitectura NO utiliza Complemento a 2.\n");
    }
}

int main() {
    verificarComplementoA2();
    return 0;
}
