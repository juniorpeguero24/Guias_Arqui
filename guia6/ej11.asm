; arbol:
; 0   |val    |   4 bytes
; 4   |*h     |   4 bytes puntero a celda tipo H
; H
; 0   |*nodo  |   4 bytes
; 4   |*sig_h |   4 bytes
; lista:
; 0   |*arb   |   4 bytes
; 4   |*sig_l |   4 bytes

val     equ     0
hijos   equ     4
nodo_h  equ     0
sig_h   equ     4
;lista
arbol   equ     0
sig_l   equ     4

; invocacion:
; push    <valor>
; push    <root**>
; call    buscaYelim
; add     sp,8
;devuelve en eax nodos eliminados
buscaYelim:
            push    bp
            mov    bp,sp
            sub     sp,4

            push    ebx
            push    ecx
            push    edx

            mov     edx,[bp+8]
            mov     eax,0
            mov     [bp-4],eax

            cmp     [edx],null
            jz      busca_fin
            mov     ebx,[edx]
            mov     ebx,[ebx+hijos]
busca_loop:
            cmp     ebx,null
            jz      compara
            push    ebx
            push    [bp+12]
            push    ebx
            call    buscaYelim
            add     sp,8
            add     [bp-4],eax
            pop     ebx
            mov     ebx,[ebx+sig_h]
            jmp     busca_loop
compara:
            mov     edx,[bp+8]
            mov     ebx,[edx]
            cmp     [ebx+val],[bp+12]
            jnz     busca_fin
            add     [bp-4],1
            mov     ecx,[ebx+hijos]
            cmp     ecx,null
            jz      sin_hijos
            mov     ecx,[ecx+nodo_h]
            mov     [edx],ecx
            jmp     busca_fin
sin_hijos:
            mov     [edx],null
busca_fin:
            mov     eax,[bp-4]
            pop     edx
            pop     ecx
            pop     ebx
            mov     sp,bp
            pop     bp
            ret

; invocacion:
; push    <valor>         +12
; push    <L**>           +8
; call    elim
; add     sp,8
; devuelve en eax cantidad de nodos eliminados
elim:
            push    bp
            mov     bp,sp
            sub     sp,4

            push    ebx
            push    ecx
            push    edx

            mov     edx,[bp+8]
            mov     ebx,[edx]
            mov     [bp-4],0
            
            cmp     ebx,null
            jz      elim_fin
            
            push    [bp+12]
            push    ebx
            call    buscaYelim
            add     sp,8
            
            mov     [bp-4],eax
            
            cmp     [ebx+arbol],null
            jnz     no_nulo
            mov     ecx,[ebx+sig_l]
            mov     [edx],ecx

            push    [bp+12]
            push    edx
            call    elim
            add     sp,8
            add     [bp-4],eax
            jmp     elim_fin
no_nulo:
            add     ebx,sig_l
            push    [bp+12]
            push    ebx
            call    elim
            add     sp,8
            add     [bp-4],eax
elim_fin:
            mov     eax,[bp-4]
            pop     edx
            pop     ecx
            pop     ebx
            mov     sp,bp
            pop     bp
            ret