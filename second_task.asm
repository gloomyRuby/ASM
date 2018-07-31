%include "stud_io.inc"

global start

section .data
	TEN db 10

section .text
start:
mult: 		GETCHAR			; read char in EAX
		sub eax, '0'		; EAX = EAX - '0'
		cmp eax, 0		
		jge is_digit		; if (EAX >= 0) goto is_digit 
		jl exit			; if (EAX < 0) goto exit		
is_digit:	cmp eax, 9		
		jg exit			; if (EAX > 9) goto exit
		mov edx, eax		; EDX = EAX smth we've just read
		mov eax, ebx		; EAX = EBX move it for multiplication
		mul byte [TEN]		; EAX * 10
		mov ebx, eax		; EBX = EAX
		add ebx, edx		; EBX += EDX
		jmp mult		; if (EAX >= 0 && EAX <= 9) goto mult
		
exit: 		mov eax, ebx		; EAX = EBX
	
		PUTCHAR 10
		FINISH
