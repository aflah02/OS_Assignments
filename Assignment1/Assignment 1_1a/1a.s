	.file	"1a.c"
	.text
	.comm	rows,4,4
	.section	.rodata
.LC0:
	.string	"student_record.csv"
.LC1:
	.string	"Error in Open Operation"
.LC2:
	.string	"Error in Read Operation"
.LC3:
	.string	"\n"
	.text
	.globl	countRows
	.type	countRows, @function
countRows:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	-73728(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$3888, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -77608(%rbp)
	cmpl	$-1, -77608(%rbp)
	jne	.L2
	leaq	.LC1(%rip), %rdi
	call	perror@PLT
	movl	$0, %eax
	jmp	.L7
.L2:
	movl	$1, %esi
	movl	$9696, %edi
	call	calloc@PLT
	movq	%rax, -77592(%rbp)
	movq	-77592(%rbp), %rcx
	movl	-77608(%rbp), %eax
	movl	$9696, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	%eax, -77604(%rbp)
	cmpl	$0, -77604(%rbp)
	jns	.L4
	leaq	.LC2(%rip), %rdi
	call	perror@PLT
	movl	$0, %eax
	jmp	.L7
.L4:
	movq	-77592(%rbp), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -77600(%rbp)
	movl	$0, -77612(%rbp)
	jmp	.L5
.L6:
	addl	$1, -77612(%rbp)
	leaq	.LC3(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -77600(%rbp)
.L5:
	cmpq	$0, -77600(%rbp)
	jne	.L6
	movl	-77612(%rbp), %eax
	movl	%eax, rows(%rip)
	movl	-77612(%rbp), %eax
.L7:
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L8
	call	__stack_chk_fail@PLT
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	countRows, .-countRows
	.section	.rodata
.LC4:
	.string	","
.LC5:
	.string	"File is Closed"
	.text
	.globl	processData
	.type	processData, @function
processData:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	leaq	-73728(%rsp), %r11
.LPSRL1:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL1
	subq	$3944, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -77656(%rbp)
	movq	%rsi, -77664(%rbp)
	movl	%edx, -77668(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$0, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -77628(%rbp)
	cmpl	$-1, -77628(%rbp)
	jne	.L10
	leaq	.LC1(%rip), %rdi
	call	perror@PLT
	jmp	.L9
.L10:
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
	jns	.L12
	leaq	.LC2(%rip), %rdi
	call	perror@PLT
	jmp	.L9
.L12:
	movq	-77608(%rbp), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -77616(%rbp)
	movl	$0, -77636(%rbp)
	jmp	.L13
.L14:
	movl	-77636(%rbp), %eax
	cltq
	movq	-77616(%rbp), %rdx
	movq	%rdx, -77600(%rbp,%rax,8)
	addl	$1, -77636(%rbp)
	leaq	.LC3(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -77616(%rbp)
.L13:
	cmpq	$0, -77616(%rbp)
	jne	.L14
	movl	$0, -77632(%rbp)
	jmp	.L15
.L16:
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
.L15:
	movl	-77632(%rbp), %eax
	cmpl	-77668(%rbp), %eax
	jl	.L16
	movl	-77628(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	cmpl	$-1, %eax
	jne	.L9
	leaq	.LC5(%rip), %rdi
	call	perror@PLT
	nop
.L9:
	movq	-24(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L19
	call	__stack_chk_fail@PLT
.L19:
	addq	$77672, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	processData, .-processData
	.section	.rodata
.LC6:
	.string	"Error in Writing String"
	.text
	.globl	stringPrinter
	.type	stringPrinter, @function
stringPrinter:
.LFB8:
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
	jne	.L20
	call	__errno_location@PLT
	movl	(%rax), %eax
	cmpl	$4, %eax
	jne	.L20
	leaq	.LC6(%rip), %rdi
	call	perror@PLT
	nop
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	stringPrinter, .-stringPrinter
	.section	.rodata
	.align 8
.LC7:
	.string	"The average marks of all students in Section %s in Assignment %d is: %lf\n"
	.text
	.globl	printforgivensection
	.type	printforgivensection, @function
printforgivensection:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	-999424(%rsp), %r11
.LPSRL2:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL2
	subq	$752, %rsp
	movq	%rdi, -1000136(%rbp)
	movq	%rsi, -1000144(%rbp)
	movq	%rdx, -1000152(%rbp)
	movq	%rcx, -1000160(%rbp)
	movq	%r8, -1000168(%rbp)
	movl	%r9d, -1000172(%rbp)
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
	jmp	.L23
.L25:
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
	jne	.L24
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
.L24:
	addl	$1, -1000100(%rbp)
.L23:
	movl	-1000100(%rbp), %eax
	cmpl	-1000172(%rbp), %eax
	jl	.L25
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
	je	.L26
	call	__stack_chk_fail@PLT
.L26:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
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
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$184, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	movl	$0, %eax
	call	countRows
	movl	%eax, -176(%rbp)
	movl	rows(%rip), %eax
	leal	-1(%rax), %ecx
	movslq	%ecx, %rax
	subq	$1, %rax
	movq	%rax, -160(%rbp)
	movslq	%ecx, %rax
	movq	%rax, %r14
	movl	$0, %r15d
	imulq	$192, %r15, %rdx
	imulq	$0, %r14, %rax
	leaq	(%rdx,%rax), %rsi
	movl	$192, %eax
	mulq	%r14
	addq	%rdx, %rsi
	movq	%rsi, %rdx
	movslq	%ecx, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movslq	%ecx, %rax
	movq	%rax, %r12
	movl	$0, %r13d
	imulq	$192, %r13, %rdx
	imulq	$0, %r12, %rax
	leaq	(%rdx,%rax), %rsi
	movl	$192, %eax
	mulq	%r12
	addq	%rdx, %rsi
	movq	%rsi, %rdx
	movslq	%ecx, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	movq	%rax, %rdx
	andq	$-4096, %rdx
	movq	%rsp, %rdi
	subq	%rdx, %rdi
	movq	%rdi, %rdx
.L28:
	cmpq	%rdx, %rsp
	je	.L29
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L28
.L29:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L30
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L30:
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -152(%rbp)
	movl	rows(%rip), %eax
	subl	$1, %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -144(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, -208(%rbp)
	movq	$0, -200(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, -224(%rbp)
	movq	$0, -216(%rbp)
	cltq
	leaq	0(,%rax,8), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ecx
	movl	$0, %edx
	divq	%rcx
	imulq	$16, %rax, %rax
	movq	%rax, %rdx
	andq	$-4096, %rdx
	movq	%rsp, %rdi
	subq	%rdx, %rdi
	movq	%rdi, %rdx
.L31:
	cmpq	%rdx, %rsp
	je	.L32
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L31
.L32:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L33
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L33:
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -136(%rbp)
	movl	$1, -172(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -128(%rbp)
	movl	$0, -112(%rbp)
	movl	$0, -108(%rbp)
	movl	$0, -104(%rbp)
	movl	$0, -100(%rbp)
	movl	$0, -96(%rbp)
	movl	$0, -92(%rbp)
	movl	$0, -80(%rbp)
	movl	$0, -76(%rbp)
	movl	$0, -72(%rbp)
	movl	$0, -68(%rbp)
	movl	$0, -64(%rbp)
	movl	$0, -60(%rbp)
	movl	$0, -184(%rbp)
	movl	$0, -180(%rbp)
	call	fork@PLT
	movl	%eax, -168(%rbp)
	cmpl	$0, -168(%rbp)
	jne	.L34
	movl	rows(%rip), %eax
	leal	-1(%rax), %edx
	movq	-152(%rbp), %rcx
	movq	-136(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	processData
	leaq	.LC9(%rip), %rax
	movq	%rax, -120(%rbp)
	movl	rows(%rip), %eax
	leal	-1(%rax), %r8d
	leaq	-184(%rbp), %rdi
	leaq	-112(%rbp), %rcx
	movq	-152(%rbp), %rdx
	movq	-136(%rbp), %rsi
	movq	-120(%rbp), %rax
	movl	%r8d, %r9d
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	printforgivensection
	movl	$0, %edi
	call	exit@PLT
.L34:
	cmpl	$0, -168(%rbp)
	jle	.L35
	movl	rows(%rip), %eax
	leal	-1(%rax), %edx
	movq	-152(%rbp), %rcx
	movq	-136(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	processData
	leaq	.LC10(%rip), %rax
	movq	%rax, -120(%rbp)
	leaq	-188(%rbp), %rcx
	movl	-168(%rbp), %eax
	movl	$0, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	waitpid@PLT
	movl	%eax, -164(%rbp)
	movl	-188(%rbp), %eax
	cmpl	$4, %eax
	jne	.L36
	leaq	.LC11(%rip), %rdi
	call	perror@PLT
	movl	$70, %eax
	jmp	.L37
.L36:
	movl	rows(%rip), %eax
	leal	-1(%rax), %r8d
	leaq	-180(%rbp), %rdi
	leaq	-80(%rbp), %rcx
	movq	-152(%rbp), %rdx
	movq	-136(%rbp), %rsi
	movq	-120(%rbp), %rax
	movl	%r8d, %r9d
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	printforgivensection
	movl	$0, %eax
	jmp	.L37
.L35:
	leaq	.LC12(%rip), %rdi
	call	perror@PLT
	movl	$71, %eax
.L37:
	movq	%rbx, %rsp
	movq	-56(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L40
	call	__stack_chk_fail@PLT
.L40:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
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
