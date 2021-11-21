#include <unistd.h>
#include <sys/syscall.h>
#include <stdio.h>

#define SYS_kernel_2d_memcpy 448

int main(int argc, char **argv)
{
  int option;
  printf("Would you like to add a custom input or see a default example? For default example choose 1 else choose any other valid int input and custom input mode with begin, using random non int values may cause errors\n");
  scanf("%d",&option);
  if (option==1){
    int row_count = 2;
    int column_count = 2;

    float srcMatrix[row_count][column_count];
    float destMatrix[row_count][column_count];
    printf("Input Matrix is: \n");
    for(int i = 0; i < row_count; i++){
      for(int j = 0; j < column_count; j++)
      {
        srcMatrix[i][j] = 1;
        printf("The contents of row %d column %d is %f\n", i, j, srcMatrix[i][j]);
      }
    }

    int out = syscall(SYS_kernel_2d_memcpy,destMatrix,srcMatrix,row_count,column_count);

    printf("System call returned %d.\n", out);
    if (out == 0){
      printf("Since System Call Returned 0 it means there was no error in copying\n");
    }
    else if (out == -1){
      printf("Since System Call Returned -1 it means there was an error in copying please check kernel logs for more details\n");
    }
    printf("The Destination Matrix post copying is:\n");
    for(int i = 0; i < row_count; i++){
      for(int j = 0; j < column_count; j++)
      {
        printf("%f ",destMatrix[i][j]);
      }
      printf("\n");
    }
    return 0;
  }

  // Non Default Mode
  int row_count;
  int column_count;
  printf("Enter number of row_count: ");
  scanf("%d",&row_count);
  printf("Enter number of column_count: ");
  scanf("%d",&column_count);

  float srcMatrix[row_count][column_count];
  float destMatrix[row_count][column_count];

  printf("Enter the contents of the matrix (Assume 0 Based Indexing of rows and columns):\n");
  for(int i = 0; i < row_count; i++){
    for(int j = 0; j < column_count; j++)
    {
      printf("Enter the contents of row %d column %d: ", i, j);
      scanf("%f",&srcMatrix[i][j]);
    }
  }

  int out = syscall(SYS_kernel_2d_memcpy,destMatrix,srcMatrix,row_count,column_count);

  printf("System call returned %d.\n", out);
  if (out == 0){
    printf("Since System Call Returned 0 it means there was no error in copying\n");
  }
  else if (out == -1){
    printf("Since System Call Returned -1 it means there was an error in copying please check kernel logs for more details\n");
  }
  printf("The Destination Matrix post copying is:\n");
  for(int i = 0; i < row_count; i++){
    for(int j = 0; j < column_count; j++)
    {
      printf("%f ",destMatrix[i][j]);
    }
    printf("\n");
  }
  return 0;
}