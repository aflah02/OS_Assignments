#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <time.h>
#include <sys/time.h>
pid_t pid;

static unsigned long long rdtsc(void){
    unsigned int hi, lo;
    __asm__ volatile ("rdtsc" : "=a"(lo), "=d"(hi));
    return ((unsigned long long)(hi) << 32 | lo);
}

static void signal_handler (int signo)
{   
    printf("SIGTERM Signal Handler of ST\n");
}

static void useitimerval(){
    struct itimerval it_val;
    it_val.it_value.tv_sec = 1;
    it_val.it_value.tv_usec = 100000;	
    it_val.it_interval = it_val.it_value;
    if (setitimer(ITIMER_REAL, &it_val, NULL) == -1) {
        perror("error calling setitimer()");
        exit(1);
    }
}

static time_t printTime(){
    time_t timeStamp = rdtsc();
    time(&timeStamp);
    struct tm *converted_time;
    converted_time = localtime(&timeStamp);
    char buffer[26];
    strftime(buffer, 26, "%Y-%m-%d %H:%M:%S", converted_time);
    return timeStamp;
}

static void signal_handler1 (int signo)
{   
    printf("Signal Handler of ST\n");
    time_t toUse = printTime();
    union sigval value;
    value.sival_int = toUse;
    if(sigqueue(pid, SIGTERM, value) == 0) {
                printf("signal sent successfully!!\n");
    } else {
            perror("SIGSENT-ERROR:");
    }
}

static void waiter(){
    while(1);
}

static void callRaiseandCheckforError(){
    int err = raise(14);
    if (err > 0){
        printf("Error in Raise Call in ST.c");
    }
    waiter();
}

static void sigalrmcall(){
    if (signal (SIGALRM, signal_handler1) == SIG_ERR) {
        fprintf (stderr, "Cannot handle SIGALRM!\n");
        exit (-1);
    }
}
static void sigtermcall(){
    if (signal (SIGTERM, signal_handler) == SIG_ERR) {
        fprintf (stderr, "Cannot handle SIGALRM!\n");
        exit (-1);
    }
}