#include <cstdio>

int n;
int f = 1;

int main() {
                                // Вовремя выполнения:
    printf("n? ");              // calc(char*)
    scanf("%c", &n);            // calc(char*); if(%d)-> use n as int
loop:                           
                                // Во время компиляции:
    if(n < 2) goto end;         // <(int, int) -> bool
    f *= n;                     // *(int, int) -> int; =(int) -> int
    n--;                        // --(int) -> int
    goto loop;
end:
                                // Во время выполнения:
    printf("n! = %s\n", f);     // calc(char*); if(%d)-> use n as int
}

