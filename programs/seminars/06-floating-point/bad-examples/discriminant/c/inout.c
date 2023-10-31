#include <stdio.h>

//------------------------------------------------------------------------------
// Вывод числа int на консоль RARS
// PrintInt  1 Prints an integer
// a0 = integer to print N/A
void PrintInt(int a0) {
  printf("%d", a0);
}

//------------------------------------------------------------------------------
// Вывод числа double на консоль RARS
// PrintDouble  3    Prints a double precision floating point number
// fa0 = double to print    N/A
void PrintDouble(double fa0) {
  printf("%le", fa0);
}

//------------------------------------------------------------------------------
// Вывод строки на консоль RARS
// PrintString    4   Prints a null-terminated string to the console
// a0 = the address of the string   N/A
void PrintString(char* a0) {
  printf("%s", a0);
}

//------------------------------------------------------------------------------
// Чтение целого числа в консоли RARS
// ReadInt 5 Reads an int from input console N/A a0 = the int
int ReadInt() {
  int a0;
  scanf("%d", &a0);
  return a0;
}

//------------------------------------------------------------------------------
// Чтение числа double в консоли RARS
// ReadDouble 7 Reads a double from input console N/A fa0 = the double
double ReadDouble() {
  double fa0;
  scanf("%le", &fa0);
  return fa0;
}

//------------------------------------------------------------------------------
// Вывод символа на консоль RARS
// PrintChar  11 Prints an ascii character
// a0 = character to print (only lowest byte is considered)  N/A
void PrintChar(int a0) {
  printf("%c", a0);
}

