        MOV EDX, DS     
        ADD EDX, 4
        MOV EBX, 0; TOTAL

inicio: MOV EAX, 0x01
        LDL ECX, 0x01
        LDH ECX, 0x01
        SYS 0x01

        CMP [EDX], 0
        JZ procesar
        CMP [EDX], 1
        JZ procesar
        JMP finalizar

procesar: 
        ADD EBX, EBX
        MOV EBX, [EDX]
        ADD EDX, 1
        JMP inicio

finalizar:    
        MOV [0], EBX
        MOV EDX,DS
        MOV EAX, 0x01
        LDL ECX, 0x01
        LDH ECX, 0x01
        SYS 0x02
        
        STOP
