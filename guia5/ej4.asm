\DATA 1000
\STACK 1024

main:  
        push bp
        mov bp,sp
        push [bp+12]
        push ds
        call operacion
        add sp,8

        mov edx,ds
        sys 0x04

        pop bp
        ret

operacion:
        push bp
        mov bp,sp
        
        mov ebx,[bp+12]
        push [ebx]
        call atoi
        add sp,4
        mov ecx,eax

        push [ebx+8]
        call atoi
        add sp,4

        mov edx,[ebx+4]
        mov dl,b[edx]

        cmp  dl, 43         ; '+'
        jz   hacer_suma
        cmp  dl, 45         ; '-'
        jz   hacer_resta
        cmp  dl, 42         ; '*'
        jz   hacer_multi
        cmp  dl, 47         ; '/'
        jz   hacer_divi

hacer_suma:
        add  ecx, eax
        jmp  guardar_res

hacer_resta:
        sub  ecx, eax
        jmp  guardar_res

hacer_multi:
        mul  ecx, eax
        jmp  guardar_res

hacer_divi:
        div  ecx, eax
        ; El cociente queda en ecx

guardar_res:
        push ecx
        push [bp+8]
        call itoa
        add sp,8
        pop bp
        ret
        