#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <omp.h>
#include <unistd.h>
#include <linux/kernel.h>
#include <sys/syscall.h>
#include <sys/time.h>
#include <sys/wait.h>
#include <fcntl.h> 
#include <errno.h>
#include<sys/types.h>
#include<sys/stat.h>
#include <sys/resource.h>
#include <sched.h>

int main(){
    pid_t p = fork();
    int s;
    if(p==0){
        double start_wo2 = omp_get_wtime();
        for(long i=0; i<1000000000; ++i);
        double time_wo2 = omp_get_wtime() - start_wo2;
        printf("Time in Parent without Syscall %lf \n",time_wo2);
    }
    else{
        struct timespec *tp;
        waitpid(p, &s, 0);
        int fd = open("abc.txt", O_RDONLY);
        int x = 0;
        int p = read(fd, &x, sizeof(pid_t));
        long retval = syscall(448, x, 10000000);
        double start_wo = omp_get_wtime();
        for(long i=0; i<1000000000; ++i);
        double time_wo = omp_get_wtime() - start_wo;
        printf("Time in Parent with Syscall %lf \n",time_wo);
    }
}
