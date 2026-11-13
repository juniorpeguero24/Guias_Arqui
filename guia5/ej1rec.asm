;Subrutina
        PUSH N
        PUSH X
        CALL potencia
        ADD SP,8
        ;devuelve en eax el resultado de X^N

potencia:
        PUSH BP
        MOV BP, SP
        
        MOV ECX, [BP+12] ;ECX = N 
        CMP ECX, 0 ; Comparar N con 0  
        JNP caso_base

        SUB ECX, 1
        PUSH ECX ;apila N-1
        PUSH [BP+8] ;apila X
        CALL potencia ;llamada recursiva
        ADD SP, 8 

        MUL EAX, [BP+8] ; EAX = EAX * X
        JMP fin

caso_base:
        MOV EAX, 1 ; X^0 = 1

fin:    
        POP BP
        RET