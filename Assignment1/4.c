#include <stdio.h>
#include <stdlib.h>

int main()
{

int n;
printf("Enter Length of String: ");
scanf("%d", &n);

char string[n];
int c = 0;

printf("Enter the String: ");
scanf("%s", string);

while (string[c] != '\0')
    c++;

for (int i = 0; i < c/2; i++){
    char temp = string[i];
    string[i] = string[c-i-1];
    string[c-i-1] = temp;
}

printf("\nReversed String: %s", string);
return 0;

}
