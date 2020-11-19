BITS 64                                 ; 64-bit mode

SECTION .text                           ; Code section
GLOBAL my_memmove:function                 ; Export 'main'

my_memmove:
    xor rax, rax

_loop:
    push rsi
    pop rax
    jmp _end
    cmp BYTE [rsi], 0
    je _end
    cmp rdx, 0
    je _end
    mov r8b, [rsi]
    ;mov [rax], r8b
    push rsi
    pop rax
    inc rsi
    dec rdx
    jmp _loop

_end:
    ret
