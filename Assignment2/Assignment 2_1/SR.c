#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <signal.h>
#include <unistd.h>
#include <errno.h>
#include <sys/time.h>
#include <stdint.h>
#include "helperSR.c"
pid_t pid;

int main(int no,char *args[]){
    pid = atoi(args[0]);
    SRSignalCheck();
    useitimerval();
    waiter();
}