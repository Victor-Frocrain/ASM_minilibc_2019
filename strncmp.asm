BITS 64                                 ; 64-bit mode

SECTION .text                           ; Code section
GLOBAL strncmp:function                 ; Export 'main'

strncmp:
    xor rax, rax

_loop:
    cmp rdx, 0
    je _end
    cmp BYTE [rdi], 0
    je _endstr1
    cmp BYTE [rsi], 0
    je _endstr2
    mov r8b, [rdi]
    mov r9b, [rsi]
    cmp r8b, r9b
    jne _end
    inc rdi
    inc rsi
    dec rdx
    jmp _loop

_endstr1:
    xor r8b, r8b
    xor r9b, r9b
    cmp BYTE [rsi], 0
    je _end
    mov r9b, [rsi]
    jmp _end

_endstr2:
    xor r9b, r9b
    xor r8b, r8b
    cmp BYTE [rdi], 0
    je _end
    mov r8b, [rdi]
    jmp _end

_end:
    movzx rax, r8b
    movzx rbx, r9b
    sub rax, rbx
    ret
