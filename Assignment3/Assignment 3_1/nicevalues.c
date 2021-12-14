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
    execl("/bin/sh", "sh", "nicevalue.sh", (char *) NULL);
}
