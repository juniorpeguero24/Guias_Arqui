; --- Inicialización de variables y puntero ---
        MOV EDX, DS     ; Puntero al buffer de entrada de datos
        ADD EDX, 8      ; Desplaza el buffer para no pisar [0] y [4]
        MOV [0], 0x00   ; Acumulador de Suma en memoria [0]
        MOV [4], 0x00   ; Contador de Elementos en memoria [4]

        ; --- Bucle de lectura y cálculo ---
inicio: MOV EAX, 0x01   ; Código de llamada para lectura
        LDL ECX, 0x01   ; Cantidad de elementos a leer: 1
        LDH ECX, 0x01   ; Tamaño en bytes del dato: 1 byte
        SYS 0x01        ; Lee por teclado y guarda en [EDX]

        ; --- Condición de corte ---
        CMP [EDX], 0    ; Compara el número ingresado con 0
        JN fin          ; Si es negativo, sale del bucle hacia fin

        ; --- Acumulación y conteo ---
        MOV EBX, [EDX]  ; Pasa el dato leído a un registro auxiliar
        ADD [0], EBX    ; Suma = Suma + dato ingresado
        ADD [4], 0x01   ; Contador = Contador + 1
        ADD EDX, 0x01   ; Avanza el puntero de memoria para el próximo dato
        JMP inicio      ; Repite el bucle

        ; --- Cálculo del promedio y salida ---
fin:    MOV EAX, [0]    ; Carga la suma total en EAX
        DIV EAX, [4]    ; EAX = Suma / Cantidad (resultado del promedio)
        MOV [0], EAX    ; Guarda el promedio calculado en la celda [0]

        MOV EDX, DS     ; EDX apunta a la base de datos (celda [0])
        MOV EAX, 0x01   ; Código de función para salida de datos
        LDH ECX, 0x01   ; Tamaño en bytes del dato a imprimir: 1 byte
        LDL ECX, 0x01   ; Cantidad de elementos a imprimir: 1
        SYS 0x02        ; Imprime el promedio por pantalla

        STOP            ; Finaliza la ejecución del programa