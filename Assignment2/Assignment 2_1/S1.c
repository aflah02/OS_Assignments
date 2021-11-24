#include<unistd.h>
#include<signal.h>
#include <sys/types.h>
#include<stdio.h>
#include<stdlib.h>
#include <sys/wait.h>
#include <time.h>
#include "helperS1.c"

int main(){
    pid_t pid,sr,st;
    int status;
    pid = fork();
    if(pid==0){
        int pid1 = getpid();
        struct sigaction sa;
        sa.sa_flags = SA_SIGINFO;
        sa.sa_sigaction = S1Handler;
        sigaction(SIGTERM, &sa,0);
        waiter();
    }
    else if(pid>0){
        char *arg = malloc(20);
        sprintf(arg, "%d", pid);
        sr = fork();
        if(sr==0){
            char* path = "./SR";
            performexecl(path,arg);
        }
        else if(sr>0){
            int status;
            st = fork();
            if(st==0){
                char* path = "./ST";
                performexecl(path,arg);
            }
            else if(st<0){
                throwperror("fork");
            }
        }
        else{
            throwperror("fork");
        }
    }
    if(pid<0){
        throwperror("fork");
    }
    waitforall(pid, sr, st, &status);
    exit(0);
}

