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

static void signal_handler1 (int signo)
{   
    printf("Signal Handler of ST\n");
    time_t timeStamp = rdtsc();
    time(&timeStamp);
    struct tm *converted_time;
    converted_time = localtime(&timeStamp);
    char buffer[26];
    strftime(buffer, 26, "%Y-%m-%d %H:%M:%S", converted_time);
    union sigval value;
    value.sival_int = timeStamp;
    if(sigqueue(pid, SIGTERM, value) == 0) {
                printf("signal sent successfully!!\n");
    } else {
            perror("SIGSENT-ERROR:");
    }
}