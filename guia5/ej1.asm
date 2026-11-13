;Subrutina
        PUSH N
        PUSH X
        CALL potencia
        ADD SP,8
        ;devuelve en eax el resultado de X^N

potencia:
        PUSH BP
        MOV BP, SP
        
        MOV EAX, 1 ; Cargar 1 en EAX en caso de que N sea 0
        MOV ECX, [BP+12] ; Cargar N en ECX
        
while:  
        CMP ECX, 0 ; Comparar N con 0
        JNP fin
        MUL EAX, [BP+8] ; Multiplicar EAX por X
        SUB ECX, 1 ; Decrementar N
        JMP while ; Repetir el proceso

fin:    POP BP
        RET 
