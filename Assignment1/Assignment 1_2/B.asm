extern C
section .text
    global B
B:
    push rdi
    lea rcx, [rsp]
    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 8
    syscall
    mov long [rsp], C
	ret