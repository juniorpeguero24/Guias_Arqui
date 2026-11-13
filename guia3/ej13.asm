; --- 1. Verificación de matriz cuadrada ---
            MOV EDX, DS
            MOV EAX, [EDX]      ; EAX = Filas (N)
            ADD EDX, 1
            MOV EBX, [EDX]      ; EBX = Columnas (M)

            CMP EAX, EBX        ; ¿Filas == Columnas?
            JNZ no_simetrica    ; Si no es cuadrada, no puede ser simétrica

            CMP EAX, 1          ; Una matriz de 1x1 siempre es simétrica
            JZ es_simetrica

            ; --- 2. Recorrido de pares (i, j) con j > i ---
            MOV EBX, 0          ; i = 0 (fila)

bucle_i:
            MOV ECX, EBX
            ADD ECX, 1          ; j = i + 1 (columna arranca a la derecha de la diagonal)

bucle_j:
            CMP ECX, EAX        ; ¿Llegamos al final de las columnas? (j == N)
            JZ siguiente_i

            ; Calcular dirección de A[i][j]: Base + (i * N) + j
            ; Guardamos i * N temporalmente en memoria auxiliar [DS+1]
            MOV [DS+1], 0
            MOV EDX, EBX        ; Contador para multiplicar i veces

mult_i:     CMP EDX, 0
            JZ dir_ij
            ADD [DS+1], EAX     ; Suma N
            SUB EDX, 1
            JMP mult_i

dir_ij:     MOV EDX, DS
            ADD EDX, 2          ; EDX = Base
            ADD EDX, [DS+1]     ; + (i * N)
            ADD EDX, ECX        ; + j
            MOV EEX, [EDX]      ; EEX = A[i][j]

            ; Calcular dirección de A[j][i]: Base + (j * N) + i
            MOV [DS+1], 0
            MOV EDX, ECX        ; Contador para multiplicar j veces

mult_j:     CMP EDX, 0
            JZ dir_ji
            ADD [DS+1], EAX     ; Suma N
            SUB EDX, 1
            JMP mult_j

dir_ji:     MOV EDX, DS
            ADD EDX, 2          ; EDX = Base
            ADD EDX, [DS+1]     ; + (j * N)
            ADD EDX, EBX        ; + i
            MOV EFX, [EDX]      ; EFX = A[j][i]

            ; Comparar A[i][j] con A[j][i]
            CMP EEX, EFX
            JNZ no_simetrica

            ADD ECX, 1          ; j = j + 1
            JMP bucle_j

siguiente_i:
            ADD EBX, 1          ; i = i + 1
            MOV EDX, EAX
            SUB EDX, 1          ; Límite de i es N - 1
            CMP EBX, EDX
            JNZ bucle_i

es_simetrica:
            MOV EDX, DS
            MOV [EDX], 1        ; 1 = Verdadero (es simétrica)
            JMP imprimir

no_simetrica:
            MOV EDX, DS
            MOV [EDX], 0        ; 0 = Falso (no es simétrica)

imprimir:
            MOV EAX, 0x01
            LDH ECX, 1
            LDL ECX, 1
            SYS 0x2             ; Imprime resultado
            STOP