#include <stdio.h>

void binario(int nro, char *s)
{
    int mascara = 1 << 31;

    for (int i = 0; i < 32; i++)
    {
        s[i] = (nro & mascara) ? '1' : '0';
        mascara >>= 1;
    }

    s[32] = '\0';
}

int main()
{
    int nro;
    char s[33];

    scanf("%d", &nro);

    binario(nro, s);

    printf("%X = %s\n", nro, s);

    return 0;
}
