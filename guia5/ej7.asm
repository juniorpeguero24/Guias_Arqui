
            ;a)
            push [bp-12];c
            push [bp-8];b
            push [bp-4];a
            call proce
            add sp,12

            ;b)
            mov eax,[bp-4]
            mov eax, [eax]

            push [bp-8]
            push eax
            call func
            add sp,8
            mov [bp-12],eax ;supongamos que func vuelve en eax

            ;c)
            mov ecx,[bp-12]
            mov ecx,[ecx]
            push ecx
            mov ebx,[bp-8]
            mov ebx,[ebx]
            push ebx
            mov eax,bp
            sub eax,4
            push eax
            call proce
            add sp,12

            ;d)
            mov ebx,[bp-8]
            mov eax,[bp-4]
            add eax,ebx
            push eax
            call func
            add sp,4
            mov ecx,[bp-12]
            mov [ecx],eax