BITS 64                                 ; 64-bit mode

SECTION .text                           ; Code section
GLOBAL strcasecmp:function              ; Export 'main'

strcasecmp:
    xor rax, rax

_loop:
    cmp BYTE [rdi], 0
    je _endstr1
    cmp BYTE [rsi], 0
    je _endstr2
    mov r8b, [rdi]
    mov r9b, [rsi]
    cmp r8b, r9b
    jne _comparecase
    inc rdi
    inc rsi
    jmp _loop

_comparecase:
    mov r10b, r9b
    add r10b, 32
    cmp r8b, r10b
    je _incstrings
    jmp _comparecase2

_comparecase2:
    mov r10b, r9b
    sub r10b, 32
    cmp r8b, r10b
    je _incstrings
    jmp _end

_incstrings:
    inc rdi
    inc rsi
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
