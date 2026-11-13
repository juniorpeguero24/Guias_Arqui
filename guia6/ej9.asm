; 0   |val    2 bytes|
; 2   |izq    4 bytes|
; 6   |der    4 bytes|

nodo_size   equ     10
val         equ     0 
izq         equ     2
der         equ     6
null        equ     -1

; invocacion:
; push    <root*>
; call    suma_hijos
; add     sp,4
; devuelve en eax el resultado

suma_hijos:
            push    bp
            mov     bp,sp

            push    ebx
            push    ecx
            push    edx

            mov     ebx,[bp+8]      
            mov     eax,1

            cmp     ebx,null
            jz      suma_fin
            
            cmp     [ebx+izq],null
            jnz      tiene_hijos
            cmp     [ebx+der],null
            jz      suma_fin
tiene_hijos:
            mov     cx,0
            cmp     [ebx+izq],null
            jz      preg_der
            mov     edx,[ebx+izq]
            add     cx,w[edx+val]

preg_der:
            cmp     [ebx+der],null
            jz      preg
            mov     edx,[ebx+der]
            add     cx,w[edx+val]
preg:
            cmp     w[ebx+val],cx
            jnz     cero
            push    [ebx+izq]
            call    suma_hijos
            add     sp,4
            cmp     eax,0
            jz      suma_fin
            push    [ebx+der]
            call    suma_hijos
            cmp     eax,0
cero:
            mov     eax,0
suma_fin:   
            pop     edx
            pop     ecx
            pop     ebx
            mov     sp,bp
            pop     bp
            ret

; invocacion:
; push    <root**>
; call    maximo
; add     sp,4
;devuelve en eax el nodo max
maximo:
            push    bp
            mov     bp,sp
            sub     sp,8

            push    ebx
            push    ecx
            push    edx

            mov     edx,[bp+8]
            mov     [bp-4],edx         ;max = A
            
            cmp     ebx,null
            jz      max_fin

            mov     ebx,[ebx]
            add     ebx,izq
            push    ebx
            call    maximo
            add     sp,4
            mov     [bp-8],eax     ;izq = eax
            
            mov     edx,[bp+8]
            mov     ebx,[ebx]
            add     ebx,der
            push    ebx
            call    maximo
            add     sp,4
            mov     edx,eax     ;edx = der 

            mov     ecx,[bp-8]
            cmp     [ecx],null
            jz      check_der

            mov     ebx,[ecx]       ;ebx = *izq
            mov     eax,[bp-4]      ;eax = max
            mov     eax,[eax]       ;eax = *max
            cmp     w[ebx+val],w[eax+val]  ;(*izq)->dato > (*max)->dato
            jnp     check_der
            mov     [bp-4],ecx
check_der:
            cmp     [edx],null     
            jz      max_fin

            mov     ebx,[edx]
            mov     eax,[bp-4]
            mov     eax,[eax]
            cmp     w[ebx+val],w[eax+val]
            jnp     max_fin
            mov     [bp-4],edx
max_fin:
            mov     eax,[bp-4]
            pop     edx
            pop     ecx
            pop     ebx
            mov     sp,bp
            pop     bp
            ret