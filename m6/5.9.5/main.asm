include <Irvine32.inc>
includelib <Irvine32.lib>
includelib <Kernel32.lib>
includelib <User32.lib>

.code
BetterRandomRange:
   sub eax, ebx
   call Randomize
   call RandomRange
   add eax, ebx
   ret
main:
   mov ebx, -300
   mov eax, 100
   call BetterRandomRange
   xor eax, eax
   ret
end main
