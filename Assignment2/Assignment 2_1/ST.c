#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include "helperST.c"
pid_t pid;

int main(int no,char *args[]){
    char *str = args[0];
    pid = atoi(str);
    if (signal (SIGALRM, signal_handler1) == SIG_ERR) {
        fprintf (stderr, "Cannot handle SIGALRM!\n");
        exit (-1);
    }
    if (signal (SIGTERM, signal_handler) == SIG_ERR) {
        fprintf (stderr, "Cannot handle SIGALRM!\n");
        exit (-1);
    }
    struct itimerval it_val;
    it_val.it_value.tv_sec = 1;
    it_val.it_value.tv_usec = 100000;	
    it_val.it_interval = it_val.it_value;
    if (setitimer(ITIMER_REAL, &it_val, NULL) == -1) {
        perror("error calling setitimer()");
        exit(1);
    }

    raise(14);
    while(1);
    printf("ST end\n");
}
