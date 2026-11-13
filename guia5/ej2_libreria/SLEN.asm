            PUSH direc
            CALL slen
            ADD SP,4
            ;devuelve en ECX la longitud de la cadena
slen:
            PUSH BP
            MOV BP, SP
            MOV EAX,[BP+8]  ;supongamos que esta aca
            
            MOV ECX,0
loop:
            CMP b[EAX],00
            JZ fin
            ADD ECX,1
            ADD EAX,1
            JMP loop

fin:
            POP BP
            RET