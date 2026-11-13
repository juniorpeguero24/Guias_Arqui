; 0 |val  4 bytes |
; 4 |*ant 4 bytes |
; 8 |*sig 4 bytes |
;---------------------------
; invocacion:
; push    <L*>
; call    repetidos
; add     sp,4
;devuelve en eax la cantida dde nodos eliminados
val     equ     0
ant     equ     4
sig     equ     8
nodosize    equ     12

repetidos:
            push    bp
            mov     bp,sp

            push    ebx
            push    ecx
            push    edx
            push    eex
            push    efx

            mov     edx,[bp+8]
            mov     eax,0

            cmp     edx,null
            jz      rep_fin

            mov     ebx,edx     ;p:actual
            mov     ecx,[edx+sig]     ;q:explorador
rep_bucle:
            cmp     ecx,ebx
            jz      siguiente
            cmp     [ebx+val],[ecx+val]
            jz      elimina
            mov     ecx,[ecx+sig]
            jmp     rep_bucle
elimina:
            mov     efx,[ecx+sig]
            mov     eex,[ecx+ant]

            mov     [efx+ant],eex
            mov     [eex+sig],efx
            
            mov     ecx,efx
            add     eax,1
            jmp     rep_bucle
siguiente:  
            mov     ebx,[ebx+sig]
            cmp     ebx,edx
            jz      rep_fin
            mov     ecx,[ebx+sig]
            jmp     rep_bucle
rep_fin:
            pop     efx
            pop     eex
            pop     edx
            pop     ecx
            pop     ebx
            mov     sp,bp
            pop     bp
            ret