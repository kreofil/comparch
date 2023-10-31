#include <stdio.h>

char memory[2*sizeof(int)];     // Память для n и f
void* n = memory;               // Адрес на область для n
void* f = memory + sizeof(int); // Адрес на область для f

int main() {
    *((int*)f) = 1;
    printf("n? ");
    scanf("%d", n);
    printf("n = %d\n", *((int*)n));
    printf("f = %d\n", *((int*)f));
loop:
    if(*((int*)n) < 2) goto end;
    *((int*)f) *= *((int*)n);
    (*(int*)n)--;
    goto loop;
end:
    printf("n! = %d\n", (*(int*)f));
}

