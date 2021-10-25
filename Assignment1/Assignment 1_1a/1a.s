	.file	"1a.c"
	.text
	.section	.rodata
.LC0:
	.string	"student_record.csv"
.LC1:
	.string	"Error in Open Operation"
.LC2:
	.string	"Error in Read Operation"
.LC3:
	.string	"\n"
.LC4:
	.string	","
.LC5:
	.string	"File is Closed"
	.text
	.globl	processData
	.type	processData, @function
processData:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	leaq	-73728(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$3928, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -77656(%rbp)
	movq	%rsi, -77664(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$0, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -77628(%rbp)
	cmpl	$-1, -77628(%rbp)
	jne	.L2
	leaq	.LC1(%rip), %rdi
	call	perror@PLT
	jmp	.L1
.L2:
	movl	$1, %esi
	movl	$9696, %edi
	call	calloc@PLT
	movq	%rax, -77608(%rbp)
	movq	-77608(%rbp), %rcx
	movl	-77628(%rbp), %eax
	movl	$9696, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	%eax, -77624(%rbp)
	cmpl	$0, -77624(%rbp)
	jns	.L4
	leaq	.LC2(%rip), %rdi
	call	perror@PLT
	jmp	.L1
.L4:
	movq	-77608(%rbp), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -77616(%rbp)
	movl	$0, -77636(%rbp)
	jmp	.L5
.L6:
	movl	-77636(%rbp), %eax
	cltq
	movq	-77616(%rbp), %rdx
	movq	%rdx, -77600(%rbp,%rax,8)
	addl	$1, -77636(%rbp)
	leaq	.LC3(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -77616(%rbp)
.L5:
	cmpq	$0, -77616(%rbp)
	jne	.L6
	movl	$0, -77632(%rbp)
	jmp	.L7
.L8:
	movl	-77632(%rbp), %eax
	addl	$1, %eax
	cltq
	movq	-77600(%rbp,%rax,8), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -77616(%rbp)
	movq	-77616(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -77620(%rbp)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -77616(%rbp)
	movl	-77632(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-77656(%rbp), %rax
	addq	%rax, %rdx
	movq	-77616(%rbp), %rax
	movq	%rax, (%rdx)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -77616(%rbp)
	movl	-77632(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-77664(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	-77616(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, (%rbx)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -77616(%rbp)
	movl	-77632(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-77664(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	-77616(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, 4(%rbx)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -77616(%rbp)
	movl	-77632(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-77664(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	-77616(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, 8(%rbx)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -77616(%rbp)
	movl	-77632(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-77664(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	-77616(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, 12(%rbx)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -77616(%rbp)
	movl	-77632(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-77664(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	-77616(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, 16(%rbx)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -77616(%rbp)
	movl	-77632(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-77664(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	-77616(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, 20(%rbx)
	addl	$1, -77632(%rbp)
.L7:
	cmpl	$25, -77632(%rbp)
	jle	.L8
	movl	-77628(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	cmpl	$-1, %eax
	jne	.L1
	leaq	.LC5(%rip), %rdi
	call	perror@PLT
	nop
.L1:
	movq	-24(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L11
	call	__stack_chk_fail@PLT
.L11:
	addq	$77656, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	processData, .-processData
	.section	.rodata
.LC6:
	.string	"Error in Writing String"
	.text
	.globl	stringPrinter
	.type	stringPrinter, @function
stringPrinter:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movq	%rax, -8(%rbp)
	cmpq	$-1, -8(%rbp)
	jne	.L12
	call	__errno_location@PLT
	movl	(%rax), %eax
	cmpl	$4, %eax
	jne	.L12
	leaq	.LC6(%rip), %rdi
	call	perror@PLT
	nop
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	stringPrinter, .-stringPrinter
	.section	.rodata
	.align 8
.LC7:
	.string	"The average marks of all students in Section %s in Assignment %d is: %lf\n"
	.text
	.globl	printforgivensection
	.type	printforgivensection, @function
printforgivensection:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	-999424(%rsp), %r11
.LPSRL1:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL1
	subq	$752, %rsp
	movq	%rdi, -1000136(%rbp)
	movq	%rsi, -1000144(%rbp)
	movq	%rdx, -1000152(%rbp)
	movq	%rcx, -1000160(%rbp)
	movq	%r8, -1000168(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -1000128(%rbp)
	movl	$0, -1000124(%rbp)
	movl	$0, -1000120(%rbp)
	movl	$0, -1000116(%rbp)
	movl	$0, -1000112(%rbp)
	movl	$0, -1000108(%rbp)
	movl	$0, -1000104(%rbp)
	movl	$0, -1000100(%rbp)
	jmp	.L15
.L17:
	movl	-1000100(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-1000144(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	-1000136(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L16
	addl	$1, -1000104(%rbp)
	movl	-1000100(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-1000152(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	addl	%eax, -1000128(%rbp)
	movl	-1000100(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-1000152(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %eax
	addl	%eax, -1000124(%rbp)
	movl	-1000100(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-1000152(%rbp), %rax
	addq	%rdx, %rax
	movl	8(%rax), %eax
	addl	%eax, -1000120(%rbp)
	movl	-1000100(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-1000152(%rbp), %rax
	addq	%rdx, %rax
	movl	12(%rax), %eax
	addl	%eax, -1000116(%rbp)
	movl	-1000100(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-1000152(%rbp), %rax
	addq	%rdx, %rax
	movl	16(%rax), %eax
	addl	%eax, -1000112(%rbp)
	movl	-1000100(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-1000152(%rbp), %rax
	addq	%rdx, %rax
	movl	20(%rax), %eax
	addl	%eax, -1000108(%rbp)
.L16:
	addl	$1, -1000100(%rbp)
.L15:
	cmpl	$25, -1000100(%rbp)
	jle	.L17
	movq	-1000168(%rbp), %rax
	movl	-1000104(%rbp), %edx
	movl	%edx, (%rax)
	movq	-1000160(%rbp), %rcx
	movq	(%rcx), %rax
	movq	8(%rcx), %rdx
	movq	%rax, -1000048(%rbp)
	movq	%rdx, -1000040(%rbp)
	movq	16(%rcx), %rax
	movq	%rax, -1000032(%rbp)
	movl	-1000128(%rbp), %eax
	movl	%eax, -1000048(%rbp)
	movl	-1000124(%rbp), %eax
	movl	%eax, -1000044(%rbp)
	movl	-1000120(%rbp), %eax
	movl	%eax, -1000040(%rbp)
	movl	-1000116(%rbp), %eax
	movl	%eax, -1000036(%rbp)
	movl	-1000112(%rbp), %eax
	movl	%eax, -1000032(%rbp)
	movl	-1000108(%rbp), %eax
	movl	%eax, -1000028(%rbp)
	movl	-1000048(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1000104(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1000096(%rbp)
	movq	-1000096(%rbp), %rcx
	movq	-1000136(%rbp), %rdx
	leaq	-1000016(%rbp), %rax
	movq	%rcx, %xmm0
	movl	$1, %r8d
	movq	%rdx, %rcx
	leaq	.LC7(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000016(%rbp), %rax
	movq	%rax, %rdi
	call	stringPrinter
	movl	-1000044(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1000104(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1000088(%rbp)
	movq	-1000088(%rbp), %rcx
	movq	-1000136(%rbp), %rdx
	leaq	-1000016(%rbp), %rax
	movq	%rcx, %xmm0
	movl	$2, %r8d
	movq	%rdx, %rcx
	leaq	.LC7(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000016(%rbp), %rax
	movq	%rax, %rdi
	call	stringPrinter
	movl	-1000040(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1000104(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1000080(%rbp)
	movq	-1000080(%rbp), %rcx
	movq	-1000136(%rbp), %rdx
	leaq	-1000016(%rbp), %rax
	movq	%rcx, %xmm0
	movl	$3, %r8d
	movq	%rdx, %rcx
	leaq	.LC7(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000016(%rbp), %rax
	movq	%rax, %rdi
	call	stringPrinter
	movl	-1000036(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1000104(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1000072(%rbp)
	movq	-1000072(%rbp), %rcx
	movq	-1000136(%rbp), %rdx
	leaq	-1000016(%rbp), %rax
	movq	%rcx, %xmm0
	movl	$4, %r8d
	movq	%rdx, %rcx
	leaq	.LC7(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000016(%rbp), %rax
	movq	%rax, %rdi
	call	stringPrinter
	movl	-1000032(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1000104(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1000064(%rbp)
	movq	-1000064(%rbp), %rcx
	movq	-1000136(%rbp), %rdx
	leaq	-1000016(%rbp), %rax
	movq	%rcx, %xmm0
	movl	$5, %r8d
	movq	%rdx, %rcx
	leaq	.LC7(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000016(%rbp), %rax
	movq	%rax, %rdi
	call	stringPrinter
	movl	-1000028(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1000104(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1000056(%rbp)
	movq	-1000056(%rbp), %rcx
	movq	-1000136(%rbp), %rdx
	leaq	-1000016(%rbp), %rax
	movq	%rcx, %xmm0
	movl	$6, %r8d
	movq	%rdx, %rcx
	leaq	.LC7(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000016(%rbp), %rax
	movq	%rax, %rdi
	call	stringPrinter
	movl	$10, %edi
	call	putchar@PLT
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L18
	call	__stack_chk_fail@PLT
.L18:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	printforgivensection, .-printforgivensection
	.section	.rodata
.LC9:
	.string	"A"
.LC10:
	.string	"B"
.LC11:
	.string	"Error in waitpid"
.LC12:
	.string	"Error in Fork"
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$960, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$1, -940(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -928(%rbp)
	movl	$0, -912(%rbp)
	movl	$0, -908(%rbp)
	movl	$0, -904(%rbp)
	movl	$0, -900(%rbp)
	movl	$0, -896(%rbp)
	movl	$0, -892(%rbp)
	movl	$0, -880(%rbp)
	movl	$0, -876(%rbp)
	movl	$0, -872(%rbp)
	movl	$0, -868(%rbp)
	movl	$0, -864(%rbp)
	movl	$0, -860(%rbp)
	movl	$0, -948(%rbp)
	movl	$0, -944(%rbp)
	call	fork@PLT
	movl	%eax, -936(%rbp)
	cmpl	$0, -936(%rbp)
	jne	.L20
	leaq	-640(%rbp), %rdx
	leaq	-848(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	processData
	leaq	.LC9(%rip), %rax
	movq	%rax, -920(%rbp)
	leaq	-948(%rbp), %rdi
	leaq	-912(%rbp), %rcx
	leaq	-640(%rbp), %rdx
	leaq	-848(%rbp), %rsi
	movq	-920(%rbp), %rax
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	printforgivensection
	movl	$0, %edi
	call	exit@PLT
.L20:
	cmpl	$0, -936(%rbp)
	jle	.L21
	leaq	-640(%rbp), %rdx
	leaq	-848(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	processData
	leaq	.LC10(%rip), %rax
	movq	%rax, -920(%rbp)
	leaq	-952(%rbp), %rcx
	movl	-936(%rbp), %eax
	movl	$0, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	waitpid@PLT
	movl	%eax, -932(%rbp)
	movl	-952(%rbp), %eax
	cmpl	$4, %eax
	jne	.L22
	leaq	.LC11(%rip), %rdi
	call	perror@PLT
	movl	$70, %eax
	jmp	.L25
.L22:
	leaq	-944(%rbp), %rdi
	leaq	-880(%rbp), %rcx
	leaq	-640(%rbp), %rdx
	leaq	-848(%rbp), %rsi
	movq	-920(%rbp), %rax
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	printforgivensection
	movl	$0, %eax
	jmp	.L25
.L21:
	leaq	.LC12(%rip), %rdi
	call	perror@PLT
	movl	$71, %eax
.L25:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L26
	call	__stack_chk_fail@PLT
.L26:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
