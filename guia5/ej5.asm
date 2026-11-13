        ;supongamos que vienen en una direccion dada un vector con la polaca
        push dir
        call polaca
        add sp,4

polaca:     
        push bp
        mov bp,sp
        
        mov ebx,[bp+8]  
sigue:
        cmp [ebx],00
        jz fin
        cmp [ebx],-1
        jz fin

        mov edx,[ebx]
        mov dl,b[edx]
        
        cmp  dl, 43         ; '+'
        jz   hacer_suma
        cmp  dl, 45         ; '-'
        jz   hacer_resta
        cmp  dl, 42         ; '*'
        jz   hacer_multi
        cmp  dl, 47         ; '/'
        jz   hacer_divi
        
        push [ebx]
        call atoi
        add sp,4
        push eax
        add ebx,4
        jmp sigue

hacer_suma:
        pop eax  ;op2
        pop ecx  ;op1
        add  ecx, eax
        jmp  guardar_res

hacer_resta:
        pop eax  ;op2
        pop ecx  ;op1
        sub  ecx, eax
        jmp  guardar_res

hacer_multi:
        pop eax  ;op2
        pop ecx  ;op1
        mul  ecx, eax
        jmp  guardar_res

hacer_divi:
        pop eax  ;op2
        pop ecx  ;op1
        div  ecx, eax

guardar_res:
        push ecx
        add ebx,4
        jmp sigue

fin:    
        pop eax
        pop bp
        ret