arbol:
0   |val    |   4 bytes
4   |izq    |   4 bytes
8   |der    |   4 bytes
lista:
0   |val    |   4 bytes
4   |sig    |   4 bytes

val     equ     0
izq     equ     4
der     equ     8
sig     equ     4
null    equ     -1

; invocacion:
; push    <L**>         +12
; push    <root**>      +8
; call    nuevaL
; add     sp,8

nuevaL:
            push    bp
            mov     bp,sp

            push    ebx
            push    ecx 
            push    edx

            mov     edx,[bp+12]
            mov     ebx,[edx]

            cmp     ebx,null
            jz      nueva_fin
            push    [ebx+val]
            push    [bp+8]
            call    encontrar
            add     sp,8
            cmp     eax,1
            jz      encontrado
            add     ebx,sig
            mov     edx,ebx
            jmp     siguiente
encontrado:    
            mov     ecx,[ebx+sig]
            mov     [edx],ecx
siguiente:
            push    edx
            push    [bp+8]
            call    nuevaL
            add     sp,8
nueva_fin:
            pop     edx
            pop     ecx
            pop     ebx
            mov     sp,bp
            pop     bp
            ret
