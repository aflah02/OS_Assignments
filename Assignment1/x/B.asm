; Disassembly of file: B.o
; Wed Oct 27 11:42:34 2021
; Type: COFF64
; Syntax: NASM
; Instruction set: 8086, x64

default rel

global .refptr.C

extern C                                                ; byte
extern write                                            ; near

.text:  ; Local function

B:
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        sub     rsp, 48                                 ; 0004 _ 48: 83. EC, 30
        mov     dword [rbp+10H], ecx                    ; 0008 _ 89. 4D, 10
        mov     r8d, 8                                  ; 000B _ 41: B8, 00000008
        lea     rdx, [rbp+10H]                          ; 0011 _ 48: 8D. 55, 10
        mov     ecx, 1                                  ; 0015 _ B9, 00000001
        call    write                                   ; 001A _ E8, 00000000(rel)
        mov     dword [rbp-4H], eax                     ; 001F _ 89. 45, FC
        mov     rax, qword [rel .refptr.C]              ; 0022 _ 48: 8B. 05, 00000000(rel)
        mov     qword [rbp-10H], rax                    ; 0029 _ 48: 89. 45, F0
        jmp     near [rbp-10H]                          ; 002D _ FF. 65, F0

.refptr.C:                                              ; qword
        dq C                                            ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


