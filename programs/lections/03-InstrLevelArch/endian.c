// A program that checks the order of data placement
// in the computer memory of the current architecture

#include <stdio.h>

union {
   unsigned int i;
   char c[sizeof(unsigned int)];
} foo;


int main() {
    foo.i = 1;
    if (foo.c[0] == 1) {
        printf("Little endian\n");
    } else {
        printf("Big endian\n");
 
   }
   
   foo.i = 0x01020304;
   for(int i = 0; i < sizeof(unsigned int); i++) {
       printf("%p: %X\n", &foo.c[i], (unsigned int)foo.c[i]);
   }
    return 0;
}

