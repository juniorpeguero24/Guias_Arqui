            push d1
            call strim
            add sp,4

strim:
            push bp
            mov bp,sp

            mov eax, [bp+8]
            
            push eax 
            call slen
            add sp,4
            ;devuelve en ecx la longitud de la cadena

            add eax,ecx   
            sub eax,1
siguiente:
            cmp b[eax],32
            jnz final
            sub eax,1
            jmp siguiente
final:
            add eax,1
            mov b[eax],00
            mov eax, [bp+8]
inicio:            
            cmp b[eax],32
            jnz fin
            add eax,1
            jmp inicio
            
fin:
            push eax
            push [bp+8]
            call scpy
            add sp,8

            pop bp
            ret
