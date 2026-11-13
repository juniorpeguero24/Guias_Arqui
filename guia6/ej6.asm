;invocacion:
; push    <L*>
; call    invertir
; add     sp,4
;devuelve en eax la nueva cabeza

invertir:   
            push    bp
            mov     bp,sp

            push    ebx
            push    edx

            mov     eax,null            ;ant
            mov     edx,[bp+8]          ;act/L

inv_bucle:
            cmp     edx,null
            jz      inv_fin
            mov     ebx,[edx+sig]       ;sig-temporal
            mov     [edx+sig],eax       ;act->sig = ant
            mov     eax,edx             ;ant = act
            mov     edx,ebx             ;act = sig-temporal
            jmp     inv_bucle
inv_fin:
            pop     edx
            pop     ebx
            mov     sp,bp
            pop     bp
            ret