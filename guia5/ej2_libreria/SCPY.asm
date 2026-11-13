            push d1 ;origen
            push d2 ;destino
            call scpy
            add sp, 8

scpy:       
            push bp
            mov bp, sp

            mov eax, [bp+8] ; pos destino
            mov ebx, [bp+12] ; pos origen

while:      
            cmp b[ebx],00
            jz fin
            mov cl,b[ebx]
            mov b[eax],cl
            add eax,1
            add ebx,1
            jmp while

fin:
            mov b[eax],00 ; Agregar el terminador nulo al final
            pop bp
            ret      