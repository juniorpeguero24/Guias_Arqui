   
            push d1
            push d2
            call scat
            add sp, 8

scat:
            push bp
            mov bp, sp
            
            push [bp+12]
            call slen
            add sp, 4


            mov eax,[bp+12]
            add eax, ecx  ; pos final pal1
            mov ebx, [bp+8] ; pos pal2
            
            push eax
            push ebx
            call scpy
            add sp, 8
        
            pop bp
            ret