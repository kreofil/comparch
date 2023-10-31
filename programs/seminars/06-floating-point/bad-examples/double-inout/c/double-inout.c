// Для полчения ассеблерного кода RV32I
// $ riscv64-unknown-elf-gcc -mabi=ilp32 -march=rv32g -S double-inout.c -o double-inout32.s

#include "inout.h"

int main() {
  PrintString("a = ");
  double a = ReadDouble();
  PrintString("b = ");
  double b = ReadDouble();
  PrintString("c = ");
  double c = ReadDouble();

  // // a = b+c;
  // // b = a * 2;
  // // c = c / a;
  PrintString("a = ");
  PrintDouble(a);
  PrintString("; b = ");
  PrintDouble(b);
  PrintString("; c = ");
  PrintDouble(c);
  PrintChar('\n');
}
