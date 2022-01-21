; Assembly Calculator
; Will Nigel De Jesus

; -----------Usage-------------
; nasm -f elf assemblycalc.asm
; gcc assemblycalc.o -o assemblycalc -m32
; ./assemblycalc

section .text
    extern printf
    extern scanf
    global main

main:
    push ebp
    mov ebp, esp

    ; Intro Message
    push in_msg
    call printf

    ; New Line
    push lin_brk
    call printf

    ; Enter n1
    push msg_n1
    call printf

    ; Get input for n1
    add esp, 4
    push n1
    push scn_int
    call scanf

    ; New Line
    push lin_brk
    call printf

    ; Enter n2
    push msg_n2
    call printf

    ; Get input for n2
    add esp, 4
    push n2
    push scn_int
    call scanf

    ; New Line
    push lin_brk
    call printf

    ; Get Sum
    push eax
    push ebx
    add esp, 4
    mov eax, [n1]
    mov ebx, [n2]
    add eax, ebx
    push eax
    push msg_sum
    call printf
    add esp, 8

    ; New Line
    push lin_brk
    call printf

    pop ebx
    pop eax

    ; Get Difference
    push eax
    push ebx
    add esp, 4
    mov eax, [n1]
    mov ebx, [n2]
    sub eax, ebx
    push eax
    push msg_dif
    call printf
    add esp, 8

    ; New Line
    push lin_brk
    call printf

    pop ebx
    pop eax

    ; Get Product
    push eax
    push ebx
    add esp, 4
    mov eax, [n1]
    mov ebx, [n2]
    imul eax, ebx
    push eax
    push msg_prd
    call printf
    add esp, 8

    ; New Line
    push lin_brk
    call printf

    pop ebx
    pop eax

    ; Get Quotient
    push eax
    push ebx
    add esp, 4
    mov edx, 0
    mov eax, [n1]
    mov ebx, [n2]
    div ebx
    mov [rem], edx
    push eax
    push msg_quo
    call printf
    add esp, 8
    add esp, 4
    push dword [rem]
    push msg_rem
    call printf
    add esp, 8

    ; New Line
    push lin_brk
    call printf

    pop ebx
    pop eax

    ; n1 Multiple of n2
    push eax
    push ebx
    add esp, 4
    mov edx, 0
    mov eax, [n1]
    mov ebx, [n2]
    div ebx
    cmp eax, 0
    je false_1

    cmp edx, 0
    je true_1

false_1:
    push 0
    push msg_ml1
    call printf
    add esp, 8
    jmp m1_out

true_1:
    push 1
    push msg_ml1
    call printf
    add esp, 8
    jmp m1_out

m1_out:
    ; New Line
    push lin_brk
    call printf
    add esp, 4

    pop ebx
    pop eax

    ; n2 Multiple of n1
    push eax
    push ebx
    add esp, 4
    mov edx, 0
    mov eax, [n2]
    mov ebx, [n1]
    div ebx
    cmp eax, 0
    je false_2

    cmp edx, 0
    je true_2

false_2:
    push 0
    push msg_ml2
    call printf
    add esp, 8
    jmp m2_out

true_2:
    push 1
    push msg_ml2
    call printf
    add esp, 8
    jmp m2_out

m2_out:
    ; New Line
    push lin_brk
    call printf
    add esp, 4

    pop ebx
    pop eax
    
exit:
    ; Exit
    mov eax, 1
    mov ebx, 0;
    int 0x80

section .data
    ; --- Messages ---
    in_msg  :   db  "Assembly Calculator", 10, 0

    ; Prompts
    msg_n1  :   db  "Enter n1: ", 10, 0
    msg_n2  :   db  "Enter n2: ", 10, 0

    ; Labels 
    msg_sum :   db  "n1 + n2 = %d", 10, 0
    msg_dif :   db  "n1 - n2 = %d", 10, 0
    msg_prd :   db  "n1 * n2 = %d", 10, 0
    msg_quo :   db  "n1 / n2 = %d", 10, 0
    msg_rem :   db  "r. %d", 10, 0
    msg_ml1 :   db  "n1 multiple of n2(1 if true, 0 if false)? : %d", 10, 0
    msg_ml2 :   db  "n2 multiple of n1(1 if true, 0 if false)? : %d", 10, 0

    ; Utils
    prt_int :   db  "%d", 10, 0
    prt_rem :   db  "%d r. %d", 10, 0
    scn_int :   db  "%d", 0
    lin_brk :   db  "", 10, 0
    ;prt_tru :   db  "True", 10, 0
    ;prt_fal :   db  "False", 10, 0

    ; Vars
    n1  :   times 4 db 0
    n2  :   times 4 db 0

section .bss
    rem         resb    2
    prev_quo    resb    2



