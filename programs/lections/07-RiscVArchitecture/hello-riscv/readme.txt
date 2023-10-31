// Компиляция и компоновка с использованием clang
clang --target=riscv32 -march=rv32gc -mabi=ilp32d -mno-relax hello.s -c -o hello.o
ld.lld hello.o -o hello.x

// Компиляция, компоновка и запуск с использование riscv64-unknown-elf-...
riscv64-unknown-elf-as hello.s -o hello.o
riscv64-unknown-elf-ld hello.o -o hello
spike pk hello
