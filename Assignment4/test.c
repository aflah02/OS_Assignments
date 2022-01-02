#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <sysexits.h>
#include <signal.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <inttypes.h>
#include <sys/mman.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <time.h>
#include <sys/msg.h>
#include <sys/socket.h>
#include <sys/un.h>

int main()
{
    for (int i = 0; i < 70; i++)
    {
        int fd = open("/dev/urandom", O_RDONLY);
        unsigned char bufferr[8];
        read(fd, bufferr, 8);
        unsigned long int num = 0;
        for (int i = 0; i < 8; i++)
        {
            num = num << 8;
            num = num | bufferr[i];
        }    
        syscall(450,num);
        printf("%d) Producer Produced %lu\n",i+1,num);
    }
}