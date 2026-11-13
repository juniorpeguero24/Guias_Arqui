
            mov edx,ds
            mov ecx,-1
            sys 0x03
            
            ;subrutina limpia palabra
            mov eax,ds
            add eax,500
sigue:
            mov cl,b[edx]
            cmp cl,00
            jz fin_copia

            cmp cl,65
            jn siguiente
            cmp cl,90
            jnp mayus
            cmp cl,97
            jn siguiente
            cmp cl,122
            jnp min
            jmp siguiente

mayus:
            add cl,32
min:
            mov b[eax],cl
            add eax,1
siguiente:
            add edx,1
            jmp sigue
fin_copia:
            mov b[eax],00


            text01 equ "No es palindroma"
            text02 equ "Es palindroma"
            ;subrutina
            mov edx,ds
            add edx,500
            push edx
            call palindroma
            add sp,4

            pop bp
            ret

palindroma:
            push bp
            mov bp,sp
            push [bp+8]
            call slen ;en ecx len
            add sp,4

            sub ecx,1  ;j
            mov ebx,0  ; i
            
comparar:
            cmp ecx,ebx  ;i >= j?  
            jnp espal

            mov edx, [bp+8]
            add edx,ebx
            mov al,b[edx]  ;pal[i]
            mov edx,[bp+8]
            add edx,ecx
            mov ah,b[edx]  ;pal[j]
            cmp al,ah
            jnz noespal
            add ebx,1
            sub ecx,1
            jmp comparar

noespal:
            mov edx,ks
            add edx,text01
            sys 0x04
            jmp fin

espal:  
            mov edx,ks
            add edx,text02
            sys 0x04

fin:        
            pop bp
            ret