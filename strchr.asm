BITS 64                                 ; 64-bit mode

SECTION .text                           ; Code section
GLOBAL strchr:function               ; Export 'main'

strchr:
    xor rax, rax

_loop:
    cmp BYTE [rdi], 0
    je _end
    mov r8b, [rdi]
    cmp r8b, sil
    je _end
    inc rdi
    jmp _loop

_end:
    mov rax, rdi
    ret