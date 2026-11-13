\DATA 1024
\EXTRA 1024

int equ 4
sint equ 2
null equ -1

main:       
            push bp
            mov bp,sp
            sub sp,8 ; bp-4 vec | bp-8 z

            call heap_init
            ;vec malloc
            mov eax,int
            mul eax,100
            push eax
            call alloc
            add sp,4
            cmp eax,null
            jz fin_main
            mov [bp-4],eax ;vec
            ;z malloc
            mov eax,sint
            push eax
            call alloc
            add sp,4
            cmp eax,null
            jz fin_main
            mov [bp-8],eax  ;z
            ;*z =100
            mov ebx,[bp-8]
            mov w[ebx],100
            
            mov dx,w[ebx]
            push edx
            push [bp-4]
            call func
            add sp,8
fin_main:
            mov sp,bp
            pop bp
            ret

; FUNC(vec, z)
; [bp+8]  -> vec
; [bp+12] -> z
func:
            push bp
            mov bp,sp

            ;vec[0]=1
            mov eax,[bp+8]
            mov [eax],1
            ;for i<z
            mov ecx,1 ;i=1
for:            
            cmp ecx,[bp+12]
            jnn fin_func
            ;vec[i-1]*i
            mov ebx,ecx
            sub ebx,1
            mul ebx,int
            mov eax,[bp+8]
            add eax,ebx
            mov edx,[eax]
            mul edx,ecx
            ;vec[i]=resultado
            mov ebx,ecx
            mul ebx,int
            mov eax,[bp+8]
            add eax,ebx
            mov [eax],edx
            add ecx,1
            jmp for
fin_func:
            mov ecx,bp
            add ecx,12
            push ecx
            push [bp+8]
            call sum
            add sp,8
            mov edx,eax
            ldl ecx,1
            ldh ecx,4
            mov eax,0x01
            sys 0x2

            mov sp,bp
            pop bp
            ret

sum:
            push bp
            mov bp,sp

            mov ecx,0
            mov ebx,[bp+12]
            mov efx,0
            mov fx,w[ebx]
bucle:
            cmp ecx,efx
            jz fin_sum
            mov ebx,ecx
            mul ebx,int ;[i]
            mov eax,[bp+8]  
            add eax,ebx
            mov edx,[eax]  
            add [ds],edx ;s = s + vec[i]
            add ecx,1
            jmp bucle
fin_sum:
            mov eax,[ds]
            mov sp,bp
            pop bp
            ret