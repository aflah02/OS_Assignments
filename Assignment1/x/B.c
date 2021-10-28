#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>

extern void C();
void B(long input){
    int file = write(1, &input, 8);
    void *ptr = (void*) C;
    goto *ptr;
}