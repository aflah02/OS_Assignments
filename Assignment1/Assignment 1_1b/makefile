default:
	@gcc -E 1b.c -o 1b.i
	@gcc -S 1b.i -o 1b.s
	@gcc -c 1b.s -o 1b.o
	@gcc 1b.o -pthread -o 1b
	@./1b