#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <sysexits.h>
#include "C.c"

void B(long long input){
    char *str = (char *) &input;
    int file = write(1, str, strlen(str));
    void *ptr = (void*) C;
    goto *ptr;
    // __asm__(
	// "subq	$48, %rsp\n\t"
	// "movq	%rdi, -40(%rbp)\n\t"
    // "leaq	-40(%rbp), %rax\n\t"
	// "movq	%rax, -16(%rbp)\n\t"
	// "movq	-16(%rbp), %rax\n\t"
	// "movq	%rax, %rdi\n\t"
	// "call	strlen@PLT\n\t"
	// "movq	%rax, %rdx\n\t"
	// "movq	-16(%rbp), %rax\n\t"
	// "movq	%rax, %rsi\n\t"
	// "movl	$1, %edi\n\t"
	// "call	write@PLT\n\t"
	// "movl	%eax, -20(%rbp)\n\t"
	// "leaq	C(%rip), %rax\n\t"
	// "movq	%rax, -8(%rbp)\n\t"
	// "jmp	*-8(%rbp)\n\t"
    // );
}