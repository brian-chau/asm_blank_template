.global _start
_start:
.intel_syntax noprefix
    mov rax, 1                # syscall for write
    mov rdi, 1                # arg1 - fid, where 0 = stdin, 1 = stdout, 2 = stderr, anything else = result from something like "open"
    lea rsi, [rip+helloworld] # arg2 - the string itself
    mov rdx, 13               # arg3 - size of the string
    syscall

    mov rax, 60               # syscall for exit
    syscall

helloworld:
    .string "Hello world!\n"
    