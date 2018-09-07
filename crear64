%macro escribe 2

	mov rax, 4
	mov rbx, 1
	mov rcx, %1
	mov rdx, %2
	int 0x80

%endmacro

segment .data

	msg2 db "ALUMNOS :",0xA
	len2 equ $-msg2

	archivo db "/home/dayana/Escritorio/archivo.txt",0

segment .bss
	texto resb 10
	idarchivo resd 1
	

segment .text

leetecla:
	mov rax, 3
	mov rbx, 0
	mov rdx, 10
	int 0x80
ret

global _start

_start:



mov rax, 8
mov rbx, archivo
mov rcx, 2
mov rdx, 7777h
int 0x80

test rax, rax
jz salir
mov qword[idarchivo], rax

escribe msg2, len2

mov rcx,texto
call leetecla

	mov rax, 4
	mov rbx, [idarchivo]
	mov rcx, texto
	mov rdx, 10
	int 0x80


salir:
 mov rax, 1
 xor rbx, rbx
 int 0x80
