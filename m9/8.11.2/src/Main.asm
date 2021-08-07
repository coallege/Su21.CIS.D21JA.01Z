include <Irvine32.inc>
includelib <Irvine32.Lib>
includelib <Kernel32.Lib>
includelib <User32.Lib>

.code
$black:
   xor eax, eax
   call SetTextColor
   mov al, ' '
   call WriteChar
   call WriteChar
   ret
$white:
   mov eax, white * 16
   call SetTextColor
   mov al, ' '
   call WriteChar
   call WriteChar
   ret
$tile:
   xor bl, 1
   jz $black
   jmp $white
$newline:
   mov al, 10
   call WriteChar
   ret
$row:
   push ecx
   mov ecx, 8
$calltile:
   call $tile
   loop $calltile
   xor bl, 1
   call $newline
   pop ecx
   ret
main:
   xor bl, bl
   mov ecx, 8
$callrow:
   call $row
   loop $callrow
   xor eax, eax
   ret
end main
