#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <signal.h>
#include <unistd.h>
#include <errno.h>
#include <sys/time.h>
#include <stdint.h>
pid_t pid;
static void throwperror(char* str){
    perror(str);
}
int InLineRandomNumberGenerator (int *rand){
    unsigned char ok;
    __asm__ volatile ("rdrand %0; setc %1" : "=r" (*rand), "=qm" (ok));
    return (int)ok;
}


static void SRSignals (int signo)
{
    int r = 0;
    InLineRandomNumberGenerator(&r);
    if(r<0){
    }
    else{
        r = r*(-1);
    }
    union sigval sval;
    sval.sival_int = r;
    if(sigqueue(pid, SIGTERM, sval) == 0) {
        
    } else {
        perror("SIGSENT-ERROR:");
    }
}

static void SRSignalCheck(){
    if (signal (SIGALRM, SRSignals) == SIG_ERR) {
        fprintf (stderr, "Cannot handle SIGALRM!\n");
        exit (-1);
    }
}
static void itimerRealerror(struct itimerval it_val){
    if (setitimer(ITIMER_REAL, &it_val, NULL) == -1) {
        throwperror("Error Caused When Using setitimer");
        exit(1);
    }
}
static void useitimerval(){
    struct itimerval it_val;
    it_val.it_value.tv_sec = 2;
    it_val.it_value.tv_usec = 200000;	
    it_val.it_interval = it_val.it_value;
    itimerRealerror(it_val);
}

static void waiter(){
    while(1);
}


