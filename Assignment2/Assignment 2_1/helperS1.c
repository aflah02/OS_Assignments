#include<unistd.h>
#include<signal.h>
#include <sys/types.h>
#include<stdio.h>
#include<stdlib.h>
#include <sys/wait.h>
#include <time.h>
#include <stdint.h>
#include <string.h>
#include <sys/ipc.h>
#include <sys/shm.h>

int isLessThanZero(int x){
    if (x < 0){
        return 1;
    }
    return 0;
}

static void printTime(){
    key_t key = ftok("shmfile",65);
    int shmid = shmget(key,1024,0666|IPC_CREAT);
    char *str = (char*) shmat(shmid,(void*)0,0);
    char buffer[1000];
    snprintf(buffer, 1000, "%s",str);
    write(1, buffer, strlen(buffer));
    shmdt(buffer);
}

static void waitforall(pid_t pid1, pid_t pid2, pid_t pid3, int *status){
    waitpid(pid1,status,0);
    waitpid(pid2,status,0);
    waitpid(pid3,status,0); 
}

static void throwperror(char* str){
    perror(str);
}

static void printRandomNumber(int x){
    printf("Random Number generated is %d \n",(-1*x));
}

static void S1Handler(int signo, siginfo_t *si, void *context)
{   
    if(isLessThanZero(si->si_int)){
        printRandomNumber(si->si_int);
    }
    else{
        printTime();
    }
}

static void waiter(){
    while(1);
}

static void performexecl(char* str, char* argument){
    execl(str,argument,NULL);
}

