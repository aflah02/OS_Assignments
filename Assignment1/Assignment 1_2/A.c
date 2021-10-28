#include<stdio.h>
extern void B(long input);
void A(){
    long input;
    scanf("%ld", &input);
    B(input);
}
int main(){
    A();
    return 1;
}