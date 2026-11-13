; T_Grafo:
; 0   |cant V |   4 bytes
; 4   |*M     |   4 bytes
; invocacion:
; push    <origen>          +16
; push    <destino>         +12
; push    <G*>              +8
; call    contar_caminos
; add     sp,12
;devuelve en eax la cant de caminos

cant_v      equ     0
mat         equ     4

contar_caminos:
            push    bp
            mov     bp,sp
            sub     sp,8

            push    ebx
            push    ecx
            push    edx

            mov     eax,[bp+16]
            cmp     eax,[bp+12]
            jz      camino_encontrado

            mov     [bp-4],0            ;cant_cam=0
            mov     [bp-8],0            ;k=0
            mov     edx,[bp+8]          ;edx = *G

            mul     eax,[edx+cant_v]    ;eax = origen * V
            add     eax,[edx+mat]
            mov     ebx,eax

contar_bucle:
            mov     ecx,[bp-8]
            cmp     ecx,[edx+cant_v]
            jz      contar_fin

            cmp     [ebx+ecx],1
            jnz     siguiente
            
            push    ebx
            push    ecx       
            push    [bp+12]
            push    [bp+8]
            call    contar_caminos
            add     sp,12
            pop     ebx

            add     [bp-4],eax
siguiente:
            add     [bp-8],1
            jmp     salir
contar_fin:
            mov     eax,[bp-4]
salir:
            pop     edx
            pop     ecx
            pop     ebx
            mov     sp,bp
            pop     bp
            ret
