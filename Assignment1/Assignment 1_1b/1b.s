	.file	"1b.c"
	.text
	.comm	section,8,8
	.comm	secA,48,32
	.comm	secB,48,32
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
.LC6:
	.string	"A"
.LC7:
	.string	"B"
	.align 8
.LC8:
	.string	"The average marks of all students in Section %s in Assignment %d is: %lf\n"
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
	leaq	-1077248(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$1424, %rsp
	movq	%rdi, -1078664(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -1078608(%rbp)
	movl	$0, -1078480(%rbp)
	movl	$0, -1078476(%rbp)
	movl	$0, -1078472(%rbp)
	movl	$0, -1078468(%rbp)
	movl	$0, -1078464(%rbp)
	movl	$0, -1078460(%rbp)
	movl	$0, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -1078604(%rbp)
	cmpl	$-1, -1078604(%rbp)
	jne	.L2
	leaq	.LC1(%rip), %rdi
	call	perror@PLT
	jmp	.L1
.L2:
	movl	$1, %esi
	movl	$9696, %edi
	call	calloc@PLT
	movq	%rax, -1078584(%rbp)
	movq	-1078584(%rbp), %rcx
	movl	-1078604(%rbp), %eax
	movl	$9696, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	%eax, -1078600(%rbp)
	cmpl	$0, -1078600(%rbp)
	jns	.L4
	leaq	.LC2(%rip), %rdi
	call	perror@PLT
	jmp	.L1
.L4:
	movq	-1078584(%rbp), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -1078592(%rbp)
	movl	$0, -1078624(%rbp)
	jmp	.L5
.L6:
	movl	-1078624(%rbp), %eax
	cltq
	movq	-1078592(%rbp), %rdx
	movq	%rdx, -1077584(%rbp,%rax,8)
	addl	$1, -1078624(%rbp)
	leaq	.LC3(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1078592(%rbp)
.L5:
	cmpq	$0, -1078592(%rbp)
	jne	.L6
	movl	$0, -1078628(%rbp)
	jmp	.L7
.L8:
	movl	-1078628(%rbp), %eax
	addl	$1, %eax
	cltq
	movq	-1077584(%rbp,%rax,8), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -1078592(%rbp)
	movq	-1078592(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -1078596(%rbp)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1078592(%rbp)
	movl	-1078628(%rbp), %eax
	cltq
	movq	-1078592(%rbp), %rdx
	movq	%rdx, -1078416(%rbp,%rax,8)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1078592(%rbp)
	movq	-1078592(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, %ecx
	movl	-1078628(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rbp, %rax
	subq	$1078208, %rax
	movl	%ecx, (%rax)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1078592(%rbp)
	movq	-1078592(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, %ecx
	movl	-1078628(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rbp, %rax
	subq	$1078204, %rax
	movl	%ecx, (%rax)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1078592(%rbp)
	movq	-1078592(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, %ecx
	movl	-1078628(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rbp, %rax
	subq	$1078200, %rax
	movl	%ecx, (%rax)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1078592(%rbp)
	movq	-1078592(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, %ecx
	movl	-1078628(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rbp, %rax
	subq	$1078196, %rax
	movl	%ecx, (%rax)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1078592(%rbp)
	movq	-1078592(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, %ecx
	movl	-1078628(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rbp, %rax
	subq	$1078192, %rax
	movl	%ecx, (%rax)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1078592(%rbp)
	movq	-1078592(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, %ecx
	movl	-1078628(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rbp, %rax
	subq	$1078188, %rax
	movl	%ecx, (%rax)
	addl	$1, -1078628(%rbp)
.L7:
	cmpl	$25, -1078628(%rbp)
	jle	.L8
	movl	-1078604(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	cmpl	$-1, %eax
	jne	.L9
	leaq	.LC5(%rip), %rdi
	call	perror@PLT
	jmp	.L1
.L9:
	movl	$0, -1078632(%rbp)
	movl	$0, -1078636(%rbp)
	movl	$0, -1078640(%rbp)
	movl	$0, -1078648(%rbp)
	movl	$0, -1078644(%rbp)
	movl	$0, -1078620(%rbp)
	movl	$0, -1078616(%rbp)
	movl	$0, -1078612(%rbp)
	jmp	.L10
.L12:
	movq	section(%rip), %rdx
	movl	-1078612(%rbp), %eax
	cltq
	movq	-1078416(%rbp,%rax,8), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L11
	addl	$1, -1078616(%rbp)
	movl	-1078612(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rbp, %rax
	subq	$1078208, %rax
	movl	(%rax), %eax
	addl	%eax, -1078632(%rbp)
	movl	-1078612(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rbp, %rax
	subq	$1078204, %rax
	movl	(%rax), %eax
	addl	%eax, -1078636(%rbp)
	movl	-1078612(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rbp, %rax
	subq	$1078200, %rax
	movl	(%rax), %eax
	addl	%eax, -1078640(%rbp)
	movl	-1078612(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rbp, %rax
	subq	$1078196, %rax
	movl	(%rax), %eax
	addl	%eax, -1078648(%rbp)
	movl	-1078612(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rbp, %rax
	subq	$1078192, %rax
	movl	(%rax), %eax
	addl	%eax, -1078644(%rbp)
	movl	-1078612(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rbp, %rax
	subq	$1078188, %rax
	movl	(%rax), %eax
	addl	%eax, -1078620(%rbp)
.L11:
	addl	$1, -1078612(%rbp)
.L10:
	cmpl	$25, -1078612(%rbp)
	jle	.L12
	movl	-1078616(%rbp), %eax
	movl	%eax, -1078608(%rbp)
	movq	-1078480(%rbp), %rax
	movq	-1078472(%rbp), %rdx
	movq	%rax, -1078448(%rbp)
	movq	%rdx, -1078440(%rbp)
	movq	-1078464(%rbp), %rax
	movq	%rax, -1078432(%rbp)
	movl	-1078632(%rbp), %eax
	movl	%eax, -1078448(%rbp)
	movl	-1078636(%rbp), %eax
	movl	%eax, -1078444(%rbp)
	movl	-1078640(%rbp), %eax
	movl	%eax, -1078440(%rbp)
	movl	-1078648(%rbp), %eax
	movl	%eax, -1078436(%rbp)
	movl	-1078644(%rbp), %eax
	movl	%eax, -1078432(%rbp)
	movl	-1078620(%rbp), %eax
	movl	%eax, -1078428(%rbp)
	movq	section(%rip), %rax
	leaq	.LC6(%rip), %rdx
	cmpq	%rdx, %rax
	jne	.L13
	cvtsi2sdl	-1078632(%rbp), %xmm0
	movsd	%xmm0, secA(%rip)
	cvtsi2sdl	-1078636(%rbp), %xmm0
	movsd	%xmm0, 8+secA(%rip)
	cvtsi2sdl	-1078640(%rbp), %xmm0
	movsd	%xmm0, 16+secA(%rip)
	cvtsi2sdl	-1078648(%rbp), %xmm0
	movsd	%xmm0, 24+secA(%rip)
	cvtsi2sdl	-1078644(%rbp), %xmm0
	movsd	%xmm0, 32+secA(%rip)
	cvtsi2sdl	-1078620(%rbp), %xmm0
	movsd	%xmm0, 40+secA(%rip)
.L13:
	movq	section(%rip), %rax
	leaq	.LC7(%rip), %rdx
	cmpq	%rdx, %rax
	jne	.L14
	cvtsi2sdl	-1078632(%rbp), %xmm0
	movsd	%xmm0, secB(%rip)
	cvtsi2sdl	-1078636(%rbp), %xmm0
	movsd	%xmm0, 8+secB(%rip)
	cvtsi2sdl	-1078640(%rbp), %xmm0
	movsd	%xmm0, 16+secB(%rip)
	cvtsi2sdl	-1078648(%rbp), %xmm0
	movsd	%xmm0, 24+secB(%rip)
	cvtsi2sdl	-1078644(%rbp), %xmm0
	movsd	%xmm0, 32+secB(%rip)
	cvtsi2sdl	-1078620(%rbp), %xmm0
	movsd	%xmm0, 40+secB(%rip)
.L14:
	movl	-1078448(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1078616(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1078576(%rbp)
	movq	section(%rip), %rdx
	movq	-1078576(%rbp), %rcx
	leaq	-1000016(%rbp), %rax
	movq	%rcx, %xmm0
	movl	$1, %r8d
	movq	%rdx, %rcx
	leaq	.LC8(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000016(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-1000016(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movq	%rax, -1078568(%rbp)
	movl	-1078444(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1078616(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1078560(%rbp)
	movq	section(%rip), %rdx
	movq	-1078560(%rbp), %rcx
	leaq	-1000016(%rbp), %rax
	movq	%rcx, %xmm0
	movl	$2, %r8d
	movq	%rdx, %rcx
	leaq	.LC8(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000016(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-1000016(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movq	%rax, -1078552(%rbp)
	movl	-1078440(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1078616(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1078544(%rbp)
	movq	section(%rip), %rdx
	movq	-1078544(%rbp), %rcx
	leaq	-1000016(%rbp), %rax
	movq	%rcx, %xmm0
	movl	$3, %r8d
	movq	%rdx, %rcx
	leaq	.LC8(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000016(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-1000016(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movq	%rax, -1078536(%rbp)
	movl	-1078436(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1078616(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1078528(%rbp)
	movq	section(%rip), %rdx
	movq	-1078528(%rbp), %rcx
	leaq	-1000016(%rbp), %rax
	movq	%rcx, %xmm0
	movl	$4, %r8d
	movq	%rdx, %rcx
	leaq	.LC8(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000016(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-1000016(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movq	%rax, -1078520(%rbp)
	movl	-1078432(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1078616(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1078512(%rbp)
	movq	section(%rip), %rdx
	movq	-1078512(%rbp), %rcx
	leaq	-1000016(%rbp), %rax
	movq	%rcx, %xmm0
	movl	$5, %r8d
	movq	%rdx, %rcx
	leaq	.LC8(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000016(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-1000016(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movq	%rax, -1078504(%rbp)
	movl	-1078428(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1078616(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1078496(%rbp)
	movq	section(%rip), %rdx
	movq	-1078496(%rbp), %rcx
	leaq	-1000016(%rbp), %rax
	movq	%rcx, %xmm0
	movl	$6, %r8d
	movq	%rdx, %rcx
	leaq	.LC8(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000016(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-1000016(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movq	%rax, -1078488(%rbp)
	movl	$10, %edi
	call	putchar@PLT
.L1:
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	processData, .-processData
	.section	.rodata
	.align 8
.LC10:
	.string	"The average marks of all students in Both Sections in Assignment %d is: %lf\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
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
	subq	$640, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC6(%rip), %rax
	movq	%rax, section(%rip)
	leaq	-1000048(%rbp), %rax
	movl	$0, %ecx
	leaq	processData(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	movq	-1000048(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	leaq	.LC7(%rip), %rax
	movq	%rax, section(%rip)
	leaq	-1000040(%rbp), %rax
	movl	$0, %ecx
	leaq	processData(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	movq	-1000040(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	movl	$0, -1000052(%rbp)
	jmp	.L18
.L19:
	movl	-1000052(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	secA(%rip), %rax
	movsd	(%rdx,%rax), %xmm1
	movl	-1000052(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	secB(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	.LC9(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1000032(%rbp)
	movl	-1000052(%rbp), %eax
	leal	1(%rax), %ecx
	movq	-1000032(%rbp), %rdx
	leaq	-1000016(%rbp), %rax
	movq	%rdx, %xmm0
	leaq	.LC10(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000016(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-1000016(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movq	%rax, -1000024(%rbp)
	addl	$1, -1000052(%rbp)
.L18:
	cmpl	$5, -1000052(%rbp)
	jle	.L19
	movl	$0, %edi
	call	pthread_exit@PLT
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC9:
	.long	0
	.long	1077542912
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
