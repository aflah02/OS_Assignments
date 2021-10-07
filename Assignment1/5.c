#include <stdio.h>  
#include <stdlib.h> 
#include <limits.h>


void selectionSort(unsigned int arr[], int n)
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

int main(){
    int n;
    printf("Enter the size of array: (Actual Size will be 3 greater to add the 3 elements given in the question) ");
    scanf("%d",&n);
    unsigned int arr[n+3];
    printf("\nEnter the elements of array: \n");
    arr[0] = 4294967290;
    arr[1] = 4294967295;
    arr[2] = 10400;
    for(int i = 3 ; i < n+3 ; i++){
        unsigned long long k;
        scanf("%llu",&k);
        if(k > UINT_MAX){
            printf("Overflow Detected as input Value exceeds Max Value for Unsigned Integer\n");
            printf("EXITING PROGRAM\n");
            return 0;
        }
        else if(k < 0){
            printf("Overflow Detected as input Value is signed and hence is not compatible for type Unsigned Integer\n");
            printf("EXITING PROGRAM\n");
            return 0;
        }
        else{
            arr[i] = (unsigned int) k;
        }
    }

    selectionSort(arr,n+3);
    unsigned int e;

    printf("Enter the element to be searched: ");

    unsigned long long k;
    scanf("%llu",&k);
        if(k > UINT_MAX){
            printf("Overflow Detected as input Value exceeds Max Value for Unsigned Integer\n");
            printf("EXITING PROGRAM\n");
            return 0;
        }
        else if(k < 0){
            printf("Overflow Detected as input Value is signed and hence is not compatible for type Unsigned Integer\n");
            printf("EXITING PROGRAM\n");
            return 0;
        }
        else{
            e = (unsigned int) k;
        }

    printf("%u\n" , e);

    for(int i = 0 ; i < n + 3; i++){
        printf("%u ",arr[i]);
    }
    printf("\n");
    
    int l = 0;
    int h = n-1;
    int target = e;
    int location = -1;

    while (l <= h){
        int mid = l + (h-l)/2;
        if (arr[mid] > target){
            h = mid - 1;
        }
        else if (arr[mid] < target){
            l = mid + 1;
        }
        else{
            location = mid;
            break;
        }
    }

    if(location == -1){
        printf("\nElement is not present in the Array\n");
    }
    else{
        printf("\nElement fount at position %d (Taking 1 Based indexing for the array)\n" , location + 1);
    }
    return 0;
}

