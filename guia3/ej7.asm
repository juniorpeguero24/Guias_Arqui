        MOV EDX, DS  
        MOV [EDX], 0x00; CARGAMOS CERO
        MOV EAX, 0x01
        LDH ECX, 0x01
        LDL ECX, 0x01
        SYS 0x1

        MOV EBX, [EDX]

        CMP EBX, 1
        JZ no_primo
        CMP EBX, 2
        JZ primo

        MOV ECX, 2        
probar: 
        MOV EAX,EBX
        DIV EAX, ECX

        CMP AC, 0
        JZ no_primo

        ADD EAX, 1
        CMP ECX,EBX
        JNZ probar
        JZ primo

no_primo:   
        MOV [EDX], 0
        JMP imprimir

primo:
        MOV [EDX], 1

imprimir:
        MOV EAX, 0x01
        LDH ECX, 0x01
        LDL ECX, 0x01
        SYS 0x2
        
        STOP

                
