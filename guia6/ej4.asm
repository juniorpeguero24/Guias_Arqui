;-------------------------------
;0 | val | 2 bytes
;2 | sig*| 4 bytes
;-------------------------------
;invocacion:
;push   <L*>
;call   ascendente
;add    sp,4
;devuelve en eax 1 o 0
;------------------
;parametros: +8 puntero a lista
nodo_size   equ     6
val         equ     0
sig         equ     2
null        equ     -1

ascendente:
            push    bp
            mov     bp,sp

            push    ebx
            push    ecx

            mov     ebx,[bp+8]

            cmp     ebx,null
            jz      asc_1
            mov     cx,w[ebx+val]
            mov     ebx,[ebx+sig]
            cmp     ebx,null
            jz      asc_1
            cmp     w[ebx+val],cx
            jn      asc_0

            push    ebx
            call    ascendente
            add     sp,4
            jmp     asc_fin
asc_1:      
            mov     eax,1
            jmp     asc_fin
asc_0:      
            mov     eax,0
asc_fin:
            pop     ecx
            pop     ebx
            mov     sp,bp
            pop     bp
            ret

; b)
; invocacion:
; push    <lista**>
; call    maximo
; add     sp,4
; devuelve en eax el maximo
maximo:
            push    bp
            mov     bp,sp

            push    ebx
            push    ecx
            push    edx

            mov     edx,[bp+8]
            mov     eax,[bp+8]

            cmp     [edx],null
            jz      max_fin

            mov     edx,[edx]
            add     edx,sig
maximo_bucle:
            cmp     [edx],null
            jz      max_fin
            mov     ebx,[edx]
            mov     bx,w[ebx+val]
            mov     ecx,[eax]
            mov     cx,w[ecx+val]
            cmp     cx,bx
            jn      nuevo_max
avanzar:
            mov     edx,[edx]
            add     edx,sig
            jmp     maximo_bucle
nuevo_max:
            mov     eax,edx
            jmp     avanzar
max_fin:
            pop     edx
            pop     ecx
            pop     ebx
            mov     sp,bp
            pop     bp
            ret
