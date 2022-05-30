.global _start
_start:
.intel_syntax noprefix
    mov rbp, 0x7478742e61 # the string "a.txt" in little-endian format
    push rbp

    mov rax,0x02          # syscall number for "open"
    mov rdi,rsp           # arg1 = filename
    mov rsi,0x00          # arg2 = flags
    mov rdx,0x180         # arg3 = mode = 0o600
    syscall

    # Remove the O_APPEND flag from STDOUT_FILENO file descriptor's flags
    mov r13,rax           # save fid for "open" syscall
    mov rax,0x48          # syscall number for fcntl
    mov rdi,0x1           # arg1 = file descriptor = 1 = stdout
    mov rsi,0x1           # arg2 = 1 = F_GETFD
    syscall
    mov r12,rax           # Save flags

    mov r8,1024           # O_APPEND = 0o2000
    not r8                # ~O_APPEND
    and r12,r8            # flags = flags & ~O_APPEND
    mov rax,0x48          # syscall number for fcntl
    mov rdi,0x1           # arg1 = file descriptor = 1 = stdout
    mov rsi,0x4           # arg2 = 4 = F_SETFD
    mov rdx,r12           # arg3: modified flags
    syscall

    mov rax,0x28          # syscall number for sendfile
    mov rdi,0x1           # arg1 = 1 = stdout
    mov rsi,r13           # arg2 = file ID
    mov rdx,0x0           # arg3 = offset
    mov r10,0x1000        # arg4 = bytes to read
    syscall

    xor rdi,rdi
    mov rax,0x3c          # syscall number for exit
    syscall