#include "NumClass.h"

int isPrime(int x) {
    int i = 2;
    while (i < x) {
        if(x % i == 0) {
            return 0;
        }
        i++;
    }
    return 1;
}

int isStrong(int x) {
    int num = x;
    int sum = 0;
    while(x != 0) {
        sum += factorial(x%10);
        x /= 10;
    }
    if(num == sum) {
        return 1;
    }
    return 0;
}

int factorial(int x) {
    if(x == 1) {
        return 1;
    }
    return x * factorial(x-1);
}