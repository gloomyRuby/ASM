%include "stud_io.inc"

global start

section .bss
	decimal resb 30

section .data
	TEN db 10

section .text
start:
	mov eax, 123			  
	xor ecx, ecx       		  ; ECX = 0
divis:  div byte [TEN]			  ; divide EAX by 10
	add dl, '0'
	mov [decimal + ecx], dl		  ; put remainder in decimal
	inc ecx				  ; ECX++
	cmp eax, 0			  ; if (EAX == 0)
	je exit				  ; goto exit
	jmp divis			  ; else goto divis
exit:	dec ecx				  ; ECX--
print_array:
	PUTCHAR [decimal + ecx] 	  ; print decimal[ECX]
	loop print_array		  ; ECX--
					  ; if ECX != 0 goto print_array
	PUTCHAR 10
	FINISH	
