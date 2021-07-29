; What will be the final value in EAX after these instructions execute?
include <Irvine32.inc>
includelib <Irvine32.Lib>

.code
main:
   push 5
   push 6
   pop eax
   pop eax
   call DumpRegs
   xor eax, eax
   ret
end main
