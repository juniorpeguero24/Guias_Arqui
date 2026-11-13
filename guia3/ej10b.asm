            MOV EBX,0 ; INICIALIZAMOS SUMADOR
            MOV EEX,0 ; INICIALIZAMOS CONTADOR

carga:      MOV EDX,DS
            MOV EAX,0x01
            LDH ECX,1
            LDL ECX,1
            SYS 0x1

            CMP [EDX], 0
            JN fin_carga

            ADD EBX,[EDX]
            ADD EEX,1
            JMP carga

fin_carga:  SUB EEX,1
            JZ imprimir

lectura:    MOV EDX,DS
            MOV EAX,0x01
            LDH ECX,1
            LDL ECX,1
            SYS 0x1

            SUB EBX,[EDX]
            SUB EEX,1
            JNZ lectura

imprimir:   MOV [EDX],EBX
            MOV EAX,0x01
            LDH ECX,1
            LDL ECX,1
            SYS 0x2
            
            STOP