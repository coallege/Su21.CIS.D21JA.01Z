; Chapter 8, Exercise 2: Chess Board

Comment !
Write a program that draws an 8 X 8 chess board, with alternating gray 
and white squares. You can use the SetTextColor and Gotoxy procedures 
from the Irvine32 library. Avoid the use of global variables, and use 
declared parameters in all procedures. Use short procedures that are 
focused on a single task.
!

INCLUDE Irvine32.inc

SetColor PROTO forecolor:BYTE, backcolor:BYTE
WriteColorChar PROTO char:BYTE,forecolor:BYTE, backcolor:BYTE
PrintRowOdd PROTO color:BYTE
PrintRowEven PROTO color:BYTE

.data
rows = 8
columns = 8
horizCharsPerSquare = 2

.code
main PROC
	call Crlf

	; Display the board 
	mov ecx,rows / horizCharsPerSquare

L1: INVOKE PrintRowOdd, gray
	call Crlf
	INVOKE PrintRowEven, gray
	call Crlf
	loop L1
		
	INVOKE SetColor, lightGray, black
	call Crlf

	exit
main ENDP

	
; Print a single row
PrintRowOdd PROC uses ecx,
	color:BYTE

	mov ecx,columns / 2

L1: INVOKE WriteColorChar, ' ', color,color
	INVOKE WriteColorChar, ' ', color,color
	INVOKE WriteColorChar, ' ', white, white
	INVOKE WriteColorChar, ' ', white, white
	
	loop L1

	ret
PrintRowOdd ENDP

; Print a single row
PrintRowEven PROC uses ecx,
	color:BYTE

	mov ecx,columns / horizCharsPerSquare

L1: INVOKE WriteColorChar, ' ', white, white
	INVOKE WriteColorChar, ' ', white, white
	INVOKE WriteColorChar, ' ', color, color
	INVOKE WriteColorChar, ' ', color, color	
	loop L1

	ret
PrintRowEven ENDP

SetColor PROC, forecolor:BYTE, backcolor:BYTE

	movzx  eax,backcolor
	shl    eax,4
	add    al,forecolor
	call	  SetTextColor

	ret
SetColor ENDP

WriteColorChar PROC USES eax, 
	char:BYTE,forecolor:BYTE, backcolor:BYTE,

	INVOKE SetColor, forecolor, backcolor
	mov  al,char
	call WriteChar

	ret
WriteColorChar ENDP


END main