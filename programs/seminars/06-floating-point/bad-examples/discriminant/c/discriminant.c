// Для полчения ассеблерного кода RV32I
// $ riscv64-unknown-elf-gcc -mabi=ilp32 -march=rv32g -S inout.c -o inout32.s
// $ riscv64-unknown-elf-gcc -mabi=ilp32 -march=rv32g -S discriminant.c -o discriminant32.s

// Нахождение корней квадратного уравнения a*x*x + b*x + c = 0
#include <math.h>
#include "inout.h"

// Дискриминант d = sqrt(b*b - 4*a*c)
double discriminant(double a, double b, double c) {
  double d = b*b - 4*a*c;
  return d;
}

int main() {
  PrintString("a = ");
  double a = ReadDouble();
  PrintString("b = ");
  double b = ReadDouble();
  PrintString("c = ");
  double c = ReadDouble();
  if(a == 0.0) {
    if(b == 0.0) {
      if(c == 0.0) {
        PrintString("Any x1 and x2: \n");
      }
      else { // c != 0
        PrintString("No x1 and x2. c != 0\n");
      }
    }
    else { // b != 0, any c
      PrintString("x1 = x2 = ");
      PrintDouble(c / b);
      PrintChar('\n');
    }
  }
  else { // a != 0, any b and c
    double d = discriminant(a, b, c);
    PrintString("d = ");
    PrintDouble(d);
    PrintChar('\n');
    if (d < 0) {
      PrintString("Real roots are absent\n");
    }
    else {
      d = sqrt(d);
      PrintString("x1 = ");
      PrintDouble((-b - d) / (a + a));
      PrintString("; x2 = ");
      PrintDouble((-b + d) / (a + a));
      PrintChar('\n');
    }
  }
}
