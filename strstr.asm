BITS 64                                 ; 64-bit mode

SECTION .text                           ; Code section
GLOBAL strstr:function                  ; Export 'main'

strstr:
    xor rax, rax
    mov rbx, rdi
    mov r8, rsi
    jmp _generalloop

_generalloop:
    cmp BYTE [rbx], 0
    je _end
    mov r8, rsi
    mov r9, rbx
    jmp _loopcmp

_loopcmp:
    cmp BYTE [r8], 0
    je _found
    cmp BYTE [r9], 0
    je _end
    mov r10b, [r9]
    mov r11b, [r8]
    cmp r10b, r11b
    jne _incbyone
    inc r8
    inc r9
    jmp _loopcmp

_incbyone:
    inc rbx
    jmp _generalloop

_found:
    mov rax, rbx
    jmp _end

_end:
    ret
