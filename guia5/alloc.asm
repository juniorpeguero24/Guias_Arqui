\\EXTRA 1024
heap_init: 
            mov [es],es
            add [es],4
            ret

null equ -1

alloc:
            push bp
            mov bp,sp
            push bx
            mov eax,null  ;inicializa eax, por si falla en -1
            mov bx,[es]
            add bx,[bp+8]  ;[bp+8]=cant de bytes
            cmp bx,1024
            jp alloc_fin
            mov eax,[es]
            add [es],[bp+8]

alloc_fin: 
            pop bx
            mov sp,bp
            pop bp
            ret