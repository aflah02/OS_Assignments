#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "helpers.c"

#define ADDRESS     "Sockets"

int main()
{
    char c;
    FILE *filePointer;
    int fromlen;
    register int communicationEndpoint;
    register int connectionToClient;
    register int sizeofAddressofHost;
    struct sockaddr_un addressofHost;
    struct sockaddr_un addressOfClient;
    
    char *listOfRandomlyGeneratedString[50];
    populateArraywithRandomStrings(listOfRandomlyGeneratedString, 50);

    if ((communicationEndpoint = socket(AF_UNIX, SOCK_STREAM, 0)) < 0) {
        throwPerrorandExit("Error in Server's Socket");
    }

    addressofHost.sun_family = AF_UNIX;
    strcpy(addressofHost.sun_path, ADDRESS);

    unlink(ADDRESS);
    sizeofAddressofHost = sizeof(addressofHost.sun_family) + strlen(addressofHost.sun_path);

    if (bind(communicationEndpoint,(struct sockaddr *)&addressofHost, sizeofAddressofHost) < 0) {
        throwPerrorandExit("Error While Trying to Bind to Server");
    }

    if (listen(communicationEndpoint, 3) < 0) {
        throwPerrorandExit("Error While Trying to Listen to Socket");
    }

    if ((connectionToClient = accept(communicationEndpoint, (struct sockaddr *)&addressOfClient, &fromlen)) < 0) {
        throwPerrorandExit("Error While Trying to Accept Connection");
    }

    filePointer = readfromSocket(connectionToClient);

    SendandReadSignals(connectionToClient,listOfRandomlyGeneratedString);

    endConnection(communicationEndpoint);

    exit(0);
}