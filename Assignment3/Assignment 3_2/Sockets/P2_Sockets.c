#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "helpers.c"

#define ADDRESS     "Sockets"  /* addr to connect */

int main()
{
    FILE *filePointer;
    register int communicationEndpoint, sizeofAddressofHost;
    struct sockaddr_un addressofHost;

    if ((communicationEndpoint = socket(AF_UNIX, SOCK_STREAM, 0)) < 0) {
        throwPerrorandExit("Error in Client's Socket");
    }

    addressofHost.sun_family = AF_UNIX;
    strcpy(addressofHost.sun_path, ADDRESS);

    sizeofAddressofHost = sizeof(addressofHost.sun_family) + strlen(addressofHost.sun_path);

    if (connect(communicationEndpoint, (struct sockaddr *)&addressofHost, sizeofAddressofHost) < 0) {
        throwPerrorandExit("Error While Trying to Connect to Client");
    }

    filePointer = readfromSocket(communicationEndpoint);

    int numrec = 0;
    while(numrec<50){
        char ans[1000];
        int k = 0;
        char tempChar;
        for (int i = 0; i < 5; i++) {
            while ((tempChar = fgetc(filePointer)) != EOF) {
                putchar(tempChar);
                if (tempChar == '\n')
                    break;
                ans[k] = tempChar;
                k++;
            }
        }
        numrec = (ans[k-2] -'0')*10  + (ans[k-1] -'0');
        printf("Number Received on Client- %d\n",numrec);
        numrec = numrec + 1;
        char StringSentBack[200];
        sprintf(StringSentBack, "%d", numrec);
        printf("String - %s \n",StringSentBack);
        send(communicationEndpoint, StringSentBack, 2, 0);
    }

    endConnection(communicationEndpoint);

    exit(0);
}