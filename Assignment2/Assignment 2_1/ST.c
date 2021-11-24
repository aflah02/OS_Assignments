#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include "helperST.c"
pid_t pid;

int main(int no,char *args[]){
    char *str = args[0];
    pid = atoi(str);
    sigalrmcall();
    sigtermcall();
    useitimerval();
    callRaiseandCheckforError();
}
