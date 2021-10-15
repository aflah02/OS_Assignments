#include <stdio.h>
#include <stdlib.h>

int main()
{

int x;
int y;

printf("\n");
printf("Enter The First Element: ");
scanf("%d", &x);

printf("\n");
printf("Enter The Second Element: ");
scanf("%d", &y);

// METHOD 1
// Swap Elements of 2 Variables with a temporary variable
printf("Before Swapping x = %d, y = %d\n", x, y);
int temp = x;
x = y;
y = temp;
printf("After Swapping x = %d, y = %d\n", x, y);

// METHOD 2
// Swap Elements of 2 Variables without a temporary variable
printf("Before Swapping x = %d, y = %d\n", x, y);
x = x * y;
y = x / y; 
x = x / y; // Here y is x so when we divide x which is x*y by x we get y stored in x
printf("After Swapping x = %d, y = %d\n", x, y);

// Swap Elements of 2 Variables without a temporary variable
printf("Before Swapping x = %d, y = %d\n", x, y);
x = x * y;
y = x / y; 
x = x / y; // Here y is x so when we divide x which is x*y by x we get y stored in x
printf("After Swapping x = %d, y = %d\n", x, y);

// For Swapping Elements of 2 Arrays
int n;
printf("Enter the Size for the Arrays: ");
scanf("%d", &n);

int array1[n];
int array2[n];
int tempArray[n];

printf("Enter Elements for First Array->");
printf("\n");
for (int i = 0 ; i < n ; i++){
    scanf("%d", &array1[i]); 
}

printf("\n");

printf("Enter Elements for Second array->");
printf("\n");
for (int i = 0 ; i < n ; i++){
    scanf("%d", &array2[i]); 
}

// Printing Original Values
printf("Arrays before swapping");
printf("\n");
printf("First array->");
for (int i = 0 ; i < n ; i++) {
	printf("%d ", array1[i]);
}
printf("\n");
printf("Second array->");
for (int i = 0 ; i < n ; i++) {
	printf("%d ", array2[i]);
}
for (int i = 0 ; i < n ; i++) {
	tempArray[i] = array1[i];
	array1[i] = array2[i];
	array2[i] = tempArray[i];
}
printf("\n");

// Printing Post Swap Values
printf("Arrays after swapping");
printf("\n");
printf("First array->");
for (int i = 0 ; i < n ; i++) {
	printf("%d ", array1[i]);
}
printf("\n");
printf("Second array->");
for (int i = 0 ; i < n ; i++) {
	printf("%d ", array2[i]);
}
printf("\n");
return 0;
}
