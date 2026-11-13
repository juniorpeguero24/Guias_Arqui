; estructura:
; 0 | int  | 4 bytes
; 4 | *sig | 4 bytes}
;parametro +8: puntero a la lista1
;parametro +12: puntero a la lista2
;invocacion
; push    <L1*>
; push    <L2*>
; call    ordena
; add     sp,8
;Retorna en eax el puntero a la nueva lista

ordena:
            push    bp
            mov     bp,sp

            push    ebx
            push    ecx 
            push    edx

            sub     sp,8
            mov     [bp-4],null         ;head
            mov     edx,bp
            sub     edx,4
            mov     [bp-8],edx           ;cola
            mov     ebx,[bp+8]          ;L2
            mov     ecx,[bp+12]         ;L1
siguiente:
            cmp     ebx,null
            jz      l1_while
            cmp     ecx,bull
            jz      l2_while

            cmp     [ebx+val],[ecx+val]
            jp      nuevo_nodo
            push    [ecx+val]
            call    nodo_nuevo
            add     sp,4
            mov     ecx,[ecx+sig]
            jmp     cola
nuevo_nodo:
            push    [ebx+val]
            call    nodo_nuevo
            add     sp,4
            mov     ebx,[ebx+sig]
cola:
            mov     edx,[bp-8]
            mov     [edx],eax
            add     eax,sig
            mov     [bp-8],eax
            jmp     siguiente

l1_while:
            cmp     ecx,null
            jz      ordena_fin
            push    [ecx+val]
            call    nodo_nuevo
            add     sp,4
            mov     ecx,[ecx+sig]
            mov     edx,[bp-8]
            mov     [edx],eax
            add     eax,sig
            mov     [bp-8],eax
            jmp     l1_while

l2_while:
            cmp     ebx,null
            jz      ordena_fin
            push    [ebx+val]
            call    nodo_nuevo
            add     sp,4
            mov     ebx,[ebx+sig]
            mov     edx,[bp-8]
            mov     [edx],eax
            add     eax,sig
            mov     [bp-8],eax
            jmp     l2_while
        
ordena_fin:
            mov     eax,[bp-4]
            add     sp,8
            pop     edx
            pop     ecx
            pop     ebx
            pop     bp
            ret


; estructura:
; 0 | int  | 4 bytes
; 4 | *sig | 4 bytes}
;parametro +8: puntero a la lista1
;parametro +12: puntero a la lista2
;invocacion
; push    <L1*>
; push    <L2*>
; call    ordena
; add     sp,8
;Retorna en eax el puntero a la nueva lista
ordena:
            push    bp
            mov     bp,sp

            push    ebx
            push    ecx 
            push    edx

            sub     sp,8
            mov     [bp-4],null         ;head
            mov     edx,bp
            sub     edx,4
            mov     [bp-8],edx           ;cola
            mov     ebx,[bp+8]          ;L2
            mov     ecx,[bp+12]         ;L1
siguiente:
            cmp     ebx,null
            jz      ult_l2
            cmp     ecx,null
            jz      ult_l1

            cmp     [ebx+val],[ecx+val]
            jp      conec_l2
            mov     edx,[bp-8]
            mov     edx,ebx
            add     edx,sig
            mov     [bp-8],edx
            mov     ebx,[ebx+sig]
            jmp     siguiente
conec_l2:
            mov     edx,[bp-8]
            mov     edx,ecx
            add     edx,sig
            mov     [bp-8],edx
            mov     ecx,[ecx+sig]
            jmp     siguiente

ult_l1:
            mov     edx,[bp-8]
            mov     [edx],ebx
            jmp     ordena_fin

ult_l2:     
            mov     edx,[bp-8]
            mov     [edx],ecx
ordena_fin:
            mov     eax,[bp-4]
            add     sp,8
            pop     edx
            pop     ecx
            pop     ebx
            pop     bp
            ret
