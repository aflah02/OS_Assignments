#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <time.h>
#include <sys/time.h>
#include <stdint.h>
pid_t pid;

static unsigned long long InLineTimeStampGenerator(void){
    unsigned int hi, lo;
    __asm__ volatile ("rdtsc" : "=a"(lo), "=d"(hi));
    return ((unsigned long long)(hi) << 32 | lo);
}

static void sigtermPrintHandler(int signo)
{   
    printf("SIGTERM Signal Handler of ST\n");
    exit(0);
}

static void itimererror(struct itimerval it_val){
    if (setitimer(ITIMER_REAL, &it_val, NULL) == -1) {
        perror("Error calling setitimer()");
        exit(1);
    }
}

static void useitimerval(){
    struct itimerval it_val;
    it_val.it_value.tv_sec = 1;
    it_val.it_value.tv_usec = 100000;	
    it_val.it_interval = it_val.it_value;
    itimererror(it_val);
}

static uint64_t printTime(){
    time_t timeStamp = InLineTimeStampGenerator();
    uint64_t time = timeStamp/(2994.385*1000000);
    return time;
}

static void TimeHandler(int signo)
{   
    uint64_t toUse = printTime();
    union sigval value;
    value.sival_int = toUse;
    if(sigqueue(pid, SIGTERM, value) == 0) {
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
    if (signal (SIGALRM, TimeHandler) == SIG_ERR) {
        fprintf (stderr, "Error in SIGALRM\n");
        exit(-1);
    }
}
static void sigtermcall(){
    if (signal (SIGTERM, sigtermPrintHandler) == SIG_ERR) {
        fprintf (stderr, "Error in SIGTERM\n");
        exit(-1);
    }
}