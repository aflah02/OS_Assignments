#include<stdio.h>

extern void B(long long int x);
void A(){
    long long input;
    scanf("%lld", &input);
    B(input);
}
int main(){
    A();
    return 1;
}