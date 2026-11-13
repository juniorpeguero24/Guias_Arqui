            push d1
            push d2
            call scmp
            add sp, 8

scmp:
            push bp
            mov bp, sp

            mov eax, [bp+8] ; pos pal1
            mov ebx, [bp+12] ; pos pal2
            
siguiente:
            mov cl, b[eax] 
            mov dl, b[ebx]
            
            cmp cl, dl
            jnz diferente
            cmp cl, 0
            jz diferente
            add eax,1
            add ebx,1
            jmp siguiente

diferente:  
            sub cl,dl
            mov eax, 0
            mov al,cl
            pop bp
            ret 