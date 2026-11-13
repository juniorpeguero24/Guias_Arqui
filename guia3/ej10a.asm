            MOV EBX, 0      ; Contador de elementos (N)
            MOV EDX, DS     ; EDX apunta al inicio del vector en memoria

carga:      MOV EAX, 0x01
            LDL ECX, 1
            LDH ECX, 1
            SYS 0x1         ; Lee un número en [EDX]

            CMP [EDX], 0
            JN fin_carga    ; Si es negativo, corta la primera carga

            ADD EBX, 1      ; Suma 1 al contador N
            ADD EDX, 1      ; Avanza a la siguiente posición del vector
            JMP carga

fin_carga:
            ; La celda donde quedó EDX (donde se leyó el negativo)
            ; se usa como celda fija para la segunda tanda.
            MOV EEX, EDX    ; EEX guarda esa dirección fija
            SUB EBX, 1      ; EBX = N - 1 (cantidad de números a leer)

otro:       
            CMP EBX, 0      ; ¿Ya se leyeron los N - 1 números?
            JZ buscar_libre

            MOV EDX, EEX    ; Apunta EDX a la celda fija
            MOV EAX, 0x01
            LDL ECX, 1
            LDH ECX, 1
            SYS 0x1         ; Lee el número en la celda fija [EEX]

            MOV EAX, DS     ; EAX vuelve al inicio del vector para buscar

buscar:     MOV EFX, [EAX]
            CMP EFX, [EEX]  ; Compara el elemento del vector con el recién leído
            JZ encontrado

            ADD EAX, 1      ; Avanza en el vector buscando la coincidencia
            JMP buscar

encontrado: 
            MOV [EAX], -1   ; Tacha el número encontrado con -1
            SUB EBX, 1      ; Descuenta una lectura pendiente
            JMP otro

buscar_libre:
            MOV EDX, DS     ; EDX vuelve al principio del vector

ultimo:     CMP [EDX], -1   ; ¿Está tachado?
            JNZ fin         ; Si NO es -1, es el que faltaba
            ADD EDX, 1      ; Si está tachado, pasa al siguiente casillero
            JMP ultimo

fin:        
            ; En [EDX] quedó el número que faltaba
            MOV EAX, 0x01
            LDL ECX, 1
            LDH ECX, 1
            SYS 0x2         ; Imprime el resultado
            STOP