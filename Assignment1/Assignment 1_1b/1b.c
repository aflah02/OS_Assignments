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
#include <pthread.h>

extern int errno;
char* section;
double secA[6];
double secB[6]; 

struct marks_structure
{
    int total_assignment1;
    int total_assignment2;
    int total_assignment3;
    int total_assignment4;
    int total_assignment5;
    int total_assignment6;
};

void processData(void* args)
{
    int marks[26][6];
    char* sectionTracker[26];
    int section_size = 0;
    struct marks_structure marks_store = {0,0,0,0,0,0};
int fileDescriptor = open("student_record.csv", O_RDONLY);
    if (fileDescriptor == -1)
    {
        perror("Error in Open Operation");
        return;
    }
    char *tempchar = (char *)calloc(9696, sizeof(char));
    char *data[9696];
    int bytesRead = read(fileDescriptor, tempchar, 9696);
    if (bytesRead < 0)
    {
        perror("Error in Read Operation");
        return;
    }
    char *token = strtok(tempchar, "\n");
    int line_no = 0;
    while (token != NULL)
    {
        data[line_no] = token;
        line_no += 1;
        token = strtok(NULL, "\n");
    }
    int tempIntforStudentID;
    for (int i = 0; i < 26; i++)
    {
        token = strtok(data[i + 1], ",");
        tempIntforStudentID = atoi(token);
        token = strtok(NULL, ",");
        sectionTracker[i] = token;
        token = strtok(NULL, ",");
        marks[i][0] = atoi(token);
        token = strtok(NULL, ",");
        marks[i][1] = atoi(token);
        token = strtok(NULL, ",");
        marks[i][2] = atoi(token);
        token = strtok(NULL, ",");
        marks[i][3] = atoi(token);
        token = strtok(NULL, ",");
        marks[i][4] = atoi(token);
        token = strtok(NULL, ",");
        marks[i][5] = atoi(token);
    }
    if (close(fileDescriptor) == -1)
    {
        perror("File is Closed");
        return;
    }
    int total_assignment1 = 0;
    int total_assignment2 = 0;
    int total_assignment3 = 0;
    int total_assignment4 = 0;
    int total_assignment5 = 0;
    int total_assignment6 = 0;
    int counter = 0;

    for (int i = 0; i < 26; i++){
        if (strcmp(sectionTracker[i], section)==0){
            counter++;
            total_assignment1 += marks[i][0];
            total_assignment2 += marks[i][1];
            total_assignment3 += marks[i][2];
            total_assignment4 += marks[i][3];
            total_assignment5 += marks[i][4];
            total_assignment6 += marks[i][5];
        }
    }
    section_size = counter;
    struct marks_structure ms = marks_store;
    ms.total_assignment1 = total_assignment1;
    ms.total_assignment2 = total_assignment2;
    ms.total_assignment3 = total_assignment3;
    ms.total_assignment4 = total_assignment4;
    ms.total_assignment5 = total_assignment5;
    ms.total_assignment6 = total_assignment6;
    char str[1000000];
    if (section == "A"){
    secA[0] = total_assignment1;
    secA[1] = total_assignment2;
    secA[2] = total_assignment3;
    secA[3] = total_assignment4;
    secA[4] = total_assignment5;
    secA[5] = total_assignment6; 
    }
    if (section == "B"){
    secB[0] = total_assignment1;
    secB[1] = total_assignment2;
    secB[2] = total_assignment3;
    secB[3] = total_assignment4;
    secB[4] = total_assignment5;
    secB[5] = total_assignment6; 
    }
    double avg1 = (double) (ms.total_assignment1)/counter;
    snprintf(str, 10000, "The average marks of all students in Section %s in Assignment %d is: %lf\n", section, 1, avg1);
    size_t w1 = write(1, str, strlen(str));
    if (w1 < 0)
    {
        if (errno == EINTR)
        {
            perror("write");
            return;
        }
    }
    double avg2 = (double) ms.total_assignment2/counter;
    snprintf(str, 10000, "The average marks of all students in Section %s in Assignment %d is: %lf\n", section, 2, avg2);
    size_t w2 = write(1, str, strlen(str));
    if (w2 < 0)
    {
        if (errno == EINTR)
        {
            perror("write");
            return;
        }
    }
    double avg3 = (double) ms.total_assignment3/counter;
    snprintf(str, 10000, "The average marks of all students in Section %s in Assignment %d is: %lf\n", section, 3, avg3);
    size_t w3 = write(1, str, strlen(str));
    if (w3 < 0)
    {
        if (errno == EINTR)
        {
            perror("write");
            return;
        }
    }
    double avg4 = (double) ms.total_assignment4/counter;
    snprintf(str, 10000, "The average marks of all students in Section %s in Assignment %d is: %lf\n", section, 4, avg4);
    size_t w4 = write(1, str, strlen(str));
    if (w4 < 0)
    {
        if (errno == EINTR)
        {
            perror("write");
            return;
        }
    }
    double avg5 = (double) ms.total_assignment5/counter;
    snprintf(str, 10000, "The average marks of all students in Section %s in Assignment %d is: %lf\n", section, 5, avg5);
    size_t w5 = write(1, str, strlen(str));
    if (w5 < 0)
    {
        if (errno == EINTR)
        {
            perror("write");
            return;
        }
    }
    double avg6 = (double) ms.total_assignment6/counter;
    snprintf(str, 10000, "The average marks of all students in Section %s in Assignment %d is: %lf\n", section, 6, avg6);
    size_t w6 = write(1, str, strlen(str));
    if (w6 < 0)
    {
        if (errno == EINTR)
        {
            perror("write");
            return;
        }
    }
    printf("\n");
}

int main()
{
    pthread_t thread1, thread2;
    section = "A";
    pthread_create(&thread1, NULL, (void*)&processData, NULL);
    pthread_join(thread1, NULL);
    section = "B";
    pthread_create(&thread2, NULL, (void*)&processData, NULL);
    pthread_join(thread2, NULL);

    char str[1000000];
    for (int i = 0; i < 6; i++){
        double avg = (double) (secA[i]+secB[i])/26;
        snprintf(str, 10000, "The average marks of all students in Both Sections in Assignment %d is: %lf\n", i+1, avg);
        size_t w = write(1, str, strlen(str));
        if (w < 0)
        {
            if (errno == EINTR)
            {
                perror("write");
                return 0;
            }
        }
    }
    pthread_exit(NULL);
    return 0;
}