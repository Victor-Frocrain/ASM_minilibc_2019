BITS 64                                 ; 64-bit mode

SECTION .text                           ; Code section
GLOBAL strlen:function                  ; Export 'main'

strlen:
    xor rax, rax

_loop:
    cmp BYTE [rdi], 0
    je _end
    inc rax
    inc rdi
    jmp _loop

_end:
    ret