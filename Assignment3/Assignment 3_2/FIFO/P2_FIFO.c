#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include "helpers.c"

int main()
{
    int fd1;
    char * myfifo = "/tmp/myfifo";
    mkfifo(myfifo, 0666);
    int i = 0;
    char str1[1000] = {0}, *str2 = malloc(1000);
    while (i<49)
    {
        fd1 = open(myfifo,O_RDONLY);
        read(fd1, str1, 1000);
        printString(i, str1);

        close(fd1);
        int len = strlen(str1);

        const char *index = &str1[len-3];
        i = atoi(index);
        fd1 = open(myfifo,O_WRONLY);
        sprintf(str2, "%d",i);
        write(fd1, str2, strlen(str2)+1);
        close(fd1);
    }
    unlink(myfifo);
    exit(0);
}