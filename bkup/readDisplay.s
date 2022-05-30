.global _start
_start:
.intel_syntax noprefix
    mov rbp, 0x7478742e61
    push rbp
    mov rax,0x02
    mov rdi,rsp
    mov rsi,0x00
    mov rdx,0x180
    syscall

    mov r13,rax
    mov rax,0x48
    mov rdi,0x1
    mov rsi,0x1
    syscall

    mov r12,rax

    mov r8,1024
    not r8
    and r12,r8
    mov rax,0x48
    mov rdi,0x1
    mov rsi,0x4
    mov rdx,r12
    syscall

    mov rax,0x28
    mov rdi,0x1
    mov rsi,r13
    mov rdx,0x0
    mov r10, 0x1000
    syscall

    xor rdi,rdi
    mov rax,0x3c
    syscall