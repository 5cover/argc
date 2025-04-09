; argc - System V Linux, x86_64
; Intended as an experiment. See argc.c for the official argc source code.

section .data
    fmt db "%d", 10, 0

section .text
    global main
    extern printf

main:
    sub     rsp, 8
    mov     esi, edi            ; argc → 2nd arg (esi)
    lea     rdi, [rel fmt]      ; format string → 1st arg (rdi)
    xor     eax, eax            ; no float args -- variadic calling convention
    call    printf
    xor     eax, eax            ; return 0
    add     rsp, 8
    ret
