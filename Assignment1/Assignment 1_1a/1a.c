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

extern int errno;

struct marks_structure
{
    int total_assignment1;
    int total_assignment2;
    int total_assignment3;
    int total_assignment4;
    int total_assignment5;
    int total_assignment6;
};

void processData(char* sectionTracker[26], int marks[26][6])
{
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
}

void stringPrinter(char *str)
{
    size_t w = write(1, str, strlen(str));
    if (w == -1)
    {
        if (errno == EINTR)
        {
            perror("Error in Writing String");
            return;
        }
    }
}
void printforgivensection(char* section, char* sectionTracker[26], int marks[26][6], struct marks_structure *marks_store,int *section_size){
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
    *section_size = counter;
    struct marks_structure ms = *marks_store;
    ms.total_assignment1 = total_assignment1;
    ms.total_assignment2 = total_assignment2;
    ms.total_assignment3 = total_assignment3;
    ms.total_assignment4 = total_assignment4;
    ms.total_assignment5 = total_assignment5;
    ms.total_assignment6 = total_assignment6;
    char str[1000000];
    double avg1 = (double) (ms.total_assignment1)/counter;
    snprintf(str, 10000, "The average marks of all students in Section %s in Assignment %d is: %lf\n", section, 1, avg1);
    stringPrinter(str);
    double avg2 = (double) ms.total_assignment2/counter;
    snprintf(str, 10000, "The average marks of all students in Section %s in Assignment %d is: %lf\n", section, 2, avg2);
    stringPrinter(str);
    double avg3 = (double) ms.total_assignment3/counter;
    snprintf(str, 10000, "The average marks of all students in Section %s in Assignment %d is: %lf\n", section, 3, avg3);
    stringPrinter(str);
    double avg4 = (double) ms.total_assignment4/counter;
    snprintf(str, 10000, "The average marks of all students in Section %s in Assignment %d is: %lf\n", section, 4, avg4);
    stringPrinter(str);
    double avg5 = (double) ms.total_assignment5/counter;
    snprintf(str, 10000, "The average marks of all students in Section %s in Assignment %d is: %lf\n", section, 5, avg5);
    stringPrinter(str);
    double avg6 = (double) ms.total_assignment6/counter;
    snprintf(str, 10000, "The average marks of all students in Section %s in Assignment %d is: %lf\n", section, 6, avg6);
    stringPrinter(str);
    printf("\n");
}


int main()
{
    int marks[26][6];
    char* sectionTracker[26];
    pid_t id;
    int stat;
    int ctr = 1;
    double avg = 0;
    struct marks_structure marks_store = {0,0,0,0,0,0};
    struct marks_structure marks_store2 = {0,0,0,0,0,0};
    char* section;
    int section_size = 0;
    int section_size2 = 0;
    id = fork();
    if (id == 0)
    {   
        processData(sectionTracker, marks); 
        section = "A";
        printforgivensection(section, sectionTracker, marks, &marks_store, &section_size);
        exit(0);
    }
    else if (id > 0)
    {
        processData(sectionTracker, marks);
        section = "B";
        int x = waitpid(id, &stat, 0);
        if (stat == EINTR)
        {
            perror("Error in waitpid");
            return EX_SOFTWARE;
        }
        printforgivensection(section, sectionTracker, marks, &marks_store2, &section_size2);
    }
    else
    {
        perror("Error in Fork");
        return EX_OSERR;
    }
    return 0;
}