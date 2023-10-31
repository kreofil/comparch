# Компиляция, компоновка и запуск с использование riscv64-unknown-elf-...
# riscv64-unknown-elf-as hello.s -o hello.o
# riscv64-unknown-elf-ld hello.o -o hello
# spike pk hello

.globl _start

    _start:
        li a0, 1            # file descriptor = 1 (stdout)
        la a1, string       # buffer
        li a2, 19           # size
        li a7, 64           # syscall write (64)
        ecall

    _end:

        li a0, 0            # exit code
        li a7, 93           # syscall exit
        ecall


    string:  .asciz "Hello! It works!!!\n"

