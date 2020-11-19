BITS 64                                 ; 64-bit mode

SECTION .text                           ; Code section
GLOBAL my_memset:function                  ; Export 'main'

my_memset:
    xor rax, rax
    xor al, al
    mov rbx, rdi
    jmp _fill

_fill:
    cmp rdx, 0
    je _end
    movzx rbx, sil
    dec rdx
    inc rbx
    inc al
    jmp _fill

_reverse:
    cmp al, 0
    je _end
    dec rbx
    dec al
    jmp _reverse

_end:
    mov rax, rbx
    ret
