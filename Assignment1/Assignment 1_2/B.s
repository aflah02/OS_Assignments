	.text
	.globl	B
B:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	leaq	-24(%rbp), %rax
	movl	$8, %edx
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movl	%eax, -12(%rbp)
	movq	C@GOTPCREL(%rip), %rax
	movq	%rax, -8(%rbp)
	pushq   %rax
	ret
	