%include "stud_io.inc"

global start

section .data
	TEN db 10

section .text
start:
mult: 	GETCHAR			; read char in EAX
	mov dx, ax		; DL = AL smth we've just read
	mov ax, bx		; AX = BX move it for multiplication
	mul byte [TEN]		; AL * 10 = AX
	mov bx, ax		; BX = AX
	add bx, dx		; BX += DL
 	cmp eax, 0xffffffff	; if (EAX == -1)
	je exit			; goto exit
	jmp mult		; else goto mult
		
exit: 	mov eax, ebx		; EAX = EBX

	PUTCHAR 10
	FINISH
