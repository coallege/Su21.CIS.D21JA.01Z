.386
.model flat, stdcall

.code
main:
   mov al,0D4h
   ror al,3
   nop ; a.
   mov al,0D4h
   rol al,7 
   nop ; b.

   xor eax, eax
   ret
end main
