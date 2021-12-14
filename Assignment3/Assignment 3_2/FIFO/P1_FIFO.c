#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/socket.h>
#include <stdlib.h>
#include <netinet/in.h>
#include "helpers.c"

int main()
{
    int fileDescriptor;
    char *randomStrings[50];
    for(int i = 0; i<50; i++){
        randomStrings[i] = generateRandomString(5);
        if(i <= 9){
            sprintf(randomStrings[i],"%s 0%d\n",randomStrings[i],i);
        }else{ 
            sprintf(randomStrings[i],"%s %d\n",randomStrings[i],i);
        }
        randomStrings[i][8]= '\n';
        randomStrings[i][9]= '\0';
    }
    mkfifo("/tmp/myfifo", 0666);
    char str1[1000];
    char **MatrixStr = malloc(10000);
    int iteratorIndex = 0;
    while (iteratorIndex < 50)
    {
        MatrixStr = randomStrings;
        fileDescriptor = open("/tmp/myfifo", O_WRONLY);
        write(fileDescriptor, *(MatrixStr+iteratorIndex), strlen(*MatrixStr));
        write(fileDescriptor, *(MatrixStr+iteratorIndex+1), strlen(*MatrixStr));
        write(fileDescriptor, *(MatrixStr+iteratorIndex+2), strlen(*MatrixStr));
        write(fileDescriptor, *(MatrixStr+iteratorIndex+3), strlen(*MatrixStr));
        write(fileDescriptor, *(MatrixStr+iteratorIndex+4), strlen(*MatrixStr));
        close(fileDescriptor);
        fileDescriptor = open("/tmp/myfifo", O_RDONLY);
        read(fileDescriptor, str1, sizeof(str1));
        iteratorIndex = atoi(str1)+1;
        printf("Sent by Client: %s\n", str1);
        close(fileDescriptor);
    }
    unlink("/tmp/myfifo");
    exit(0);
}