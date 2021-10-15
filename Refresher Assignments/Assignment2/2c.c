#include <stdio.h>  
#include <stdlib.h>   

struct node   {  
    int data;  
    struct node *next;  
};  
struct NodeforQueue {
    int key;
    struct NodeforQueue* next;
};
 
struct Queue {
    struct NodeforQueue *head, *back;
};
 
struct NodeforQueue* newNode(int k)
{
    struct NodeforQueue* temp = (struct NodeforQueue*)malloc(sizeof(struct NodeforQueue));
    temp->key = k;
    temp->next = NULL;
    return temp;
}
 
struct Queue* createQueue()
{
    struct Queue* q = (struct Queue*)malloc(sizeof(struct Queue));
    q->head = q->back = NULL;
    return q;
}
 
void enqueue(struct Queue* q, int k)
{
    struct NodeforQueue* temp = newNode(k);
    if (q->back == NULL) {
        q->head = q->back = temp;
        return;
    }
    q->back->next = temp;
    q->back = temp;
}
void qdisplay(struct Queue* q)  
{  
    struct NodeforQueue *ptr;  
    ptr = q->head;      
    if(ptr == NULL)  
    {  
        printf("\nQueue is Empty\n");  
    }  
    else  
    { 
        while(ptr != NULL)   
        {  
            printf("\n%d\n",ptr -> key);  
            ptr = ptr -> next;  
        }  
    }  
}
void dequeue(struct Queue* q)
{
    if (q->head == NULL) return;
    struct NodeforQueue* temp = q->head;
 
    q->head = q->head->next;

    if (q->head == NULL) q->back = NULL;
 
    free(temp);
}

struct node *head;  
  
void push ()  
{  
    int data;  
    struct node *tracker = (struct node*)malloc(sizeof(struct node));   
    if(tracker == NULL)  printf("Can't Push Element");
    else   
    {  
        printf("Enter the dataue: ");  
        scanf("%d",&data);  
        if(head==NULL)  
        {         
            tracker->data = data;  
            tracker -> next = NULL;  
            head=tracker;  
        }   
        else   
        {  
            tracker->data = data;  
            tracker->next = head;  
            head=tracker;  
        }  
        printf("Item pushed");   
    }  
}  
  
void pop()  
{  
    int item;  
    struct node *tracker;  
    if (head == NULL)  
    {  
        printf("Stack is Empty");  
    }  
    else  
    {  
        item = head->data;  
        tracker = head;  
        head = head->next;  
        free(tracker);  
        printf("Item popped");  
    }  
}  

void display()  
{  
    int i;  
    struct node *tracker;  
    tracker=head;  
    if(tracker == NULL)  printf("Stack is Empty\n");  
    else  
    {  
        printf("Printing Stack elements \n");  
        while(tracker!=NULL)  
        {  
            printf("%d\n",tracker->data);  
            tracker = tracker->next;  
        }  
    }  
}  

void main ()  
{  
    printf("\nEnter 1 to use Stack and 2 to use Queue (else program will end): \n");
    int svq = 0; 
    scanf("%d",&svq); 
    if (svq == 1) {
        int option = 0; 
        while(option != 4)  
        {  
            
            printf("\nOptions: \n");  
            printf("\n1.Push\n2.Pop\n3.Show\n4.Exit");  
            printf("\n Enter your option \n");        
            scanf("%d",&option); 
            if (option == 1){
                push();
            } 
            else if (option == 2){
                pop();
            }
            else if (option == 3){
                display();
            }
            else if (option == 4){
                printf("Ending Program");
            }
            else{
                printf("Invalid option");
            }
        } 
    }
    else if (svq == 2){
        int option = 0; 
        struct Queue* q = createQueue();
        while(option != 4)  
        {  
            
            printf("\nOptions: \n");  
            printf("\n1.enqueue\n2.dequeue\n3.Display\n4.Exit");  
            printf("\n Enter your option \n");        
            scanf("%d",&option); 
            if (option == 1){
                int x = -1;
                printf("\n Enter value to enqueue \n");        
                scanf("%d",&x); 
                enqueue(q, x);
            } 
            else if (option == 2){
                printf("dequeued");
                dequeue(q);
            }
            else if (option == 3){
                qdisplay(q);
            }
            else if (option == 4){
                printf("Ending Program");
            }
            else{
                printf("Invalid option");
            }
        } 
    }
}  