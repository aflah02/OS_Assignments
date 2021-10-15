#include <stdio.h>
#include <stdlib.h>


int main(){
    int structure[6] = {7,4,6,3,7,2};
    int row_count =  6;
    int column_count = 0;
    
    int **array = (int **)malloc(row_count*sizeof(int *));

    for (int i=0; i < row_count; i++){
        array[i] = (int *)calloc(structure[i], sizeof(int));
    }

    for(int i = 0 ; i < row_count ; i++){
        for(int j = 0 ; j < structure[i] ; j++){
            int x = (rand()%(10)) + 1;
            array[i][j] = x;
            printf("%d ", x);
        }
        printf("\n");
    }

    for (int i = 0; i < row_count ; i++){
        printf("Enter the size for row no. %d: " , i+1);
        scanf("%d", &column_count);
        structure[i] = column_count;
        array[i] = realloc(array[i], structure[i]*sizeof(int));
    }
    for(int i  = 0 ; i < row_count ; i++){
        for(int j = 0 ; j < structure[i] ; j++){
            int x = (rand()%(10)) + 1;
            array[i][j] = x;
            printf("%d ", x);
        }
        printf("\n");
        free(array[i]);
    }
}
