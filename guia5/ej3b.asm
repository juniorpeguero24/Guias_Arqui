        push d1 ;el entero
        push d2  ;la direc de escritura
        call convert
        add sp,8

convert: 
        push bp
        mov bp,sp

        mov ecx,0 
        mov eax,[bp+12]
        mov ebx,[bp+8]
while:        
        div eax,10
        add ac,48
        push ac
        add ecx,1
        cmp eax,0
        jp while
        
guardar:
        cmp ecx,0
        jz fin
        pop edx
        mov b[ebx],dl
        add ebx,1
        sub ecx,1
        jmp guardar

fin:    
        mov b[ebx],00
        pop bp
        ret