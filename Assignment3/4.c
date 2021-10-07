#include <stdio.h>
#include <stdlib.h>

void bubbleSort(int arr[], int n)
{
   int i, j;
   for (i = 0; i < n-1; i++)     
   {
       for (j = 0; j < n-i-1; j++)
       {
           if (arr[j] > arr[j+1])
           {
              int temp = arr[j];
              arr[j] = arr[j+1];
              arr[j+1] = temp;           
           }
       }
   }
}

void selectionSort(int arr[], int n)
{
   int i, j, position, swap;
   for (i = 0; i < (n - 1); i++) {
      position = i;
      for (j = i + 1; j < n; j++) {
         if (arr[position] > arr[j])
            position = j;
      }
      if (position != i) {
         swap = arr[i];
         arr[i] = arr[position];
         arr[position] = swap;
      }
   }
}

int main()
{
    int n;
    printf("Enter the Size for the Array: ");
    scanf("%d", &n);

    int array[n];

    printf("Enter Elements for Array->");
    printf("\n");

    for (int i = 0 ; i < n ; i++){
        scanf("%d", &array[i]); 
    }

    int choice;
    printf("Enter 0 for Bubble Sort and 1 for Selection Sort: ");
    scanf("%d", &choice);

    if (choice == 0){
        bubbleSort(array, n);
    }
    else if (choice == 1){
        selectionSort(array, n);
    }
    for (int i = 0 ; i < n ; i++){
        printf("%d ", array[i]); 
    }
}
 
