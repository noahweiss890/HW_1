#include <stdio.h>
#include "NumClass.h"

int main() {
    printf("is 13 a prime number? %d\n", isPrime(13));
    printf("is 145 a strong number? %d\n", isStrong(145));
    printf("is 6 a strong number? %d\n", isStrong(6));
    printf("is 17 a strong number? %d\n", isStrong(17));
    printf("is 2 a strong number? %d\n", isStrong(2));
    return 0;
}