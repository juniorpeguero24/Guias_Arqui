        ;ingreso
        MOV EDX, DS
        MOV EAX, 0x01
        LDH ECX, 0x01
        LDL ECX, 0x01
        SYS 0x1

        MOV EAX, 1
        MOV ECX, [EDX]
        SUB ECX, 1
        JNP fin
        ADD ECX,1

loop_fact:  
        MOV EBX, EAX
        MOV EAX, 0
        SUB ECX, 1
        MOV EDX,ECX

multi:  ADD EAX, EBX
        SUB EDX, 1
        JNZ multi
        
        CMP ECX, 1
        JP loop_fact

fin:    STOP