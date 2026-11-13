inicio:            
            MOV EAX, 0x01
            MOV EDX, DS
            LDH ECX, 0x01
            LDL ECX, 0x01
            SYS 0x1

            CMP [EDX], 0
            JN fin
            JZ es_cero

            MOV EAX, 0;contador de bits en 1
            MOV EBX, [EDX]

extraer_bit:
            MOV ECX, EBX
            AND ECX, 1
            ADD EAX, ECX

            SHR EBX, 1
            JNZ extraer_bit
            JMP imprimir
            
es_cero: 
            MOV EAX, 0

imprimir:
            MOV [EDX],EAX
            MOV EAX, 0x01
            LDH ECX, 0x01
            LDL ECX, 0x01
            SYS 0x2
            
            JMP inicio

fin:        STOP



