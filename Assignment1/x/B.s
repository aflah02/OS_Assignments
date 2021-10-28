	.file	"B.c"
	.intel_syntax noprefix
	.text
	.globl	B
	.type	B, @function
B:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	lea	rax, -24[rbp]
	mov	edx, 8
	mov	rsi, rax
	mov	edi, 1
	call	write@PLT
	mov	DWORD PTR -12[rbp], eax
	mov	rax, QWORD PTR C@GOTPCREL[rip]
	mov	QWORD PTR -8[rbp], rax
	jmp	[QWORD PTR -8[rbp]]
	.cfi_endproc
.LFE6:
	.size	B, .-B
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
