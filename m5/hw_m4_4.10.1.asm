; Converting from Big Endian to Little Endian
; Write a program that uses the variables below and MOV instructions to copy the
; value from bigEndian to littleEndian, reversing the order of the bytes. The
; number’s 32-bit value is under- stood to be 12345678 hexadecimal.
include <Irvine32.inc>
includelib <Irvine32.Lib>
includelib <Kernel32.Lib>
includelib <User32.Lib>

.data
   bigEndian byte 12h, 34h, 56h, 78h

.data?
   littleEndian dword ?

.code
main:
   mov ecx, lengthof bigEndian  ; bigEndian position
   mov edx, offset littleEndian ; little endian position
top:
   mov al, byte ptr [bigEndian + ecx - 1]
   mov byte ptr [edx], al
   inc edx
   loop top

   mov eax, [littleEndian]
   call WriteHex
   exit

end main
