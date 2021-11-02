#include <stdio.h>
#include <math.h>
#include "NumClass.h"

int isArmstrong(int x) {
    int num = x;
    int len = length(x);
    int total = 0;
    while(x != 0){
        int digit = x%10;
        total += pow(digit, len);
        x /= 10; 
    }
    return num == total;
}

int length(int x) {
    int len = 1;
    while(x>9){
        len++;
        x /= 10;
    }
    return len;
}

int isPalindrome(int x) {
    int num = x;
    int backwards = 0;
    while(x != 0){
        int r = x % 10;
        backwards = (backwards*10) + r;
        x /= 10;
    }
    return num == backwards;
}
