all:
	@nasm -f elf64 B.asm
	@gcc A.c B.o C.c -o out -no-pie
	@./out