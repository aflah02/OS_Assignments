#include<unistd.h>
#include<signal.h>
#include <sys/types.h>
#include<stdio.h>
#include<stdlib.h>
#include <sys/wait.h>
#include <time.h>

static void printPID(int pid){
    printf("%d\n",pid);
} 

int isLessThanZero(int x){
    if (x < 0){
        return 1;
    }
    return 0;
}

static void printTime(time_t timeStamp){
    char buffer[26];
    strftime(buffer, 26, "%Y-%m-%d %H:%M:%S", localtime(&(timeStamp)));
    printf("Timestamp for %ld is %s according to system timezone.\n", timeStamp, buffer);
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
    printf("Random Number generated using the process is %d \n",(-1*x));
}

static void signal_handler (int signo , siginfo_t *si, void *context)
{   
    printf("Signal Handler of SIGTERM\n");
    if(isLessThanZero(si->si_int)){
        printRandomNumber(si->si_int);
    }
    else{
        printTime(si->si_int);
    }
}

static void waiter(){
    while(1);
}

static void performexecl(char* str, char* argument){
    execl(str,argument,NULL);
}

