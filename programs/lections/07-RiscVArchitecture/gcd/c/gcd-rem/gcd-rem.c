// Для полчения ассеблерного кода RV32I(M)
// $ riscv64-unknown-elf-gcc -mabi=ilp32 -march=rv32g -S test-inout.c -o test-inout32.s

#include "inout.h"

int gcd(int a, int b) {
  int r;
  while ((r = a % b) != 0) {
    a = b;
    b = r;
  }
  return b;
}

int main() {
  int a = ReadInt();
  int b = ReadInt();
  int x = gcd(a, b);
  PrintInt(x);
  PrintChar('\n');
  return 0;
}
