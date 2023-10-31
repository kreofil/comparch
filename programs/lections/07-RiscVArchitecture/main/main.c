// $ riscv64-unknown-elf-gcc -mabi=ilp32 -march=rv32i -S main.c -o main.s
// $ riscv64-unknown-elf-as -mabi=ilp32 -march=rv32i main.s -o main.o
// $ riscv64-unknown-elf-ld -m elf32lriscv main.o -o main
#include <stdio.h>

int func(int x)
{
  return x + 10;
}

int main()
{
  int r = func (10);
  printf("r = %d\n", r);
  return r+1;
}

/*
1 .text
2 .align 2
3 main:
4   addi sp,sp,-16
5   li a0,10
6   sw ra,12(sp)
7   jal func
8   lw ra,12(sp)
9   addi a0,a0,1
10  addi sp,sp,16
11  ret
 */
