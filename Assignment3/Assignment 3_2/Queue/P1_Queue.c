#include <stdio.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <stdlib.h>
#include <string.h>
#include "helpers.c"

struct infoPacket {
    long mesg_type;
    char mesg_text[2000];
} ;
  
int main()
{   
    size_t packetSize = sizeof(struct infoPacket);
    struct infoPacket *firstMessage = malloc(packetSize);
    struct infoPacket *secondMessage = malloc(packetSize);
    int messageID1;
    int messageID2;
    size_t string_size = 30;
    char *randomStringArray[50];
    populateArraywithRandomStrings(randomStringArray, 50);
    
    int indexTracker = 0;
    int x = 1;
    while(indexTracker<50){

    messageID1 = msgget(ftok("progfile1", 65), 0666 | IPC_CREAT);
    messageID2 = msgget(ftok("progfile2", 75), 0777 | IPC_CREAT);

    firstMessage->mesg_type = 1;
    strcat(firstMessage->mesg_text,randomStringArray[indexTracker]);
    strcat(firstMessage->mesg_text,randomStringArray[indexTracker+1]);
    strcat(firstMessage->mesg_text,randomStringArray[indexTracker+2]);
    strcat(firstMessage->mesg_text,randomStringArray[indexTracker+3]);
    strcat(firstMessage->mesg_text,randomStringArray[indexTracker+4]);
    msgsnd(messageID1, firstMessage, packetSize, 0);
    firstMessage->mesg_text[0] = '\0';
    msgrcv(messageID2, secondMessage, packetSize, 2, 0);
    indexTracker = atoi(secondMessage->mesg_text) + 1;
    printf("Sent random strings batch %d \n",x);
    printf("Client has Sent : %d \n", atoi(secondMessage->mesg_text)+1);
    x=x+1;
    if (indexTracker == 50){
        printf("Exiting");
    }
    }
    msgctl(messageID2, IPC_RMID, NULL);
    return 0;
    
}