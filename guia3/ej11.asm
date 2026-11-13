            ;Suponemos que en el tope donde apunta DS esta N
            MOV EDX,DS
            MOV EAX, [EDX]
            ;caso base
            CMP EAX,0
            JNP fin
            ;Tomar el primero como maximo
            ADD EDX,1
            MOV EBX,[EDX]
            MOV EFX,1
            SUB EAX,1
            JZ imprimir

recorrer:   ADD EDX,1
            CMP [EDX],EBX
            JZ es_igual
            JP nuevo_max

siguiente:
            SUB EAX,1
            JNZ recorrer
            JMP imprimir

nuevo_max:  MOV EBX,[EDX]
            MOV EFX,1
            JMP siguiente

es_igual:   ADD EFX,1
            JMP siguiente            
            
imprimir:   MOV EDX,DS
            MOV [EDX],EBX
            MOV EAX,0x01
            LDH ECX,1
            LDL ECX,1
            SYS 0x2

            MOV [EDX],EFX
            MOV EAX,0x01
            LDH ECX,1
            LDL ECX,1
            SYS 0x2

fin:        STOP