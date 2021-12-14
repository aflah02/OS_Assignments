#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

static char *generateRandomString(size_t length){
    char Choices[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    char *randomlyGeneratedString = malloc(30);
    for (int i = 0; i < length; i++){
        randomlyGeneratedString[i] = Choices[rand() % (int) (sizeof Choices - 1)];
    }
    return randomlyGeneratedString;
}

static char *addIndexasTrailtoString(char *randomlyGeneratedString, size_t length, int stringIndex){

    int tensPlace = ((stringIndex/10)%10);
    int onesPlace = (stringIndex%10);
    randomlyGeneratedString[length] = ' ';
    randomlyGeneratedString[length+1] = tensPlace + '0';
    randomlyGeneratedString[length+2] = onesPlace + '0';
    randomlyGeneratedString[length+3] = '\n';
    return randomlyGeneratedString;
}

static char *getRandomString(char *randomlyGeneratedString, size_t length,int stringIndex){
    randomlyGeneratedString = generateRandomString(length);
    randomlyGeneratedString = addIndexasTrailtoString(randomlyGeneratedString, length, stringIndex);
    // printf("%s", randomlyGeneratedString);
    // exit(0);
    return randomlyGeneratedString;
}

static void endConnection(register int s){
    close(s);
}

static FILE *readfromSocket(register int connectionToClient){
    FILE *filePointer;
    filePointer = fdopen(connectionToClient, "r");
}

static void throwPerrorandExit(char *str){
    perror(str);
    exit(1);
}

static void populateArraywithRandomStrings(char* arrayToPopulate[], int lenOfArray){
    for(int i = 0; i < lenOfArray; i++){
        char *randomlyGeneratedString = malloc(20);
        arrayToPopulate[i] = getRandomString(randomlyGeneratedString, 20, i);
    }
}

static void SendandReadSignals(register int connectionToClient, char *listOfRandomlyGeneratedString[50]){
    int stringID=0;
    while(stringID<50){
        for (int i = stringID; i < stringID+5; i++)
        send(connectionToClient, listOfRandomlyGeneratedString[i], strlen(listOfRandomlyGeneratedString[i]), 0);
        char number[100];
        int i=0;
        int valread = read(connectionToClient,number, 100);
        printf("Number Received - %s\n",number);
        stringID = atoi(number);
    }
}

static key_t generateKeyT(char *pathNametoUse, int projectID){
    return ftok(pathNametoUse, projectID);
}