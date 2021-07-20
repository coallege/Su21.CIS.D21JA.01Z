include <Irvine32.inc>
includelib <Irvine32.Lib>
includelib <Kernel32.Lib>
includelib <User32.Lib>

.data
   myBytes  BYTE 10h,20h,30h,40h
   myWords  WORD 3 DUP(?),2000h
   myString BYTE "ABCDE"

.code
main:
   mov al, 'a'
   call WriteChar
   mov al, ' '
   call WriteChar
   mov eax, TYPE myBytes ; a.
   call WriteHex
   mov al, 10
   call WriteChar

   mov al, 'b'
   call WriteChar
   mov al, ' '
   call WriteChar
   mov eax, LENGTHOF myBytes ; b.
   call WriteHex
   mov al, 10
   call WriteChar

   mov al, 'c'
   call WriteChar
   mov al, ' '
   call WriteChar
   mov eax, SIZEOF myBytes ; c.
   call WriteHex
   mov al, 10
   call WriteChar

   mov al, 'd'
   call WriteChar
   mov al, ' '
   call WriteChar
   mov eax, TYPE myWords ; d.
   call WriteHex
   mov al, 10
   call WriteChar

   mov al, 'e'
   call WriteChar
   mov al, ' '
   call WriteChar
   mov eax, LENGTHOF myWords ; e.
   call WriteHex
   mov al, 10
   call WriteChar

   mov al, 'f'
   call WriteChar
   mov al, ' '
   call WriteChar
   mov eax, SIZEOF myWords ; f.
   call WriteHex
   mov al, 10
   call WriteChar

   mov al, 'g'
   call WriteChar
   mov al, ' '
   call WriteChar
   mov eax, SIZEOF myString ; g.
   call WriteHex
   mov al, 10
   call WriteChar

   exit

end main
