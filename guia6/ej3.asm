;-------------------------------
;0 | val | 2 bytes
;2 | sig*| 4 bytes
;-------------------------------
;invocacion:
;push   <L*>
;call   ascendente
;add    sp,4
;devuelve en eax 1 o -1
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

            mov     eax,1
            mov     ebx,[bp+8]
            cmp     ebx,null
            jz      asc_fin
            
asc_bucle:
            mov     cx,w[ebx+val]
            mov     ebx,[ebx+sig]
            cmp     ebx,null
            jz      asc_fin
            cmp     w[ebx+val],cx
            jn      asc_error
            jmp     asc_bucle
asc_error:
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

            mov     edx,[bp+8]
            mov     eax,[bp+8]
            cmp     [edx],null
            jz      max_fin

            mov     ebx,[edx]
            add     ebx,sig
            push    ebx
            call    maximo
            add     sp,4

            mov     ecx,eax             ;max=retorno de maximo

            cmp     [ecx],null
            jz      retornar_L
            mov     edx,[ecx]           ;edx=*max
            mov     bx,0
            mov     bx,w[edx+val]
            
            mov     edx,[bp+8]
            mov     edx,[edx]
            mov     ax,0
            mov     ax,w[edx+val]
            cmp     ax,bx
            jnn     retornar_L
            mov     eax,ecx
            jmp     max_fin
retornar_L:
            mov     eax,[bp+8]
max_fin:        
            pop     ecx
            pop     ebx
            mov     sp,bp
            pop     bp
            ret