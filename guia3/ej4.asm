        MOV EAX, 0
        CMP ECX, 0
        JZ fin

multi:  ADD EAX, EBX
        SUB ECX, 1
        CMP ECX, 0
        JNZ multi

fin:    STOP