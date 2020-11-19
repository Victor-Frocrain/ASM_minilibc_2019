BITS 64                                 ; 64-bit mode

SECTION .text                           ; Code section
GLOBAL rindex:function                  ; Export 'main'

rindex:
    xor rax, rax
    xor r10b, r10b
    mov rbx, rdi
    jmp _count

_count:
    cmp BYTE [rbx], 0
    je _loop
    mov r9b, [rbx]
    cmp r9b, sil
    je _incal
    inc rbx
    jmp _count

_incal:
    inc r10b
    inc rbx
    jmp _count

_loop:
    cmp BYTE [rdi], 0
    je _end
    mov r9b, [rdi]
    cmp r9b, sil
    je _islast
    inc rdi
    jmp _loop

_islast:
    dec r10b
    cmp r10b, 0
    je _copy
    inc rdi
    jmp _loop

_copy:
    mov rax, rdi

_end:
    ret
