            ;Supongamos i en DS y en el siguiente j y Despues el vector lo hagamos en DS + 50
            MOV EDX,DS
            MOV EAX,[EDX] ;EAX = N
            ADD EDX,1
            MOV EBX,[EDX] ;EBX = M

            MOV ECX,DS
            ADD ECX,50 ;Ubicamos vector
            ; [DS+1] VAR OP para contar filas restantes
            MOV EEX,0 ; EEX = j

columna:    CMP EEX,EBX ; j=M?
            JZ fin

            MOV EDX, DS
            ADD EDX,2 ;Base
            ADD EDX,EEX ;BASE + j 

            MOV EFX,[EDX]; EFX=MIN provisional i=0

            MOV [DS+1],EAX
            SUB [DS+1],1
            JZ guardar ;N=1 ya esta el minimo

fila:
            ADD EDX, EBX ;Salto a la siguiente fila

            CMP [EDX], EFX ;[EDX] < EFX?
            JN nuevo
            JMP siguiente

nuevo:      MOV EFX, [EDX]

siguiente:  SUB [DS+1],1 ;resta una fila
            JNZ fila

guardar:    MOV [ECX], EFX
            ADD ECX, 1

            ADD EEX,1
            JMP columna

fin:        STOP
