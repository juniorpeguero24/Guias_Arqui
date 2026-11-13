\\DATA 1000

main:           
            push bp
            mov bp,sp

            sub sp,4
            mov [bp-4],2
            ;vec[i]=501
            mov eax,ds
            mov ebx,0
            add ebx,[bp-4]
            mul ebx,4
            add eax,ebx
            mov [eax],501
            ;vec[0] = 0xf0f0 & vec[i]
            mov ebx,[eax]
            mov ecx,0xf0f0
            and ecx,ebx
            mov eax,ds
            mov [eax],ecx

            push eax
            push [bp-4]
            call proce
            add sp,8
            mov sp,bp
            pop bp
            ret

proce: 
            push bp
            mov bp,sp

            ;w[0]
            mov eax,[bp+12] ;eax=*w[]
            mov ecx,[eax] ;ecx=w[0]
            ;w[x]
            mov ebx,[bp+8]
            mul ebx,4
            mov edx,[bp+12]
            add edx,ebx
            mov ebx,[edx] ;edx=w[x]
            ;w[x] | w[0]
            or ebx,ecx
            ;w[x-1]=resultado
            mov eex,[bp+8]
            sub eex,1
            mul eex,4
            add eax,eex
            mov [eax],ebx

            pop bp
            ret

