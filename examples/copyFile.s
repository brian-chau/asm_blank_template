.global _start
_start:
.intel_syntax noprefix
    mov rbp, 0x7478742e61
    push rbp
    mov rax, 0x02             # syscall for open
    mov rdi, rsp              # arg0 - "a.txt"
    mov rsi, 0x00             # arg1 - flag, 0 == O_RDONLY, 1 = 0_WRONLY, 2 = O_RDWR
    mov rdx, 0x180            # arg2 - mode, 0o600 = read and write for owner only
    syscall

    mov r12, rax              # Save read open fd
    xor rax, rax              # Zero out the registers
    xor rdi, rdi              # Zero out the registers
    xor rsi, rsi              # Zero out the registers
    xor rdx, rdx              # Zero out the registers
    mov rax, 0x02             # syscall for open
    mov rbp, 0x7478742e62
    push rbp
    mov rdi, rsp              # arg0 - "b.txt"
    mov rsi, 0x01             # arg1 - flag = 1 = O_WRONLY
    mov rdx, 0x180            # arg2 - mode, 0o600 = read and write for owner only
    syscall

    mov r13, rax              # Save write open fd
    xor rax, rax              # Zero out the registers
    xor rdi, rdi              # Zero out the registers
    xor rsi, rsi              # Zero out the registers
    xor rdx, rdx              # Zero out the registers
    mov rax, 0x28             # syscall for sendfile
    mov rdi, r13              # arg0 of sendfile = fid from write open
    mov rsi, r12              # arg1 of sendfile = fid from read open
    mov rdx, 0x0              # arg2 of sendfile = offset
    mov r10, 0x3e8            # arg3 of sendfile = size/count
    syscall

    xor rax, rax              # Zero out the registers
    xor rdi, rdi              # Zero out the registers
    xor rsi, rsi              # Zero out the registers
    xor rdx, rdx              # Zero out the registers
    mov rax, 0x3c             # syscall for exit
    syscall
