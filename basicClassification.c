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
    return num == sum;
}

int factorial(int x) {
    int sum = 1;
    while(x > 0) {
        sum *= x;
        x--;
    }
    return sum;
}