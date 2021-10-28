	.file	"1b.c"
	.text
	.comm	secA,48,32
	.comm	secB,48,32
	.globl	total_count
	.bss
	.align 4
	.type	total_count, @object
	.size	total_count, 4
total_count:
	.zero	4
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
	.align 8
.LC7:
	.string	"The average marks of all students in Section A in Assignment %d is: %lf\n"
	.text
	.globl	processDatasecA
	.type	processDatasecA, @function
processDatasecA:
.LFB6:
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
	leaq	-1077248(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$664, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, -1077912(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movl	$0, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -1077856(%rbp)
	cmpl	$-1, -1077856(%rbp)
	jne	.L2
	leaq	.LC1(%rip), %rdi
	call	perror@PLT
	jmp	.L1
.L2:
	movl	$1, %esi
	movl	$9696, %edi
	call	calloc@PLT
	movq	%rax, -1077832(%rbp)
	movq	-1077832(%rbp), %rcx
	movl	-1077856(%rbp), %eax
	movl	$9696, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	%eax, -1077852(%rbp)
	cmpl	$0, -1077852(%rbp)
	jns	.L4
	leaq	.LC2(%rip), %rdi
	call	perror@PLT
	jmp	.L1
.L4:
	movq	-1077832(%rbp), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -1077840(%rbp)
	movl	$0, -1077860(%rbp)
	jmp	.L5
.L6:
	movl	-1077860(%rbp), %eax
	cltq
	movq	-1077840(%rbp), %rdx
	movq	%rdx, -1077632(%rbp,%rax,8)
	addl	$1, -1077860(%rbp)
	leaq	.LC3(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1077840(%rbp)
.L5:
	cmpq	$0, -1077840(%rbp)
	jne	.L6
	movl	-1077860(%rbp), %eax
	leal	-1(%rax), %ecx
	movq	%rsp, %rax
	movq	%rax, %rbx
	movslq	%ecx, %rax
	subq	$1, %rax
	movq	%rax, -1077824(%rbp)
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
	movl	$16, %edi
	movl	$0, %edx
	divq	%rdi
	imulq	$16, %rax, %rax
	movq	%rax, %rdx
	andq	$-4096, %rdx
	movq	%rsp, %rcx
	subq	%rdx, %rcx
	movq	%rcx, %rdx
.L7:
	cmpq	%rdx, %rsp
	je	.L8
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L7
.L8:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L9
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L9:
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -1077816(%rbp)
	movl	-1077860(%rbp), %eax
	subl	$1, %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -1077808(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, -1077936(%rbp)
	movq	$0, -1077928(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, -1077952(%rbp)
	movq	$0, -1077944(%rbp)
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
	movq	%rsp, %rcx
	subq	%rdx, %rcx
	movq	%rcx, %rdx
.L10:
	cmpq	%rdx, %rsp
	je	.L11
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L10
.L11:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L12
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L12:
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -1077800(%rbp)
	movl	$0, -1077848(%rbp)
	movl	$0, -1077696(%rbp)
	movl	$0, -1077692(%rbp)
	movl	$0, -1077688(%rbp)
	movl	$0, -1077684(%rbp)
	movl	$0, -1077680(%rbp)
	movl	$0, -1077676(%rbp)
	movl	$0, -1077864(%rbp)
	jmp	.L13
.L14:
	movl	-1077864(%rbp), %eax
	addl	$1, %eax
	cltq
	movq	-1077632(%rbp,%rax,8), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -1077840(%rbp)
	movq	-1077840(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -1077844(%rbp)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1077840(%rbp)
	movq	-1077800(%rbp), %rax
	movl	-1077864(%rbp), %edx
	movslq	%edx, %rdx
	movq	-1077840(%rbp), %rcx
	movq	%rcx, (%rax,%rdx,8)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1077840(%rbp)
	movq	-1077840(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, %ecx
	movq	-1077816(%rbp), %rsi
	movl	-1077864(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	movl	%ecx, (%rax)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1077840(%rbp)
	movq	-1077840(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, %ecx
	movq	-1077816(%rbp), %rsi
	movl	-1077864(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	addq	$4, %rax
	movl	%ecx, (%rax)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1077840(%rbp)
	movq	-1077840(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, %ecx
	movq	-1077816(%rbp), %rsi
	movl	-1077864(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	addq	$8, %rax
	movl	%ecx, (%rax)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1077840(%rbp)
	movq	-1077840(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, %ecx
	movq	-1077816(%rbp), %rsi
	movl	-1077864(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	addq	$12, %rax
	movl	%ecx, (%rax)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1077840(%rbp)
	movq	-1077840(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, %ecx
	movq	-1077816(%rbp), %rsi
	movl	-1077864(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	addq	$16, %rax
	movl	%ecx, (%rax)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1077840(%rbp)
	movq	-1077840(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, %ecx
	movq	-1077816(%rbp), %rsi
	movl	-1077864(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	addq	$20, %rax
	movl	%ecx, (%rax)
	addl	$1, -1077864(%rbp)
.L13:
	movl	-1077860(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -1077864(%rbp)
	jl	.L14
	movl	-1077856(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	cmpl	$-1, %eax
	jne	.L15
	leaq	.LC5(%rip), %rdi
	call	perror@PLT
	movq	%rbx, %rsp
	jmp	.L1
.L15:
	movl	-1077860(%rbp), %eax
	subl	$1, %eax
	movl	%eax, total_count(%rip)
	movl	$0, -1077868(%rbp)
	movl	$0, -1077872(%rbp)
	movl	$0, -1077876(%rbp)
	movl	$0, -1077880(%rbp)
	movl	$0, -1077884(%rbp)
	movl	$0, -1077888(%rbp)
	movl	$0, -1077892(%rbp)
	movl	$0, -1077896(%rbp)
	jmp	.L16
.L18:
	movq	-1077800(%rbp), %rax
	movl	-1077896(%rbp), %edx
	movslq	%edx, %rdx
	movq	(%rax,%rdx,8), %rax
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L17
	addl	$1, -1077892(%rbp)
	movq	-1077816(%rbp), %rcx
	movl	-1077896(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	addl	%eax, -1077868(%rbp)
	movq	-1077816(%rbp), %rcx
	movl	-1077896(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$4, %rax
	movl	(%rax), %eax
	addl	%eax, -1077872(%rbp)
	movq	-1077816(%rbp), %rcx
	movl	-1077896(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$8, %rax
	movl	(%rax), %eax
	addl	%eax, -1077876(%rbp)
	movq	-1077816(%rbp), %rcx
	movl	-1077896(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$12, %rax
	movl	(%rax), %eax
	addl	%eax, -1077880(%rbp)
	movq	-1077816(%rbp), %rcx
	movl	-1077896(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$16, %rax
	movl	(%rax), %eax
	addl	%eax, -1077884(%rbp)
	movq	-1077816(%rbp), %rcx
	movl	-1077896(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$20, %rax
	movl	(%rax), %eax
	addl	%eax, -1077888(%rbp)
.L17:
	addl	$1, -1077896(%rbp)
.L16:
	movl	-1077860(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -1077896(%rbp)
	jl	.L18
	movl	-1077892(%rbp), %eax
	movl	%eax, -1077848(%rbp)
	movq	-1077696(%rbp), %rax
	movq	-1077688(%rbp), %rdx
	movq	%rax, -1077664(%rbp)
	movq	%rdx, -1077656(%rbp)
	movq	-1077680(%rbp), %rax
	movq	%rax, -1077648(%rbp)
	movl	-1077868(%rbp), %eax
	movl	%eax, -1077664(%rbp)
	movl	-1077872(%rbp), %eax
	movl	%eax, -1077660(%rbp)
	movl	-1077876(%rbp), %eax
	movl	%eax, -1077656(%rbp)
	movl	-1077880(%rbp), %eax
	movl	%eax, -1077652(%rbp)
	movl	-1077884(%rbp), %eax
	movl	%eax, -1077648(%rbp)
	movl	-1077888(%rbp), %eax
	movl	%eax, -1077644(%rbp)
	cvtsi2sdl	-1077868(%rbp), %xmm0
	movsd	%xmm0, secA(%rip)
	cvtsi2sdl	-1077872(%rbp), %xmm0
	movsd	%xmm0, 8+secA(%rip)
	cvtsi2sdl	-1077876(%rbp), %xmm0
	movsd	%xmm0, 16+secA(%rip)
	cvtsi2sdl	-1077880(%rbp), %xmm0
	movsd	%xmm0, 24+secA(%rip)
	cvtsi2sdl	-1077884(%rbp), %xmm0
	movsd	%xmm0, 32+secA(%rip)
	cvtsi2sdl	-1077888(%rbp), %xmm0
	movsd	%xmm0, 40+secA(%rip)
	movl	-1077664(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1077892(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1077792(%rbp)
	movq	-1077792(%rbp), %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rdx, %xmm0
	movl	$1, %ecx
	leaq	.LC7(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movq	%rax, -1077784(%rbp)
	movl	-1077660(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1077892(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1077776(%rbp)
	movq	-1077776(%rbp), %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rdx, %xmm0
	movl	$2, %ecx
	leaq	.LC7(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movq	%rax, -1077768(%rbp)
	movl	-1077656(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1077892(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1077760(%rbp)
	movq	-1077760(%rbp), %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rdx, %xmm0
	movl	$3, %ecx
	leaq	.LC7(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movq	%rax, -1077752(%rbp)
	movl	-1077652(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1077892(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1077744(%rbp)
	movq	-1077744(%rbp), %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rdx, %xmm0
	movl	$4, %ecx
	leaq	.LC7(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movq	%rax, -1077736(%rbp)
	movl	-1077648(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1077892(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1077728(%rbp)
	movq	-1077728(%rbp), %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rdx, %xmm0
	movl	$5, %ecx
	leaq	.LC7(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movq	%rax, -1077720(%rbp)
	movl	-1077644(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1077892(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1077712(%rbp)
	movq	-1077712(%rbp), %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rdx, %xmm0
	movl	$6, %ecx
	leaq	.LC7(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movq	%rax, -1077704(%rbp)
	movl	$10, %edi
	call	putchar@PLT
	movq	%rbx, %rsp
.L1:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L20
	call	__stack_chk_fail@PLT
.L20:
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
.LFE6:
	.size	processDatasecA, .-processDatasecA
	.section	.rodata
.LC8:
	.string	"B"
	.align 8
.LC9:
	.string	"The average marks of all students in Section B in Assignment %d is: %lf\n"
	.text
	.globl	processDataSecB
	.type	processDataSecB, @function
processDataSecB:
.LFB7:
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
	leaq	-1077248(%rsp), %r11
.LPSRL1:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL1
	subq	$664, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, -1077912(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movl	$0, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -1077856(%rbp)
	cmpl	$-1, -1077856(%rbp)
	jne	.L22
	leaq	.LC1(%rip), %rdi
	call	perror@PLT
	jmp	.L21
.L22:
	movl	$1, %esi
	movl	$9696, %edi
	call	calloc@PLT
	movq	%rax, -1077832(%rbp)
	movq	-1077832(%rbp), %rcx
	movl	-1077856(%rbp), %eax
	movl	$9696, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	%eax, -1077852(%rbp)
	cmpl	$0, -1077852(%rbp)
	jns	.L24
	leaq	.LC2(%rip), %rdi
	call	perror@PLT
	jmp	.L21
.L24:
	movq	-1077832(%rbp), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -1077840(%rbp)
	movl	$0, -1077860(%rbp)
	jmp	.L25
.L26:
	movl	-1077860(%rbp), %eax
	cltq
	movq	-1077840(%rbp), %rdx
	movq	%rdx, -1077632(%rbp,%rax,8)
	addl	$1, -1077860(%rbp)
	leaq	.LC3(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1077840(%rbp)
.L25:
	cmpq	$0, -1077840(%rbp)
	jne	.L26
	movl	-1077860(%rbp), %eax
	leal	-1(%rax), %ecx
	movq	%rsp, %rax
	movq	%rax, %rbx
	movslq	%ecx, %rax
	subq	$1, %rax
	movq	%rax, -1077824(%rbp)
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
	movl	$16, %edi
	movl	$0, %edx
	divq	%rdi
	imulq	$16, %rax, %rax
	movq	%rax, %rdx
	andq	$-4096, %rdx
	movq	%rsp, %rcx
	subq	%rdx, %rcx
	movq	%rcx, %rdx
.L27:
	cmpq	%rdx, %rsp
	je	.L28
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L27
.L28:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L29
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L29:
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -1077816(%rbp)
	movl	-1077860(%rbp), %eax
	subl	$1, %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -1077808(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, -1077936(%rbp)
	movq	$0, -1077928(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, -1077952(%rbp)
	movq	$0, -1077944(%rbp)
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
	movq	%rsp, %rcx
	subq	%rdx, %rcx
	movq	%rcx, %rdx
.L30:
	cmpq	%rdx, %rsp
	je	.L31
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L30
.L31:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L32
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L32:
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -1077800(%rbp)
	movl	$0, -1077848(%rbp)
	movl	$0, -1077696(%rbp)
	movl	$0, -1077692(%rbp)
	movl	$0, -1077688(%rbp)
	movl	$0, -1077684(%rbp)
	movl	$0, -1077680(%rbp)
	movl	$0, -1077676(%rbp)
	movl	$0, -1077864(%rbp)
	jmp	.L33
.L34:
	movl	-1077864(%rbp), %eax
	addl	$1, %eax
	cltq
	movq	-1077632(%rbp,%rax,8), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -1077840(%rbp)
	movq	-1077840(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -1077844(%rbp)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1077840(%rbp)
	movq	-1077800(%rbp), %rax
	movl	-1077864(%rbp), %edx
	movslq	%edx, %rdx
	movq	-1077840(%rbp), %rcx
	movq	%rcx, (%rax,%rdx,8)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1077840(%rbp)
	movq	-1077840(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, %ecx
	movq	-1077816(%rbp), %rsi
	movl	-1077864(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	movl	%ecx, (%rax)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1077840(%rbp)
	movq	-1077840(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, %ecx
	movq	-1077816(%rbp), %rsi
	movl	-1077864(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	addq	$4, %rax
	movl	%ecx, (%rax)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1077840(%rbp)
	movq	-1077840(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, %ecx
	movq	-1077816(%rbp), %rsi
	movl	-1077864(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	addq	$8, %rax
	movl	%ecx, (%rax)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1077840(%rbp)
	movq	-1077840(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, %ecx
	movq	-1077816(%rbp), %rsi
	movl	-1077864(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	addq	$12, %rax
	movl	%ecx, (%rax)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1077840(%rbp)
	movq	-1077840(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, %ecx
	movq	-1077816(%rbp), %rsi
	movl	-1077864(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	addq	$16, %rax
	movl	%ecx, (%rax)
	leaq	.LC4(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1077840(%rbp)
	movq	-1077840(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, %ecx
	movq	-1077816(%rbp), %rsi
	movl	-1077864(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	addq	$20, %rax
	movl	%ecx, (%rax)
	addl	$1, -1077864(%rbp)
.L33:
	movl	-1077860(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -1077864(%rbp)
	jl	.L34
	movl	-1077856(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	cmpl	$-1, %eax
	jne	.L35
	leaq	.LC5(%rip), %rdi
	call	perror@PLT
	movq	%rbx, %rsp
	jmp	.L21
.L35:
	movl	$0, -1077868(%rbp)
	movl	$0, -1077872(%rbp)
	movl	$0, -1077876(%rbp)
	movl	$0, -1077880(%rbp)
	movl	$0, -1077884(%rbp)
	movl	$0, -1077888(%rbp)
	movl	$0, -1077892(%rbp)
	movl	$0, -1077896(%rbp)
	jmp	.L36
.L38:
	movq	-1077800(%rbp), %rax
	movl	-1077896(%rbp), %edx
	movslq	%edx, %rdx
	movq	(%rax,%rdx,8), %rax
	leaq	.LC8(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L37
	addl	$1, -1077892(%rbp)
	movq	-1077816(%rbp), %rcx
	movl	-1077896(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	addl	%eax, -1077868(%rbp)
	movq	-1077816(%rbp), %rcx
	movl	-1077896(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$4, %rax
	movl	(%rax), %eax
	addl	%eax, -1077872(%rbp)
	movq	-1077816(%rbp), %rcx
	movl	-1077896(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$8, %rax
	movl	(%rax), %eax
	addl	%eax, -1077876(%rbp)
	movq	-1077816(%rbp), %rcx
	movl	-1077896(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$12, %rax
	movl	(%rax), %eax
	addl	%eax, -1077880(%rbp)
	movq	-1077816(%rbp), %rcx
	movl	-1077896(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$16, %rax
	movl	(%rax), %eax
	addl	%eax, -1077884(%rbp)
	movq	-1077816(%rbp), %rcx
	movl	-1077896(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$20, %rax
	movl	(%rax), %eax
	addl	%eax, -1077888(%rbp)
.L37:
	addl	$1, -1077896(%rbp)
.L36:
	movl	-1077860(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -1077896(%rbp)
	jl	.L38
	movl	-1077860(%rbp), %eax
	subl	$1, %eax
	movl	%eax, total_count(%rip)
	movl	-1077892(%rbp), %eax
	movl	%eax, -1077848(%rbp)
	movq	-1077696(%rbp), %rax
	movq	-1077688(%rbp), %rdx
	movq	%rax, -1077664(%rbp)
	movq	%rdx, -1077656(%rbp)
	movq	-1077680(%rbp), %rax
	movq	%rax, -1077648(%rbp)
	movl	-1077868(%rbp), %eax
	movl	%eax, -1077664(%rbp)
	movl	-1077872(%rbp), %eax
	movl	%eax, -1077660(%rbp)
	movl	-1077876(%rbp), %eax
	movl	%eax, -1077656(%rbp)
	movl	-1077880(%rbp), %eax
	movl	%eax, -1077652(%rbp)
	movl	-1077884(%rbp), %eax
	movl	%eax, -1077648(%rbp)
	movl	-1077888(%rbp), %eax
	movl	%eax, -1077644(%rbp)
	cvtsi2sdl	-1077868(%rbp), %xmm0
	movsd	%xmm0, secB(%rip)
	cvtsi2sdl	-1077872(%rbp), %xmm0
	movsd	%xmm0, 8+secB(%rip)
	cvtsi2sdl	-1077876(%rbp), %xmm0
	movsd	%xmm0, 16+secB(%rip)
	cvtsi2sdl	-1077880(%rbp), %xmm0
	movsd	%xmm0, 24+secB(%rip)
	cvtsi2sdl	-1077884(%rbp), %xmm0
	movsd	%xmm0, 32+secB(%rip)
	cvtsi2sdl	-1077888(%rbp), %xmm0
	movsd	%xmm0, 40+secB(%rip)
	movl	-1077664(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1077892(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1077792(%rbp)
	movq	-1077792(%rbp), %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rdx, %xmm0
	movl	$1, %ecx
	leaq	.LC9(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movq	%rax, -1077784(%rbp)
	movl	-1077660(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1077892(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1077776(%rbp)
	movq	-1077776(%rbp), %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rdx, %xmm0
	movl	$2, %ecx
	leaq	.LC9(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movq	%rax, -1077768(%rbp)
	movl	-1077656(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1077892(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1077760(%rbp)
	movq	-1077760(%rbp), %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rdx, %xmm0
	movl	$3, %ecx
	leaq	.LC9(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movq	%rax, -1077752(%rbp)
	movl	-1077652(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1077892(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1077744(%rbp)
	movq	-1077744(%rbp), %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rdx, %xmm0
	movl	$4, %ecx
	leaq	.LC9(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movq	%rax, -1077736(%rbp)
	movl	-1077648(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1077892(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1077728(%rbp)
	movq	-1077728(%rbp), %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rdx, %xmm0
	movl	$5, %ecx
	leaq	.LC9(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movq	%rax, -1077720(%rbp)
	movl	-1077644(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	cvtsi2sdl	-1077892(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1077712(%rbp)
	movq	-1077712(%rbp), %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rdx, %xmm0
	movl	$6, %ecx
	leaq	.LC9(%rip), %rdx
	movl	$10000, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	snprintf@PLT
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-1000064(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movq	%rax, -1077704(%rbp)
	movl	$10, %edi
	call	putchar@PLT
	movq	%rbx, %rsp
.L21:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
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
.LFE7:
	.size	processDataSecB, .-processDataSecB
	.section	.rodata
	.align 8
.LC11:
	.string	"The average marks of all students in Both Sections in Assignment %d is: %lf\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
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
	subq	$640, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-1000048(%rbp), %rax
	movl	$0, %ecx
	leaq	processDatasecA(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	movl	$1, %edi
	call	sleep@PLT
	leaq	-1000040(%rbp), %rax
	movl	$0, %ecx
	leaq	processDataSecB(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	movq	-1000048(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	movq	-1000040(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	movl	$1, %edi
	call	sleep@PLT
	movl	$0, -1000052(%rbp)
	jmp	.L42
.L43:
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
	movsd	.LC10(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -1000032(%rbp)
	movl	-1000052(%rbp), %eax
	leal	1(%rax), %ecx
	movq	-1000032(%rbp), %rdx
	leaq	-1000016(%rbp), %rax
	movq	%rdx, %xmm0
	leaq	.LC11(%rip), %rdx
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
.L42:
	cmpl	$5, -1000052(%rbp)
	jle	.L43
	movl	$0, %edi
	call	pthread_exit@PLT
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC10:
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
