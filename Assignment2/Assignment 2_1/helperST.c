#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <time.h>
#include <sys/time.h>
#include <stdint.h>
#include <sys/ipc.h>
#include <sys/shm.h>
pid_t pid;

static unsigned long long InLineTimeStampGenerator(void){
    unsigned int hi, lo;
    __asm__ volatile ("rdtsc" : "=a"(lo), "=d"(hi));
    return ((unsigned long long)(hi) << 32 | lo);
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
    key_t key = ftok("shmfile", 65);        
    int shmid = shmget(key, 1024, 0666 | IPC_CREAT);
    uint64_t toUse = printTime();
    uint64_t days = toUse/86400;
    uint64_t hrs = (toUse%86400)/3600;
    uint64_t mins = (toUse%3600)/60;
    uint64_t secs = toUse-hrs*3600-mins*60;
    char buffer[1000];
    char *str = (char *)shmat(shmid, (void *)0, 0);
    snprintf(str, 1000, "Time stamp since System Started is Days:%ld, Hours:%ld, Minutes:%ld, Seconds:%ld\n",days, hrs, mins, secs);
    union sigval value;
    value.sival_int = toUse;
    if(sigqueue(pid, SIGTERM, value) == 0) {
    } else {
        perror("SIGSENT-ERROR");
    }
    shmdt(str);
}

static void waiter(){
    while(1);
}

static void sigalrmcall(){
    if (signal (SIGALRM, TimeHandler) == SIG_ERR) {
        fprintf (stderr, "Error in SIGALRM\n");
        exit(-1);
    }
}