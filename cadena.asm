%macro escribe 2
	mov rax, 4
	mov rbx, 1
	mov rcx, %1
	mov rdx, %2
	int 0x80
%endmacro

segment .data 
	msg1 db  0xA,0x9,"Escriba una letra y presione enter",0xA
	lon1 equ $- msg1

	

	msg3 db  0xA,0x9,"Las letras en orden son: "
	lon3 equ $- msg3
	

	
	
	;msg5 db  0xA,0x9,"copiando cad1 a cad2",0xA
	;lon5 equ $- msg5

	espacio db  0xA
	lespacio equ $- espacio

	arre db 0, 0,0,0,0
	lona equ $- arre



segment .bss
	res resb 2
	

segment .text
	
	global _start  
_start: 

	escribe msg1,lon1 


	mov rsi, arre
	mov rdi , 0
lee:
	mov rax, 3
	mov rbx, 0 
	mov rcx, res
	mov rdx, 2
	int 0x80 
	
	mov al, [res]
	sub al, '0'

	mov [rsi], al

	add rsi, 1
	add rdi, 1
	cmp rdi, lona
	jb lee	
	
	mov rdx, 0
	
ciclo_volver_a_ordenar:
	mov rcx, 0
;lp:
ciclo:
	mov al, [arre+rcx] 
	mov bl, [arre+(rcx+1)] 
	cmp al, bl
	jb contador

	mov [arre+rcx], bl	
	mov [arre+(rcx+1)], al 

;reg:
contador:
	inc rcx
	cmp rcx, lona
	jb ciclo
	
	inc rdx
	cmp rdx, lona
	jb ciclo_volver_a_ordenar



	mov rcx, 0
	
cambiar_a_caracter:
	mov al, [arre+rcx]
	add al, '0'
	mov [arre+rcx], al
	inc rcx
	cmp rcx, lona
	jb cambiar_a_caracter


imprimir:
	escribe msg3,lon3

	;escribe msg2,lon2

	escribe arre,lona

	
salir:
	mov rax, 1  
	xor rbx, rbx 
	int 0x80
