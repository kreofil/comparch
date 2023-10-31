// Для полчения ассеблерного кода RV32I
// $ riscv64-unknown-elf-gcc -mabi=ilp32 -march=rv32i -S test-inout.c -o test-inout32.s

#include "inout.h"

int gcd(int a, int b) {
    while (a != b) {
      if(a > b) { a -= b;}
      else {b -= a;}
    }
    return a;
}

int main() {
    int a = ReadInt();
    int b = ReadInt();
    int x = gcd(a, b);
    PrintInt(x);
    PrintChar('\n');
    return 0;
}
