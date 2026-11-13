                MOV EAX, 0x01
                MOV EDX, DS
                LDH ECX, 0x02
                LDL ECX, 0x01
                SYS 0x1

                MOV EAX, [EDX]
                ADD EDX, 10
                MOV EBX, 0
                
extraer:        MOV ECX, EAX
                AND ECX, 1
                MOV [EDX], ECX

                ADD EDX, 1
                ADD EBX, 1
                SHR EAX, 1

                CMP EAX, 0
                JNZ extraer 
                
imprime:        SUB EDX, 1
                MOV EAX, 0x10
                LDH ECX, 0x01
                LDL ECX, 0x01
                SYS 0x2

                SUB EBX, 1
                CMP EBX, 0
                JNZ imprime
                
                STOP


