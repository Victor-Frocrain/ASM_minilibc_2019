BITS 64                                 ; 64-bit mode

SECTION .text                           ; Code section
GLOBAL strcspn:function                 ; Export 'main'

strcspn:
    xor rax, rax
    mov r8, rsi
    xor al, al
    jmp _count

_count:
    cmp BYTE [rdi], 0
    je _end
    mov r8, rsi
    jmp _incal

_incal:
    cmp BYTE [r8], 0
    je _nomore
    mov r9b, [rdi]
    mov r10b, [r8]
    cmp r9b, r10b
    je _end
    inc r8
    jmp _incal

_nomore:
    inc rdi
    inc al
    jmp _count

_end:
    movzx rax, al
    ret
