; Write a program that displays the same string in four different colors, using
; a loop. Call the Set-TextColor procedure from the book's link library. Any
; colors may be chosen, but you may findit easiest to change the foreground
; color.
include <Irvine32.inc>
includelib <Irvine32.lib>
includelib <Kernel32.lib>
includelib <User32.lib>

.data
   s byte "the same string", 10, 0

.code
main:
   mov edx, offset s

   mov eax, cyan
   call SetTextColor
   call WriteString

   mov eax, white
   call SetTextColor
   call WriteString

   xor eax, eax
   ret
end main
