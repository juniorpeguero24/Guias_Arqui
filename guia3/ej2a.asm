        MOV EDX, DS     
        ADD EDX, 4
        MOV [0], 0x00; ACUMULADOR
        MOV EBX, 1

inicio: MOV EAX, 0x01
        LDL ECX, 0x01
        LDH ECX, 0x01
        SYS 0x01

        CMP [EDX], 0
        JZ procesar_cero
        CMP [EDX], 1
        JZ procesar_uno
        JMP finalizar

procesar_uno: 
        ADD [0], EBX

procesar_cero: 
        ADD EBX, EBX
        ADD EDX, 1
        JMP inicio

finalizar:    
        MOV EDX,DS
        MOV EAX, 0x01
        LDL ECX, 0x01
        LDH ECX, 0x01
        SYS 0x02
        
        STOP
