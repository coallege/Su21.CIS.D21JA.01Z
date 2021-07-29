include <Irvine32.inc>
includelib <Irvine32.lib>
includelib <Kernel32.lib>
includelib <User32.lib>

.code
main:
   mov  al,00001111b
   test al,00000010
   call DumpRegs
   nop  ; a. CF=   ZF=   SF
   mov  al,00000110b
   cmp  al,00000101b
   call DumpRegs
   nop  ; b. CF=   ZF=   SF
   mov  al,00000101b
   cmp  al,00000111b
   call DumpRegs
   nop  ; c. CF=   ZF=   SF
   xor eax, eax
   ret
end main
