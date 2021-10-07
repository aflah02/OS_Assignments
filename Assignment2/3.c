#include <stdio.h>

void add(int a, int b){
    printf("Sum is %d\n", a + b);
}

void sub(int a, int b){
    printf("Difference is %d\n", a - b);
}

void div(int a, int b){
    printf("Integer Division Quotient is %d\n", a/b);
}

void mul(int a, int b){
    printf("Product is %d\n", a * b);
}

void exponential(int a, int b){
    int x = 1;
    while (b != 0){
        x = x * a;
        b--;
    }
    printf("Exponentiation Answer is %d\n", x);
}

int main()
{   void (*functions[5])(int a, int b);
    functions[0] = &add;
    functions[1] = &sub;
    functions[2] = &div;
    functions[3] = &mul;
    functions[4] = &exponential;
    int choice = -1;
    while (choice != 5){
        printf("Press 0 for Addition \nPress 1 for Subtraction \nPress 2 for Division \nPress 3 for Multiplication \nPress 4 for Exponentiation \nPress 5 to Exit: \n");
        scanf("%d", &choice);
        if (choice == 0){
            int a = -1;
            int b = -1;
            printf("Enter the first Integer \n");
            scanf("%d", &a);
            printf("Enter the second Integer \n");
            scanf("%d", &b);
            (*functions[choice])(a,b);
        }
        else if (choice == 1){
            int a = -1;
            int b = -1;
            printf("Enter the first Integer \n");
            scanf("%d", &a);
            printf("Enter the second Integer \n");
            scanf("%d", &b);
            (*functions[choice])(a,b);
        }
        else if (choice == 2){
            int a = -1;
            int b = -1;
            printf("Enter the first Integer \n");
            scanf("%d", &a);
            printf("Enter the second Integer \n");
            scanf("%d", &b);
            (*functions[choice])(a,b);
        }
        else if (choice == 3){
            int a = -1;
            int b = -1;
            printf("Enter the first Integer \n");
            scanf("%d", &a);
            printf("Enter the second Integer \n");
            scanf("%d", &b);
            (*functions[choice])(a,b);
        }
        else if (choice == 4){
            int a = -1;
            int b = -1;
            printf("Enter the first Integer \n");
            scanf("%d", &a);
            printf("Enter the second Integer \n");
            scanf("%d", &b);
            (*functions[choice])(a,b);
        }
        else if (choice == 5){
            printf("Exiting\n");
            break;
        }
        else{
            printf("Invalid Input \n");
            continue;
        }
    }
}