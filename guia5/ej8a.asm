\DATA 1000
    j: 3
\STACK 1024

main:       
            push bp
            mov bp,sp
            sub sp,20 ;Reserva 20 bytes para arr[0..4]
            ; arr[0] = 1020
            mov [bp-20],1020
            ; arr[1]=arr[0] | 0x3ff
            mov eax,[bp-20]
            or eax,0x3ff
            mov [bp-16],eax
            ; calculo (j,arr)
            mov eax,bp
            sub eax,20
            push eax  ;puntero a arr
            push [j]  ;j
            call calculo
            add sp,8
            move sp,bp
            pop bp
            ret

calculo:
            push bp
            mov bp,sp

            ;v[0]
            mov ebx,[bp+12]  
            mov edx,[ebx]  ;edx=vec[0]
            ;vec[x-1]
            mov eax,[bp+8]
            sub eax,1
            mul eax,4
            add eax,[bp+12]

            and eax,edx

            ;vec[x]=resultado
            mov ecx,[bp+8]
            mul ecx,4
            add ecx,[bp+12]
            mov [ecx],eax

            pop bp
            ret