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

static void waitforall(pid_t pid1, pid_t pid2, pid_t pid3, int *status){
    waitpid(pid1,status,0);
    waitpid(pid2,status,0);
    waitpid(pid3,status,0); 
}

static void throwperror(char* str){
    perror(str);
}

static void signal_handler (int signo , siginfo_t *si, void *context)
{   
    printf("Signal Handler of SIGTERM\n");
    if(si->si_int>0){
        time_t timeStamp = si->si_int;
        time(&timeStamp);
        struct tm *converted_time;
        converted_time = localtime(&timeStamp);
        char buffer[26];
        strftime(buffer, 26, "%Y-%m-%d %H:%M:%S", converted_time);
        printf("Timestamp for %ld is %s according to system timezone.\n", timeStamp, buffer);
    }
    else{
        printf("Random Number is %d \n",(-1*si->si_int));
    }
}

static void waiter(){
    while(1);
}

static void performexecl(char* str, char* argument){
    execl(str,argument,NULL);
}