#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include<string.h>

struct node {
  int yearofjoining;
  char name[50];
  char enrolledacademicprogram[50];
  int rollno;
  struct node *next;
  struct node *prev;
};

void insert();
void display();
void delete();
void revdisplay();
int count();

typedef struct node DATA_NODE;

DATA_NODE *head_node, *first_node, *temp_node = 0, *prev_node, next_node , *tail_node;

int rollno;
char name[50];
int yearofjoining;
char enrolledacademicprogram[50];

int main() {
  int option = 0;

  printf("Doubly Linked List Example - All Operations\n");

  while (option < 6) {

    printf("\nOptions\n");
    printf("1 : Insert a New Student \n");
    printf("2 : Delete an existing Student \n");
    printf("3 : Display List of Students in Ascending order of Insertion \n");
    printf("4 : Display List of Students in Descending order of Insertion \n");
    printf("5 : Count Number of Students\n");
    printf("Others : Exit()\n");
    printf("Enter your option:");
    scanf("%d", &option);
    switch (option) {
      case 1:
        insert();
        break;
      case 2:
        delete();
        break;
      case 3:
        display();
        break;
      case 4:
        revdisplay();
        break;
      case 5:
        count();
        break;
      default:
        break;
    }
  }

  return 0;
}

void insert() {
  printf("\nEnter Name of Student : \n");
  scanf("%s", name);
  printf("\nEnter Roll No. of Student : \n");
  scanf("%d", &rollno);
  printf("\nEnter Year of Joining of Student : \n");
  scanf("%d", &yearofjoining);
  printf("\nEnter Academic Program of Student : \n");
  scanf("%s", enrolledacademicprogram);

  temp_node = (DATA_NODE *) malloc(sizeof (DATA_NODE));

  temp_node->yearofjoining = yearofjoining;
  strcpy(temp_node->enrolledacademicprogram,enrolledacademicprogram);
  temp_node->rollno = rollno;
  strcpy(temp_node->name,name);

  if (first_node == 0) {
    first_node = temp_node;
  } else {
    head_node->next = temp_node;
    temp_node->prev = head_node;
  }
  temp_node->next = 0;
  head_node = temp_node;
  fflush(stdin);
}

void delete() {
  int countvalue, pos, i = 0;
  countvalue = count();
  temp_node = first_node;
  printf("\nDisplay Linked List : \n");

  printf("\nEnter Position for Delete Element : \n");
  scanf("%d", &pos);

  if (pos > 0 && pos <= countvalue) {
    if (pos == 1) {
      temp_node = temp_node -> next;
      first_node = temp_node;
      first_node->prev = 0;
      printf("\nDeleted Successfully \n\n");
    } else {
      while (temp_node != 0) {
        if (i == (pos - 1)) {
          prev_node->next = temp_node->next;
          temp_node->prev = 0;
          if(temp_node->next!=0){
            temp_node->next->prev = prev_node;
          }
          if(i == (countvalue - 1))
          {
			  head_node = prev_node;
		  }
          printf("\nDeleted Successfully \n\n");
          break;
        } else {
          i++;
          prev_node = temp_node;
          temp_node = temp_node -> next;
        }
      }
    }
  } else
    printf("\nInvalid Position \n\n");
}

void display() {
  int count = 0;
  temp_node = first_node;
  printf("\nDisplay Student List : \n");
  while (temp_node != 0) {
    printf("%s ", temp_node->name);
    count++;
    temp_node = temp_node -> next;
  }
  printf("\nNo Of Students are : %d\n", count);
}

void revdisplay(){
  int count = 0;
  temp_node = head_node;
  printf("\nDisplay Student List : \n");
  while (temp_node != 0) {
    printf("%s ", temp_node->name);
    count++;
    temp_node = temp_node -> prev;
  }
  printf("\nNo Of Students are : %d\n", count);
}

int count() {
  int count = 0;
  temp_node = first_node;
  while (temp_node != 0) {
    count++;
    temp_node = temp_node -> next;
  }
  printf("\nNo Of Students are : %d\n", count);
  return count;
}