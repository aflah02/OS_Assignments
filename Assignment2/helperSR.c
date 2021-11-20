#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <signal.h>
#include <unistd.h>
#include <errno.h>
#include <sys/time.h>
#include <stdint.h>
pid_t pid;

int rdrand_gen (int *rand){
    unsigned char ok;
    __asm__ volatile ("rdrand %0; setc %1" : "=r" (*rand), "=qm" (ok));
    return (int)ok;
}


static void signal_handler (int signo)
{
    printf("Signal Handler of SR\n");
    int r = 0;
    rdrand_gen(&r);
    if(r>0){
        r = r*(-1);
    }
    int* ptr = &r; 
    union sigval value;
    value.sival_int = r;
    printf("uint64: %d\n",value.sival_int);
    if(sigqueue(pid, SIGTERM, value) == 0) {
        printf("signal sent successfully!!\n");
    } else {
        perror("SIGSENT-ERROR:");
    }
}