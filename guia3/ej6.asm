            MOV EAX, 0

dividir:    CMP EBX,ECX
            JN fin
            SUB EBX,ECX
            ADD EAX,1
            JMP dividir

fin:        MOV AC,EBX
            STOP

