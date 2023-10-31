#include <stdio.h>

//------------------------------------------------------------------------------
// Вывод числа int на консоль RARS
// PrintInt  1 Prints an integer
// a0 = integer to print N/A
void PrintInt(int a0) {
  printf("%d", a0);
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
// Вывод символа на консоль RARS
// PrintChar  11 Prints an ascii character
// a0 = character to print (only lowest byte is considered)  N/A
void PrintChar(int a0) {
  printf("%c", a0);
}

