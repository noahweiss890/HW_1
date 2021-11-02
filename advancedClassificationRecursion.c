#include <stdio.h>
#include <math.h>
#include "NumClass.h"

int length(int x) {
    int len = 1;
    while(x>9) {
        len++;
        x /= 10;
    }
    return len;
}

int isArmstrongHelper(int x) {
    int total = 0;
    int len = length(x);
    if(x <= 9) {
        total = pow(x, len);
        return total;
    }
    total = pow((x%10), len) + isArmstrongHelper(x/10);
    return total;
}

int isArmstrong(int x) {
    int total = isArmstrongHelper(x);
    if(total == x) {
        return 1;
    }
    return 0;
}

int isPalindromeHelper(int x) {
    int backwards = 0;
    if(x == 0){
        return backwards;
    }
    int r = x % 10;
    backwards = (backwards*10) + r;
    isPalindrome(x/10);
    return backwards;
}

int isPalindrome(int x){
    if(isPalindromeHelper(x) == x) {
        return 1;
    }
    return 0;
}