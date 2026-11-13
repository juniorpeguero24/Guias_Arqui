\\DATA 1024
\\EXTRA 1024
TXT_ADD  EQU "ADD\0"
TXT_SUB  EQU "SUB\0"
TXT_MUL  EQU "MUL\0"
TXT_DIV  EQU "DIV\0"    

main:   
    push bp
    mov bp,sp   
    ;short int x, y;
    sub sp,12  
    ;ops
    mov l[ds+0],add
    mov l[ds+4],sub
    mov l[ds+8],mul
    mov l[ds+12],div
    ;nom
    mov l[ds+16], TXT_ADD
    mov l[ds+20], TXT_SUB
    mov l[ds+24], TXT_MUL
    mov l[ds+28], TXT_DIV    

    
    ;scanf("%d %d", &x, &y);
    mov eax,0x01
    ldl ecx,2
    ldh ecx,2
    sys 0x1 ;x
    mov [bp-4],dx 
    
    mov eax,0x01
    ldl ecx,2
    ldh ecx,2
    sys 0x1 ;y
    mov [bp-8],dx
    
    mov [bp-12],0 ;i
for_main:
    cmp [bp-12],4
    jz fin_main
    ;imprimir nom
    mov edx,ds
    add edx,16
    mov ebx,[bp-12]
    mul ebx,4
    add edx,ebx
    mov eax,[edx]
    mov edx,ks
    add edx,eax
    sys 0x04

    ;buscar el op
    mov eax,ds
    add eax,ebx

    push [bp-8]
    push [bp-4]
    call [eax]
    add sp,8
    ;supongamos que vuelve en eax
    mov edx,eax
    ldh ecx,2
    ldl ecx,2
    mov eax, 0x01
    sys 0x2

    add [bp-12],1
    jmp for_main
fin_main:
    mov sp,bp
    pop bp
    ret

add:
    push bp
    mov bp,sp
    mov eax,0
    mov ax,w[bp+8]
    add ax,w[bp+12]
    pop bp
    ret

sub:
    push bp
    mov bp,sp
    mov eax,0
    mov ax,w[bp+8]
    sub ax,w[bp+12]
    pop bp
    ret

mul:
    push bp
    mov bp,sp
    mov eax,0
    mov ax,w[bp+8]
    mul ax,w[bp+12]
    pop bp
    ret

div:
    push bp
    mov bp,sp
    mov eax,0
    mov ax,w[bp+8]
    div ax,w[bp+12]
    pop bp
    ret