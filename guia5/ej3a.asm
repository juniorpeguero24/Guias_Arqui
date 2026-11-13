            push d1
            call convertir
            add sp,4
            ;devuelve en eax el numero en decimal

            push bp
            mov bp,sp

            mov eax,0
            mov ebx,[bp+8]

while:
            cmp b[ebx],00
            jz fin
            mov ecx,0
            mov cl,b[ebx]
            sub cl,48
            mul eax,10
            add eax,ecx
            add ebx,1
            jmp while

fin:
            pop bp
            ret 


            