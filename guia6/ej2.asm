; estructura:
; 0 | int  | 4 bytes
; 4 | *sig | 4 bytes

;remover un nodo con valor pasado como parametro
;parametro +8: puntero a la lista
;parametro +12: valor del nodo
;--------------------------------------
; invocacion:
; push <valor>
; push <nodo** head>
; call remove_nodo
; add sp,8 
;--------------------------------------
nodo_size   equ     8
val         equ     0
sig         equ     4
null        equ     -1
remove_nodo:
            push    bp
            mov     bp,sp   

            push    eax
            push    ebx
            push    edx

            mov     edx,[bp+8]      ;puntero a la lista
            mov     eax,[bp+12]     ;valor

            cmp     [edx],null      ;puntero a lista nulo
            jz      remove_fin

            mov     ebx,[edx]       ;puntero a lista   
            cmp     [ebx+val],eax
            jz      remover
            add     ebx,sig
            push    eax
            push    ebx
            call    remove_nodo
            add     sp,8
            jmp     remove_fin
remover:
            mov     eax,[ebx+sig]
            mov     [edx],eax
remove_fin:
            pop     edx
            pop     ebx
            pop     eax
            mov     sp,bp     
            pop     bp
            ret


; Buscar nodo, devuelve mismo nodo?
; supongamos que si, y pasa el parametro por valor
;parametro +8: puntero a la lista
;parametro +12: valor del nodo
;--------------------------------------
; invocacion:
; push <valor>
; push <nodo** head>
; call buscar_nodo
; add sp,8 
; devuelve en eax el puntero al nodo?
;-------------------------------------
buscar_nodo:
                push    bp     
                mov     bp,sp

                push    ebx
                push    edx

                mov     edx,[bp+8]
                mov     eax,[bp+12]
                
                cmp     [edx],null
                jz      no_encontrado
                mov     ebx,[edx]
                cmp     [ebx+val],eax
                jz      encontrado
                add     ebx,sig
                push    eax
                push    ebx
                call    buscar_nodo
                add     sp,8
                jmp     buscar_fin
encontrado:
                mov     eax,[edx]
                jmp     buscar_fin
no_encontrado: 
                mov     eax,null
buscar_fin:
                pop     edx
                pop     ebx
                mov     sp,bp
                pop     bp
                ret


;imprimir la lista:
;parametro +8: puntero a la lista
;invocacion:
;push   <head**>
;call   imprimir_lista
;add    sp,4
;----------------------------------------
imprimir_lista:
                push    bp
                mov     bp,sp

                push    eax
                push    ebx
                push    ecx
                push    edx

                mov     eax,[bp+8]
                mov     ebx,[eax]
imprimir_bucle:
                cmp     [ebx],null
                jz      imprimir_fin
 
                mov     edx,[ebx+val]
                ldh     ecx, 2
                ldl     ecx, 1
                mov     eax, 0x1
                sys     0x2

                mov     ebx,[ebx+sig]
                jmp     imprimir_bucle
imprimir_fin:
                pop     edx
                pop     ecx
                pop     ebx
                pop     eax
                mov     sp,bp
                pop     bp
                ret


                