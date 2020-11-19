BITS 64                                 ; 64-bit mode

SECTION .text                           ; Code section
GLOBAL main                             ; Export 'main'
EXTERN printf, exit                     ; Import 'printf'

main:
    MOV RDI,MSG
    MOV AL,0
    MOV RSI,0
    CALL printf

    MOV AL, 0
    CALL exit

    MOV RAX, 60
    XOR RDI, RDI
    SYSCALL

    SECTION .rodata                     ; Read-only data
    MSG: DB 'Hello, World!', 0Ah, 0     ; Format string for printf()