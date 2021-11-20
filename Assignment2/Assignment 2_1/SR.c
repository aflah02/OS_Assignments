#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <signal.h>
#include <unistd.h>
#include <errno.h>
#include <sys/time.h>
#include <stdint.h>
#include "helperSR.c"
pid_t pid;

int main(int no,char *args[]){
    printf("HelloSR");
    pid = atoi(args[0]);
    printf("%d \n",pid);
    if (signal (SIGALRM, signal_handler) == SIG_ERR) {
        fprintf (stderr, "Cannot handle SIGALRM!\n");
        exit (-1);
    }
    struct itimerval it_val;
    it_val.it_value.tv_sec = 2;
    it_val.it_value.tv_usec = 200000;	
    it_val.it_interval = it_val.it_value;
    if (setitimer(ITIMER_REAL, &it_val, NULL) == -1) {
        perror("error calling setitimer()");
        exit(1);
    }

    raise(14);
    while(1);
    printf("SR end\n");
}