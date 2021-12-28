# Linux Assembly for x86_64 (64-bit) instruction sets

To compile and run, use:

> gcc -masm=intel -nostdlib -static filename.S -o filename<br/>
> ./filename

For example,

> gcc -masm=intel -nostdlib -static main.S -o main<br/>
> ./main


For a full list of the system call numbers, function definitions, and registers that are used as parameters, visit the [ChromiumOS website](https://chromium.googlesource.com/chromiumos/docs/+/HEAD/constants/syscalls.md#x86_64-64_bit)

Note: The `rax` register is a scratch register that contains the returned values from function calls. For example, if we do a system call to the "open" function, then the `rax` register will contain the file descriptor of the file that was opened.
