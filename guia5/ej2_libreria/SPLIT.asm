            push d1 ;dir de la palabra
            push c ;caracter
            push d2 ;dir array de punteros
            call split
            add sp, 12

split:
            push bp 
            mov bp,sp

            mov eax,[bp+16] ;palabra
            mov ecx,[bp+8] ;array de punteros 
            mov dl,[bp+12] ;caracter
            
nuevadir:
            mov ebx,eax ;guardamos dir 
siguiente:            
            cmp b[eax],dl
            jz guardar
            cmp b[eax],00
            jz fin
            add eax,1
            jmp siguiente

guardar:    
            mov b[eax],00 ;cortamos la palabra
            mov [ecx],ebx ;guardamos el puntero
            add ecx,4 ;avanzamos al siguiente puntero
            add eax,1 ;avanzamos a la siguiente letra
            jmp nuevadir

fin:        
            mov [ecx],ebx
            add ecx,4 
            mov edx,-1
            mov [ecx],edx ;guardamos el ultimo puntero nulo
            pop bp
            ret