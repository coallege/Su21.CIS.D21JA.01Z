; Write a program that displays a single character at 100 random screen
; locations, using a timingdelay of 100 milliseconds. Hint: Use the GetMaxXY
; procedure to determine the current size ofthe console window.
include <Irvine32.inc>
includelib <Irvine32.lib>
includelib <Kernel32.lib>
includelib <User32.lib>

.code
main:
   call GetMaxXY
   mov dh, 30 ; MaxXY y doesn't work

   movzx eax, dl
   call RandomRange
   mov dl, al

   movzx eax, dh
   call RandomRange
   mov dh, al

   call Gotoxy
   mov al, '0'
   call WriteChar

   mov eax, 100
   call Delay
   jmp main
end main
