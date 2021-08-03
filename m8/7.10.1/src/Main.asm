; Write a procedure named WriteScaled that outputs a decimal ASCII number with
; an implied dec-imal point. Suppose the following number were defined as
; follows, where DECIMAL_OFFSET indicates that the decimal point must be
; inserted five positions from the right side of the number:
include <Irvine32.inc>
includelib <Irvine32.Lib>
includelib <Kernel32.Lib>
includelib <User32.Lib>

DECIMAL_OFFSET = 5
.data
   decimal_one BYTE "100123456789765"

.code
WriteScaled proc
   mov esi, offset decimal_one

   mov ecx, lengthof decimal_one
   sub ecx, DECIMAL_OFFSET
whole:
   mov al, byte ptr [esi]
   inc esi
   call WriteChar
   loop whole

   mov al, '.'
   call WriteChar
   mov ecx, DECIMAL_OFFSET
decimal:
   mov al, byte ptr [esi]
   inc esi
   call WriteChar
   loop decimal

   ret
WriteScaled endp
main:
   call WriteScaled
   xor eax, eax
   ret
end main
