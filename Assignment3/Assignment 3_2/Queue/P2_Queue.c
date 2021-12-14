#include <stdio.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include<stdlib.h>
#include<string.h>
#include "helpers.c"
struct infoPacket {
    long mesg_type;
    char mesg_text[2000];
} ;
  
int main()
{
    int firstMessageID;
    size_t packetSize = sizeof(struct infoPacket);
    struct infoPacket *message1 = malloc(packetSize);
    struct infoPacket *message2 = malloc(packetSize);
    int indexTracker=0;
    while(indexTracker<49){
        firstMessageID = msgget(ftok("progfile1", 65), 0666 | IPC_CREAT);
        
        msgrcv(msgget(ftok("progfile1", 65), 0666 | IPC_CREAT), message1, packetSize, 1, 0);
        printf("Message Text Recieved - %s", message1->mesg_text);

        message2->mesg_type = 2;
        indexTracker = atoi(&message1->mesg_text[strlen(message1->mesg_text)-3]);
        printf("Value Sent to Server: %d\n",indexTracker+1);
        sprintf(message2->mesg_text,"%d",indexTracker);
        if(msgsnd(msgget(ftok("progfile2",75), 0777 | IPC_CREAT), message2, packetSize, 0)!=0){
            throwPerrorandExit("Error While Sending");
        }
        message2->mesg_text[0] = '\0';
    }
    msgctl(firstMessageID, IPC_RMID, NULL);  
    return 0;
}