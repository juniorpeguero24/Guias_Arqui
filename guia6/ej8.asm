nodo_size   equ     12
val         equ     0
izq         equ     4
der         equ     8
null        equ     -1

;invocacion:
; push    <valor>
; call    nodo_nuevo
; add     sp,4
;devuelve en eax el nodo nuevo
nodo_nuevo:
            push    bp
            mov     bp,sp

            push    nodo_size
            call    alloc
            add     sp,4
            
            cmp     eax,null
            jz      nodo_fin
            mov     [eax+val],[bp+8]
            mov     [eax+izq],null
            mov     [eax+der],null
nodo_fin:
            pop     bp
            ret

; a. Agregar un nodo al árbol.
; invocacion:
; push    <valor>
; push    <root**>
; call    insert_nodo
; add     sp,8
;parametros:    +8 root
;               +12 valor
insert_nodo:
            push    bp
            mov     bp,sp

            push    eax
            push    ebx
            push    edx

            mov     edx,[bp+8]

            cmp     [edx],null
            jz      insert

            mov     ebx,[edx]
            
            cmp     [ebx+val],[eax+val]
            jp      insert_left
insert_der:
            add     ebx,der
            push    [bp+12]
            push    ebx
            call    insert_nodo
            add     sp,8
            jmp     insert_fin
insert_left:
            add     ebx,izq
            push    [bp+12]
            push    ebx
            call    insert_nodo
            add     sp,8
            jmp     insert_fin
insert:     
            push    [bp+12]
            call    nodo_nuevo
            add     sp,4
            mov     [edx],eax
insert_fin: 
            pop     edx
            pop     ebx
            pop     eax
            mov     sp,bp
            pop     bp
            ret

; Preorden
; push    <root**>
; call    preorden
; add     sp,4
preorden:
            push    bp
            mov     bp,sp

            push    eax
            push    ebx
            push    ecx
            push    edx

            mov     edx,[bp+8]
            mov     ebx,[edx]

            cmp     ebx,null
            jz      preorden_fin

            mov     eax,0x01
            mov     edx,[ebx+val]
            ldl     ecx,1
            ldh     ecx,4 
            sys     0x2
            
            mov     eax,ebx
            add     eax,izq
            push    eax
            call    preorden
            add     sp,4
            
            mov     eax,ebx
            add     eax,der
            push    eax
            call    preorden
            add     sp,4
preorden_fin:
            pop     edx
            pop     ecx
            pop     ebx
            pop     eax
            mov     sp,bp
            pop     bp
            ret

inorden:
            push    bp
            mov     bp,sp

            push    eax
            push    ebx
            push    ecx
            push    edx

            mov     edx,[bp+8]
            mov     ebx,[edx]

            cmp     ebx,null
            jz      inorden_fin

            mov     eax,ebx
            add     eax,izq
            push    eax
            call    inorden
            add     sp,4

            mov     eax,0x01
            mov     edx,[ebx+val]
            ldl     ecx,1
            ldh     ecx,4
            ;Que se pone en ldl y ldh realmente? 
            sys     0x2
            
            mov     eax,ebx
            add     eax,der
            push    eax
            call    inorden
            add     sp,4
inorden_fin:
            pop     edx
            pop     ecx
            pop     ebx
            pop     eax
            mov     sp,bp
            pop     bp
            ret

postorden:
            push    bp
            mov     bp,sp

            push    eax
            push    ebx
            push    ecx
            push    edx

            mov     edx,[bp+8]
            mov     ebx,[edx]

            cmp     ebx,null
            jz      postorden_fin

            mov     eax,ebx
            add     eax,izq
            push    eax
            call    postorden
            add     sp,4
            
            mov     eax,ebx
            add     eax,der
            push    eax
            call    postorden
            add     sp,4

            mov     eax,0x01
            mov     edx,[ebx+val]
            ldl     ecx,1
            ldh     ecx,4
            ;Que se pone en ldl y ldh realmente? 
            sys     0x2

postorden_fin:
            pop     edx
            pop     ecx
            pop     ebx
            pop     eax
            mov     sp,bp
            pop     bp
            ret

;e. Solicitar un número e informar si el mismo se encuentra o no en el árbol.
;push   <valor>     +12
;push   <root**>    +8
;call   encontrar
;add    sp,8
;devuelve en eax 1(encontrado) o 0(no encontrado)
encontrar:
            push    bp
            mov     bp,sp

            push    ebx
            push    edx

            mov     edx,[bp+8]
            mov     ebx,[edx]

            cmp     ebx,null
            jz      no_encontrado

            cmp     [ebx+val],[bp+12]
            jz      encontrado
            jp      encontrado_izq
encontrado_der:            
            add     ebx,der
            push    [bp+12]
            push    ebx
            call    encontrar
            add     sp,8
            jmp     encontrar_fin
encontrado_izq:
            add     ebx,izq
            push    [bp+12]
            push    ebx
            call    encontrar
            add     sp,8
            jmp     encontrar_fin
no_encontrado:
            mov     eax,0
            jmp     encontrar_fin
encontrado: 
            mov     eax,1
encontrar_fin:
            pop     edx
            pop     ebx
            mov     sp,bp
            pop     bp
            ret

;f. altura
;invocacion:
;push   <root**>
;call   altura
;add    sp,4
;devuelve en eax la altura
altura:
            push    bp
            mov     bp,sp

            push    ebx
            push    ecx
            push    edx

            mov     edx,[bp+8]
            mov     ebx,[edx]
            mov     eax,0

            cmp     ebx,null
            jz      altura_cero

            mov     eax,ebx
            add     eax,izq
            push    eax
            call    altura
            add     sp,4
            push    eax
            
            mov     edx,[bp+8]
            mov     ebx,[edx]
            mov     eax,ebx
            add     eax,der
            push    eax
            call    altura
            add     sp,4

            pop     ecx
            cmp     ecx,eax
            jnp     der_mayor
            mov     eax,ecx
der_mayor:
            add     eax,1
            jmp     altura_fin
altura_cero:
            mov     eax,0
altura_fin:
            pop     edx
            pop     ecx
            pop     ebx
            mov     sp,bp
            pop     bp
            ret

